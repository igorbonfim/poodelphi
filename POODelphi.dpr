program POODelphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {FormPrincipal},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Conexao.SQLServer in 'Conexao.SQLServer.pas',
  Interfaces in 'Interfaces.pas',
  Conexao.MySQL in 'Conexao.MySQL.pas',
  Classe.Fornecedor in 'Classe.Fornecedor.pas',
  Classe.Cliente in 'Classe.Cliente.pas',
  Classe.Animal in 'Classe.Animal.pas',
  Form.Padrao in 'Form.Padrao.pas' {FormPadrao},
  Form.Heranca1 in 'Form.Heranca1.pas' {FormHeranca1},
  Form.Heranca2 in 'Form.Heranca2.pas' {FormHeranca2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormPadrao, FormPadrao);
  Application.CreateForm(TFormHeranca1, FormHeranca1);
  Application.CreateForm(TFormHeranca2, FormHeranca2);
  Application.Run;
end.
