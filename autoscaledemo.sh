#!/bin/bash
#
# Script as required to add/update the application running on apache2
# in the Azure vmss.
#
echo "Citrix Auto-Scale Demo - host $HOSTNAME"
sudo apt update
sudo apt install -y apache2

# Create, then update index.html for mydoman
sudo mkdir /var/www/mydomain
sudo chown -R $USER:$USER /var/www/mydomain
sudo chmod -R 755 /var/www/mydomain
echo '<html><head><title>My Domain</title></head><body><H1>Welcome to My Domain!</H1></body></html>' | tee /var/www/mydomain/index.html

# /etc/apache2/sites-available/mydomain.conf
echo '<VirtualHost *:80>' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  ServerAdmin webmaster@localhost' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  ServerName mydomain' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  ServerAlias mydomain' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  DocumentRoot /var/www/mydomain' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  ErrorLog ${APACHE_LOG_DIR}/error.log' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '  CustomLog ${APACHE_LOG_DIR}/access.log combined' | sudo tee -a /etc/apache2/sites-available/mydomain.conf
echo '</VirtualHost>' | sudo tee -a  /etc/apache2/sites-available/mydomain.conf
#
sudo a2ensite /etc/apache2/sites-available/mydomain_ssl.conf
sudo a2dissite /etc/apache2/sites-available/000-default.conf
sudo apache2ctl configtest
sudo systemctl restart apache2
#
## Enable SSL website
#
# /etc/apache2/sites-available/mydomain_ssl.conf
echo '<VirtualHost *:443>' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  DocumentRoot /var/www/mydomain' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  SSLEngine on' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  SSLCertificateFile /etc/ssl/certs/mydomain.crt' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  SSLCertificateKeyFile /etc/ssl/private/mydomain.key' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  ErrorLog ${APACHE_LOG_DIR}/error.log' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '  CustomLog ${APACHE_LOG_DIR}/access.log combined' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
echo '</VirtualHost>' | sudo tee -a /etc/apache2/sites-available/mydomain_ssl.conf
#
sudo a2enmod ssl
sudo a2ensite mydomain_ssl.conf
sudo systemctl restart apache2
#
