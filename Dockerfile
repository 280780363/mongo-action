FROM docker:stable

COPY ./docker-mongo /docker-mongo
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
