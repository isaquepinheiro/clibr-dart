import 'dart:io';
import 'package:dmfbr/core/dmfbr.utils.dart';

import '../dmfbr.interfaces.dart';

class CommandModule implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    final bool isAppModule = fileName.toLowerCase() == 'app';
    String modulePath = dirName;
    bool isGuard = false;

    if ((modulePath.isEmpty) || (modulePath == '.')) {
      modulePath = './src/modules/$fileName';
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
      isGuard = modularCLI.options['--guard'] ?? false;
    } else if (modularCLI.options.containsKey('-gu')) {
      isGuard = modularCLI.options['-gu'] ?? false;
    }
    final String unitName = fileName.toLowerCase();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String moduleName = 'T${className}Module';
    final String templateFilePath = isAppModule == true
        ? './templates/module.app.txt'
        : './templates/module.txt';
    final String templateFileName = '$modulePath/$unitName.module.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    String modifiedContent = templateContent
        .replaceAll('{moduleName}', moduleName)
        .replaceAll('{unitName}', unitName)
        .replaceAll('{className}', className);

    modifiedContent = modifiedContent
        .replaceFirst('{guardCode}', _generateGuardBody(className, isGuard))
        .replaceFirst(
            '{guardHeader}', _generateGuardHeader(className, isGuard));
    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }

  String _generateGuardBody(final String className, final bool isGuard) {
    final String templateFilePath = './templates/guards/body.txt';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceAll('{className}', 'T$className');

    return isGuard ? modifiedContent : '';
  }

  String _generateGuardHeader(final String className, final bool isGuard) {
    final String templateFilePath = './templates/guards/header.txt';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceAll('{className}', 'T$className');

    return isGuard ? modifiedContent : '';
  }
}
