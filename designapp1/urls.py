from django.conf.urls import url, include
from django.urls import path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('Roles', views.RolesView)
router.register('Courses', views.CoursesView)
router.register('Studentdatabases', views.StudentdatabasesView)
router.register('Studentgroup', views.StudentgroupView)


urlpatterns = [
   url('', include(router.urls)),
   path('create_db', views.create_db, name='create_db')
]


