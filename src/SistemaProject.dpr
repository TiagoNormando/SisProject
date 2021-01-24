program SistemaProject;

uses
  Vcl.Forms,
  untMenuPrincipal in 'view\untMenuPrincipal.pas' {frmMenuPrincipal},
  untDataModule in 'untDataModule.pas' {frmDados: TDataModule},
  untModeloAviso in 'View\untModeloAviso.pas' {frmModeloAviso},
  untCadastroProjetos in 'View\untCadastroProjetos.pas' {frmCadastroProjetos},
  untCadastroProjetosInvestimento in 'View\untCadastroProjetosInvestimento.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDados, frmDados);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
