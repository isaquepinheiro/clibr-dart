import '../clibr.interfaces.dart';
import '../core/clibr.utils.dart';

class CommandVersion implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    Utils.printVersion('Version 0.0.1');
    return this;
  }
}
