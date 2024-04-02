program appform;
uses
  System.StartUpCopy,
  FMX.Forms,
  index in 'index.pas' {IndexView},
  mythread in '..\..\modules\mythread\src\mythread.pas',
  myload in '..\..\src\myload.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TIndexView, IndexView);
  Application.Run;
end.
