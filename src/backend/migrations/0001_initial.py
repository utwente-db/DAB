# Generated by Django 2.2.5 on 2019-09-20 22:36

from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Courses',
            fields=[
                ('courseid', models.AutoField(db_column='courseid', primary_key=True, serialize=False)),
                ('coursename', models.CharField(max_length=256)),
                ('students', models.IntegerField()),
                ('info', models.TextField()),
            ],
            options={
                'verbose_name_plural': 'Courses',
                'db_table': 'courses',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='dbmusers',
            fields=[
                ('id', models.AutoField(db_column='id', primary_key=True, serialize=False)),
                ('role', models.IntegerField()),
                ('email', models.CharField(max_length=265, unique=True)),
                ('password', models.TextField(max_length=265)),
                ('maxdatabases', models.IntegerField()),
            ],
            options={
                'verbose_name_plural': 'dbmusers',
                'db_table': 'dbmusers',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='schemas',
            fields=[
                ('id', models.AutoField(db_column='id', primary_key=True, serialize=False)),
                ('sql', models.TextField(db_column='sql')),
            ],
            options={
                'verbose_name_plural': 'Schemas',
                'db_table': 'schemas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Studentdatabases',
            fields=[
                ('dbid', models.AutoField(db_column='dbid', primary_key=True, serialize=False)),
                ('databasename', models.TextField(unique=True)),
                ('username', models.CharField(max_length=265)),
                ('password', models.CharField(max_length=265)),
            ],
            options={
                'verbose_name_plural': 'StudentDatabases',
                'db_table': 'studentdatabases',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TAs',
            fields=[
                ('taid', models.AutoField(db_column='taid', primary_key=True, serialize=False)),
            ],
            options={
                'verbose_name_plural': 'TAs',
                'db_table': 'tas',
                'managed': False,
            },
        ),
    ]
