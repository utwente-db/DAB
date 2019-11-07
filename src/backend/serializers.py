from rest_framework import serializers

from .models import *
from .settings import *

"""Serializers.py: contains classes to convert switch between models and JSON objects.

These classes convert the correcsponding model to a JSON object, and can generate the corresponding object from a JSON model.
"""


class CoursesSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        create = kwargs.pop('create', False)
        super(CoursesSerializer, self).__init__(*args, **kwargs)

        if not create:
            self.fields.pop('schema')

    class Meta:
        model = Courses
        fields = ('courseid', 'fid', 'coursename', 'info', 'schema', 'active', 'databases')


class StudentdatabasesDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Studentdatabases
        fields = ('dbid', 'fid', 'databasename', 'course', 'username', 'password')


class StudentdatabasesSerializer(serializers.ModelSerializer):

    email = serializers.SerializerMethodField('get_email')
    role  = serializers.SerializerMethodField('get_role')

    def get_email(self,StudentdatabasesSerializer):
        return StudentdatabasesSerializer.email

    def get_role(self,StudentdatabasesSerializer):
        role = StudentdatabasesSerializer.role

        if role == admin:
            return "admin"
        elif role == teacher:
            return "teacher"
        elif role == student:
            return "student"

    class Meta:
        model = Studentdatabases
        fields = '__all__'


class dbmusersSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        create = kwargs.pop('create', False)
        super(dbmusersSerializer, self).__init__(*args, **kwargs)

        if not create:
            self.fields.pop('token')
            self.fields.pop('password')
            self.fields.pop('tokenExpire')

    class Meta:
        model = dbmusers
        fields = ('id', 'email', 'role', 'password', 'verified', 'token', 'tokenExpire')


class TasSerializer(serializers.ModelSerializer):
    class Meta:
        model = TAs
        fields = '__all__'
