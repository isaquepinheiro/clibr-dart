import 'clibr.interfaces.dart';
import 'core/clibr.command.pair.dart';
import 'commands/clibr.command.templates.dart';
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

class Cli implements ICli {
  late Map<String, CommandPair> _optionsNew;
  late Map<String, CommandPair> _optionsInfos;
  late Map<String, CommandPair> _optionsHelp;
  late Map<String, CommandPair> _optionsGenerate;
  late Map<String, CommandPair> _optionsInternal;
  late Map<String, Map<String, CommandPair>> _commands;
  late Map<String, bool> _tags;
  late String _commandExecuted;
  final String pathBin;
  final List<String> _updates = [];

  Cli(this.pathBin) {
    _optionsInfos = {
      'version': CommandPair(CommandVersion()),
      'v': CommandPair(CommandVersion()),
      'info': CommandPair(CommandInfo()),
      'i': CommandPair(CommandInfo()),
      'templates': CommandPair(CommandTemplates()),
      't': CommandPair(CommandTemplates()),
    };

    _optionsHelp = {
      '--help': CommandPair(CommandHelp()),
      '-h': CommandPair(CommandHelp()),
    };

    _optionsNew = {
      'application': CommandPair(CommandGenerateProject()),
      'app': CommandPair(CommandGenerateProject()),
      'new': CommandPair(CommandGenerateProject()),
      '--help': CommandPair(CommandHelp()),
      '-h': CommandPair(CommandHelp()),
    };

    _optionsGenerate = {
      'module': CommandPair(CommandModule()),
      'm': CommandPair(CommandModule()),
      'controller': CommandPair(CommandController()),
      'c': CommandPair(CommandController()),
      'service': CommandPair(CommandService()),
      's': CommandPair(CommandService()),
      'repository': CommandPair(CommandRepository()),
      'r': CommandPair(CommandRepository()),
      'infra': CommandPair(CommandInfra()),
      'i': CommandPair(CommandInfra()),
      'pipe': CommandPair(CommandTransformPipe()),
      'p': CommandPair(CommandTransformPipe()),
      'all': CommandPair(CommandAll()),
      '--help': CommandPair(CommandHelp()),
      '-h': CommandPair(CommandHelp()),
    };

    _tags = {
      '-gu': false,
      '--guard': false,
      '--horse': false,
      '--vcl': false,
    };

    _optionsInternal = {
      'handler': CommandPair(CommandRouteHandler()),
      'horse-app': CommandPair(CommandGenerateProjectHorse()),
      'horse-handler': CommandPair(CommandRouteHandlerHorse()),
      'vcl-app': CommandPair(CommandGenerateProjectVCL()),
    };

    _commands = {
      'new': _optionsNew,
      'n': _optionsNew,
      'generate': _optionsGenerate,
      'g': _optionsGenerate,
      'info': _optionsInfos,
      'i': _optionsInfos,
      'templates': _optionsInfos,
      't': _optionsInfos,
      'version': _optionsInfos,
      'v': _optionsInfos,
      '--help': _optionsHelp,
      '-h': _optionsHelp,
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
  String get pathCLI => '$pathBin/templates';
}
