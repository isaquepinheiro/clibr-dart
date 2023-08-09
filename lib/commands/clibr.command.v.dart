import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandVersion implements ICommand {
  @override
  bool execute(final String dirName, final String fileName, final ICli cli) {
    Utils.printVersion('Version ${Utils.version()}');
    return true;
  }
}
