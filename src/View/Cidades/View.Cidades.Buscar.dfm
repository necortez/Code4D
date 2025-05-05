inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades Buscar'
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
      Width = 969
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 967
    end
  end
  inherited pnRodape: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited rdgroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'IBGE (F1)'
        'Nome (F2)'
        'UF (F3)')
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
          FieldName = 'UF'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_IBGE'
          Width = 82
          Visible = True
        end>
    end
  end
  inherited pnTotal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lbTotal: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
