#!/bin/bash

# Función para leer la entrada del usuario con un mensaje
function read_with_prompt {
  variable_name="$1"
  prompt="$2"
  default="${3-}"
  unset $variable_name
  while [[ ! -n ${!variable_name} ]]; do
    read -p "$prompt: " $variable_name < /dev/tty
    if [ ! -n "`which xargs`" ]; then
      declare -g $variable_name=$(echo "${!variable_name}" | xargs)
    fi
    declare -g $variable_name=$(echo "${!variable_name}" | head -n1 | awk '{print $1;}')
    if [[ -z ${!variable_name} ]] && [[ -n "$default" ]] ; then
      declare -g $variable_name=$default
    fi
    echo -n "$prompt : ${!variable_name} -- aceptar? (y/n)"
    read answer < /dev/tty
    if [ "$answer" == "${answer#[Yy]}" ]; then
      unset $variable_name
    else
      echo "$prompt: ${!variable_name}"
    fi
  done
}

# Colores del terminal
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# Imprime una línea con color usando códigos de terminal
Print_Style() {
  printf "%s\n" "${2}$1${NORMAL}"
}

# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-22-04


echo -n "¿Iniciar instalaciones? (y/n)"
    read answer < /dev/tty
    if [ "$answer" != "${answer#[Yy]}" ]; then
      # Recuperar mundo e instalarlo en el servidor
        echo "========================================================================="
        Print_Style "Iniciando Recuperación con back.sh" "$YELLOW"
        echo "========================================================================="
        sleep 3s
        echo -e "\n\nActualizando paquetes Apt y cargando ultimos paquetes\n"
sleep 2s
sudo apt-get update -y && sudo apt-get upgrade -y

echo -e "\n\nInstalando Servidor Web Apache2 Web\n" 
sleep 2s
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

echo -e "\n\nInstalación de PHP y requisitos\n"
sleep 2s
sudo apt install php libapache2-mod-php php-mysql -y

echo -e "\n\nVersion de PHP instalada\n"
sleep 2s
php -v
sleep 3s

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
echo -e "\n\nActualizar el índice de paquetes e instalar las dependencias necesarias\n"
sleep 2s
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

# Importar la clave GPG de Microsoft utilizando wget
echo -e "\n\nImportar la clave GPG de Microsoft utilizando wget\n"
sleep 2s
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# habilitar el repositorio de VS Code
echo -e "\n\nHabilitar el repositorio de VS Code\n"
sleep 2s
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# iniciar la instalación del paquete
echo -e "\n\nIniciar la instalación del paquete\n"
sleep 2s
sudo apt install code






## Instalar Edge
# Actualizar Ubuntu
echo -e "\n\nActualizar Ubuntu para continuar instalacion de Edge\n"
sleep 2s
sudo apt update && sudo apt upgrade -y

# Instalar paquetes requeridos
echo -e "\n\nInstalar paquetes requeridos\n"
sleep 2s
sudo apt install apt-transport-https ca-certificates curl software-properties-common wget -y

# Importar clave GPG y repositorio de Microsoft Edge
echo -e "\n\nImportar clave GPG y repositorio de Microsoft Edge\n"
sleep 2s
sudo wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg

# Importar el repositorio de Microsoft Edge
echo -e "\n\nImportar el repositorio de Microsoft Edge\n"
sleep 2s
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list

# actualice su lista de repositorios para reflejar las nuevas adiciones.
echo -e "\n\nActualizando lista de repositorios para reflejar las nuevas adiciones\n"
sleep 2s
sudo apt update

# Instalar el navegador Microsoft Edge
echo -e "\n\nInstalar el navegador Microsoft Edge\n"
sleep 2s
sudo apt install microsoft-edge-stable

# Confirme la versión y la compilación de la versión de Microsoft Edge instalada en su sistema operativo
echo -e "\n\nConfirme la versión y la compilación de la versión de Microsoft Edge instalada en su sistema operativo\n"
sleep 2s
microsoft-edge -version

# Ejecute el microsoft-edge y comando para iniciar el navegador mientras puede continuar usando la sesión de terminal.
echo -e "\n\njecute el microsoft-edge y comando para iniciar el navegador mientras puede continuar usando la sesión de terminal\n"
sleep 2s
microsoft-edge &


## Instalar NodeJS
echo -e "\n\nInstalar NodeJS\n"
sleep 2s
sudo apt install nodejs

echo -e "\n\nVersiones de nodejs y npm instalados\n"
sleep 2s
node --version
npm --version
sleep 3s

## Instalar dbeaver para sql
# https://blonder413.wordpress.com/2021/05/20/instalar-dbeaver-ce-en-ubuntu-20-04/
echo -e "\n\nInstalar dbeaver para sql\n"
sleep 2s
sudo snap install dbeaver-ce


echo -e "\n\nInstalar Git\n"
sleep 2s
sudo apt install git

echo -e "\n\nMostrar version de Git\n"
sleep 2s
git --version
sleep 3s


# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
    fi



# https://www.nixcraft.com/t/mysql-failed-error-set-password-has-no-significance-for-user-root-localhost-as-the-authentication-method-used-doesnt-store-authentication-data-in-the-mysql-server-please-consider-using-alter-user/4233
Print_Style "Reinicias password en mysql" "$RED"
    echo -n "¿Desea reiniciar password en mysql? (y/n)"
    read answer < /dev/tty
    if [ "$answer" != "${answer#[Yy]}" ]; then
      # Recuperar mundo e instalarlo en el servidor
        echo "========================================================================="
        Print_Style "Iniciando Recuperacion del pass" "$YELLOW"
        echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root1234';"
        echo "exit"
        echo "========================================================================="
        echo "========================================================================="
        sleep 3s
        sudo killall -9 mysql_secure_installation
        sudo mysql
    fi

    echo -n "¿Desea configurar seguridad con el nuevo pass? (y/n)"
    read answer < /dev/tty
    if [ "$answer" != "${answer#[Yy]}" ]; then
      # Recuperar mundo e instalarlo en el servidor
        echo "========================================================================="
        Print_Style "Recuerde que el pass es root1234" "$YELLOW"
        echo "========================================================================="
        sleep 3s
        sudo mysql_secure_installation
    fi



