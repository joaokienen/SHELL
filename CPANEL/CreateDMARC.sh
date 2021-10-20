#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar criação de apontamento DMARC!                                                                       #
#                                                                                                                                 #
# Data de criação: 19/10/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

echo > "IP's" > /tmp/CPANELIPS.txt

for i in `cat /etc/trueuserdomains | cut -d: -f1`
        do
                command=$(dig MX $i | grep MX | tail -n1 | rev | cut -d'X' -f1 | rev | cut -d' ' -f2)
                command1=$(dig A $command | grep A | tail -n1 | rev | cut -d'A' -f1 | rev | cut -d' ' -f2)

                if grep -q $command1 /tmp/CPANELIPS.txt; then
                        if grep -q _dmarc /var/named/$i.db;  then
                                echo "Record Exists!"
                        else
                                whmapi1 addzonerecord domain=$i name=_dmarc.$i. class=IN ttl=86400 type=TXT txtdata="\"v=DMARC1;p=none;sp=none;adkim=r;aspf=r;pct=100;fo=0;rf=afrf;ri=86400\""
                        fi
                else
                        echo "Apontamento não será criado!"
                fi
        done;

