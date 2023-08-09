import 'dart:io';

import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandRouteHandler implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String className = 'T${camelCaseName}RouteHandler';
    final String templateFilePath = '${cli.pathCLI}/handler.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    String sourcePath = dirName;

    if ((sourcePath.isEmpty) || (sourcePath == '.')) {
      sourcePath = './';
    }

    if (!Directory(sourcePath).existsSync()) {
      Directory(sourcePath).createSync(recursive: true);
    }

    final String templateFileName = '$sourcePath/$unitName.route.handler.pas';
    final String modifiedContent = templateContent
        .replaceAll('{unitName}', unitName)
        .replaceAll('{handlerName}', className)
        .replaceAll('{className}', camelCaseName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    StringBuffer buffer = StringBuffer();
    buffer.write('  ');
    buffer.write(unitName);
    buffer.write('.route.handler in \'src\\modules\\');
    buffer.write(fileName);
    buffer.write('\\');
    buffer.write(unitName);
    buffer.write('.route.handler.pas\',');

    cli.updates.add(buffer.toString());
    return true;
  }
}
