from django.conf.urls import url
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
    url(r'^studentdatabases/name/(?P<search_value>[a-zA-Z0-9_]+)/?$', views.search_on_name,
        {"dbname": "studentdatabases"}),
    url(r'^studentdatabases/owner/(?P<search_value>[0-9]+)/?$', views.search_on_owner, {"dbname": "studentdatabases"}),
    url(r'^studentdatabases/course/(?P<search_value>[0-9]+)/?$', views.search_db_on_course),
    url(r'^studentdatabases/teacher/own/?$', views.teacher_own_studentdatabases),
    # Courses
    url(r'^courses/own/?$', views.get_own_response, {"dbname": "courses"}),
    url(r'^courses/(?P<pk>[0-9]+)/schema/?', views.schema),
    url(r'^courses/(?P<pk>[0-9]+)/?$', views.singleview, {"dbname": "courses"}),
    url(r'^courses/$', views.baseview, {"dbname": "courses"}),
    url(r'^courses/name/(?P<search_value>[a-zA-Z0-9_]+)/?$', views.search_on_name, {"dbname": "courses"}),
    # TAs
    url(r'^tas/own/?$', views.get_own_response, {"dbname": "tas"}),
    url(r'^tas/teacher/own/?$', views.teacher_own_tas, {"dbname": "tas"}),
    url(r'^tas/course/(?P<pk>[0-9]+)/?$', views.get_course_ta),
    url(r'^tas/(?P<pk>[a-z0-9]+)/?$', views.singleview, {"dbname": "tas"}),
    url(r'^tas/$', views.baseview, {"dbname": "tas"}),

    # NOT YET IMPLEMENTED, REQUIRES FOREIGN KEY, NOT DIFFICULT, JUST HAS TO BE DONE
    #  url(r'^studentdatabases/name/(?P<search_value>[a-z0-9]+)/?$', views.search_on_name,{"dbname":"tas"}),
    # dbmusers
    url(r'^dbmusers/own/?$', views.get_own_response, {"dbname": "dbmusers"}),
    url(r'^dbmusers/(?P<pk>[0-9]+)/?$', views.singleview, {"dbname": "dbmusers"}),
    url(r'^dbmusers/$', views.baseview, {"dbname": "dbmusers"}),
    url(r'^dbmusers/email/(?P<search_value>[a-zA-Z0-9@.]+)/?$', views.search_on_name, {"dbname": "dbmusers"}),
    url(r'^dbmusers/course/(?P<pk>[0-9]+)/?$', views.search_dbmusers_on_course),

    # dump
    url(r'^dump/(?P<pk>[0-9]+)/?$', views.dump),
    url(r'^course_dump/(?P<pk>[0-9]+)/?$', views.course_dump),
    url(r'^reset/(?P<pk>[0-9]+)/?', views.reset),
    url(r'^schematransfer/(?P<course>[0-9]+)/(?P<database>[0-9]+)/?', views.transferSchema),

    # Migration
    url(r'^generate_migration/?$', views.generate_migration),
    url(r'^missing_databases/?$', views.missing_databases),
    url(r'^missing_databases/all/?$', views.missing_databases, {"all": True}),
    url(r'^remove_missing_database/?$', views.remove_missing_database),

    # Login

    # path('create_db', views.create_db, name='create_db'),
    # path('delete_db', views.delete_db, name='delete_db'),
    # path('delete_user', views.delete_user, name='delete_user'),
    # path('delete_db_with_owner', views.delete_db_with_owner, name='delete_db_with_owner'),
    # path('get_users', views.get_users, name='get_users'),
    # path('login/', views.login, name="login"),

    url(r'^whoami/?$', views.whoami, name='whoami'),
    url(r'^who/?$', views.who, name='who'),
    url(r'^set_role/?$', views.set_role, name='set_role'),

    # path('test', views.test, name='test'),

]
