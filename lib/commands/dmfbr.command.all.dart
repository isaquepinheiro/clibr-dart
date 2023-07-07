import 'dart:io';

import '../dmfbr.interfaces.dart';

class CommandAll implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String allPath = dirName;
    String sourcePath = dirName;
    bool horse = false;

    if ((allPath.isEmpty) || (allPath == '.')) {
      allPath = './src/';
      sourcePath = './src';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(allPath).existsSync()) {
      Directory(allPath).createSync(recursive: true);
    }
    sourcePath = '$sourcePath/modules/$fileName';
    // Horse
    if (modularCLI.options.containsKey('--horse')) {
      horse = modularCLI.options['--horse'] ?? false;
    }
    if (horse) {
      _createRouteHandleHorse(sourcePath, fileName, modularCLI);
    }
    _createModule(sourcePath, fileName, modularCLI);
    _createController('$sourcePath/controllers', fileName, modularCLI);
    _createService('$sourcePath/services', fileName, modularCLI);
    return this;
  }

  void _createModule(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commands['g']?['m']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  void _createController(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commands['g']?['c']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  void _createService(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commands['g']?['s']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  static void _createRouteHandleHorse(final String dirName,
      final String fileName, final IModularCLI modularCLI) {
    modularCLI.commandsExtra['horse-handler']?.value
        ?.execute(dirName, fileName, modularCLI);
  }
}
