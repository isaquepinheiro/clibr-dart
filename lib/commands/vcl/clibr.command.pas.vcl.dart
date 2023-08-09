import 'dart:io';
import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandGenerateUnitVCL implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = '${cli.pathCLI}/vcl.project.unit.pas';
    final String templateFileName = '$dirName/u$unitName.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceFirst('{unitName}', unitName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return true;
  }
}
