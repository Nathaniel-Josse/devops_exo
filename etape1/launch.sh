docker pull nginx:1.29.2

docker pull php:latest

docker network create reseau

docker container run -d -p 8080:80 -v .:/usr/share/nginx/html --name http --network reseau nginx:1.29.2

docker container run -d -v ./index.php:/app --name script --network reseau php:latest

docker container cp http:/etc/nginx/conf.d/default.conf ./config/default.conf

# Modification du fichier default.conf à la main sur VSCode pour ajouter le support de PHP. On rerun le container http après avoir supprimé l'ancien.

docker container stop http
docker container rm http

docker container run -d -p 8080:80 -v .:/usr/share/nginx/html --name http --network reseau nginx:1.29.2