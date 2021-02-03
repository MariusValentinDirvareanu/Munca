object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 497
  Width = 914
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=testDelphi;Data Source=DESKTOP-3OHN9MI\' +
      'SQLEXPRESS'
    DefaultDatabase = 'AdventureWorks2012'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 240
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select pp.BusinessEntityID, pp.FirstName, pp.MiddleName, pp.Last' +
        'Name from Person.Person as pp'
      'join Person.PersonPhone as ppp'
      'on pp.BusinessEntityID=ppp.BusinessEntityID'
      'order by pp.BusinessEntityID;')
    Left = 448
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
    Top = 208
  end
end
