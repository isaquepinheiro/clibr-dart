import 'dart:io';
import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandGenerateProjectConsole implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    final String camelCase = fileName[0].toUpperCase() + fileName.substring(1);
    final String unitName = fileName[0].toLowerCase() + fileName.substring(1);
    final String programName = camelCase.replaceAll(RegExp(r'[-]'), '_');
    final String templateFilePath = './templates/console/console.project.txt';
    final String templateFileName = '$dirName/$unitName.dpr';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceFirst('{programName}', programName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
