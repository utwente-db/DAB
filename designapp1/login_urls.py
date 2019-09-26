from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    path('home', views.home, name="home"),
    url(r'^login/?$', views.login, name="login"),
	url(r'^logout/?$', views.logout, name="logout"),
    url(r'^logout_button/?$', views.logout_button, name='logout_button'),
    url(r'^verify/(?P<token>(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?)$', views.verify, name='verify') #https://stackoverflow.com/questions/475074/regex-to-parse-or-validate-base64-data
    ]
