import 'package:dmfbr/core/dmfbr.utils.dart';
import 'package:dmfbr/dmfbr.interfaces.dart';

class CommandVersion implements ICommand {
  @override
  ICommand? execute(final String dirName, final String filename,
      final IModularCLI modularCLI) {
    _executeInternal();
    return this;
  }

  void _executeInternal() {
    Utils.printVersion('Version 0.0.1');
  }
}
