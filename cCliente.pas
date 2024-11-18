unit cCliente;

interface

uses
  System.Classes, System.SysUtils;

type
  TClasseAmiga = class
  strict private
    Teste: string;
  public
    procedure TesteDeSoftware;
  end;

type
  TCliente = class
  strict private
    FDataNascimento: TDateTime;
    FNome: string;
    FEndereco: string;
    Saldo: currency;
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
    procedure CriarFinanceiro;
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
    Lista.SaveToFile(Nome + '_ClientePOO.txt');
  finally
    Lista.Free;
  end;
end;

constructor TCliente.Create;
begin
  Estado := 'Ceará';
  Saldo := 1000;
end;

procedure TCliente.CriarFinanceiro;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Saldo: ' +CurrToStr(Saldo));
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
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
  //
end;

end.



