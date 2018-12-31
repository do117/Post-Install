# Post-Install
Script de post-install sur serveur

Installation de Screenfetch / Docker / Docker-Compose / Portainer
# Pré-requis
```bash
apt-get -y install git
git clone https://github.com/do117/Post-Install.git
cd Post-Install
chmod +x install.sh
```
# Execution
```bash
bash install.sh
```
# Suite
Création d'un utilisateur <USER>
```bash
adduser <USER>
usermod -a -G docker <USER>
```
Pour connaitre son UserID et GroupID
```bash
id <USER>
```
# Accès
Pour Portainer : nom de domaine pointant sur http://IP:9000
