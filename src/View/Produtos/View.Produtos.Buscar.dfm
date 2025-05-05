inherited ViewProdutosBuscar: TViewProdutosBuscar
  Caption = 'Produtos Buscar'
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
      Columns = 4
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'C'#243'digo de Barras (F3)'
        'SubGrupo (F4)')
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
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Title.Alignment = taCenter
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAGEM'
          Title.Alignment = taCenter
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Title.Alignment = taCenter
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_BARRAS'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SUBGRUPO'
          Title.Alignment = taCenter
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBGRUPO_NOME'
          Title.Alignment = taCenter
          Width = 200
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
    DataSet = ModelProdutosDM.QProdutosBusca
  end
end
