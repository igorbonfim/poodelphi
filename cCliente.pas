unit cCliente;

interface

uses
  System.Classes, System.SysUtils;

type
  TClasseAmiga = class
  private
    Teste: string;
  public
    procedure TesteDeSoftware;
  end;

type
  TCliente = class
  private
    FDataNascimento: TDateTime;
    FNome: string;
    FEndereco: string;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: string);
    function GetEndereco: string;
    procedure SetEndereco(const Value: string);
  public
    Telefone: string;
    Cidade: string;
    Estado: string;
    constructor Create;
    procedure CadastrarClientePOO;
    function Idade: integer;
    property Nome: string read FNome write SetNome;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Endereco: string read GetEndereco write SetEndereco;
  end;

implementation



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

function TCliente.GetEndereco: string;
begin
  Result := FEndereco;
end;

function TCliente.Idade: integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);
end;

procedure TCliente.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Nome não pode ser nulo!');

  FNome := Value;
end;

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
var
  aClasse: TCliente;
begin
  aClasse.FNome := 'Teste';
end;

end.



