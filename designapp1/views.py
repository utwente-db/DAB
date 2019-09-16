# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.views import APIView
from django.shortcuts import render
from django.template import loader
from rest_framework import viewsets
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_framework import status
from django.db import connection
from psycopg2.extensions import AsIs

#OWN PROJECT

from .models import Roles
from .models import Studentdatabases
#from .models import Studentgroup
from .models import Courses

from .serializers import RolesSerializer
from .serializers import CoursesSerializer
#from .serializers import StudentgroupSerializer
from .serializers import StudentdatabasesSerializer
from .serializers import StudentdatabasesDeleteSerializer


from django.views.decorators.http import require_http_methods, require_POST, require_GET, require_safe
from django.http import HttpResponse, HttpResponseRedirect

import json
from .statements import delete_db
from .statements import delete_user

from .forms import *
from . import hash
import logging

logging.basicConfig(
       level = logging.DEBUG,
       format = '%(asctime)s %(levelname)s %(message)s',
)

# Create your views here.

class RolesView(viewsets.ModelViewSet):
	queryset = Roles.objects.all()
	serializer_class = RolesSerializer

class CoursesView(viewsets.ModelViewSet):
        queryset = Courses.objects.all()
        serializer_class = CoursesSerializer


#class StudentgroupView(viewsets.ModelViewSet):
#        queryset = Studentgroup.objects.all()
#        serializer_class = StudentgroupSerializer

@csrf_exempt
def studentdatabases(request,pk):

   if request.method == 'GET':
        databases = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer(databases, many=True)
        return JsonResponse(serializer_class.data, safe=False)
   elif request.method == 'POST':
        databases = JSONParser().parse(request)
        serializer_class = StudentdatabasesSerializer(data=databases)
        if serializer_class.is_valid():
            serializer_class.save()
            return JsonResponse(serializer_class.data, status=status.HTTP_201_CREATED)
        return JsonResponse(customer_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
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
#        delete_user(db_name.username)
        return HttpResponse(status=status.HTTP_204_NO_CONTENT)



class StudentdatabasesView(viewsets.ModelViewSet):
#        http_method_names = ['GET', 'PUT', 'DELETE']
        queryset = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer

#        def register(request):
#              form = RegisterForm()
#              if request.method == "DELETE":
#                   form = RegisterForm(request.POST) #if no files
#                   if form.is_valid():
#                   #do something if form is valid
#                       context = {
#                             'form': form
#                       }
#              return render(request, "template.html", context)

#        def delete(self, request, pk):
#              serializer_class = Studentdatabases
#              for key in request.DELETE:
#              logging.debug(request.headers['username'])
#                  value = request.POST[key]
#                  logging.debug(value)

#              logging.debug(len(request))
#              db_name = request.headers['databasename']
#              db_user = request.headers['username']
#              logging.debug(db_user)
#              logging.debug(db_name)
#              delete_db("ywre")
#              delete_user("ywre")
#              return HttpResponse("OK")

def check_role(request, role):
	try:
		print(request.session["role"])
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
			role = Roles(role=0, email=data["mail"], password=password, maxdatabases=0)
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
			user = Roles.objects.get(email=data["mail"])

			if hash.verify(user.password, data["password"]):
				request.session["user"] = user.id
				request.session["role"] = user.role
				request.session.modified = True
				return HttpResponseRedirect("/")
			else:
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
