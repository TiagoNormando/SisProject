unit untModeloAviso;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
     IdBaseComponent, IdThreadComponent, IdSchedulerOfThreadPool, IdScheduler,
     IdSchedulerOfThread, IdSchedulerOfThreadDefault;

type
     TfrmModeloAviso = class(TForm)
          pnlAviso: TPanel;
          lblAviso: TLabel;
          imgInformar: TImage;
          Timer: TTimer;
          procedure FormShow(Sender: TObject);
          procedure TimerTimer(Sender: TObject);
     private
          { Private declarations }
          tempoPesquisa: Integer;
     public
          { Public declarations }
     end;

var
     frmModeloAviso: TfrmModeloAviso;

implementation

{$R *.dfm}

procedure TfrmModeloAviso.FormShow(Sender: TObject);
begin
     tempoPesquisa := 0;
     //
     lblAviso.Caption := 'Atualizando informações do servidor, Aguarde...';
     //
     Application.ProcessMessages;
end;

procedure TfrmModeloAviso.TimerTimer(Sender: TObject);
begin
     lblAviso.Visible := False;
     //
     tempoPesquisa := tempoPesquisa + 30;
     //
     if tempoPesquisa = 30 then
          lblAviso.Caption := 'Processamento maior que o habitual, Aguarde...';
     //
     lblAviso.Visible := True;
end;

end.
