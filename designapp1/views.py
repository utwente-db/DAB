# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import viewsets
from django.shortcuts import render
from django.template import loader
from rest_framework import viewsets

from rest_framework.views import APIView
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_framework import status
from django.db import connection
from psycopg2.extensions import AsIs
import psycopg2 as db

#DESIGN PROJECT

from .models import Roles
from .models import Studentdatabases
from .models import Courses
from .models import TAs

from .serializers import RolesSerializer
from .serializers import CoursesSerializer
from .serializers import StudentdatabasesSerializer
from .serializers import TasSerializer


from django.views.decorators.http import require_http_methods, require_POST, require_GET, require_safe
from django.http import HttpResponse, HttpResponseRedirect

import json
from designapp1 import statements
from .statements import create_db

from .forms import *
from . import hash
import logging

logging.basicConfig(
       level = logging.DEBUG,
       format = '%(asctime)s %(levelname)s %(message)s',
)

# DESIGN PROJECT

class RolesView(viewsets.ModelViewSet):
	queryset = Roles.objects.all()
	serializer_class = RolesSerializer

class CoursesView(viewsets.ModelViewSet):
        queryset = Courses.objects.all()
        serializer_class = CoursesSerializer

class StudentdatabasesView(viewsets.ModelViewSet):
        queryset = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer

class TasView(viewsets.ModelViewSet):
        queryset = TAs.objects.all()
        serializer_class = TasSerializer

#Order:
#studentdatabases
#courses
#roles
#tas

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
  
  logging.debug('teswt3')
  if request.method == 'GET':
        databases = Studentdatabases.objects.get(dbid=pk)
        serializer_class = StudentdatabasesSerializer(databases, many=False)
        return JsonResponse(serializer_class.data, safe=False)
  elif request.method == 'DELETE':

        try:
              db_name = Studentdatabases.objects.get(pk=pk)
        except Studentdatabases.DoesNotExist:
              return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        logging.debug(db_name.databasename)
        logging.debug(db_name.username)
        with connection.cursor() as cursor:
             cursor.execute("DROP DATABASE %s;",[AsIs(db_name.databasename)])
             cursor.execute("DROP USER  %s;",[AsIs(db_name.username)])
        db_name.delete()
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)
  else:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

@csrf_exempt
def studentdatabasesbase(request):

   global db_host, db_user, db_port, db_password

   if request.method == 'GET':
        databases = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer(databases, many=True)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'POST':
        databases = JSONParser().parse(request)
        serializer_class = StudentdatabasesSerializer(data=databases)
        if serializer_class.is_valid():
            #CREATE NEW DATABASE
            db_name = serializer_class.validated_data['databasename']
            username = serializer_class.validated_data['username']
            password = serializer_class.validated_data['password']

            with connection.cursor() as cursor:
                cursor.execute("CREATE USER %s WITH UNENCRYPTED PASSWORD '%s';",[AsIs(username),AsIs(password)])
                cursor.execute("CREATE DATABASE %s WITH OWNER %s;",[AsIs(db_name),AsIs(username)])
                cursor.execute("GRANT ALL PRIVILEGES ON DATABASE %s TO %s;",[AsIs(db_name),AsIs(username)])
                cursor.execute("REVOKE ALL PRIVILEGES ON DATABASE %s FROM public;",[AsIs(db_name)])

            conn = connect(db_name)

            with conn.cursor() as cur:
                cur.execute("DROP SCHEMA public CASCADE;")
                cur.execute("CREATE SCHEMA private;")
                cur.execute("ALTER SCHEMA private OWNER TO %s;",[AsIs(username)])

            serializer_class.save()
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        return JsonResponse(customer_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
     
   else:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)

@csrf_exempt
def coursesbase(request):

  if request.method == 'GET':
        courses = Courses.objects.all()
        serializer_class = CoursesSerializer(courses, many=True)
        return JsonResponse(serializer_class.data, safe=False)
  elif request.method == 'POST':
        courses = JSONParser().parse(request)
        serializer_class = CoursesSerializer(data=courses)
        if serializer_class.is_valid():
            serializer_class.save()
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)
  

@csrf_exempt
def coursessingle(request,pk):

   if request.method == 'GET':
        courses = Courses.objects.get(courseid=pk)
        serializer_class = CoursesSerializer(courses, many=False)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'DELETE':

        try:
              instance = Courses.objects.get(pk=pk)
        except Courses.DoesNotExist:
              return HttpResponse(status=status.HTTP_404_NOT_FOUND)

        instance.delete()
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)

@csrf_exempt
def rolesbase(request):

    if request.method == 'GET':
        roles = Roles.objects.all()
        serializer_class = RolesSerializer(roles, many=True)
        return JsonResponse(serializer_class.data, safe=False)
    elif request.method == 'POST':
        roles = JSONParser().parse(request)
        serializer_class = RolesSerializer(data=roles)
        if serializer_class.is_valid():
            serializer_class.save()
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)

@csrf_exempt
def rolessingle(request,pk):

   if request.method == 'GET':
        roles = Roles.objects.get(id=pk)
        serializer_class = RolesSerializer(roles, many=False)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'DELETE':

        try:
              instance = Roles.objects.get(pk=pk)
        except Roles.DoesNotExist:
              return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        instance.delete()
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)

@csrf_exempt
def tasbase(request):

   if request.method == 'GET':
        tas = TAs.objects.all()
        serializer_class = TAsSerializer(tas, many=True)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'POST':
        tas = JSONParser().parse(request)
        serializer_class = TAsSerializer(data=tas)
        if serializer_class.is_valid():
            serializer_class.save()
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        return JsonResponse(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)

@csrf_exempt
def tassingle(request,pk):

   if request.method == 'GET':
        TAs = TAs.objects.get(taid=pk)
        serializer_class = TAsSerializer(TAs, many=False)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'DELETE':

        try:
              instance = TAs.objects.get(pk=pk)
        except TAs.DoesNotExist:
              return HttpResponse(status=status.HTTP_404_NOT_FOUND)
        instance.delete()
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)

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
			role = Roles(role=3, email=data["mail"], password=password, maxdatabases=0)
			role.save()
			return render(request, 'login.html', {'form': LoginForm(), 'message': "Registration succesful; try to login"})

	form = RegisterForm()
	return render(request, 'register.html', {'form': form})

@require_http_methods(["GET", "POST"])
def login(request):
	incorrect_message = "No such user/password combination found"
	if request.method == "POST":
		form = LoginForm(request.POST)
		if form.is_valid():
			data = form.cleaned_data
			try:
				user = Roles.objects.get(email=data["mail"])

				if hash.verify(user.password, data["password"]):
					request.session["user"] = user.id
					request.session["role"] = user.role
					request.session.modified = True
					return HttpResponseRedirect("/")
				else:
					return render(request, 'login.html', {'form': form, 'message': incorrect_message})
			except Roles.DoesNotExist:
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
			user = Roles.objects.get(email=body["user"], role__gt=request.session["role"])
			user.role = body["role"]
			user.save()
		except Roles.DoesNotExist as e:
			#means no user found with low enough permissions that you can edit them
			return not_found
	else:
		#admins don't care
		try:
			user = Roles.objects.get(email=body["user"])
			user.role = body["role"]
			user.save()
		except Roles.DoesNotExist as e:
			#user may not exist
			return not_found
	return HttpResponse()

@require_GET
def whoami(request):
	if not check_role(request, 3):
		return not_found

	user = Roles.objects.get(id=request.session["user"])
	response = {
	"id": user.id,
	"email": user.email,
	"role": user.role
	}
	
	response = json.JSONEncoder().encode(response)
	return HttpResponse(str(response), content_type="application/json")
