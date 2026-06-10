import 'dart:io';
import 'package:logging/logging.dart';

Logger initFileLogger(String name) {
  // Ativa o log hierárquico
  hierarchicalLoggingEnabled = true;

  final logger = Logger(name);
  final now = DateTime.now();

  // Obtém o caminho do diretório do projeto a partir do script atual
  final scriptFile = File(Platform.script.toFilePath());
  final projectDir = scriptFile.parent.parent.path;

  // Cria o diretório 'logs' se ele não existir
  final dir = Directory('$projectDir/logs');
  if (!dir.existsSync()) dir.createSync();

  // Cria o arquivo de log com nome único baseado na data e nome do logger
  final logFile = File(
    '${dir.path}/${now.year}_${now.month}_${now.day}_$name.txt',
  );

  // Configura para capturar todas as severidades de logs (ALL)
  logger.level = Level.ALL;

  // Escuta os registros de log e grava no arquivo de texto
  logger.onRecord.listen((record) {
    final msg =
        '[${record.time} - ${record.loggerName}] ${record.level.name}: ${record.message}';
    logFile.writeAsStringSync('$msg \n', mode: FileMode.append);
  });

  return logger;
}
