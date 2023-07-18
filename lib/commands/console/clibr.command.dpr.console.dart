import 'dart:io';
import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandGenerateProjectConsole implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    final String unitName = fileName.toLowerCase();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String programName = className.replaceAll(RegExp(r'[-]'), '_');
    final String templateFilePath = '${cli.pathEXE}/console.project.pas';
    final String templateFileName = '$dirName/$unitName.dpr';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceFirst('{programName}', programName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
