import 'dart:io';
import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class DataNames {
  String dirName = '';
  String fileName = '';
  String pathSrc = '';
  String unitName = '';
}

class CommandModule implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    if (fileName.isEmpty) {
      print('Invalid parameters!');
      return false;
    }
    final String unitName = fileName.toLowerCase();
    final String camelCaseName = fileName[0].toUpperCase() + fileName.substring(1);
    final String className = 'T${camelCaseName}Module';
    final bool isAppModule = fileName.toLowerCase() == 'app';
    String sourcePath = dirName;
    bool isGuard = false;

    if (sourcePath.isEmpty || sourcePath == '.') {
      sourcePath = './src/modules/$fileName';
    }

    if (!Directory(sourcePath).existsSync()) {
      Directory(sourcePath).createSync(recursive: true);
    }

    final String templateFilePath =
        isAppModule == true ? '${cli.pathCLI}/module.app.pas' : '${cli.pathCLI}/module.pas';
    final String templateFileName = '$sourcePath/$unitName.module.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    String modifiedContent = templateContent
        .replaceAll('{moduleName}', className)
        .replaceAll('{unitName}', unitName)
        .replaceAll('{className}', camelCaseName);

    // Guard exist
    isGuard = _argGuardExist(cli);
    if (isGuard) {
      modifiedContent = modifiedContent
          .replaceFirst('{guardCode}', _generateGuardBody(camelCaseName, cli))
          .replaceFirst('{guardHeader}', _generateGuardHeader(camelCaseName, cli));
    }

    File(templateFileName).writeAsStringSync(modifiedContent);
    // Console
    Utils.printCreate('CREATE', templateFileName, Utils.getSizeFile(templateFileName));
    // Lista Update DPR
    StringBuffer buffer = StringBuffer();
    buffer.write('  ');
    buffer.write(unitName);
    buffer.write('.module in \'src\\modules\\');
    buffer.write(fileName);
    buffer.write('\\');
    buffer.write(unitName);
    buffer.write('.module.pas\',');

    cli.updates.add(buffer.toString());
    return true;
  }

  String _generateGuardBody(final String camelCaseName, final ICli cli) {
    final String templateFilePath = '${cli.pathCLI}/body.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceAll('{className}', 'T$camelCaseName');

    return modifiedContent;
  }

  String _generateGuardHeader(final String camelCaseName, final ICli cli) {
    final String templateFilePath = '${cli.pathCLI}/header.pas';
    final String templateContent = File(templateFilePath).readAsStringSync();
    final String modifiedContent = templateContent.replaceAll('{className}', 'T$camelCaseName');

    return modifiedContent;
  }

  bool _argGuardExist(final ICli cli) {
    if (cli.tags.containsKey('--guard')) {
      return cli.tags['--guard'] ?? false;
    } else if (cli.tags.containsKey('-gu')) {
      return cli.tags['-gu'] ?? false;
    }
    return false;
  }
}
