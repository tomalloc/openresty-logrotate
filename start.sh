#!/bin/bash
set -e

mkdir -p /var/spool/cron/crontabs/
if command -v crond &> /dev/null; then
    crond
elif command -v cron &> /dev/null; then
    cron
else
    echo "Error: Neither crond nor cron found. Cannot start cron service."
    exit 1
fi

if pgrep -x "crond" > /dev/null || pgrep -x "cron" > /dev/null; then
    echo "Cron daemon started successfully."
else
    echo "Warning: Cron daemon might not be running!"
fi

exec /usr/local/openresty/bin/openresty -g "daemon off;"