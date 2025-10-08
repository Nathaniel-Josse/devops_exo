docker pull nginx:1.29.2

docker pull php:fpm

docker network create reseau

docker container run -d -p 8080:80 -v .:/usr/share/nginx/html --name http --network reseau nginx:1.29.2

docker container run -d -v .:/app --name script --network reseau php:fpm

docker container cp http:/etc/nginx/conf.d/default.conf ./config/default.conf

# Modification du fichier default.conf à la main sur VSCode pour ajouter le support de PHP.

docker container cp ./config/default.conf http:/etc/nginx/conf.d/default.conf