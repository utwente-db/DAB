# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import viewsets
from django.shortcuts import render
from django.template import loader
from rest_framework import viewsets


#OWN PROJECT

from .models import Roles
from .models import Studentdatabases
#from .models import Studentgroup
from .models import Courses

from .serializers import RolesSerializer
from .serializers import CoursesSerializer
#from .serializers import StudentgroupSerializer
from .serializers import StudentdatabasesSerializer

from django.views.decorators.http import require_http_methods, require_POST, require_GET, require_safe
from django.http import HttpResponse, HttpResponseRedirect

import json
from designapp1 import statements

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

class StudentdatabasesView(viewsets.ModelViewSet):
        queryset = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer

unauthorised = HttpResponse()
unauthorised.status_code = 401

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

def test(request):
	c = Courses.objects.get(courseid=3)
	print(c.assistants.all())
	return HttpResponse()