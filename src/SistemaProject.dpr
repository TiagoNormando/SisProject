program SistemaProject;

uses
  Vcl.Forms,
  untMenuPrincipal in 'view\untMenuPrincipal.pas' {frmMenuPrincipal},
  untDados in 'untDados.pas' {frmDados: TDataModule},
  untModeloAviso in 'View\untModeloAviso.pas' {frmModeloAviso};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TfrmDados, frmDados);
  Application.CreateForm(TfrmModeloAviso, frmModeloAviso);
  Application.Run;
end.
