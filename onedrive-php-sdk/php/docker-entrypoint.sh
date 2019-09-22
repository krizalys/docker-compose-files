#!/bin/sh

ensure_composer_installed() {
  local path="$1"

  if [ ! -x "$path" ]; then
    php --run "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php --run "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php --filename=composer --install-dir="$(dirname $path)"
    php --run "unlink('composer-setup.php');"
  fi

  PATH="/opt/composer:$PATH"
}

ensure_dependencies_installed() {
  local path="$1"

  if [ ! -f "$path/vendor/autoload.php" ]; then
    (cd $path; composer install && rm -f composer.lock)
  fi
}

ensure_composer_installed /opt/composer/composer
ensure_dependencies_installed "$WORK_DIR"
exec "$@"
