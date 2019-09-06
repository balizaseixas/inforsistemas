object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro Endere'#231'os'
  ClientHeight = 511
  ClientWidth = 765
  Color = clWhite
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 49
    Align = alTop
    Caption = 'CADASTRO DE CLIENTES'
    Color = 8421440
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 766
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 55
    Width = 754
    Height = 448
    ActivePage = TabDados
    TabOrder = 1
    OnChange = PageControl1Change
    object TabDados: TTabSheet
      Caption = 'Principais dados'
      ExplicitWidth = 742
      ExplicitHeight = 377
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 65
        Height = 16
        Caption = 'Id_Cliente'
        FocusControl = DbeId
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 92
        Top = 16
        Width = 35
        Height = 16
        Caption = 'Nome'
        FocusControl = DbeNome
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 70
        Height = 16
        Caption = 'Identidade'
        FocusControl = DbeIdentidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 282
        Top = 64
        Width = 21
        Height = 16
        Caption = 'Cpf'
        FocusControl = DbeCpf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 116
        Width = 55
        Height = 16
        Caption = 'Telefone'
        FocusControl = DbeTel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 204
        Top = 116
        Width = 32
        Height = 16
        Caption = 'Email'
        FocusControl = DbeEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 178
        Width = 262
        Height = 16
        Caption = 'Abaixo listagem de Clientes cadastrados'
        FocusControl = DbeTel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DbeId: TDBEdit
        Left = 16
        Top = 32
        Width = 70
        Height = 22
        DataField = 'Id_Cliente'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DbeNome: TDBEdit
        Left = 92
        Top = 32
        Width = 613
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DbeIdentidade: TDBEdit
        Left = 16
        Top = 80
        Width = 260
        Height = 22
        DataField = 'Identidade'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DbeCpf: TDBEdit
        Left = 282
        Top = 80
        Width = 182
        Height = 22
        DataField = 'Cpf'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnExit = DbeCpfExit
      end
      object DbeTel: TDBEdit
        Left = 16
        Top = 132
        Width = 182
        Height = 22
        DataField = 'Telefone'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DbeEmail: TDBEdit
        Left = 204
        Top = 132
        Width = 500
        Height = 22
        DataField = 'Email'
        DataSource = DsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DbClientes: TDBGrid
        Left = 16
        Top = 200
        Width = 689
        Height = 137
        DataSource = DsClientes
        Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DbClientesCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Id_Cliente'
            Title.Color = 4210688
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Color = 4210688
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Identidade'
            Title.Color = 4210688
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cpf'
            Title.Color = 4210688
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Title.Color = 4210688
            Visible = True
          end>
      end
      object PnlBotoes: TPanel
        Left = 0
        Top = 377
        Width = 746
        Height = 43
        Align = alBottom
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 436
        ExplicitWidth = 766
        object BtnIncluir: TButton
          Left = 9
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BtnIncluirClick
        end
        object btnSalvar: TButton
          Left = 202
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Salvar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnSalvarClick
        end
        object btnApagar: TButton
          Left = 294
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Apagar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnApagarClick
        end
        object BtnCancelar: TButton
          Left = 387
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Cancelar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = BtnCancelarClick
        end
        object btnEnviarEmail: TButton
          Left = 481
          Top = 6
          Width = 129
          Height = 31
          Caption = '&Enviar Email'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnEnviarEmailClick
        end
        object btnFechar: TButton
          Left = 616
          Top = 6
          Width = 119
          Height = 31
          Caption = '&Fechar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnFecharClick
        end
        object btnAlterar: TButton
          Left = 101
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Alterar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnAlterarClick
        end
      end
    end
    object TabEndereco: TTabSheet
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      OnEnter = TabEnderecoEnter
      ExplicitLeft = 0
      object Label9: TLabel
        Left = 16
        Top = 23
        Width = 24
        Height = 16
        Caption = 'Cep'
        FocusControl = DbeCep
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 656
        Top = 23
        Width = 49
        Height = 16
        Caption = 'Numero'
        FocusControl = DbeNumero
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 110
        Width = 87
        Height = 16
        Caption = 'Complemento'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 66
        Width = 39
        Height = 16
        Caption = 'Bairro'
        FocusControl = DbeBairro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 282
        Top = 66
        Width = 43
        Height = 16
        Caption = 'Cidade'
        FocusControl = DbeCidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 673
        Top = 66
        Width = 44
        Height = 16
        Caption = 'Estado'
        FocusControl = DBEEstado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 152
        Top = 23
        Width = 75
        Height = 16
        Caption = 'Logradouro'
        FocusControl = DbeLagradouro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 202
        Width = 268
        Height = 16
        Caption = 'Abaixo listagem dos Endere'#231'os do Cliente'
        FocusControl = DbeTel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 282
        Top = 110
        Width = 26
        Height = 16
        Caption = 'Pa'#237's'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DbeCep: TDBEdit
        Left = 16
        Top = 38
        Width = 130
        Height = 22
        DataField = 'Cep'
        DataSource = DsEnderecos
        TabOrder = 1
        OnExit = DbeCepExit
      end
      object DbeNumero: TDBEdit
        Left = 648
        Top = 38
        Width = 69
        Height = 22
        DataField = 'Numero'
        DataSource = DsEnderecos
        TabOrder = 2
      end
      object DBEdit11: TDBEdit
        Left = 16
        Top = 126
        Width = 260
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = DsEnderecos
        TabOrder = 3
      end
      object DbeBairro: TDBEdit
        Left = 16
        Top = 82
        Width = 260
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = DsEnderecos
        TabOrder = 4
      end
      object DbeCidade: TDBEdit
        Left = 282
        Top = 82
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = DsEnderecos
        TabOrder = 5
      end
      object DBEEstado: TDBEdit
        Left = 673
        Top = 82
        Width = 44
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Estado'
        DataSource = DsEnderecos
        TabOrder = 6
      end
      object DbeLagradouro: TDBEdit
        Left = 152
        Top = 38
        Width = 490
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Logradouro'
        DataSource = DsEnderecos
        TabOrder = 7
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 224
        Width = 713
        Height = 153
        DataSource = DsEnderecos
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Cep'
            Title.Color = 16384
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Logradouro'
            Title.Color = 16384
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Title.Color = 16384
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Title.Color = 16384
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Title.Color = 16384
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Title.Color = 16384
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estado'
            Title.Color = 16384
            Visible = True
          end>
      end
      object PnlBotoesEnd: TPanel
        Left = 16
        Top = 156
        Width = 423
        Height = 40
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnIncluirEnd: TButton
          Left = 10
          Top = 5
          Width = 86
          Height = 31
          Caption = '&Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnIncluirEndClick
        end
        object btnSalvarEnd: TButton
          Left = 194
          Top = 6
          Width = 86
          Height = 31
          Caption = '&Salvar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnSalvarEndClick
        end
        object BtnAlterarEnd: TButton
          Left = 102
          Top = 5
          Width = 86
          Height = 31
          Caption = '&Alterar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BtnAlterarEndClick
        end
        object btnCancelarEnd: TButton
          Left = 286
          Top = 5
          Width = 86
          Height = 31
          Caption = '&Cancelar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnCancelarEndClick
        end
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 401
        Width = 746
        Height = 19
        Panels = <
          item
            Width = 50
          end>
        ExplicitLeft = 96
        ExplicitTop = 352
        ExplicitWidth = 0
      end
      object DBEdit1: TDBEdit
        Left = 282
        Top = 126
        Width = 260
        Height = 22
        CharCase = ecUpperCase
        DataField = 'Pais'
        DataSource = DsEnderecos
        TabOrder = 10
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'E-mail'
      ImageIndex = 2
      ExplicitLeft = 0
      object Bevel1: TBevel
        Left = 6
        Top = 22
        Width = 737
        Height = 106
        Shape = bsFrame
      end
      object Label16: TLabel
        Left = 15
        Top = 34
        Width = 179
        Height = 15
        Caption = 'Servidor E-mail - servidor SMTP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 492
        Top = 34
        Width = 67
        Height = 15
        Caption = 'Porta SMTP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 15
        Top = 77
        Width = 73
        Height = 15
        Caption = 'Login (email)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 269
        Top = 77
        Width = 36
        Height = 15
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 2
        Top = 5
        Width = 253
        Height = 16
        Caption = '  Configura'#231#245'es do Servidor de email :  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtervidor: TEdit
        Left = 15
        Top = 50
        Width = 473
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'smtp-mail.outlook.com'
      end
      object edtporta: TEdit
        Left = 492
        Top = 50
        Width = 73
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        Text = '587'
      end
      object edtlogin: TEdit
        Left = 15
        Top = 93
        Width = 250
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'balizaseixas@hotmail.com'
      end
      object edtsenha: TEdit
        Left = 269
        Top = 93
        Width = 73
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
        Text = '123456'
      end
      object chkRequerAutenticacao: TCheckBox
        Left = 350
        Top = 96
        Width = 153
        Height = 17
        Caption = 'Requer autentica'#231#227'o'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object checkSSL: TCheckBox
        Left = 510
        Top = 96
        Width = 217
        Height = 17
        Caption = 'Requer autentica'#231#227'o SSL'
        TabOrder = 5
      end
      object BtnEmail: TButton
        Left = 154
        Top = 150
        Width = 129
        Height = 31
        Caption = '&Enviar Email'
        TabOrder = 6
        OnClick = btnEnviarEmailClick
      end
      object BtnXml: TButton
        Left = 8
        Top = 150
        Width = 129
        Height = 31
        Caption = '&Criar Xml'
        TabOrder = 7
        OnClick = BtnXmlClick
      end
    end
  end
  object TblClientes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Id_Cliente'
    Params = <>
    Left = 632
    Top = 24
    object TblClientesId_Cliente: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id_Cliente'
      KeyFields = 'Id_Cliente'
      Required = True
    end
    object TblClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TblClientesIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object TblClientesCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TblClientesTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)00000-0000;1;_'
      Size = 14
    end
    object TblClientesEmail: TStringField
      FieldName = 'Email'
      Size = 150
    end
  end
  object DsClientes: TDataSource
    AutoEdit = False
    DataSet = TblClientes
    Left = 632
    Top = 72
  end
  object TblEndereco: TClientDataSet
    Aggregates = <>
    MasterSource = DsClientes
    PacketRecords = 0
    Params = <>
    Left = 704
    Top = 24
    object TblEnderecoId_Endereco: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id_Endereco'
      KeyFields = 'Id_Endereco'
    end
    object TblEnderecoCep: TStringField
      FieldName = 'Cep'
      EditMask = '99999-999'
      Size = 10
    end
    object TblEnderecoNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TblEnderecoComplemento: TStringField
      FieldName = 'Complemento'
      Size = 60
    end
    object TblEnderecoBairro: TStringField
      FieldName = 'Bairro'
    end
    object TblEnderecoCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object TblEnderecoEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object TblEnderecoLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 200
    end
    object TblEnderecoId_Cliente: TIntegerField
      FieldName = 'Id_Cliente'
    end
    object TblEnderecoPais: TStringField
      FieldName = 'Pais'
    end
  end
  object DsEnderecos: TDataSource
    AutoEdit = False
    DataSet = TblEndereco
    Left = 704
    Top = 72
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br/ws/37560185/json/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 536
    Top = 216
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 616
    Top = 216
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 696
    Top = 216
  end
end
