# README #

## clone sources
```
#!shell

mkdir cd /home/projects/
cd /home/projects/ 
git clone git@bitbucket.org:rippergun/morpion.git
```

## clone docker container

```
#!shell

cd /home/projects/ 
git clone git@bitbucket.org:rippergun/dockermorpion.git

cd docker-morpion && sudo docker-composer up

```

## add morpion.lan to hosts
```
#!shell

sudo su

echo "127.0.0.1 www.morpion.lan" >> /etc/hosts

```

## in docker 
se connecter au container

```
#!shell

sudo docker exec -ti morpion bash

```
#!shell

```

Dans le container

```
#!shell
cd /home/morpion && php artisan migrate

```

Enjoy sur www.morpion.lan