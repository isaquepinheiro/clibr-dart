import 'core/clibr.command.pair.dart';

abstract interface class ICli {
  String get pathCLI;
  String get commandExecuted;
  set commandExecuted(String value);
  Map<String, Map<String, CommandPair>> get commands;
  Map<String, CommandPair> get optionsInternal;
  Map<String, bool> get tags;
  List<String> get updates;
}

abstract interface class ICommand {
  bool execute(final String dirName, final String fileName, final ICli cli);
}
