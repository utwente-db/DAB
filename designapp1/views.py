# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json
import logging
import re
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

# DESIGN PROJECT

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s',
)

logger = logging.getLogger("request_logger")

admin = 0
teacher = 1
student = 2

# LOGGING

def log_message(userid,message):
    info_message = 'User: '+userid+' has executed: ' + message
    logger.info(info_message)



# REST RESPONSES

def defaultresponse(request):
    template = loader.get_template('defaultresponse.html')
    number = 3
    context = {
        'number': number,
        'range': range(number)
    }
#    current_id = request.session['user']
    log_message('16','TEST')
#    username = pwd.getpwuid( os.getuid() )[ 0 ]
#    logging.debug(username)
    return HttpResponse(template.render(context, request))


def get_base_response(request, db_parameters):
    if check_role(request, teacher) or db_parameters["dbname"] == "courses" or db_parameters["dbname"] == "schemas":
        try:
            database = db_parameters["db"].objects.all()
            serializer_class = db_parameters["serializer"](database, many=True)
        except db_parameters["db"].DoesNotExist as e:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            message = "From database: " + db_parameters["dbname"] + " a base response is requested"
            log_message(request.session['user'],message) #LOG THIS ACTION
            return JsonResponse(serializer_class.data, safe=False)
    elif check_role(request, student) and db_parameters["dbname"] == "studentdatabases":
        # student should be able to view own databases
        try:
            database = db_parameters["db"].objects.filter(fid=request.session["user"]).all()
            serializer_class = db_parameters["serializer"](database, many=True)
        except db_parameters["db"].DoesNotExist as e:
            return JsonResponse([], safe=False)
        else:
            logging.debug("hier?")
            message = "From database: " + db_parameters["dbname"] + " a base response is requested"
            log_message(request.session['user'],message) #LOG THIS ACTION
            return JsonResponse(serializer_class.data, safe=False)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


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
        elif db_parameters["dbname"] == "schemas":
            database = schemas.objects.get(id=pk)
            db_id = database.course.fid.id
    except Exception as e:
        return False
    else:
        if db_id == current_id:
            return True
        else:
            return False


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
            return JsonResponse(serializer_class.data, safe=False)
        else:
            return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


@csrf_exempt
def get_own_response(request, dbname):
    if check_role(request, student):

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
            elif db_parameters["dbname"] == "schemas":
                database = schemas.objects.filter(course__fid__id=current_id)
                serializer_class = schemasserializer(database, many=True)
        except Exception as e:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            return JsonResponse(serializer_class.data, safe=False)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


def post_base_dbmusers_response(request, databases, db_parameters):
    unhashed_password = databases['password']
    databases['password'] = hash.make(unhashed_password)
    databases["token"] = hash.token()
    if check_role(request, admin):
        databases['role'] = databases['role']
    elif check_role(request, teacher):
        if int(databases['role']) < teacher:
            databases['role'] = teacher
    elif check_role(request, student):
        if int(databases['role']) < student:
            databases['role'] = student
    else:
        databases['role'] = student
    custom_serializer = db_parameters["serializer"]
    serializer_class = custom_serializer(data=databases)
    # send confirmation mail
    #              mail.send_verification(databases)
    return serializer_class


def post_base_response(request, db_parameters):
    if db_parameters["dbname"] == "courses":
        db_parameters["serializer"] = CoursesCreateSerializer

    if check_role(request, teacher) or db_parameters["dbname"] == "dbmusers" or (
            db_parameters["dbname"] == "studentdatabases" and check_role(request, student)):

        serializer_class = None

        try:
            databases = JSONParser().parse(request)
            if db_parameters["dbname"] == "dbmusers":
                if not re.match(r'.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl', databases["email"]):
                    return HttpResponse("only utwente email address can be used", status=status.HTTP_400_BAD_REQUEST)
                else:
                    serializer_class = post_base_dbmusers_response(request, databases, db_parameters)
            else:
                if db_parameters["dbname"] == "studentdatabases":
                    # generate data for student
                    username, password = hash.randomNames()
                    databases["username"] = username
                    databases["databasename"] = username
                    databases["password"] = password
                    if not "fid" in databases:
                        databases["fid"] = request.session["user"]
                    elif not check_role(request, teacher) and databases["fid"] != request.session["user"]:
                        # you should not be able to request a db for somebody else if you are a student...
                        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

                custom_serializer = db_parameters["serializer"]
                serializer_class = custom_serializer(data=databases)
        except ParseError:
            return HttpResponse("Your JSON is incorrectly formatted", status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            #logging.debug(type(e))
            return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            if serializer_class.is_valid():
                try:
                    if db_parameters["dbname"] == "studentdatabases":
                        serializer_class = create_studentdatabase(serializer_class)
                        setup_student_db(databases, serializer_class)
                        serializer_class.save()
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                    else:
                        if db_parameters["dbname"] == "courses":
                            check = schemaWriter.check(serializer_class.validated_data["schema"])
                            if not check[0]:
                                return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
                        serializer_class.save()
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                except KeyError as e:
                    return HttpResponse("The following field(s) should be included:" + str(e),
                                        status=status.HTTP_400_BAD_REQUEST)
                except Exception as e:
                    if "duplicate key" in str(e.__cause__) or "already exists" in str(e.__cause__):
                        return HttpResponse(status=status.HTTP_409_CONFLICT)
                    elif db_parameters["dbname"] == "studentdatabases":
                        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                #logging.debug(serializer_class.errors)

                if "must make a unique set" in str(serializer_class.errors):
                    return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
                else:
                    return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


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
                    delete_studentdatabase(instance)
                    instance.delete()
                elif db_parameters["dbname"] == "courses":
                    # when you delete a course, make sure to first delete all the student databases
                    instance = db.objects.get(pk=requested_pk)
                    dbs = Studentdatabases.objects.filter(course=instance.courseid).all()
                    for db in dbs:
                        delete_studentdatabase(db)
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
                return HttpResponse(status=status.HTTP_202_ACCEPTED)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


@csrf_exempt
def search_on_name(request, search_value, dbname):
    db_parameters = get_db_parameters(dbname)

    results = None

    if check_role(request, teacher) or db_parameters["dbname"] == "courses" or db_parameters["dbname"] == "schemas":

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
            return JsonResponse(serializer.data, safe=False)

    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)


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
    elif dbname == "schemas":
        db_parameters["serializer"] = schemasserializer
        db_parameters["db"] = schemas
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
    else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@csrf_exempt
def baseview(request, dbname):
    db_parameters = get_db_parameters(dbname)
    if request.method == 'GET':
        return get_base_response(request, db_parameters)
    elif request.method == 'POST':
        return post_base_response(request, db_parameters)
    else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@csrf_exempt
@require_GET
def dump(request, pk):
    if not check_role(request, student):
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    schema = schemaWriter.dump(db.__dict__)
    response =  HttpResponse(schema, content_type="application/sql")
    response['Content-Disposition'] = "inline; filename=%s" % (db.databasename+".sql")
    return response

@csrf_exempt
@require_POST
def reset(request, pk):
    if not check_role(request, student):
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    #we are now authorised
    try:
        reset_studentdatabase(db)
    except Exception as e:
        raise e
    return HttpResponse(status=status.HTTP_202_ACCEPTED)

@csrf_exempt
@require_http_methods(["GET", "POST"])
#TODO: investigate file uploads for this, together with front-end team
def schema(request, pk):
    if not check_role(request, student):
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

    try: 
        course = Courses.objects.get(courseid=pk)
        if request.method == "GET":
            response =  HttpResponse(course.schema, content_type="application/sql")
            response['Content-Disposition'] = "inline; filename=%s" % (course.coursename+".sql")
            return response
        else:
            if course.owner().id == request.session["user"] or check_role(request, admin):
                schema = request.body.decode("utf-8")
                check = schemaWriter.check(schema)
                if not check[0]:
                    return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
                course.schema = schema
                course.save()
                return HttpResponse(status=status.HTTP_202_ACCEPTED)
            else:
                return HttpResponse(status=status.HTTP_403_FORBIDDEN)
    except Courses.DoesNotExist:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)




# -----------------------------------------LOGIN-------------------------------------------------

unauthorised = HttpResponse()
unauthorised.status_code = 401

bad_request = HttpResponse()
bad_request.status_code = 400

not_found = HttpResponse();
not_found.status_code = 404


def check_role(request, role):
    try:
        if (int(request.session["role"]) <= role):
            return True
    except Exception:
        pass
    return False


#def get_queryset(self):
    #logging.debug(self.request)


@require_GET
def home(request):
    path = 'http://localhost:'
    port = '1402'
    call = '/dbmusers/'
    # need session cookie
    # response = requests.get(path + port + call)
    # data = response.json()

    students = ["David", "James", "John", "Robert",
                "Michael", "Wiliam", "Richard", "Joseph",
                "Thomas", "Charles", "Christopher", "Daniel",
                "Matthew", "Anthony", "Donald", "Mark", "Paul",
                "Steven", "Andrew", "Kenneth", "Joshua", "George",
                "Kevin", "Brian", "Edward", "Ronald", "Timothy",
                "Jason", "Jeffrey", "Ryan", "Jacob", "Gary"]

    return render(request, 'home.html', {
        'students': students,
        'number': len(students)
        # , 'email': 'test_email'
    })
    # posts = Post.objects.all()
    # paginator = Paginator(posts, 3)
    # page = request.GET.get('page')
    # # ?page=2
    #
    # posts = paginator.get_page(page)

    # return render(request, 'home.html')#, {'posts': posts})


def test(request):
    return HttpResponse("test")


@require_POST
def create_db(request):
    if not check_role(request, 0):
        return unauthorised;
    body = json.loads(request.body.decode("utf-8"))
    statements.create_db(body["name"], body["owner"], body["password"])
    return HttpResponse("")


@require_POST
def delete_db(request):
    if not check_role(request, 0):
        return unauthorised;
    body = json.loads(request.body.decode("utf-8"))
    statements.delete_db(body["name"])
    return HttpResponse("")


@require_POST
def delete_user(request):
    if not check_role(request, 0):
        return unauthorised;
    body = json.loads(request.body.decode("utf-8"))
    statements.delete_user(body["name"])
    return HttpResponse("")


@require_POST
def delete_db_with_owner(request):
    if not check_role(request, 0):
        return unauthorised;
    body = json.loads(request.body.decode("utf-8"))
    statements.delete_db_with_owner(body["name"])
    return HttpResponse("")


@require_GET
def get_users(request):
    if not check_role(request, 0):
        return unauthorised;
    answer = statements.get_users()
    answer = json.JSONEncoder().encode(answer)
    response = HttpResponse(str(answer), content_type="application/json")
    return response


@require_http_methods(["GET", "POST"])
def register(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            password = hash.make(data["password"])
            role = dbmusers(role=3, email=data["mail"], password=password, maxdatabases=0)
            role.save()
            return render(request, 'login.html',
                          {'form': LoginForm(), 'message': "Registration succesful; try to login"})

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
                    return HttpResponseRedirect("/")
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
def logout(request):
    request.session.flush()
    return render(request, 'login.html', {'form': LoginForm(), 'message': "You have been logged out"})


# Function for debug purposes only; just returns a small web page with the a button to log out.
@require_GET
def logout_button(request):
    return HttpResponse(
        "<!DOCTYPE html><html><body><form action='logout' method='POST'><input type='submit' value='logout'/></form></body></html>",
        content_type='text/html')


# Function that returns HTML page for choosing courses
@require_GET
def courses(request):
    template = 'courses.html'
    # number = 3
    context = {
    }

    return render(request, template, context)


# Function to change the role of users
# A little bit too complicated for the amount of roles that we have, but should be expandable to an infite amount of roles.
@require_POST
def set_role(request):
    # Always check in case session is not set
    if not check_role(request, 1):
        return unauthorised
    body = json.loads(request.body.decode("utf-8"))
    # Check if the request is formed correctly
    if not ("role" in body and "user" in body):
        return bad_request
    # Check if you have the permission to do this in principle
    if body["role"] <= request.session["role"] and request.session["role"] > 0:
        return unauthorised
    # Check if the user role you are trying to assign exists
    if not (3 >= body["role"] >= 0):
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
def whoami(request):
    if not check_role(request, 3):
        return not_found

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
