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
    edtValorInvestido: TEdit;
    procedure edtValorInvestidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
   retornarValor : boolean;
   valorProjeto : currency;
  end;

var
  frmCadastroProjetosInvestimento: TfrmCadastroProjetosInvestimento;

implementation

{$R *.dfm}

procedure TfrmCadastroProjetosInvestimento.Button1Click(Sender: TObject);
begin
  if StrToCurr(edtValorInvestido.Text)  < valorProjeto then      MessageDlg('Não é possivel realizar a simulação, valor do Projeto mairo que o investido!' , mtError, [mbOk], 0)
  else begin
      retornarValor := True;
      //
      Close;
  end;

end;

procedure TfrmCadastroProjetosInvestimento.edtValorInvestidoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then key :=#0;
end;

procedure TfrmCadastroProjetosInvestimento.FormShow(Sender: TObject);
begin
    retornarValor := False;
end;

end.
