"""django_settings URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.http import HttpResponseRedirect

from src.django_settings.secret import DEBUG, URL_PREFIX

if DEBUG:
    def return_to_dab(request):
        return HttpResponseRedirect(URL_PREFIX)

    urlpatterns = [
        url(r'^'+ URL_PREFIX + 'rest/', include('src.backend.rest_urls')),
        url(r'^'+ URL_PREFIX, include('src.backend.urls')),
        url(r'^/?$', return_to_dab)
    ]
else:
    urlpatterns = [
        url(r'^rest/', include('src.backend.rest_urls')),
        url('', include('src.backend.urls'))
    ]
