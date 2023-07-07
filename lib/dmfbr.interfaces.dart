import 'core/dmfbr.command.pair.dart';

abstract interface class ICommand {
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI);
}

abstract interface class IModularCLI {
  String get command;
  set command(String value);
  Map<String, Map<String, CommandPair>> get commands;
  Map<String, CommandPair> get commandsExtra;
  Map<String, bool> get options;
  List<String> get commandsExecute;
}
