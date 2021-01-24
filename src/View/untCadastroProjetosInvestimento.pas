unit untCadastroProjetosInvestimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, System.MaskUtils, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmCadastroProjetosInvestimento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    lblLocalizar: TLabel;
    edtValorInvestido: TEdit;
    Function FormatarBanco(Valor:String; Quant:Integer):String;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtValorInvestidoClick(Sender: TObject);
    procedure edtValorInvestidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorInvestidoChange(Sender: TObject);
    procedure edtValorInvestidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   retornarValor : boolean;
   valorProjeto : currency;
    v1, v2:String;
  end;

var
  frmCadastroProjetosInvestimento: TfrmCadastroProjetosInvestimento;

implementation

{$R *.dfm}

Function TfrmCadastroProjetosInvestimento.FormatarBanco(Valor:String; Quant:Integer):String;
begin
   case Length(Valor) of
      0:result:='';
      1:result:='0,0'+Valor;
      2:result:='0,'+Valor;
      3:result:=FormatMaskText('0,00;0', Valor);
      4:result:=FormatMaskText('00,00;0', Valor);
      5:result:=FormatMaskText('000,00;0', Valor);
      6:result:=FormatMaskText('0.000,00;0', Valor);
      7:result:=FormatMaskText('00.000,00;0', Valor);
      8:result:=FormatMaskText('000.000,00;0', Valor);
      9:result:=FormatMaskText('0.000.000,00;0', Valor);
      10:result:=FormatMaskText('00.000.000,00;0', Valor);
   end;
end;

procedure TfrmCadastroProjetosInvestimento.Button1Click(Sender: TObject);
begin
  if StrToCurr(StringReplace(edtValorInvestido.Text,'.', '', [rfReplaceAll, rfIgnoreCase]))  < valorProjeto  then    MessageDlg('Não é possivel realizar a simulação, valor do Projeto mairo que o investido!' , mtError, [mbOk], 0)
  else begin
      retornarValor := True;
      //
      Close;
  end;

end;

procedure TfrmCadastroProjetosInvestimento.edtValorInvestidoChange(
  Sender: TObject);
begin
 v2:=v1;
   edtValorInvestido.text:=FormatarBanco(v2, Length(v2));
end;

procedure TfrmCadastroProjetosInvestimento.edtValorInvestidoClick(
  Sender: TObject);
begin
   // retorno o cursor para o final do texto, caso tenha sido utilizado
   // o mouse para mover o cursor dentro do Edit
   TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
end;


procedure TfrmCadastroProjetosInvestimento.edtValorInvestidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=vk_delete then
      Begin
         edtValorInvestido.clear;
         v1:='';
      end;
end;

procedure TfrmCadastroProjetosInvestimento.edtValorInvestidoKeyPress(
  Sender: TObject; var Key: Char);
begin
v1:= v1 + key;
end;


procedure TfrmCadastroProjetosInvestimento.FormShow(Sender: TObject);
begin
    retornarValor := False;
    //
end;

end.
