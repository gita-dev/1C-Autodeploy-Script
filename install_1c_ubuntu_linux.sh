#!/bin/sh

apt-get update
apt-get -y upgrade
apt -y autoremove

apt-get install -y libwebkitgtk-3.0-0
dpkg -i ./1c-enterprise83-common_8.3.12-1440_amd64.deb 
dpkg -i ./1c-enterprise83-common-nls_8.3.12-1440_amd64.deb
dpkg -i ./1c-enterprise83-server_8.3.12-1440_amd64.deb
dpkg -i ./1c-enterprise83-client_8.3.12-1440_amd64.deb
dpkg -i 1c-enterprise83-client-nls_8.3.12-1440_amd64.deb
dpkg -i 1c-enterprise83-server-nls_8.3.12-1440_amd64.deb
apt-get -f -y install

ls /home/ | grep -v "lost+found" | grep -v "usr1cv8" | while read line;
    do
	chown -R $line:$line ./config/
	rsync -av ./config/ /home/$line/
    done