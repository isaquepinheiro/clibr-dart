import 'dart:io';

class Utils {
  static const String _reset = '\u001b[0m';
//  static const String _black = '\u001b[30m';
  static const String _red = '\u001b[31m';
  static const String _green = '\u001b[32m';
  static const String _yellow = '\u001b[33m';
  static const String _blue = '\u001b[34m';
  static const String _magenta = '\u001b[35m';
  static const String _cyan = '\u001b[36m';
  static const String _white = '\u001b[37m';

  static void printCreate(String title, String text, String message) {
    print('$_green$title $_white$text $message$_reset');
  }

  static void printUpdate(String title, String text, String message) {
    print('$_cyan$title $_white$text $message$_reset');
  }

  static void printVersion(String message) {
    print('$_magenta$message$_reset');
  }

  static void printLink(String message) {
    print('$_blue$message$_reset');
  }

  static void printAlert(String message) {
    print('$_red$message$_reset');
  }

  static void printHelp(String message) {
    print('$_yellow$message$_reset');
  }

  static String getSizeFile(String path) {
    final File file = File(path);
    final int size = file.lengthSync();
    return '(${size.toString()} bytes)';
  }
}
