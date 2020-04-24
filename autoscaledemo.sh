#
# Script as required to add/update the application running on apache2
# in the Azure vmss.
#
apt install apache2
echo "Citrix Auto-Scale Demo - host" $HOSTNAME "!" | sudo tee /var/www/html/index.html
