unit Conexao.MySQL;

interface

uses
  Interfaces;

type
  TConexaoMySQL = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
  end;

implementation

{ TConexaoMySQL }

procedure TConexaoMySQL.Gravar;
var
  gravar: string;
begin
  gravar := 'gravado no banco mysql';
end;


procedure TConexaoMySQL.Ler;
begin
  // Ler no banco
end;

end.
