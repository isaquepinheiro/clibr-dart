import 'dart:io';

import '../core/dmfbr.utils.dart';
import '../dmfbr.interfaces.dart';

class CommandGenerateProject implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String projectPath = dirName;
    bool horse = false;

    if (projectPath.isEmpty) {
      projectPath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(projectPath).existsSync()) {
      Directory(projectPath).createSync(recursive: true);
    }
    // Horse
    if (modularCLI.options.containsKey('--horse')) {
      horse = modularCLI.options['--horse'] ?? false;
    }
    if (horse) {
      _createProjectHorse(dirName, fileName, modularCLI);
      _createModuleHorse(dirName, 'app', modularCLI);
      _createRouteHandleHorse('$dirName/modules/ping', 'ping', modularCLI);
    } else {
      _createProject(dirName, fileName);
      _createModule(dirName, 'app', modularCLI);
    }
    // Create Controller in Modules
    _createModule('$dirName/modules/ping', 'ping', modularCLI);
    _createController('$dirName/modules/ping/controllers', 'ping', modularCLI);
    return this;
  }

  void _createProject(final String dirName, final String fileName) {
    final List<String> code = [];
    final String camelCase = fileName[0].toLowerCase() + fileName.substring(1);
    final String unitName = fileName.toLowerCase();
    final String programName = camelCase.replaceAll(RegExp(r'[-._]'), '');

    code.add('program $programName;');
    code.add('');
    code.add('{\$APPTYPE CONSOLE}');
    code.add('');
    code.add('{\$R *.res}');
    code.add('');
    code.add('uses');
    code.add('  System.SysUtils,');
    code.add('  Horse,');
    code.add('  horse.modular,');
    code.add('  app.module in \'app.module.pas\',');
    code.add(
        '  ping.controller in \'modules\\ping\\controllers\\ping.controller.pas\',');
    code.add('  ping.module in \'modules\\ping\\ping.module.pas\',');
    code.add(
        '  ping.route.handle in \'modules\\ping\\ping.route.handle.pas\';');
    code.add('');
    code.add('begin');
    code.add('  try');
    code.add('    { TODO -oUser -cConsole Main : Insert code here }');
    code.add('  except');
    code.add('    on E: Exception do');
    code.add('      WriteLn(E.ClassName, \': \', E.Message);');
    code.add('  end;');
    code.add('end.');

    final String projectFilePath = '$dirName/$unitName.dpr';
    File(projectFilePath).writeAsStringSync(code.join('\n'));
    // Console
    Utils.printCreate(
        'CREATE', projectFilePath, Utils.getSizeFile(projectFilePath));
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

  void _createProjectHorse(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commandsHorse['app-horse']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  void _createModuleHorse(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commandsHorse['m-horse']?.value
        ?.execute(dirName, fileName, modularCLI);
  }

  void _createRouteHandleHorse(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    modularCLI.commandsHorse['rh-horse']?.value
        ?.execute(dirName, fileName, modularCLI);
  }
}
