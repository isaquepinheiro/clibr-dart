program {programName};

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  app.module in 'src\app.module.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
