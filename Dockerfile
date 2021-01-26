FROM alpine

RUN apk add --no-cache apk-cron nodejs npm  && rm -rf /var/cache/apk/*
RUN npm install -g gamedig

RUN echo '*/1 * * * * /gamedig.sh > /status.json' > /crontab.txt
RUN touch /status.json
RUN chmod 755 /status.json
RUN /usr/bin/crontab /crontab.txt

ADD gamedig.sh /gamedig.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /gamedig.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["crond", "-f", "-l", "8"]
