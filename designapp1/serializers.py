from rest_framework import serializers
from .models import *

class CoursesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Courses
                fields = '__all__'
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
