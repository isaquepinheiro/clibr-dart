import 'dart:io';
import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandTransformPipe implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
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
    final String unitName = fileName[0].toLowerCase();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String pipeName = 'TParse${className}Pipe';
    final String templateFilePath = '${cli.pathEXE}/pipe.pas';
    final String templateFileName = '$pipePath/$unitName.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceFirst('{unitName}', unitName).replaceAll('{pipeName}', pipeName);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}
