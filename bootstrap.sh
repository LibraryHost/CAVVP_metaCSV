#!/usr/bin/env bash

apt-get update

apt-get install -y apache2
a2enmod rewrite
service apache2 restart

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpw'
dev,noexec,nosuid
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpw'
apt-get install -y mysql-server
mysql -u root -prootpw < /vagrant/projectSettings/dbinit


apt-get install -y php5
apt-get install -y php5-mysql
sudo a2enmod rewrite
sudo service apache2 restart

apt-get install -y imagemagick --fix-missing

apt-get install -y unzip

rm -rf /var/www
mkdir /vagrant/www
ln -fs /vagrant/www /var/www 

cd 
wget http://omeka.org/files/omeka-2.2.zip
unzip omeka-2.2.zip

sudo mv omeka-2.2/* /var/www
sudo mv omeka-2.2/.htaccess /var/www

sudo cp -rf  /vagrant/projectSettings/root/* /
sudo mysql -u root -prootpw omeka < /vagrant/projectSettings/omeka.sql

sudo groupadd webdev
sudo usermod -a -G webdev root
sudo usermod -a -G webdev vagrant

cd /var

sudo chmod 775 www
cd /var/www

sudo find . -type d | xargs sudo chmod 775
sudo find . -type f | xargs sudo chmod 664
sudo find files -type d | xargs sudo chmod 777
sudo find files -type f | xargs sudo chmod 666

sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars

sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars

chown -R vagrant:www-data /var/lock/apache2

sudo service apache2 restart

