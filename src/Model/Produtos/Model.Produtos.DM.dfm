object ModelProdutosDM: TModelProdutosDM
  Height = 282
  Width = 452
  object QProdutosCadastro: TFDQuery
    AfterInsert = QProdutosCadastroAfterInsert
    BeforePost = QProdutosCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 141
    Top = 45
    object QProdutosCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object QProdutosCadastroID_SUBGRUPO: TIntegerField
      DisplayLabel = 'C'#243'd.Subgrupo'
      FieldName = 'ID_SUBGRUPO'
      Origin = 'ID_SUBGRUPO'
      Required = True
      DisplayFormat = '000000'
    end
    object QProdutosCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object QProdutosCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object QProdutosCadastroPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPORCENTAGEM: TFMTBCDField
      DisplayLabel = '%'
      FieldName = 'PORCENTAGEM'
      Origin = 'PORCENTAGEM'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object QProdutosCadastroCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
    end
    object QProdutosCadastroIMAGEM: TStringField
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      Size = 200
    end
  end
  object QProdutosBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT '
      'PRODUTOS.ID,'
      'PRODUTOS.NOME,'
      'PRODUTOS.PRECO_CUSTO,'
      'PRODUTOS.PORCENTAGEM,'
      'PRODUTOS.PRECO_VENDA,'
      'PRODUTOS.UNIDADE,'
      'PRODUTOS.CODIGO_BARRAS,'
      'PRODUTOS.ID_SUBGRUPO,'
      'SUBGRUPOS.NOME AS SUBGRUPO_NOME'
      'FROM PRODUTOS'
      'JOIN SUBGRUPOS ON (SUBGRUPOS.ID = PRODUTOS.ID_SUBGRUPO)')
    Left = 282
    Top = 45
    object QProdutosBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      DisplayFormat = '000000'
    end
    object QProdutosBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object QProdutosBuscaPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPORCENTAGEM: TFMTBCDField
      DisplayLabel = '%'
      FieldName = 'PORCENTAGEM'
      Origin = 'PORCENTAGEM'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object QProdutosBuscaCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
    end
    object QProdutosBuscaID_SUBGRUPO: TIntegerField
      DisplayLabel = 'C'#243'd.Subgrupo'
      FieldName = 'ID_SUBGRUPO'
      Origin = 'ID_SUBGRUPO'
      Required = True
      DisplayFormat = '000000'
    end
    object QProdutosBuscaSUBGRUPO_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Subgrupo'
      FieldName = 'SUBGRUPO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object QLook: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT FIRST 1'
      'ID,'
      'NOME,'
      'PRECO_VENDA,'
      'UNIDADE'
      'FROM PRODUTOS'
      'WHERE (CODIGO_BARRAS = :CODBARRAS)')
    Left = 218
    Top = 115
    ParamData = <
      item
        Name = 'CODBARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object QLookID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object QLookPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object QLookUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
  end
end
