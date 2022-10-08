#!/bin/sh

cd /docker-mongo

docker build -t mongodb/snc --build-arg VERSION=$VERSION . 

docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$USERNAME -e MONGO_INITDB_ROOT_PASSWORD=$PASSWORD mongodb/snc mongod --replSet rs0 --keyFile /mongodb.key --bind_ip_all

sleep 20s

docker exec mongo sh -c "mongosh -u mongo -p 123123 < /rs.js"


