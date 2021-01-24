unit untCadastroProjetosInvestimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmCadastroProjetosInvestimento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    lblLocalizar: TLabel;
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProjetosInvestimento: TfrmCadastroProjetosInvestimento;

implementation

{$R *.dfm}

procedure TfrmCadastroProjetosInvestimento.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then key :=#0;
end;

end.
