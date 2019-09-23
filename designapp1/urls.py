from django.conf.urls import url, include
from django.urls import path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('Roles', views.RolesView)
router.register('Courses', views.CoursesView)
router.register('Studentdatabases', views.StudentdatabasesView)
router.register('Tas', views.TasView)


urlpatterns = [
   # url(r'^studentdatabases/(?P<pk>[a-z0-9]+)$', views.studentdatabases),
   url('', include(router.urls)),

   #Specific databases

   #Studentdatabases
   url(r'^studentdatabases/(?P<pk>[a-z0-9]+)$', views.studentdatabasessingle),
   url(r'^studentdatabases/$', views.studentdatabasesbase),
   #Courses
   url(r'^courses/(?P<pk>[a-z0-9]+)$', views.coursessingle),
   url(r'^courses/$', views.coursesbase),
   #TAs
   url(r'^tas/(?P<pk>[a-z0-9]+)$', views.rolessingle),
   url(r'^tas/$', views.rolesbase),
   #Roles
   url(r'^roles/(?P<pk>[a-z0-9]+)$', views.rolessingle),
   url(r'^roles/$', views.rolesbase),

   #Login

   # path('create_db', views.create_db, name='create_db'),
   # path('delete_db', views.delete_db, name='delete_db'),
   # path('delete_user', views.delete_user, name='delete_user'),
   # path('delete_db_with_owner', views.delete_db_with_owner, name='delete_db_with_owner'),
   # path('get_users', views.get_users, name='get_users'),
   path('home', views.home, name="home"),
   path('login', views.login, name="login"),
   path('register', views.register, name="register"),
   path('logout', views.logout, name="logout"),
   path('logout_button', views.logout_button, name='logout_button'),
   path('set_role', views.set_role, name='set_role'),
   path('whoami', views.whoami, name='whoami'),
]
