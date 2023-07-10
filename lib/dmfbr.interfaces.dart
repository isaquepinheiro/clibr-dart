import 'core/dmfbr.command.pair.dart';

abstract interface class ICommand {
  ICommand? execute(final String dirName, final String filename, final ICLI cli);
}

abstract interface class ICLI {
  String get commandExecuted;
  set commandExecuted(String value);
  Map<String, Map<String, CommandPair>> get commandList;
  Map<String, CommandPair> get commandsInternal;
  Map<String, bool> get options;
  List<String> get argumentList;
}
