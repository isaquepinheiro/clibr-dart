import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandTemplates implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    _executeInternal();
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add('|-----------------------|');
    helpText.add('| DMFBr CLI - Templates |');
    helpText.add('|-----------------------|------------------------------------------|');
    helpText.add('|        Name         	|               Descripton                 |');
    helpText.add('|-----------------------|------------------------------------------|');
    helpText.add('| handler.pas           | Default Route Handler                    |');
    helpText.add('| module.app.pas        | Default Application Module               |');
    helpText.add('| module.pas            | Default Modules                          |');
    helpText.add('| controller.pas        | Default Controller                       |');
    helpText.add('| service.pas           | Default Service                          |');
    helpText.add('| vcl.project.pas       | Default VCL Server Project           	   |');
    helpText.add('| vcl.project.unit.pas 	| Default VCL Server Unit                  |');
    helpText.add('| vcl.project.form.pas 	| Default VCL Server Form              	   |');
    helpText.add('| console.projetc.pas 	| Default Console Project              	   |');
    helpText.add('| horse.project.pas   	| Horse Pattern Projec                     |');
    helpText.add('| horse.handler.pas   	| Horse Pattern Route Handler              |');
    helpText.add('| body.pas              | Guad Routes Body                         |');
    helpText.add('| header.pas            | Guad Routes Header                       |');
    helpText.add('| pipe.pas              | Pipe (Transformation/Validation)         |');
    helpText.add('|-----------------------|------------------------------------------|');
    helpText.add('');

    Utils.printHelp(helpText.join('\n'));
  }
}
