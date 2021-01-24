unit untDataModule;

interface

uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Db, DBClient, MConnect, ComObj,  MidasLib,  OleServer,
     ComCtrls, StdCtrls, ExtCtrls, Variants, SConnect,
     IdBaseComponent, IdComponent, IdTCPClient, IdAntiFreeze,
     IdExplicitTLSClientServerBase,   ActiveX, AxCtrls, ShellApi,
     ObjBrkr, Jpeg, SHDocVw, Math,   IdGlobal,  Vcl.Themes, Vcl.Styles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
     TfrmDados = class(TDataModule)
    OpenDialogCSV: TOpenDialog;
    FDConnection: TFDConnection;
    Driver: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTableProjeto: TFDTable;
    FDTableProjetoidProjeto: TFDAutoIncField;
    FDTableProjetonomeProjeto: TStringField;
    FDTableProjetodataInicio: TDateField;
    FDTableProjetodataFim: TDateField;
    FDTableProjetovalorProjeto: TFloatField;
    FDTableProjetorisco: TIntegerField;
          procedure SplashAviso(Ativo: Boolean);
          procedure ExportCSV(hWnd: hWnd; InfoLocal: TDataSet; Arquivo: String; Separador: String);
    procedure DataModuleCreate(Sender: TObject);
     private
     public

     end;

var
     frmDados: TfrmDados;

implementation

uses untModeloAviso, untMenuPrincipal;

{$R *.dfm}

// chamada de um splah para esperar na tela um processamento
procedure TfrmDados.SplashAviso(Ativo: Boolean);
begin
     if Ativo then
     begin
          try
               Application.ProcessMessages;
               //
               Screen.Cursor := crNone;
               //
               frmModeloAviso := TfrmModeloAviso.Create(Self);
               //
               frmModeloAviso.Show;
               //
               frmModeloAviso.Refresh;
               //
               Application.ProcessMessages;
          except
               on E: Exception do
               begin
                    MessageDlg(E.Message, mtError, [mbOk], 0);
                    //
                    Application.ProcessMessages;
               end;
          end;
     end
     else
     begin
          try
               Application.ProcessMessages;
               //
               Screen.Cursor := crHandPoint;
               //
               frmModeloAviso.Close;
               //
               frmModeloAviso.Free;
               //
               Application.ProcessMessages;
          except
               on E: Exception do
               begin
                    MessageDlg(E.Message, mtError, [mbOk], 0);
                    //
                    Application.ProcessMessages;
               end;
          end;
     end;
end;

procedure TfrmDados.DataModuleCreate(Sender: TObject);
begin
    try
         // inicializa a conexao  com o banco de dados local
        FDConnection.Params.Database := 'dbsisproject';
        FDConnection.Params.UserName := 'root';
        FDConnection.Params.Password := '';
        //
        // lib de conexao do MYSQL
        Driver.VendorLib := ExtractFileDir(Application.ExeName) +  '\lib\libmySQL.dll';
        //
        FDConnection.Connected := True;
  except
          on E: Exception do
          begin
               raise Exception.Create(Name + ' => ' + 'Erro na conexão com o SERVIDOR.' + #10 + #13 + #10 + #13 + E.Message);
               //
               if not Application.Terminated then
                    Application.Terminate;
          end;
     end;
end;

procedure TfrmDados.ExportCSV(hWnd: hWnd; InfoLocal: TDataSet; Arquivo: String; Separador: String);
var
     Lista: TStringList;
     Linha: String;
     Contador: Integer;
begin
     if TClientDataSet(InfoLocal).Active and (TClientDataSet(InfoLocal).RecordCount > 0) then
     begin
          OpenDialogCSV.FileName := Arquivo;
          //
          if OpenDialogCSV.Execute then
          begin
               Arquivo := OpenDialogCSV.FileName;
               //
               if ForceDirectories(ExtractFilePath(Arquivo)) then
               begin
                    try
                         TClientDataSet(InfoLocal).DisableControls;
                         //
                         Lista := TStringList.Create;
                         //
                         Application.ProcessMessages;
                         //
                         try
                              Linha := '';
                              // Atribui os nomes dos campos as colunas da tabela
                              for Contador := 0 to TClientDataSet(InfoLocal).Fields.Count - 1 do
                              begin
                                   if TClientDataSet(InfoLocal).Fields[Contador].Visible and (not TClientDataSet(InfoLocal).Fields[Contador].IsBlob) then
                                        Linha := Linha + TClientDataSet(InfoLocal).Fields[Contador].DisplayName + Separador;
                              end;
                              //
                              Lista.Add(Linha);
                              //
                              TClientDataSet(InfoLocal).First;
                              //
                              while not TClientDataSet(InfoLocal).Eof do
                              begin
                                   Linha := '';
                                   // Adiciona o conteúdo da tabela
                                   for Contador := 0 to TClientDataSet(InfoLocal).Fields.Count - 1 do
                                   begin
                                        if TClientDataSet(InfoLocal).Fields[Contador].Visible and (not TClientDataSet(InfoLocal).Fields[Contador].IsBlob) then
                                             Linha := Linha + '"' + TClientDataSet(InfoLocal).Fields[Contador].AsString + '"' + Separador;
                                   end;
                                   //
                                   Lista.Add(Linha);
                                   //
                                   TClientDataSet(InfoLocal).Next;
                              end;
                              //
                              Lista.SaveToFile(Arquivo);
                         finally
                              Lista.Free;
                              //
                              Application.ProcessMessages;
                         end;
                         //
                         TClientDataSet(InfoLocal).EnableControls;
                         //
                         Application.ProcessMessages;
                    except
                         on E: Exception do
                          MessageDlg('ARQUIVO CSV: ' + E.Message, mtError, [mbOk], 0);

                    end;
               end
               else
                    MessageDlg('Sem permissão para criar o arquivo: ' + Arquivo, mtError, [mbOk], 0);
               //
               if FileExists(Arquivo) then
                    ShellExecute(hWnd, 'open', pchar(Arquivo), nil, nil, SW_SHOWNORMAL);
          end
          else
               MessageDlg('Erro ao gerar o arquivo!', mtError, [mbOk], 0);
     end
     else
          MessageDlg('Não existem informações disponíveis!', mtError, [mbOk], 0);
end;


end.
