#!/bin/bash

####################################################################################
#
# Script de exclusão
#
# Autor: João Victor Kienen
# Data de criação: 22/01/2021
#
# Descrição: Script de limpeza para pasta: /repositorio/outrosAnexosEmail
#
# Exemplo de uso: ./LimparAnexosEmails.sh
#
####################################################################################

# Encontra arquivos e realiza a exclusão com a excessão '-not -name' para arquivo listado!
find /repositorio/outrosAnexosEmail -type f -not -name "^([0-9]{8})_([0-9]{3})_([0-9]{14})_([0-9]{2})_(([0-2]\\d|[3][0-1])([0]\\d|[1][0-2])[2][0]\\d{2})_([01][0-9]|2[0-3])[0-5][0-9]_.*" -delete
~
