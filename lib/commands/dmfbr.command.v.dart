import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.interfaces.dart';

class CommandVersion implements ICommand {
  @override
  ICommand? execute(final String dirName, final String fileName, final ICLI cli) {
    Utils.printVersion('Version 0.0.1');
    return this;
  }
}
