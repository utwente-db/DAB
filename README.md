# Design Project Group 4: Database Manager

## Overview

This project serves as a database manager for the Data Science department. 
With the increase in students; it is no longer feasible to cut database credentials on paper. 
As such, this software will allow students to request databases with pre-loaded schemas from a certain course.

## Requirements

Firstly, the software requires full administrative access to a PostgreSQL server.
This server does not have to be hosted on the same machine.
It is recommended that the PostgreSQL databases not be used for any other purpose than this software.

To run the project the following system packages are required (may not be actual package names):

- python3.7
- python3-venv
- python3-pip
- python3-dev
- postgresql-python-venv
- libpq-dev
- postgresql-client-common
- postgresql-client-<VERSION>
- npm (required for installation only)

Additionally, the following software is needed for the recommended production server setup:

- uWSGI (please install via pip3)
- a web server (e.g. nginx)
- an SMTP server (e.g. postfix)

Any pip and npm packages will be installed automatically during the installation steps

## Installation and running for development

To install the server for development, simply run init.sh.
This will create a python virtual environment, and install the required python and node packages within it.

To run the server, simply run start.sh.
This will compile the typescript, move static files to their correct location, and finally start a development server on port 8000.
Note that this server can only be approached from the local host.

NB: the registration of new users requires an smtp server to be present on the local host.
As your development machine probably does not have such a server, we recommend you use existing user accounts, or, if these are not available, verify accounts by manually modifying the database.

WARNING: do not use this way of setting up a server in production.
It is not intended for high-demand environments, and using it in production may lead to terrible performance and security risks.

## Installation in a Production environment.

Installing a django system in a production environment is somewhat less trivial than it may seem.
Correct configuration requires the installation of several specific purpose components, each of which need to be connected to the others.

Because of previous experience, we have chosen to use Nginx as a webserver, and PostFix as an SMPT server.
Alternatives could also be used with no impact on the functioning of this software, as long as they are configured in similar ways.

The first thing to do would be to install this project and its dependencies, and configure them for use in production.
To do so, clone this repository into a location of your choice (e.g. /var/www/db/, run `init.sh`, which will set up a virtual environment, and `production.sh`, which will configure the front-end frameworks for production use.

For the basic configuration of uWSGI, Nginx, and this Django project, look no further than [this excellent tutorial from the uWSGI website](https://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html). 
Note that the uwsgi config file is already present in this project under the name of `db_uwsgi.ini`; this is usable for most systems, although you will probably want to edit the file paths.

In most environments, the default python version is lower than Python 3.7; in fact, it is often still Python 2.
To ensure this software is ran using Python 3.7, a plugin for uWSGI must be installed. 
To install this plugin, approximately follow [this tutorial](https://www.paulox.net/2019/03/13/how-to-use-uwsgi-with-python-3-7-in-ubuntu-18-x/).
`db_uwsgi.ini` is already configured to use this plugin.

At this point, you should have set up the following.

- A basic Nginx configuration
- A uWSGI server in emperor mode
- A vassal to said server for this project.

This means that you should get a basic page from this software when requesting to `<server>:8000` over http.

You should now look at running this software as an actual website.
For security reasons, the web server MUST be configured to use SSL, and only allow SSL connections to this software.

All static files are in `<project root>/static`.
As such, the /media location from the tutorial can be removed.

Finally, there is the matter of email.

To send emails, all that is needed is an smtp server that runs on the local host, and relays messages sent from the local host in such a way that they will inbox in utwente.nl accounts.
NB: because Python, we do NOT use the UNIX Mail system; instead, we open an smtp connection from the local host.

In Postfix, these settings are present by default. 
To use Postfix from a location on the UT campus, only one line needs to be added/changed in the default postfix configuration: 

    relayhost = smtp.utwente.nl

This will cause postfix to send all its mail to the UT SMTP server, which, at the moment, forwards all mail originating from within the campus.

Furthermore, `designapp1/mail.py` must be edited to ensure the sender address is corresponds to the domain of the server.
