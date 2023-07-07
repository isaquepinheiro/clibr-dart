import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.interfaces.dart';

class CommandHelp implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    if ((modularCLI.command == 'generate') || (modularCLI.command == 'g')) {
      _executeInternalG();
    } else if ((modularCLI.command == 'new') || (modularCLI.command == 'n')) {
      _executeInternalN();
    } else {
      _executeInternal();
    }
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add('DMFBr CLI');
    helpText.add('\u001b[35m' 'help:' '\u001b[0m');
    helpText.add('  dmfbr new app <name> [options]');
    helpText.add('  dmfbr n app <name> [options]');
    helpText.add('  dmfbr generate <name> [options]');
    helpText.add('  dmfbr g <name> [options]');
    helpText.add('  dmfbr -h, --help');
    helpText.add('  dmfbr -v, --version');
    helpText.add('\u001b[32m' 'options:' '\u001b[0m');
    helpText
        .add('  --horse        creates a new project using the Horse pattern');
    helpText.add('  -gu, --guard   adds security guards');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }

  void _executeInternalG() {
    List<String> helpText = [];
    helpText.add('DMFBr CLI');
    helpText.add('\u001b[35m' 'help:' '\u001b[0m');
    helpText.add('  dmfbr generate <name> [options]');
    helpText.add('  dmfbr g <name> [options]');
    helpText.add('\u001b[32m' 'command:' '\u001b[0m');
    helpText.add('  g, generate    generates the desired option');
    helpText.add('\u001b[32m' 'options:' '\u001b[0m');
    helpText.add('  --all          generates module/controller/service');
    helpText.add('  -gu, --guard   adds security guards');
    helpText.add('\u001b[36m' 'samples:' '\u001b[0m');
    helpText.add('  dmfbr g --all');
    helpText.add('  dmfbr g module products');
    helpText.add('  dmfbr g controller products');
    helpText.add('  dmfbr g service products');
    helpText.add('  dmfbr g handle products');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }

  void _executeInternalN() {
    List<String> helpText = [];
    helpText.add('DMFBr CLI');
    helpText.add('\u001b[35m' 'help:' '\u001b[0m');
    helpText.add('  dmfbr new app <name> [options]');
    helpText.add('  dmfbr n app <name> [options]');
    helpText.add('\u001b[32m' 'command:' '\u001b[0m');
    helpText.add('  n, new         generates a new project');
    helpText.add('\u001b[36m' 'samples:' '\u001b[0m');
    helpText.add('  dmfbr n app app_ping');
    helpText.add('  dmfbr n app app_ping --horse');
    helpText.add('  dmfbr n app app_ping --guard');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }
}
