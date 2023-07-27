import 'dart:io';
import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandModule implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    final bool isAppModule = fileName.toLowerCase() == 'app';
    String modulePath = dirName;
    bool isGuard = false;

    if ((modulePath.isEmpty) || (modulePath == '.')) {
      modulePath = './src/modules/$fileName';
    }
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return null;
    }
    if (!Directory(modulePath).existsSync()) {
      Directory(modulePath).createSync(recursive: true);
    }
    // Options - Guard
    if (cli.tags.containsKey('--guard')) {
      isGuard = cli.tags['--guard'] ?? false;
    } else if (cli.tags.containsKey('-gu')) {
      isGuard = cli.tags['-gu'] ?? false;
    }
    final String unitName = fileName.toLowerCase();
    final String className = fileName[0].toUpperCase() + fileName.substring(1);
    final String moduleName = 'T${className}Module';
    final String templateFilePath =
        isAppModule == true ? '${cli.pathEXE}/module.app.pas' : '${cli.pathEXE}/module.pas';
    final String templateFileName = '$modulePath/$unitName.module.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    String modifiedContent = templateContent
        .replaceAll('{moduleName}', moduleName)
        .replaceAll('{unitName}', unitName)
        .replaceAll('{className}', className);

    modifiedContent = modifiedContent
        .replaceFirst('{guardCode}', _generateGuardBody(className, isGuard, cli))
        .replaceFirst('{guardHeader}', _generateGuardHeader(className, isGuard, cli));
    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    cli.updates.add('  $unitName.module in \'src\\modules\\$fileName\\$unitName.module.pas\',');
    return this;
  }

  String _generateGuardBody(final String className, final bool isGuard, final ICLI cli) {
    final String templateFilePath = '${cli.pathEXE}/body.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceAll('{className}', 'T$className');

    return isGuard ? modifiedContent : '';
  }

  String _generateGuardHeader(final String className, final bool isGuard, final ICLI cli) {
    final String templateFilePath = '${cli.pathEXE}/header.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceAll('{className}', 'T$className');

    return isGuard ? modifiedContent : '';
  }
}
