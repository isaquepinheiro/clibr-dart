import 'dart:io';
import '../core/clibr.utils.dart';
import '../clibr.interfaces.dart';

class CommandController implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    String controllerPath = dirName;

    if ((controllerPath.isEmpty) || (controllerPath == '.')) {
      controllerPath = './src/modules/$fileName/controllers/';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(controllerPath).existsSync()) {
      Directory(controllerPath).createSync(recursive: true);
    }
    final String unitName = fileName.toLowerCase();
    final String templateFilePath = '${cli.pathEXE}/controller.pas';
    final String templateFileName = '$controllerPath/$unitName.controller.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String controllerName = 'T${className}Controller';
    final String modifiedContent = templateContent
        .replaceAll('{unitName}', unitName)
        .replaceAll('{controllerName}', controllerName)
        .replaceAll('{className}', className);

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    return this;
  }
}