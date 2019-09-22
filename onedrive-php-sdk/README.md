onedrive-php-sdk
================

Testing
-------

```sh
DOCKER_COMPOSE_FILES='../../docker-compose-files/onedrive-php-sdk'
```

```sh
docker-compose --file "$DOCKER_COMPOSE_FILES/docker-compose.yml" down

USER_ID=$(id --user) GROUP_ID=$(id --group) WORK_DIR=$(pwd) docker-compose --file "$DOCKER_COMPOSE_FILES/docker-compose.yml" up --detach

for php_version in 56; do
  docker-compose --file "$DOCKER_COMPOSE_FILES/docker-compose.yml" exec php-$php_version /opt/composer/composer --working-dir="$(pwd)" test:functional:parallel
done

docker-compose --file "$DOCKER_COMPOSE_FILES/docker-compose.yml" down
```
