inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas Buscar'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnTopo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtBuscar: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnRodape: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited rdgroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome/Fantasia (F2)'
        'Cidade (F3)')
      ExplicitLeft = 4
      ExplicitWidth = 591
      ExplicitHeight = 43
    end
  end
  inherited Panel3: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CIDADE'
          Title.Caption = 'C'#243'd.Cidade'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADENOME'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Width = 64
          Visible = True
        end>
    end
  end
  inherited pnTotal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lbTotal: TLabel
      Height = 27
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
