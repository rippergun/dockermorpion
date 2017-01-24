# README #

## clone sources
mkdir cd /home/projects/
cd /home/projects/ 
git clone git@bitbucket.org:rippergun/morpion.git

## clone docker container
cd /home/projects/ 
git clone git@bitbucket.org:rippergun/dockermorpion.git

cd docker-morpion
sudo docker-composer up

#€ add morpion.lan to hosts
sudo su
echo "127.0.0.1 www.morpion.lan" >> /etc/hosts