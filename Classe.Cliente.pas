unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)
    Saldo: Currency;
  private
    function Devedor: string;
  end;

implementation

function TCliente.Devedor: string;
begin
  Self.hhh := 'ok';
  Result := hhh;
end;

end.
