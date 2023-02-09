<div align="center">

![](https://img.shields.io/badge/Status-Em%20Desenvolvimento-orange)
</div>

<div align="center">

# POC Messaging Fanout Pattern
![](https://img.shields.io/badge/Autor-Wesley%20Oliveira%20Santos-brightgreen)
![](https://img.shields.io/badge/IAC-Terraform-brightgreen)
![](https://img.shields.io/badge/Arquitetura-Messaging%20Fanout%20Pattern-brightgreen)
</div> 

<div align="center">

## Arquitetura
![Arquitetura](docs/messaging-fanout-pattern.png "Arquitetura")
</div>


## Fundamentos teóricos

> Fan-out é um padrão de mensagens em que as mensagens são transmitidas de um para muitos. Um exemplo básico desse padrão pode ser visto na funcionalidade de um sistema de mensagens Publish/Subscribe, já que o Pub/Sub implica a capacidade de rotear mensagens de um único remetente para vários destinatários.

## Exemplo do funcionamento

### Simulando aplicação publicando no SNS

> Envie um evento e no Message attributes preencha as informações que foi definida na filter_policy

![Pub-SNS](docs/publicando-evento-no-sns.png "Pub-SNS")

> Conforme a imagem a baixo podemos ver que o evento foi recebido

![Filas-SQS](docs/evento-recebido-fila-pessoa-fisica.png "Filas-SQS")

> Consumido o evento na fila de pessoa_fisica podemos ver que roteamento foi realizado com sucesso.

![Filas-SQS](docs/evento-consumido.png "Filas-SQS")
