import 'dart:async';
import 'dart:collection';
import '../command_runner.dart';

// Definição do Enum OptionType
enum OptionType { flag, option }

// Classe Base Abstrata Argument
abstract class Argument {
  String get name;
  String? get help;

  // No caso de flags, o valor padrão é um bool.
  // Em outras opções e comandos, o valor padrão é uma String.
  // OBS: flags são apenas objetos Option que não recebem argumentos.
  Object? get defaultValue;
  String? get valueHelp;

  String get usage;
}

// Classe Option que estende Argument
class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  final OptionType type;

  @override
  final String? help;

  final String? abbr;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  @override
  String get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

// Classe Base Abstrata Command que estende Argument
abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;

  final List<Option> _options = [];

  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  // Um flag é uma [Option] tratada como booleano.
  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: false,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  // Uma opção é uma [Option] que recebe um valor.
  void addOption(
    String name, {
    String? help,
    String? abbr,
    String? defaultValue,
    String? valueHelp,
  }) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        defaultValue: defaultValue,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }

  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}

// Classe ArgResults para armazenar o resultado da análise
class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Retorna true se o flag existir.
  bool flag(String name) {
    // Verifica apenas flags, pois temos certeza de que flags são booleanos.
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }
    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
}