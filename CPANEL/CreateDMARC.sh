#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar criação de apontamento DMARC!                                                                       #
#                                                                                                                                 #
# Data de criação: 19/10/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

for i in `cat /etc/trueuserdomains | cut -d: -f1`
        do
                if grep -q _dmarc /var/named/$i.db;  then
                        echo "Record Exists!"
                else
                        whmapi1 addzonerecord domain=$i name=_dmarc.$i. class=IN ttl=86400 type=TXT txtdata="\"v=DMARC1;p=none;sp=none;adkim=r;aspf=r;pct=100;fo=0;rf=afrf;ri=86400\""
                fi
        done;
