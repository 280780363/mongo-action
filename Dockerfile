FROM docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY ./docker-mongo /docker-mongo

ENTRYPOINT ["/entrypoint.sh"]
