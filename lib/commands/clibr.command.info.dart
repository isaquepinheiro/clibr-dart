import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandInfo implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    _executeInternal();
    return true;
  }

  void _executeInternal() {
    List<String> printText = [];
    printText
        .add(' ______   ____    ____  ________  ______              ______  _____     _____  ');
    printText
        .add('|_   _ `. |_  \\  /   _||_   __  ||_   _ \\           .\' ___  ||_   _|   |_   _| ');
    printText.add(
        '  | | `. \\ |   \\/   |    | |_ \\_|  | |_) | _ .--.  / .\'   \\_|  | |       | |   ');
    printText
        .add('  | |  | | | |\\  /| |    |  _|     |  __\'.[ `/\'`\\] | |         | |   _   | |   ');
    printText.add(
        ' _| |_.\' /_| |_\\/_| |_  _| |_     _| |__) || |     \\ `.___.\'\\ _| |__/ | _| |_  ');
    printText
        .add('|______.\'|_____||_____||_____|   |_______/[___]     `.____ .\'|________||_____| ');
    printText.add('');
    printText.add('  Version: ${Utils.version()}');
    printText.add('  Author: Isaque Pinheiro');
    printText.add('  Email: isaquesp@gmail.com');
    printText.add('  Github: https://github.com/HashLoad/DMFBr');
    printText.add('  Documentation: https://dmfbr-en.docs-br.com');
    printText.add('');

    Utils.printHelp(printText.join('\n'));
  }
}
