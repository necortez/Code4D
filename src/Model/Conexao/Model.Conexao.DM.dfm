object ModelConexaoDM: TModelConexaoDM
  Height = 226
  Width = 382
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Code4Delphi\Vendas\Dados\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 51
    Top = 19
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 19
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 282
    Top = 19
  end
end
