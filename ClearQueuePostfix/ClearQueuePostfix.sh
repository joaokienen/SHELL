#!/bin/bash

####################################################################################
#
# Script de monitoramento de filas!
#
# Autor: João Victor Kienen
# Data de criação: 23/06/2021
#
# Descrição: Script de monitoramento de estado de serviço das filas do cPanel com o zabbix!
# Validação com arquivo zabbix: /etc/zabbix/zabbix_agentd.conf
#
# Exemplo de uso: ./limpafilas.sh
#
####################################################################################

STATUS=$(mailq | awk 'BEGIN { RS = "" } { print $1 }' | wc -l)

if [ "$STATUS" -le "100" ]; then
        echo "0"
else
        postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /root@log/ { print $1 }' | tr -d '*!' | postsuper -d - ;
        postqueue -p | tail -n +2 | awk 'BEGIN { RS = "" } /MAILER-DAEMON@/ { print $1 }' | tr -d '*!' | postsuper -d -
fi
