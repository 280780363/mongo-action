#!/bin/sh

cd /docker-mongo
verion=$INPUT_VERSION
username=$INPUT_USERNAME
password=INPUT_PASSWORD

build="docker build -t mongodb/snc --build-arg VERSION=$version . "
sh -c "$build"
echo "image build finished, version: $version"

run="docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$username -e MONGO_INITDB_ROOT_PASSWORD=$password mongodb/snc mongod --replSet rs0 --keyFile /mongodb.key --bind_ip_all"
sh -c "$run"
echo "mongodb is running username: $username, password: $password"

sleep 20s

rs='docker exec mongo sh -c "mongosh -u $n, -p $password < /rs.js"'
sh -c "$rs"
echo "rs initiate finished"
