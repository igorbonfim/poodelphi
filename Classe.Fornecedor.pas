unit Classe.Fornecedor;

interface

uses
  Classe.Pessoa;

type
  TFornecedor = class(TPessoa)
    RazaoSocial: String;
    function Tipo: string; override;
  end;

implementation

{ TFornecedor }

function TFornecedor.Tipo: string;
begin
  Result := 'Fornecedor';
end;

end.
