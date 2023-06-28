import '../dmfbr.interfaces.dart';

class CommandService implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI) {
    print('Service');
    return this;
  }
}
