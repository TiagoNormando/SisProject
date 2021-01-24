program SistemaProject;

uses
  Vcl.Forms,
  untMenuPrincipal in 'view\untMenuPrincipal.pas' {frmMenuPrincipal},
  untDataModule in 'untDataModule.pas' {frmDados: TDataModule},
  untModeloAviso in 'View\untModeloAviso.pas' {frmModeloAviso},
  untCadastroProjetos in 'View\untCadastroProjetos.pas' {frmCadastroProjetos},
  untCadastroProjetosInvestimento in 'View\untCadastroProjetosInvestimento.pas' {frmCadastroProjetosInvestimento},
  model.RetornoInvestimento.interfaces in 'Model\model.RetornoInvestimento.interfaces.pas',
  model.RetornoInvestimento in 'Model\model.RetornoInvestimento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDados, frmDados);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
