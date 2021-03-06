import logging

from django.db.utils import OperationalError
from django.http import HttpResponse
from rest_framework import status

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s',
)


class customerrorhandling(object):

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)

    def process_exception(self, request, exception):

        if request.build_absolute_uri().endswith('/rest/studentdatabases/name/'):
            return HttpResponse('Your search field is empty', status=status.HTTP_400_BAD_REQUEST)
        elif request.build_absolute_uri().endswith('/rest/studentdatabases/owner/'):
            return HttpResponse('Your search field is empty', status=status.HTTP_400_BAD_REQUEST)
        elif request.build_absolute_uri().endswith('/rest/studentdatabases/course/'):
            return HttpResponse('Your search field is empty', status=status.HTTP_400_BAD_REQUEST)

        if type(exception) == OperationalError:
            return HttpResponse('Connection to the database is lost, please try again in a few minutes', status=status.HTTP_424_FAILED_DEPENDENCY)
        else:
            return None
