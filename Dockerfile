FROM openresty/openresty:1.21.4.1-0-bullseye-fat


RUN apt-get update \
    && apt-get install -y --no-install-recommends logrotate cron procps \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

COPY nginx-logrotate.conf /etc/logrotate.d/openresty

RUN echo "0 0 * * * /usr/sbin/logrotate /etc/logrotate.d/openresty > /var/log/logrotate-cron.log 2>&1" | crontab -

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80 443

CMD ["/start.sh"]

