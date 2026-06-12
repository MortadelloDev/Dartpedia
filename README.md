--------------------------------------------------------------------------------

# Projeto Dartpedia - Orientado pelo professor: IRINEU MOURA CALDEIRA
### T1DEV-T5

--------------------------------------------------------------------------------

## Integrantes do Grupo (Contribuidores):

- Natan do Carmo Silva
- Micael Silvestre Cacilha
- Talyson Morgado Almeida da Silva

--------------------------------------------------------------------------------

## Descrição:

O nosso projeto Dartpedia, usa a linguagem 'Dart' para puxar pesquisas e artigos
direto da Wikipedia usando linhas de comando em CLI (_Command-Line Interface_)

--------------------------------------------------------------------------------

## Objetivos:

- Trabalhar com dados JSON
- Use o bloco `try/catch` para lidar com falhas.
- Trabalhar com listas e variáveis
- Escrever um código assíncrono com futures e await.
- Obter dados em tempo real da API da Wikipédia.
- Usar exportações para definir uma API pública.
- Utilizar enums aprimorados com campos e métodos.
- Construir URIs complexas com parâmetros de consulta
- Criar um cliente de API HTTP pronto para produção.
- Integrar o registro de logs aos seus comandos de linha de comando.

--------------------------------------------------------------------------------

## Pré-Requisitos para conseguir rodar os códigos:

1. Um terminal com um ambiente Dart configurado. (Tutorial [aqui!](https://dart.dev/get-dart)).
2. Com o ambiente configurado, copie o diretório usando o comando abaixo:

```
git clone https://github.com/MortadelloDev/Dartpedia
```

3. Após copiar o diretório entre na pasta `dartpedia`
> [!WARNING]
> Não confundir com `Dartpedia`!!! Entre até a `dartpedia`

4. Vá até a pasta `cli` e use os comandos listados mais para baixo.

--------------------------------------------------------------------------------

## Comandos dispoinveis:

Search (Pesquisar):
Pesquisar na Wikipedia.

`dart run bin/cli.dart search suapesquisaaqui`
> [!WARNING]
> Depois do `search` o que você quer pesquisar não deve ter espaços"

------------

Article (Artigo):
Pesquisar artigo na Wikipedia.

`dart run bin/cli.dart article suapesquisaaqui`
> [!WARNING]
> Depois do `article` o que você quer pesquisar não deve ter espaços"

------------

Help (Ajuda):
Lista de comandos disponiveis, caso você esqueça.

`dart run bin/cli.dart help --verbose`
`dart run bin/cli.dart help`

--------------------------------------------------------------------------------

Feito com amor e carinho por:
- Natan do Carmo Silva
- Micael Silvestre Cacilha
- Talyson Morgado Almeida da Silva

--------------------------------------------------------------------------------

Versão atual: 0.0.19

--------------------------------------------------------------------------------


