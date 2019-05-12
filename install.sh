#!/bin/bash
#
# 31/12/18
# Sur Debian 9 - Script Post-install
# Installation de Screenfetch / Docker / Docker-Compose / Portainer
#
#Définition des couleurs
bleuclair='\e[1;34m' vertfonce='\e[0;32m' neutre='\e[0;m'
#
#Screenfetch
#
echo ""
echo -e "${bleuclair}Installation de Screenfetch${neutre}" 
echo ""
apt-get -y install screenfetch
echo '#Installation Screenfetch' >> ~/.bashrc
echo 'if [ -f /usr/bin/screenfetch ]; then screenfetch; fi' >> ~/.bashrc
#
#Docker
#
echo ""
echo -e "${bleuclair}Installation de Docker${neutre}"
echo ""
apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce
#
#Docker Compose
#
echo ""
echo -e "${bleuclair}Installation de Docker-Compose${neutre}"
echo ""
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#
#Portainer
#
echo ""
echo -e "${bleuclair}Installation de Portainer${neutre}"
echo ""
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
#
#Bilan
#
echo ""
echo -e "${bleuclair}##########################################${neutre}"
echo -e "${bleuclair}## Installation de Screenfetch :${neutre} ${vertfonce}OK${neutre}"
echo -e "${bleuclair}## Installation de Docker :${neutre} ${vertfonce}OK${neutre}"
echo -e "${bleuclair}## Installation de Docker-Compose :${neutre} ${vertfonce}OK${neutre}"
echo -e "${bleuclair}## Installation de Portainer :${neutre} ${vertfonce}OK${neutre}"
echo -e "${bleuclair}##########################################${neutre}"
echo ""
