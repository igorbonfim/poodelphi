program POODelphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {Form1},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Conexao.SQLServer in 'Conexao.SQLServer.pas',
  Interfaces in 'Interfaces.pas',
  Conexao.MySQL in 'Conexao.MySQL.pas',
  Classe.Fornecedor in 'Classe.Fornecedor.pas',
  Classe.Cliente in 'Classe.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
