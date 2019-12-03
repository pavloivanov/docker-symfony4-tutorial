# Symfony 4 Tutorial using Docker 

## Getting started

### Prerequisites
```
Docker
```

### Installing
Build image
```$xslt
docker build -t docker-symfony4-tutorial:1.0 .
```
Run container
```$xslt
docker container run -v d:/Dev/education/docker-symfony4-tutorial:/var/www/symfony_tutorial --publish 8000:8080 --detach --name dst docker-symfony4-tutorial:1.0
```