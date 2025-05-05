inherited ViewPessoasCadastrar: TViewPessoasCadastrar
  Caption = 'Pessoas Cadastrar/Alterar'
  ClientHeight = 401
  ClientWidth = 884
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 900
  ExplicitHeight = 440
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 884
    Height = 351
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 884
    ExplicitHeight = 351
    object lblCodigo: TLabel
      Left = 24
      Top = 24
      Width = 46
      Height = 15
      Caption = 'C'#243'digo *'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 90
      Top = 24
      Width = 115
      Height = 15
      Caption = 'Nome/Raz'#227'o Social *'
      FocusControl = edtNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFantasia: TLabel
      Left = 466
      Top = 24
      Width = 52
      Height = 15
      Caption = 'Fantasia *'
      FocusControl = edtFantasia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCep: TLabel
      Left = 24
      Top = 92
      Width = 21
      Height = 15
      Caption = 'CEP'
      FocusControl = edtCEP
    end
    object lblCidade: TLabel
      Left = 103
      Top = 92
      Width = 110
      Height = 15
      Caption = 'C'#243'digo Cidade (F8) *'
      FocusControl = edtIdCidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEndereco: TLabel
      Left = 466
      Top = 92
      Width = 49
      Height = 15
      Caption = 'Endere'#231'o'
      FocusControl = edtEndereco
    end
    object lblNumero: TLabel
      Left = 759
      Top = 92
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
      FocusControl = EdtNumero
    end
    object lblBairro: TLabel
      Left = 24
      Top = 136
      Width = 31
      Height = 15
      Caption = 'Bairro'
      FocusControl = edtBairro
    end
    object lblComplemento: TLabel
      Left = 466
      Top = 137
      Width = 77
      Height = 15
      Caption = 'Complemento'
      FocusControl = edtComplemento
    end
    object lblNascimento: TLabel
      Left = 759
      Top = 137
      Width = 64
      Height = 15
      Caption = 'Nascimento'
      FocusControl = edtNascimento
    end
    object lblTelefone: TLabel
      Left = 24
      Top = 184
      Width = 45
      Height = 15
      Caption = 'Telefone'
      FocusControl = edtTelefone
    end
    object lblCelular: TLabel
      Left = 245
      Top = 184
      Width = 37
      Height = 15
      Caption = 'Celular'
      FocusControl = edtCelular
    end
    object lblEmail: TLabel
      Left = 466
      Top = 184
      Width = 34
      Height = 15
      Caption = 'E-mail'
      FocusControl = edtEmail
    end
    object lblCPF: TLabel
      Left = 245
      Top = 232
      Width = 21
      Height = 15
      Caption = 'CPF'
      FocusControl = edtCPF
    end
    object lblRG: TLabel
      Left = 401
      Top = 232
      Width = 15
      Height = 15
      Caption = 'RG'
      FocusControl = edtRG
    end
    object lblCNPJ: TLabel
      Left = 527
      Top = 232
      Width = 27
      Height = 15
      Caption = 'CNPJ'
      FocusControl = edtCNPJ
    end
    object lblIE: TLabel
      Left = 759
      Top = 232
      Width = 9
      Height = 15
      Caption = 'IE'
      FocusControl = edtIE
    end
    object lblCadastro: TLabel
      Left = 24
      Top = 277
      Width = 47
      Height = 15
      Caption = 'Cadastro'
      FocusControl = edtCadastro
    end
    object edtCodigo: TDBEdit
      Left = 24
      Top = 40
      Width = 60
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TDBEdit
      Left = 90
      Top = 40
      Width = 370
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource
      TabOrder = 1
    end
    object edtFantasia: TDBEdit
      Left = 466
      Top = 40
      Width = 370
      Height = 23
      DataField = 'FANTASIA'
      DataSource = DataSource
      TabOrder = 2
    end
    object chk_ativo: TDBCheckBox
      Left = 24
      Top = 69
      Width = 60
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = DataSource
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object chk_cliente: TDBCheckBox
      Left = 90
      Top = 69
      Width = 71
      Height = 17
      Caption = 'Cliente'
      DataField = 'CLIENTE'
      DataSource = DataSource
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object chk_fornecedor: TDBCheckBox
      Left = 160
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Fornecedor'
      DataField = 'FORNECEDOR'
      DataSource = DataSource
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edtCEP: TDBEdit
      Left = 24
      Top = 108
      Width = 73
      Height = 23
      DataField = 'CEP'
      DataSource = DataSource
      TabOrder = 6
    end
    object edtIdCidade: TDBEdit
      Left = 103
      Top = 108
      Width = 73
      Height = 23
      DataField = 'ID_CIDADE'
      DataSource = DataSource
      TabOrder = 7
      OnExit = edtIdCidadeExit
      OnKeyDown = edtIdCidadeKeyDown
    end
    object edtCidade: TEdit
      Left = 182
      Top = 108
      Width = 278
      Height = 23
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtEndereco: TDBEdit
      Left = 466
      Top = 108
      Width = 287
      Height = 23
      DataField = 'ENDERECO'
      DataSource = DataSource
      TabOrder = 9
    end
    object EdtNumero: TDBEdit
      Left = 759
      Top = 108
      Width = 77
      Height = 23
      DataField = 'NUMERO'
      DataSource = DataSource
      TabOrder = 10
    end
    object edtBairro: TDBEdit
      Left = 24
      Top = 152
      Width = 436
      Height = 23
      DataField = 'BAIRRO'
      DataSource = DataSource
      TabOrder = 11
    end
    object edtComplemento: TDBEdit
      Left = 466
      Top = 153
      Width = 287
      Height = 23
      DataField = 'COMPLEMENTO'
      DataSource = DataSource
      TabOrder = 12
    end
    object edtNascimento: TDBEdit
      Left = 759
      Top = 153
      Width = 77
      Height = 23
      DataField = 'NASCIMENTO'
      DataSource = DataSource
      TabOrder = 13
    end
    object edtTelefone: TDBEdit
      Left = 24
      Top = 200
      Width = 215
      Height = 23
      DataField = 'TELEFONE'
      DataSource = DataSource
      TabOrder = 14
    end
    object edtCelular: TDBEdit
      Left = 245
      Top = 200
      Width = 215
      Height = 23
      DataField = 'CELULAR'
      DataSource = DataSource
      TabOrder = 15
    end
    object edtEmail: TDBEdit
      Left = 466
      Top = 200
      Width = 370
      Height = 23
      DataField = 'EMAIL'
      DataSource = DataSource
      TabOrder = 16
    end
    object rdTipoJuridico: TDBRadioGroup
      Left = 24
      Top = 232
      Width = 215
      Height = 39
      Caption = ' Tipo Jur'#237'dico '
      Columns = 2
      DataField = 'TIPO_JURIDICO'
      DataSource = DataSource
      Items.Strings = (
        'Pessoa F'#237'sica'
        'Pessoa Jur'#237'dica')
      TabOrder = 17
      Values.Strings = (
        '1'
        '2')
      OnClick = rdTipoJuridicoClick
    end
    object edtCPF: TDBEdit
      Left = 245
      Top = 248
      Width = 150
      Height = 23
      DataField = 'CPF'
      DataSource = DataSource
      TabOrder = 18
    end
    object edtRG: TDBEdit
      Left = 401
      Top = 248
      Width = 120
      Height = 23
      DataField = 'RG'
      DataSource = DataSource
      TabOrder = 19
    end
    object edtCNPJ: TDBEdit
      Left = 527
      Top = 248
      Width = 226
      Height = 23
      DataField = 'CNPJ'
      DataSource = DataSource
      TabOrder = 20
    end
    object edtIE: TDBEdit
      Left = 759
      Top = 248
      Width = 77
      Height = 23
      DataField = 'IE'
      DataSource = DataSource
      TabOrder = 21
    end
    object edtCadastro: TDBEdit
      Left = 24
      Top = 293
      Width = 215
      Height = 23
      Color = clBtnFace
      DataField = 'DH_CADASTRO'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 22
    end
  end
  inherited pnRodape: TPanel
    Top = 351
    Width = 884
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 351
    ExplicitWidth = 884
    inherited btnGravar: TBitBtn
      Left = 613
      ExplicitLeft = 613
    end
    inherited btnCancelar: TBitBtn
      Left = 748
      ExplicitLeft = 748
    end
  end
  inherited DataSource: TDataSource
    DataSet = ModelPessoasDM.QPessoasCadastro
    Left = 352
    Top = 24
  end
end
