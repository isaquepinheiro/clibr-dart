import '../dmfbr.interfaces.dart';

class CommandInfra implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName,
      final IModularCLI modularCLI) {
    print('Infra');
    return this;
  }
}
