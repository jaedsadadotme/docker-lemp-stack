FROM php:fpm

RUN apt-get update -y && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev
RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev 
    
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install json \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install exif \
    && docker-php-ext-install gd 

RUN cp /usr/share/zoneinfo/Asia/Bangkok /etc/localtime \
    && echo "Asia/Bangkok" >  /etc/timezone
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer
EXPOSE 9000
CMD ["php-fpm"]