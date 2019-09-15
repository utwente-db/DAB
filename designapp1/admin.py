# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import Courses
from .models import Roles
from .models import Studentdatabases
#from .models import Studentgroup

# Register your models here.

admin.site.register(Courses)
admin.site.register(Roles)
admin.site.register(Studentdatabases)
#admin.site.register(Studentgroup)
