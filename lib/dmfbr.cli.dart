import 'commands/dmfbr.command.templates.dart';
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
  late Map<String, CommandPair> _optionsNew;
  late Map<String, CommandPair> _optionsVersion;
  late Map<String, CommandPair> _optionsHelp;
  late Map<String, CommandPair> _optionsGenerate;
  late Map<String, CommandPair> _optionsInternal;
  late Map<String, Map<String, CommandPair>> _commands;
  late Map<String, bool> _tags;
  late String _commandExecuted;
  final String pathBin;
  final List<String> _options = [];

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
  List<String> get options => _options;

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
