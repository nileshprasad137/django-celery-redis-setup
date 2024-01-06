This is a simple demonstration of backend architecture with Django as the application server and Redis as a message broker for Celery. 

In order to run this, you would need to have docker installed.

### Setup and Run

After cloning this article go to root folder of the project and execute.

```
docker-compose up --build
```

Once containers are running, you could log into django shell to play around with tasks and redis. 

