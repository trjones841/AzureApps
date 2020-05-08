#! /bin/bash
#
# Script as required to add/update the application running on apache2
# in the Azure vmss.
#
echo "Citrix Auto-Scale Demo - host $HOSTNAME !"
sudo apt update
sudo apt install -y apache2

#
# sudo mkdir /var/www/my_domain
# sudo chown -R $USER:$USER /var/www/my_domain
# sudo chmod -R 755 /var/www/my_domain
# echo '<html><head><title>My Domain</title></head><body><H1>Welcome to My Domain!</H1></body></html>' | tee /var/www/my_domain/index.html
# sudo vim /etc/apache2/sites-available/my_domain.conf
#
# <VirtualHost *:80>
#    ServerAdmin webmaster@localhost
#    ServerName my_domain
#    ServerAlias my_domain
#    DocumentRoot /var/www/your_domain
#    ErrorLog ${APACHE_LOG_DIR}/error.log
#    CustomLog ${APACHE_LOG_DIR}/access.log combined
# </VirtualHost>
#
# sudo a2ensite your_domain.conf
# sudo a2dissite 000-default.conf
# sudo apache2ctl configtest
# sudo systemctl restart apache2
#
## Enable SSL website
#
#
# sudo vim /etc/apache2/sites-available/my_ssl_domain.conf
#
# <VirtualHost 192.168.0.1:443>
# 	DocumentRoot /var/www/
#	SSLEngine on
#	SSLCertificateFile /path/to/your_domain_name.crt
#	SSLCertificateKeyFile /path/to/your_private.key
#	SSLCertificateChainFile /path/to/DigiCertCA.crt
# </VirtualHost>
#
# sudo a2enmod ssl
# sudo a2ensite my_ssl_domain.conf
# sudo systemctl restart apache2
#
