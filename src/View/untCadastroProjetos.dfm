object frmCadastroProjetos: TfrmCadastroProjetos
  Left = 0
  Top = 0
  Caption = 'frmCadastroProjetos'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 375
    Top = 25
    Width = 40
    Height = 14
    Caption = 'R$: 0.00'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label11: TLabel
    Left = 259
    Top = 25
    Width = 110
    Height = 14
    Caption = 'VALOR DO PROJETO:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 383
    Top = 33
    Width = 40
    Height = 14
    Caption = 'R$: 0.00'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label13: TLabel
    Left = 267
    Top = 33
    Width = 110
    Height = 14
    Caption = 'VALOR DO PROJETO:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object pnlForm: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object pnlLocalizar: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 55
      Align = alTop
      Color = 4276545
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object lblLocalizar: TLabel
        Left = 184
        Top = 5
        Width = 111
        Height = 14
        Caption = 'Texto para pesquisa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblCampo: TLabel
        Left = 8
        Top = 5
        Width = 110
        Height = 14
        Caption = 'Campo de pesquisa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 626
        Top = 4
        Width = 106
        Height = 45
        Caption = 'FECHAR'
        OnClick = SpeedButton1Click
      end
      object cbxOpcao: TComboBox
        Left = 7
        Top = 21
        Width = 170
        Height = 22
        Cursor = crHandPoint
        Hint = 'Campo de pesquisa'
        Style = csDropDownList
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnChange = cbxOpcaoChange
      end
      object edtRegistro: TMaskEdit
        Left = 184
        Top = 21
        Width = 311
        Height = 22
        Hint = 'Texto para pesquisa...'
        CharCase = ecUpperCase
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnKeyPress = edtRegistroKeyPress
      end
      object btnLocalizar: TButton
        Left = 510
        Top = 4
        Width = 110
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Localizar'
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 6
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = btnLocalizarClick
      end
    end
    object pnlBarra: TPanel
      Left = 1
      Top = 550
      Width = 798
      Height = 49
      Align = alBottom
      Color = 4276545
      ParentBackground = False
      TabOrder = 1
      object btnIncluir: TButton
        Left = 4
        Top = 2
        Width = 90
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Incluir'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 0
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = btnIncluirClick
      end
      object btnExcluir: TButton
        Left = 100
        Top = 2
        Width = 90
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Excluir'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 1
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = btnExcluirClick
      end
      object btnEditar: TButton
        Left = 196
        Top = 2
        Width = 90
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Editar'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 2
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = btnEditarClick
      end
      object btnSalvar: TButton
        Left = 102
        Top = 2
        Width = 90
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Salvar'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 3
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnClick = btnSalvarClick
      end
      object btnCancelar: TButton
        Left = 197
        Top = 2
        Width = 90
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Cancelar'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 4
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = btnCancelarClick
      end
      object btnExportar: TButton
        Left = 312
        Top = 2
        Width = 110
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'Exportar'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 7
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = btnExportarClick
      end
      object btnSimular: TButton
        Left = 550
        Top = 2
        Width = 110
        Height = 45
        Cursor = crHandPoint
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'SIMULAR RETORNO'
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 0
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        OnClick = btnSimularClick
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 56
      Width = 798
      Height = 494
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object ctrRegistro: TPageControl
        Left = 4
        Top = 4
        Width = 790
        Height = 486
        Cursor = crHandPoint
        ActivePage = tshDados
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = False
        object tshListagem: TTabSheet
          Cursor = crHandPoint
          Hint = 'Listagem dos Registros'
          Caption = 'Listagem dos Registros'
          ParentShowHint = False
          ShowHint = True
          object DBGridRegistro: TDBGrid
            Left = 0
            Top = 0
            Width = 782
            Height = 408
            Cursor = crHandPoint
            Hint = 'Listagem dos Registros'
            ParentCustomHint = False
            Align = alClient
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DataSource = srcRegistro
            GradientEndColor = clBtnFace
            GradientStartColor = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDrawColumnCell = DBGridRegistroDrawColumnCell
            OnDblClick = DBGridRegistroDblClick
            OnTitleClick = DBGridRegistroTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'idProjeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Title.Caption = 'C'#243'digo'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomeProjeto'
                Title.Caption = 'Nome do Projeto'
                Width = 623
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 408
            Width = 782
            Height = 49
            Align = alBottom
            Color = 4276545
            ParentBackground = False
            TabOrder = 1
            object Label7: TLabel
              Left = 161
              Top = 5
              Width = 33
              Height = 14
              Caption = 'RISCO'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblDescricaoRisco: TLabel
              Left = 154
              Top = 22
              Width = 65
              Height = 24
              Caption = 'MEDIO'
              Color = clLime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clLime
              Font.Height = -20
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Visible = False
            end
            object Label8: TLabel
              Left = 6
              Top = 5
              Width = 107
              Height = 14
              Caption = 'VALOR DO PROJETO'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblvalorProjeto: TLabel
              Left = 6
              Top = 25
              Width = 62
              Height = 19
              Caption = 'R$: 0.00'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblSimulado: TLabel
              Left = 423
              Top = 26
              Width = 62
              Height = 19
              Caption = 'R$: 0.00'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label15: TLabel
              Left = 423
              Top = 5
              Width = 110
              Height = 14
              Caption = 'RETORNO SIMULADO'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label9: TLabel
              Left = 233
              Top = 5
              Width = 119
              Height = 14
              Caption = 'VALOR INVESTIMENTO'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lblValorInvestido: TLabel
              Left = 233
              Top = 26
              Width = 62
              Height = 19
              Caption = 'R$: 0.00'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label16: TLabel
              Left = 569
              Top = 5
              Width = 166
              Height = 14
              Caption = 'RETIRAR O VALOR DO PROJETO'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object ckValor: TCheckBox
              Left = 552
              Top = 2
              Width = 17
              Height = 17
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              OnClick = ckValorClick
            end
          end
        end
        object tshDados: TTabSheet
          Cursor = crHandPoint
          Hint = 'Dados do Registro'
          Caption = 'Dados do Registro'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          object lblCodigo: TLabel
            Left = 16
            Top = 16
            Width = 39
            Height = 14
            Caption = 'C'#243'digo'
            FocusControl = DBEditCodigo
          end
          object Label2: TLabel
            Left = 100
            Top = 16
            Width = 92
            Height = 14
            Caption = 'Nome do Projeto'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 100
            Top = 60
            Width = 29
            Height = 14
            Caption = 'In'#237'cio'
          end
          object Label5: TLabel
            Left = 380
            Top = 60
            Width = 28
            Height = 14
            Caption = 'Valor'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 100
            Top = 112
            Width = 90
            Height = 14
            Caption = 'Risco do Projeto'
          end
          object Label1: TLabel
            Left = 240
            Top = 60
            Width = 20
            Height = 14
            Caption = 'Fim'
          end
          object Label4: TLabel
            Left = 240
            Top = 112
            Width = 125
            Height = 14
            Caption = 'Participante do Projeto'
          end
          object DBEditCodigo: TDBEdit
            Left = 16
            Top = 32
            Width = 81
            Height = 22
            Cursor = crHandPoint
            Hint = 'c'#243'digo'
            TabStop = False
            CharCase = ecUpperCase
            Color = clSilver
            Ctl3D = True
            DataField = 'idProjeto'
            DataSource = srcRegistro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            StyleElements = []
          end
          object DBEdit2: TDBEdit
            Left = 100
            Top = 32
            Width = 445
            Height = 22
            CharCase = ecUpperCase
            DataField = 'nomeProjeto'
            DataSource = srcRegistro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 380
            Top = 75
            Width = 165
            Height = 22
            CharCase = ecUpperCase
            DataField = 'valorProjeto'
            DataSource = srcRegistro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit1: TDBEdit
            Left = 100
            Top = 75
            Width = 134
            Height = 22
            CharCase = ecUpperCase
            DataField = 'dataInicio'
            DataSource = srcRegistro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 240
            Top = 75
            Width = 134
            Height = 22
            CharCase = ecUpperCase
            DataField = 'dataFim'
            DataSource = srcRegistro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object EdtNomeParticipantes: TEdit
            Left = 241
            Top = 127
            Width = 257
            Height = 22
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnKeyPress = EdtNomeParticipantesKeyPress
          end
          object Button2: TButton
            Left = 502
            Top = 125
            Width = 42
            Height = 25
            Caption = 'ADD'
            TabOrder = 7
            OnClick = Button2Click
          end
          object ComboBoxRisco: TComboBoxEx
            Left = 100
            Top = 127
            Width = 134
            Height = 23
            ItemsEx = <
              item
                Caption = 'BAIXO'
              end
              item
                Caption = 'M'#201'DIO'
              end
              item
                Caption = 'ALTO'
              end>
            TabOrder = 5
          end
          object GroupBox1: TGroupBox
            Left = 100
            Top = 166
            Width = 444
            Height = 153
            Caption = 'Listagem dos Participantes'
            TabOrder = 8
            object DBGrid1: TDBGrid
              Left = 2
              Top = 16
              Width = 440
              Height = 135
              Cursor = crHandPoint
              Hint = 'Listagem dos Registros'
              ParentCustomHint = False
              Align = alClient
              BiDiMode = bdLeftToRight
              Ctl3D = True
              DataSource = srcProjetoParticipante
              GradientEndColor = clBtnFace
              GradientStartColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnDrawColumnCell = DBGridRegistroDrawColumnCell
              OnDblClick = DBGridRegistroDblClick
              OnTitleClick = DBGridRegistroTitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'nomeParticipante'
                  Title.Caption = 'Nome'
                  Width = 400
                  Visible = True
                end>
            end
          end
          object Button3: TButton
            Left = 272
            Top = 325
            Width = 109
            Height = 45
            Cursor = crHandPoint
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Caption = 'Excluir Participante'
            DoubleBuffered = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ImageIndex = 1
            ParentBiDiMode = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            OnClick = Button3Click
          end
        end
      end
    end
  end
  object srcRegistro: TDataSource
    AutoEdit = False
    DataSet = frmDados.FDTableProjeto
    OnDataChange = srcRegistroDataChange
    Left = 16
    Top = 152
  end
  object srcProjetoParticipante: TDataSource
    AutoEdit = False
    DataSet = frmDados.FDqrProjetoParticipante
    Left = 16
    Top = 208
  end
end
