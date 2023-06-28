import 'package:dmfbr/dmfbr.cli.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final modularCli = ModularCLI();
  var dirName = '';
  var fileName = '';
  var commandName = '';
  // Commands
  for (var iFor = 0; iFor < arguments.length; iFor++) {
    commandName = arguments[iFor];
    if (modularCli.commands.containsKey(commandName)) {
      break;
    }
  }
  // Command found
  var commands = modularCli.commands[commandName] ?? {};
  if (commands.isEmpty) {
    commands = modularCli.commands['-h'] ?? {};
    commands['-h']?.value?.execute(dirName, fileName, modularCli);
  }
  // Arguments find
  for (var iFor = 0; iFor < arguments.length; iFor++) {
    var command = arguments[iFor];
    // Argument command
    if (commands.containsKey(command)) {
      modularCli.commandsExecute.add(command);
    } else if (modularCli.options.containsKey(command)) {
      modularCli.options[command] = true;
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
    if (result != null) {}
  }
}
