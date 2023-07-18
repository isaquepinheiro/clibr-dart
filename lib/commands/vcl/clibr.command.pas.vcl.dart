import 'dart:io';
import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandGenerateUnitVCL implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = '${cli.pathEXE}/vcl.project.unit.pas';
    final String templateFileName = '$dirName/u$unitName.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceFirst('{unitName}', unitName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
