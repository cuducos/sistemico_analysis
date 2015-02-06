#!/usr/bin/env bash

# Python
apt-get update
apt-get-upgrade
apt-get install -y python-setuptools git build-essential python-dev
easy_install pip

# PostgreSQL
apt-get install -y postgresql postgresql-contrib libpq-dev
apt-get install -y python-psycopg2
sudo -u postgres psql -c "CREATE ROLE vagrant WITH PASSWORD 'vagrant' LOGIN SUPERUSER"
sudo -u postgres createdb -O vagrant sistemico_analysis
sudo -u postgres createdb -O vagrant sistemico_analysis_test

# install project dependencies
pip install -r /vagrant/requirements.txt

# install matplotlib
apt-get build-dep -y python-matplotlib
apt-get install -y python-matplotlib

# create env var with database credentials
export DATABASE=postgres://vagrant:vagrant@localhost/sistemico_analysis
