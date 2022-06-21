openLDAPidsource
================

A Docker container OpenLDAP directory seeded with some basic user data for use as an LDAP Identity source with Morpheus

Based on the Docker Images found here

https://github.com/osixia/docker-openldap  
https://github.com/osixia/docker-phpLDAPadmin  

To use this identity Source you require a Linux host with docker and docker-compose installed

Folder Layout

./ldap/config              - Docker Volume for persisting the LDAP config  
./ldap/db                  - Docker Volume for persising the LDAP db  
./ldap/certs               - Docker Volume for certs  
./seedldif                 - Docker Volume for Initial Seed Data. You may modify this to suit you requirements  
./ldap/docker-compose.yml  - Compose file for services  
./ldap/seed.sh             - shell script for seeding the Directory  

The docker-compose.yml contains default values that should be set to meet your needs and match the seed data. The principal values are LDAP_DOMAIN which has a default value of "ldap.mydirectory.com" and LDAP_ADMIN_PASSWORD which has the default value of "admin"

If you want to change the default domain name also update domainname and hostname variables in docker-compose.yml

To start the services run

docker-compose up -d

To initially seed the LDAP Directory with test data run

. ./seed.sh

from the ./ldap folder. Data will then persist.

To administer the Directory use the built in phpLDAPadmin web page. The default location is http://{yourdockerhostname or IP}:8080

The default admin user login is cn=admin,dc=ldap,dc=mydirectory,dc=com , password is admin
  
The default seeded users/groups and passwords can be found in the ./seedldif folder.

The default admin login and password can be set in the docker-compose.yml file. 

To Add to Morpheus as an LDAP Identity Source
---------------------------------------------

In the Edit Identity Source Dialog enter the LDAP Connection URL as ldap://yourdockerhostname:389

The Binding Username is morphsvc pwd: Password123 unless changed in the seed data.

You can set up role mappings using the seeded group dn's if required
