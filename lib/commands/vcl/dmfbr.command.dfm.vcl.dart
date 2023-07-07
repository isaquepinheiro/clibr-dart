import 'dart:io';
import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandGenerateFormVCL implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = './templates/vcl/vcl.project.form.txt';
    final String templateFileName = '$dirName/u$unitName.dfm';
    final String templateContent = File(templateFilePath).readAsStringSync();

    File(templateFileName).writeAsStringSync(templateContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
