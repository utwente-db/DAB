#!/bin/bash

#DEPRECATED, USE init.sh and start.sh

#To run on fresh linux installation
#sudo wget https://git.thebias.nl/floris/design/raw/branch/base-backend/setupscript | sudo bash setupscript

#Beforehand

sudo apt update
sudo apt upgrade
sudo apt --assume-yes install software-properties-common
sudo apt --assume-yes install python3-pip
sudo apt --assume-yes install libpq-dev
sudo apt autoremove

#Python3

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt --assume-yes install python3.7
sudo apt --assume-yes install python3-dev

#Django

pip3 install django

#Postgresql

sudo touch /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" >/etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt --assume-yes install postgresql-client-common
sudo apt --assume-yes install postgresql-11

#Psycopg

pip3 install psycopg2

#Django REST framework

pip3 install djangorestframework
pip3 install markdown
pip3 install django-filter

#Git

sudo apt --assume-yes install git-all

#Get git repository

sudo mkdir ~/design/
cd ~/design/
django-admin startproject django_settings
cd django_settings
python3 manage.py startapp backend
sudo rm *
read -p "Which branch you want to use?" branch_name
git clone --single-branch --branch $branch_name https://git.thebias.nl/floris/design.git
sudo cp -a design/. .
sudo rm -R design
sudo python3 manage.py makemigrations
sudo python3 manage.py migrate

sudo apt install node npm
