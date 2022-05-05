openLDAPidsource
================

A Docker container OpenLDAP directory seeded with some basic user data for use as an Identity source with Morpheus

Based on the Docker Images found here

https://github.com/osixia/docker-openldap  
https://github.com/osixia/docker-phpLDAPadmin  

To use this identity Source you requere a Linux host with docker and docker-compose installed

Create a folder named ldap and copy the folder tree from this repo

./ldap/config              - Docker Volume for persisting the LDAP config  
./ldap/db                  - Docker Volume for persising the LDAP db  
./ldap/certs               - Docker Volume for certs  
./seedldif                 - Docker Volume for Initial Seed Data. You may modify this to suit you requirements  
./ldap/docker-compose.yml  - Compose file for services  
./ldap/seed.sh             - shell script for seeding the Directory  

The docker-compose.yml contains some default values that should be set to meet your needs and match the seed data. The principal values are LDAP_DOMAIN which has a default value of "ldap.mydirectory.com" and LDAP_ADMIN_PASSWORD which has the default value of "admin"

If you change the domain name also update domainname and hostname in docker-compose.yml

To start the services run

docker-compose up -d

to seed the Directory with test data run

. ./seed.sh

from the ./ldap folder

To administer the Directory use the plpLDAPadmin web page. The default location is http://<dockerhost>:8080
  
Default users/groups and passwords can be found in the ./seedldif folder.

The default Admin login and password can be set in the docker-compose.yml file - the default password is admin
