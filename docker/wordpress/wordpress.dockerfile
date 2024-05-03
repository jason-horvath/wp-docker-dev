FROM wordpress:6.5.2-php8.3-fpm

# Install additional packages and Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Copy the custom PHP configuration
COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

# Xdebug config
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini