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
from .models import Studentgroup
from .models import Courses

from .serializers import RolesSerializer
from .serializers import CoursesSerializer
from .serializers import StudentgroupSerializer
from .serializers import StudentdatabasesSerializer

from django.views.decorators.http import require_http_methods, require_POST, require_GET, require_safe
from django.http import HttpResponse, HttpResponseRedirect

import json
from designapp1 import statements

from .forms import *
from . import hash

# Create your views here.

class RolesView(viewsets.ModelViewSet):
	queryset = Roles.objects.all()
	serializer_class = RolesSerializer

class CoursesView(viewsets.ModelViewSet):
        queryset = Courses.objects.all()
        serializer_class = CoursesSerializer

class StudentgroupView(viewsets.ModelViewSet):
        queryset = Studentgroup.objects.all()
        serializer_class = StudentgroupSerializer

class StudentdatabasesView(viewsets.ModelViewSet):
        queryset = Studentdatabases.objects.all()
        serializer_class = StudentdatabasesSerializer

@require_POST
def create_db(request):
	body = json.loads(request.body.decode("utf-8"))
	statements.create_db(body["name"], body["owner"], body["password"])
	return HttpResponse("")

@require_POST
def delete_db(request):
	body = json.loads(request.body.decode("utf-8"))
	statements.delete_db(body["name"])
	return HttpResponse("")

@require_POST
def delete_user(request):
	body = json.loads(request.body.decode("utf-8"))
	statements.delete_user(body["name"])
	return HttpResponse("")

@require_POST
def delete_db_with_owner(request):
	body = json.loads(request.body.decode("utf-8"))
	statements.delete_db_with_owner(body["name"])
	return HttpResponse("")

@require_GET
def get_users(request):
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
			return HttpResponseRedirect("/")

	form = RegisterForm()
	return render(request, 'register.html', {'form': form})

@require_http_methods(["GET", "POST"])
def login(request):
	if request.method == "POST":
		form = LoginForm(request.POST)
		if form.is_valid():
			data = form.cleaned_data
			
			return HttpResponseRedirect("/")

	form = LoginForm()
	return render(request, 'login.html', {'form': form, message: ""})

@require_POST
def logout(request):
	pass