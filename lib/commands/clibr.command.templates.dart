import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandTemplates implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    _executeInternal();
    return true;
  }

  void _executeInternal() {
    List<String> printText = [];
    printText.add('|-----------------------|');
    printText.add('| CLIBr CLI - Templates |');
    printText.add('|-----------------------|------------------------------------------|');
    printText.add('|        Name         	|               Descripton                 |');
    printText.add('|-----------------------|------------------------------------------|');
    printText.add('| handler.pas           | Default Route Handler                    |');
    printText.add('| module.app.pas        | Default Application Module               |');
    printText.add('| module.pas            | Default Modules                          |');
    printText.add('| controller.pas        | Default Controller                       |');
    printText.add('| service.pas           | Default Service                          |');
    printText.add('| vcl.project.pas       | Default VCL Server Project           	   |');
    printText.add('| vcl.project.unit.pas 	| Default VCL Server Unit                  |');
    printText.add('| vcl.project.form.pas 	| Default VCL Server Form              	   |');
    printText.add('| console.projetc.pas 	| Default Console Project              	   |');
    printText.add('| horse.project.pas   	| Horse Pattern Projec                     |');
    printText.add('| horse.handler.pas   	| Horse Pattern Route Handler              |');
    printText.add('| body.pas              | Guad Routes Body                         |');
    printText.add('| header.pas            | Guad Routes Header                       |');
    printText.add('| pipe.pas              | Pipe (Transformation/Validation)         |');
    printText.add('|-----------------------|------------------------------------------|');
    printText.add('');

    Utils.printHelp(printText.join('\n'));
  }
}
