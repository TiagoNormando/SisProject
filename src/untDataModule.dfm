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
    Connected = True
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
      ReadOnly = True
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
      DisplayFormat = 'dd/MM/yyyy'
    end
    object FDTableProjetodataFim: TDateField
      FieldName = 'dataFim'
      Origin = 'dataFim'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object FDTableProjetovalorProjeto: TFloatField
      FieldName = 'valorProjeto'
      Origin = 'valorProjeto'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object FDTableProjetorisco: TIntegerField
      FieldName = 'risco'
      Origin = 'risco'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object FDQueryAUX: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select MAX(idProjeto) from projeto')
    Left = 32
    Top = 168
  end
  object FDqrProjetoParticipante: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'dbsisproject.projetoparticipante'
    SQL.Strings = (
      
        'select * from projetoparticipante where projeto_id  = :projeto_i' +
        'd'
      '')
    Left = 160
    Top = 168
    ParamData = <
      item
        Name = 'PROJETO_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    object FDqrProjetoParticipanteprojeto_id: TIntegerField
      FieldName = 'projeto_id'
      Origin = 'projeto_id'
      Required = True
    end
    object FDqrProjetoParticipantenomeParticipante: TStringField
      FieldName = 'nomeParticipante'
      Origin = 'nomeParticipante'
      Required = True
      Size = 200
    end
  end
end
