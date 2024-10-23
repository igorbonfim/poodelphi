unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, cCliente, FMX.Edit;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCadClientePOOClick(Sender: TObject);
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
  Cliente: TCliente;
begin
  try
    Cliente := TCliente.Create;
    Cliente.Nome := 'Igor';
    Cliente.Telefone := '32231185';
    Cliente.Endereco := 'Rua testando POO, 85';
    Cliente.Cidade := 'Capital do Ceará';
    Cliente.Estado := 'Ceará';
    Cliente.DataNascimento := StrToDateTime(edtDataNascimento.Text);
    Cliente.CadastrarClientePOO;

    ShowMessage('Idade: ' +IntToStr(Cliente.Idade));
  finally
    Cliente.Free;
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
