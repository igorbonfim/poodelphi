unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)
    Saldo: Currency;
  private
    function Devedor: string;
    function Tipo: string; override;
  end;

implementation

function TCliente.Devedor: string;
begin
  Self.hhh := 'ok';
  Result := hhh;
end;

function TCliente.Tipo: string;
begin
  Result := 'Cliente';
end;

end.
