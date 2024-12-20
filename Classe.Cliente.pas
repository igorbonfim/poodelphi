unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)
    Saldo: Currency;
  private
    function Tipo: string; override;
  end;

implementation

function TCliente.Tipo: string;
begin
  Result := 'Cliente';
end;

end.
