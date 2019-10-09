# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json
import logging
import re
import functools
#import os
#import pwd

from django.http import HttpResponse, HttpResponseRedirect
from django.http.response import JsonResponse
from django.shortcuts import render
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_POST, require_GET
from rest_framework import status
from rest_framework.exceptions import ParseError
from rest_framework.parsers import JSONParser

from designapp1 import statements
from . import hash
from .forms import *
from .serializers import *
from .studentdb_functions import *
from . import schemaCheck
from . import schemas as schemaWriter
from .settings import *
from .log_functions import *
from . import mail

# DESIGN PROJECT

logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s %(levelname)s %(message)s',
    )

# AUTHENTICATION CHECKERS

def authenticated(func):
    @functools.wraps(func)
    def wrapper(request, *args, **kwargs):
        if not check_role(request, student):
            return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)
        return func(request, *args, **kwargs)
    return wrapper

def auth_redirect(func):
    @functools.wraps(func)
    def wrapper(request, *args, **kwargs):
        if not check_role(request, student):
            return HttpResponseRedirect("/login")
        return func(request, *args, **kwargs)
    return wrapper

def require_role(role):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(request, *args, **kwargs):
            if not check_role(request, student):
                return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)
            elif not check_role(request, role):
                return HttpResponse(status=status.HTTP_403_FORBIDDEN)
            return func(request, *args, **kwargs)
        return wrapper
    return decorator

def require_role_redirect(role):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(request, *args, **kwargs):
            if not check_role(request, student):
                return HttpResponseRedirect("/login")
            elif not check_role(request, role):
                return HttpResponse("You are not authorised", status=status.HTTP_403_FORBIDDEN)
            return func(request, *args, **kwargs)
        return wrapper
    return decorator

def check_role(request, role):
    try:
        if (int(request.session["role"]) <= role):
            return True
    except Exception:
        pass
    return False


# REST RESPONSES

def defaultresponse(request):
    template = loader.get_template('defaultresponse.html')
    number = 3
    context = {
        'number': number,
        'range': range(number)
    }
    log_message(log_default,' default page has been requested')
    return HttpResponse(template.render(context, request))

@authenticated
def get_base_response(request, db_parameters):
    if check_role(request, teacher) or db_parameters["dbname"] == "courses":
        try:
            database = db_parameters["db"].objects.all()
            serializer_class = db_parameters["serializer"](database, many=True)
        except db_parameters["db"].DoesNotExist as e:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            log_message_with_db(request.session['user'],db_parameters["dbname"],log_get_base," has requested all rows from this db") #LOG THIS ACTION
            return JsonResponse(serializer_class.data, safe=False)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


def do_i_own_this_item(current_id, pk, db_parameters):
    db_id = None
    serializer_class = None
    database = None

    try:
        if db_parameters["dbname"] == "courses":
            database = Courses.objects.get(courseid=pk)
            db_id = database.fid.id
        elif db_parameters["dbname"] == "dbmusers":
            db_id = pk
        elif db_parameters["dbname"] == "tas":
            database = TAs.objects.get(taid=pk)
            db_id = database.courseid.fid.id
        elif db_parameters["dbname"] == "studentdatabases":
            database = Studentdatabases.objects.get(dbid=pk)
            db_id = database.fid.id
    except Exception as e:
        return False
    else:
        if db_id == current_id:
            return True
        else:
            return False

@authenticated
def get_single_response(request, pk, db_parameters):
    current_id = request.session['user']

    try:
        database = db_parameters["db"].objects.get(pk=pk)
        serializer_class = db_parameters["serializer"](database, many=False)
    except Exception as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    else:
        am_i_the_owner = do_i_own_this_item(current_id, pk, db_parameters)
        if am_i_the_owner or check_role(request, teacher) or db_parameters[
            "dbname"] == "courses":
            message = " a single response is requested on pk:" + str(pk)
            log_message_with_db(request.session['user'],db_parameters["dbname"],log_get_single,message) #LOG THIS ACTION
            return JsonResponse(serializer_class.data, safe=False)
        else:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)

@csrf_exempt
@authenticated
def get_own_response(request, dbname):
    db_parameters = get_db_parameters(dbname)

    #logging.debug("hier")
    db_id = None
    serializer_class = None
    database = None

    current_id = request.session['user']
    #logging.debug(current_id)
    try:
        if db_parameters["dbname"] == "courses":
            database = Courses.objects.filter(fid__id=current_id)
            serializer_class = CoursesSerializer(database, many=True)
        elif db_parameters["dbname"] == "dbmusers":
            database = dbmusers.objects.filter(id=current_id)
            serializer_class = dbmusersSerializer(database, many=True)
        elif db_parameters["dbname"] == "tas":
            database = TAs.objects.filter(studentid__id=current_id)
            serializer_class = TasSerializer(database, many=True)
        elif db_parameters["dbname"] == "studentdatabases":
            database = Studentdatabases.objects.filter(fid__id=current_id)
            serializer_class = StudentdatabasesSerializer(database, many=True)
    except Exception as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    else:
        log_message_with_db(request.session['user'],db_parameters["dbname"],log_get_own," this user has requested its own info in this db") #LOG THIS ACTION
        return JsonResponse(serializer_class.data, safe=False)


def post_base_dbmusers_response(request):
    databases = None
    try:
        databases = JSONParser().parse(request)
    except ParseError:
        return HttpResponse("Your JSON is incorrectly formatted")

    try:

        if not re.match(r'.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl$', databases["email"]):
            return HttpResponse("only utwente email address can be used", status=status.HTTP_400_BAD_REQUEST)


        unhashed_password = databases['password']
        databases['password'] = hash.make(unhashed_password)
        databases["token"] = hash.token()
        if check_role(request, admin):
            pass
            # databases['role'] = databases['role']
        else:
            databases['role'] = student
        custom_serializer = dbmusersSerializer
        serializer_class = custom_serializer(data=databases, create=True)
        # send confirmation mail
        # mail.send_verification(databases)
        logging.debug("Created user; verify at /verify/"+databases["token"])
        message = " a user has been created with the email: " + str(databases['email'])
        log_message_with_db("","dbmusers",log_post_base_dbmusers,message) #LOG THIS ACTION

        if serializer_class.is_valid():
            serializer_class.save()
            #We don't want to return hashed password and verification tokens
            serializer_class = dbmusersSerializer(serializer_class.data)
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        else:
            if "must make a unique set" in str(serializer_class.errors):
                return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
            else:
                return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    except KeyError as e:
        return HttpResponse("The following field(s) should be included:" + str(e),
                            status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        if "duplicate key" in str(e.__cause__) or "already exists" in str(e.__cause__):
            return HttpResponse(status=status.HTTP_409_CONFLICT)
        raise e

@authenticated
def post_base_response(request, db_parameters):
    if check_role(request, teacher) or (
            db_parameters["dbname"] == "studentdatabases" and check_role(request, student)):

        serializer_class = None

        try:
            databases = JSONParser().parse(request)
            if db_parameters["dbname"] == "courses":
                #teacher should not be able to create courses for each other
                if request.session["role"] < admin or "fid" not in databases:
                    databases["fid"] = request.session["user"]
                if "schema" not in databases:
                    databases["schema"] = ""
                serializer_class = CoursesSerializer(data=databases, create=True)
            else:
                if db_parameters["dbname"] == "studentdatabases":
                    if not "fid" in databases:
                        databases["fid"] = request.session["user"]
                    elif not check_role(request, teacher) and databases["fid"] != request.session["user"]:
                        # you should not be able to request a db for somebody else if you are a student...
                        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

                    # generate data for student
                    username = ""
                    try:
                        username = get_studentdatabase_name(databases["course"])
                    except KeyError as e:
                        return HttpResponse("The following fields should be included: "+str(e), status=status.HTTP_400_BAD_REQUEST)
                    except Courses.DoesNotExist as e:
                        return HttpResponse(status=status.HTTP_409_CONFLICT)
                    password = hash.randomPassword()
                    databases["username"] = username
                    databases["databasename"] = username
                    databases["password"] = password

                custom_serializer = db_parameters["serializer"]
                serializer_class = custom_serializer(data=databases)
        except ParseError:
            return HttpResponse("Your JSON is incorrectly formatted", status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            #logging.debug(type(e))
            raise e
            return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            if serializer_class.is_valid():
                try:
                    if db_parameters["dbname"] == "studentdatabases":
                        create_studentdatabase(serializer_class.validated_data["databasename"], serializer_class.validated_data["username"], serializer_class.validated_data["password"])
                        try:
                            setup_student_db(databases, serializer_class)
                            serializer_class.save()
                        except Exception as e:
                            #rollback db creation
                            delete_studentdatabase(serializer_class.validated_data["databasename"], serializer_class.validated_data["username"])
                            return HttpResponse(e.__cause__, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                        log_message_with_db(request.session['user'],db_parameters["dbname"],log_post_base," a new studentdatabases has been added (row including entire database)") # LOG THIS ACTION
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                    else:
                        if db_parameters["dbname"] == "courses":
                            check = schemaCheck.check(serializer_class.validated_data["schema"])
                            if not check[0]:
                                return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
                        log_message_with_db(request.session['user'],db_parameters["dbname"],log_post_base," a new row has been added") # LOG THIS ACTION
                        serializer_class.save()
                        if db_parameters["dbname"] == "courses":
                            data = serializer_class.data.copy()
                            del data["schema"]
                            return JsonResponse(data, status=status.HTTP_201_CREATED)
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                except KeyError as e:
                    return HttpResponse("The following field(s) should be included:" + str(e),
                                        status=status.HTTP_400_BAD_REQUEST)
                except Exception as e:
                    if "duplicate key" in str(e.__cause__) or "already exists" in str(e.__cause__):
                        return HttpResponse(status=status.HTTP_409_CONFLICT)
                    else:
                        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                #logging.debug(serializer_class.errors)

                if "must make a unique set" in str(serializer_class.errors):
                    return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
                else:
                    return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

@authenticated
def delete_single_response(request, requested_pk, db_parameters):
    current_id = request.session['user']

    if check_role(request, admin) or (
            check_role(request, teacher) and db_parameters["dbname"] == "courses") or do_i_own_this_item(current_id,
                                                                                                         requested_pk,
                                                                                                         db_parameters):

        try:
            db = db_parameters['db']
            instance = db.objects.get(pk=requested_pk)
        except:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            try:
                if db_parameters["dbname"] == "studentdatabases":
                    delete_studentdatabase(instance.databasename, instance.username)
                    instance.delete()
                elif db_parameters["dbname"] == "courses":
                    # when you delete a course, make sure to first delete all the student databases
                    instance = db.objects.get(pk=requested_pk)
                    dbs = Studentdatabases.objects.filter(course=instance.courseid).all()
                    for db in dbs:
                        delete_studentdatabase(db.databasename, db.username)
                        db.delete()
                    instance.delete()
                else:
                    instance.delete()
            except Exception as e:
                #logging.debug(e)
                if "protected foreign key" in str(e.__cause__):
                    return HttpResponse(status=status.HTTP_409_CONFLICT)
                elif db_parameters["dbname"] == "studentdatabases":
                    return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                log_message_with_db(request.session['user'],db_parameters["dbname"],log_delete_single, " a row has been deleted by this user. in case of courses or studentdatabases, additional databases may have been deleted") #LOG THIS ACTION
                return HttpResponse(status=status.HTTP_202_ACCEPTED)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

def update_single_response(request, requested_pk, db_parameters):
    #UPDATE CURRENTLY ONLY SUPPORTED FOR COURSES, THIS FUNCTION COULD BE EXPANDED FOR OTHER DB'S
    if check_role(request, teacher) and db_parameters["dbname"] == "courses":
        try:

            data = JSONParser().parse(request)

            data.pop("fid", None) #in case this exist remove it
            data.pop("courseid", None) #in case this exist remove it

            current_row = db_parameters['db'].objects.get(pk=requested_pk)
            current_row.__dict__.update(data)
            current_row.save()

        except ParseError as e:
            return HttpResponse("Your JSON is incorrectly formatted", status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            logging.debug(e)
            return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            message = "a row has been updated with pk:"+str(requested_pk)
            log_message_with_db(request.session['user'],db_parameters["dbname"],log_update_single, message) #LOG THIS ACTION
            return HttpResponse(status=status.HTTP_202_ACCEPTED)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

@csrf_exempt
@authenticated
def search_on_name(request, search_value, dbname):
    db_parameters = get_db_parameters(dbname)

    results = None

    if check_role(request, teacher) or db_parameters["dbname"] == "courses":

        try:

            if db_parameters["dbname"] == "studentdatabases":
                results = db_parameters["db"].objects.filter(databasename__icontains=search_value)
            elif db_parameters["dbname"] == "courses":
                results = db_parameters["db"].objects.filter(coursename__icontains=search_value)
            elif db_parameters["dbname"] == "dbmusers":
                results = db_parameters["db"].objects.filter(email__icontains=search_value)
            #     TODO: requirs foreign key
            #     elif db_parameters["dbname"] == "tas":
            #      results = db_parameters["db"].objects.filter(databasename__icontains=search_value)

            # serialize data
            serializer = db_parameters["serializer"](results, many=True)

        except Exception as e:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            message = " a search has been done on the term:" + str(search_value)
            log_message_with_db(request.session['user'],db_parameters["dbname"],log_search, message) #LOG THIS ACTION
            return JsonResponse(serializer.data, safe=False)

    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

@csrf_exempt
@require_GET
@require_role(admin)
def search_on_owner(request, search_value, dbname):
    db_parameters = get_db_parameters(dbname)

    try:
        results = None
        if db_parameters["dbname"] == "studentdatabases":
            results = db_parameters["db"].objects.filter(fid=search_value)
        else:
            return HttpResponse(status=status.HTTP_501_NOT_IMPLEMENTED)
        serializer = db_parameters["serializer"](results, many=True)
        return JsonResponse(serializer.data, safe=False)
    except db_parameters["db"].DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)


@csrf_exempt
@require_GET
@require_role(teacher)
def search_db_on_course(request, search_value):
    try:
        course = Courses.objects.get(courseid=search_value)
        if not check_role(request, admin) and request.session["user"] != course.owner().id:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        results = Studentdatabases.objects.filter(course=search_value)
        serializer = StudentdatabasesSerializer(results, many=True)
        return JsonResponse(serializer.data, safe=False)
    except Courses.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)



def get_db_parameters(dbname):
    db_parameters = {"dbname": dbname}

    if dbname == "courses":
        db_parameters["serializer"] = CoursesSerializer
        db_parameters["db"] = Courses
    elif dbname == "dbmusers":
        db_parameters["serializer"] = dbmusersSerializer
        db_parameters["db"] = dbmusers
    elif dbname == "tas":
        db_parameters["serializer"] = TasSerializer
        db_parameters["db"] = TAs
    elif dbname == "studentdatabases":
        db_parameters["serializer"] = StudentdatabasesSerializer
        db_parameters["db"] = Studentdatabases

    return db_parameters


@csrf_exempt
def singleview(request, pk, dbname):
    db_parameters = get_db_parameters(dbname)

    if request.method == 'GET':
        return get_single_response(request, pk, db_parameters)
    elif request.method == 'DELETE':
        return delete_single_response(request, pk, db_parameters)
    elif request.method == 'PUT':
        return update_single_response(request, pk, db_parameters)
    else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@csrf_exempt
def baseview(request, dbname):
    db_parameters = get_db_parameters(dbname)
    if request.method == 'GET':
        return get_base_response(request, db_parameters)
    elif request.method == 'POST':
        if dbname == "dbmusers":
            return post_base_dbmusers_response(request)
        return post_base_response(request, db_parameters)
    else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@csrf_exempt
@require_GET
@authenticated
def dump(request, pk):
    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    schema = schemaWriter.dump(db.__dict__)
    response =  HttpResponse(schema, content_type="application/sql")
    response['Content-Disposition'] = "inline; filename=%s" % (db.databasename+".sql")
    message = "a dump has been made on:" + str(pk)
    log_message_with_db(request.session['user'],"Studentdatabases",log_dump, message) #LOG THIS ACTION
    return response

@csrf_exempt
@require_POST
@authenticated
def reset(request, pk):
    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    #we are now authorised
    try:
        reset_studentdatabase(db)
    except Exception as e:
        raise e
    message = "a reset has been done on:" + str(pk)
    log_message_with_db(request.session['user'],"Studentdatabases",log_reset, message) #LOG THIS ACTION
    return HttpResponse(status=status.HTTP_202_ACCEPTED)

@csrf_exempt
@require_http_methods(["GET", "POST"])
@authenticated
#TODO: investigate file uploads for this, together with front-end team
def schema(request, pk):
    try: 
        course = Courses.objects.get(courseid=pk)
        if request.method == "GET":
            response =  HttpResponse(course.schema, content_type="application/sql")
            response['Content-Disposition'] = "inline; filename=%s" % (course.coursename+".sql")
            return response
        else:
            if course.owner().id == request.session["user"] or check_role(request, admin):
                schema = request.body.decode("utf-8")
                check = schemaCheck.check(schema)
                if not check[0]:
                    return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
                course.schema = schema
                course.save()
                return HttpResponse(status=status.HTTP_202_ACCEPTED)
            else:
                return HttpResponse(status=status.HTTP_403_FORBIDDEN)
    except Courses.DoesNotExist:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

@require_POST
@require_role(teacher)
def transferSchema(request, course, database):
    try:
        course = Courses.objects.get(courseid=course)
    except Courses.DoesNotExist as e:
        return HttpResponse("No such course", status=status.HTTP_404_NOT_FOUND)

    if course.owner().id != request.session["user"] and request.session["role"] < admin:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    try:
        db = Studentdatabases.objects.get(dbid=database)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse("No such database", status=status.HTTP_404_NOT_FOUND)

    if db.course.courseid != course.courseid and db.owner != request.session["user"]:
        return HttpResponse("You don't own this database", status=status.HTTP_403_FORBIDDEN)

    #we are now authorised, and the objects exist
    schema = schemaWriter.dump(db.__dict__)
    #make sure the default schema is not included as such
    name = re.escape(db.username)
    #We want a default schema to be used
    schema = re.sub(r'CREATE SCHEMA "?'+name+r'"?;', "", schema)
    schema = re.sub(r'"?'+name+r'"?\.', "", schema)
    search_path_setter = re.escape("SELECT pg_catalog.set_config('search_path', '', false);")
    schema = re.sub(search_path_setter, "", schema) 
    #verify just in case
    check = schemaCheck.check(schema)
    if not check[0]:
        return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
    course.schema = schema
    course.save()
    message = "Course "+str(course)+" has schema from "+str(database)
    log_message(log_schema, message)

    return HttpResponse()


@require_POST
@require_role(admin)
def generate_migration(request):
    # if not check_role(request, admin):
        # return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    script_file = "/tmp/dab_backup.sh"

    from django.db import connection
    host = connection.settings_dict["HOST"]
    port = connection.settings_dict["PORT"]
    user = connection.settings_dict["USER"]
    password = connection.settings_dict["PASSWORD"]
    database = connection.settings_dict["NAME"]

    #dump all of the student databases
    dbs = Studentdatabases.objects.all();

    #setup
    output = "#!/bin/sh\necho 'Creating structure...';\nmkdir dab_backups;\ncd dab_backups;\nexport PGPASSWORD=\""+password+"\";\n"
    
    #start making the restore script
    restore = "#!/bin/sh\nexport PGPASSWORD=\""+password+"\";\n"
    #restore the main database
    restore += "echo 'Restoring main database...';\ncat "+database+".sql | psql -h "+host+" -p "+port+" -U \""+user+"\";\n"
    for db in dbs:
        db_name = db.databasename
        db_name = re.sub(r'\/', "?", db_name)
        restore += "echo 'Restoring "+db.databasename+"';\ncat "+db_name+".sql | psql -h "+host+" -p "+port+" -U \""+user+"\";\n"
    restore = re.sub(r'"', "\\\"", restore)
    #make the backup script make the restore script
    output += "echo \""+restore+"\" > restore.sh;\n"

    #dump the current database
    output += "echo 'Backing up main database...';\npg_dump -h "+host+" -p "+port+" -U \""+user+"\" -C \""+database+"\" > "+database+".sql;\n"

    for db in dbs:
        create_command = "CREATE USER \""+db.username+"\" WITH UNENCRYPTED PASSWORD \""+db.password+"\";"
        #escape / from the filename by replacing it by ?
        db_name = db.databasename
        db_name = re.sub(r'\/', "?", db_name)
        output += "echo 'Backing up "+db.databasename+"';\necho '"+create_command+"' > "+db_name+".sql;\npg_dump -h "+host+" -p "+port+" -U \""+user+"\" -C \""+db.databasename+"\" >> "+db_name+".sql;\n"

    output += "echo 'Compressing...';\ncd ..;\ntar -czf dab_backup.tar.gz dab_backups;\nrm -R dab_backups;\n"
    output += "echo 'Done generating dab_backup.tar.gz'"

    filename = script_file
    f = open(filename, "w+")
    f.write(output)
    f.close()

    return HttpResponse("Migration generated at "+script_file)




# -----------------------------------------LOGIN-------------------------------------------------

unauthorised = HttpResponse()
unauthorised.status_code = 401

bad_request = HttpResponse()
bad_request.status_code = 400

not_found = HttpResponse();
not_found.status_code = 404



#def get_queryset(self):
    #logging.debug(self.request)

@require_role_redirect(admin)
def userpage(request):
    return render(request, 'userpage.html')

@require_GET
@require_role_redirect(admin)
def admin_view(request):
    return render(request, 'admin.html')


def test(request):
    return HttpResponse("test")

@require_GET
def register(request):
    # if request.method == "POST":
    #     form = RegisterForm(request.POST)
    #     if form.is_valid():
    #         data = form.cleaned_data
    #         password = hash.make(data["password"])
    #         role = dbmusers(role=3, email=data["mail"], password=password, maxdatabases=0)
    #         role.save()
    #         return render(request, 'login.html',
    #                       {'form': LoginForm(), 'message': "Registration succesful; try to login"})

    form = RegisterForm()
    return render(request, 'register.html', {'form': form})


@require_GET
def request_db(request):
    return render(request, 'request_db.html', {})


@require_http_methods(["GET", "POST"])
def login(request):
    incorrect_message = "wrong email or password"
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            try:
                user = dbmusers.objects.get(email=data["mail"])
                if not user.verified:
                    return render(request, 'login.html',
                                  {'form': LoginForm, 'message': "Please verify your email first"})

                if hash.verify(user.password, data["password"]):
                    request.session["user"] = user.id
                    request.session["role"] = user.role
                    request.session.modified = True
                    if user.role < 2:
                        return HttpResponseRedirect("/admin")
                    else:
                        return HttpResponseRedirect("/courses")


                else:
                    return render(request, 'login.html', {'form': form, 'message': incorrect_message})
            except dbmusers.DoesNotExist:
                return render(request, 'login.html', {'form': form, 'message': incorrect_message})
        else:
            form = LoginForm()
            return render(request, 'login.html', {"form": form, "message": "Could not parse form"})
    form = LoginForm()
    return render(request, 'login.html', {'form': form, 'message': ""})


@require_POST
@authenticated
def logout(request):
    request.session.flush()
    return render(request, 'login.html', {'form': LoginForm(), 'message': "You have been logged out"})


# Function for debug purposes only; just returns a small web page with the a button to log out.
@require_GET
def logout_button(request):
    return HttpResponse(
        "<!DOCTYPE html><html><body><form action='/logout' method='POST'><input type='submit' value='logout'/></form></body></html>",
        content_type='text/html')


# Function that returns HTML page for choosing courses
@require_GET
@auth_redirect
def courses(request):
    template = 'courses.html'
    # number = 3
    context = {
    }

    return render(request, template, context)


# Function to change the role of users
# A little bit too complicated for the amount of roles that we have, but should be expandable to an infite amount of roles.
@require_POST
@require_role(admin)
def set_role(request):
    # Always check in case session is not set
    body = json.loads(request.body.decode("utf-8"))
    # Check if the request is formed correctly
    if not ("role" in body and "user" in body):
        return bad_request
    # Check if the user role you are trying to assign exists
    if not (student >= body["role"] >= admin):
        return bad_request

    # if you are not admin, make sure you don't demote an admin or something
    if request.session["role"] > 0:
        try:
            user = dbmusers.objects.get(email=body["user"], role__gt=request.session["role"])
            user.role = body["role"]
            user.save()
        except dbmusers.DoesNotExist as e:
            # means no user found with low enough permissions that you can edit them
            return not_found
    else:
        # admins don't care
        try:
            user = dbmusers.objects.get(email=body["user"])
            user.role = body["role"]
            user.save()
        except dbmusers.DoesNotExist as e:
            # user may not exist
            return not_found
    return HttpResponse()


@require_GET
@authenticated
def whoami(request):
    user = dbmusers.objects.get(id=request.session["user"])
    response = {
        "id": user.id,
        "email": user.email,
        "role": user.role,
        "cached_role": request.session["role"]
    }

    response = json.JSONEncoder().encode(response)
    return HttpResponse(str(response), content_type="application/json")


@require_GET
def verify(request, token):
    user = dbmusers.objects.get(token=token)
    user.verified = True
    user.token = None
    user.save()
    return render(request, 'login.html',
                  {"form": LoginForm(), "message": "Your account has been verified and you can now log in"})

@require_GET
def student_view(request):
    return render(request, 'student_view.html')

@require_GET
# @auth_redirect
def redirect(request):
    if 'role' in request.session:
        if request.session['role'] == 2:
            return student_view(request)
        else:
            return admin_view(request)
    else:
        return login(request)
