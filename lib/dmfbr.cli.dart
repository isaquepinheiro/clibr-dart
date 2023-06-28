import 'package:dmfbr/commands/dmfbr.command.h.dart';
import 'package:dmfbr/commands/dmfbr.command.v.dart';
import 'package:dmfbr/commands/horse/dmfbr.command.dpr.horse.dart';
import 'package:dmfbr/commands/horse/dmfbr.command.handle.dart';
import 'package:dmfbr/commands/horse/dmfbr.command.m.horse.dart';

import 'commands/dmfbr.command.c.dart';
import 'commands/dmfbr.command.dpr.dart';
import 'commands/dmfbr.command.i.dart';
import 'commands/dmfbr.command.m.dart';
import 'commands/dmfbr.command.info.dart';
import 'commands/dmfbr.command.r.dart';
import 'commands/dmfbr.command.s.dart';
import 'core/dmfbr.command.pair.dart';
import 'dmfbr.interfaces.dart';

class ModularCLI implements IModularCLI {
  late Map<String, CommandPair> _commandsProject;
  late Map<String, CommandPair> _commandsVersion;
  late Map<String, CommandPair> _commandsHelp;
  late Map<String, CommandPair> _commandsGenerate;
  late Map<String, CommandPair> _commandsHorse;
  late Map<String, Map<String, CommandPair>> _commands;
  late Map<String, bool> _commandsOptions;
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

    _commandsProject = {
      'application': CommandPair(false, CommandGenerateProject()),
      'app': CommandPair(false, CommandGenerateProject()),
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
    };

    _commandsOptions = {
      '--guard': false,
      '-gu': false,
      '--horse': false,
    };

    _commands = {
      'new': _commandsProject,
      'n': _commandsProject,
      'generate': _commandsGenerate,
      'g': _commandsGenerate,
      '--version': _commandsVersion,
      '-v': _commandsVersion,
      '--help': _commandsHelp,
      '-h': _commandsHelp,
      'info': _commandsHelp,
      'i': _commandsHelp,
    };

    // Commands Horse
    _commandsHorse = {
      'app-horse': CommandPair(false, CommandGenerateProjectHorse()),
      'm-horse': CommandPair(false, CommandModuleHorse()),
      'rh-horse': CommandPair(false, CommandRouteHandleHorse()),
    };
  }

  @override
  Map<String, Map<String, CommandPair>> get commands => _commands;

  @override
  List<String> get commandsExecute => _commandsExecute;

  @override
  Map<String, bool> get options => _commandsOptions;

  @override
  Map<String, CommandPair> get commandsHorse => _commandsHorse;
}
