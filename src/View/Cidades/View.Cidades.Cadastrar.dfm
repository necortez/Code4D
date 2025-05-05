inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades Cadastrar/Alterar'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited pnDados: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object Label1: TLabel
      Left = 56
      Top = 56
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
      FocusControl = edtCodigo
    end
    object Label2: TLabel
      Left = 56
      Top = 104
      Width = 41
      Height = 15
      Caption = 'Nome *'
      FocusControl = edtNome
    end
    object Label3: TLabel
      Left = 56
      Top = 152
      Width = 22
      Height = 15
      Caption = 'UF *'
    end
    object Label4: TLabel
      Left = 56
      Top = 208
      Width = 66
      Height = 15
      Caption = 'C'#243'digo IBGE'
      FocusControl = edtIBGE
    end
    object edtCodigo: TDBEdit
      Left = 56
      Top = 72
      Width = 66
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TDBEdit
      Left = 56
      Top = 123
      Width = 433
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource
      TabOrder = 1
    end
    object edtIBGE: TDBEdit
      Left = 56
      Top = 224
      Width = 154
      Height = 23
      DataField = 'CODIGO_IBGE'
      DataSource = DataSource
      TabOrder = 3
    end
    object cmbUf: TDBComboBox
      Left = 56
      Top = 173
      Width = 66
      Height = 23
      Style = csDropDownList
      DataField = 'UF'
      DataSource = DataSource
      DropDownCount = 28
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO'
        'EX')
      TabOrder = 2
    end
  end
  inherited pnRodape: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnGravar: TBitBtn
      Left = 503
      Margins.Right = 10
      ExplicitLeft = 503
    end
    inherited btnCancelar: TBitBtn
      Left = 643
      Margins.Right = 10
      ExplicitLeft = 643
    end
  end
  inherited DataSource: TDataSource
    DataSet = ModelCidadesDM.QCidadesCadastro
  end
end
