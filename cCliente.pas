unit cCliente;

interface

type
  TCliente = class
  private
    FDataNascimento: TDateTime;
  public
    Nome: string;
    Telefone: string;
    Endereco: string;
    Cidade: string;
    Estado: string;
    constructor Create;
    procedure CadastrarClientePOO;
    function Idade: integer;
    procedure SetDataNascimento(aValue: string);
  end;

implementation

uses
  System.Classes, System.SysUtils;

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

function TCliente.Idade: integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);
end;

procedure TCliente.SetDataNascimento(aValue: string);
begin
  if not TryStrToDateTime(aValue, FDataNascimento) then
    raise Exception.Create('A data é inválida');

  FDataNascimento := StrToDateTime(aValue);
end;

end.



