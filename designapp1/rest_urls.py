from django.conf.urls import url
from django.urls import path
from rest_framework import routers

from . import views

router = routers.DefaultRouter()

urlpatterns = [

    # General
    # url('', include(router.urls)),

    # Specific databases

    # Studentdatabases
    url(r'^studentdatabases/own/?$', views.get_own_response, {"dbname": "studentdatabases"}),
    url(r'^studentdatabases/(?P<pk>[a-z0-9]+)/?$', views.singleview, {"dbname": "studentdatabases"}),
    url(r'^studentdatabases/$', views.baseview, {"dbname": "studentdatabases"}),
    url(r'^studentdatabases/name/(?P<search_value>[a-z0-9]+)/?$', views.search_on_name, {"dbname": "studentdatabases"}),
    # Courses
    url(r'^courses/own/?$', views.get_own_response, {"dbname": "courses"}),
    url(r'^courses/(?P<pk>[0-9]+)/schema/?', views.schema),
    url(r'^courses/(?P<pk>[a-z0-9]+)/?$', views.singleview, {"dbname": "courses"}),
    url(r'^courses/$', views.baseview, {"dbname": "courses"}),
    url(r'^courses/name/(?P<search_value>[a-z0-9]+)/?$', views.search_on_name, {"dbname": "courses"}),
    # TAs
    url(r'^tas/own/?$', views.get_own_response, {"dbname": "tas"}),
    url(r'^tas/(?P<pk>[a-z0-9]+)/?$', views.singleview, {"dbname": "tas"}),
    url(r'^tas/$', views.baseview, {"dbname": "tas"}),

    # NOT YET IMPLEMENTED, REQUIRES FOREIGN KEY, NOT DIFFICULT, JUST HAS TO BE DONE
    #  url(r'^studentdatabases/name/(?P<search_value>[a-z0-9]+)/?$', views.search_on_name,{"dbname":"tas"}),
    # dbmusers
    url(r'^dbmusers/own/?$', views.get_own_response, {"dbname": "dbmusers"}),
    url(r'^dbmusers/(?P<pk>[a-z0-9]+)/?$', views.singleview, {"dbname": "dbmusers"}),
    url(r'^dbmusers/$', views.baseview, {"dbname": "dbmusers"}),
    url(r'^dbmusers/email/(?P<search_value>[a-z0-9@.]+)/?$', views.search_on_name, {"dbname": "dbmusers"}),

    # dump
    url(r'^dump/(?P<pk>[a-z0-9]+)/?', views.dump),
    url(r'^reset/(?P<pk>[0-9]+)/?', views.reset),

    # Login

    # path('create_db', views.create_db, name='create_db'),
    # path('delete_db', views.delete_db, name='delete_db'),
    # path('delete_user', views.delete_user, name='delete_user'),
    # path('delete_db_with_owner', views.delete_db_with_owner, name='delete_db_with_owner'),
    # path('get_users', views.get_users, name='get_users'),
    # path('login/', views.login, name="login"),

    path('whoami', views.whoami, name='whoami'),
    path('whoami/', views.whoami, name='whoami'),
    path('set_role', views.set_role, name='set_role'),
    path('set_role/', views.set_role, name='set_role'),

    # path('test', views.test, name='test'),

]
