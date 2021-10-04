#!/bin/bash
################################################################################################################################
#                                                                                                                              #
# Script de validação para Backups                                                                                             #
#                                                                                                                              #
# Autor: João Victor Kienen                                                                                                    #
# Data de criação: 03/05/2021                                                                                                  #
#                                                                                                                              #
# Descrição: Script para extração e criptografia de informações do Banco de Dados e Wordpress com o objetivo de gerar Backups! #
#                                                                                                                              #
# Exemplo de uso: ./BACKUP.sh                                                                                                  #
#                                                                                                                              #
################################################################################################################################

# Variáveis:
date0=$(date +'%Y-%m-%d') # Transforma variável já existente para formato 'YYYY-MM-DD'

# Extração e compactação de dados:
cd /var/www/backups # Acessar diretório especificado
mysqldump feirinha -u feirinha_backup --password='4f3h4fi47y@=md38&5' > feirinha_mysql_$date0.dump # Extrair DUMP
bzip2 -z feirinha_mysql_$date0.dump # Adiciona DUMP extraído para arquivo.bz2
tar -cvjf feirinha_$date0.tar.bz2 /var/www/html/wordpress # Adiciona diretório Wordpress para arquivo.tar.bz2

# Realiza criptografia de arquivos:
gpg --pinentry-mode loopback --passphrase="123" --yes --symmetric feirinha_$date0.tar.bz2 # Criptografa arquivos do Wordpress
gpg --pinentry-mode loopback --passphrase="123" --yes --symmetric feirinha_mysql_$date0.dump.bz2 # Criptografa DUMP do Banco de Dados

# Exclusão de arquivos não criptografados:
rm -rf feirinha_$date0.tar.bz2 # Exclui arquivos do Wordpress
rm -rf feirinha_mysql_$date0.dump.bz2 # Exclui DUMP do Banco de Dados

# EXTRAS:
# Descriptografar arquivo: 'gpg --output arquivo --passphrase="123" --decrypt --yes arquivo.gpg'
# Utilizar senha de outro arquivo para criptografia: 'gpg --output arquivo --passphrase="123" --decrypt --yes arquivo.gpg'
