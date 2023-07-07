import 'dart:io';

import '../dmfbr.interfaces.dart';
import 'console/dmfbr.command.dpr.console.dart';
import 'vcl/dmfbr.command.dfm.vcl.dart';
import 'vcl/dmfbr.command.pas.vcl.dart';

class CommandGenerateProject implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String projectPath = dirName;
    String sourcePath = dirName;
    bool horse = false;
    bool vcl = false;

    if (dirName.isEmpty) {
      projectPath = './';
      sourcePath = '.';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(projectPath).existsSync()) {
      Directory(projectPath).createSync(recursive: true);
    }
    sourcePath = '$sourcePath/src/modules/ping';
    // VCL
    if (modularCLI.options.containsKey('--vcl')) {
      vcl = modularCLI.options['--vcl'] ?? false;
    }
    // Horse
    if (modularCLI.options.containsKey('--horse')) {
      horse = modularCLI.options['--horse'] ?? false;
    }
    if (horse) {
      _createProjectHorse(projectPath, fileName, modularCLI);
      _createAppModule('$projectPath/src', 'app', modularCLI);
      _createRouteHandleHorse(sourcePath, 'ping', modularCLI);
    } else if (vcl) {
      _createProjectVCL(projectPath, fileName, modularCLI);
      _createAppModule('$projectPath/src', 'app', modularCLI);
      _createRouteHandle(sourcePath, 'ping', modularCLI);
    } else {
      _createProject(projectPath, fileName, modularCLI);
      _createAppModule('$projectPath/src', 'app', modularCLI);
      _createRouteHandle(sourcePath, 'ping', modularCLI);
    }
    _createModule(sourcePath, 'ping', modularCLI);
    _createController('$sourcePath/controllers', 'ping', modularCLI);
    _createService('$sourcePath/services', 'ping', modularCLI);
    return this;
  }

  void _createProject(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    final projectConsole = CommandGenerateProjectConsole();
    projectConsole.execute(dirName, fileName, modularCLI);
  }

  void _createAppModule(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commands['g']?['m']?.value
        ?.execute(dirName, fileName, modularCLI);
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

  static void _createProjectHorse(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commandsExtra['horse-app']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  static void _createRouteHandleHorse(final String dirName,
      final String fileName, final IModularCLI modularCLI) {
    modularCLI.commandsExtra['horse-handler']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  static void _createRouteHandle(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commandsExtra['handler']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  static void _createProjectVCL(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    final formVCL = CommandGenerateFormVCL();
    final unitVCL = CommandGenerateUnitVCL();
    modularCLI.commandsExtra['vcl-app']?.value
        ?.execute(dirName, fileName, modularCLI);
    formVCL.execute(dirName, fileName, modularCLI);
    unitVCL.execute(dirName, fileName, modularCLI);
  }
}
