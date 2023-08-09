import '../clibr.interfaces.dart';

class CommandRepository implements ICommand {
  @override
  bool execute(final String dirName, final String filename, final ICli cli) {
    print('Repository');
    return true;
  }
}
