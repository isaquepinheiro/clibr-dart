import 'dmfbr.interfaces.dart';
import 'core/dmfbr.command.pair.dart';
import 'commands/dmfbr.command.all.dart';
import 'commands/dmfbr.command.c.dart';
import 'commands/dmfbr.command.dpr.dart';
import 'commands/dmfbr.command.h.dart';
import 'commands/dmfbr.command.handler.dart';
import 'commands/dmfbr.command.pipe.dart';
import 'commands/dmfbr.command.v.dart';
import 'commands/dmfbr.command.i.dart';
import 'commands/dmfbr.command.m.dart';
import 'commands/dmfbr.command.info.dart';
import 'commands/dmfbr.command.r.dart';
import 'commands/dmfbr.command.s.dart';
import 'commands/vcl/dmfbr.command.dpr.vcl.dart';
import 'commands/horse/dmfbr.command.dpr.horse.dart';
import 'commands/horse/dmfbr.command.handler.horse.dart';

class CLI implements ICLI {
  late Map<String, CommandPair> _argumentsNew;
  late Map<String, CommandPair> _argumentsVersion;
  late Map<String, CommandPair> _argumentsHelp;
  late Map<String, CommandPair> _argumentsGenerate;
  late Map<String, CommandPair> _argumentsInternal;
  late Map<String, Map<String, CommandPair>> _commandList;
  late Map<String, bool> _options;
  late String _commandExecuted;
  final List<String> _argumentList = [];

  CLI() {
    _argumentsVersion = {
      '--version': CommandPair(false, CommandVersion()),
      '-v': CommandPair(false, CommandVersion()),
    };

    _argumentsHelp = {
      'info': CommandPair(false, CommandInfo()),
      'i': CommandPair(false, CommandInfo()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
    };

    _argumentsNew = {
      'application': CommandPair(false, CommandGenerateProject()),
      'app': CommandPair(false, CommandGenerateProject()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
    };

    _argumentsGenerate = {
      'module': CommandPair(false, CommandModule()),
      'm': CommandPair(false, CommandModule()),
      'controller': CommandPair(false, CommandController()),
      'c': CommandPair(false, CommandController()),
      'service': CommandPair(false, CommandService()),
      's': CommandPair(false, CommandService()),
      'repository': CommandPair(false, CommandRepository()),
      'r': CommandPair(false, CommandRepository()),
      'infra': CommandPair(false, CommandInfra()),
      'i': CommandPair(false, CommandInfra()),
      'pipe': CommandPair(false, CommandTransformPipe()),
      'p': CommandPair(false, CommandTransformPipe()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
      '--all': CommandPair(false, CommandAll()),
    };

    _options = {
      '--guard': false,
      '-gu': false,
      '--horse': false,
      '--vcl': false,
    };

    _argumentsInternal = {
      'handler': CommandPair(false, CommandRouteHandler()),
      'horse-app': CommandPair(false, CommandGenerateProjectHorse()),
      'horse-handler': CommandPair(false, CommandRouteHandlerHorse()),
      'vcl-app': CommandPair(false, CommandGenerateProjectVCL()),
    };

    _commandList = {
      'new': _argumentsNew,
      'n': _argumentsNew,
      'generate': _argumentsGenerate,
      'g': _argumentsGenerate,
      'info': _argumentsHelp,
      'i': _argumentsHelp,
      '--help': _argumentsHelp,
      '-h': _argumentsHelp,
      '--version': _argumentsVersion,
      '-v': _argumentsVersion,
    };
  }

  @override
  Map<String, Map<String, CommandPair>> get commandList => _commandList;

  @override
  List<String> get argumentList => _argumentList;

  @override
  Map<String, bool> get options => _options;

  @override
  Map<String, CommandPair> get commandsInternal => _argumentsInternal;

  @override
  String get commandExecuted => _commandExecuted;

  @override
  set commandExecuted(String value) => _commandExecuted = value;
}
