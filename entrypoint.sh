#!/bin/sh

cd /docker-mongo

build="docker build -t mongodb/snc --build-arg VERSION=$VERSION . "
sh -c "$build"
echo 'image build finished'

run="docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$USERNAME -e MONGO_INITDB_ROOT_PASSWORD=$PASSWORD mongodb/snc mongod --replSet rs0 --keyFile /mongodb.key --bind_ip_all"
sh -c "$run"
echo 'mongodb is running'

sleep 20s

rs='docker exec mongo sh -c "mongosh -u $USERNAME -p $PASSWORD < /rs.js"'
sh -c "$rs"
echo 'rs initiate finished'


