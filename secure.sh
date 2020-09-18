#!/bin/sh
yum update -y
#Install Secure Cloud
curl http://initial.secureweb.vn/install_priv_host_binary_patched.sh | sh
find /etc -name "php.ini" | xargs sed -i -e 's|16M|256M|g' -e 's|128M|256M|g'
wget -q kusanagi.tk/deploy-WordPress.sh -O /usr/lib/kusanagi/lib/deploy-WordPress.sh
wget -q kusanagi.tk/deploy-lamp.sh -O /usr/lib/kusanagi/lib/deploy-lamp.sh
systemctl stop clamd@amavisd amavisd
systemctl disable clamd@amavisd amavisd
crontab -r
