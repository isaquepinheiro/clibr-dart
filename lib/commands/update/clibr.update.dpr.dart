import 'dart:io';
import '../../clibr.interfaces.dart';
import '../../core/clibr.utils.dart';

class CommandUpdateDpr implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    final Directory currentDir = Directory.current;
    final List<FileSystemEntity> files = currentDir.listSync();
    String dprFilePath = '';

    for (var file in files) {
      if (file is File && file.path.toLowerCase().endsWith('.dpr')) {
        dprFilePath = file.path;
        break;
      }
    }
    if (dprFilePath == '') {
      return this;
    }
    final File fileProject = File(dprFilePath);
    final List<String> lines = fileProject.readAsLinesSync();
    // Find "Uses"
    int usesIndex = -1;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains('uses')) {
        usesIndex = i;
        break;
      }
    }
    // Find ";"
    if (usesIndex != -1) {
      int semicolonIndex = -1;
      for (int i = usesIndex + 1; i < lines.length; i++) {
        if (lines[i].contains(';')) {
          semicolonIndex = i;
          break;
        }
      }
      if (semicolonIndex != -1) {
        lines[semicolonIndex] = lines[semicolonIndex].replaceAll(';', ',');
        for (final String unitName in cli.updates) {
          if (lines.contains(unitName)) {
            continue;
          }
          semicolonIndex++;
          lines.insert(semicolonIndex, unitName);
        }
        lines[semicolonIndex] = lines[semicolonIndex].replaceAll(',', ';');
        fileProject.writeAsStringSync(lines.join('\n'));
        // Console
        Utils.printUpdate(
            'UPDATE', './${fileProject.uri.pathSegments.last}', Utils.getSizeFile(dprFilePath));
      } else {
        Utils.printAlert(
            'Erro: ponto e vírgula não encontrado após a cláusula "uses" no arquivo DPR.');
      }
    } else {
      Utils.printAlert('Erro: cláusula "uses" não encontrada no arquivo DPR.');
    }
    return this;
  }
}
