# Gunakan base image PHP 8.2 FPM
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install dependencies dan ekstensi PHP
RUN apt-get update && apt-get install -y \
    curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    gettext \
    libzip-dev \
    libicu-dev \
    libmariadb-dev \
    unzip \
    make \
    openssl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql intl zip gettext \
    && docker-php-ext-enable mysqli

# Copy aplikasi ke container
COPY ./blog/ ./

# Copy custom php.ini
# COPY ./dockerfiles/php.ini /usr/local/etc/php/conf.d/custom.ini

# Expose port PHP-FPM (biasanya 9000)
EXPOSE 9000
