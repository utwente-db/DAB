from rest_framework import serializers

from .models import *


class CoursesSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        create = kwargs.pop('create', False)
        super(CoursesSerializer, self).__init__(*args, **kwargs)

        if not create:
            self.fields.pop('schema')

    class Meta:
        model = Courses
        fields = ('courseid', 'fid', 'coursename', 'info', 'schema','active','databases')


class StudentdatabasesDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Studentdatabases
        fields = ('dbid', 'fid', 'databasename', 'course', 'username', 'password')


class StudentdatabasesSerializer(serializers.ModelSerializer):
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

    class Meta:
        model = dbmusers
        fields = ('id', 'email', 'role', 'password', 'verified', 'token')


class TasSerializer(serializers.ModelSerializer):
    class Meta:
        model = TAs
        fields = '__all__'

