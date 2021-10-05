#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar arquivos de resursos listados                                                                       #
# Script to validate and generate listed resource files                                                                           #
#                                                                                                                                 #
# Data de criação: 11/08/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
# Ansible Project: ANSIBLE/MonitorDataCheck/                                                                                      #
#                                                                                                                                 #
#                                                                                                                                 #
###################################################################################################################################

DATE1=$(date +'%Y-%m-%d')
HOSTNAME1=$(hostname)
SISTEMA=$(cat /etc/*-release | tail -n 1)
IP=$(curl ifconfig.me | awk {'print $1'})
CPU=$(lscpu | grep "CPU(s):" | head -n 1 | awk {'print $2'})
MEM=$(free -m | grep "Mem:" | awk {'print $2'})
SWAP=$(free -m | grep "Swap:" | awk {'print $2'})

EHOSTNAME1=$(echo "SERVER: $HOSTNAME1")
ESISTEMA=$(echo "DISTRIBUCTION: $SISTEMA")
EIP=$(echo "IP: $IP")
ECPU=$(echo "Número de processadores: $CPU")
EMEM=$(echo "Quantidade de memória: $MEM M")
ESWAP=$(echo "Quantidade de Swap: $SWAP M")

mkdir -p /recursos
echo "$EHOSTNAME1 | $ESISTEMA | $EIP" > /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt
echo "" >> /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt
echo "$ECPU | $EMEM | $ESWAP" >> /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt
echo "" >> /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt
df -h >> /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt
echo "" >> /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt

# scp -P 50022 /recursos/Recursos__"$DATE1"__"$HOSTNAME1".txt skyrim@10.0.0.1:/recursos/
