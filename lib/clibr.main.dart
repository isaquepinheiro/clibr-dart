import 'dart:io';
import 'package:clibr/clibr.cmd.dart';
import 'package:clibr/clibr.interfaces.dart';
import 'package:clibr/commands/update/clibr.update.dpr.dart';
import 'package:clibr/core/clibr.command.pair.dart';
import 'package:clibr/core/clibr.utils.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final pathCLI = Platform.script.toFilePath();
  final pathFormated = pathCLI.replaceAll('\\', '/');
  final ICli cli = Cli(Directory(pathFormated).parent.path);
  final List<String> options = [];
  final ICommand updateExecute = CommandUpdateDpr();
  late final Map<String, CommandPair> commandOptions;
  String dirName = '';
  String fileName = '';
  bool isSuccess = false;

  // Command find
  for (int iFor = 0; iFor < arguments.length; iFor++) {
    if (cli.commands.containsKey(arguments[iFor])) {
      commandOptions = cli.commands[arguments[iFor]] ?? {};
      cli.commandExecuted = arguments[iFor];
      break;
    }
  }

  // Arguments find
  for (int iFor = 0; iFor < arguments.length; iFor++) {
    final String item = arguments[iFor];

    if (commandOptions.containsKey(item)) {
      options.add(item);
    } else if (cli.tags.containsKey(item)) {
      cli.tags[item] = true;
    } else {
      dirName = path.dirname(arguments[iFor]);
      fileName = path.basename(arguments[iFor]);
    }
  }

  // Execute
  for (final String item in options) {
    if (commandOptions[item]?.value == null) {
      continue;
    }
    isSuccess = commandOptions[item]!.value!.execute(dirName, fileName, cli);
    if (isSuccess) {
      break;
    }
  }

  if (isSuccess && cli.updates.isNotEmpty) {
    updateExecute.execute(dirName, fileName, cli);
  }

  if (!isSuccess) {
    Utils.printAlert('Run \'clibr --help\' for usage.');
  }
  options.clear();
  commandOptions.clear();
}
