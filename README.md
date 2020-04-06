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

