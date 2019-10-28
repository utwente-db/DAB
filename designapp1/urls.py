from django.conf.urls import url
from django.urls import path

from . import views

urlpatterns = [
    url(r'^/?$', views.redirect, name="home2"),
    url(r'^student_view/?$', views.student_view, name="student_view"),
    url(r'^admin_view/?$', views.admin_view, name="admin_view"),
    url(r'^edit_courses/?$', views.edit_courses, name="edit_courses"),
    url(r'^edit_users/?$', views.edit_users, name="edit_users"),
    url(r'^login/?$', views.login, name="login"),
    url(r'^logout/?$', views.logout, name="logout"),
    url(r'^register/?$', views.register, name="register"),
    url(r'^forgot_password_page/?$', views.forgot_password_page, name="forgot_password_page"),
    url(r'^password_has_been_reset/?$', views.password_has_been_reset, name="password_has_been_reset"),
    url(r'^logout_button/?$', views.logout_button, name='logout_button'),
    url(r'^verify/(?P<token>(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?)$', views.verify,
        name='verify'),
    # https://stackoverflow.com/questions/475074/regex-to-parse-or-validate-base64-data

    url(r'^change_password/?$', views.change_password, name="change_password"),

    url(r'^reset_password/(?P<pk>[0-9]+)/(?P<token>(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?)$', views.reset_password, name='reset_password'),
    url(r'^request_reset_password/(?P<email>.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl)/?$', views.request_reset_password, name='request_reset_password'),
    url(r'^resend_verification/?$', views.resend_verification, name='resend_verification'),
    url('', views.defaultresponse)
]
