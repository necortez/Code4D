object ModelSubgruposDM: TModelSubgruposDM
  Height = 221
  Width = 334
  object QSubGruposCadastro: TFDQuery
    BeforePost = QSubGruposCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM SUBGRUPOS')
    Left = 83
    Top = 38
    object QSubGruposCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QSubGruposCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
  object QSubgruposBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM SUBGRUPOS')
    Left = 229
    Top = 38
    object QSubgruposBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubgruposBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
  object QLook: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'SELECT NOME'
      'FROM SUBGRUPOS'
      'WHERE (ID = :IDSUBGRUPO)')
    Left = 80
    Top = 120
    ParamData = <
      item
        Name = 'IDSUBGRUPO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
end
