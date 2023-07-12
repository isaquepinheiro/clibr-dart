import 'dart:io';
import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandGenerateProjectVCL implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    final String unitName = fileName.toLowerCase();
    final String programName = unitName.replaceAll(RegExp(r'[-]'), '_');
    final String templateFilePath = '${cli.pathEXE}/vcl.project.pas';
    final String templateFileName = '$dirName/$unitName.dpr';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent
        .replaceFirst('{programName}', programName)
        .replaceAll('{unitName}', unitName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
