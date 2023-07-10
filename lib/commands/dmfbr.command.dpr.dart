import 'dart:io';

import '../dmfbr.interfaces.dart';
import 'console/dmfbr.command.dpr.console.dart';
import 'vcl/dmfbr.command.dfm.vcl.dart';
import 'vcl/dmfbr.command.pas.vcl.dart';

class CommandGenerateProject implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    String projectPath = dirName;
    String sourcePath = dirName;
    bool isHorse = false;
    bool isVCL = false;

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
    if (cli.options.containsKey('--vcl')) {
      isVCL = cli.options['--vcl'] ?? false;
    }
    // Horse
    if (cli.options.containsKey('--horse')) {
      isHorse = cli.options['--horse'] ?? false;
    }
    if (isHorse) {
      _createProjectHorse(projectPath, fileName, cli);
      _createAppModule('$projectPath/src', 'app', cli);
      _createRouteHandleHorse(sourcePath, 'ping', cli);
    } else if (isVCL) {
      _createProjectVCL(projectPath, fileName, cli);
      _createAppModule('$projectPath/src', 'app', cli);
      _createRouteHandle(sourcePath, 'ping', cli);
    } else {
      _createProject(projectPath, fileName, cli);
      _createAppModule('$projectPath/src', 'app', cli);
      _createRouteHandle(sourcePath, 'ping', cli);
    }
    _createModule(sourcePath, 'ping', cli);
    _createController('$sourcePath/controllers', 'ping', cli);
    _createService('$sourcePath/services', 'ping', cli);
    return this;
  }

  void _createProject(final String dirName, final String fileName, final ICLI cli) {
    final projectConsole = CommandGenerateProjectConsole();
    projectConsole.execute(dirName, fileName, cli);
  }

  void _createAppModule(final String dirName, final String fileName, final ICLI cli) {
    cli.commandList['g']?['m']?.value?.execute(dirName, fileName, cli);
  }

  void _createModule(final String dirName, final String fileName, final ICLI cli) {
    cli.commandList['g']?['m']?.value?.execute(dirName, fileName, cli);
  }

  void _createController(final String dirName, final String fileName, final ICLI cli) {
    cli.commandList['g']?['c']?.value?.execute(dirName, fileName, cli);
  }

  void _createService(final String dirName, final String fileName, final ICLI cli) {
    cli.commandList['g']?['s']?.value?.execute(dirName, fileName, cli);
  }

  void _createProjectHorse(final String dirName, final String fileName, final ICLI cli) {
    cli.commandsInternal['horse-app']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandleHorse(final String dirName, final String fileName, final ICLI cli) {
    cli.commandsInternal['horse-handler']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandle(final String dirName, final String fileName, final ICLI cli) {
    cli.commandsInternal['handler']?.value?.execute(dirName, fileName, cli);
  }

  void _createProjectVCL(final String dirName, final String fileName, final ICLI cli) {
    final formVCL = CommandGenerateFormVCL();
    final unitVCL = CommandGenerateUnitVCL();
    cli.commandsInternal['vcl-app']?.value?.execute(dirName, fileName, cli);
    formVCL.execute(dirName, fileName, cli);
    unitVCL.execute(dirName, fileName, cli);
  }
}
