import 'commands/clibr.command.templates.dart';
import 'clibr.interfaces.dart';
import 'core/clibr.command.pair.dart';
import 'commands/clibr.command.all.dart';
import 'commands/clibr.command.c.dart';
import 'commands/clibr.command.dpr.dart';
import 'commands/clibr.command.h.dart';
import 'commands/clibr.command.handler.dart';
import 'commands/clibr.command.pipe.dart';
import 'commands/clibr.command.v.dart';
import 'commands/clibr.command.i.dart';
import 'commands/clibr.command.m.dart';
import 'commands/clibr.command.info.dart';
import 'commands/clibr.command.r.dart';
import 'commands/clibr.command.s.dart';
import 'commands/vcl/clibr.command.dpr.vcl.dart';
import 'commands/horse/clibr.command.dpr.horse.dart';
import 'commands/horse/clibr.command.handler.horse.dart';

class CLI implements ICLI {
  late Map<String, CommandPair> _optionsNew;
  late Map<String, CommandPair> _optionsVersion;
  late Map<String, CommandPair> _optionsHelp;
  late Map<String, CommandPair> _optionsGenerate;
  late Map<String, CommandPair> _optionsInternal;
  late Map<String, Map<String, CommandPair>> _commands;
  late Map<String, bool> _tags;
  late String _commandExecuted;
  final String pathBin;
  final List<String> _updates = [];

  CLI(this.pathBin) {
    _optionsVersion = {
      '--version': CommandPair(false, CommandVersion()),
      '-v': CommandPair(false, CommandVersion()),
    };

    _optionsHelp = {
      'info': CommandPair(false, CommandInfo()),
      'i': CommandPair(false, CommandInfo()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
      '--templates': CommandPair(false, CommandTemplates()),
      '-t': CommandPair(false, CommandTemplates()),
    };

    _optionsNew = {
      'application': CommandPair(false, CommandGenerateProject()),
      'app': CommandPair(false, CommandGenerateProject()),
      '--help': CommandPair(false, CommandHelp()),
      '-h': CommandPair(false, CommandHelp()),
    };

    _optionsGenerate = {
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

    _tags = {
      '--guard': false,
      '-gu': false,
      '--horse': false,
      '--vcl': false,
    };

    _optionsInternal = {
      'handler': CommandPair(false, CommandRouteHandler()),
      'horse-app': CommandPair(false, CommandGenerateProjectHorse()),
      'horse-handler': CommandPair(false, CommandRouteHandlerHorse()),
      'vcl-app': CommandPair(false, CommandGenerateProjectVCL()),
    };

    _commands = {
      'new': _optionsNew,
      'n': _optionsNew,
      'generate': _optionsGenerate,
      'g': _optionsGenerate,
      'info': _optionsHelp,
      'i': _optionsHelp,
      '--help': _optionsHelp,
      '-h': _optionsHelp,
      '--templates': _optionsHelp,
      '-t': _optionsHelp,
      '--version': _optionsVersion,
      '-v': _optionsVersion,
    };
  }

  @override
  Map<String, Map<String, CommandPair>> get commands => _commands;

  @override
  List<String> get updates => _updates;

  @override
  Map<String, bool> get tags => _tags;

  @override
  Map<String, CommandPair> get optionsInternal => _optionsInternal;

  @override
  String get commandExecuted => _commandExecuted;

  @override
  set commandExecuted(String value) => _commandExecuted = value;

  @override
  String get pathEXE => '$pathBin/templates';
}
