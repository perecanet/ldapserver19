#! /bin/bash
# Install ldapserver

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /opt/docker/DB_CONFIG /var/lib/ldap/.
slaptest -f /opt/docker/slapd.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l /opt/docker/edt.org.usuaris.ldif
slapadd -F /etc/openldap/slapd.d -l /opt/docker/estudiants.ldif
chown -R ldap.ldap /etc/openldap/slapd.d
chown -R ldap.ldap /var/lib/ldap
cp /opt/docker/ldap.conf /etc/openldap/.

