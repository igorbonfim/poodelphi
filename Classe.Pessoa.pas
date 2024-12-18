unit Classe.Pessoa;

interface

uses
  System.Classes, System.SysUtils, Interfaces;

type
  TClasseAmiga = class
  strict private
    Teste: string;
  public
    procedure TesteDeSoftware;
  end;

type
  TPessoa = class
  private // atributos privados, vistos somente dentro da própria classe
    ttt: string;
    procedure SetSaldo(const Value: Currency);
  protected // atributos podem ser enxergados somente pelas classes filha
    hhh: string;
  strict private
    FDataNascimento: TDateTime;
    FNome: string;
    FEndereco: string;
    FSaldo: Currency;
    Conexao: IConexao;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: string);
    function GetEndereco: string;
    procedure SetEndereco(const Value: string);
  public
    Telefone: string;
    Cidade: string;
    Estado: string;
    constructor Create(aConexao: IConexao); virtual;  // virtual permite que o método seja sobreescrito pelas classes filha
    procedure CadastrarClientePOO;
    procedure Cadastrar;
    procedure CriarFinanceiro; overload;
    procedure CriarFinanceiro(Value: Currency); overload;
    function Idade: integer;
    property Nome: string read FNome write SetNome;
    property Saldo: Currency read FSaldo write SetSaldo;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Endereco: string read GetEndereco write SetEndereco;
    function Tipo: String; virtual; abstract;
  end;

  TMyComp = class(TComponent)
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TCliente }

procedure TPessoa.Cadastrar;
var
  Lista: TStringList;
begin
  {Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Saldo: ' +CurrToStr(Saldo));
    Lista.SaveToFile(Nome + '_Fornecedor.txt');
  finally
    Lista.Free;
  end;}
end;

procedure TPessoa.CadastrarClientePOO;
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

    Conexao.Gravar;
  finally
    Lista.Free;
  end;
end;

constructor TPessoa.Create(aConexao: IConexao);
begin
  Conexao := aConexao;
  Estado := 'Ceará';
end;

procedure TPessoa.CriarFinanceiro(Value: Currency);
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Saldo: ' +CurrToStr(Value));
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
end;

procedure TPessoa.CriarFinanceiro;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Saldo: 1000');
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
end;

function TPessoa.GetEndereco: string;
begin
  Result := FEndereco;
end;

function TPessoa.Idade: integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Nome não pode ser nulo!');

  FNome := Value;
end;

procedure TPessoa.SetSaldo(const Value: Currency);
begin
  FSaldo := Value;
end;

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
var
  aClasse: TPessoa;
begin
  //
end;

{ TMyComp }

constructor TMyComp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

end.



