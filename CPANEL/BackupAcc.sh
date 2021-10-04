#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar backup de contas cPanel com o estado de suspended                                                   #
# Script to validate and backup cPanel accounts with suspended state                                                              #
#                                                                                                                                 #
# Data de criação: 02/08/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

for i in `find /var/cpanel/suspended/ -mtime +30 | cut -d'/' -f5 | sed '1 d'`
    do
        /scripts/pkgacct $i;
        #sleep 10
        #scp -P 22 /home/cpmove-"$i".tar.gz user@server:/etc/suspendedBackupcPanel/
    done;
