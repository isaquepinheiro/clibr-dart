program appteste;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  horse.modular,
  app.module in 'app.module.pas',
  ping.controller in 'modules\ping\controllers\ping.controller.pas',
  ping.module in 'modules/ping\ping.module.pas',
  ping.route.handle in 'modules\ping\ping.route.handle.pas';

begin
  {$IFDEF MSWINDOWS}
  IsConsole := False;
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  THorse.Use(HorseModular(TAppModule.Create));

  THorse.Listen(9000, '127.0.0.1',
    procedure
    begin
      Writeln(Format('Server is running on %s:%d', [THorse.Host, THorse.Port]));
      Readln;
    end);

end.