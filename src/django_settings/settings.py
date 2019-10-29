"""
Django settings for django_settings project.

Generated by 'django-admin startproject' using Django 1.11.24.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import base64
import os

from . import secret

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECRET KEY: doesn't actually do anything...
SECRET_KEY = 'z)7pbw!fc(th%m)!(ytsprc3bick1ga-mavn4c8xvujwe(3x21'

# SECURITY WARNING: don't run with debug turned on in production!
# TODO move to secret.py for rolling release (if we want to work on this next module)
DEBUG = True

ALLOWED_HOSTS = ['*']

# student databases prefix
STUDENT_DB_PREFIX = 'dab_'

# For display to users only; please edit in secret.py
DATABASE_SERVER = secret.DATABASE_SERVER
HOST_SERVER = secret.HOST_SERVER

# EMAIL SETTINGS; please edit in secret.py
EMAIL_SERVER = secret.EMAIL_SERVER
EMAIL_SENDER = secret.EMAIL_SENDER

# LOGFILE: needs write permissions; please edit in secret.py
LOGFILE = secret.LOGFILE

# Application definition

INSTALLED_APPS = [
#    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'src.backend',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'src.backend.middleware.errorhandling.customerrorhandling'
]

ROOT_URLCONF = 'src.django_settings.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(os.path.dirname(__file__), '../templates'),
                 ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'src.django_settings.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': secret.db_name,
        'USER': secret.db_user,
        'PASSWORD': secret.db_password,
        'HOST': secret.db_host,
        'PORT': secret.db_port
    },

    'django_settings': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': secret.db_name,
        'USER': secret.db_user,
        'PASSWORD': secret.db_password,
        'HOST': secret.db_host,
        'PORT': secret.db_port
    },
}

BITMASK = base64.b64decode(secret.bitmask)

# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/static-files/

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, '../frontend'),
]
STATIC_ROOT = "static"
STATIC_URL = '/static/'

DEBUG_PROPAGATE_EXCEPTIONS = True

# LOGGING

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} , {message}',
            'style': '{',
        },
        'simple': {
            'format': '{levelname} {message}',
            'style': '{',
        },
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': LOGFILE,
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'request_logger': {
            'handlers': ['file'],
            'level': 'INFO',
            'propagate': True,
        },
    },
}
