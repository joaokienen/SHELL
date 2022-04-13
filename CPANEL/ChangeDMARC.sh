#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e gerar alteração de apontamentos DMARC!                                                                      #
#                                                                                                                                 #
# Data de criação: 02/12/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
# Exemplo de uso com ansible: 'ansible-playbook playbook.yml --ask-vault-pass'                                                    #
#                                                                                                                                 #
###################################################################################################################################

DATE1=$(date +'%Y-%m-%d')
cp -a /var/named /var/named.$DATE1
hostname1=$(hostname)

echo "IP's cPanels" > /tmp/CPANELIPS.txt
echo > /tmp/RESULTSDMARKs.txt

for i in `whmapi1 get_domain_info api.columns.enable=1 api.columns.b=domain --output=json|jq -r '.data.domains[]| .domain'`
do

        command=$(dig +short MX $i | cut -d' ' -f2 | sed 's/.$//')
        command1=$(dig +short A "$command".)

        if [ -z $command1 ]; then
                command1=$(echo "0.0.0.0")
        fi

        if grep -q $command1 /tmp/CPANELIPS.txt; then
                for x in `cat /var/named/$i.db | grep -n "dmarc" | cut -d: -f1`
                do
                        whmapi1 removezonerecord zone=$i line=$x
                        whmapi1 addzonerecord domain=$i name=_dmarc.$i. class=IN ttl=86400 type=TXT txtdata="\"v=DMARC1;p=reject;rua=mailto:dmarc.hospedagem@mail.com.br;pct=100;ruf=mailto:dmarc.hospedagem@mail.com.br;fo=1;aspf=s;adkim=s;\""
                        echo "$i | Removed and Added!" >> /tmp/RESULTSDMARKs.txt
                done;
        else
                echo "$i | invalid MX record!" >> /tmp/RESULTSDMARKs.txt
        fi
done;
