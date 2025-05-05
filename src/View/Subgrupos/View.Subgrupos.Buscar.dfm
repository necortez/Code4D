inherited ViewSubgruposBuscar: TViewSubgruposBuscar
  Caption = 'Subgrupos Buscar'
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
        'Nome (F2)')
    end
  end
  inherited Panel3: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 500
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
    DataSet = ModelSubgruposDM.QSubgruposBusca
  end
end
