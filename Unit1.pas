unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, cCliente;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCadClienteProceduralClick(Sender: TObject);
    procedure btnCadClientePOOClick(Sender: TObject);
  private
    procedure ExibeMemo(Configuracao: TConfiguracao);
    procedure CadastrarClienteProcedural(Nome, Telefone, Endereco, Cidade,
      Estado: string);
    procedure CadastrarClientePOO(Value: TCliente);
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
    CadastrarClientePOO(Cliente);
  finally
    Cliente.Free;
  end;
end;

procedure TForm1.btnCadClienteProceduralClick(Sender: TObject);
begin
  CadastrarClienteProcedural('Igor', '1111111', 'Rua testando procedural, 85', 'Fortaleza', 'Ceará');
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

procedure TForm1.CadastrarClienteProcedural(Nome, Telefone, Endereco, Cidade, Estado: string);
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
    Lista.SaveToFile('ClienteProcedural.txt');
  finally
    Lista.Free;
  end;
end;

procedure TForm1.CadastrarClientePOO(Value: TCliente);
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' +Value.Nome);
    Lista.Add('Telefone: ' +Value.Telefone);
    Lista.Add('Endereco: ' +Value.Endereco);
    Lista.Add('Cidade: ' +Value.Cidade);
    Lista.Add('Estado: ' +Value.Estado);
    Lista.SaveToFile('ClientePOO.txt');
  finally
    Lista.Free;
  end;
end;

end.
