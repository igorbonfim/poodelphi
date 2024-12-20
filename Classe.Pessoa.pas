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

  TEventMemo = procedure (Value: string) of object;

  TPessoa = class
  private // atributos privados, vistos somente dentro da própria classe; protected - atributos podem ser enxergados somente pelas classes filha
    Conexao: IConexao;
    FUF: String;
    FNome: String;
    FCidade: String;
    FEndereco: String;
    FTelefone: String;
    FSaldo: Currency;
    FDataNascimento: TDate;
    FEventMemo: TEventMemo;
    function GetEndereco: string;
    procedure SetCidade(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetSaldo(const Value: Currency);
    procedure SetTelefone(const Value: string);
    procedure SetUF(const Value: String);
    procedure SetEventMemo(const Value: TEventMemo);
  public
    constructor Create(aConexao: IConexao); virtual;  // virtual permite que o método seja sobreescrito pelas classes filha
    procedure Cadastrar;
    procedure CriarFinanceiro; overload;
    procedure CriarFinanceiro(Value: Currency); overload;
    function Idade: integer;
    function Tipo: String; virtual; abstract;
    property Nome: String read FNome write SetNome;
    property Telefone: String read FTelefone write SetTelefone;
    property Endereco: String read FEndereco write SetEndereco;
    property Cidade: String read FCidade write SetCidade;
    property UF: String read FUF write SetUF;
    property Saldo: Currency read FSaldo write SetSaldo;
    property EventMsg: TEventMemo read FEventMemo write SetEventMemo;
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
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
    Lista.Add('Telefone: ' +Telefone);
    Lista.Add('Endereco: ' +Endereco);
    Lista.Add('Cidade: ' +Cidade);
    Lista.Add('Estado: ' +UF);
    Lista.SaveToFile(Nome + '_Cadastro.txt');
    Conexao.Gravar;
    EventMsg(Nome + ' cadastrado com sucesso!');
  finally
    Lista.Free;
  end;
end;

constructor TPessoa.Create(aConexao: IConexao);
begin
  Conexao := aConexao;
  UF := 'Ceará';
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

    EventMsg(Nome + ' cadastrado o financeiro com sucesso!');
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

    EventMsg(Nome + ' cadastrado o financeiro com sucesso!');
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

procedure TPessoa.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TPessoa.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetEventMemo(const Value: TEventMemo);
begin
  FEventMemo := Value;
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

procedure TPessoa.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TPessoa.SetUF(const Value: String);
begin
  FUF := Value;
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



