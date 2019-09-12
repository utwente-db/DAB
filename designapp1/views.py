# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
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
from django.http import HttpResponse

import json
from designapp1 import statements

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