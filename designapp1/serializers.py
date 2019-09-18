from rest_framework import serializers
from .models import Roles
from .models import Courses
from .models import Studentdatabases
from .models import TAs

class CoursesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Courses
                fields = '__all__'
class StudentdatabasesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Studentdatabases
                fields = '__all__'

class RolesSerializer(serializers.ModelSerializer):
       class Meta:
                model = Roles
                fields = '__all__'

class TasSerializer(serializers.ModelSerializer):
       class Meta:
               model = TAs
               fields = '__all__'
