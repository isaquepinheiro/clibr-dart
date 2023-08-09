import 'dart:io';

import '../clibr.interfaces.dart';
import 'console/clibr.command.dpr.console.dart';
import 'vcl/clibr.command.dfm.vcl.dart';
import 'vcl/clibr.command.pas.vcl.dart';

class CommandGenerateProject implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    String projectPath = dirName;
    String sourcePath = dirName;
    bool isHorse = false;
    bool isVCL = false;

    if (dirName.isEmpty) {
      projectPath = './';
      sourcePath = '.';
    }

    if (!Directory(projectPath).existsSync()) {
      Directory(projectPath).createSync(recursive: true);
    }
    sourcePath = '$sourcePath/src/modules/ping';

    // VCL
    if (cli.tags.containsKey('--vcl')) {
      isVCL = cli.tags['--vcl'] ?? false;
    }

    // Horse
    if (cli.tags.containsKey('--horse')) {
      isHorse = cli.tags['--horse'] ?? false;
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
    return true;
  }

  void _createProject(final String dirName, final String fileName, final ICli cli) {
    final projectConsole = CommandGenerateProjectConsole();
    projectConsole.execute(dirName, fileName, cli);
  }

  void _createAppModule(final String dirName, final String fileName, final ICli cli) {
    cli.commands['g']?['m']?.value?.execute(dirName, fileName, cli);
  }

  void _createModule(final String dirName, final String fileName, final ICli cli) {
    cli.commands['g']?['m']?.value?.execute(dirName, fileName, cli);
  }

  void _createController(final String dirName, final String fileName, final ICli cli) {
    cli.commands['g']?['c']?.value?.execute(dirName, fileName, cli);
  }

  void _createService(final String dirName, final String fileName, final ICli cli) {
    cli.commands['g']?['s']?.value?.execute(dirName, fileName, cli);
  }

  void _createProjectHorse(final String dirName, final String fileName, final ICli cli) {
    cli.optionsInternal['horse-app']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandleHorse(final String dirName, final String fileName, final ICli cli) {
    cli.optionsInternal['horse-handler']?.value?.execute(dirName, fileName, cli);
  }

  void _createRouteHandle(final String dirName, final String fileName, final ICli cli) {
    cli.optionsInternal['handler']?.value?.execute(dirName, fileName, cli);
  }

  void _createProjectVCL(final String dirName, final String fileName, final ICli cli) {
    final formVCL = CommandGenerateFormVCL();
    final unitVCL = CommandGenerateUnitVCL();
    cli.optionsInternal['vcl-app']?.value?.execute(dirName, fileName, cli);
    formVCL.execute(dirName, fileName, cli);
    unitVCL.execute(dirName, fileName, cli);
  }
}
