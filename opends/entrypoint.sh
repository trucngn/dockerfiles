#!/bin/bash

if [[ -z "$LDAP_BASEDN" ]]; then
    echo -n >&2 "Error: Container not configured and LDAP_BASEDN not set. "
    echo >&2 "Did you forget to add -e LDAP_BASEDN=\"dc=example,dc=com\" ?"
    exit 1
fi

if [[ -z "$LDAP_PASSWORD" ]]; then
    echo -n >&2 "Error: Container not configured and LDAP_PASSWORD not set. "
    echo >&2 "Did you forget to add -e LDAP_PASSWORD=secret-password ?"
    exit 1
fi

LDIF_IMPORT=""
LDIF_FILE=$(ls -1t /ldif/*.ldif 2> /dev/null | head -1)
if [[ $LDIF_FILE ]]; then
    LDIF_IMPORT="--ldifFile $LDIF_FILE"
fi

# Setup OpenDS
/data/OpenDS-${OPENDS_VERSION}/setup --baseDN ${LDAP_BASEDN} --rootUserPassword ${LDAP_PASSWORD} ${LDIF_IMPORT} --cli --no-prompt --verbose --doNotStart

# Start OpenDS
/data/OpenDS-${OPENDS_VERSION}/bin/start-ds --nodetach
