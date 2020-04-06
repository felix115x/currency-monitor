# currency-monitor

To install and run, Docker & Docker compose are needed

```
composer update
```
All dependencies are now installed under /vendors

```
docker-compose up --build -d
```
This will create docker containers for the app itself, and an instance of MySQL database with host mysql linked to the first container, and on port 3306.
With all parameters specified in the app configurations, proceed to http://localhost:8080

In order to launch crons in the created docker container, use 

```
docker-compose exec cm-app sh /app/start_cron.sh
docker-compose exec cm-app cron
```

Alternatively, the command that downloads the currency data is also available manually the same way
```
docker-compose exec cm-app /usr/local/bin/php /app/bin/console app:exchange-rate-update
```
For list of all available currencies 
```
docker-compose exec cm-app /usr/local/bin/php /app/bin/console app:currency-list-update
```
