import 'dart:io';

import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandRouteHandlerHorse implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String handlerPath = dirName;

    if ((handlerPath.isEmpty) || (handlerPath == '.')) {
      handlerPath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(handlerPath).existsSync()) {
      Directory(handlerPath).createSync(recursive: true);
    }
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = './templates/horse/horse.handler.txt';
    final String templateFileName = '$handlerPath/$unitName.route.handler.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String handlerName = 'T${className}RouteHandler';
    final String modifiedContent = templateContent
        .replaceFirst('{unitName}', unitName)
        .replaceAll('{handlerName}', handlerName)
        .replaceAll('{className}', className);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
