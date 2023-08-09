import 'dart:io';
import '../../clibr.interfaces.dart';
import '../../core/clibr.utils.dart';

class CommandUpdateDpr implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    final Directory currentDir = Directory('${Directory.current}/$dirName');
    final List<FileSystemEntity> files = currentDir.listSync();
    String dprFilePath = '';

    for (var file in files) {
      if (file is File && file.path.toLowerCase().endsWith('.dpr')) {
        dprFilePath = file.path;
        break;
      }
    }

    if (dprFilePath.isEmpty) {
      return false;
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
        Utils.printAlert('Error: Semicolon not found after the "uses" clause in the DPR file.');
      }
    } else {
      Utils.printAlert('Error: "uses" clause not found in the DPR file.');
    }
    return true;
  }
}
