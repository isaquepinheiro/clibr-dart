import 'dart:io';
import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandTransformPipe implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName[0].toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String className = 'TParse${camelCaseName}Pipe';
    String sourcePath = dirName;

    if ((sourcePath.isEmpty) || (sourcePath == '.')) {
      sourcePath = './src/pipes/$fileName';
    }

    if (!Directory(sourcePath).existsSync()) {
      Directory(sourcePath).createSync(recursive: true);
    }
    final String templateFilePath = '${cli.pathCLI}/pipe.pas';
    final String templateFileName = '$sourcePath/$unitName.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent =
        templateContent.replaceFirst('{unitName}', unitName).replaceAll('{pipeName}', className);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    StringBuffer buffer = StringBuffer();
    buffer.write('  ');
    buffer.write(unitName);
    buffer.write('.pipe in \'src\\pipes\\');
    buffer.write(fileName);
    buffer.write('\\');
    buffer.write(unitName);
    buffer.write('.pipe.pas\',');

    cli.updates.add(buffer.toString());

    return true;
  }
}
