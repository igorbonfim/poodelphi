unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Classe.Pessoa, FMX.Edit, Conexao.SQLServer, Conexao.MySQL, Classe.Fornecedor,
  Classe.Cliente, FMX.ListBox, Classe.Animal, Form.Heranca1, Form.Heranca2,
  Form.Padrao;

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

  TFormPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    btnCadFornecedor: TButton;
    btnCadCliente: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    ComboBox2: TComboBox;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCadFornecedorClick(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExibeMemo(Configuracao: TConfiguracao);
    procedure ExibeMensagemMemo(Value: String);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}


{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: string);
begin
  //
end;

procedure TFormPrincipal.btnCadFornecedorClick(Sender: TObject);
var
  Fornecedor: TFornecedor;
begin
  Fornecedor := TFornecedor.Create(TConexaoMySQL.Create);
  try
    Fornecedor.EventMsg := ExibeMensagemMemo;
    Fornecedor.Nome := 'Fornecedor';
    Fornecedor.Cidade := 'Fortaleza';
    Fornecedor.UF := 'Ceará';
    Fornecedor.RazaoSocial := 'Teste LTDA';
    Fornecedor.Cadastrar;
    Fornecedor.CriarFinanceiro(6000);

    ShowMessage('Fornecedor criado!');
  finally
    Fornecedor.Free;
  end;
end;

procedure TFormPrincipal.Button1Click(Sender: TObject);
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

procedure TFormPrincipal.Button2Click(Sender: TObject);
var
  Configuracao: TConfiguracao;
begin
  Configuracao.Host := 'localhost';
  Configuracao.Path := 'teste';
  Configuracao.Usuario := 'user';
  Configuracao.Senha := 'senha';
  ExibeMemo(Configuracao);
end;

procedure TFormPrincipal.btnCadClienteClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create(TConexaoMySQL.Create);
  try
    Cliente.EventMsg := ExibeMensagemMemo;
    Cliente.Nome := 'Cliente';
    Cliente.Cidade := 'Fortaleza';
    Cliente.UF := 'Ceará';
    Cliente.Saldo := 2000;
    Cliente.Cadastrar;
    Cliente.CriarFinanceiro;

    ShowMessage('Cliente criado!');
  finally
    Cliente.Free;
  end;
end;

procedure TFormPrincipal.Button4Click(Sender: TObject);
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

procedure TFormPrincipal.Button5Click(Sender: TObject);
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

procedure TFormPrincipal.Button6Click(Sender: TObject);
begin
  FormHeranca1.ShowModal;
end;

procedure TFormPrincipal.Button7Click(Sender: TObject);
begin
  FormHeranca2.ShowModal;
end;

procedure TFormPrincipal.ExibeMemo(Configuracao: TConfiguracao);
begin
  Memo1.Lines.Add(Configuracao.Host);
  Memo1.Lines.Add(Configuracao.Path);
  Memo1.Lines.Add(Configuracao.Usuario);
  Memo1.Lines.Add(Configuracao.Senha);
end;

procedure TFormPrincipal.ExibeMensagemMemo(Value: String);
begin
  Memo2.Lines.Add(Value);
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
