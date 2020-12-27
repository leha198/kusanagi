#!/bin/sh
root_dir=/usr/share
kpass=`head /dev/urandom | tr -dc a-z0-9A-Z | head -c 10`
dpass=`head /dev/urandom | tr -dc a-z0-9A-Z | head -c 12`
ipa=`hostname -I | awk '{print $1}'`
function k_update {
	if [ ! -d /home/kusanagi ]; then
		echo "Please rebuild VPS with image KUSANAGI"
		sleep 2; exit
	fi
	pidyum=`ps aux | grep yum | awk '{print $2}' | head -1`
	kill -9 $pidyum > /dev/null 2>&1
	yum update -y
}
function k_init {
	if [ -f /root/kusanagi.pem ]; then
		rm -f /root/kusanagi.pem
	fi
	while :; do
		kusanagi init --tz Asia/Ho_Chi_Minh --lang en --keyboard en --passwd $kpass --nophrase --dbrootpass $kpass --nginx --php7 --ruby24 --dbsystem mariadb
		mysql -u root -p$kpass -e exit
		if [ $? -eq 0 ]; then
			break
		fi
	done
	openssl dhparam -out /etc/kusanagi.d/ssl/dhparam.key 2048 > /dev/null 2>&1
}
function k_panel {
	cd $root_dir
	if [ -d "cPanel" ]; then
		rm -rf cPanel
	fi
	wget -q kusanagi.tk/cPanel.tar.gz
	tar -xf cPanel.tar.gz
	wget -q kusanagi.tk/c_panel.sql
	mysql -u root -p$kpass -e "drop database if exists c_panel;"
	mysql -u root -p$kpass -e "create database c_panel;"
	mysql -u root -p$kpass -e "grant all on c_panel.* to 'cpanel_user'@'localhost' identified by '$kpass';"
	mysql -u root -p$kpass -e "flush privileges;"
	mysql -u cpanel_user -p$kpass c_panel < c_panel.sql
	cd cPanel
	sed -i "s|100faf1c|$kpass|g" password-hashing.php
	php password-hashing.php
	rm -f password-hashing.php; cd ..
	chown -R kusanagi.www cPanel
	rm -f cPanel.tar.gz c_panel.sql
}
function k_phpadmin {
	cd $root_dir
	if [ -d mysqlmanager ]; then
		rm -rf mysqlmanager
	fi
	wget -q kusanagi.tk/mysqlmanager.tar.gz
	tar -xf mysqlmanager.tar.gz
	chown -R kusanagi.www mysqlmanager
	rm -f mysqlmanager.tar.gz
}
function k_filerun {
	cd $root_dir
	if [ -d filerun ]; then
		rm -rf filerun
	fi
	wget -q kusanagi.tk/filerun.tar.gz
	tar -xf filerun.tar.gz
	sed -i "s|100faf1c|$kpass|" filerun/system/data/autoconfig.php
	wget -q kusanagi.tk/Filerun_db.sql
	mysql -u root -p$kpass -e "drop database if exists Filerun_db;"
	mysql -u root -p$kpass -e "create database Filerun_db;"
	mysql -u root -p$kpass -e "grant all on Filerun_db.* to 'Filerun_user'@'localhost' identified by '$kpass';"
	mysql -u root -p$kpass -e "flush privileges;"
	mysql -u Filerun_user -p$kpass Filerun_db < Filerun_db.sql
	chown -R httpd.www filerun
	rm -f filerun.tar.gz Filerun_db.sql
}
function k_php {
	dir_ext=`grep 'extension_dir = ' /etc/php7.d/php.ini | tail -1 | awk -F'"' '{print $2}'`
	wget -q kusanagi.tk/www.conf -O /etc/php7-fpm.d/www.conf
	wget -q kusanagi.tk/panel.conf -O /etc/php7-fpm.d/panel.conf
	wget -q kusanagi.tk/filerun.conf -O /etc/php7-fpm.d/filerun.conf
	wget -q kusanagi.tk/ioncube.so -O $dir_ext/ioncube.so
	echo "zend_extension = $dir_ext/ioncube.so" > /etc/php7.d/extensions/00-ioncube.ini
	wget -q kusanagi.tk/bolt.so -O $dir_ext/bolt.so
	echo "extension=bolt.so" > /etc/php7.d/extensions/bolt.ini
	chown -R root.www /var/lib/php /var/lib/php7 /var/log/php7-fpm /var/log/php-fpm
}
function k_user {
	if ! grep -q "kusanagi" /etc/sudoers; then
		echo "kusanagi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
	fi
	usermod -G kusanagi httpd
	chmod 775 /home/kusanagi
	rm -f /home/kusanagi/.* > /dev/null 2>&1
	sed -i 's|#Port 22|Port 9090|' /etc/ssh/sshd_config
	systemctl restart sshd
}
function k_nginx {
	cd /etc/nginx/conf.d
	rm -f _http.conf _ssl.conf
	wget -q kusanagi.tk/http.conf -O http.conf
	sed -i "s|default_server|$ipa|" http.conf
	sed -i 's|20M|256M|g' /etc/nginx/nginx.conf
	chown -R httpd.www /var/cache/nginx
}
function k_script {
	cd /usr/src
	if [ -d "cPanel" ]; then
		rm -rf cPanel
	fi
	mkdir cPanel; cd cPanel
	wget -q kusanagi.tk/backup.tar.gz
	tar -xf backup.tar.gz
	chmod +x *; rm -f backup.tar.gz
	mkdir -p /backup/backup-daily /backup/backup-weekly /backup/backup-monthly
	wget -q kusanagi.tk/backup_daily -O /etc/cron.daily/backup_daily
	wget -q kusanagi.tk/backup_weekly -O /etc/cron.weekly/backup_weekly
	wget -q kusanagi.tk/backup_monthly -O /etc/cron.monthly/backup_monthly
	chmod +x /etc/cron.weekly/backup_weekly
	wget -q kusanagi.tk/deploy-WordPress.sh -O /usr/lib/kusanagi/lib/deploy-WordPress.sh
	wget -q kusanagi.tk/deploy-lamp.sh -O /usr/lib/kusanagi/lib/deploy-lamp.sh
}
function k_safe {
	life=/usr/src/lifesafety
	if [ -f "$life" ]; then
		rm -f $life
	fi
	echo "$kpass" > $life
	ran=`openssl rand -base64 20`
	sed -i "s|$|$ran|" $life
}
function deploy_imav {
	mkdir -p /var/www/imav /etc/sysconfig/imunify360
	echo "[paths]" > /etc/sysconfig/imunify360/integration.conf
	echo "ui_path = /var/www/imav" >> /etc/sysconfig/imunify360/integration.conf
	cd; wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh
	bash imav-deploy.sh
	useradd -M imav
	echo "imav:$dpass" | chpasswd
	echo "imav" >> /etc/sysconfig/imunify360/auth.admin
	systemctl enable imunify-antivirus
	systemctl start imunify-antivirus
	rm -f imav-deploy.sh
}
function k_imav {
	which imunify-antivirus > /dev/null 2>&1
	if [ $? = 0 ]; then
		echo "imav:$dpass" | chpasswd
	else
		deploy_imav
	fi
}
function deploy_ftp {
	which vsftpd > /dev/null 2>&1
	if [ $? = 0 ]; then
		yum remove vsftpd -y
	fi
	yum install pure-ftpd -y
	wget -q kusanagi.tk/pure-ftpd.conf -O /etc/pure-ftpd/pure-ftpd.conf
	systemctl enable pure-ftpd
	systemctl start pure-ftpd
	(echo $dpass;echo $dpass) | pure-pw useradd admin -u httpd -g www -d /home/kusanagi > /dev/null 2>&1
	pure-pw mkdb
	systemctl restart pure-ftpd
}
function k_ftp {
	which pure-ftpd > /dev/null 2>&1
	if [ $? = 0 ]; then
		(echo $dpass;echo $dpass) | pure-pw passwd admin > /dev/null 2>&1
		pure-pw mkdb
		systemctl restart pure-ftpd
	else
		deploy_ftp
	fi
}
function k_info {
	k_ver=`kusanagi -V | head -1 | awk '{print $3}'`
	cat <<EOF > /etc/motd
    __ ____  _______ ___    _   _____   __________
   / //_/ / / / ___//   |  / | / /   | / ____/  _/
  / ,< / / / /\__ \/ /| | /  |/ / /| |/ / __ / /
 / /| / /_/ /___/ / ___ |/ /|  / ___ / /_/ // /
/_/ |_\____//____/_/  |_/_/ |_/_/  |_\____/___/
	
Version $k_ver, Powered by Prime Strategy.
==================================================
Kusanagi panel login:
[Weblink]   http://$ipa/cPanel
[Account]   admin
[Pass   ]   $kpass

phpMyAdmin login:
[Weblink]   http://$ipa/mysqlmanager
[Account]   root
[Pass   ]   $kpass

Imunify-AV login:
[Weblink]   http://$ipa/imav
[Account]   imav
[Pass   ]   $dpass

FTP account login:
[Host   ]   $ipa
[Account]   admin
[Pass   ]   $dpass
==================================================
EOF
clear; cat /etc/motd
echo "SSH login port: 9090"
echo "Login command: ssh -p 9090 root@$ipa"
}
k_update
k_init
k_panel
k_filerun
k_phpadmin
k_nginx
k_php
k_script
k_user
k_safe
k_ftp
k_imav
k_info
kusanagi restart
