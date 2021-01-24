unit untCadastroProjetos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Data.DB,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  DBClient,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  REST.Client, Vcl.Buttons, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope,
  Xml.XMLDoc,
  Xml.Win.msxmldom,
  Xml.xmldom, Xml.XMLIntf,
  IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Menus,
  model.RetornoInvestimento.interfaces,
  model.RetornoInvestimento;

type
  TfrmCadastroProjetos = class(TForm)
    pnlForm: TPanel;
    pnlLocalizar: TPanel;
    lblLocalizar: TLabel;
    lblCampo: TLabel;
    cbxOpcao: TComboBox;
    edtRegistro: TMaskEdit;
    btnLocalizar: TButton;
    pnlBarra: TPanel;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnExportar: TButton;
    pnlDados: TPanel;
    ctrRegistro: TPageControl;
    tshListagem: TTabSheet;
    DBGridRegistro: TDBGrid;
    tshDados: TTabSheet;
    lblCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    srcRegistro: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    EdtNomeParticipantes: TEdit;
    Button2: TButton;
    ComboBoxRisco: TComboBoxEx;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    srcProjetoParticipante: TDataSource;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    lblDescricaoRisco: TLabel;
    Label8: TLabel;
    lblvalorProjeto: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblSimulado: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    lblValorInvestido: TLabel;
    ckValor: TCheckBox;
    btnSimular: TButton;
    Label16: TLabel;
    procedure Bloqueio(Tipo: Boolean);
    procedure FormResize(Sender: TObject);
    procedure srcRegistroDataChange(Sender: TObject; Field: TField);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure cbxOpcaoChange(Sender: TObject);
    procedure DBGridRegistroTitleClick(Column: TColumn);
    procedure DBGridRegistroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridRegistroDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtRegistroKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdtNomeParticipantesKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSimularClick(Sender: TObject);
    procedure ckValorClick(Sender: TObject);

  private

  public
   codigoProjeto : Integer;
   novoRegistro : boolean;
   valorRetornoInvestido, valorInvestimento, valorProjeto : currency;
  end;

var
  frmCadastroProjetos: TfrmCadastroProjetos;

implementation

{$R *.dfm}

uses untMenuPrincipal, untDataModule, untCadastroProjetosInvestimento;


procedure TfrmCadastroProjetos.Bloqueio(Tipo: Boolean);
begin
     pnlLocalizar.Enabled := Tipo;
     pnlBarra.Enabled := Tipo;
     pnlDados.Enabled := Tipo;
     pnlForm.Enabled := Tipo;
end;


procedure TfrmCadastroProjetos.btnCancelarClick(Sender: TObject);
begin
     try
          // Cancelar Registro
          try
              TClientDataSet(srcRegistro.DataSet).Cancel;
              //
              TClientDataSet(srcProjetoParticipante.DataSet).Cancel;
              TClientDataSet(srcProjetoParticipante.DataSet).Close;
              TClientDataSet(srcProjetoParticipante.DataSet).Open;

               //
          except
               on E: Exception do
                    raise Exception.Create(Name + ' => ' + E.Message);
          end;
     finally

     end;
     //
     if (srcRegistro.State = dsBrowse) and pnlLocalizar.Enabled and edtRegistro.Visible then
          edtRegistro.SetFocus;
end;

procedure TfrmCadastroProjetos.btnEditarClick(Sender: TObject);
begin
     if (srcRegistro.State = dsBrowse) and tshListagem.TabVisible then
          tshListagem.SetFocus;
     //
     try
          Bloqueio(False);
          // Editar Registro
          //
          novoRegistro := False;
          //
          TClientDataSet(srcRegistro.DataSet).Edit;
          //
          ComboBoxRisco.ItemIndex :=   TClientDataSet(srcRegistro.DataSet).FieldByName('risco').Value;
          //
          frmDados.FDqrProjetoParticipante.Close;
          frmDados.FDqrProjetoParticipante.ParamByName('PROJETO_ID').Value  := TClientDataSet(srcRegistro.DataSet).FieldByName('idProjeto').value;
          frmDados.FDqrProjetoParticipante.Open;
          //
          codigoProjeto := TClientDataSet(srcRegistro.DataSet).FieldByName('idProjeto').value;
          //
     finally
          //
          Bloqueio(True);
     end;
end;

procedure TfrmCadastroProjetos.btnExcluirClick(Sender: TObject);
begin
     // Deletar Registro
     if MessageDlg('Deseja remover o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
     begin
          try
               Bloqueio(False);
               try
                   //
                    frmDados.FDqrProjetoParticipante.Close;
                    frmDados.FDqrProjetoParticipante.ParamByName('PROJETO_ID').Value  := TClientDataSet(srcRegistro.DataSet).FieldByName('idProjeto').value;
                    frmDados.FDqrProjetoParticipante.Open;
                    //
                    if (frmDados.FDqrProjetoParticipante.RecordCount > 0) then
                    begin
                        ///
                        frmDados.FDqrProjetoParticipante.First;
                        //
                        while (not frmDados.FDqrProjetoParticipante.eof) do
                        begin
                             try
                                 frmDados.FDqrProjetoParticipante.Delete;
                                //
                            except
                                 on E: Exception do
                                 begin
                                      raise Exception.Create(Name + ' => ' + E.Message);
                                      //
                                      if (TClientDataSet(srcProjetoParticipante.DataSet).ChangeCount > 0) then
                                           TClientDataSet(srcProjetoParticipante.DataSet).UndoLastChange(True);
                                 end
                            end;
                            //
                            continue
                        end;
                       //
                      frmDados.FDqrProjetoParticipante.Append;
                      frmDados.FDqrProjetoParticipante.ApplyUpdates(-1);
                      frmDados.FDqrProjetoParticipante.UndoLastChange(True);
                    end;

                    TClientDataSet(srcRegistro.DataSet).Delete;
                    //
               except
                    on E: Exception do
                         raise Exception.Create(Name + ' => ' + E.Message);
               end;
          finally
               //
               Bloqueio(True);
          end;
     end;

end;

procedure TfrmCadastroProjetos.btnExportarClick(Sender: TObject);
begin
  try
          Bloqueio(False);
          //
          frmDados.ExportCSV(Self.Handle, srcRegistro.DataSet, 'c:\temp\' + Hint + '.csv', ';');
     finally
          //
          Bloqueio(True);
     end;
end;

procedure TfrmCadastroProjetos.btnIncluirClick(Sender: TObject);
begin
     // Inserir Registro
     if (srcRegistro.State = dsBrowse) and tshListagem.TabVisible then
          tshListagem.SetFocus;
     //
     try
          Bloqueio(False);
          //
          TClientDataSet(srcRegistro.DataSet).Insert;
          //
          TClientDataSet(srcRegistro.DataSet).FieldByName('nomeProjeto').Value := 'NOME DO PROJETO';
          TClientDataSet(srcRegistro.DataSet).FieldByName('dataInicio').Value := now;
          TClientDataSet(srcRegistro.DataSet).FieldByName('dataFim').Value := now + 360;
          TClientDataSet(srcRegistro.DataSet).FieldByName('valorProjeto').Value := 100.000;
          TClientDataSet(srcRegistro.DataSet).FieldByName('risco').Value := 0;
          //
          ComboBoxRisco.ItemIndex :=    TClientDataSet(srcRegistro.DataSet).FieldByName('risco').Value;
          //
          codigoProjeto := 0;
          //
           novoRegistro := True;
          //
          frmDados.FDqrProjetoParticipante.Close;
         frmDados.FDqrProjetoParticipante.ParamByName('PROJETO_ID').Value  := 0;
          frmDados.FDqrProjetoParticipante.Open;
     finally
          //
          Bloqueio(True);
     end;
end;

procedure TfrmCadastroProjetos.btnLocalizarClick(Sender: TObject);
var
     Contador: Integer;
begin

          try
               Bloqueio(False);
               //
               Application.ProcessMessages;
               //
               frmDados.SplashAviso(True);
               //
               TClientDataSet(srcRegistro.DataSet).Close;
               TClientDataSet(srcRegistro.DataSet).Open;
               //
               Application.ProcessMessages;
               //
               edtRegistro.Text := TrimLeft(TrimRight(edtRegistro.Text));
               //
               if (edtRegistro.Text = '') then
               begin
                    TClientDataSet(srcRegistro.DataSet).DisableControls;
                    //
                    TClientDataSet(srcRegistro.DataSet).Filtered := False;
                        TClientDataSet(srcRegistro.DataSet).Filter := '';
                    //
                    TClientDataSet(srcRegistro.DataSet).EnableControls;
                    //
                    Application.ProcessMessages;
                    //
                    TClientDataSet(srcRegistro.DataSet).First
               end
               else // Pesquisar Registro (Filtrar)
                    if (edtRegistro.Text <> '') then
                    begin

                         TClientDataSet(srcRegistro.DataSet).DisableControls;
                         //
                         TClientDataSet(srcRegistro.DataSet).Filtered := False;
                         //
                         if DBGridRegistro.Columns[cbxOpcao.ItemIndex].FieldName = 'idProjeto' then
                              TClientDataSet(srcRegistro.DataSet).Filter := 'idProjeto =' + edtRegistro.Text
                         else
                              TClientDataSet(srcRegistro.DataSet).Filter := 'nomeProjeto LIKE ' + QuotedStr('%' + edtRegistro.Text + '%');
                         //
                         TClientDataSet(srcRegistro.DataSet).Filtered := True;
                         //
                         TClientDataSet(srcRegistro.DataSet).EnableControls;
                         //
                         Application.ProcessMessages;
                         //
                         TClientDataSet(srcRegistro.DataSet).First;
                    end;
                    //
               if (edtRegistro.Text = '%%') then
                    edtRegistro.Text := '';
               //
               if (srcRegistro.State = dsBrowse) then
                    frmMenuPrincipal.PanelTexto.Caption := ' ' + IntToStr(TClientDataSet(srcRegistro.DataSet).RecordCount) + ' registro(s) encontrado(s)...';
          finally
               Refresh;
               //
               frmDados.SplashAviso(False);
               //
               Application.ProcessMessages;
               //
               Bloqueio(True);
               //
               if pnlLocalizar.Enabled then
                    edtRegistro.SetFocus;
          end;

end;

procedure TfrmCadastroProjetos.btnSalvarClick(Sender: TObject);
var
     nomeParcitipante: String;
begin
     try
          Bloqueio(False);
          // Gravar Registro
          try
               TClientDataSet(srcRegistro.DataSet).FieldByName('risco').Value :=  ComboBoxRisco.ItemIndex;
               //
               TClientDataSet(srcRegistro.DataSet).Post;
               //
               if novoRegistro then
               begin
                    frmDados.FDQueryAUX.Close;
                    //
                    frmDados.FDQueryAUX.sql.Clear;
                    frmDados.FDQueryAUX.sql.Add('select MAX(idProjeto) from projeto');
                    //
                    frmDados.FDQueryAUX.Open;
                    //
                    frmDados.FDqrProjetoParticipante.DisableControls;
                    frmDados.FDqrProjetoParticipante.First;
                    //
                    while  (not  frmDados.FDqrProjetoParticipante.Eof) do
                    begin
                        //
                        if  frmDados.FDqrProjetoParticipante.FieldByName('projeto_id').Value = 0 then
                        begin
                            frmDados.FDqrProjetoParticipante.Edit;
                            frmDados.FDqrProjetoParticipante.FieldByName('projeto_id').Value :=    frmDados.FDQueryAUX.Fields[0].AsInteger;
                            frmDados.FDqrProjetoParticipante.Post;
                        end;
                        //
                        frmDados.FDqrProjetoParticipante.Next;
                    end;
                    //
                  frmDados.FDqrProjetoParticipante.EnableControls;
                    //
                    frmDados.FDQueryAUX.Close;
               end;
               //
                if  frmDados.FDqrProjetoParticipante.UpdatesPending then
                begin
                      try
                          frmDados.FDqrProjetoParticipante.Append;
                          frmDados.FDqrProjetoParticipante.ApplyUpdates(-1);
                          frmDados.FDqrProjetoParticipante.UndoLastChange(True);
                      except
                           on E: Exception do
                           begin
                                raise Exception.Create(Name + ' => ' + E.Message);
                                //
                                if (TClientDataSet(srcProjetoParticipante.DataSet).ChangeCount > 0) then
                                     TClientDataSet(srcProjetoParticipante.DataSet).UndoLastChange(True);
                           end
                      end;
                end;
               //
          except
               on E: Exception do
                    raise Exception.Create(Name + ' => ' + E.Message);
          end;
     finally
          //
          Bloqueio(True);
          //
          if (srcRegistro.State = dsBrowse) and pnlLocalizar.Enabled and edtRegistro.Visible then
               edtRegistro.SetFocus;
     end;
end;

procedure TfrmCadastroProjetos.btnSimularClick(Sender: TObject);
var
   riscoProjeto : Integer;
   RetornoIn : IRetornoInvestimento ;
begin
     try
          frmCadastroProjetosInvestimento := TfrmCadastroProjetosInvestimento.Create(Self);
          //
          frmCadastroProjetosInvestimento.valorProjeto :=  TClientDataSet(srcRegistro.DataSet).FieldByName('valorProjeto').AsCurrency;
          //
          frmCadastroProjetosInvestimento.showModal;
     finally
       if frmCadastroProjetosInvestimento.retornarValor then
       begin
            valorInvestimento := StrToCurr( StringReplace(frmCadastroProjetosInvestimento.edtValorInvestido.Text,'.', '', [rfReplaceAll, rfIgnoreCase]));
            riscoProjeto := TClientDataSet(srcRegistro.DataSet).FieldByName('risco').AsInteger;
            valorProjeto := TClientDataSet(srcRegistro.DataSet).FieldByName('valorProjeto').AsCurrency;
             //
            RetornoIn := TRetornoInvestimento.CREATE;
            valorRetornoInvestido  :=  RetornoIn.retornarInvestimento(valorProjeto, valorInvestimento, riscoProjeto);
            //
            lblSimulado.Caption :=  FormatCurr('R$ ###,###,##0.00', valorRetornoInvestido);
            lblValorInvestido.Caption :=  FormatCurr('R$ ###,###,##0.00', valorInvestimento);
       end;
       //
       frmCadastroProjetosInvestimento.free;
       //
     end;
end;

procedure TfrmCadastroProjetos.Button2Click(Sender: TObject);
var contador : integer;
begin
    if EdtNomeParticipantes.Text <> '' then
    begin

       TClientDataSet(srcProjetoParticipante.DataSet).DisableControls;
        //
        TClientDataSet(srcProjetoParticipante.DataSet).First;
        //
        while  (not  TClientDataSet(srcProjetoParticipante.DataSet).Eof) do
        begin
           if TClientDataSet(srcProjetoParticipante.DataSet).FieldByName('nomeParticipante').Value =  EdtNomeParticipantes.Text then
            begin
                //
                TClientDataSet(srcProjetoParticipante.DataSet).EnableControls;
                //
                MessageDlg('Participante já informado, informe o sobrenome.', mtError, [mbOk], 0);
                //
                exit;
            end;
            //
            TClientDataSet(srcProjetoParticipante.DataSet).Next;
        end;
        //
        TClientDataSet(srcProjetoParticipante.DataSet).EnableControls;
        //
        TClientDataSet(srcProjetoParticipante.DataSet).Insert;
        TClientDataSet(srcProjetoParticipante.DataSet).FieldByName('projeto_id').Value := codigoProjeto;
        TClientDataSet(srcProjetoParticipante.DataSet).FieldByName('nomeParticipante').Value := EdtNomeParticipantes.Text;
        TClientDataSet(srcProjetoParticipante.DataSet).Post;
        //
        EdtNomeParticipantes.Clear;
       EdtNomeParticipantes.SetFocus;
    end;

end;

procedure TfrmCadastroProjetos.Button3Click(Sender: TObject);
begin
 if MessageDlg('Deseja remover o Participante?', mtConfirmation,[mbyes,mbno],0)= mryes then
     begin
          try
               Bloqueio(False);
               try
                    TClientDataSet(srcProjetoParticipante.DataSet).Delete;
                    //
               except
                    on E: Exception do
                         raise Exception.Create(Name + ' => ' + E.Message);
               end;
          finally
               //
               Bloqueio(True);
          end;
     end;
end;

procedure TfrmCadastroProjetos.cbxOpcaoChange(Sender: TObject);
var
     Contador: Integer;
begin
     // Modificar Campo de Pesquisa
     for Contador := 0 to DBGridRegistro.Columns.Count - 1 do
          DBGridRegistro.Columns[Contador].Title.Font.Style := [];
     DBGridRegistro.Columns[cbxOpcao.ItemIndex].Title.Font.Style := [fsBold, fsUnderline];
end;

procedure TfrmCadastroProjetos.ckValorClick(Sender: TObject);
begin
if valorRetornoInvestido > 0 then
begin
    if ckValor.Checked then
    lblSimulado.Caption :=  FormatCurr('R$ ###,###,##0.00', valorRetornoInvestido - valorProjeto) else
    lblSimulado.Caption :=  FormatCurr('R$ ###,###,##0.00', valorRetornoInvestido);
end;

end;

procedure TfrmCadastroProjetos.DBGridRegistroDblClick(Sender: TObject);
begin
    if (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0) and (btnEditar.Enabled) then
          btnEditar.Click;
end;

procedure TfrmCadastroProjetos.DBGridRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if (DBGridRegistro.DataSource.DataSet.RecordCount > 0) and not(gdSelected in State) then
     begin
          if ((DBGridRegistro.DataSource.DataSet.RecNo mod 2) = 0) then
               DBGridRegistro.Canvas.Brush.Color := DBGridRegistro.GradientStartColor
          else
               DBGridRegistro.Canvas.Brush.Color := DBGridRegistro.GradientEndColor;
          //
          DBGridRegistro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
end;

procedure TfrmCadastroProjetos.DBGridRegistroTitleClick(Column: TColumn);
var
     Contador: Integer;
     Agregado: Boolean;
begin
     //
     // Modificar Campo da Pesquisa
     if (TClientDataSet(srcRegistro.DataSet).FieldByName(Column.FieldName).FieldKind = fkData) then
     begin
          for Contador := 0 to DBGridRegistro.Columns.Count - 1 do
               DBGridRegistro.Columns[Contador].Title.Font.Style := [];
          Column.Title.Font.Style := [fsBold, fsUnderline];
          cbxOpcao.ItemIndex := Column.Index;
     end;
     //

end;

procedure TfrmCadastroProjetos.EdtNomeParticipantesKeyPress(Sender: TObject;
  var Key: Char);
begin
  // [ENTER] => [TAB]
     if (Key = #13) then
     begin
          Button2.Click;
          Key := #0;
     end;
end;

procedure TfrmCadastroProjetos.edtRegistroKeyPress(Sender: TObject;
  var Key: Char);
begin
  // [ENTER] => [TAB]
     if (Key = #13) then
     begin
          btnLocalizar.Click;
          Key := #0;
     end;
end;

procedure TfrmCadastroProjetos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TClientDataSet(srcRegistro.DataSet).Close;
    frmDados.FDqrProjetoParticipante.close;
    //
    frmMenuPrincipal.lblTitle.caption := frmMenuPrincipal.nomeMenu;
    frmMenuPrincipal.PanelTexto.Caption :=   frmMenuPrincipal.lblTitle.caption;
end;

procedure TfrmCadastroProjetos.FormCreate(Sender: TObject);
var
     Contador: Integer;
begin
   try
          inherited;
          //
          btnIncluir.Visible := False;
          btnExcluir.Visible := False;
          btnEditar.Visible := False;
          btnSalvar.Visible := False;
          btnCancelar.Visible := False;
          btnExportar.Visible := False;
          //
     finally
          // Preparar pesquisa
          tshListagem.TabVisible := True;
          tshDados.TabVisible := False;
          ctrRegistro.ActivePage := tshListagem;
          //
          for Contador := 0 to DBGridRegistro.Columns.Count - 1 do
               cbxOpcao.Items.Add(DBGridRegistro.Columns[Contador].Title.Caption);
          //
          cbxOpcao.ItemIndex := 1;
          //
          DBGridRegistro.Columns[cbxOpcao.ItemIndex].Title.Font.Style := [fsBold, fsUnderline];
          //
          edtRegistro.Text := '';
     end;
end;

procedure TfrmCadastroProjetos.FormResize(Sender: TObject);
 var
     Contador: Integer;
     Tamanho: Integer;
begin
     Tamanho := DBGridRegistro.Width - (25) ;
     //
     for Contador := 0 to DBGridRegistro.Columns.Count - 1 do
          Tamanho := Tamanho - DBGridRegistro.Columns[Contador].Width;
     //
     DBGridRegistro.Columns[DBGridRegistro.Columns.Count - 1].Width := DBGridRegistro.Columns[DBGridRegistro.Columns.Count - 1].Width + Tamanho;
     //
     btnLocalizar.Left := (pnlLocalizar.Width - btnLocalizar.Width - 10) - SpeedButton1.Width;
     //
     SpeedButton1.Left :=  (pnlLocalizar.Width - btnLocalizar.Width );
     //
     edtRegistro.Width := (btnLocalizar.Left - edtRegistro.Left - 10);
end;

procedure TfrmCadastroProjetos.FormShow(Sender: TObject);
begin
    TClientDataSet(srcRegistro.DataSet).Close;
    TClientDataSet(srcRegistro.DataSet).Open;
    //
    TClientDataSet(srcProjetoParticipante.DataSet).Close;
    TClientDataSet(srcProjetoParticipante.DataSet).Open;
    //
    novoRegistro := False;
end;

procedure TfrmCadastroProjetos.SpeedButton1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmCadastroProjetos.srcRegistroDataChange(Sender: TObject; Field: TField);
var
 RetornoIn : IRetornoInvestimento ;
begin
  // Verificar Status
     btnIncluir.Visible := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).Active);
     btnExcluir.Visible := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
     btnEditar.Visible := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
     btnSalvar.Visible := (srcRegistro.State = dsInsert) or (srcRegistro.State = dsEdit);
     btnCancelar.Visible := (srcRegistro.State = dsInsert) or (srcRegistro.State = dsEdit);
     btnExportar.Visible := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
     //
     lblDescricaoRisco.Visible :=      btnEditar.Visible;
     //
      valorRetornoInvestido := 0;
      valorProjeto := 0;
      valorInvestimento := 0;
     //
     tshDados.TabVisible := (srcRegistro.State = dsInsert) or (srcRegistro.State = dsEdit);
     tshListagem.TabVisible := (not(tshDados.TabVisible));
     btnSimular.Visible := btnEditar.Visible;
     //
     edtRegistro.Enabled := (not(tshDados.TabVisible));
     cbxOpcao.Enabled := (not(tshDados.TabVisible));
     btnLocalizar.Enabled := (not(tshDados.TabVisible));
     //
     lblSimulado.Caption := FormatCurr('R$ ###,###,##0.00',0);
     //
     if (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0) then
     begin
          RetornoIn := TRetornoInvestimento.CREATE;
          //
          lblDescricaoRisco.Caption := RetornoIn.retornarDescricaoRisco(TClientDataSet(srcRegistro.DataSet).FieldByName('risco').Value,lblDescricaoRisco);
          //
          lblvalorProjeto.Caption := FormatCurr('R$ ###,###,##0.00', TClientDataSet(srcRegistro.DataSet).FieldByName('valorProjeto').AsCurrency);
     end;
     //
     case srcRegistro.State of
          dsBrowse:
               frmMenuPrincipal.PanelTexto.Caption := ' ' + IntToStr(TClientDataSet(srcRegistro.DataSet).RecordCount) + ' registro(s) encontrado(s)...';
          dsInsert:
               frmMenuPrincipal.PanelTexto.Caption := ' Registro em modo de inserção...';
          dsEdit:
               frmMenuPrincipal.PanelTexto.Caption := ' Registro em modo de edição...';
     else
          frmMenuPrincipal.PanelTexto.Caption := Hint
     end;
     //
     if pnlLocalizar.Enabled then
     begin
          if (srcRegistro.State = dsBrowse) and btnLocalizar.Enabled then
               edtRegistro.SetFocus;
     end;
     //
     if pnlDados.Enabled then
     begin
          if (TClientDataSet(srcRegistro.DataSet).RecordCount > 0) and DBGridRegistro.CanFocus then
               DBGridRegistro.SetFocus;
     end;
end;

end.
