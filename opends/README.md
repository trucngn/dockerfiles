#### A container to setup and run OpenDS LDAP server.

*Environment variables*:
- `LDAP_BASEDN` - Base DN for user information in the Directory Server eg. "dc=example,dc=com"
- `LDAP_PASSWORD` - Password for the initial root user for the Directory Server

*Docker run example*:

`$> docker run -d --name ldap-server -e LDAP_BASEDN="dc=acme,dc=com" -e LDAP_PASSWORD=secret-password -v /host/path/to/ldif:/ldif -p 389:389 tnguyen1/opends`