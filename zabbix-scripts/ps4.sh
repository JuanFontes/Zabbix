#!/bin/bash

#script for get the less price of PlayStation 4 on the Boadica site and send data to Zabbix
#author: juan.rafael [@] gmail.com

URL_PS4="http://www.boadica.com.br/pesquisa/multi_playstation/precos?ClasseProdutoX=2&CodCategoriaX=13&XF=48&XT=8&XE=1&modelo=125665&regiao=&em_box=&cl=&preco_min=&preco_max="
HOST_ZABBIX=127.0.1.1
PORT=10051
HOST=boadica
KEY=ps4

/usr/bin/zabbix_sender -vv -z $HOST_ZABBIX -p $PORT -s$HOST -k$KEY -o $(GET $URL_PS4| egrep -o 'R\$ [0-9.]+' | head -1| tr -d " \t\n\r"| egrep -o '[0-9.]+')
