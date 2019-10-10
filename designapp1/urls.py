from django.conf.urls import url
from django.urls import path

from . import views

urlpatterns = [
    url(r'^/?$', views.redirect, name="home2"),
    url(r'^student_view/?$', views.student_view, name="student_view"),
    url(r'^admin_view/?$', views.admin_view, name="admin_view"),
    url(r'^userpage/?$', views.userpage, name="userpage"), #admin view of individual users
    url(r'^login/?$', views.login, name="login"),
    url(r'^logout/?$', views.logout, name="logout"),
    url(r'^register/?$', views.register, name="register"),
    url(r'^request_db/?$', views.request_db, name="request_db"),
    url(r'^logout_button/?$', views.logout_button, name='logout_button'),
    url(r'^courses/?$', views.courses, name='courses'),
    url(r'^verify/(?P<token>(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?)$', views.verify,
        name='verify'),
    # https://stackoverflow.com/questions/475074/regex-to-parse-or-validate-base64-data
    url('', views.defaultresponse)
]
