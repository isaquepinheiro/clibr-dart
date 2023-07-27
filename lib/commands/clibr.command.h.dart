import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandHelp implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    if ((cli.commandExecuted == 'generate') || (cli.commandExecuted == 'g')) {
      _executeInternalG();
    } else if ((cli.commandExecuted == 'new') || (cli.commandExecuted == 'n')) {
      _executeInternalN();
    } else {
      _executeInternal();
    }
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add('CLIBr');
    helpText.add('clibr [command] [options] [filename] [tags]');
    helpText.add('\u001b[36m' 'commands:' '\u001b[0m');
    helpText.add('  clibr n, new app       create new project');
    helpText.add('  clibr g, generate      create new file');
    helpText.add('  clibr -h, --help       show help');
    helpText.add('  clibr -v, --version    show version');
    helpText.add('  clibr -t, --templates  show templates');
    helpText.add('\u001b[31m' 'options:' '\u001b[0m');
    helpText.add('  app, application');
    helpText.add('  handler, module, controller, service');
    helpText.add('  --all          create all');
    helpText.add('\u001b[32m' 'tags:' '\u001b[0m');
    helpText.add('  --horse        creates a new project using the Horse pattern');
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
    helpText.add('CLIBr');
    helpText.add('clibr generate [option] [filename] [tags]');
    helpText.add('\u001b[35m' 'commands:' '\u001b[0m');
    helpText.add('  g, generate    generates the desired option');
    helpText.add('\u001b[31m' 'options:' '\u001b[0m');
    helpText.add('  handler, module, controller, service');
    helpText.add('  --all          create all');
    helpText.add('\u001b[32m' 'tags:' '\u001b[0m');
    helpText.add('  --horse        creates a new project using the Horse pattern');
    helpText.add('  -gu, --guard   adds security guards');
    helpText.add('\u001b[36m' 'samples:' '\u001b[0m');
    helpText.add('  clibr g handler products');
    helpText.add('  clibr g module products');
    helpText.add('  clibr g controller products');
    helpText.add('  clibr g service products');
    helpText.add('  clibr g --all products');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }

  void _executeInternalN() {
    List<String> helpText = [];
    helpText.add('CLIBr');
    helpText.add('clibr new [option] [filename] [tags]');
    helpText.add('\u001b[32m' 'commands:' '\u001b[0m');
    helpText.add('  n, new         generates a new project');
    helpText.add('\u001b[31m' 'options:' '\u001b[0m');
    helpText.add('  app, application');
    helpText.add('\u001b[35m' 'tags:' '\u001b[0m');
    helpText.add('  --horse        creates a new project using the Horse pattern');
    helpText.add('  -gu, --guard   adds security guards');
    helpText.add('\u001b[36m' 'samples:' '\u001b[0m');
    helpText.add('  clibr n app app_ping');
    helpText.add('  clibr n app app_ping --horse');
    helpText.add('  clibr n app app_ping --guard');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }
}
