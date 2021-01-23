program SistemaProject;

uses
  Vcl.Forms,
  untMenuPrincipal in 'view\untMenuPrincipal.pas' {frmMenuPrincipal},
  untDataModule in 'untDataModule.pas' {frmDados: TDataModule},
  untModeloAviso in 'View\untModeloAviso.pas' {frmModeloAviso},
  untCadastroProjetos in 'View\untCadastroProjetos.pas' {frmCadastroProjetos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDados, frmDados);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
