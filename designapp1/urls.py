from django.conf.urls import url, include
from django.urls import path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('dbmusers', views.dbmusersView)
router.register('Courses', views.CoursesView)
router.register('Studentdatabases', views.StudentdatabasesView)
router.register('Tas', views.TasView)
router.register('schemas', views.schemasView)


urlpatterns = [

   #General
   #url('', include(router.urls)),

   #Specific databases

   #Studentdatabases
   url(r'^studentdatabases/(?P<pk>[a-z0-9]+)/?$', views.studentdatabasessingle),
   url(r'^studentdatabases/$', views.studentdatabasesbase),
   #Courses
   url(r'^courses/(?P<pk>[a-z0-9]+)/?$', views.singleview),
   url(r'^courses/$', views.baseview),
   #TAs
   url(r'^tas/(?P<pk>[a-z0-9]+)/?$', views.singleview),
   url(r'^tas/$', views.baseview),
   #dbmusers
   url(r'^dbmusers/(?P<pk>[a-z0-9]+)/?$', views.singleview),
   url(r'^dbmusers/$', views.baseview),
   #schemas
   url(r'^schemas/(?P<pk>[a-z0-9]+)/?$', views.singleview),
   url(r'^schemas/$', views.baseview),
   #dump
   url(r'^dump/(?P<pk>[a-z0-9]+)/?', views.dump),


   #Login

   # path('create_db', views.create_db, name='create_db'),
   # path('delete_db', views.delete_db, name='delete_db'),
   # path('delete_user', views.delete_user, name='delete_user'),
   # path('delete_db_with_owner', views.delete_db_with_owner, name='delete_db_with_owner'),
   # path('get_users', views.get_users, name='get_users'),
   path('login', views.login, name="login"),
   path('login/', views.login, name="login"),
   path('register', views.register, name="register"),
   path('register/', views.register, name="register"),
   path('logout', views.logout, name="logout"),
   path('logout/', views.logout, name="logout"),
   path('logout_button/', views.logout_button, name='logout_button'),
   path('logout_button', views.logout_button, name='logout_button'),
   path('whoami', views.whoami, name='whoami'),
   path('set_role/', views.set_role, name='set_role'),
   path('set_role', views.set_role, name='set_role'),
   path('whoami/', views.whoami, name='whoami'),

   url('',views.defaultresponse)

]


