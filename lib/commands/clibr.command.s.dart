import 'dart:io';

import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandService implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String className = 'T${camelCaseName}Service';
    String sourcePath = dirName;

    if ((sourcePath.isEmpty) || (sourcePath == '.')) {
      sourcePath = './';
    }

    if (!Directory(sourcePath).existsSync()) {
      Directory(sourcePath).createSync(recursive: true);
    }
    final String templateFilePath = '${cli.pathCLI}/service.pas';
    final String templateFileName = '$sourcePath/$unitName.service.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceFirst('{unitName}', unitName).replaceAll('{serviceName}', className);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    cli.updates.add('  $unitName.service in \'src\\modules\\$fileName\\$unitName.service.pas\',');
    return true;
  }
}
