FROM debian:buster

RUN apt-get update && apt-get install -y wget php php-mysql php-pgsql php-sqlite3 php-xml php-mbstring

RUN mkdir /adminer && \
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php" \
    -O /adminer/index.php

WORKDIR /adminer

CMD ["php", "-S", "0.0.0.0:8080", "index.php"]
