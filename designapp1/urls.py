from django.conf.urls import url, include
from django.urls import path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('Roles', views.RolesView)
router.register('Courses', views.CoursesView)
router.register('Studentdatabases', views.StudentdatabasesView)
#router.register('Studentgroup', views.StudentgroupView)


urlpatterns = [
   url('', include(router.urls)),
   path('create_db', views.create_db, name='create_db'),
   path('delete_db', views.delete_db, name='delete_db'),
   path('delete_user', views.delete_user, name='delete_user'),
   path('delete_db_with_owner', views.delete_db_with_owner, name='delete_db_with_owner'),
   path('get_users', views.get_users, name='get_users'),
   path('login', views.login, name="login"),
   path('register', views.register, name="register"),
   path('logout', views.logout, name="logout"),
   path('logout_button', views.logout_button, name='logout_button'),
]


