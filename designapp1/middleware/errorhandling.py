import logging
from django.http import HttpResponse
import psycopg2 as dbmanager
from rest_framework import status
from django.db.utils import OperationalError

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
            return HttpResponse('Your search field is empty',status=status.HTTP_400_BAD_REQUEST)

        if type(exception) == OperationalError:
            return HttpResponse('Connection to the database is lost',status=status.HTTP_424_FAILED_DEPENDENCY)
        else:
            return None
