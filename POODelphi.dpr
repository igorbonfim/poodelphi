program POODelphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  cCliente in 'cCliente.pas',
  Conexao.SQLServer in 'Conexao.SQLServer.pas',
  Interfaces in 'Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
