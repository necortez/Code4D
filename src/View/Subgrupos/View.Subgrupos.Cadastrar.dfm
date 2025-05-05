inherited ViewSubgruposCadastrar: TViewSubgruposCadastrar
  Caption = 'Subgrupos Cadastrar/Alterar'
  ClientHeight = 256
  ClientWidth = 599
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 615
  ExplicitHeight = 295
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 599
    Height = 206
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 599
    ExplicitHeight = 206
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
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = DataSource
      TabOrder = 1
    end
  end
  inherited pnRodape: TPanel
    Top = 206
    Width = 599
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 206
    ExplicitWidth = 599
    inherited btnGravar: TBitBtn
      Left = 318
      Margins.Right = 10
      ExplicitLeft = 503
    end
    inherited btnCancelar: TBitBtn
      Left = 458
      Margins.Right = 10
      ExplicitLeft = 643
    end
  end
  inherited DataSource: TDataSource
    DataSet = ModelSubgruposDM.QSubGruposCadastro
    Left = 328
    Top = 24
  end
end
