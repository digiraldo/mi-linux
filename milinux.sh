#!/bin/bash


# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-22-04

echo -e "\n\nActualizando paquetes Apt y cargando ultimos paquetes\n"
sleep 2s
sudo apt-get update -y && sudo apt-get upgrade -y

echo -e "\n\nInstalando Servidor Web Apache2 Web\n" 
sleep 2s
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

echo -e "\n\nInstalación de PHP y requisitos\n"
sleep 2s
sudo apt install php libapache2-mod-php php-mysql -y

php -v
sleep 2s

echo -e "\n\nInstalando MySQL\n"
sleep 2s
sudo apt-get install mysql-server mysql-client -y

echo -e "\n\nEjecutando  script de seguridad de mysql\n"
sleep 2s
# sudo mysql_secure_installation

echo -e "\n\nPermisos para /var/www\n"
sleep 2s
sudo chown -R www-data:www-data /var/www
echo -e "\n\n Se han establecido permisos.\n"
sleep 2s

echo -e "\n\nHabilitación de módulos\n"
sleep 2s
sudo a2enmod rewrite
sudo phpenmod mcrypt

echo -e "\n\nReiniciando Apache\n"
sleep 2s
sudo service apache2 restart

echo -e "\n\nLAMP Instalación completa"




## Instalar VSCODE
# Actualizar el índice de paquetes e instalar las dependencias necesarias 
sudo apt update; sudo apt install software-properties-common apt-transport-https wget

# Importar la clave GPG de Microsoft utilizando wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# habilitar el repositorio de VS Code
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# iniciar la instalación del paquete
sudo apt install code






## Instalar Edge
# Actualizar Ubuntu
sudo apt update && sudo apt upgrade -y

# Instalar paquetes requeridos
sudo apt install apt-transport-https ca-certificates curl software-properties-common wget -y

# Importar clave GPG y repositorio de Microsoft Edge
sudo wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg

# Importar el repositorio de Microsoft Edge
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list

# actualice su lista de repositorios para reflejar las nuevas adiciones.
sudo apt update

# Instalar el navegador Microsoft Edge
sudo apt install microsoft-edge-stable

# Confirme la versión y la compilación de la versión de Microsoft Edge instalada en su sistema operativo
microsoft-edge -version

# Ejecute el microsoft-edge y comando para iniciar el navegador mientras puede continuar usando la sesión de terminal.
microsoft-edge &


## Instalar NodeJS
sudo apt install nodejs

node --version
npm --version

## Instalar dbeaver para sql
# https://blonder413.wordpress.com/2021/05/20/instalar-dbeaver-ce-en-ubuntu-20-04/
sudo snap install dbeaver-ce


sudo apt install git
git --version