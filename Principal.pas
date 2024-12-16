unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Classe.Pessoa, FMX.Edit, Conexao.SQLServer, Conexao.MySQL, Classe.Fornecedor,
  Classe.Cliente, FMX.ListBox, Classe.Animal;

type

  TConfiguracao = record
    Host: string;
    Path: string;
    Usuario: string;
    Senha: string;
  end;

  TCaneca = class

  end;

  TGarrafa = class
    Cor: string;
    Modelo: string;
    Tampa: string;
    Caneca: TCaneca;
    constructor Create;
    destructor Destroy; override;
    procedure ArmazenarLiquido(Liquido: string);
  end;

  TRoda = class
    public
      Tipo: string;
      Tamanho: string;
  end;

  TCarro = class

    type
      TRoda = class
        public
          Tipo: string;
          Tamanho: string;
      end;

    private
      Marca: string;
      Modelo: string;
      Roda: TRoda;
    public

    procedure MontarCarro;

  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    btnCadClienteProcedural: TButton;
    btnCadClientePOO: TButton;
    edtDataNascimento: TEdit;
    Button3: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    ComboBox2: TComboBox;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCadClientePOOClick(Sender: TObject);
    procedure btnCadClienteProceduralClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure ExibeMemo(Configuracao: TConfiguracao);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: string);
begin
  //
end;

procedure TForm1.btnCadClientePOOClick(Sender: TObject);
var
  Cliente: TPessoa;
begin
  try
    Cliente := TPessoa.Create(TConexaoSQLServer.Create);
    Cliente.Nome := 'Igor';
    Cliente.Telefone := '32231185';
    Cliente.Endereco := 'Rua testando POO e Financeiro, 85';
    Cliente.Cidade := 'Capital';
    Cliente.Estado := 'Ceará';
    Cliente.DataNascimento := StrToDateTime(edtDataNascimento.Text);
    Cliente.CadastrarClientePOO;
    Cliente.CriarFinanceiro;

    ShowMessage('Idade: ' +IntToStr(Cliente.Idade));
  finally
    Cliente.Free;
  end;
end;

procedure TForm1.btnCadClienteProceduralClick(Sender: TObject);
var
  Fornecedor: TFornecedor;
begin
  Fornecedor := TFornecedor.Create(TConexaoMySQL.Create);
  try
    Fornecedor.Nome := 'Teste 1';
    Fornecedor.Cidade := 'Fortaleza';
    Fornecedor.Estado := 'Ceará';
    Fornecedor.RazaoSocial := 'Teste LTDA';
    Fornecedor.Cadastrar;
    Fornecedor.CriarFinanceiro;
  finally
    Fornecedor.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  MinhaGarrafa: TGarrafa;
begin
  MinhaGarrafa := nil;

  if Assigned(MinhaGarrafa) then
    ShowMessage('Estou instanciado')
  else
    MinhaGarrafa := TGarrafa.Create;

  try
    MinhaGarrafa.Modelo := 'Vidro';
    MinhaGarrafa.Cor := 'Vermelha';
  finally
    FreeAndNil(MinhaGarrafa);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Configuracao: TConfiguracao;
begin
  Configuracao.Host := 'localhost';
  Configuracao.Path := 'teste';
  Configuracao.Usuario := 'user';
  Configuracao.Senha := 'senha';
  ExibeMemo(Configuracao);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create(TConexaoMySQL.Create);
  try
    Cliente.Nome := 'Teste 1';
    Cliente.Cidade := 'Fortaleza';
    Cliente.Estado := 'Ceará';
    Cliente.Saldo := 2000;
    Cliente.Cadastrar;
    Cliente.CriarFinanceiro;
  finally
    Cliente.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  case ComboBox1.ItemIndex of
    0: Pessoa := TCliente.Create(nil);
    1: Pessoa := TFornecedor.Create(nil);
    2: Pessoa := TPessoa.Create(nil);
  end;

  try
    ShowMessage(Pessoa.Tipo);
  finally
    Pessoa.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Animal: TAnimal;
begin
  case ComboBox2.ItemIndex of
    0: Animal := TCachorro.Create;
    1: Animal := TGato.Create;
  end;

  try
    ShowMessage(Animal.Voz);
  finally
    Animal.Free;
  end;
end;

procedure TForm1.ExibeMemo(Configuracao: TConfiguracao);
begin
  Memo1.Lines.Add(Configuracao.Host);
  Memo1.Lines.Add(Configuracao.Path);
  Memo1.Lines.Add(Configuracao.Usuario);
  Memo1.Lines.Add(Configuracao.Senha);
end;

constructor TGarrafa.Create;
begin

end;

destructor TGarrafa.Destroy;
begin

  inherited;
end;

{ TCarro }

procedure TCarro.MontarCarro;
begin
  Marca := 'BMW';
  Modelo := 'i320';
  Roda.Tipo := 'Liga leve';
  Roda.Tamanho := '15';
end;

end.
