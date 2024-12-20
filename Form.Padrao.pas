unit Form.Padrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TFormPadrao = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Button5: TButton;
    StyleBook1: TStyleBook;
    Label2: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    procedure Button3Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FClicks: Integer;
    procedure SetClicks(const Value: Integer);
    function GetClicks: Integer;
    { Private declarations }
  public
    { Public declarations }
    property Clicks: Integer read GetClicks write SetClicks;
  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.fmx}

procedure TFormPadrao.Button3Click(Sender: TObject);
begin
  ShowMessage('Inserido com sucesso');
end;

procedure TFormPadrao.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  SetClicks(1);
end;

function TFormPadrao.GetClicks: Integer;
begin
  Result := FClicks;
end;

procedure TFormPadrao.SetClicks(const Value: Integer);
begin
  FClicks := FClicks + Value;
  Label2.Text := IntToStr(FClicks) + ' Cliques';
end;

end.
