# Use the official PHP image with Apache
FROM php:8.2-apache

# Install system dependencies and PHP extensions as needed
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (often needed for frameworks like Laravel)
RUN a2enmod rewrite

# Set working directory in container
WORKDIR /var/www/html
RUN pwd
# Copy project files into the container
COPY ./website/ /var/www/html/

# Set recommended permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apache2-foreground"]
