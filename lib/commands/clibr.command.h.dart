import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandHelp implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if ((cli.commandExecuted == 'generate') || (cli.commandExecuted == 'g')) {
      _executeInternalG();
    } else if ((cli.commandExecuted == 'new') || (cli.commandExecuted == 'n')) {
      _executeInternalN();
    } else {
      _executeInternal();
    }
    return true;
  }

  void _executeInternal() {
    List<String> printText = [];
    printText.add('CLIBr');
    printText.add('Usage: clibr <command> [argument] [filename] [tag]');
    printText.add('\u001b[36m' 'commands:' '\u001b[0m');
    printText.add('  n, new           create new delphi project (console default)');
    printText.add('  g, generate      create new argument');
    printText.add('  v, version       show version');
    printText.add('  i, info          show informations');
    printText.add('  t, templates     show templates');
    printText.add('\u001b[31m' 'arguments:' '\u001b[0m');
    printText.add('  app, application create new delphi project');
    printText.add('  handler          create route handle');
    printText.add('  module           create module');
    printText.add('  controller       create controller');
    printText.add('  service          create service');
    printText.add('  all              create all (handler, module, controller and service)');
    printText.add('\u001b[32m' 'tags:' '\u001b[0m');
    printText.add('  --vcl            create new project VCL pattern');
    printText.add('  --horse          create new project Horse pattern (console)');
    printText.add('  -gu, --guard     add security guards');
    printText.add('  -h, --help       show help');
    printText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    printText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    printText.add('');

    Utils.printHelp(printText.join('\n'));
  }

  void _executeInternalG() {
    List<String> printText = [];
    printText.add('CLIBr');
    printText.add('Usage: clibr g <argument> <filename> [tag]');
    printText.add('\u001b[35m' 'commands:' '\u001b[0m');
    printText.add('  g, generate      generates the desired argument');
    printText.add('\u001b[31m' 'arguments:' '\u001b[0m');
    printText.add('  handler          create route handle');
    printText.add('  module           create module');
    printText.add('  controller       create controller');
    printText.add('  service          create service');
    printText.add('  all              create all (handler, module, controller and service)');
    printText.add('\u001b[32m' 'tags:' '\u001b[0m');
    printText.add('  --horse          create Horse pattern (console)');
    printText.add('  -gu, --guard     adds security guards');
    printText.add('  -h, --help       show help');
    printText.add('\u001b[36m' 'samples:' '\u001b[0m');
    printText.add('  clibr g handler products');
    printText.add('  clibr g module products --horse --guard');
    printText.add('  clibr g controller products');
    printText.add('  clibr g service products');
    printText.add('  clibr g all products');
    printText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    printText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    printText.add('');

    Utils.printHelp(printText.join('\n'));
  }

  void _executeInternalN() {
    List<String> printText = [];
    printText.add('CLIBr');
    printText.add('Usage: clibr n <argument> <filename> [tag]');
    printText.add('\u001b[32m' 'commands:' '\u001b[0m');
    printText.add('  n, new           create new delphi project (console default)');
    printText.add('\u001b[31m' 'arguments:' '\u001b[0m');
    printText.add('  app, application');
    printText.add('\u001b[35m' 'tags:' '\u001b[0m');
    printText.add('  --horse          create Horse pattern');
    printText.add('  -gu, --guard     adds security guards');
    printText.add('  -h, --help       show help');
    printText.add('\u001b[36m' 'samples:' '\u001b[0m');
    printText.add('  clibr n app app_ping');
    printText.add('  clibr n app app_ping --horse');
    printText.add('  clibr n app app_ping --guard');
    printText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    printText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    printText.add('');

    Utils.printHelp(printText.join('\n'));
  }
}
