#!/bin/bash

# Variáveis de ambiente
PATH_DIR="$(cd "$(dirname "$0")"; pwd)"
PATH_BASE="$(basename "$0")"
PATH_ENV="$PATH_DIR/$(basename "$1").env"
PATH_INFO="/bin/bash $PATH_DIR/$PATH_BASE"

# Busca variaveis de ambiente
if [ -f $PATH_ENV ]; then
  # Load Environment Variables
  export $(cat "$PATH_ENV" | grep -v '#' | awk '/=/ {print $1}')
fi

# Verifica se ela foi iniciada
if [ -z "$GITHUB_TOKEN" ]; then echo "Configurar a variável de ambiente GITHUB_TOKEN no arquivo .env"; exit 1; fi

# Armazena entrada do usuário para nome do APP
echo "Informe o nome do seu novo APP Laravel com Docker"
read GITHUB_REPONAME

# Criação do repositório no Github
GITHUB_RESPONSE=".githubresponse.json"
GITHUB_OUTPUT="$PATH_DIR/$GITHUB_RESPONSE"
curl -X POST -H "Content-Type: application/json" --silent https://api.github.com/user/repos?access_token=$GITHUB_TOKEN -d '{"name":"'$GITHUB_REPONAME'"}' > $GITHUB_OUTPUT

# # Armazena o httpcode da repostas 
# GITHUB_STATUSCODE=$(curl --write-out %{http_code} --silent --output /dev/null -X POST -H "Content-Type: application/json" -d '{"name":"'$GITHUB_REPONAME'"}' "https://api.github.com/user/repos?access_token=$GITHUB_TOKEN")
# echo $GITHUB_STATUSCODE

# Armazena valores de retorno
GITHUB_ERROR="$(cat $GITHUB_OUTPUT | jq -r '.message')"
GITHUB_REPOURL="$(cat $GITHUB_OUTPUT | jq -r '.clone_url')"

# Verificação se repositório foi criado
if ($(jq 'has("message")' < $GITHUB_OUTPUT))  then
  echo $GITHUB_ERROR; exit 1;
fi

# Instala pacote do laravel
composer create-project laravel/laravel $GITHUB_REPONAME
cd $GITHUB_REPONAME

git init
git add .
git commit -m "first commit"

git remote add origin $GITHUB_REPOURL
git branch -M main
git push -u origin main

cp .env.example .env