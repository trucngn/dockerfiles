# A container to setup and run OpenDS LDAP server.

**Docker image:** [tnguyen1/ldap-opends](https://registry.hub.docker.com/u/tnguyen1/ldap-opends/)

## Environment variables*:

- `LDAP_BASEDN` - Base DN for user information in the Directory Server eg. "dc=example,dc=com"
- `LDAP_PASSWORD` - Password for the initial root user for the Directory Server

## Docker run example

The container will import the first `.ldif` file found in `/ldif` volume when starting.

`$> docker run -d --name ldap-server -e LDAP_BASEDN="dc=acme,dc=com" -e LDAP_PASSWORD=secret-password -v /host/path/to/ldif:/ldif -p 389:389 tnguyen1/ldap-opends`
