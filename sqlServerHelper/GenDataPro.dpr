program GenDataPro;

uses
  Forms,
  GenDataMainForm in 'GenDataMainForm.pas' {GenData};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGenData, GenData);
  Application.Run;
end.
