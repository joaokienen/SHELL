#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e excluir contas com o estado de suspended                                                                  #
#                                                                                                                                 #
# Data de criação: 02/08/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
#                                                                                                                                 #
###################################################################################################################################

for i in `find /var/cpanel/suspended/ -mtime +30 | cut -d'/' -f5 | sed '1 d'`
    do
        y | /scripts/removeacct $i;
    done;
