from rest_framework import serializers

from .models import *


class CoursesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Courses
        fields = ('courseid', 'fid', 'coursename', 'info')


class StudentdatabasesDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Studentdatabases
        fields = ('dbid', 'fid', 'databasename', 'course', 'username', 'password')


class StudentdatabasesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Studentdatabases
        fields = '__all__'


class dbmusersSerializer(serializers.ModelSerializer):
    class Meta:
        model = dbmusers
        fields = '__all__'


class TasSerializer(serializers.ModelSerializer):
    class Meta:
        model = TAs
        fields = '__all__'


class schemasserializer(serializers.ModelSerializer):
    class Meta:
        model = schemas
        fields = '__all__'
