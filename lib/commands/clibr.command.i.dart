import '../clibr.interfaces.dart';

class CommandInfra implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    print('Infra');
    return this;
  }
}
