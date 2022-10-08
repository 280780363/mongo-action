#!/bin/sh

cd /docker-mongo

build="docker build -t mongodb/snc --build-arg VERSION=$INPUT_VERSION . "
sh -c "$build"
echo "image build finished, version: $INPUT_VERSION"

# run="docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$INPUT_USERNAME -e MONGO_INITDB_ROOT_PASSWORD=$INPUT_PASSWORD mongodb/snc mongod --replSet rs0 --keyFile /mongodb.key --bind_ip_all"
# sh -c "$run"
# echo "mongodb is running username: $INPUT_USERNAME, password: $INPUT_PASSWORD"

# sleep 20s

# rs='docker exec mongo sh -c "mongosh -u $INPUT_USERNAME, -p $INPUT_PASSWORD < /rs.js"'
# sh -c "$rs"
# echo "rs initiate finished"
