#!/bin/bash

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e realizar envio de e-mails                                                                                 #
# Script to validate and send emails                                                                                              #
#                                                                                                                                 #
# Data de criação: 31/08/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
###################################################################################################################################

DATE1=$(date +'%Y-%m-%d')
EMAIL_FOR="email@domain"
EMAIL_TO="email@domaindomain"
MESSAGE=$(cat /recursos/Recursos__"$DATE1"__*)
SERVER="smtp.domain:587"
PASS="174H38gJsCec63BCA3zh94a1"

sendemail -f $EMAIL_FOR -t $EMAIL_TO -u "Relatório de Recursos" -m "$MESSAGE" -s $SERVER -xu (Your-user) -xp $PASS -o message-charset="utf-8"
