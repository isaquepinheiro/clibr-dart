import 'package:dmfbr/commands/dmfbr.command.h.dart';
import 'package:dmfbr/commands/dmfbr.command.v.dart';
import 'package:dmfbr/commands/horse/dmfbr.command.dpr.horse.dart';

import 'commands/dmfbr.command.all.dart';
import 'commands/dmfbr.command.c.dart';
import 'commands/dmfbr.command.dpr.dart';
import 'commands/dmfbr.command.handler.dart';
import 'commands/dmfbr.command.pipe.dart';
import 'commands/horse/dmfbr.command.handler.horse.dart';
import 'commands/dmfbr.command.i.dart';
import 'commands/dmfbr.command.m.dart';
import 'commands/dmfbr.command.info.dart';
import 'commands/dmfbr.command.r.dart';
import 'commands/dmfbr.command.s.dart';
import 'commands/vcl/dmfbr.command.dpr.vcl.dart';
import 'core/dmfbr.command.pair.dart';
import 'dmfbr.interfaces.dart';

class ModularCLI implements IModularCLI {
  late Map<String, CommandPair> _commandsNew;
  late Map<String, CommandPair> _commandsVersion;
  late Map<String, CommandPair> _commandsHelp;
  late Map<String, CommandPair> _commandsGenerate;
  late Map<String, CommandPair> _commandsExtra;
  late Map<String, Map<String, CommandPair>> _commands;
  late Map<String, bool> _commandsOptions;
  late String _command;
  final List<String> _commandsExecute = [];

  ModularCLI() {
    _commandsVersion = {
      '--version': CommandPair(false, CommandVersion()),
      '-v': CommandPair(false, CommandVersion()),
    };

    _commandsHelp = {
      'info': CommandPair(false, CommandInfo()),
      'i': CommandPair(false, CommandInfo()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
    };

    _commandsNew = {
      'application': CommandPair(false, CommandGenerateProject()),
      'app': CommandPair(false, CommandGenerateProject()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
    };

    _commandsGenerate = {
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

    _commandsOptions = {
      '--guard': false,
      '-gu': false,
      '--horse': false,
      '--vcl': false,
    };

    _commandsExtra = {
      'handler': CommandPair(false, CommandRouteHandler()),
      'horse-app': CommandPair(false, CommandGenerateProjectHorse()),
      'horse-handler': CommandPair(false, CommandRouteHandlerHorse()),
      'vcl-app': CommandPair(false, CommandGenerateProjectVCL()),
    };

    _commands = {
      'new': _commandsNew,
      'n': _commandsNew,
      'generate': _commandsGenerate,
      'g': _commandsGenerate,
      'info': _commandsHelp,
      'i': _commandsHelp,
      '--help': _commandsHelp,
      '-h': _commandsHelp,
      '--version': _commandsVersion,
      '-v': _commandsVersion,
    };
  }

  @override
  Map<String, Map<String, CommandPair>> get commands => _commands;

  @override
  List<String> get commandsExecute => _commandsExecute;

  @override
  Map<String, bool> get options => _commandsOptions;

  @override
  Map<String, CommandPair> get commandsExtra => _commandsExtra;

  @override
  String get command => _command;

  @override
  set command(String value) => _command = value;
}
