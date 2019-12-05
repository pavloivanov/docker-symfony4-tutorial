# Symfony 4 Tutorial using Docker 

## Getting started

### Prerequisites
```
Docker
```

### Installing
Build image
```$xslt
docker build -t symfony5-tutorial:1.0 .
```

Run container
```$xslt
docker container run -v d:/Dev/education/docker-symfony4-tutorial:/var/www/html --publish 8000:8080 --detach --name symfony5-tutorial symfony5-tutorial:1.0
```

Connect to Container
```$xslt
docker exec -it <CONTAINER_NAME> /bin/bash
``` 

Visit
```$xslt
http://127.0.0.1:8000
```