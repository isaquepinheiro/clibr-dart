import 'dart:io';
import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandGenerateProjectVCL implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String programName = camelCaseName.replaceAll(RegExp(r'[-]'), '_');
    final String templateFilePath = '${cli.pathCLI}/vcl.project.pas';
    final String templateFileName = '$dirName/$unitName.dpr';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent
        .replaceFirst('{programName}', programName)
        .replaceAll('{unitName}', unitName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return true;
  }
}
