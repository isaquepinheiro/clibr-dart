import 'dart:io';
import '../../core/dmfbr.utils.dart';
import '../../dmfbr.interfaces.dart';

class CommandTransformPipe implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    String pipePath = dirName;

    if ((pipePath.isEmpty) || (pipePath == '.')) {
      pipePath = './';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(pipePath).existsSync()) {
      Directory(pipePath).createSync(recursive: true);
    }
    final String camelCase = fileName[0].toUpperCase() + fileName.substring(1);
    final String unitName = fileName[0].toLowerCase();
    final String pipeName = camelCase.replaceAll(RegExp(r'[-]'), '_');
    final String className = 'TParse${pipeName}Pipe';
    final String templateFilePath = './templates/pipe.txt';
    final String templateFileName = '$pipePath/$unitName.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent
        .replaceFirst('{unitName}', unitName)
        .replaceAll('{className}', className);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate(
        'CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
