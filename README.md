# Docker Python 3.10 com Google Cloud SDK

Este projeto configura um ambiente Docker com Python 3.12 e Google Cloud SDK. Ele é útil para desenvolvedores que precisam de um ambiente consistente para desenvolver e testar aplicações que utilizam Python e Google Cloud.

## Pré-requisitos

- Docker
- Docker Compose

## Como usar

### Passo 1: Construir a imagem Docker

Para construir a imagem Docker, execute o seguinte comando na raiz do projeto:

```bash
docker-compose build
```

### Passo 2: Executar o contêiner

Para iniciar o contêiner, execute:

```bash
docker-compose up -d
```

### Passo 3: Acessar o contêiner

Para acessar o contêiner em execução, use o comando:

```bash
docker-compose exec docker /bin/bash
```

### Verificar as versões instaladas

Dentro do contêiner, você pode verificar as versões do Python e do Google Cloud SDK:

```bash
python3.10 --version
gcloud --version
```

## Estrutura do Projeto

- `Dockerfile`: Define a imagem Docker com Python 3.10 e Google Cloud SDK.
- `docker-compose.yml`: Configura o serviço Docker para construir e executar a imagem.

## Personalização

Você pode personalizar a versão do Python ou do Google Cloud SDK editando as variáveis no `Dockerfile`.

## Contribuição

Sinta-se à vontade para abrir issues ou enviar pull requests para melhorias.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
