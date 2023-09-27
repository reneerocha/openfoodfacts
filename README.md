# Backend Challenge 20220626


## Introdução

Nesse desafio trabalharemos no desenvolvimento de uma REST API que utilizará os dados do projeto Open Food Facts, um banco de dados aberto com informação nutricional de diversos produtos alimentícios.

## Iniciar o projeto

docker-compose build

docker-compose up

### Importar produtos
docker-compose run app rake products:crawler

#### Rodas Testes
docker-compose run app rspec .

#### Documentação API
- docker-compose up
- http://0.0.0.0:3000/api-docs/
