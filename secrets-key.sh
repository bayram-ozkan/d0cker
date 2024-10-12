#!/bin/bash

mysql_password=$(openssl rand -base64 16)


# Secret dosyasını oluştur
echo "${mysql_r_pwd}" > mysqlpass.txt

# Docker secret'ı oluştur
docker secret create mysql_password mysqlpass.txt


echo "MySQL secret created and registered with Docker."


