# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
import base64
import re

from django.conf import settings
from django.db import models
from django.utils.html import escape as htmlspecialchars  # I'm a PHP programmer after all


class dbmusersQuerySet(models.query.QuerySet):

    def get(self, **kwargs):
        if "email" in kwargs:
            kwargs["email"] = kwargs["email"].lower()

        return super().get(**kwargs)

    def filter(self, **kwargs):
        if "email" in kwargs:
            kwargs["email"] = kwargs["email"].lower()
        return super().filter(**kwargs)


class dbmusersManager(models.Manager.from_queryset(dbmusersQuerySet)):

    def all(self, **kwargs):
        if "email" in kwargs:
            kwargs["email"] = kwargs["email"].lower()
        return super().all(**kwargs)


class dbmusers(models.Model):
    id = models.AutoField(db_column='id', primary_key=True)
    role = models.IntegerField()
    email = models.CharField(max_length=265, unique=True)
    password = models.TextField(max_length=265)
    verified = models.BooleanField(default=False)
    token = models.TextField(null=True)
    lastlogin = models.DateTimeField(default=None)
    tokenExpire = models.DateTimeField(default=None, db_column="token_expire")

    def save(self, *args, **kwargs):
        self.email = self.email.lower()
        if not re.match(r'.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl$', self.email):
            raise ValueError("user does not have a utwente email")
        elif not re.match(
                r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])",
                self.email):
            raise ValueError("user does not have a valid email")
        super(dbmusers, self).save()

    objects = dbmusersManager()

    class Meta:
        managed = False
        db_table = 'dbmusers'
        verbose_name_plural = 'dbmusers'


class Courses(models.Model):
    courseid = models.AutoField(db_column='courseid', primary_key=True)
    fid = models.ForeignKey(dbmusers, on_delete=models.CASCADE, db_column='fid')
    coursename = models.CharField(max_length=256)
    info = models.TextField()
    active = models.BooleanField(null=False)
    assistants = models.ManyToManyField(
        dbmusers,
        through='TAs',
        through_fields=('courseid', 'studentid'),
        related_name='assisting'
    )
    schema = models.TextField(null=False, blank=True, default="", db_column="schema")
    databases = models.IntegerField(default=0, db_column="databases")

    def __str__(self):
        return self.coursename

    def save(self, *args, **kwargs):
        if not re.match(r'^[a-zA-Z0-9\.\-\+\/ ]+$', self.coursename):
            raise ValueError("Coursename can only contain alphanumerical and these: .-+/ characters, as well as spaces")
        else:
            self.info = htmlspecialchars(self.info)
            super(Courses, self).save()

    def owner(self):
        return self.fid

    class Meta(object):
        managed = False
        #        abstract = True
        db_table = 'courses'
        verbose_name_plural = 'Courses'
        unique_together = ('fid', 'coursename')


def switchPassword(password):
    bits = base64.b64decode(password)
    bits = bytes([x ^ y for (x, y) in zip(settings.BITMASK, bits)])
    return base64.b64encode(bits).decode()


class StudentdatabasesQuerySet(models.query.QuerySet):

    def get(self, **kwargs):
        out = super().get(**kwargs)
        out.password = switchPassword(out.password)
        return out

    def filter(self, **kwargs):
        out = super().filter(**kwargs)
        for db in out:
            db.password = switchPassword(db.password)
        return out

    def all(self):
        out = super().all()
        for db in out:
            db.password = switchPassword(db.password)
        return out


class StudentdatabasesManager(models.Manager.from_queryset(StudentdatabasesQuerySet)):
    def all(self):
        out = super().all()
        for db in out:
            db.password = switchPassword(db.password)
        return out

    def raw(self, *args, **kwargs):
        out = super().raw(*args, **kwargs)
        for db in out:
            db.password = switchPassword(db.password)
        return out



class Studentdatabases(models.Model):
    dbid = models.AutoField(db_column='dbid', primary_key=True)
    fid = models.ForeignKey(dbmusers, on_delete=models.PROTECT, db_column='fid')
    databasename = models.TextField(unique=True)
    course = models.ForeignKey(Courses, on_delete=models.PROTECT, db_column='course')
    username = models.CharField(max_length=265)
    password = models.CharField(max_length=265)
    groupid = models.IntegerField(default=0, db_column="groupid")

    @property
    def email(self):
        return self.fid.email


    @property
    def role(self):
        return self.fid.role

    objects = StudentdatabasesManager()

    def save(self, *args, **kwargs):
        self.password = switchPassword(self.password)
        super(Studentdatabases, self).save()
        self.password = switchPassword(self.password)

    def owner(self):
        return self.fid

    class Meta:
        managed = False
        unique_together = ('course', 'fid')
        db_table = 'studentdatabases'
        verbose_name_plural = 'StudentDatabases'


class TAs(models.Model):
    taid = models.AutoField(db_column='taid', primary_key=True)
    courseid = models.ForeignKey(Courses, on_delete=models.CASCADE, db_column='courseid')
    studentid = models.ForeignKey(dbmusers, on_delete=models.CASCADE, db_column='studentid')

    def owner(self):
        return self.courseid.owner()

    class Meta:
        managed = False
        db_table = 'tas'
        verbose_name_plural = 'TAs'
