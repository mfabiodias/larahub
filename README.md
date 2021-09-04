# Laravel Github APP
Script para criação de aplicativo Laravel com criação de repositório no GitHub.

## Requisitos
Para utilizar o script para criação e sincronismo com seu repósitorio do GitHub é necessário vc ter configurado em sua maquina:
- Linux 
- Composer >= 2.x

### VsCode com GitHub sincronizado (Opcional)
1. git config --global user.email "you@example.com"
2. git config --global user.name "Your Name"

### WSL2 com Ubuntu (Opcional)
- sudo apt-get update 
- sudo apt install php7.4-cli
- sudo apt-get install -y jq zip curl unzip php-mbstring
- sudo apt-get install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y 

### Composer com Ubuntu (Opcional)
- php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
- php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
- php composer-setup.php
- php -r "unlink('composer-setup.php');"
- sudo mv composer.phar /usr/local/bin/composer

### Laradock (Opcional)
Se desejar utilizar sua aplicação Dockerizada você pode querer conhecer mais o Laradock
- Ref.: https://www.youtube.com/watch?v=GienvDWdBmo
- Ref.: https://github.com/Laradock/laradock.git

## Utilização do Script de criação de aplicação APP e Github repositório 
1. git clone https://github.com/mfabiodias/larahub.git
2. cp .env.example .env
3. Criar Github Access Token in https://github.com/settings/tokens 
4. Adicionar seu token de acesso no arquivo .env na variável GITHUB_TOKEN
5. Criar aplicativos com o comando: 
- /bin/bash  larahub/create_app.sh

### OBS: 
- O sistema sera criado no diretório que ele for executado, tenha isso em mente!