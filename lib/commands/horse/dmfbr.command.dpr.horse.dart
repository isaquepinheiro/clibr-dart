import 'dart:io';
import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandGenerateProjectHorse implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String projectPath = dirName;

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
    _executeInternal(dirName, fileName);
    return this;
  }

  void _executeInternal(final String dirName, final String fileName) {
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
    code.add('  ping.module in \'modules/ping\\ping.module.pas\',');
    code.add(
        '  ping.route.handle in \'modules\\ping\\ping.route.handle.pas\';');
    code.add('');
    code.add('begin');
    code.add('  {\$IFDEF MSWINDOWS}');
    code.add('  IsConsole := False;');
    code.add('  ReportMemoryLeaksOnShutdown := True;');
    code.add('  {\$ENDIF}');
    code.add('');
    code.add('  THorse.Use(HorseModular(TAppModule.Create));');
    code.add('');
    code.add('  THorse.Listen(9000, \'127.0.0.1\',');
    code.add('    procedure');
    code.add('    begin');
    code.add(
        '      Writeln(Format(\'Server is running on %s:%d\', [THorse.Host, THorse.Port]));');
    code.add('      Readln;');
    code.add('    end);');
    code.add('');
    code.add('end.');

    final String projectFilePath = '$dirName/$unitName.dpr';
    File(projectFilePath).writeAsStringSync(code.join('\n'));
    // Console
    Utils.printCreate(
        'CREATE', projectFilePath, Utils.getSizeFile(projectFilePath));
  }
}
