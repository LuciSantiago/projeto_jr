## 💻 Pré-requisitos

* Flutter Versão 3.3.10
* json_rest_server 1.3.1
* Projeto mobile e Web

## 💻 Json Rest Server
* O Json Rest Server simula um servidor RESTful. Escolhi esse package, pois além de simular um servidor é possivel salvar as informações através de um json. No arquivo database.json possui algumas pessoas aleatórias para teste e os dados em si são fictícios.


## 🚀 Instalando o Projeto (via terminal)

Para instalar o projeto, siga estas etapas:

Abra o seu terminal, navegue até uma pasta da sua escolha e clone o projeto
```
git clone https://github.com/LuciSantiago/projeto_jr.git
```
Navegue para a pasta do projeto
```
cd projeto_jr
```
Rode o comando para atualizar as dependencias:
```
flutter pub get
```
Se você tiver utilizando o vscode, abra o projeto com o seguinte comando:
```
code .
```
Caso contrário, não feche o terminal e abra o projeto na sua ide e volte ao terminal e
rode o comando para instalar o Json_rest_server:
```
dart pub global activate json_rest_server
```
A pasta do servidor já existe, então navegue até ela com o comando:
```
cd backend
```
Rode o comando para iniciar o Json_rest_server:
```
json_rest_server run
```
Se apareceu as seguinte mensagem:
- Json Rest Server Server started, responding on:
- http://localhost:8080/
- 'ipv4 ou ipv6'

Tudo certo, o servidor está rodando (não feche o terminal), agora copie o seu ipv4 que apareceu, e se for o ipv6,
através do comando ipconfig/all no temrinal é possivel resgatar o ipv4.
Com o Ipv4 na mão, em person_repository.dart no diretório (app/data/repository/person_repository.dart), na linha
8 substitua o ip existente pelo seu.

Feito isso, rode o projeto na plataforma a sua escolha!

