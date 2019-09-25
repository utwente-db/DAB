from rest_framework import serializers
from .models import *

class CoursesSerializer(serializers.ModelSerializer):
	class Meta:
		model = Courses
		fields = ('courseid','fid','coursename','students','info')
class StudentdatabasesDeleteSerializer(serializers.ModelSerializer):
        class Meta:
                model = Studentdatabases
                fields = ('dbid','fid','databasename','course','username','password')

class StudentdatabasesSerializer(serializers.ModelSerializer):
<<<<<<< HEAD
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
=======
>>>>>>> freek-frontend-beun
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
