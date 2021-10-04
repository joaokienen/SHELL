#!/bin/bash

####################################################################################
#
# Script de exclusão
#
# Autor: João Kienen
# Data de criação: 22/01/2021
#
# Descrição: Script de limpeza para pasta: /repositorio/outrosAnexosEmail
# Description: Cleanup script for folder: /repository/otherEmail Attachments
#
#
####################################################################################

# Encontra arquivos e realiza a exclusão com a excessão '-not -name' para arquivo listado!
# Find files and perform deletion with exception '-not -name' for listed file!
find /repositorio/outrosAnexosEmail -type f -not -name "item" -delete

