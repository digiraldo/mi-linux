



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
