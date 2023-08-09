import '../clibr.interfaces.dart';

class CommandInfra implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    print('Infra');
    return true;
  }
}
