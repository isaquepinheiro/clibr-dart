import 'dart:io';
import 'package:clibr/clibr.cmd.dart';
import 'package:clibr/clibr.interfaces.dart';
import 'package:clibr/commands/update/clibr.update.dpr.dart';
import 'package:clibr/core/clibr.command.pair.dart';
import 'package:clibr/core/clibr.utils.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final pathEXE = Platform.script.toFilePath();
  final pathFormated = pathEXE.replaceAll('\\', '/');
  final ICLI cli = CLI(Directory(pathFormated).parent.path);
  final List<String> options = [];
  final ICommand updateExecute = CommandUpdateDpr();
  String dirName = '';
  String fileName = '';
  String commandName = '';
  bool isFound = false;
  // Command find
  for (int iFor = 0; iFor < arguments.length; iFor++) {
    commandName = arguments[iFor];

    if (cli.commands.containsKey(commandName)) {
      break;
    }
  }
  // Set command executed
  cli.commandExecuted = commandName;
  // Command list
  final Map<String, CommandPair> argumentList = cli.commands[cli.commandExecuted] ?? {};
  // Argument find
  for (int iFor = 0; iFor < arguments.length; iFor++) {
    final String argName = arguments[iFor];

    if (argumentList.containsKey(argName)) {
      options.add(argName);
    } else if (cli.tags.containsKey(argName)) {
      cli.tags[argName] = true;
    } else {
      dirName = path.dirname(arguments[iFor]);
      fileName = path.basename(arguments[iFor]);
    }
  }
  // Command execute
  for (final String key in options) {
    if (argumentList[key]?.value == null) {
      continue;
    }
    final ICommand? resultExecute = argumentList[key]?.value?.execute(dirName, fileName, cli);
    if (resultExecute != null) {
      isFound = true;
    }
  }
  // Update DPR file
  if (cli.updates.isNotEmpty) {
    updateExecute.execute(dirName, fileName, cli);
  }
  if (!isFound) {
    Utils.printAlert('Run \'clibr --help\' for usage.');
  }
}
