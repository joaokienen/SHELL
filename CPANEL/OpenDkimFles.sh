#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e copiar chaves DKIM                                                                                        #
#                                                                                                                                 #
# Data de criação: 14/10/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

for i in `find /etc/opendkim/keys/ | cut -d'/' -f5 | sed '1 d'`
    do
        echo "default._domainkey.$i $i:default:/etc/opendkim/keys/$i " >> /etc/opendkim/KeyTable
        echo "*@$i default._domainkey.$i" >> /etc/opendkim/SigningTable
    done;
