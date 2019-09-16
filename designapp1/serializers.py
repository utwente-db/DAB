
from rest_framework import serializers
from .models import Roles
from .models import Courses
#from .models import Studentgroup
from .models import Studentdatabases

from .statements import create_db
from .statements import delete_db


import logging

logging.basicConfig(
       level = logging.DEBUG,
       format = '%(asctime)s %(levelname)s %(message)s',
)

class CoursesSerializer(serializers.ModelSerializer):
	class Meta:
		model = Courses
		fields = ('courseid','fid','coursename','students','info')
class StudentdatabasesDeleteSerializer(serializers.ModelSerializer):
        class Meta:
                model = Studentdatabases
                fields = ('dbid','fid','databasename','course','username','password')

class StudentdatabasesSerializer(serializers.ModelSerializer):
#       def rest_view(request):
#                logging.debug("hier2")


       def create(self, validated_data):
                logging.debug("aslkj")
                db_name = self.validated_data['databasename']
                db_user = self.validated_data['username']
                db_pass = self.validated_data['password']
                create_db(db_name,db_user,db_pass) 
                return Studentdatabases.objects.create(**validated_data)
#       def delete(self, request):
#                logging.debug("request:")
#                db_name = self.request['databasename']
#                db_user = self.request['username']
#                logging.debug(db_user)
#                logging.debug(db_name)
#                delete_db(db_name)
#                delete_user(db_user)
#                return "OK"
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

