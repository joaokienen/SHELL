#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar alteração de apontamentos SPF!                                                                      #
#                                                                                                                                 #
# Data de criação: 19/10/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

DATE1=$(date +'%Y-%m-%d')
cp -a /var/named /var/named.$DATE1

for i in `cat /etc/trueuserdomains | cut -d: -f1`
do
        for y in `cat /var/named/$i.db | grep "v=spf1" | awk '{print $1}'`
        do
                for x in `cat /var/named/$i.db | grep -n "v=spf1" | cut -d: -f1`
                do
                        TASK=$(cat /var/named/$i.db | grep "v=spf1" | rev | cut -d'"' -f2 | rev | sed 's/+mx//g' | tr -s " ")
                        TASK1=$(echo $TASK +include:_spf.domain.com.br -all)
                        whmapi1 editzonerecord domain=$i line=$x name=$y class=IN ttl=86400 type=TXT txtdata="$TASK1"
                done;
        done;
done;
