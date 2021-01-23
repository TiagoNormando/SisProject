program SistemaProject;

uses
  Vcl.Forms,
  untMenuPrincipal in 'view\untMenuPrincipal.pas' {frmMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
