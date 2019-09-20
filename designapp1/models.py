# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class dbmusers(models.Model):
    id = models.AutoField(db_column='id',primary_key=True)
    role = models.IntegerField()
    email = models.CharField(max_length=265, unique=True)
    password = models.TextField(max_length=265)
    maxdatabases = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'dbmusers'
        verbose_name_plural = 'dbmusers'


class Courses(models.Model):
    courseid = models.AutoField(db_column='courseid',primary_key=True)
    fid = models.ForeignKey(dbmusers, on_delete=models.CASCADE, db_column='fid')
    coursename = models.CharField(max_length=256)
    students = models.IntegerField()
    info = models.TextField()
    assistants = models.ManyToManyField(
        dbmusers,
        through='TAs',
        through_fields=('courseid', 'studentid'),
        related_name = 'assisting'
    )

    def __str__(self):
       return self.coursename


    class Meta(object):
        managed = False
        db_table = 'courses'
        verbose_name_plural = 'Courses'
        unique_together = ('fid','coursename')

class schemas(models.Model):
    id = models.AutoField(db_column='id', primary_key=True)
    name = models.CharField(max_length=256,null=False,db_column='name',blank=False),
    course = models.ForeignKey(Courses,null=False, on_delete=models.CASCADE, db_column='course',blank=False),
    sql = models.TextField(db_column='sql')

    class Meta:
        managed=False
        db_table = 'schemas'
        verbose_name_plural = 'Schemas'

class Studentdatabases(models.Model):
    dbid = models.AutoField(db_column='dbid',primary_key=True)
    fid = models.ForeignKey(dbmusers, on_delete=models.CASCADE, db_column='fid')
    databasename = models.TextField(unique=True)
    course = models.ForeignKey(Courses, on_delete=models.CASCADE, db_column='course')
    username = models.CharField(max_length=265)
    password = models.CharField(max_length=265)
    schema = models.ForeignKey(schemas, on_delete=models.PROTECT, db_column='schema')

    class Meta:
        managed = False
        db_table = 'studentdatabases'
        verbose_name_plural = 'StudentDatabases'

class TAs(models.Model):
    taid = models.AutoField(db_column = 'taid', primary_key=True)
    courseid = models.ForeignKey(Courses, on_delete=models.CASCADE, db_column='courseid')
    studentid = models.ForeignKey(dbmusers, on_delete=models.CASCADE, db_column='studentid')

    class Meta:
        managed = False
        db_table = 'tas'
        verbose_name_plural = 'TAs'
