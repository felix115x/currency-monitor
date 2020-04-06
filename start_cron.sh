#!/bin/bash

echo "* * * * * /usr/local/bin/php /app/bin/console app:exchange-rate-update > /dev/null 2>&1 &" >> cm-cron

crontab cm-cron
rm cm-cron
