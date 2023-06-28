import 'dart:io';
import 'package:dmfbr/core/dmfbr.utils.dart';

import '../dmfbr.interfaces.dart';

class CommandModule implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String modulePath = dirName;
    bool guard = false;

    if (modulePath.isEmpty) {
      modulePath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(modulePath).existsSync()) {
      Directory(modulePath).createSync(recursive: true);
    }
    // Options - Guard
    if (modularCLI.options.containsKey('--guard')) {
      guard = modularCLI.options['--guard'] ?? false;
    } else if (modularCLI.options.containsKey('-gu')) {
      guard = modularCLI.options['-gu'] ?? false;
    }
    _executeInternal(modulePath, fileName, guard);

    return this;
  }

  void _executeInternal(
      final String path, final String fileName, final bool guard) {
    final String className =
        'T${fileName[0].toUpperCase() + fileName.substring(1)}';
    final String unitName = fileName.toLowerCase();
    final String moduleName = '${className}Module';
    final List<String> code = [];
    final bool isPingModule = fileName.toLowerCase() == 'ping';
    final bool isAppModule = fileName.toLowerCase() == 'app';

    code.add('unit $unitName.module;');
    code.add('');
    code.add('interface');
    code.add('');
    code.add('uses');
    if (isPingModule) {
      code.add('  ping.controller,');
    } else if (isAppModule) {
      code.add('  ping.module,');
      code.add('  ping.route.handle,');
    }
    code.add('  dmfbr.module;');
    code.add('');
    if (guard) {
      _generateGuardHeader(code, className);
    }
    code.add('  $moduleName = class(TModule)');
    code.add('  public');
    code.add('    function Imports: TImports; override;');
    code.add('    function Binds: TBinds; override;');
    code.add('    function Routes: TRoutes; override;');
    code.add('    function RouteHandlers: TRouteHandlers; override;');
    code.add('    function ExportedBinds: TExportedBinds; override;');
    code.add('  end;');
    code.add('');
    code.add('implementation');
    code.add('');
    code.add('{ $moduleName }');
    code.add('');
    code.add('function $moduleName.Binds: TBinds;');
    code.add('begin');
    if (isPingModule) {
      code.add('  Result := [Bind<PingController>.Singleton];');
    } else {
      code.add('  Result := [];');
    }
    code.add('end;');
    code.add('');
    code.add('function $moduleName.ExportedBinds: TExportedBinds;');
    code.add('begin');
    code.add('  Result := [];');
    code.add('end;');
    code.add('');
    code.add('function $moduleName.Imports: TImports;');
    code.add('begin');
    code.add('  Result := [];');
    code.add('end;');
    code.add('');
    code.add('function $moduleName.RouteHandlers: TRouteHandlers;');
    code.add('begin');
    code.add('  Result := [];');
    code.add('end;');
    code.add('');
    code.add('function $moduleName.Routes: TRoutes;');
    code.add('begin');
    code.add('  Result := [];');
    code.add('end;');
    if (guard) {
      _generateGuardCode(code, className);
    }
    code.add('');
    code.add('end.');

    final String moduleFilePath = '$path/$unitName.module.pas';
    File(moduleFilePath).writeAsStringSync(code.join('\n'));
    // Console
    Utils.printCreate(
        'CREATE', moduleFilePath, Utils.getSizeFile(moduleFilePath));
  }

  void _generateGuardCode(
      final List<String> moduleCode, final String className) {
    moduleCode.add('');
    moduleCode.add('{ ${className}Guard }');
    moduleCode.add('');
    moduleCode.add('class function ${className}Guard.Call: Boolean;');
    moduleCode.add('begin');
    moduleCode.add('  Result := true;');
    moduleCode.add('end;');
  }

  void _generateGuardHeader(
      final List<String> moduleCode, final String className) {
    moduleCode.add('type');
    moduleCode.add('  ${className}Guard = class(TRouteMiddleware)');
    moduleCode.add('  public');
    moduleCode.add('    class function Call: boolean; override;');
    moduleCode.add('  end;');
    moduleCode.add('');
  }
}
