# Use the official PHP image with Apache
FROM  devopsedu/webapp

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
CMD ["apache2ctl", "-D", "FOREGROUND"]
