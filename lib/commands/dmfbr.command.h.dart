import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.interfaces.dart';

class CommandHelp implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI) {
    _executeInternal();
    return this;
  }

  void _executeInternal() {
    List<String> helpText = [];
    helpText.add('DMFBr CLI');
    helpText.add('\u001b[35m' 'help:' '\u001b[0m');
    helpText.add('  dmfbr new <name> [options]');
    helpText.add('  dmfbr n <name> [options]');
    helpText.add('  dmfbr generate <name> [options]');
    helpText.add('  dmfbr g <name> [options]');
    helpText.add('  dmfbr --help');
    helpText.add('  dmfbr -h');
    helpText.add('  dmfbr --version');
    helpText.add('  dmfbr -v');
    helpText.add('\u001b[32m' 'commands:' '\u001b[0m');
    helpText.add('  n, new         Gera um novo projeto');
    helpText.add('  g, generate    Gera um módulo ou um controller');
    helpText.add('  i, info        Exibe informações sobre o DMFBr');
    helpText.add('\u001b[35m' 'options:' '\u001b[0m');
    helpText.add('  --guard        Adiciona guardas de segurança');
    helpText.add('  -gu            Adiciona guardas de segurança');
    helpText.add('  --horse        Cria novo projeto no estilo horse');
    helpText.add('\u001b[36m' 'samples:' '\u001b[0m');
    helpText.add('  dmfbr n app ./src/app_rest');
    helpText.add('  dmfbr n app ./src/app_rest --horse');
    helpText.add('  dmfbr n app ./src/app_rest --guard');
    helpText.add('  dmfbr g module ./modules/produto');
    helpText.add('  dmfbr g controller .modules/controllers/produto');
    helpText.add('  dmfbr g service ./modules/service/produto');
    helpText.add('  dmfbr g repsitory ./modules/repsitory/produto');
    helpText.add('  dmfbr g infra ./modules/infra/produto');
    helpText.add('\u001b[33m'
        'For more information, please refer to the documentation.'
        '\u001b[0m');
    helpText.add('\u001b[34m' 'https://dmfbr-en.docs-br.com' '\u001b[0m');
    helpText.add('');
    // Exibe o texto de ajuda
    Utils.printHelp(helpText.join('\n'));
  }
}
