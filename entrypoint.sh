#!/bin/sh

cd /docker-mongo

docker build -t mongodb/snc --build-arg VERSION=latest . 

echo 'image build finished'

docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$USERNAME -e MONGO_INITDB_ROOT_PASSWORD=$PASSWORD mongodb/snc mongod --replSet rs0 --keyFile /mongodb.key --bind_ip_all

echo 'mongodb is running'

sleep 20s

docker exec mongo sh -c "mongosh -u ${USERNAME} -p ${PASSWORD} < /rs.js"

echo 'rs initiate finished'


