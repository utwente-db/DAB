# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import functools
import json

import glob
import os

from django.db.utils import OperationalError
from django.http import HttpResponse, HttpResponseRedirect
from django.http.response import JsonResponse
from django.shortcuts import render
from django.utils import timezone
# from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_POST, require_GET
from rest_framework import status
from rest_framework.exceptions import ParseError
from rest_framework.parsers import JSONParser

from src.django_settings.secret import URL_PREFIX, DEBUG
from src.django_settings.settings import DATABASE_SERVER, BASE_DIR
from . import hash
from . import mail
from . import schemaCheck
from . import schemas as schemaWriter
from .forms import *
from .log_functions import *
from .serializers import *
from .settings import *
from .studentdb_functions import *

# import os
# import pwd

# DESIGN PROJECT
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s',
)

# --- BEGIN FREEK CHUNK FIX ---



cssnumbers = []
jsnumbers = []

if not DEBUG:
    cssfilestring_list = (glob.glob(os.path.join(BASE_DIR, "../frontend/css/[0-9]*.css")))
    jsfilestring_list = (glob.glob(os.path.join(BASE_DIR, "../frontend/scripts/[0-9]*.chunk.js")))

    for cssfilestring in cssfilestring_list:
        cssnumbers.append(int(cssfilestring.split("/")[-1].split(".")[0]))

    for jsfilestring in jsfilestring_list:
        jsnumbers.append(int(jsfilestring.split("/")[-1].split(".")[0]))


    jsnumbers.sort()
    cssnumbers.sort()
    jsnumbers = list(map(lambda x: str(x) + ".chunk", jsnumbers))
else:
    cssnumbers.append("main")

# --- END FREEK CHUNK FIX ---

class PrefixHttpResponseRedirect(HttpResponseRedirect):
    def __init__(self,input):
        super().__init__("/" + URL_PREFIX + input)



def render_with_prefix(request, template_name, context=None, content_type=None, status=None, using=None):
    if context is None:
        context = {}
    context['url_prefix'] = URL_PREFIX
    context['jsnumbers'] = jsnumbers
    context['cssnumbers'] = cssnumbers
    context['db_prefix'] = STUDENT_DB_PREFIX

    return render(request, template_name, context, content_type, status, using)
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
            return PrefixHttpResponseRedirect("")
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
                return PrefixHttpResponseRedirect("")
            elif not check_role(request, role):
                return HttpResponse("You are not authorised", status=status.HTTP_403_FORBIDDEN)
            return func(request, *args, **kwargs)

        return wrapper

    return decorator


def check_role(request, role):
    try:
        if (int(request.session["role"]) <= role):
            return True
    except OperationalError as e:
        return HttpResponse('Connection to the database is lost', status=status.HTTP_424_FAILED_DEPENDENCY)
    except Exception as e:
        pass
    return False


def get_role(request):
    return int(request.session["role"])


# REST RESPONSES

def defaultresponse(request):
    return HttpResponse("The page that you requested was not found.", status=status.HTTP_404_NOT_FOUND)


@authenticated
def get_base_response(request, db_parameters):
    if check_role(request, admin) or db_parameters["dbname"] == "courses" or (
            check_role(request, teacher) and db_parameters["dbname"] == "dbmusers"):
        try:
            database = db_parameters["db"].objects.all()
            serializer_class = db_parameters["serializer"](database, many=True)
            if db_parameters["dbname"] == "Studentdatabases":
                data = serializer_class.data.copy()
                log_message_with_db(request.session['user'], db_parameters["dbname"], log_get_base,
                                    " has requested all rows from this db")  # LOG THIS ACTION
                return JsonResponse(data, safe=False)
        except db_parameters["db"].DoesNotExist as e:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            log_message_with_db(request.session['user'], db_parameters["dbname"], log_get_base,
                                " has requested all rows from this db")  # LOG THIS ACTION
            return JsonResponse(serializer_class.data, safe=False)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


def does_a_row_exist(sql_result):
    if sql_result.count() > 0:
        return True
    else:
        return False


def am_i_ta_of_this_course(current_id, course_id):
    try:
        ta_info = TAs.objects.filter(courseid=course_id, studentid=current_id)

        return does_a_row_exist(ta_info)  # is this student a ta over this db?

    except Exception as e:
        logging.debug(e)
        return False


def am_i_ta_of_this_db(current_id, dbid):
    try:
        db_info = Studentdatabases.objects.get(pk=dbid)
        course_id = db_info.course
        ta_info = TAs.objects.filter(courseid=course_id, studentid=current_id)

        return does_a_row_exist(ta_info)  # is this student a ta over this db?

    except Exception as e:
        logging.debug(e)
        return False


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
    except db_parameters["db"].DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    else:
        am_i_the_owner = do_i_own_this_item(current_id, pk, db_parameters)
        am_i_the_ta = am_i_ta_of_this_db(current_id, pk)

        if am_i_the_owner or check_role(request, teacher) or db_parameters["dbname"] == "courses" or (
                db_parameters["dbname"] == "studentdatabases" and am_i_the_ta):
            message = " a single response is requested on pk:" + str(pk)
            log_message_with_db(request.session['user'], db_parameters["dbname"], log_get_single,
                                message)  # LOG THIS ACTION
            if db_parameters["dbname"] == "Studentdatabases":
                data = serializer_class.data.copy()
                return JsonResponse(data, safe=False)
            return JsonResponse(serializer_class.data, safe=False)
        else:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)


@authenticated
def get_own_response(request, dbname):
    db_parameters = get_db_parameters(dbname)

    # logging.debug("hier")
    db_id = None
    serializer_class = None
    database = None

    current_id = request.session['user']
    # logging.debug(current_id)
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
            data = serializer_class.data.copy()
            return JsonResponse(data, safe=False)
    except Exception as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    else:
        log_message_with_db(request.session['user'], db_parameters["dbname"], log_get_own,
                            " this user has requested its own info in this db")  # LOG THIS ACTION
        return JsonResponse(serializer_class.data, safe=False)


@require_GET
@authenticated
def get_course_ta(request, pk):
    course = None
    try:
        course = Courses.objects.get(courseid=pk)
    except Courses.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if request.session["role"] >= admin or course.owner().id == request.session["user"] or am_i_ta_of_this_course(
            request.session["user"], course.courseid):
        data = TAs.objects.filter(courseid=course.courseid)
        serializer = TasSerializer(data, many=True)
        return JsonResponse(serializer.data, safe=False)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


@require_GET
@authenticated
def search_dbmusers_on_course(request, pk):
    course = None
    try:
        course = Courses.objects.get(courseid=pk)
    except Courses.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if course.owner().id == request.session["user"] or am_i_ta_of_this_course(request.session["user"], course.courseid):
        data = dbmusers.objects.raw("SELECT u.* FROM dbmusers u, studentdatabases d where d.course=%s and u.id=d.fid",
                                    [course.courseid])
        serializer = dbmusersSerializer(data, many=True)
        return JsonResponse(serializer.data, safe=False)

    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


def post_base_dbmusers_response(request):
    databases = None
    try:
        databases = JSONParser().parse(request)
    except ParseError:
        return HttpResponse("Your JSON is incorrectly formatted", status=status.HTTP_400_BAD_REQUEST)

    admin_create = check_role(request, admin) and "admin" in databases and databases["admin"]

    try:

        unhashed_password = databases['password']
        databases['password'] = hash.make(unhashed_password)
        databases["token"] = hash.token()
        databases["tokenExpire"] = timezone.now() + timezone.timedelta(hours=24)
        if admin_create:
            if "role" not in databases:
                databases["role"] = student
            if "verified" not in databases:
                databases["verified"] = True
        else:
            databases['role'] = student
            databases['verified'] = False
        custom_serializer = dbmusersSerializer
        serializer_class = custom_serializer(data=databases, create=True)
        message = " a user has been created with the email: " + str(databases['email'])
        log_message_with_db("", "dbmusers", log_post_base_dbmusers, message)  # LOG THIS ACTION

        if serializer_class.is_valid():
            serializer_class.save()
            # send confirmation mail
            if admin_create:
                if databases["verified"]:
                    mail.send_creation_notice(databases)
                else:
                    mail.send_verification(databases, True)
            else:
                mail.send_verification(databases)
            # We don't want to return hashed password and verification tokens
            serializer_class = dbmusersSerializer(serializer_class.data)
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        else:
            if "must make a unique set" or "already exists" in str(serializer_class.errors):
                return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
            else:
                return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    except KeyError as e:
        return HttpResponse("The following field(s) should be included:" + str(e),
                            status=status.HTTP_400_BAD_REQUEST)
    except ValueError as e:
        return HttpResponse(e, status=status.HTTP_400_BAD_REQUEST)
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
                # teacher should not be able to create courses for each other
                if request.session["role"] < admin or "fid" not in databases:
                    databases["fid"] = request.session["user"]
                if "schema" not in databases:
                    databases["schema"] = ""
                if "active" not in databases:
                    databases["active"] = False
                serializer_class = CoursesSerializer(data=databases, create=True)
            else:
                if db_parameters["dbname"] == "studentdatabases":
                    if not "fid" in databases:
                        databases["fid"] = request.session["user"]
                    elif not check_role(request, teacher) and databases["fid"] != request.session["user"]:
                        # you should not be able to request a db for somebody else if you are a student...
                        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

                    # Check that the course is active
                    try:
                        course = Courses.objects.get(courseid=databases["course"])
                        if not course.active:
                            # unless you are a teacher or ta
                            if not course.owner().id == request.session["user"] and not am_i_ta_of_this_course(
                                    request.session["user"], course.courseid):
                                return HttpResponse("Course is not active!", status=status.HTTP_403_FORBIDDEN)
                    except Courses.DoesNotExist as e:
                        return HttpResponse("Course does not exist", status=status.HTTP_409_CONFLICT)

                    # generate data for student
                    username = ""
                    try:
                        username = get_studentdatabase_name(databases["course"])
                        username = re.sub(r' ', "_", username)
                    except KeyError as e:
                        return HttpResponse("The following fields should be included: " + str(e),
                                            status=status.HTTP_400_BAD_REQUEST)
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
            # logging.debug(type(e))
            raise e
            return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            if serializer_class.is_valid():
                try:
                    if db_parameters["dbname"] == "studentdatabases":
                        create_studentdatabase(serializer_class.validated_data["databasename"],
                                               serializer_class.validated_data["username"],
                                               serializer_class.validated_data["password"])
                        try:
                            setup_student_db(databases, serializer_class)
                            serializer_class.save()
                            # now we need to make sure the correct password is returned IN THE STUPIDEST WAY POSSIBLE because the IOVE DAMNET SERIALIZERS have IMMUTABLE DICTS
                            data = serializer_class.data.copy()
                            log_message_with_db(request.session['user'], db_parameters["dbname"], log_post_base,
                                                " a new studentdatabases has been added (row including entire database)")  # LOG THIS ACTION
                            return JsonResponse(data, status=status.HTTP_201_CREATED)
                        except Exception as e:
                            # rollback db creation
                            delete_studentdatabase(serializer_class.validated_data["databasename"],
                                                   serializer_class.validated_data["username"])
                            return HttpResponse(e.__cause__, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        if db_parameters["dbname"] == "courses":
                            check = schemaCheck.check(serializer_class.validated_data["schema"])
                            if not check[0]:
                                return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
                        log_message_with_db(request.session['user'], db_parameters["dbname"], log_post_base,
                                            " a new row has been added")  # LOG THIS ACTION
                        serializer_class.save()
                        if db_parameters["dbname"] == "courses":
                            data = serializer_class.data.copy()
                            del data["schema"]
                            return JsonResponse(data, status=status.HTTP_201_CREATED)
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                except KeyError as e:
                    return HttpResponse("The following field(s) should be included:" + str(e),
                                        status=status.HTTP_400_BAD_REQUEST)
                except ValueError as e:
                    return HttpResponse(str(e), status=status.HTTP_400_BAD_REQUEST)
                except Exception as e:
                    if "duplicate key" in str(e.__cause__) or "already exists" in str(e.__cause__):
                        return HttpResponse(status=status.HTTP_409_CONFLICT)
                    else:
                        raise e
            else:
                # logging.debug(serializer_class.errors)

                if "must make a unique set" in str(serializer_class.errors):
                    return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
                else:
                    return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


@authenticated
def delete_single_response(request, requested_pk, db_parameters):
    current_id = request.session['user']

    if (check_role(request, admin)
        or (check_role(request, teacher) and db_parameters["dbname"] == "courses")
        or do_i_own_this_item(current_id, requested_pk, db_parameters) 
        or (db_parameters["dbname"] == "studentdatabases" and am_i_ta_of_this_db(request.session["user"], requested_pk))):

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
                logging.debug(e)
                if "protected foreign key" in str(e.__cause__):
                    return HttpResponse(status=status.HTTP_409_CONFLICT)
                elif db_parameters["dbname"] == "studentdatabases":
                    return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                log_message_with_db(request.session['user'], db_parameters["dbname"], log_delete_single,
                                    " a row has been deleted by this user. in case of courses or studentdatabases, additional databases may have been deleted")  # LOG THIS ACTION
                return HttpResponse(status=status.HTTP_202_ACCEPTED)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


def accepted_fields_for_db(table):
    if table == "courses":
        return {'coursename', 'info', 'active', 'databases'}
    if table == "studentdatabases":
        return {'groupid'}


def filter_dict_on_keys(incoming, dbname):
    accepted_fields = accepted_fields_for_db(dbname)

    unwanted = set(incoming) - set(accepted_fields)
    for unwanted_key in unwanted: del incoming[unwanted_key]

    return incoming


@authenticated
def update_single_response(request, requested_pk, db_parameters):
    # UPDATE CURRENTLY ONLY SUPPORTED FOR COURSES, STUDENTDATABASES, AND DBMUSERS
    # are we allowed to do this?

    authorised = False

    if db_parameters["dbname"] == "courses":
        am_i_the_ta = am_i_ta_of_this_course(request.session["user"], requested_pk)
        if check_role(request, teacher) or am_i_the_ta:
            authorised = True
    elif db_parameters["dbname"] == "studentdatabases":
        am_i_the_ta = am_i_ta_of_this_db(request.session["user"], requested_pk)
        logging.debug(am_i_the_ta)
        if check_role(request, teacher) or am_i_the_ta or do_i_own_this_item(request.session["user"], requested_pk,
                                                                             db_parameters):
            authorised = True
    elif db_parameters["dbname"] == "dbmusers":
        if request.session["role"] == admin:
            authorised = True
    else:
        return HttpResponse(status=status.HTTP_501_NOT_IMPLEMENTED)

    if authorised:
        try:

            data = JSONParser().parse(request)
            if db_parameters["dbname"] == "dbmusers":
                forbidden_params = ["password", "token", "lastlogin", "tokenExpire", "id"]
                for p in forbidden_params:
                    if p in data:
                        return HttpResponse(p+" may not be changed", status=status.HTTP_403_FORBIDDEN)

            filtered_data = filter_dict_on_keys(data, db_parameters["dbname"])

            if len(filtered_data) == 0:
                return HttpResponse(
                    "The fields you supplied are not valid. Check your fields on grammar or provide at least 1 field",
                    status=status.HTTP_400_BAD_REQUEST)
            else:
                current_row = db_parameters['db'].objects.get(pk=requested_pk)
                current_row.__dict__.update(filtered_data)
                current_row.save()

                # get the updated row to send back to the user
                updated_row = db_parameters["db"].objects.get(pk=requested_pk)
                serializer = db_parameters["serializer"](updated_row, many=False)  # serialize this data

        except ParseError as e:
            return HttpResponse("Your JSON is incorrectly formatted", status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            logging.debug(e)
            return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            message = "a row has been updated with pk:" + str(requested_pk)
            log_message_with_db(request.session['user'], db_parameters["dbname"], log_update_single,
                                message)  # LOG THIS ACTION
            return JsonResponse(serializer.data, safe=False, status=status.HTTP_202_ACCEPTED)

    #            return HttpResponse(status=status.HTTP_202_ACCEPTED)
    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


@authenticated
def search_on_name(request, search_value, dbname):
    db_parameters = get_db_parameters(dbname)

    results = None

    if check_role(request, admin) or (check_role(request, student) and db_parameters["dbname"] == "studentdatabases") or \
            db_parameters["dbname"] == "courses":

        try:

            if db_parameters["dbname"] == "studentdatabases":
                current_id = request.session['user']
                if (get_role(request) == student):
                    ta_courses_results = TAs.objects.filter(studentid=current_id)

                    results = []

                    for single_course in ta_courses_results:
                        # get databases where this student is a TA
                        results.extend(db_parameters["db"].objects.filter(databasename__icontains=search_value,
                                                                          course=single_course.courseid))

                elif (get_role(request) == teacher):
                    results = db_parameters["db"].objects.filter(databasename__icontains=search_value,
                                                                 course__fid=current_id)  # get only results of the courses of this teacher
                elif (get_role(request) == admin):
                    results = db_parameters["db"].objects.filter(
                        databasename__icontains=search_value)  # get all results
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
            logging.debug(type(e))
            return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
            message = " a search has been done on the term:" + str(search_value)
            log_message_with_db(request.session['user'], db_parameters["dbname"], log_search,
                                message)  # LOG THIS ACTION
            if db_parameters["dbname"] == "Studentdatabases":
                data = serializer.data.copy()
                return JsonResponse(data, safe=False)
            return JsonResponse(serializer.data, safe=False)

    else:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)


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
        if db_parameters["dbname"] == "Studentdatabases":
            data = serializer.data.copy()
        return JsonResponse(serializer.data, safe=False)
    except db_parameters["db"].DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)


@require_GET
@require_role(student)
def search_db_on_course(request, search_value):
    try:
        course = Courses.objects.get(courseid=search_value)

        am_i_the_ta = am_i_ta_of_this_course(request.session["user"], course.courseid)
        logging.debug(am_i_the_ta)
        if not check_role(request, admin) and request.session["user"] != course.owner().id and not am_i_the_ta:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)
        results = Studentdatabases.objects.filter(course=search_value)
        serializer = StudentdatabasesSerializer(results, many=True)
        data = serializer.data.copy()
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


@require_GET
@authenticated
def teacher_own_tas(request):
    results = TAs.objects.raw("SELECT t.* FROM tas t, courses c WHERE c.fid=%s AND t.courseid=c.courseid;", [request.session["user"]])
    serializer = TasSerializer(results, many=True)
    return JsonResponse(serializer.data, safe=False)

@require_GET
@authenticated
def teacher_own_studentdatabases(request):
    results = Studentdatabases.objects.raw("SELECT s.* FROM studentdatabases s, courses c WHERE c.fid=%s AND s.course = c.courseid;", [request.session["user"]])
    serializer = StudentdatabasesSerializer(results, many=True)
    return JsonResponse(serializer.data, safe=False)

@require_GET
@authenticated
def ta_own_studentdatabases(request):
    results = Studentdatabases.objects.raw("SELECT s.* FROM studentdatabases s, tas t WHERE t.studentid=%s AND s.course = t.courseid;", [request.session["user"]])
    serializer = StudentdatabasesSerializer(results, many=True)
    return JsonResponse(serializer.data, safe=False)

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


@require_GET
@authenticated
def dump(request, pk):
    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id and not am_i_ta_of_this_db(request.session["user"], db.dbid):
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    schema = schemaWriter.dump(db.__dict__)
    response = HttpResponse(schema, content_type="application/sql")
    response['Content-Disposition'] = "inline; filename=%s" % (db.databasename + ".sql")
    message = "a dump has been made on:" + str(pk)
    log_message_with_db(request.session['user'], "Studentdatabases", log_dump, message)  # LOG THIS ACTION
    return response


@require_GET
@require_role(teacher)
def course_dump(request, pk):
    course = None
    try:
        course = Courses.objects.get(courseid=pk)
    except Courses.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not course.owner().id == request.session["user"] and not request.session["role"] == admin:
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    file = schemaWriter.dump_course(course)

    if file == None:
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)

    response = HttpResponse(file, content_type="application/zip")
    filename = re.sub(r' ', "_", course.coursename) + ".zip"
    response["Content-Disposition"] = "inline; filename=%s" % filename
    log_message_with_db(request.session["user"], "Courses", log_dump,
                        " course " + str(course.courseid) + " has been dumped")
    return response


@require_POST
@authenticated
def reset(request, pk):
    try:
        db = Studentdatabases.objects.get(dbid=pk)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not check_role(request, teacher) and request.session["user"] != db.owner().id and not am_i_ta_of_this_db(
            request.session["user"], pk):
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    # we are now authorised
    try:
        reset_studentdatabase(db)
    except Exception as e:
        raise e
    message = "a reset has been done on:" + str(pk)
    log_message_with_db(request.session['user'], "Studentdatabases", log_reset, message)  # LOG THIS ACTION
    return HttpResponse(status=status.HTTP_202_ACCEPTED)


@require_http_methods(["GET", "POST"])
@authenticated
# TODO: investigate file uploads for this, together with front-end team
def schema(request, pk):
    try:
        course = Courses.objects.get(courseid=pk)
        if request.method == "GET":
            response = HttpResponse(course.schema, content_type="application/sql")
            response['Content-Disposition'] = "inline; filename=%s" % (course.coursename + ".sql")
            return response
        else:
            if course.owner().id == request.session["user"] or check_role(request, admin) or am_i_ta_of_this_course(
                    request.session["user"], pk):
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

    if course.owner().id != request.session["user"] and request.session["role"] < admin and not am_i_ta_of_this_course(
            request.session["user"], course.courseid):
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    try:
        db = Studentdatabases.objects.get(dbid=database)
    except Studentdatabases.DoesNotExist as e:
        return HttpResponse("No such database", status=status.HTTP_404_NOT_FOUND)

    if db.course.courseid != course.courseid and db.owner() != request.session["user"] and not am_i_ta_of_this_db(request.session["user"], db.dbid) and request.session["role"] < admin:
        return HttpResponse("You don't own this database", status=status.HTTP_403_FORBIDDEN)

    # we are now authorised, and the objects exist
    schema = schemaWriter.dump(db.__dict__)
    # make sure the default schema is not included as such
    name = re.escape(db.username)
    # We want a default schema to be used
    search_path_setter = re.escape("SELECT pg_catalog.set_config('search_path', '', false);")
    schema = re.sub(search_path_setter, "", schema)
    # verify just in case
    check = schemaCheck.check(schema)
    if not check[0]:
        return HttpResponse(check[1], status=status.HTTP_400_BAD_REQUEST)
    course.schema = schema
    course.save()
    message = "Course " + str(course) + " has schema from " + str(database)
    log_message(log_schema, message)

    return HttpResponse()


@require_POST
@require_role(admin)
def generate_migration(request):
    # if not check_role(request, admin):
    # return HttpResponse(status=status.HTTP_403_FORBIDDEN)

    import os
    script_file = os.getcwd()+"/dab_backup.sh"

    from django.db import connection
    host = connection.settings_dict["HOST"]
    port = connection.settings_dict["PORT"]
    user = connection.settings_dict["USER"]
    password = connection.settings_dict["PASSWORD"]
    database = connection.settings_dict["NAME"]

    # dump all of the student databases
    dbs = Studentdatabases.objects.all();

    # setup
    output = "#!/bin/sh\necho 'Creating structure...';\nmkdir dab_backups;\ncd dab_backups;\nexport PGPASSWORD=\"" + password + "\";\nexport HOST=\"" + host + "\";\nexport USER=\"" + user + "\";\nexport PORT=" + port + ";\n"

    # start making the restore script
    restore = "#!/bin/sh\nexport PGPASSWORD=\"" + password + "\";\nexport HOST=\"" + host + "\";\nexport USER=\"" + user + "\";\nexport PORT=" + port + ";\n"
    # restore the main database
    restore += "echo 'Restoring main database...';\ncat " + database + ".sql | psql -h $HOST -p $PORT -U $USER;\n"
    for db in dbs:
        db_name = db.databasename
        db_name = re.sub(r'\/', "?", db_name)
        restore += "echo 'Restoring " + db.databasename + "';\ncat " + db_name + ".sql | psql -h $HOST -p $PORT -U $USER;\n"
    restore = re.sub(r'"', "\\\"", restore)
    # make the backup script make the restore script
    output += "echo \"" + restore + "\" > restore.sh;\n"

    # dump the current database
    output += "echo 'Backing up main database...';\npg_dump -h $HOST -p $PORT -U $USER -C \"" + database + "\" > " + database + ".sql;\n"

    for db in dbs:
        create_command = "CREATE USER \"" + db.username + "\" WITH ENCRYPTED PASSWORD \"" + db.password + "\";"
        # escape / from the filename by replacing it by ?
        db_name = db.databasename
        db_name = re.sub(r'\/', "?", db_name)
        output += "echo 'Backing up " + db.databasename + "';\necho '" + create_command + "' > " + db_name + ".sql;\npg_dump -h $HOST -p $PORT -U $USER -C \"" + db.databasename + "\" >> " + db_name + ".sql;\n"

    output += "echo 'Compressing...';\ncd ..;\ntar -czf dab_backup.tar.gz dab_backups;\nrm -R dab_backups;\n"
    output += "echo 'Done generating dab_backup.tar.gz'"

    filename = script_file
    f = open(filename, "w+")
    f.write(output)
    f.close()
    os.chmod(filename, 0o750)

    return HttpResponse("Migration generated at " + script_file)


@require_http_methods(["GET", "DELETE"])
@require_role(admin)
def missing_databases(request, all=False):
    if request.method=="DELETE":
        try:
            data = JSONParser().parse(request)
            for db in data:
                rm = remove_missing_database(db)
                if rm:
                    return rm
            return HttpResponse(status=status.HTTP_202_ACCEPTED)
        except ParseError:
            return HttpResponse("Could not Parse JSON", status=status.HTTP_400_BAD_REQUEST)


    from django.db import connection
    from psycopg2.extensions import AsIs

    output = []
    known = [connection.settings_dict["NAME"]]

    dbs = Studentdatabases.objects.all()

    for db in dbs:
        known.append(db.databasename)

    with connection.cursor() as cur:
        if all:
            cur.execute("SELECT datname FROM pg_database WHERE datistemplate=false;")
        else:
            cur.execute("SELECT datname FROM pg_database WHERE datistemplate=false AND datname LIKE '%s';",
                        [AsIs(settings.STUDENT_DB_PREFIX + '%')])
        rows = cur.fetchall()

        for row in rows:
            if not row[0] in known:
                output.append(row[0])

    return JsonResponse(output, safe=False)


def remove_missing_database(db_name):
    from django.db import connection
    # We DON'T want to use this to remove a database that we do know about!
    try:
        db = Studentdatabases.objects.get(databasename=db_name)
        return HttpResponse("Database is managed", status=status.HTTP_400_BAD_REQUEST)
    except Studentdatabases.DoesNotExist:
        pass

    if db_name == connection.settings_dict["NAME"]:
        return HttpResponse("This is the master database", status=status.HTTP_400_BAD_REQUEST)

    from psycopg2.extensions import AsIs

    with connection.cursor() as cur:
        # make sure no one can connect to the database
        cur.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'",
                    [AsIs(db_name)])
        # drop any existing connections
        cur.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'",
                    [AsIs(db_name)])
        cur.execute("DROP DATABASE \"%s\";", [AsIs(db_name)])

    return False


# -----------------------------------------LOGIN-------------------------------------------------

unauthorised = HttpResponse()
unauthorised.status_code = 401

bad_request = HttpResponse()
bad_request.status_code = 400

not_found = HttpResponse();
not_found.status_code = 404


# def get_queryset(self):
# logging.debug(self.request)

@require_role_redirect(admin)
def edit_users(request):
    return render_with_prefix(request, 'edit_users.html', {'role': request.session['role']})


@require_GET
@require_role_redirect(teacher)
def admin_view(request):
    return render_with_prefix(request, 'admin.html', {'role': request.session['role']})


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
    #         return render_with_prefix(request, 'login.html',
    #                       {'form': LoginForm(), 'message': "Registration succesful; try to login"})

    form = RegisterForm()
    return render_with_prefix(request, 'register.html', {'form': form})


@require_POST
def login(request):
    incorrect_message = "wrong email or password"
    form = LoginForm(request.POST)
    if form.is_valid():
        data = form.cleaned_data
        try:
            user = dbmusers.objects.get(email=data["mail"])
            if not user.verified:
                return render_with_prefix(request, 'login.html',
                              {'form': LoginForm, 'template_class': 'resend-verification ' + user.email})

            if hash.verify(user.password, data["password"]):
                request.session["user"] = user.id
                request.session["role"] = user.role
                request.session.modified = True

                user.lastlogin = timezone.now()  # update last login
                user.save()

                return PrefixHttpResponseRedirect("")


            else:
                return render_with_prefix(request, 'login.html', {'form': form, 'template_class': 'incorrect-message'})
        except dbmusers.DoesNotExist:
            return render_with_prefix(request, 'login.html', {'form': form, 'template_class': 'incorrect-message'})
    else:
        form = LoginForm()
        return render_with_prefix(request, 'login.html', {"form": form, 'template_class': 'could-not-parse-form'})


@require_POST
@authenticated
def logout(request):
    request.session.flush()
    return render_with_prefix(request, 'login.html', {'form': LoginForm(), 'template_class': "you-have-been-logged-out"})


# Function for debug purposes only; just returns a small web page with the a button to log out.
@require_GET
def logout_button(request):
    return HttpResponse(
        "<!DOCTYPE html><html><body><form action='/logout' method='POST'><input type='submit' value='logout'/></form></body></html>")


# Function that returns HTML page for choosing courses
@require_GET
@auth_redirect
def courses(request):
    template = 'courses.html'
    # number = 3
    context = {
    }

    return render_with_prefix(request, template, context)


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
            user = dbmusers.objects.get(id=body["user"], role__gt=request.session["role"])
            user.role = body["role"]
            user.save()
        except dbmusers.DoesNotExist as e:
            # means no user found with low enough permissions that you can edit them
            return not_found
    else:
        # admins don't care
        try:
            user = dbmusers.objects.get(id=body["user"])
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
        "cached_role": request.session["role"],
    }

    response = json.JSONEncoder().encode(response)
    return HttpResponse(str(response), content_type="application/json")


@require_GET
@authenticated
def who(request):
    response = {
        "id": request.session["user"],
        "role": request.session["role"],
    }

    response = json.JSONEncoder().encode(response)
    return HttpResponse(str(response), content_type="application/json")


@require_GET
def verify(request, token):
    if "user" in request.session:
        return HttpResponse("You are already logged in!", status=status.HTTP_409_CONFLICT)
    try:
        user = dbmusers.objects.get(token=token)

        if (user.tokenExpire < timezone.now()):
            user.token = hash.token()
            user.tokenExpire = timezone.now() + timezone.timedelta(hours=24)
            user.save()
            mail.send_verification(user.__dict__)
            return HttpResponse("Your token was expired; we have resent the email")

        user.verified = True
        user.token = None
        user.save()
        return render_with_prefix(request, 'login.html',
                      {"form": LoginForm(), 'template_class': 'account-verified'})
    except dbmusers.DoesNotExist as e:
        return HttpResponse("Invalid token", status=status.HTTP_400_BAD_REQUEST)


@require_http_methods(["GET", "POST"])
@authenticated
def change_password(request):
    if request.method == "GET":
        TA_count = TAs.objects.filter(studentid=request.session['user']).count();
        context = {
            'role': request.session['role'],
            'TA_count': TA_count
        }
        return render_with_prefix(request, 'change_password.html', context)
    else:
        body = None
        new = None
        current = None

        try:
            body = JSONParser().parse(request)
        except ParseError as e:
            return HttpResponse("Your JSON did not parse", status=status.HTTP_400_BAD_REQUEST)

        try:
            new = body["new"]
            current = body["current"]
        except KeyError as e:
            return HttpResponse(e, status=status.HTTP_400_BAD_REQUEST)

        user = dbmusers.objects.get(id=request.session["user"])

        if (hash.verify(user.password, current)):
            new = hash.make(new)
            user.password = new
            user.save()
            return HttpResponse()
        else:
            return HttpResponse(status=status.HTTP_403_FORBIDDEN)


@require_POST
def resend_verification(request):
    if "user" in request.session:
        return HttpResponse("You are already logged in!", status=status.HTTP_409_CONFLICT)
    body = None
    user = None
    try:
        body = JSONParser().parse(request)
    except ParseError as e:
        return HttpResponse("Your JSON did not parse", status=status.HTTP_400_BAD_REQUEST)
    if not "email" in body:
        return HttpResponse("Missing key 'email'", status=status.HTTP_400_BAD_REQUEST)

    try:
        user = dbmusers.objects.get(email=body["email"])
    except dbmusers.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if user.verified:
        return HttpResponse(status=status.HTTP_409_CONFLICT)

    user.token = hash.token()
    user.save()

    mail.send_verification(user.__dict__)
    return HttpResponse()


@require_POST
def request_reset_password(request, email):
    if "user" in request.session:
        return HttpResponse("You are already logged in!", status=status.HTTP_409_CONFLICT)
    db = None
    try:
        db = dbmusers.objects.get(email=email)
    except dbmusers.DoesNotExist as e:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

    if not db.verified:
        return HttpResponse("Please verify your email before attempting a password reset",
                            status=status.HTTP_409_CONFLICT)

    token = hash.token()
    db.token = hash.token()
    db.tokenExpire = timezone.now() + timezone.timedelta(hours=4)
    db.save()

    mail.send_reset(db.__dict__)

    return HttpResponse(status=status.HTTP_202_ACCEPTED)


@require_http_methods(["GET", "POST"])
def reset_password(request, pk, token):
    if "user" in request.session:
        return HttpResponse("You are already logged in!", status=status.HTTP_409_CONFLICT)
    # do checks first
    db = None
    try:
        db = dbmusers.objects.get(id=pk)
    except dbmusers.DoesNotExist as e:
        return HttpResponse(
            status=status.HTTP_404_NOT_FOUND)  # TODO: give it some text for the user to know what's going on

    if db.token == None or db.tokenExpire == None or db.token != token:
        return HttpResponse("token invalid", status=status.HTTP_403_FORBIDDEN)

    elif db.tokenExpire < timezone.now():
        return HttpResponse("token expired", status=status.HTTP_403_FORBIDDEN)

    if request.method == "GET":
        return render_with_prefix(request, "reset_password.html", {'pk': pk, 'token': token})

    else:
        body = None
        try:
            body = JSONParser().parse(request)
        except ParseError as e:
            return HttpResponse("Incorrect JSON formatting", status=status.HTTP_400_BAD_REQUEST)
        if not "password" in body:
            return HttpResponse("Missing key 'password' in body", status=status.HTTP_400_BAD_REQUEST)
        # print(body["password"])
        db.password = hash.make(body["password"])
        db.token = None
        db.tokenExpire = None
        db.save()
        return HttpResponse()


@require_GET
def password_has_been_reset(request):
    return render_with_prefix(request, 'login.html', {'form': LoginForm(), 'template_class': "new-password"})


@require_GET
def student_view(request):
    TA_count = TAs.objects.filter(studentid=request.session['user']).count();
    return render_with_prefix(request, 'student_view.html',
                  {'server_address': DATABASE_SERVER, 'role': request.session['role'], 'TA_count': TA_count})


@require_GET
# @auth_redirect
def redirect(request):
    if 'role' in request.session:
        if request.session['role'] == 2:
            return student_view(request)
        else:
            return admin_view(request)
    else:
        form = LoginForm()
        return render_with_prefix(request, 'login.html', {'form': form})


@require_GET
def forgot_password_page(request):
    if ('user' in request.session):
        return HttpResponse(status=status.HTTP_403_FORBIDDEN)
    else:
        return render_with_prefix(request, 'forgot_password_page.html')


@require_GET
@auth_redirect
def edit_courses(request):
    TA_count = TAs.objects.filter(studentid=request.session['user']).count();

    if (request.session['role'] < student or TA_count > 0):
        context = {
            'role': request.session['role'],
            'TA_count': TA_count
        }
        return render_with_prefix(request, 'edit_courses.html', context)
    else:
        return HttpResponse("You are not authorized", status=status.HTTP_403_FORBIDDEN)
