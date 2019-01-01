#!/bin/bash
source ../.env
BACKEND_CONTAINER_NAME="${COMPOSE_PROJECT_NAME}_ox-backend_1"
echo "Please enter login data for new user account"
read -e -p "IMAP server: " -i "$DEFAULT_IMAP_SERVER" IMAP_SERVER
read -e -p "SMTP server: " -i "$DEFAULT_SMTP_SERVER" SMTP_SERVER
read -e -p "Imap login: " -i "$DEFAULT_IMAP_LOGIN" IMAP_LOGIN
read -e -p "E-Mail: " -i "$DEFAULT_EMAIL" EMAIL
stty -echo
echo -n "Username: "
read USERNAME
echo -n "Password: "
read PASSWORD
stty echo

echo "Executing create user command in running ox-backend container..."
#docker exec -i ox-backend -e PASSWORD="$PASSWORD" /opt/open-xchange/sbin/dockerox_create_user
docker exec $BACKEND_CONTAINER_NAME /opt/open-xchange/sbin/createuser -c 1 -A oxadmin -P "$OX_ADMIN_PASSWORD" -u ek \
-d "Test User" -g Test -s User -p $PASSWORD -e "$EMAIL" \
--imaplogin "$IMAP_LOGIN" --imapserver "$IMAP_SERVER" --smtpserver "$SMTP_SERVER"
echo "Done."

