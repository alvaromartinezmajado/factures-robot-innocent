FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mysqli zip bcmath exif

# Enable apache rewrite module
RUN a2enmod rewrite

# Set up the working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Fix permissions
RUN chown -R www-data:www-data /var/www/html
