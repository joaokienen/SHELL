#!/bin/bash

####################################################################################
#
# Script de monitoramento de filas!
#
# Autor: João Kienen
# Data de criação: 23/06/2021
#
# Descrição: Script para limpeza logs SMTP assim que fila estiver em acúmulo.
# Description: Script for clearing SMTP logs as soon as queue builds up.
# Validação com arquivo zabbix: /etc/zabbix/zabbix_agentd.conf
#
####################################################################################

STATUS=$(mailq | awk 'BEGIN { RS = "" } { print $1 }' | wc -l)

if [ "$STATUS" -le "100" ]; then
        echo "0"
else
        postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /root@log/ { print $1 }' | tr -d '*!' | postsuper -d - ;
        postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /MAILER-DAEMON@/ { print $1 }' | tr -d '*!' | postsuper -d -
fi
