# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Courses(models.Model):
    fid = models.ForeignKey('Roles', models.DO_NOTHING, db_column='fid')
    coursename = models.TextField()
    students = models.IntegerField()
    info = models.TextField()
    djangoid = models.IntegerField(primary_key=True)


    class Meta:
        managed = False
        db_table = 'courses'
        verbose_name_plural = 'Courses'

class Roles(models.Model):
    role = models.IntegerField()
    email = models.TextField()
    password = models.TextField()
    maxdatabases = models.IntegerField()



    class Meta:
        managed = False
        db_table = 'roles'
        verbose_name_plural = 'Roles'

class Studentgroup(models.Model):
    fid = models.ForeignKey(Roles, models.DO_NOTHING, db_column='fid')
    dbid = models.IntegerField()
    djangoid = models.IntegerField(primary_key=True)


    class Meta:
        managed = False
        db_table = 'studentgroup'
        verbose_name_plural = 'Studentgroup'

class Studentdatabases(models.Model):
    dbid = models.OneToOneField(Studentgroup,on_delete=models.CASCADE,db_column='dbid')
    databasename = models.TextField()
    course = models.TextField()
    username = models.TextField()
    password = models.TextField()
    djangoid = models.IntegerField(primary_key=True)


    class Meta:
        managed = False
        db_table = 'studentdatabases'
        verbose_name_plural = 'StudentDatabases'

