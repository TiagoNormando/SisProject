unit untMenuPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.Imaging.PngImage,
  Vcl.ComCtrls,
  Vcl.ActnList, Vcl.Menus;

type
  TfrmMenuPrincipal = class(TForm)
    pnlToolbar: TPanel;
    pnlShowFrame: TPanel;
    SV: TSplitView;
    imlIcons: TImageList;
    imgMenu: TImage;
    ActionListMenu: TActionList;
    actCadastro: TAction;
    actRelatorio: TAction;
    lblTitle: TLabel;
    StatusBar1: TStatusBar;
    ColorDlgMenu: TColorDialog;
    Image1: TImage;
    actConfiguracao: TAction;
    catRelatorio: TCategoryButtons;
    catMenuItems: TCategoryButtons;
    catcadastro: TCategoryButtons;
    ActRClientes: TAction;
    ActRProjeto: TAction;
    ActCProjeto: TAction;
    ActCClientes: TAction;
    PanelTexto: TPanel;
    procedure SVClosed(Sender: TObject);
    procedure SVOpened(Sender: TObject);
    procedure SVOpening(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
    procedure imgMenuClick(Sender: TObject);
    procedure actConfiguracaoExecute(Sender: TObject);
    procedure actRelatorioExecute(Sender: TObject);
    procedure actCadastroExecute(Sender: TObject);
    procedure SVMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ChamaSubMenu(Menu,SubMenuBt: TCategoryButtons ; Rect: TRect ) ;
    procedure ActCProjetoExecute(Sender: TObject);
    procedure ActCClientesExecute(Sender: TObject);

  private
     { Private declarations }
     rec : TRect ;
     FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;


implementation


{$R *.dfm}

uses untCadastroProjetos;

// procedure que irei utilizar para da show nos forms.
procedure TfrmMenuPrincipal.LoadForm(AClass: TFormClass);
begin
  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.Close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;
  //
  Self.FFormActive := AClass.Create(nil);
  Self.FFormActive.Parent := Self.pnlShowFrame;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;
  //
  Self.FFormActive.Top := 0;
  Self.FFormActive.Left := 0;
  Self.FFormActive.Align := TAlign.alClient;
  //
  Self.FFormActive.Show;
  //
end;


procedure TfrmMenuPrincipal.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TfrmMenuPrincipal.SVClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if SV.CloseStyle = svcCompact then
    catMenuItems.Width := SV.CompactWidth;
end;


procedure TfrmMenuPrincipal.SVOpened(Sender: TObject);
begin
   // muda o tramanho dos submenus na animação quando abrir  o TSplitView
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width         := SV.OpenedWidth;
end;

procedure TfrmMenuPrincipal.SVOpening(Sender: TObject);
begin
  // muda o tramanho dos submenus na animação
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;


procedure TfrmMenuPrincipal.ActCClientesExecute(Sender: TObject);
begin
 //Self.LoadForm(TfCadCliente);
end;

procedure TfrmMenuPrincipal.actConfiguracaoExecute(Sender: TObject);
begin
if ColorDlgMenu.Execute then
   Begin
     SV.Color         := ColorDlgMenu.Color ;
     pnlToolbar.Color := ColorDlgMenu.Color ;
   End;
end;


procedure TfrmMenuPrincipal.ActCProjetoExecute(Sender: TObject);
begin

  Self.LoadForm(TfrmCadastroProjetos);
end;

Procedure TfrmMenuPrincipal.actRelatorioExecute(Sender: TObject);
begin
 ChamaSubMenu( catMenuItems,catRelatorio,rec ) ;
end;

procedure TfrmMenuPrincipal.actCadastroExecute(Sender: TObject);
begin
   ChamaSubMenu( catMenuItems,catcadastro,rec ) ;
end;

procedure TfrmMenuPrincipal.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
 catMenuItems.Categories[0].Collapsed := true;
end;


procedure TfrmMenuPrincipal.ChamaSubMenu(Menu, SubMenuBt: TCategoryButtons;  Rect: TRect);
var i:integer ;
begin

  // usar a Tag do SubMenu para Fechar quando abrir um Outro SubMenu

  for I:= 0 to ComponentCount -1 do
      begin
        if ( Components[I] is TCategoryButtons )  then
           begin
              If ( TCategoryButtons(Components[i]).Tag = 1 ) then
                   TCategoryButtons(Components[i]).Visible := false  ;
           end;
      end;

  Rect := Menu.Categories.CategoryButtons.GetButtonRect(Menu.Categories.CategoryButtons.SelectedItem) ;

  SubMenuBt.Left    := Menu.Categories[0].Items[0].CategoryButtons.width -
                       Menu.Categories[0].Items[0].CategoryButtons.width ;

  SubMenuBt.Top     := (rect.Top - 20);
  SubMenuBt.Visible := true ;

  SubMenuBt.Show ;

end;

procedure TfrmMenuPrincipal.SVMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 catRelatorio.Visible := false;
 catcadastro.Visible    := false;

end;

end.
