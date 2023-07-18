import 'dart:io';

import '../clibr.interfaces.dart';

class CommandAll implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    String allPath = dirName;
    String sourcePath = dirName;
    bool isHorse = false;

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
    if (cli.tags.containsKey('--horse')) {
      isHorse = cli.tags['--horse'] ?? false;
    }
    if (isHorse) {
      _createRouteHandleHorse(sourcePath, fileName, cli);
    } else {
      _createRouteHandle(sourcePath, fileName, cli);
    }
    _createModule(sourcePath, fileName, cli);
    _createController('$sourcePath/controllers', fileName, cli);
    _createService('$sourcePath/services', fileName, cli);
    return this;
  }

  void _createModule(final String dirName, final String fileName, final ICLI cli) {
    cli.commands['g']?['m']?.value?.execute(dirName, fileName, cli);
  }

  void _createController(final String dirName, final String fileName, final ICLI cli) {
    cli.commands['g']?['c']?.value?.execute(dirName, fileName, cli);
  }

  void _createService(final String dirName, final String fileName, final ICLI cli) {
    cli.commands['g']?['s']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandleHorse(final String dirName, final String fileName, final ICLI cli) {
    cli.optionsInternal['horse-handler']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandle(final String dirName, final String fileName, final ICLI cli) {
    cli.optionsInternal['handler']?.value?.execute(dirName, fileName, cli);
  }
}
