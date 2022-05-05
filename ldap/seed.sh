#! /bin/bash
echo "Seeding LDAP Contained Database with some dummy users"
echo ""
echo "Make sure the Docker containers are running with Docker-compose up -d"
echo ""
docker-compose up -d

# Load the seed data files inside the container with docker exec

echo "Seeding Users and Groups ...."
docker exec openldap ldapadd -Q -Y EXTERNAL -H ldapi:/// -f /seedldif/00-add-objects.ldif
echo "Setting up Permissions for Binding User (Read all objects)"
docker exec openldap ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f /seedldif/01-permissions.ldif

echo ""
echo "Admin tool should be reachable on http://<dockerhost>:8080"
echo ""

