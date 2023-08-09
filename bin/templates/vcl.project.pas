program {programName};

uses
  Vcl.Forms,
  u{unitName} in 'u{unitName}.pas' {FormPing},
  app.module in 'src\app.module.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TFormPing, FormPing);
  Application.Run;
end.
