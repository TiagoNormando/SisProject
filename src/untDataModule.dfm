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
    VendorLib = 
      'C:\Users\hugov\Documents\Embarcadero\Studio\Projects\Back End\Si' +
      'stema Restaurante\Win32\Debug\lib\libmySQL.dll'
    Left = 112
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 248
    Top = 24
  end
end
