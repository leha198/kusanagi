#!/bin/sh
yum update -y
#Install securecloud
curl http://initial.secureweb.vn/install_priv_host_binary_patched.sh | sh
#Change deploy web
yes|cp /usr/lib/kusanagi-wp/wp-config-sample.php /usr/lib/kusanagi/resource/wp-config-sample/en_US/wp-config-sample.php
cd /tmp
wget kusanagi.tk/tmp.tar && tar -xf tmp.tar
yes|mv deploy-WordPress.sh deploy-lamp.sh /usr/lib/kusanagi/lib
yes|mv default.conf /etc/nginx/naxsi.d/wordpress
yes|mv server.cnf /etc/my.cnf.d
rm -f tmp.tar
#Change php and nginx
find /usr/lib/kusanagi/resource/etc/nginx/conf.d -name "*.WordPress" | xargs sed -i -e 's/120s/300/g'
find /etc -name "php.ini" | xargs sed -i -e 's/16M/1024M/g' -e 's/128M/256M/g'
find /etc -name "php.ini" | xargs sed -i -e 's/time = 30/time = 1000/g' -e 's/time = 60/time = 1000/g'
#Disable dangerous Func
php=$(find /etc -name "www.conf")
for i in $php; do
        echo "php_admin_value[disable_functions] = exec,passthru,shell_exec,system,proc_open,popen,parse_ini_file,show_source" >> $i
        sed -i -e 's/= 500/= 1000/g' -e 's/= 90/= 1000/g' $i
done
systemctl stop clamd@amavisd amavisd
systemctl disable clamd@amavisd amavisd
crontab -r
reboot
