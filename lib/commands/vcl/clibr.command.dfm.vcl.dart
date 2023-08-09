import 'dart:io';
import '../../core/clibr.utils.dart';
import '../../clibr.interfaces.dart';

class CommandGenerateFormVCL implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = '${cli.pathCLI}/vcl.project.form.pas';
    final String templateFileName = '$dirName/u$unitName.dfm';
    final String templateContent = File(templateFilePath).readAsStringSync();

    File(templateFileName).writeAsStringSync(templateContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return true;
  }
}
