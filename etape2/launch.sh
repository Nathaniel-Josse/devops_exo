docker pull nginx:1.29.2
docker pull php:fpm
docker pull mariadb:latest

docker network create reseau2

docker container run -d -p 8081:80 -v .:/usr/share/nginx/html --name http2 --network reseau2 nginx:1.29.2

docker container run -d -v .:/app --name script2 --network reseau2 php:fpm

docker container run -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=site -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MARIADB_RANDOM_ROOT_PASSWORD=yes -v "$(pwd)/create.sql:/docker-entrypoint-initdb.d/create.sql" --name data2 --network reseau2 mariadb:latest

# We add mysqli extension to php-fpm
docker container exec -it script2 docker-php-ext-install mysqli