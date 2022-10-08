FROM mongo:${VERSION}

COPY ./rs.js /rs.js
COPY ./mongodb.key /mongodb.key

RUN chmod 600 /mongodb.key
RUN chown mongodb:mongodb /mongodb.key

EXPOSE 27017

CMD ["mongod"]