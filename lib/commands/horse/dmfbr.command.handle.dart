import 'dart:io';

import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandRouteHandleHorse implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String controllerPath = dirName;

    if (controllerPath.isEmpty) {
      controllerPath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(controllerPath).existsSync()) {
      Directory(controllerPath).createSync(recursive: true);
    }
    _executeInternal(controllerPath, fileName);

    return this;
  }

  void _executeInternal(final String path, final String fileName) {
    final String className =
        'T${fileName[0].toUpperCase() + fileName.substring(1)}';
    final String unitName = fileName.toLowerCase();
    final String controllerName = '${className}RouteHandle';
    final List<String> code = [];

    code.add('unit $unitName.route.handle;');
    code.add('');
    code.add('interface');
    code.add('');
    code.add('uses');
    code.add('  Horse,');
    code.add('  dmfbr.modular,');
    code.add('  ping.controller,');
    code.add('  dmfbr.route.handle;');
    code.add('');
    code.add('type');
    code.add('  $controllerName = class(TRouteHandler)');
    code.add('  protected');
    code.add('    procedure RegisterRoutes; override;');
    code.add('  public');
    code.add('    procedure Ping(Req: THorseRequest; Res: THorseResponse);');
    code.add('  end;');
    code.add('');
    code.add('implementation');
    code.add('');
    code.add('{ $controllerName }');
    code.add('');
    code.add('procedure $controllerName.RegisterRoutes;');
    code.add('begin');
    code.add('  THorse.Get(\'/ping\', Ping);');
    code.add('end;');
    code.add('');
    code.add(
        'procedure $controllerName.Ping(Req: THorseRequest; Res: THorseResponse);');
    code.add('var');
    code.add('  LResult: string;');
    code.add('begin');
    code.add('  LResult := Modular.Get<TPingController>.Ping;');
    code.add('  Res.Send(LResult).Status(200);');
    code.add('end;');
    code.add('');
    code.add('end.');

    final String moduleFilePath = '$path/$unitName.route.handle.pas';
    File(moduleFilePath).writeAsStringSync(code.join('\n'));
    // Console
    Utils.printCreate(
        'CREATE', moduleFilePath, Utils.getSizeFile(moduleFilePath));
  }
}
