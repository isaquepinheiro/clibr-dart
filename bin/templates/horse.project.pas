program {programName};

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  horse.modular,
  app.module in 'src\app.module.pas';

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
