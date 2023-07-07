program {programName};

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  app.module in 'src\app.module.pas',
  ping.route.handler in 'src\modules\ping\ping.route.handler.pas',
  ping.module in 'src\modules\ping\ping.module.pas',
  ping.controller in 'src\modules\ping\controllers\ping.controller.pas',
  ping.service in 'src\modules\ping\services\ping.service.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
