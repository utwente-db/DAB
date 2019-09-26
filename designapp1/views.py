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

# DESIGN PROJECT

class dbmusersView(viewsets.ModelViewSet):
	queryset = dbmusers.objects.all()
	serializer_class = dbmusersSerializer

class CoursesView(viewsets.ModelViewSet):
	queryset = Courses.objects.all()
	serializer_class = CoursesSerializer

class StudentdatabasesView(viewsets.ModelViewSet):
	queryset = Studentdatabases.objects.all()
	serializer_class = StudentdatabasesSerializer

class TasView(viewsets.ModelViewSet):
	queryset = TAs.objects.all()
	serializer_class = TasSerializer

class schemasView(viewsets.ModelViewSet):
	queryset = schemas.objects.all()
	serializer_class = schemasserializer

#REST RESPONSES

def defaultresponse(request):
        return index(request=request)

def get_base_response(request,dbname,serializer):
        if check_role(request,teacher):
          try:
                 logging.debug('in try method')
                 database = dbname.objects.all()
                 logging.debug('deze gaat goed')
                 serializer_class = serializer(database, many=True)
          except Exception as e:
                 logging.debug(e)
                 return HttpResponse(status=status.HTTP_404_NOT_FOUND)
          else:
                 return JsonResponse(serializer_class.data, safe=False)
        else:
                 return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def get_single_response(request,pk):

          db_id = None
          current_id = request.session['user']

          database = None
          try:
          		#TODO: stop doing whatever the fuck this is before I jump of the sky
                if "courses" in request.path_info:
                  database = Courses.objects.get(courseid=pk)
                  serializer_class = CoursesSerializer(database, many=False)
                  db_id = database.fid.id
                elif "dbmusers" in request.path_info:
                  database = dbmusers.objects.get(id=pk)
                  serializer_class = dbmusersSerializer(database, many=False)
                  db_id = pk
                elif "tas" in request.path_info:
                  database = TAs.objects.get(taid=pk)
                  serializer_class = TasSerializer(database, many=False)
                  db_id = database.studentid.id
                elif "studentdatabases" in request.path_info:
                  database = Studentdatabases.objects.get(dbid=pk)
                  serializer_class = StudentdatabasesSerializer(database, many=False)
                  db_id = database.fid.id
                elif "schemas" in request.path_info:
                  database = schemas.objects.get(id=pk)
                  serializer_class = schemasserializer(database, many=False)
          except Exception as e:
                logging.debug(e)
                return HttpResponse(status=status.HTTP_404_NOT_FOUND)
          else:
                if str(db_id) == str(current_id) or check_role(request,teacher) or "schemas" in request.path_info:
                  return JsonResponse(serializer_class.data, safe=False)
                else:
                  return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def post_base_response(request,serializer):
        if check_role(request,teacher) or "dbmusers" in request.path_info or ("studentdatabases" in request.path_info and check_role(request,student)):

          try:
            databases = JSONParser().parse(request)
            if "dbmusers" in request.path_info:
              if not re.match(r'.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl', databases["email"]):
                return HttpResponse("only utwente email address can be used",status=status.HTTP_406_NOT_ACCEPTABLE)
              unhashed_password = databases['password']
              databases['password'] = hash.make(unhashed_password)
              databases["token"] = hash.token()
              mail.send_verification(databases)
              if check_role(request,admin):
                databases['role'] = databases['role'] #TODO: why is this line here
              elif check_role(request,teacher):
                if int(databases['role'])<teacher:
                  databases['role']=teacher
              elif check_role(request,student): #TODO: why is this if statement here if it does the same as the else?
                if int(databases['role'])<student:
                  databases['role']=student
              else:
                databases['role']=student
              serializer_class = serializer(data=databases)
          except Exception as e:
              logging.debug(e)
              return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
          else:
              if serializer_class.is_valid():
                  try:
                    serializer_class.save()
                    return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
                  except IntegrityError as e:
                    if "duplicate key" in str(e.__cause__):
                      return HttpResponse(status=status.HTTP_409_CONFLICT)
                    else:
                      return HttpResponse(status=status.HTTP_406_NOT_ACCEPTABLE)
              else:
                  return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
                return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def delete_single_response(request,dbname,instance_pk):

        current_id = request.session['user']
        if check_role(request,admin):

          try:
                instance = dbname.objects.get(pk=instance_pk)
          except:
                return HttpResponse(status=status.HTTP_404_NOT_FOUND)
          else:
                try:
                  instance.delete()
                except Exception as e:
                  if "protected foreign key" in str(e.__cause__):
                    return HttpResponse(status=status.HTTP_409_CONFLICT)
                  else:
                    return HttpResponse(status=status.HTTP_406_NOT_ACCEPTABLE)
                else:
                  return HttpResponse(status=status.HTTP_202_ACCEPTED)
        else:
                return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

def connect(db_name):
        #Why
        db_host = connection.settings_dict["HOST"]
        db_user = connection.settings_dict["USER"]
        db_port = connection.settings_dict["PORT"]
        db_password = connection.settings_dict["PASSWORD"]

        conn = db.connect(user=db_user,
                          password=db_password,
                          host=db_host,
                          port=db_port,
                          database=db_name)

        return conn


@csrf_exempt
def studentdatabasessingle(request,pk):

  if request.method == 'GET':
        return get_single_response(request,pk)
  elif request.method == 'DELETE':

     if check_role(request,admin):

        try:
              db_name = Studentdatabases.objects.get(pk=pk)
        except:
              return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        else:
             try:
                  with connection.cursor() as cursor:
                        connection.autocommit = False #want to make sure we can't be outrun
	                #make sure no one can connect to the database
                        cursor.execute("UPDATE pg_database SET datallowconn = 'false' WHERE datname = '%s'", [AsIs(db_name.databasename)])
	                #drop any existing connections
                        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%s'", [AsIs(db_name.databasename)])
	                #actually drop the database
                        cursor.execute("DROP DATABASE %s;",[AsIs(db_name.databasename)])
	                #kick out the user just to be sure
                        cursor.execute("SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = '%s'", [AsIs(db_name.username)])
	                #Drop the user
                        cursor.execute("DROP USER  %s;",[AsIs(db_name.username)])
                        connection.commit()
                        connection.autocommit = True
             except:
                  connection.autocommit = False #just in case django doesn't do this properly
                  return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
             else:
                  db_name.delete() #ONLY delete the row when the sql is succesfull
                  return HttpResponse(status=status.HTTP_204_NO_CONTENT)
     else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)

  else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@csrf_exempt
def studentdatabasesbase(request):

   global db_host, db_user, db_port, db_password

   if request.method == 'GET':
        return get_base_response(request,Studentdatabases,StudentdatabasesSerializer)
   elif request.method == 'POST':
     if check_role(request,student):
        try:
               databases = JSONParser().parse(request)
               serializer_class = StudentdatabasesSerializer(data=databases)
        except:
               return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
        else:
            if serializer_class.is_valid():
            #CREATE NEW DATABASE
               db_name = serializer_class.validated_data['databasename']
               username = serializer_class.validated_data['username']
               password = serializer_class.validated_data['password']
               course_id = serializer_class.validated_data['course']
               try:
	               with connection.cursor() as cursor:
	                  cursor.execute("CREATE USER %s WITH UNENCRYPTED PASSWORD '%s';",[AsIs(username),AsIs(password)])
	                  cursor.execute("CREATE DATABASE %s WITH OWNER %s;",[AsIs(db_name),AsIs(username)])
	                  cursor.execute("GRANT ALL PRIVILEGES ON DATABASE %s TO %s;",[AsIs(db_name),AsIs(username)])
	                  cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE %s FROM public;",[AsIs(db_name)])

	               conn = connect(db_name)

	               with conn.cursor() as cur:
                        cur.execute("DROP SCHEMA public CASCADE;")
                        cur.execute("CREATE SCHEMA %s;", [AsIs(username)])
                        cur.execute("ALTER SCHEMA %s OWNER TO %s;",[AsIs(username), AsIs(username)])
#                        cur.execute("SET search_path TO %s;",[AsIs(db_name)])
	               conn.commit()
               except Exception as e:
                       logging.debug(e)
                       return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
               else:
                       serializer_class.save()

                       all_table_schemas = schemas.objects.filter(course=course_id)
                       for single_schema in all_table_schemas:
                         logging.debug(single_schema.sql)
                         schemaWriter.write(databases,single_schema.sql)
                       return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
            else:
               return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
     else:
        return HttpResponse(status=status.HTTP_401_UNAUTHORIZED)
   else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@csrf_exempt
def singleview(request,pk):

   if request.method == 'GET':
        return get_single_response(request,pk)
   elif request.method == 'DELETE':
        if "courses" in request.path_info:
               return delete_single_response(request,Courses,pk)
        elif "dbmusers" in request.path_info:
               return delete_single_response(request,dbmusers,pk)
        elif "tas" in request.path_info:
               return delete_single_response(request,TAs,pk)
        elif "schemas" in request.path_info:
               return delete_single_response(request,schemas,pk)
   else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@csrf_exempt
def baseview(request):
  logging.debug('begin')
  if request.method == 'GET':
        if "courses" in request.path_info:
            return get_base_response(request,Courses,CoursesSerializer)
        if "dbmusers" in request.path_info:
            return get_base_response(request,dbmusers,dbmusersSerializer)
        if "tas" in request.path_info:
            return get_base_response(request,TAs,TasSerializer)
        if "schemas" in request.path_info:
            logging.debug('goede if')
            return get_base_response(request,schemas,schemasserializer)

  elif request.method == 'POST':
        if "courses" in request.path_info:
            return post_base_response(request,CoursesSerializer)
        if "dbmusers" in request.path_info:
            return post_base_response(request,dbmusersSerializer)
        if "tas" in request.path_info:
            return post_base_response(request,TasSerializer)
        if "schemas" in request.path_info:
            return post_base_response(request,schemasserializer)
  else:
        return HttpResponse(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@csrf_exempt
@require_GET
def dump(request, pk):
  if not check_role(request, student):
    return unauthorised

  try:
    db = Studentdatabases.objects.get(dbid=pk)
  #TODO: figure out which exception
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
	"role": user.role
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
