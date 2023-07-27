import 'dart:io';

import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandService implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
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
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String controllerName = 'T${className}Service';
    final String templateFilePath = '${cli.pathEXE}/service.pas';
    final String templateFileName = '$servicePath/$unitName.service.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent
        .replaceFirst('{unitName}', unitName)
        .replaceAll('{serviceName}', controllerName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    cli.updates.add('  $unitName.service in \'src\\modules\\$fileName\\$unitName.service.pas\',');
    return this;
  }
}
