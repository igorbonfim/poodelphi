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
  protected // atributos podem ser enxergados somente pelas classes filha
    hhh: string;
  strict private
    FDataNascimento: TDateTime;
    FNome: string;
    FEndereco: string;
    Conexao: IConexao;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: string);
    function GetEndereco: string;
    procedure SetEndereco(const Value: string);
  public
    Telefone: string;
    Cidade: string;
    Estado: string;
    Tipo: string;
    constructor Create(aConexao: IConexao);
    procedure CadastrarClientePOO;
    procedure Cadastrar;
    procedure CriarFinanceiro;
    function Idade: integer;
    property Nome: string read FNome write SetNome;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Endereco: string read GetEndereco write SetEndereco;
  end;

implementation

{ TCliente }

procedure TPessoa.Cadastrar;
begin
  //Cadastrar
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

procedure TPessoa.CriarFinanceiro;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Nome);
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

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
var
  aClasse: TPessoa;
begin
  //
end;

end.



