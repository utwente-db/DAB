# Design Project Group 4: Database Manager

## Overview

This project serves as a database manager for the Data Science department. 
With the increase in students; it is no longer feasible to cut database credentials on paper. 
As such, this software will allow students to request databases with pre-loaded schemas from a certain course.

## Requirements

Firstly, the software requires full administrative access to a PostgreSQL server.
This server does not have to be hosted on the same machine.
It is recommended that the PostgreSQL databases not be used for any other purpose than this software.

Install dependencies:

- python3-pip
- npm (required for installation only)

Run dependencies:

- python3.7
- python3-venv
- python3-dev
- postgresql-python-venv
- libpq-dev
- postgresql-client-common
- postgresql-client-<VERSION>

Additionally, the following software is needed for the recommended production server setup:

- uWSGI (please install via pip3)
- a web server (e.g. nginx)
- an SMTP server (e.g. postfix)

Logging:

- the file /var/log/django/backend.log needs to exist in order to get log messages from the application

Any pip and npm packages will be installed automatically during the installation steps

## Secret.py and the database

There MUST exist a file `designproject/secret.py`. 
This file is not included in this repository for obvious reasons.

The file MUST be a correct python file, and SHOULD contain nothing but the following variable definitions, all of which MUST be strings:

    db_name = [DATABASE NAME]
    db_user = [DATABASE USER]
    db_password = [DATABASE PASSWORD]
    db_host = [DATABASE SERVER]
    db_port = [DATABASE PORT]
    
    bitmask = [33 BYTES OF CRYPTORANDOM DATA, AS BASE64]

If the file does not exist, parse, or assign appropriate values to all of these variables, the program will crash.

The database user MUST exist, and MUST have superuser privileges on the database server.
The database server MUST run Postgres, and MUST be available from wherever this software is running.
The database name SHOULD be something memorable and SHOULD NOT end on a number.
The database server SHOULD not be used for any other purpose than this software.
Failure to heed the advice in this paragraph may result in unexpected exceptions.

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

## Installation under Apache

This tutorial will outline the steps required to install the software under Apache.
It is intended for services that already have an Apache server running other websites, with a system administrator who is somewhat experienced with Apache httpd and whatever operating system they choose to use.
Note that while in principle all operating systems are supported, in practice we have assumed the project will be ran in a UNIX-like environment.
If you want to set up the system on a standalone server, we recommend the above tutorial for nginx.

Note that this tutorial will use the somewhat newer `mod_proxy_uwsgi`, instead of the older, and much uglier, `mod_wsgi`. 
This mod is NOT CONSIDERED STABLE UNLESS uWSGI is at least version 2.0.6, and Apache is at least version 2.4.9. 
If your system does not provide these versions, or you have an exceptionally high need for stability, we recommend the usage of the older `mod_wsgi` instead.

Throughout this tutorial, `[DOCUMENT ROOT]` will be used to indicate the absolute path to the directory in which you cloned this project. Standard practice is putting it somewhere in `/var/www/`

1. Install all the dependencies listed above. Take care to install uwsgi as a pip3 package, and not via the system dependencies. 
2. If your distribution does not come with Python3.6 or later, compile Python3.7 from source, then follow [this tutorial](https://www.paulox.net/2019/03/13/how-to-use-uwsgi-with-python-3-7-in-ubuntu-18-x/) to ensure uwsgi uses it. Also edit install.sh: the first line, `python3 -m venv venv` MUST use your new python3.7 installation.
3. Run install.sh. This will create a virtual environment, and install the dependencies for the project in it.
4. Create `secret.py` in accordance with the paragraph on it above.
5. Copy uwsgi.ini.example to uwsgi.ini. Edit the values in uwsgi.ini (mostly filepaths) to correspond to your system. There are comments explaining what each line is supposed to do, so it should be pretty self-explanatory. Note that most file paths are absolute. The socket file can be at any location of your choice; /var/run/ is simply the standard.
6. To test if you have correctly configured uwsgi, run `uwsgi --ini uwsgi.ini --http :8000`, which should now host the website on port 8000; you should see a login page once you go there. Note that static files, such as the CSS for the page, are not yet loaded in at this stage.
7. Now that we know uwsgi works, we can configure it as a service. Make the service `dab` (or any name of your choice) using the init system of your operation system. The execute command is `uwsgi --ini [DOCUMENT ROOT]/uwsgi.ini`. Depending on the permissions of the files and the socket, you may need to run this as root; however, we recommend running it as www-data. Start the service, and make sure it is started with Apache at boot time.
8. If the previous step succeeded, we can start configuring apache. If you need to set up a virtual host, we assume you already know how to do this. Otherwise, you can configure this as the main server by putting the configuration information at the root level of the config file. 

This project needs the following configuration:

    DocumentRoot "[DOCUMENT ROOT]"
    ProxyPass /static !
    ProxyPass / unix:/var/run/dab.sock|uwsgi://uwsgi-uds-dab/
    ProxyPassReverse / unix:/var/run/dab.sock|uwsgi://uwsgi-uds-dab/

If you have changed the location of the socket in the previous steps, you must also change it here.

Congratulations! You should now have the basic web page set up. You can test this by trying to access the page, at whatever port Apache runs on.
There are now two things left to do:

This project MUST run over https. 
It is the responsibility of the system administrator to ensure there are proper SSL certificates present. 
After this has been arranged, `SSLRequireSSL` MUST be added to the Apache configuration of this site, to ensure that only SSL connections will be accepted.
Failure to comply with these instructions will cause passwords to be transmitted over unencrypted connections.

The second thing is email.
This project requires you to locally host an SMTP server, so that we can send verification emails. 
This email server only needs to relay messages from the local host, coming in over a loopback connection.
If you do not have one installed, we recommend installing Postfix using the package manager. 
On the UT campus, the only edit that needs to be made to Postfix is the following line in `/etc/postfix/main.cf`:

    relayhost = smtp.utwente.nl

Once this is configured, the server should be able to create email.

To bootstrap an administrator account, we recommend registering a regular account, then accessing the main database by hand and change the role for this account to `0`.
The table that contains user accounts is called `dbmusers`.
Once this is done, the administrator account can promote users to teacher or administrator status.
