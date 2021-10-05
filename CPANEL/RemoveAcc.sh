#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e excluir contas cPanel com o estado de suspended                                                           #
# Script to validate and delete cPanel accounts with suspended state                                                              #
#                                                                                                                                 #
# Data de criação: 02/08/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
# Ansible Project: ANSIBLE/TerminatecPanelsAcc/                                                                                   #
#                                                                                                                                 #
###################################################################################################################################

for i in `find /var/cpanel/suspended/ -mtime +30 | cut -d'/' -f5 | sed '1 d'`
    do
        y | /scripts/removeacct $i;
    done;
