object frmDados: TfrmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 308
  Width = 430
  object OpenDialogCSV: TOpenDialog
    Left = 168
    Top = 24
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=dbsisproject'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\tiago\Documents\Projetos\SisProject\Lib\libmySQL.dll'
    Left = 112
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 248
    Top = 24
  end
  object FDTableProjeto: TFDTable
    IndexFieldNames = 'idProjeto'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'projeto'
    TableName = 'projeto'
    Left = 40
    Top = 104
    object FDTableProjetoidProjeto: TFDAutoIncField
      FieldName = 'idProjeto'
      Origin = 'idProjeto'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDTableProjetonomeProjeto: TStringField
      FieldName = 'nomeProjeto'
      Origin = 'nomeProjeto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object FDTableProjetodataInicio: TDateField
      FieldName = 'dataInicio'
      Origin = 'dataInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDTableProjetodataFim: TDateField
      FieldName = 'dataFim'
      Origin = 'dataFim'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDTableProjetovalorProjeto: TFloatField
      FieldName = 'valorProjeto'
      Origin = 'valorProjeto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDTableProjetorisco: TIntegerField
      FieldName = 'risco'
      Origin = 'risco'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
