/*-----------------------------------------------------------------------------

Informações:

O Aplicativo cli faz parte do projeto Dartpedia

O cli é nosso primeiro aplicativo que esta sendo desenvolvimento usando Dart.

cli.dart - Fica localizado na pasta dartpedia, em /dartpedia/cli/bin.

Outra informações importantes sobre o cli; nosso aplicativo.

site		:
Autor		: Natan do Carmo Silva <natan.do.carmo.ndc@gmail.com>
Manuntencão	:

-------------------------------------------------------------------------------

Funcionamento:

Inicialmente o cli, ao ser executado mostra uma saudação na tela, por exemplo:

Dentro da pasta dartpedia em home/natan.carmo/dartpedia/cli rode o comando
dart run; deve aparecer a mensagem de saudacao, "Hello, Dart!"

Obs. Importante ! Este aplicativo esta em desenvolvimento e ao longo do tempo o comportamento pode mudar.

-------------------------------------------------------------------------------

Dicionario do Versionamento:

v = versao

0 = inicio do versionamento

. = implementacao de versionamento

1 = proxima versao, 2, proxima versao, e assim por diante.

---------------------------------------+----------------------------------------

Historico de versionamento

-------------------------------------------------------------------------------

Versao: 0.0.0

Data: 10/04/2026

Descricao do codigo: Codigo original....

Codigo:

import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) {
	print('Hello World: ${cli.calculate{()}');
}

Saida padrao ao executar o codigo:

Comando: dart run bin/cli.dart || dart bin/cli.dart

Saida: Hello World: 42!

-------------------------------------------------------------------------------

Versao 0.0.1

Data: 10/04/2026

Descricao: Simplifique a saida por enquanto. Apague a primeira linha (voce nao precisa dessa declaracao de importacao) e altere a print declaracao para exibir uma saudacao simples:

import 'package:cli/cli.dart' as cli; // Delete this entire line

void main(List<String> arguments) {
  print('Hello, Dart!'); // Change this line
        print('Hello Word: ${cli.calculate()}!');
}

4. Salve o arquivo. Em seguida, no terminal, execute o programa novamente:

Codigo:

void main(List<String> arguments) {
  print('Hello, Dart!'); // Change this line
}

Saida padrao ao executar o codigo:

Comando: dart run \\ dart run bin/cli.dart

Saida: Hello, Dart!

-------------------------------------------------------------------------------


Versao: 0.0.2

Data: 10/04/2026

Descricao:

Implemente o versioncomando em cli/bin/cli.dart: Adicione logica para lidar com um versioncomando que imprime a versao atual da CLI. Use um if instruÃ§Ã£o `if` para verificar se o primeiro argumento fornecido eh `true` version. Voce tambem precisara de uma version constante.

Primeiro, acima da sua main funcao, declare uma const variavel para a versao. O valor de uma const variavel nunca pode ser alterado depois de ter sido definido:

const version = '0.0.1'; // Add this line

Em seguida, modifique sua mainfuncao para verificar o versionargumento:

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello, Dart!');
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
}

Essa $version sintaxe eh chamada de interpolacao de strings. Ela permite incorporar o valor da variaveldiretamente em uma string, prefixando o nome da variavel com um $sinal.

Codigo:

const version = '0.0.2';


void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello, Dart!');
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
}

Saida padrao ao executar o codigo:

Comando: dart run || dart bin/cli.dart

Saida: Dartpedia CLI version 0.0.2

-------------------------------------------------------------------------------

Versao: 0.0.3

Data: 10/04/2026

Descricao:

Adicione uma printUsage funcao: Para tornar a saida mais amigavel ao usuario, crie uma funcao separada para exibir as informacoes de uso. Coloque essa funcao fora e abaixo da sua mainfuncao principal.

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

search eh o comando que eventualmente fara a busca na Wikipedia.


Codigo:

const version = '0.0.3';

void main(List<String> arguments) {
	if (arguments.isEmpty) {
		print('Hello, Dart');
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
	}
}

void printUsage() {
	print(
		"The following commands are valid: 'help, 'version', 'search <ARTICLE-TITLE>'"
	);
}

Saida padrao ao executar o codigo:

Comando: dart run || dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.3

-------------------------------------------------------------------------------

Versao: 0.0.4

Data: 10/04/2026

Descricao: 

Implemente o help comando e refine main: Agora, integre o help comando usando uma else if instrucao e limpe o comportamento padrao para chamar a printUsage funcao.

Modifique sua main funcao para que fique assim:

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage(); // Change this from 'Hello, Dart!'
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else {
    printUsage(); // Catch-all for any unrecognized command.
  }
}

Entenda a if/else estrutura e as variaveis: Agora que voce implementou o fluxo de controle na main funcao, revise o codigo que foi adicionado a ela.

    . arguments.isEmpty Verifica se nenhum argumento de linha de comando foi fornecido.

    . arguments.first Acessa o primeiro argumento, que voce esta usando como nosso comando.

    . version eh declarado como um const. Isso significa que seu valor eh conhecido em tempo de compilacao e voce nao pode altera-lo durante a execucao.
    
    . arguments eh uma variavel regular (nao constante) porque seu conteudo pode mudar durante a execucao com base na entrada do usuario     .

dart bin/cli.dart help

Tente tambem executa-lo sem nenhum argumento:

dart bin/cli.dart

Observe que as informacoes de uso continuam sendo exibidas. Neste ponto, qualquer comando que voce nao tenha definido tambem exibira informacoes de uso. Este eh o comportamento esperado por enquanto.


Codigo:

const version = '0.0.4';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage(); // Change this from 'Hello, Dart!'
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else {
    printUsage(); // Catch-all for any unrecognized command.
  }
}

Saida padrao ao executar:

Comando: dart bin/cli.dart help || dart run

Saida: Hello Dart

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.4

-------------------------------------------------------------------------------

Version: 0.0.5

Data: 17/04/26

Descrição:
 Integre o search comando em main: Primeiro, modifique a mainfuncao cli/bin/cli.dart para incluir um else iframo que lide com o search comando. Por enquanto, basta imprimir uma mensagem de espaÃ§o reservado.

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    print('Search command recognized!');
  } else {
    printUsage();
  }
}



Codigo:

const version = '0.0.5';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printUsage();
  } else if (arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    print('Search command recognized!');
  } else {
    printUsage();
  }
}

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}


Saida padrao ao executar o codigo:


Comando: cli.dart help || dart run

Saida: "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"

Comando: cli.dart version

Saida: 'Dartpedia CLI version 0.0.5'

Comando: cli.dart search

Saida: 'Search command recognized!'

-------------------------------------------------------------------------------

Versao:  0.0.6

Data: 24/04/26

Descrição: Defina a searchWikipedia funcao: O search comando eventualmente executara a logica principal do seu aplicativo chamando uma funcao chamada searchWikipedia. Por enquanto, faca com que ela searchWikipedia imprima os argumentos passados para ela com o search comando. 

Codigo: 

const version = '0.0.6';


void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    print('Search command recognized!');
  } else {
    printUsage();
  }
}


// ... (your existing main function)

void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type
  print('searchWikipedia received arguments: $arguments');
}

// ... (your existing printUsage() function)
void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}



Saida padrão ao executar o código:

Comando: dart cli.dart version
Saida: Dartpedia CLI version 0.0.6

Comando: dart cli.dart help
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart || dart cli.dart run
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart search
Saida: Search command recognized!

-------------------------------------------------------------------------------

Versao: 0.0.7

Data: 24/04/26

Descrição: hame a searchWikipedia funcao a partir da mainfuncao: Agora, modifique o search bloco de comando main para chamar searchWikipedia e passar quaisquer argumentos que venham apos o search proprio comando. Use arguments.sublist(1) para obter todos os argumentos a partir do segundo. Se nenhum argumento for fornecido apos search, passe null para searchWikipedia.

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

Principais trechos do codigo anterior:

final As variaveis so podem ser definidas uma vez e sao usadas quando voce nao pretende altera-las novamente no codigo.
arguments.sublist(1) cria uma nova lista contendo todos os elementos da arguments lista apos o primeiro elemento (que era search).
arguments.length > 1 ? ... : null;eh um operador condicional (ternario). Ele garante que, se nenhum argumento for fornecido apos o search comando, inputArgsse torne null, correspondendo ao comportamento do codigo de exemplo para searchWikipedia o arguments parametro de List<String>?.




Código:

const version = '0.0.7';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}



// ... (your existing main function)

void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type
  print('searchWikipedia received arguments: $arguments');
}

// ... (your existing printUsage() function)
void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}



Saida padrao ao executor:

Comando: dart cli.dart version
Saida: Dartpedia CLI version 0.0.7

Comando: dart cli.dart help
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart || dart cli.dart run
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart search
Saida: searchWikipedia received arguments: null

Comando: dart cli.dart search dart (EXEMPLO)
Saida: searchWikipedia received arguments: [dart]


-------------------------------------------------------------------------------

Versao: 0.0.8
Data: 24/04/26
Descrição:
Lide com a falta do titulo do artigo e a entrada do usuario com o stdin comando: Eh mais amigavel ao usuario solicitar o titulo caso ele nao o forneca na linha de comando. Use stdin.readLineSync() para isso.

Primeiro, adicione a importacao necessaria no inicio do seu cli/bin/cli.dart arquivo:

import 'dart:io'; // Add this line at the top

dart:io Eh uma biblioteca central no SDK do Dart e fornece APIs para lidar com arquivos, diretorios, sockets, clientes e servidores HTTP, e muito mais.

Agora, atualize sua searchWikipedia funÃ§ao.

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Current article title: $articleTitle');
}

O bloco de codigo anterior introduz alguns conceitos-chave:

Declara uma final String articleTitle variavel. Isso permite que a analise estatica detecte que ela articleTitle sera um valor Stringe nao sera nula.

Em seguida, uma if/else instrucao verifica se os argumentos da linha de comando para a pesquisa foram fornecidos.

Caso faltem argumentos, o programa solicita informacoes ao usuario, le a entrada usando `read` stdin.readLineSync()e lida de forma segura com os casos em que nenhuma entrada eh fornecida.

Caso existam argumentos , ele arguments.join(' ') os combina em uma unica string de busca.

Principais trechos do codigo anterior:

stdin.readLineSync() ?? ''Le a entrada do usuario. Embora stdin.readLineSync() possa retornar nulo, o operador de coalescencia nula (`\ ??n`) eh usado para fornecer uma string vazia (`\ ''n`) como alternativa caso a entrada seja nula. Esta eh uma maneira concisa de garantir que a variavel seja uma string nao nula.

arguments.join(' ') Concatena todos os elementos da arguments lista em uma unica string, usando um espaÃ§o como separador. Por exemplo, ['Dart', 'Programming'] torna-se "Dart Programming". Isso eh crucial para tratar entradas de linha de comando com varias palavras como uma unica frase de pesquisa.

A analise estÃ¡tica do Dart pode detectar que a articleTitle variavel eh garantidamente inicializada quando a instrucao `print` eh executada. Independentemente do caminho percorrido dentro do corpo desta funcao, a variavel nao pode ser nula.


Codigo:

import 'dart:io';

const version = '0.0.8';


void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

// ... (your existing main function)

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Current article title: $articleTitle');
}

// ... (your existing printUsage() function)
void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}


Saida padrao ao executor:

Comando: dart cli.dart version
Saida: Dartpedia CLI version 0.0.8

Comando: dart cli.dart help
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart || dart cli.dart run
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart search
Saida: Please provide an article title.

Comando: dart cli.dart search dart (EXEMPLO)
Saida: Current article title: dart

-------------------------------------------------------------------------------

Versao: 0.0.9
Data: 24/04/26
Descrição:
Finalizar searchWikipedia a impressao de resultados de pesquisa simulados: Atualize searchWikipedia para exibir mensagens que indiquem que nosso programa encontrou algo. Isso nos ajuda a visualizar o que nosso programa final fara sem precisar compila-lo completamente agora. Voce so vera essas mensagens se incluir uma consulta de pesquisa ao executar o programa.

Por exemplo: dart bin/cli.dart search Dart Programming.

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into the CLI into a single string
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}


Codigo:

import 'dart:io';

const version = '0.0.9';


void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    // Add this new block:
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into the CLI into a single string
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}


// ... (your existing printUsage() function)
void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}


Saida padrão ao executar o codigo:

Comando: dart cli.dart version
Saida: Dartpedia CLI version 0.0.8

Comando: dart cli.dart help
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart || dart cli.dart run
Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

Comando: dart cli.dart search
Saida: Please provide an article title.

Comando: dart cli.dart search dart (EXEMPLO)
Saida: Looking up articles about "dart". Please wait.
Here ya go!
(Pretend this is an article about "dart")
-------------------------------------------------------------------------------

Versao: 0.0.10

Data: 26/04/2026

Descricao do codigo:Importar o pacote HTTP.

Agora que voce adicionou o HTTP pacote, precisa importa-lo para o seu arquivo Dart para usar suas funcionalidades.

Abra o dartpedia/bin/cli.dart arquivo.

Adicione a seguinte import declaracao no inicio do arquivo, juntamente com a dart:io importacao existente.

import 'dart:io';
import 'package:http/http.dart' as http; // Add this line
Esta linha importa o http pacote e atribui a ele o alias http. Depois disso, voce pode se referir a classes e funcoes dentro do http pacote usando http.(poe exemplo, http.Client, http.get). Á as http parte pe uma convencao padrao para evitar conflitos de nomenclatura caso outra biblioteca importada tambem tenha uma classe ou funcao com nome semelhante

Codigo:

import 'dart:io';

import 'package:http/http.dart' as http; // Add this line

const version =  '0.0.10';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }
 
    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article title about "$articleTitle")');
}

void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE'");
}

Saida padrao ao executar o codigo:

 Comando: dart run

Saida: Resolving dependencies in '/home/natan.carmo/dartpedia/cli'...
Downloading packages...
Got dependences in '/home/natan.carmo/dartpedia/cli/'
Building package executable...
Built cli:cli.
The following commands are valid: 'help', 'version', 'searcg <ARTICLE-TITLE>'

Comando: dart bin/cli.dart help

Saida: Please provide an article title
Exemplo de comando: help
Saida: Looking up articles about "help". Please wait. - Here ya gp!. - (Pretend this is an article about "help")

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.10

Comando: dart bin/cli.dart search Dart programming

Saida: Looking up articles about "Dart Programming". Please wait. Here ya go!. (Pretend this is an article title about "Dart Programming")

-------------------------------------------------------------------------------

Versao: 0.0.11

Data: 26/04/2026

Descricao do codigo:Agora crie uma nova função chamada isso cuida da busca de dados de uma API externa. Essa função será porque As requisições de rede são operações assíncronas. getWikipediaArticleasync

Defina a assinatura da função: Abaixo da sua função (e função), Adicione a seguinte assinatura de função.mainprintUsage

// ... (your existing printUsage() function)

Future<String> getWikipediaArticle(String articleTitle) async {
  //You'll add more code here soon
}
Destaques do código anterior:

O tipo de retorno indica que essa função eventualmente produzirá um resultado, Mas não imediatamente, porque é uma operação assíncrona.Future<String>String
A palavra-chave marca a função como assíncrona, permitindo que você use dentro dele.asyncawait
Construa a URL da API: Dentro da sua nova função, Crie um objeto. O representa o ponto final da API da Wikipedia que Você vai ligar para obter um resumo do artigo.getWikipediaArticleUriUri

Adicione estas linhas dentro da função:getWikipediaArticle

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  // ...
}
Faça a requisição HTTP e cuide da resposta: Agora, use a função de topo de para faça uma requisição HTTP para a URL que você acabou de construir. A palavra-chave pausa a execução de até a chamada completa e retorna um objeto.getpackage:httpGETawaitgetWikipediaArticlegethttp.Response

Após a conclusão do pedido, verifique o para garantir que a solicitação foi bem-sucedida (um código de status de significa OK). Se bem-sucedido, retorne o , que contém os dados buscados (neste caso, JSON bruto). Se a solicitação falhar, retorne uma mensagem de erro informativa.response.statusCode200response.body

Adicione essas linhas após a construção dentro de :UrigetWikipediaArticle

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',

Comando: dart bin/cli.dart search

Saida: Please provide an article title
Exemplo de comando: help
Saida: Looking up articles about "help". Please wait. Here ya go!. (Pretend this is an article     about "help"

Comando: dart bin/cli.dart version

Saida: Dartpedia CLI version 0.0.9

Comando: dart bin/cli.dart search Dart Programming

Saida: Looking up articles about "Dart Programming". Please wait. Here ya go!. (Pretend this is an    article about "Dart Programmng")

-------------------------------------------------------------------------------

Versao: 0.0.12

Data: 26/04/2026

descricao do codigo: : Integrar a chamada de API ao searchWikipedia
#
Você vai integrar a chamada API em . Essa função abrigará a lógica central para lidar com o comando. searchWikipediawikipedia

Atualize o searchWikipedia para usar assíncrono: Localize sua função e atualize sua assinatura para estar como será agora realizar operações assíncronas.searchWikipediaasync

Sua função agora deve ser assim (parte inicial):searchWikipedia

// ... (your existing main function)

void searchWikipedia(List<String>? arguments) async { // Added 'async'
  final String? articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    articleTitle = stdin.readLineSync(); // Await input from the user
    // You'll add error handling for null input here in a moment
  } else {
    // Otherwise, join the arguments into the CLI into a single string
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}

// ... (your existing printUsage() function)
Destaques do código anterior:

void searchWikipedia(List<String>? arguments) async: A função agora é . Isso é essencial porque chamará , que é uma função em si mesma e precisará de seu resultado.asyncgetWikipediaArticleasyncawait
Adicione verificações de string nulas e vazias para entrada do usuário: Dentro , refina o bloco que trata do caso em que não são apresentados argumentos. Se retorna (por exemplo, se o usuário pressionar Ctrl+D/Ctrl+Z) ou uma cadeia vazia, Imprima uma mensagem e saia da função.searchWikipediaifstdin.readLineSync()null

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync(); // Read input
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return; // Exit the function if no valid input
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}
Ligue para getWikipediaArticle e imprima o resultado: Agora, modifique a função para Ligue para sua nova função e imprima o resultado. Depois, substitua as declarações provisórias anteriores com a chamada API real.searchWikipediagetWikipediaArticleprint

// ... (beginning of searchWikipedia function, after determining articleTitle)

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');

  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)
}
Destaques do código anterior:

await getWikipediaArticle(articleTitle): Porque é uma função, Você precisa do resultado. Isso pausa a função até que o retorno por resolva em A contendo o conteúdo do artigo.getWikipediaArticleasyncawaitsearchWikipediaFuture<String>getWikipediaArticleString
print(articleContent): Imprime o resumo do artigo buscado como uma string JSON bruto para o console.

Codigo:


import 'dart:io';

import 'package:http/http.dart' as http;

const version = '0.0.12';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      final inputFromStdin = stdin.readLineSync();
      if (inputFromStdin == null || inputFromStdin.isEmpty) {
        print('No article title provided. Existing.');
        return;
      }
      articleTitle = inputFromStdin;
    } else {
      articleTitle = arguments.join(' ');
}

    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article title about "$articleTitle")');


 var articleContent = await getWikipediaArticle(articleTitle);
 print(articleContent); // Print the full article response (raw JSON for now)
}

void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

// Saida padrao ao executar o codigo:

// Comando: dart run

// Saida: Resolving dependencies in `/home/home/natan_c_silva/dartpedia/cli`...
//Downloading packages...
//Got dependencies in `/home/home/natan_c_silva/dartpedia/cli`.
//Resolving dependencies in `/home/natan_c_silva/dartpedia/cli`...
//Downloading packages...
//Got dependencies in `/home/home/natan_c_silva/dartpedia/cli`.
//Building package executable...
//Built cli:cli.
//The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

// Comando: dart bin/cli.dart version

// Saida: Dartpedia CLI version 0.0.12

// Comando: dart bin/cli.dart help

// Saida: The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

// Comando: dart bin/cli.dart search

// Saida Please provide an article title.
//Batata
//Looking up articles about "Batata". Please wait.
//Here ya go!
//(Pretend this is an article title about "Batata")
//{"type":"disambiguation","title":"Batata","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Batata</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q549358","titles":{"canonical":"Batata","normalized":"Batata","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Batata</span></span>"},"pageid":2252707,"lang":"en","dir":"ltr","revision":"1252680762","tid":"952f6f26-907d-11ef-bf01-7c127b0a04d5","timestamp":"2024-10-22T13:57:32Z","description":"Topics referred to by the same term","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Batata","revisions":"https://en.wikipedia.org/wiki/Batata?action=history","edit":"https://en.wikipedia.org/wiki/Batata?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Batata"},"mobile":{"page":"https://en.wikipedia.org/wiki/Batata","revisions":"https://en.wikipedia.org/wiki/Special:History/Batata","edit":"https://en.wikipedia.org/wiki/Batata?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Batata"}},"extract":"Batata may refer to:","extract_html":"<p><b>Batata</b> may refer to:</p>"}:

// Search, sem acompanhamento eh necessario inserir o titulo. Sempre uma unica palavra, se for duas coloque "_" entre as palavras

// Comando: dart bin/cli.dart search batatas // Usando batatas de exemplo

// Saida: Looking up articles about "batatas". Please wait.
//Here ya go!
//(Pretend this is an article title about "batatas")
//{"type":"standard","title":"Ipomoea","displaytitle":"<i>Ipomoea</i>","namespace":{"id":0,"text":""},"wikibase_item":"Q161173","titles":{"canonical":"Ipomoea","normalized":"Ipomoea","display":"<i>Ipomoea</i>"},"pageid":623118,"thumbnail":{"source":"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Ipomoea_pes-tigridis%2C_Corbett_TR%2C_September_2013._AJT_Johnsingh._DSCN8264.jpg/330px-Ipomoea_pes-tigridis%2C_Corbett_TR%2C_September_2013._AJT_Johnsingh._DSCN8264.jpg","width":330,"height":248},"originalimage":{"source":"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Ipomoea_pes-tigridis%2C_Corbett_TR%2C_September_2013._AJT_Johnsingh._DSCN8264.jpg/3840px-Ipomoea_pes-tigridis%2C_Corbett_TR%2C_September_2013._AJT_Johnsingh._DSCN8264.jpg","width":4608,"height":3456},"lang":"en","dir":"ltr","revision":"1344644008","tid":"cc9499ab-2553-11f1-b86f-cfa91db6b75a","timestamp":"2026-03-21T18:28:47Z","description":"Genus of flowering plants","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Ipomoea","revisions":"https://en.wikipedia.org/wiki/Ipomoea?action=history","edit":"https://en.wikipedia.org/wiki/Ipomoea?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Ipomoea"},"mobile":{"page":"https://en.wikipedia.org/wiki/Ipomoea","revisions":"https://en.wikipedia.org/wiki/Special:History/Ipomoea","edit":"https://en.wikipedia.org/wiki/Ipomoea?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Ipomoea"}},"extract":"Ipomoea is the largest genus in the plant family Convolvulaceae, with over 600 species. It is a large and diverse group, with common names including morning glory, water Convolvulus or water spinach, sweet potato, bindweed, moonflower, etc. The genus occurs throughout the tropical and subtropical regions of the world, and comprises annual and perennial herbaceous plants, lianas, shrubs, and small trees; most of the species are twining climbing plants.","extract_html":"<p><i><b>Ipomoea</b></i> is the largest genus in the plant family Convolvulaceae, with over 600 species. It is a large and diverse group, with common names including morning glory, <span>water <i>Convolvulus</i></span> or water spinach, sweet potato, bindweed, moonflower, etc. The genus occurs throughout the tropical and subtropical regions of the world, and comprises annual and perennial herbaceous plants, lianas, shrubs, and small trees; most of the species are twining climbing plants.</p>"}

// Comando: dart run bin/cli.dart search "Dart_(programming_language)" // Duas palavras com o uso de "_"

// Saida: Looking up articles about "Dart_(programming_language)". Please wait.
//Here ya go!
//(Pretend this is an article title about "Dart_(programming_language)")
//{"type":"standard","title":"Dart (programming language)","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q406009","titles":{"canonical":"Dart_(programming_language)","normalized":"Dart (programming language)","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>"},"pageid":33033735,"lang":"en","dir":"ltr","revision":"1345875735","tid":"4e943f26-2ad3-11f1-9192-724fe0726377","timestamp":"2026-03-28T18:24:07Z","description":"Programming language","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=history","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"},"mobile":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Special:History/Dart_(programming_language)","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"}},"extract":"Dart is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.","extract_html":"<p><b>Dart</b> is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.</p>"}

-------------------------------------------------------------------------------

Versao: 0.0.13

Data: 7/05/2026

Descricao do codigo: Atualizar o principal para chamar searchWikipedia
#
Por fim, atualize sua função para chame a nova função quando o comando é usado. mainsearchWikipediawikipedia

Localize o bloqueio na sua função que Atualmente cuida do comando. Mude o nome do comando de para e Atualize a chamada de função.else ifmainsearchsearchwikipedia

No código de exemplo, a chamada para , não é a chamada para , ou seja, o próprio significado não precisa ser marcado .mainawaitsearchWikipediamainasync

Sua função agora deve ser assim:main

// ... (existing const version declaration and printUsage function)

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') { // Changed to 'wikipedia'
    // Pass all arguments *after* 'wikipedia' to searchWikipedia
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Call searchWikipedia (no 'await' needed here for main)
  } else {
    printUsage(); // Catch all for any unrecognized command.
  }
}
arguments.sublist(1): Isso extrai todos os elementos da lista, começando pelo segundo elemento (índice 1). Isso remove efetivamente o comando em si, Então só recebe os argumentos reais do título do artigo.argumentswikipediasearchWikipedia
searchWikipedia(inputArgs): Isso liga diretamente. Já que não precisa fazer qualquer coisa depois de completar, Você não precisa de isso a partir de . Portanto, não precisa ser .searchWikipediamainsearchWikipediaawaitmainmainasync.

Codigo:



import 'dart:io';

import 'package:http/http.dart' as http;

const version = '0.0.13';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
        printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async {
    final String articleTitle;
    if (arguments == null || arguments.isEmpty) {
      print('Please provide an article title.');
      final inputFromStdin = stdin.readLineSync();
      if (inputFromStdin == null || inputFromStdin.isEmpty) {
        print('No article title provided. Existing.');
        return;
      }
      articleTitle = inputFromStdin;
    } else {
      articleTitle = arguments.join(' ');
}

    print('Looking up articles about "$articleTitle". Please wait.');
    print('Here ya go!');
    print('(Pretend this is an article title about "$articleTitle")');


 var articleContent = await getWikipediaArticle(articleTitle);
 print(articleContent); // Print the full article response (raw JSON for now)
}

void printUsage() {
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url); // Make the HTTP request

  if (response.statusCode == 200) {
    return response.body; // Return the response body if successful
  }

  // Return an error message if the request failed
  return 'Error: Failed to fetch article "$articleTitle". Status code: ${response.statusCode}';
}

// Saida padrao ao executar o codigo:

// Comando: dart run

//Resolving dependencies in `/home/natan_c_silva/dartpedia/cli`...
//Downloading packages...
//Got dependencies in `/home/natan_c_silva/dartpedia/cli`.
//Building package executable...
//Built cli:cli.
//The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

// Comando: dart bin/cli.dart help

// Saida: Resolving dependencies in `/home/natan_c_silva/dartpedia/cli'
//Downloading packages...
//Got dependencies in `/home/natan_c_silva/dartpedia/cli`.
//Building package executable...
//Built cli:cli.
//The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'

// Comando: dart bin/cli.dart version

// Saida: Dartpedia CLI version 0.0.13

// Comando: dart bin/cli.dart wikipedia

// Saida: Please provide an article title.
//batata
//Looking up articles about "batata". Please wait.
//Here ya go!
//(Pretend this is an article title about "batata")
//{"type":"disambiguation","title":"Batata","displaytitle":"<span class=\"mw-page-title-main\">Batata</span>","namespace":{"id":0,"text":""},"wikibase_item":"Q549358","titles":{"canonical":"Batata","normalized":"Batata","display":"<span class=\"mw-page-title-main\">Batata</span>"},"pageid":2252707,"lang":"en","dir":"ltr","revision":"1252680762","tid":"952f6ec8-907d-11ef-9d7c-1de684ae4919","timestamp":"2024-10-22T13:57:32Z","description":"Topics referred to by the same term","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Batata","revisions":"https://en.wikipedia.org/wiki/Batata?action=history","edit":"https://en.wikipedia.org/wiki/Batata?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Batata"},"mobile":{"page":"https://en.wikipedia.org/wiki/Batata","revisions":"https://en.wikipedia.org/wiki/Special:History/Batata","edit":"https://en.wikipedia.org/wiki/Batata?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Batata"}},"extract":"Batata may refer to:","extract_html":"<p><b>Batata</b> may refer to:</p>"}

// Comando: dart bin/cli.dart wikipedia "Dart_(programming_language)"

// Saida: Looking up articles about "Dart_(programming_language)". Please wait.
//Here ya go!
//(Pretend this is an article title about "Dart_(programming_language)")
//{"type":"standard","title":"Dart (programming language)","displaytitle":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>","namespace":{"id":0,"text":""},"wikibase_item":"Q406009","titles":{"canonical":"Dart_(programming_language)","normalized":"Dart (programming language)","display":"<span lang=\"en\" dir=\"ltr\"><span class=\"mw-page-title-main\">Dart (programming language)</span></span>"},"pageid":33033735,"lang":"en","dir":"ltr","revision":"1345875735","tid":"4e943f26-2ad3-11f1-9192-724fe0726377","timestamp":"2026-03-28T18:24:07Z","description":"Programming language","description_source":"local","content_urls":{"desktop":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=history","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"},"mobile":{"page":"https://en.wikipedia.org/wiki/Dart_(programming_language)","revisions":"https://en.wikipedia.org/wiki/Special:History/Dart_(programming_language)","edit":"https://en.wikipedia.org/wiki/Dart_(programming_language)?action=edit","talk":"https://en.wikipedia.org/wiki/Talk:Dart_(programming_language)"}},"extract":"Dart is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.","extract_html":"<p><b>Dart</b> is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications.</p>"}

-------------------------------------------------------------------------------

Versao: 0.0.13

Data: 15/05/2026

Descrição: Agora que você adicionou command_runnera classe como dependência, pode importá-la para sua cliaplicação e substituir a lógica de tratamento de argumentos existente pela nova CommandRunnerclasse. Esta etapa também corrige o comportamento de encerramento do programa discutido no final do Capítulo 3.

Abra o cli/bin/cli.dartarquivo.

Adicione a seguinte declaração de importação no início do arquivo, junto com suas outras importações:

import 'package:command_runner/command_runner.dart';
Esta declaração importa o command_runnerpacote, tornando a CommandRunnerclasse disponível para uso.

Refatore a mainfunção e remova a lógica antiga: Atualmente, sua mainfunção do Capítulo 3 lida diretamente com comandos como version`command`, help`command` e wikipedia`command`, e então chama `command` searchWikipedia. Agora você substituirá toda essa lógica personalizada de tratamento de comandos por uma única chamada à nova CommandRunnerclasse.

Seu cli/bin/cli.dartarquivo (do Capítulo 3) deve estar assim:

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async { /* ... existing logic ... */ }
void printUsage() { /* ... existing logic ... */ }
Future<String> getWikipediaArticle(String articleTitle) async { /* ... existing logic ... */ }
Agora, substitua todo o conteúdo cli/bin/cli.dart (exceto a httpimportação) pela seguinte versão atualizada:

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

void main(List<String> arguments) async { // main is now async and awaits the runner
  var runner = CommandRunner(); // Create an instance of your new CommandRunner
  await runner.run(arguments); // Call its run method, awaiting its Future<void>
}
Principais trechos do código anterior:

void main(List<String> arguments) asyncAborda diretamente a questão do programa não encerrar corretamente, mencionada no Capítulo 3. Observe que mainagora é declarado como async. Isso é essencial porque runner.run()retorna um Future, e maindeve awaitaguardar sua conclusão para garantir que o programa espere que todas as tarefas assíncronas terminem antes de encerrar.
var runner = CommandRunner();Cria uma instância da CommandRunnerclasse do seu novo command_runner pacote.
await runner.run(arguments);Chama o runmétodo na CommandRunnerinstância, passando os argumentos da linha de comando.
Funções removidas:

As funções printUsage` and` searchWikipedia, `or` e `or` getWikipediaArticleforam completamente removidas do pacote ` command-line` cli/bin/cli.dart. Sua lógica será reformulada e integrada ao command_runnerpacote `command-line` em capítulos futuros, como parte da construção da estrutura completa do comando.


Codigo:

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async { /* ... existing logic ... */ }
void printUsage() { /* ... existing logic ... */ }
Future<String> getWikipediaArticle(String articleTitle) async { /* ... existing logic ... */ }

-------------------------------------------------------------------------------

Versao: 0.0.14

Data: 15/05/2026

Descrição:
Importar e usar o command_runnerpacote
#
Agora que você adicionou command_runnera classe como dependência, pode importá-la para sua cliaplicação e substituir a lógica de tratamento de argumentos existente pela nova CommandRunnerclasse. Esta etapa também corrige o comportamento de encerramento do programa discutido no final do Capítulo 3.

Abra o cli/bin/cli.dartarquivo.

Adicione a seguinte declaração de importação no início do arquivo, junto com suas outras importações:

import 'package:command_runner/command_runner.dart';
Esta declaração importa o command_runnerpacote, tornando a CommandRunnerclasse disponível para uso.

Refatore a mainfunção e remova a lógica antiga: Atualmente, sua mainfunção do Capítulo 3 lida diretamente com comandos como version`command`, help`command` e wikipedia`command`, e então chama `command` searchWikipedia. Agora você substituirá toda essa lógica personalizada de tratamento de comandos por uma única chamada à nova CommandRunnerclasse.

Seu cli/bin/cli.dartarquivo (do Capítulo 3) deve estar assim:

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async { /* ... existing logic ... */ }
void printUsage() { /* ... existing logic ... */ }
Future<String> getWikipediaArticle(String articleTitle) async { /* ... existing logic ... */ }

Codigo:

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async { /* ... existing logic ... */ }
void printUsage() { /* ... existing logic ... */ }
Future<String> getWikipediaArticle(String articleTitle) async { /* ... existing logic ... */ }

Saida padrao ao executar o codigo:

// Comando: dart run

// Saida:
dart run bin/main.dart

Saída: Ele chamará a função printUsage(). 

2. Se o primeiro argumento for help
Comando: dart run bin/main.dart help

Saída: Também chamará printUsage().

3. Se o primeiro argumento for version
Comando: dart run bin/main.dart version

Saída: ```text
Dartpedia CLI version 0.0.14


4. Se o primeiro argumento for wikipedia
Comando: dart run bin/main.dart wikipedia flutter

Saída: Ele chamará a função searchWikipedia(['flutter']). A saída dependerá da lógica interna dessa função e da resposta da API do Wikipedia.


5. Se você digitar qualquer outra coisa
Comando: dart run bin/main.dart abobora

Saída: Chamará printUsage().

-------------------------------------------------------------------------------

Versao: 0.0.15

Data: 22/05/2026

Descrição: 
gora que você adicionou command_runnera classe como dependência, pode importá-la para sua cliaplicação e substituir a lógica de tratamento de argumentos existente pela nova CommandRunnerclasse. Esta etapa também corrige o comportamento de encerramento do programa discutido no final do Capítulo 3.

Abra o cli/bin/cli.dartarquivo.

Adicione a seguinte declaração de importação no início do arquivo, junto com suas outras importações:

import 'package:command_runner/command_runner.dart';
Esta declaração importa o command_runnerpacote, tornando a CommandRunnerclasse disponível para uso.

Refatore a mainfunção e remova a lógica antiga: Atualmente, sua mainfunção do Capítulo 3 lida diretamente com comandos como version`command`, help`command` e wikipedia`command`, e então chama `command` searchWikipedia. Agora você substituirá toda essa lógica personalizada de tratamento de comandos por uma única chamada à nova CommandRunnerclasse.

Codigo

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';
void main(List<String> arguments) async { // main is now async and awaits the runner
  var runner = CommandRunner(); // Create an instance of your new CommandRunner
  await runner.run(arguments); // Call its run method, awaiting its Future<void>
}

Saida padrão:

Comando: dart run cli.dart wikipedia Computer_programming   
Sadia: CommandRunner received arguments: [wikipedia, Computer_programming]

------------------------------------------------------------------------------


import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.15';

void main(List<String> arguments) async { // main is now async and awaits the runner
  var runner = CommandRunner(); // Create an instance of your new CommandRunner
  await runner.run(arguments); // Call its run method, awaiting its Future<void>
}

*/
-------------------------------------------------------------------------------
import 'package:command_runner/command_runner.dart';

const version = '0.0.16';

void main(List<String> arguments) {
  var commandRunner = CommandRunner()..addCommand(HelpCommand());
  commandRunner.run(arguments);
}
