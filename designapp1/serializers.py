from rest_framework import serializers
from .models import Roles
from .models import Courses
#from .models import Studentgroup
from .models import Studentdatabases

from .statements import create_db

class CoursesSerializer(serializers.ModelSerializer):
	class Meta:
		model = Courses
		fields = ('courseid','fid','coursename','students','info')
class StudentdatabasesSerializer(serializers.ModelSerializer):
       def create(self, validated_data):
                db_name = self.validated_data['databasename']
                db_user = self.validated_data['username']
                db_pass = self.validated_data['password']
                create_db(db_name,db_user,db_pass) 
                return Studentdatabases.objects.create(**validated_data)
       def delete(self, request, *args, **kwargs):
                instance = self.get_object()
       class Meta:
                model = Studentdatabases
                fields = ('dbid','fid','databasename','course','username','password')

#class StudentgroupSerializer(serializers.ModelSerializer):
#       class Meta:
#                model = Studentgroup
#                fields = ('fid','dbid')

class RolesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Roles
                fields = ('id','role','email','password','maxdatabases')

