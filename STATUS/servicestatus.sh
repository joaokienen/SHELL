#!/bin/bash

####################################################################################
#
# Script de monitoramento de serviço!
#
# Autor: João Kienen
# Data de criação: 12/02/2021
#
# Descrição: Script de monitoramento de estado de serviço com o zabbix!
# Description: Service state monitoring script with zabbix!
# Validação com arquivo zabbix: /etc/zabbix/zabbix_agentd.conf
#
####################################################################################

STATUS=$(systemctl show -p SubState your.service)

if [ "$STATUS" = "SubState=running" ]; then
    echo "0"
else
    echo "1"
    exit 1
fi
