#!/bin/bash
#@author eu [@] juanfontes.com.br
#@description script de envio dos valores de cotacao do dolar, euro e indicio ibovespa para o zabbix-server

#variaveis servidor zabbix
ZABBIXSERVER="127.0.0.1"
ZABBIXPORT="10051"
ZABBIXHOST="cotacao"
JSONCOTACAO="http://developers.agenciaideias.com.br/cotacoes/json"

#moedas cotadas
cotacao[0]="dolar"
cotacao[1]="euro"
cotacao[2]="bovespa"

#verifica se zabbix_sender esta instalado, se sim, realiza o envio dos valores para o servidor
if ! which zabbix_sender > /dev/null; then
   echo -e "[ERROR] zabbix_sender não está instalado. \n"
else
        for i in {0..2}
                do
$(which zabbix_sender) -z $ZABBIXSERVER -p $ZABBIXPORT -s$ZABBIXHOST -k"$(echo ${cotacao[$i]})" -o "$(GET $JSONCOTACAO | $(which jq) '.'${cotacao[$i]}'.cotacao')" > /dev/null
        done
fi