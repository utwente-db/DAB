# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class Roles(models.Model):
    id = models.IntegerField(primary_key=True)
    role = models.IntegerField()
    email = models.CharField(max_length=265, unique=True)
    password = models.TextField(max_length=265)
    maxdatabases = models.IntegerField()


    class Meta:
        managed = False
        db_table = 'roles'
        verbose_name_plural = 'Roles'


class Courses(models.Model):
    courseid = models.AutoField(db_column='courseid',primary_key=True)
    fid = models.ForeignKey(Roles, on_delete=models.CASCADE, db_column='fid')
    coursename = models.CharField(max_length=256)
    students = models.IntegerField()
    info = models.TextField()
    assistants = models.ManyToManyField(
        Roles,
        through='TAs',
        through_fields=('course', 'role'),
        related_name = 'assisting'
    )

    def __str__(self):
       return self.coursename


    class Meta(object):
        managed = False
        db_table = 'courses'
        verbose_name_plural = 'Courses'
        unique_together = ('fid','coursename')

#class Studentgroup(models.Model):
#    fid = models.ForeignKey(Roles, on_delete=models.CASCADE)
#    dbid = models.IntegerField()
#
#
#    class Meta:
#        managed = False
#        db_table = 'studentgroup'
#        verbose_name_plural = 'Studentgroup'
#        unique_together = ('fid','dbid')


class Studentdatabases(models.Model):
    dbid = models.AutoField(db_column='dbid',primary_key=True)
    fid = models.ForeignKey(Roles, on_delete=models.CASCADE, db_column='fid')
    databasename = models.TextField()
    course = models.ForeignKey(Courses, on_delete=models.CASCADE, db_column='course')
    username = models.CharField(max_length=265)
    password = models.TextField(max_length=265)

    class Meta:
        managed = False
        db_table = 'studentdatabases'
        verbose_name_plural = 'StudentDatabases'

class TAs(models.Model):
    course = models.ForeignKey(Courses, on_delete=models.CASCADE, db_column='course')
    role = models.ForeignKey(Roles, on_delete=models.CASCADE, db_column='role')

    class Meta:
        managed = False
        db_table = 'tas'
        verbose_name_plural = 'TAs'
