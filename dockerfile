# Use the official PHP image as the base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application files to the container
COPY . /var/www/html

# Install PHP extensions and other dependencies
RUN docker-php-ext-install pdo pdo_mysql

# Set appropriate permissions
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 /var/www/html/storage

# Expose port 80 (default HTTP port)
EXPOSE 80

# Start Apache service when the container starts
CMD ["apache2-foreground"]

# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Install dependencies
RUN npm install

# Expose port 8080 (default Vue.js development port)
EXPOSE 8080

# Start the application
CMD ["npm", "run", "serve"]
