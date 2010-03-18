#!/bin/sh

# ------------------------------------------------------------------------------
# Simple installer script to configure Ubuntu 9.10 images on EC2
# ------------------------------------------------------------------------------

if [ "x$(id -u)" != "x0" ]; then
	echo "You must be root to run this script (try sudo)"
	exit 1
fi

apt-get update
apt-get upgrade --show-upgraded

PKGS="git-core ruby rake rubygems irb chef curl zip unzip httpd openjdk-6-jre-headless sysstat mysql-client jruby1.2 ruby1.8-dev libopenssl-ruby1.8 rdoc ri irb build-essential wget ssl-cert ohai httpd mlocate libxml2-dev libxslt-dev libcurl3 mysql mysql-server mysql-dev libmysqlclient15-dev apache2-mpm-prefork libcurl4-openssl-dev ntp librspec-ruby1.8"

for name in $PKGS; do
	apt-get -y install $name
done
