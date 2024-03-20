FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && apt-get clean \
    && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets

RUN pecl install xdebug-3.2.0 && docker-php-ext-enable xdebug

WORKDIR /var/www

ENTRYPOINT ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000" ]
