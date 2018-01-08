program Project1;

uses
  Forms,
  Connect in 'Connect.pas' {ConnectForm},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Update in 'Update.pas' {UpdateForm},
  GenDataMainForm in 'GenDataMainForm.pas' {GenData};
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TConnectForm, ConnectForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TUpdateForm, UpdateForm);
  Application.CreateForm(TGenData, GenData);
  Application.Run;
end.
