unit Form.Heranca1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Padrao, FMX.Controls.Presentation, FMX.Layouts;

type
  TFormHeranca1 = class(TFormPadrao)
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHeranca1: TFormHeranca1;

implementation

{$R *.fmx}

procedure TFormHeranca1.Button3Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Inserido pelo formulário 1');
end;

end.
