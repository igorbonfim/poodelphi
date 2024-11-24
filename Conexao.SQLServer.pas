unit Conexao.SQLServer;

interface

uses
  Interfaces;

type
  TConexaoSQLServer = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
  end;


implementation

{ TConexaoSQLServer }

procedure TConexaoSQLServer.Gravar;
var
  gravar: string;
begin
  gravar := 'gravado no banco sql server';
end;

procedure TConexaoSQLServer.Ler;
begin
  // ler no banco
end;

end.
