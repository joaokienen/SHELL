#!/bin/sh

####################################################################################
#
# Script de monitoramento de filas!
#
# Autor: João Kienen
# Data de criação: 23/06/2021
#
# Descrição: Script de monitoramento de estado de serviço das filas do cPanel com o zabbix!
# Description: cPanel queues service state monitoring script with zabbix!
# Validação com arquivo zabbix: /etc/zabbix/zabbix_agentd.conf
#
####################################################################################

STATUS=$(mailq | awk 'BEGIN { RS = "" } { print $1 }' | wc -l)

if [ "$STATUS" -ge "900" ]; then
        echo "1"
else
        echo "0"
fi
