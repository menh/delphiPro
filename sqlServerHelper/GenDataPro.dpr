program GenDataPro;

uses
  Forms,
  GenDataMainForm in 'GenDataMainForm.pas' {GenData},
  GenOptData in 'GenOptData.pas' {GenOptDataForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGenData, GenData);
  Application.CreateForm(TGenOptDataForm, GenOptDataForm);
  Application.Run;
end.
