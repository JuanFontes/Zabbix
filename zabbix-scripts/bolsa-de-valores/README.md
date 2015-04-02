#Acompanhamento de cotação de moedas no Zabbix

> **Note:**
O script consiste em pegar a cotação do dolar através do site http://developers.agenciaideias.com.br/cotacoes e mandar para o zabbix utilizando o zabbix_sender, parseando o json com o comando jq.

Instruções
----------

Baixar o pacote compilado dependendo da sua versão do sistema, dar permissão de execução e mover para o diretório /usr/bin

- $ wget http://stedolan.github.io/jq/download/linux32/jq (32-bit system)
- $ wget http://stedolan.github.io/jq/download/linux64/jq (64-bit system)
- $ chmod +x ./jq
- $ sudo cp jq /usr/bin

* Baixar o script send_cotacao.sh para o servidor
* Baixar o template e importar ele no servidor

Você pode executar o script manualmente e após isso, colocá-lo em uma Cron para execução automática

# Contato

Atualizações / forks / sugestões são todas bem vindas!

*  E-mail; eu [@] juanfontes.com.br
*  Twitter; @JuanFontes
*  Linkedin; http://br.linkedin.com/in/juanfontes