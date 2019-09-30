# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from django.core import serializers

from rest_framework.views import APIView
from rest_framework import viewsets
from rest_framework.parsers import JSONParser
from rest_framework import status

from django.db import IntegrityError
from . import schemas as schemaWriter
from psycopg2.extensions import AsIs
import psycopg2 as db

#DESIGN PROJECT

from .models import *
from .serializers import *
from .studentdb_functions import *

from django.views.decorators.http import require_http_methods, require_POST, require_GET, require_safe
from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator

import json
import re

from designapp1 import statements

from .forms import *
from . import hash
import logging
from . import mail


logging.basicConfig(
       level = logging.DEBUG,
       format = '%(asctime)s %(levelname)s %(message)s',
)

admin   = 0
teacher = 1
student = 2

#REST RESPONSES

def defaultresponse(request):
        return index(request=request)

def get_base_response(request,db_parameters):
        if check_role(request,teacher) or db_parameters["dbname"] == "courses" or db_parameters["dbname"] == "schemas":
          try:
                 database = db_parameters["db"].objects.all()
                 serializer_class = db_parameters["serializer"](database, many=True)
          except Exception as e:
                 logging.debug(e)
                 return HttpResponse(status=status.HTTP_404_NOT_FOUND)
          else:
                 return JsonResponse(serializer_class.data, safe=False)
        else:
                 return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def get_single_response(request,pk,db_parameters):

          db_id = None
          current_id = request.session['user']

          database = None
          serializer_class = None
          try:
                if db_parameters["dbname"]=="courses":
                  database = Courses.objects.get(courseid=pk)
                  serializer_class = CoursesSerializer(database, many=False)
                  db_id = database.fid.id
                elif  db_parameters["dbname"]=="dbmusers":
                  database = dbmusers.objects.get(id=pk)
                  serializer_class = dbmusersSerializer(database, many=False)
                  db_id = pk
                elif  db_parameters["dbname"]=="tas":
                  database = TAs.objects.get(taid=pk)
                  serializer_class = TasSerializer(database, many=False)
                  db_id = database.studentid.id
                elif  db_parameters["dbname"]=="studentdatabases":
                  database = Studentdatabases.objects.get(dbid=pk)
                  serializer_class = StudentdatabasesSerializer(database, many=False)
                  db_id = database.fid.id
                elif  db_parameters["dbname"]=="schemas":
                  database = schemas.objects.get(id=pk)
                  serializer_class = schemasserializer(database, many=False)
          except Exception as e:
                return HttpResponse(status=status.HTTP_404_NOT_FOUND)
          else:
                if str(db_id) == str(current_id) or check_role(request,teacher) or db_parameters["dbname"]=="schemas" or db_parameters["dbname"] == "courses":
                  return JsonResponse(serializer_class.data, safe=False)
                else:
                  return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def post_base_dbmusers_response(request,databases,db_parameters):
              unhashed_password = databases['password']
              databases['password'] = hash.make(unhashed_password)
              databases["token"] = hash.token()
              if check_role(request,admin):
                databases['role'] = databases['role']
              elif check_role(request,teacher):
                if int(databases['role'])<teacher:
                  databases['role']=teacher
              elif check_role(request,student):
                if int(databases['role'])<student:
                  databases['role']=student
              else:
                databases['role']=student
              custom_serializer = db_parameters["serializer"]
              serializer_class = custom_serializer(data=databases)
              #send confirmation mail
#              mail.send_verification(databases)
              return serializer_class


def post_base_response(request,db_parameters):
    if check_role(request,teacher) or db_parameters["dbname"]=="dbmusers" or (db_parameters["dbname"]=="studentdatabases" and check_role(request,student)):

        serializer_class = None

        try:
            databases = JSONParser().parse(request)
            if db_parameters["dbname"]=="dbmusers":
                if not re.match(r'.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl', databases["email"]):
                    return HttpResponse("only utwente email address can be used",status=status.HTTP_406_NOT_ACCEPTABLE)
                else:
                    serializer_class = post_base_dbmusers_response(request,databases,db_parameters)
            else:
                custom_serializer =  db_parameters["serializer"]
                serializer_class = custom_serializer(data=databases)
        except Exception as e:
            logging.debug(e)
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
        else:
            if serializer_class.is_valid():
                try:
                    if db_parameters["dbname"]=="studentdatabases":
                        serializer_class = create_studentdatabase(serializer_class)
                        setup_student_db(databases,serializer_class,schemas)
                        serializer_class.save()
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                    else:
                        serializer_class.save()
                        return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                except Exception as e:
                    if "duplicate key" in str(e.__cause__) or "already exists" in str(e.__cause__):
                        print(e)
                        return HttpResponse(status=status.HTTP_409_CONFLICT)
                    elif db_parameters["dbname"]=="studentdatabases":
                        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        return HttpResponse(status=status.HTTP_406_NOT_ACCEPTABLE)
            else:
                logging.debug(serializer_class.errors)

                if "must make a unique set" in str(serializer_class.errors):
                  	return JsonResponse(serializer_class.errors, status=status.HTTP_409_CONFLICT)
                else:
                  	return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def delete_single_response(request,requested_pk,db_parameters):

        if check_role(request,admin) or (check_role(request,teacher) and db_parameters["dbname"] == "courses" ):

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
                  else:
                    instance.delete()
                except Exception as e:
                  logging.debug(e)
                  connection.autocommit = False # in case django does not do this properly
                  if "protected foreign key" in str(e.__cause__):
                    return HttpResponse(status=status.HTTP_409_CONFLICT)
                  elif db_parameters["dbname"] == "studentdatabases":
                    return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                else:
                  return HttpResponse(status=status.HTTP_202_ACCEPTED)
        else:
                return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

@csrf_exempt
def search_on_name(request,search_value,dbname):

  db_parameters = get_db_parameters(dbname)

  results = None

  if check_role(request,teacher) or db_parameters["dbname"] == "courses" or db_parameters["dbname"] == "schemas":

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
     elif db_parameters["dbname"] == "schemas":
      results = db_parameters["db"].objects.filter(name__icontains=search_value)

     #serialize data
     serializer = db_parameters["serializer"](results,many=True)

    except Exception as e:
      return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    else:
      return JsonResponse(serializer.data , safe=False)

  else:
    return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def get_db_parameters(dbname):

        db_parameters = {"dbname": dbname}

        if dbname=="courses":
            db_parameters["serializer"] = CoursesSerializer
            db_parameters["db"] = Courses
        elif dbname=="dbmusers":
            logging.debug("yup hier wel")
            db_parameters["serializer"] = dbmusersSerializer
            db_parameters["db"] =dbmusers
        elif dbname=="tas":
            db_parameters["serializer"] = TasSerializer
            db_parameters["db"] = TAs
        elif dbname=="schemas":
            db_parameters["serializer"] = schemasserializer
            db_parameters["db"] = schemas
        elif dbname=="studentdatabases":
            db_parameters["serializer"] = StudentdatabasesSerializer
            db_parameters["db"] = Studentdatabases

        return db_parameters

@csrf_exempt
def singleview(request,pk,dbname):

   db_parameters = get_db_parameters(dbname)

   if request.method == 'GET':
        return get_single_response(request,pk,db_parameters)
   elif request.method == 'DELETE':
        return delete_single_response(request,pk,db_parameters)
   else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@csrf_exempt
def baseview(request,dbname):

  db_parameters = get_db_parameters(dbname)

  if request.method == 'GET':
        return get_base_response(request,db_parameters)
  elif request.method == 'POST':
        return post_base_response(request,db_parameters)
  else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@csrf_exempt
@require_GET
def dump(request, pk):
  if not check_role(request, student):
    return unauthorised

  try:
    db = Studentdatabases.objects.get(dbid=pk)
  except Studentdatabases.DoesNotExist as e:
    return not_found

  if not check_role(request, teacher) and request.session["role"] != db.fid:
    return unauthorised

  response = schemaWriter.dump(db.__dict__)
  return HttpResponse(response, content_type="application/sql")


#-----------------------------------------LOGIN-------------------------------------------------

unauthorised = HttpResponse()
unauthorised.status_code = 401

bad_request = HttpResponse()
bad_request.status_code = 400

not_found = HttpResponse();
not_found.status_code = 404

def check_role(request, role):
    try:
        if(int(request.session["role"]) <= role):
            return True
    except Exception:
        pass
    return False

def get_queryset(self):
   logging.debug(self.request)

def index(request):
    template = loader.get_template('index.html')
    number=3
    context = {
        'number': number,
        'range': range(number)
    }
    return HttpResponse(template.render(context, request))

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
            return render(request, 'login.html', {'form': LoginForm(), 'message': "Registration succesful; try to login"})

    form = RegisterForm()
    return render(request, 'register.html', {'form': form})

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
                    return render(request, 'login.html', {'form': LoginForm, 'message': "Please verify your email first"})

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

#Function for debug purposes only; just returns a small web page with the a button to log out.
@require_GET
def logout_button(request):
    return HttpResponse("<!DOCTYPE html><html><body><form action='logout' method='POST'><input type='submit' value='logout'/></form></body></html>", content_type='text/html')

#Function to change the role of users
#A little bit too complicated for the amount of roles that we have, but should be expandable to an infite amount of roles.
@require_POST
def set_role(request):
    #Always check in case session is not set
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

    #if you are not admin, make sure you don't demote an admin or something
    if request.session["role"] > 0:
        try:
            user = dbmusers.objects.get(email=body["user"], role__gt=request.session["role"])
            user.role = body["role"]
            user.save()
        except dbmusers.DoesNotExist as e:
            #means no user found with low enough permissions that you can edit them
            return not_found
    else:
        #admins don't care
        try:
            user = dbmusers.objects.get(email=body["user"])
            user.role = body["role"]
            user.save()
        except dbmusers.DoesNotExist as e:
            #user may not exist
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
  return render(request, 'login.html', {"form": LoginForm(), "message": "Your account has been verified and you can now log in"})
