import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.cli.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final modularCli = ModularCLI();
  var dirName = '';
  var fileName = '';
  var commandName = '';
  var isOK = false;
  // Commands
  for (var iFor = 0; iFor < arguments.length; iFor++) {
    commandName = arguments[iFor];
    if (modularCli.commands.containsKey(commandName)) {
      break;
    }
  }
  modularCli.command = commandName;
  // Command found
  var commands = modularCli.commands[modularCli.command] ?? {};
  // Arguments find
  for (var iFor = 0; iFor < arguments.length; iFor++) {
    var flagName = arguments[iFor];
    // Argument command
    if (commands.containsKey(flagName)) {
      modularCli.commandsExecute.add(flagName);
    } else if (modularCli.options.containsKey(flagName)) {
      modularCli.options[flagName] = true;
    } else {
      dirName = path.dirname(arguments[iFor]);
      fileName = path.basename(arguments[iFor]);
    }
  }
  // Command execute
  for (var key in modularCli.commandsExecute) {
    if (commands[key]?.value == null) {
      continue;
    }
    var result = commands[key]?.value?.execute(dirName, fileName, modularCli);
    if (result != null) {
      isOK = true;
    }
  }
  if (!isOK) {
    Utils.printAlert(
        'Error: unknown command "${modularCli.command}" for "dmfbr"');
    Utils.printAlert('Run \'dmfbr --help\' for usage.');
  }
}
