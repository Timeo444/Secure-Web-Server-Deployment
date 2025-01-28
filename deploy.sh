#!/bin/bash

# Copy web files to /var/www/html
sudo cp -r ~/Secure-Server_Deployment/website/* /var/www/html/

# Copy Apache config if needed
sudo cp ~/Secure-Server_Deployment/apache-config/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2

echo "Deployment completed successfully!"

