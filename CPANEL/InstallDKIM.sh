#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e copiar chaves DKIM                                                                                        #
#                                                                                                                                 #
# Data de criação: 14/10/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

# Encontra contas suspensas e deleta chaves DKIM
for i in `find /var/cpanel/suspended/ | cut -d'/' -f5 | sed '1 d'`
    do
        /usr/local/cpanel/bin/dkim_keys_uninstall $i;
    done;

# Encontra todos os usuários e cria chaves DKIM atualizadas
for i in `find /var/cpanel/users/ | cut -d'/' -f5 | sed '1 d'`
    do
        /usr/local/cpanel/bin/dkim_keys_install $i;
    done;
