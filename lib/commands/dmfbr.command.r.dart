import '../dmfbr.interfaces.dart';

class CommandRepository implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename, final ICLI cli) {
    print('Repository');
    return this;
  }
}
