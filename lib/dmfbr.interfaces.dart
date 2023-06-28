import 'core/dmfbr.command.pair.dart';

abstract interface class ICommand {
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI);
}

abstract interface class IModularCLI {
  Map<String, Map<String, CommandPair>> get commands;
  Map<String, CommandPair> get commandsHorse;
  Map<String, bool> get options;
  List<String> get commandsExecute;
}
