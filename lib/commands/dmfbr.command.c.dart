import 'dart:io';

import '../core/dmfbr.utils.dart';
import '../dmfbr.interfaces.dart';

class CommandController implements ICommand {
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
    final String controllerName = '${className}Controller';
    final List<String> code = [];

    code.add('unit $unitName.controller;');
    code.add('');
    code.add('interface');
    code.add('');
    code.add('type');
    code.add('  $controllerName = class');
    code.add('  public');
    code.add('    constructor Create;');
    code.add('    destructor Destroy; override;');
    code.add('    function Ping: string;');
    code.add('  end;');
    code.add('');
    code.add('implementation');
    code.add('');
    code.add('{ $controllerName }');
    code.add('');
    code.add('constructor $controllerName.Create;');
    code.add('begin');
    code.add('');
    code.add('end;');
    code.add('');
    code.add('destructor $controllerName.Destroy;');
    code.add('begin');
    code.add('');
    code.add('  inherited;');
    code.add('end;');
    code.add('');
    code.add('function $controllerName.Ping: String;');
    code.add('begin');
    code.add('  Result := \'Pong\';');
    code.add('end;');
    code.add('');
    code.add('end.');

    final String moduleFilePath = '$path/$unitName.controller.pas';
    File(moduleFilePath).writeAsStringSync(code.join('\n'));
    // Console
    Utils.printCreate(
        'CREATE', moduleFilePath, Utils.getSizeFile(moduleFilePath));
  }
}
