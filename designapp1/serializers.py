from rest_framework import serializers
from .models import Roles
from .models import Courses
from .models import Studentgroup
from .models import Studentdatabases

class CoursesSerializer(serializers.ModelSerializer):
	class Meta:
		model = Courses
		fields = ('fid','coursename','students','info')
class StudentdatabasesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Studentdatabases
                fields = ('dbid','databasename','course','username','password')

class StudentgroupSerializer(serializers.ModelSerializer):
       class Meta:
                model = Studentgroup
                fields = ('fid','dbid')

class RolesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Roles
                fields = ('id','role','email','password','maxdatabases')

