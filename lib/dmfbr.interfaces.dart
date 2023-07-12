import 'core/dmfbr.command.pair.dart';

abstract interface class ICommand {
  ICommand? execute(final String dirName, final String filename, final ICLI cli);
}

abstract interface class ICLI {
  String get commandExecuted;
  set commandExecuted(String value);
  String get pathEXE;
  Map<String, Map<String, CommandPair>> get commands;
  Map<String, CommandPair> get optionsInternal;
  Map<String, bool> get tags;
  List<String> get options;
}
