program myloadfront;

uses
  System.StartUpCopy,
  FMX.Forms,
  index in 'index.pas' {IndexView},
  myload in '..\..\src\myload.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIndexView, IndexView);
  Application.Run;
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
end.
