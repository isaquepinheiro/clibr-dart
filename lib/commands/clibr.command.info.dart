import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandInfo implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    _executeInternal();
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add(' ______   ____    ____  ________  ______              ______  _____     _____  ');
    helpText
        .add('|_   _ `. |_  \\  /   _||_   __  ||_   _ \\           .\' ___  ||_   _|   |_   _| ');
    helpText.add(
        '  | | `. \\ |   \\/   |    | |_ \\_|  | |_) | _ .--.  / .\'   \\_|  | |       | |   ');
    helpText
        .add('  | |  | | | |\\  /| |    |  _|     |  __\'.[ `/\'`\\] | |         | |   _   | |   ');
    helpText.add(
        ' _| |_.\' /_| |_\\/_| |_  _| |_     _| |__) || |     \\ `.___.\'\\ _| |__/ | _| |_  ');
    helpText
        .add('|______.\'|_____||_____||_____|   |_______/[___]     `.____ .\'|________||_____| ');
    helpText.add('');
    helpText.add('  Version: 0.0.1');
    helpText.add('  Author: Isaque Pinheiro');
    helpText.add('  Email: isaquesp@gmail.com');
    helpText.add('  Github: https://github.com/HashLoad/DMFBr');
    helpText.add('  Documentation: https://dmfbr-en.docs-br.com');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }
}
