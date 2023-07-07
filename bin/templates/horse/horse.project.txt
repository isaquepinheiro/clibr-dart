program {programName};

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  horse.modular,
  app.module in 'src\app.module.pas',
  ping.route.handler in 'src\modules\ping\ping.route.handler.pas',
  ping.module in 'src\modules\ping\ping.module.pas',
  ping.controller in 'src\modules\ping\controllers\ping.controller.pas',
  ping.service in 'src\modules\ping\services\ping.service.pas';

begin
  {$IFDEF MSWINDOWS}
  IsConsole := false;
  ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}

  THorse.Use(HorseModular(TAppModule.Create));

  THorse.Listen(9000, '127.0.0.1',
    procedure
    begin
      Writeln(Format('Server is running on %s:%d', [THorse.Host, THorse.Port]));
      Readln;
    end);
end.
