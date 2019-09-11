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


