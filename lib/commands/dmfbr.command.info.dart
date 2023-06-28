import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.interfaces.dart';

class CommandInfo implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI) {
    _executeInternal();
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add('[Info DMFBr]');
    helpText.add('  Version: 0.0.1');
    helpText.add('  Author: Isaque Pinheiro');
    helpText.add('  Email: isaquesp@gmail.com');
    helpText.add('  Github: https://github.com/HashLoad/DMFBr');
    helpText.add('  Documentation: https://dmfbr-en.docs-br.com');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }
}
