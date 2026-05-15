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


const version = '0.0.3'

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
*/

//Codigo valido ate aqui

//Codigo:

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

void printUsage() { // Add this new function
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}
