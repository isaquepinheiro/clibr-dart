import 'dart:io';

import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandRouteHandlerHorse implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String className = 'T${camelCaseName}RouteHandler';
    String sourcePath = dirName;

    if ((sourcePath.isEmpty) || (sourcePath == '.')) {
      sourcePath = './';
    }

    if (!Directory(sourcePath).existsSync()) {
      Directory(sourcePath).createSync(recursive: true);
    }

    final String templateFilePath = '${cli.pathCLI}/horse.handler.pas';
    final String templateFileName = '$sourcePath/$unitName.route.handler.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent
        .replaceFirst('{unitName}', unitName)
        .replaceAll('{handlerName}', className)
        .replaceAll('{className}', camelCaseName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    cli.updates.add(
        '  $unitName.route.handler in \'src\\modules\\$fileName\\$unitName.route.handler.pas\',');
    return true;
  }
}
