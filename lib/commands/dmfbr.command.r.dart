import '../dmfbr.interfaces.dart';

class CommandRepository implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI) {
    print('Repository');
    return this;
  }
}
