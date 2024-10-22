unit cCliente;

interface

type
  TCliente = class
  public
    Nome: string;
    Telefone: string;
    Endereco: string;
    Cidade: string;
    Estado: string;
    constructor Create;
    procedure CadastrarClientePOO;
  end;

implementation

uses
  System.Classes;

{ TCliente }

procedure TCliente.CadastrarClientePOO;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Telefone: ' +Telefone);
    Lista.Add('Endereco: ' +Endereco);
    Lista.Add('Cidade: ' +Cidade);
    Lista.Add('Estado: ' +Estado);
    Lista.SaveToFile('ClientePOO.txt');
  finally
    Lista.Free;
  end;
end;

constructor TCliente.Create;
begin
  Estado := 'Ceará';
end;

end.
