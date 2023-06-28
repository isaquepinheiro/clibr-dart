import 'dmfbr.command.pair.dart';

class Commands {
  final Map<String, CommandPair> _commands = {};

  void add(final String key, final CommandPair value) {
    _commands[key] = value;
  }

  CommandPair? operator [](String key) => _commands[key];
}
