import 'dart:io';

import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandService implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String servicePath = dirName;

    if ((servicePath.isEmpty) || (servicePath == '.')) {
      servicePath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(servicePath).existsSync()) {
      Directory(servicePath).createSync(recursive: true);
    }
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = './templates/service.txt';
    final String templateFileName = '$servicePath/$unitName.service.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String controllerName = 'T${className}Service';
    final String modifiedContent = templateContent
        .replaceFirst('{unitName}', unitName)
        .replaceAll('{serviceName}', controllerName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
