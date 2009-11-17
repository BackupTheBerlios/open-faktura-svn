object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DM1Create
  OnDestroy = DataModuleDestroy
  Left = 304
  Top = 116
  Height = 588
  Width = 734
  object LandDS: TDataSource
    DataSet = LandTab
    Left = 120
    Top = 16
  end
  object WhrungDS: TDataSource
    DataSet = WhrungTab
    Left = 120
    Top = 67
  end
  object WgrDS: TDataSource
    DataSet = WgrTab
    Left = 120
    Top = 120
  end
  object LiefArtDS: TDataSource
    DataSet = LiefArtTab
    Left = 120
    Top = 173
  end
  object ZahlArtDS: TDataSource
    DataSet = ZahlartTab
    Left = 120
    Top = 223
  end
  object VertreterDS: TDataSource
    DataSet = VertreterTab
    Left = 120
    Top = 273
  end
  object DB1: TZConnection
    Protocol = 'mysql'
    HostName = 'localhost'
    Database = 'm001'
    Left = 26
    Top = 16
  end
  object JourTab: TZQuery
    OnCalcFields = JourTabCalcFields
    SQL.Strings = (
      'select * from JOURNAL '
      'where REC_ID =:id')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 2591
      end>
    Left = 253
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 2591
      end>
    object JourTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object JourTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
    end
    object JourTabVRENUM: TStringField
      FieldName = 'VRENUM'
    end
    object JourTabRDATUM: TDateField
      FieldName = 'RDATUM'
    end
    object JourTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 30
    end
    object JourTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
    end
    object JourTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object JourTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object JourTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
    end
    object JourTabNSUMME: TFloatField
      FieldName = 'NSUMME'
    end
    object JourTabMSUMME: TFloatField
      FieldName = 'MSUMME'
    end
    object JourTabBSUMME: TFloatField
      FieldName = 'BSUMME'
    end
    object JourTabSTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object JourTabPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object JourTabORGNUM: TStringField
      FieldName = 'ORGNUM'
    end
    object JourTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object JourTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
    end
    object JourTabSOLL_STAGE: TIntegerField
      FieldName = 'SOLL_STAGE'
    end
    object JourTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
    end
    object JourTabSOLL_NTAGE: TIntegerField
      FieldName = 'SOLL_NTAGE'
    end
    object JourTabSOLL_RATEN: TIntegerField
      FieldName = 'SOLL_RATEN'
    end
    object JourTabSOLL_RATBETR: TFloatField
      FieldName = 'SOLL_RATBETR'
    end
    object JourTabSOLL_RATINTERVALL: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
    end
    object JourTabIST_ANZAHLUNG: TFloatField
      FieldName = 'IST_ANZAHLUNG'
    end
    object JourTabIST_SKONTO: TFloatField
      FieldName = 'IST_SKONTO'
      DisplayFormat = '0.0 %'
    end
    object JourTabIST_ZAHLDAT: TDateField
      FieldName = 'IST_ZAHLDAT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object JourTabIST_BETRAG: TFloatField
      FieldName = 'IST_BETRAG'
      DisplayFormat = ',###,##0.00'
    end
    object JourTabKONTOAUSZUG: TIntegerField
      FieldName = 'KONTOAUSZUG'
    end
    object JourTabBANK_ID: TIntegerField
      FieldName = 'BANK_ID'
    end
    object JourTabUW_NUM: TIntegerField
      FieldName = 'UW_NUM'
    end
    object JourTabGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
    end
    object JourTabKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object JourTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object JourTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object JourTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object JourTabKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object JourTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object JourTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object JourTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object JourTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object JourTabIST_SKONTO_BETR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IST_SKONTO_BETR'
      DisplayFormat = ',###,##0.00'
      Calculated = True
    end
    object JourTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
    end
    object JourTabLDATUM: TDateField
      FieldName = 'LDATUM'
    end
    object JourTabLIEFART: TIntegerField
      FieldName = 'LIEFART'
    end
    object JourTabKOST_NETTO: TFloatField
      FieldName = 'KOST_NETTO'
    end
    object JourTabWERT_NETTO: TFloatField
      FieldName = 'WERT_NETTO'
    end
    object JourTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
    end
    object JourTabMAHNKOSTEN: TFloatField
      FieldName = 'MAHNKOSTEN'
    end
    object JourTabFREIGABE1_FLAG: TBooleanField
      FieldName = 'FREIGABE1_FLAG'
      Required = True
    end
    object JourTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object JourTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object JourTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Required = True
    end
    object JourTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Required = True
    end
    object JourTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Required = True
    end
    object JourTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Required = True
    end
    object JourTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      Required = True
    end
    object JourTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      Required = True
    end
    object JourTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      Required = True
    end
    object JourTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      Required = True
    end
    object JourTabSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object JourTabSHOP_ORDERID: TIntegerField
      FieldName = 'SHOP_ORDERID'
    end
    object JourTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
    end
    object JourTabLOHN: TFloatField
      FieldName = 'LOHN'
    end
    object JourTabWARE: TFloatField
      FieldName = 'WARE'
    end
    object JourTabROHGEWINN: TFloatField
      FieldName = 'ROHGEWINN'
    end
    object JourTabTKOST: TFloatField
      FieldName = 'TKOST'
    end
    object JourTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
    end
    object JourTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
    end
    object JourTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
    end
    object JourTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
    end
    object JourTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
    end
    object JourTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
    end
    object JourTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
    end
    object JourTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
    end
    object JourTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
  end
  object JPosTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from JOURNALPOS'
      'where JOURNAL_ID =:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 325
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object JPosTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object JPosTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
    end
    object JPosTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
    end
    object JPosTabQUELLE_SRC: TIntegerField
      FieldName = 'QUELLE_SRC'
    end
    object JPosTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
    end
    object JPosTabARTIKELTYP: TStringField
      FieldName = 'ARTIKELTYP'
      Size = 1
    end
    object JPosTabARTIKEL_ID: TIntegerField
      FieldName = 'ARTIKEL_ID'
      Required = True
    end
    object JPosTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object JPosTabATRNUM: TIntegerField
      FieldName = 'ATRNUM'
    end
    object JPosTabVRENUM: TStringField
      FieldName = 'VRENUM'
    end
    object JPosTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
    end
    object JPosTabPOSITION: TIntegerField
      FieldName = 'POSITION'
      Required = True
    end
    object JPosTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
    end
    object JPosTabARTNUM: TStringField
      FieldName = 'ARTNUM'
    end
    object JPosTabBARCODE: TStringField
      FieldName = 'BARCODE'
    end
    object JPosTabMENGE: TFloatField
      FieldName = 'MENGE'
    end
    object JPosTabLAENGE: TStringField
      FieldName = 'LAENGE'
    end
    object JPosTabGROESSE: TStringField
      FieldName = 'GROESSE'
    end
    object JPosTabDIMENSION: TStringField
      FieldName = 'DIMENSION'
    end
    object JPosTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
    end
    object JPosTabME_EINHEIT: TStringField
      FieldName = 'ME_EINHEIT'
      Size = 10
    end
    object JPosTabPR_EINHEIT: TFloatField
      FieldName = 'PR_EINHEIT'
    end
    object JPosTabEPREIS: TFloatField
      FieldName = 'EPREIS'
    end
    object JPosTabE_RGEWINN: TFloatField
      FieldName = 'E_RGEWINN'
    end
    object JPosTabRABATT: TFloatField
      FieldName = 'RABATT'
    end
    object JPosTabRABATT2: TFloatField
      FieldName = 'RABATT2'
      Required = True
    end
    object JPosTabRABATT3: TFloatField
      FieldName = 'RABATT3'
      Required = True
    end
    object JPosTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
    end
    object JPosTabALTTEIL_PROZ: TFloatField
      FieldName = 'ALTTEIL_PROZ'
    end
    object JPosTabALTTEIL_STCODE: TIntegerField
      FieldName = 'ALTTEIL_STCODE'
    end
    object JPosTabGEGENKTO: TIntegerField
      FieldName = 'GEGENKTO'
    end
    object JPosTabBEZEICHNUNG: TMemoField
      FieldName = 'BEZEICHNUNG'
      BlobType = ftMemo
    end
    object JPosTabVIEW_POS: TStringField
      FieldName = 'VIEW_POS'
      Size = 3
    end
    object JPosTabGEBUCHT: TBooleanField
      FieldName = 'GEBUCHT'
      Required = True
    end
    object JPosTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object JPosTabALTTEIL_FLAG: TBooleanField
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object JPosTabBEZ_FEST_FLAG: TBooleanField
      FieldName = 'BEZ_FEST_FLAG'
      Required = True
    end
    object JPosTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object JPosTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
    end
    object JPosTabCALC_FAKTOR: TFloatField
      FieldName = 'CALC_FAKTOR'
    end
    object JPosTabGPREIS: TFloatField
      FieldName = 'GPREIS'
    end
    object JPosTabG_RGEWINN: TFloatField
      FieldName = 'G_RGEWINN'
    end
    object JPosTabE_RABATT_BETRAG: TFloatField
      FieldName = 'E_RABATT_BETRAG'
    end
    object JPosTabG_RABATT_BETRAG: TFloatField
      FieldName = 'G_RABATT_BETRAG'
    end
    object JPosTabPROVIS_PROZ: TFloatField
      FieldName = 'PROVIS_PROZ'
    end
    object JPosTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
  end
  object ZahlartTab: TZQuery
    Connection = DB1
    BeforeDelete = NummerTabNewRecord
    OnNewRecord = NummerTabNewRecord
    SQL.Strings = (
      'select TRUNCATE(VAL_CHAR,0) as ZAHL_ID, '
      'NAME as LANGBEZ, '
      'VAL_DOUBLE as SKONTO_PROZ, '
      'VAL_INT2 as NETTO_TAGE, '
      'VAL_INT as SKONTO_TAGE,'
      'VAL_BLOB as TEXT'
      'from REGISTRY '
      'where MAINKEY='#39'MAIN\\ZAHLART'#39
      'order by ZAHL_ID'
      ''
      '')
    Params = <>
    Left = 184
    Top = 223
    object ZahlartTabZAHL_ID: TFloatField
      FieldName = 'ZAHL_ID'
    end
    object ZahlartTabSKONTO_PROZ: TFloatField
      FieldName = 'SKONTO_PROZ'
      DisplayFormat = ',#0.00'
      EditFormat = '0.00'
    end
    object ZahlartTabSKONTO_TAGE: TIntegerField
      FieldName = 'SKONTO_TAGE'
      EditFormat = '0'
    end
    object ZahlartTabNETTO_TAGE: TLargeintField
      FieldName = 'NETTO_TAGE'
      EditFormat = '0'
    end
    object ZahlartTabLANGBEZ: TStringField
      DisplayWidth = 100
      FieldName = 'LANGBEZ'
      Size = 255
    end
    object ZahlartTabTEXT: TMemoField
      FieldName = 'TEXT'
      BlobType = ftMemo
    end
  end
  object VertreterTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from VERTRETER')
    Params = <>
    Left = 184
    Top = 273
  end
  object LandTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from LAND')
    Params = <>
    Left = 184
    Top = 16
    object LandTabID: TStringField
      FieldName = 'ID'
      Size = 2
    end
    object LandTabNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object LandTabISO_CODE_3: TStringField
      FieldName = 'ISO_CODE_3'
      Size = 3
    end
    object LandTabFORMAT: TIntegerField
      FieldName = 'FORMAT'
    end
    object LandTabVORWAHL: TStringField
      FieldName = 'VORWAHL'
      Size = 10
    end
    object LandTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object LandTabSPRACHE: TStringField
      FieldName = 'SPRACHE'
      Size = 3
    end
    object LandTabPOST_CODE: TStringField
      FieldName = 'POST_CODE'
      Size = 3
    end
    object LandTabEU_LAND: TBooleanField
      FieldName = 'EU_LAND'
      Required = True
    end
  end
  object WhrungTab: TZQuery
    Tag = 999999999
    Connection = DB1
    SQL.Strings = (
      
        'select NAME as WAEHRUNG, VAL_CHAR as LANGBEZ, VAL_DOUBLE as FAKT' +
        'OR'
      'from REGISTRY'
      'where MAINKEY='#39'MAIN\\WAEHRUNG'#39
      'order by WAEHRUNG')
    Params = <>
    Left = 184
    Top = 67
    object WhrungTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object WhrungTabLANGBEZ: TStringField
      FieldName = 'LANGBEZ'
      Size = 30
    end
    object WhrungTabFAKTOR: TFloatField
      FieldName = 'FAKTOR'
    end
  end
  object WgrTab: TZQuery
    Connection = DB1
    OnNewRecord = WgrTabNewRecord
    SQL.Strings = (
      'select * from WARENGRUPPEN order by ID')
    Params = <>
    Left = 184
    Top = 120
    object WgrTabID: TIntegerField
      FieldName = 'ID'
    end
    object WgrTabTOP_ID: TIntegerField
      FieldName = 'TOP_ID'
      DisplayFormat = '0;-;-'
    end
    object WgrTabNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object WgrTabBESCHREIBUNG: TMemoField
      FieldName = 'BESCHREIBUNG'
      BlobType = ftMemo
    end
    object WgrTabDEF_EKTO: TIntegerField
      DisplayWidth = 6
      FieldName = 'DEF_EKTO'
      DisplayFormat = '00000;-;-'
      EditFormat = '0'
    end
    object WgrTabDEF_AKTO: TIntegerField
      DisplayWidth = 6
      FieldName = 'DEF_AKTO'
      DisplayFormat = '00000;-;-'
      EditFormat = '0'
    end
    object WgrTabVORGABEN: TMemoField
      FieldName = 'VORGABEN'
      BlobType = ftMemo
    end
    object WgrTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
      MaxValue = 3
    end
    object WgrTabVK1_FAKTOR: TFloatField
      FieldName = 'VK1_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
      MaxValue = 99.000000000000000000
    end
    object WgrTabVK2_FAKTOR: TFloatField
      FieldName = 'VK2_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
      MaxValue = 99.000000000000000000
    end
    object WgrTabVK3_FAKTOR: TFloatField
      FieldName = 'VK3_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
      MaxValue = 99.000000000000000000
    end
    object WgrTabVK4_FAKTOR: TFloatField
      FieldName = 'VK4_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
      MaxValue = 99.000000000000000000
    end
    object WgrTabVK5_FAKTOR: TFloatField
      FieldName = 'VK5_FAKTOR'
      DisplayFormat = ',#0.00000'
      EditFormat = '0.00000'
      MaxValue = 99.000000000000000000
    end
  end
  object NummerTab: TZQuery
    Connection = DB1
    BeforeDelete = NummerTabNewRecord
    OnNewRecord = NummerTabNewRecord
    SQL.Strings = (
      'select '
      'VAL_INT as QUELLE, '
      'VAL_CHAR as FORMAT, '
      'VAL_INT2 as NEXT_NUM, '
      'VAL_INT3 as MAXLEN, '
      'MAINKEY, NAME'
      'from REGISTRY '
      'where MAINKEY='#39'MAIN\\NUMBERS'#39' '
      'order by QUELLE')
    Params = <>
    Left = 26
    Top = 323
    object NummerTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object NummerTabFORMAT: TStringField
      FieldName = 'FORMAT'
    end
    object NummerTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Required = True
      Size = 255
    end
    object NummerTabNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object NummerTabNEXT_NUM: TLargeintField
      FieldName = 'NEXT_NUM'
      MaxValue = 999999999
      MinValue = 1
    end
    object NummerTabMAXLEN: TLargeintField
      DisplayLabel = 'max. L'#228'nge'
      FieldName = 'MAXLEN'
      DisplayFormat = '0 "Stellen"'
      EditFormat = '0'
      MaxValue = 9
      MinValue = 2
    end
  end
  object KGRTab: TZQuery
    Connection = DB1
    BeforePost = KGRTabBeforePost
    SQL.Strings = (
      
        'select VAL_INT as GR, NAME as LANGBEZ, VAL_BLOB as SQL_STATEMENT' +
        ', MAINKEY'
      'from REGISTRY'
      'where MAINKEY='#39'MAIN\\ADDR_HIR'#39
      'order by GR')
    Params = <>
    Left = 184
    Top = 323
    object KGRTabGR: TIntegerField
      FieldName = 'GR'
    end
    object KGRTabLANGBEZ: TStringField
      FieldName = 'LANGBEZ'
      Size = 100
    end
    object KGRTabSQL_STATEMENT: TMemoField
      FieldName = 'SQL_STATEMENT'
      BlobType = ftMemo
    end
    object KGRTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Required = True
      Size = 255
    end
  end
  object KgrDS: TDataSource
    DataSet = KGRTab
    Left = 120
    Top = 323
  end
  object LiefArtTab: TZQuery
    Connection = DB1
    BeforeDelete = NummerTabNewRecord
    OnNewRecord = NummerTabNewRecord
    SQL.Strings = (
      'select VAL_INT as LIEF_ID, NAME as LANGBEZ, VAL_BLOB as TEXT'
      'from REGISTRY '
      'where MAINKEY='#39'MAIN\\LIEFART'#39
      'order by LIEF_ID')
    Params = <>
    Left = 184
    Top = 173
  end
  object RegTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from REGISTRY'
      'where MAINKEY=:KEY and NAME=:NAME')
    Params = <
      item
        DataType = ftString
        Name = 'KEY'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end>
    Left = 26
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'KEY'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end>
    object RegTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Size = 255
    end
    object RegTabNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object RegTabVAL_CHAR: TStringField
      FieldName = 'VAL_CHAR'
      Size = 255
    end
    object RegTabVAL_DATE: TDateTimeField
      FieldName = 'VAL_DATE'
    end
    object RegTabVAL_INT: TIntegerField
      FieldName = 'VAL_INT'
    end
    object RegTabVAL_INT2: TLargeintField
      FieldName = 'VAL_INT2'
    end
    object RegTabVAL_INT3: TLargeintField
      FieldName = 'VAL_INT3'
    end
    object RegTabVAL_DOUBLE: TFloatField
      FieldName = 'VAL_DOUBLE'
    end
    object RegTabVAL_BLOB: TBlobField
      FieldName = 'VAL_BLOB'
    end
    object RegTabVAL_BIN: TBlobField
      FieldName = 'VAL_BIN'
    end
    object RegTabVAL_TYP: TIntegerField
      FieldName = 'VAL_TYP'
    end
  end
  object ArtMengeTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'update ARTIKEL '
      'set MENGE_AKT=MENGE_AKT - :SUBMENGE, SHOP_CHANGE_FLAG=1'
      'where REC_ID = :ID')
    Params = <
      item
        DataType = ftFloat
        Name = 'submenge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 533
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'submenge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object CpySrcKopfTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from JOURNAL'
      'where REC_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 456
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object CpySrcKopfTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object CpySrcKopfTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object CpySrcKopfTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
    end
    object CpySrcKopfTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object CpySrcKopfTabATRNUM: TIntegerField
      FieldName = 'ATRNUM'
    end
    object CpySrcKopfTabVRENUM: TStringField
      FieldName = 'VRENUM'
      Required = True
    end
    object CpySrcKopfTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
    end
    object CpySrcKopfTabFOLGENR: TIntegerField
      FieldName = 'FOLGENR'
    end
    object CpySrcKopfTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
    end
    object CpySrcKopfTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object CpySrcKopfTabVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
    end
    object CpySrcKopfTabGLOBRABATT: TFloatField
      FieldName = 'GLOBRABATT'
    end
    object CpySrcKopfTabADATUM: TDateField
      FieldName = 'ADATUM'
    end
    object CpySrcKopfTabRDATUM: TDateField
      FieldName = 'RDATUM'
      Required = True
    end
    object CpySrcKopfTabLDATUM: TDateField
      FieldName = 'LDATUM'
    end
    object CpySrcKopfTabTermin: TDateField
      FieldName = 'TERMIN'
    end
    object CpySrcKopfTabPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
    end
    object CpySrcKopfTabLIEFART: TIntegerField
      FieldName = 'LIEFART'
    end
    object CpySrcKopfTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
    end
    object CpySrcKopfTabKOST_NETTO: TFloatField
      FieldName = 'KOST_NETTO'
    end
    object CpySrcKopfTabWERT_NETTO: TFloatField
      FieldName = 'WERT_NETTO'
    end
    object CpySrcKopfTabLOHN: TFloatField
      FieldName = 'LOHN'
    end
    object CpySrcKopfTabWARE: TFloatField
      FieldName = 'WARE'
    end
    object CpySrcKopfTabTKOST: TFloatField
      FieldName = 'TKOST'
    end
    object CpySrcKopfTabMWST_0: TFloatField
      FieldName = 'MWST_0'
    end
    object CpySrcKopfTabMWST_1: TFloatField
      FieldName = 'MWST_1'
    end
    object CpySrcKopfTabMWST_2: TFloatField
      FieldName = 'MWST_2'
    end
    object CpySrcKopfTabMWST_3: TFloatField
      FieldName = 'MWST_3'
    end
    object CpySrcKopfTabNSUMME: TFloatField
      FieldName = 'NSUMME'
    end
    object CpySrcKopfTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
    end
    object CpySrcKopfTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
    end
    object CpySrcKopfTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
    end
    object CpySrcKopfTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
    end
    object CpySrcKopfTabMSUMME: TFloatField
      FieldName = 'MSUMME'
    end
    object CpySrcKopfTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
    end
    object CpySrcKopfTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
    end
    object CpySrcKopfTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
    end
    object CpySrcKopfTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
    end
    object CpySrcKopfTabBSUMME: TFloatField
      FieldName = 'BSUMME'
    end
    object CpySrcKopfTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
    end
    object CpySrcKopfTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
    end
    object CpySrcKopfTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
    end
    object CpySrcKopfTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
    end
    object CpySrcKopfTabATSUMME: TFloatField
      FieldName = 'ATSUMME'
    end
    object CpySrcKopfTabATMSUMME: TFloatField
      FieldName = 'ATMSUMME'
    end
    object CpySrcKopfTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object CpySrcKopfTabGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
    end
    object CpySrcKopfTabSOLL_STAGE: TIntegerField
      FieldName = 'SOLL_STAGE'
    end
    object CpySrcKopfTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
    end
    object CpySrcKopfTabSOLL_NTAGE: TIntegerField
      FieldName = 'SOLL_NTAGE'
    end
    object CpySrcKopfTabSOLL_RATEN: TIntegerField
      FieldName = 'SOLL_RATEN'
    end
    object CpySrcKopfTabSOLL_RATBETR: TFloatField
      FieldName = 'SOLL_RATBETR'
    end
    object CpySrcKopfTabSOLL_RATINTERVALL: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
    end
    object CpySrcKopfTabIST_ANZAHLUNG: TFloatField
      FieldName = 'IST_ANZAHLUNG'
    end
    object CpySrcKopfTabIST_SKONTO: TFloatField
      FieldName = 'IST_SKONTO'
    end
    object CpySrcKopfTabIST_ZAHLDAT: TDateField
      FieldName = 'IST_ZAHLDAT'
    end
    object CpySrcKopfTabIST_BETRAG: TFloatField
      FieldName = 'IST_BETRAG'
    end
    object CpySrcKopfTabMAHNKOSTEN: TFloatField
      FieldName = 'MAHNKOSTEN'
    end
    object CpySrcKopfTabKONTOAUSZUG: TIntegerField
      FieldName = 'KONTOAUSZUG'
    end
    object CpySrcKopfTabBANK_ID: TIntegerField
      FieldName = 'BANK_ID'
    end
    object CpySrcKopfTabSTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object CpySrcKopfTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object CpySrcKopfTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
    object CpySrcKopfTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object CpySrcKopfTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object CpySrcKopfTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object CpySrcKopfTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object CpySrcKopfTabKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object CpySrcKopfTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object CpySrcKopfTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object CpySrcKopfTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object CpySrcKopfTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object CpySrcKopfTabUSR1: TStringField
      FieldName = 'USR1'
      Size = 80
    end
    object CpySrcKopfTabUSR2: TStringField
      FieldName = 'USR2'
      Size = 80
    end
    object CpySrcKopfTabPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object CpySrcKopfTabORGNUM: TStringField
      FieldName = 'ORGNUM'
    end
    object CpySrcKopfTabBEST_NAME: TStringField
      FieldName = 'BEST_NAME'
      Size = 40
    end
    object CpySrcKopfTabBEST_CODE: TIntegerField
      FieldName = 'BEST_CODE'
    end
    object CpySrcKopfTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object CpySrcKopfTabUW_NUM: TIntegerField
      FieldName = 'UW_NUM'
    end
    object CpySrcKopfTabKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object CpySrcKopfTabBEST_DATUM: TDateField
      FieldName = 'BEST_DATUM'
    end
    object CpySrcKopfTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object CpySrcKopfTabMAHNSTUFE: TIntegerField
      FieldName = 'MAHNSTUFE'
    end
    object CpySrcKopfTabMAHNDATUM: TDateField
      FieldName = 'MAHNDATUM'
    end
    object CpySrcKopfTabMAHNPRINT: TIntegerField
      FieldName = 'MAHNPRINT'
    end
    object CpySrcKopfTabFREIGABE1_FLAG: TBooleanField
      FieldName = 'FREIGABE1_FLAG'
      Required = True
    end
    object CpySrcKopfTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object CpySrcKopfTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object CpySrcKopfTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
    object CpySrcKopfTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      Required = True
    end
    object CpySrcKopfTabROHGEWINN: TFloatField
      FieldName = 'ROHGEWINN'
      Required = True
    end
  end
  object CpyDstKopfTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from JOURNAL'
      'limit 0,1')
    Params = <>
    Left = 533
    Top = 16
    object CpyDstKopfTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object CpyDstKopfTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object CpyDstKopfTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
    end
    object CpyDstKopfTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object CpyDstKopfTabATRNUM: TIntegerField
      FieldName = 'ATRNUM'
    end
    object CpyDstKopfTabVRENUM: TStringField
      FieldName = 'VRENUM'
      Required = True
    end
    object CpyDstKopfTabVLSNUM: TStringField
      FieldName = 'VLSNUM'
    end
    object CpyDstKopfTabFOLGENR: TIntegerField
      FieldName = 'FOLGENR'
    end
    object CpyDstKopfTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
    end
    object CpyDstKopfTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object CpyDstKopfTabVERTRETER_ID: TIntegerField
      FieldName = 'VERTRETER_ID'
    end
    object CpyDstKopfTabGLOBRABATT: TFloatField
      FieldName = 'GLOBRABATT'
    end
    object CpyDstKopfTabADATUM: TDateField
      FieldName = 'ADATUM'
    end
    object CpyDstKopfTabRDATUM: TDateField
      FieldName = 'RDATUM'
      Required = True
    end
    object CpyDstKopfTabLDATUM: TDateField
      FieldName = 'LDATUM'
    end
    object CpyDstKopfTabTermin: TDateField
      FieldName = 'TERMIN'
    end
    object CpyDstKopfTabPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
    end
    object CpyDstKopfTabLIEFART: TIntegerField
      FieldName = 'LIEFART'
    end
    object CpyDstKopfTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
    end
    object CpyDstKopfTabKOST_NETTO: TFloatField
      FieldName = 'KOST_NETTO'
    end
    object CpyDstKopfTabWERT_NETTO: TFloatField
      FieldName = 'WERT_NETTO'
    end
    object CpyDstKopfTabLOHN: TFloatField
      FieldName = 'LOHN'
    end
    object CpyDstKopfTabWARE: TFloatField
      FieldName = 'WARE'
    end
    object CpyDstKopfTabTKOST: TFloatField
      FieldName = 'TKOST'
    end
    object CpyDstKopfTabMWST_0: TFloatField
      FieldName = 'MWST_0'
    end
    object CpyDstKopfTabMWST_1: TFloatField
      FieldName = 'MWST_1'
    end
    object CpyDstKopfTabMWST_2: TFloatField
      FieldName = 'MWST_2'
    end
    object CpyDstKopfTabMWST_3: TFloatField
      FieldName = 'MWST_3'
    end
    object CpyDstKopfTabNSUMME: TFloatField
      FieldName = 'NSUMME'
    end
    object CpyDstKopfTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
    end
    object CpyDstKopfTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
    end
    object CpyDstKopfTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
    end
    object CpyDstKopfTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
    end
    object CpyDstKopfTabMSUMME: TFloatField
      FieldName = 'MSUMME'
    end
    object CpyDstKopfTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
    end
    object CpyDstKopfTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
    end
    object CpyDstKopfTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
    end
    object CpyDstKopfTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
    end
    object CpyDstKopfTabBSUMME: TFloatField
      FieldName = 'BSUMME'
    end
    object CpyDstKopfTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
    end
    object CpyDstKopfTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
    end
    object CpyDstKopfTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
    end
    object CpyDstKopfTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
    end
    object CpyDstKopfTabATSUMME: TFloatField
      FieldName = 'ATSUMME'
    end
    object CpyDstKopfTabATMSUMME: TFloatField
      FieldName = 'ATMSUMME'
    end
    object CpyDstKopfTabWAEHRUNG: TStringField
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object CpyDstKopfTabGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
    end
    object CpyDstKopfTabSOLL_STAGE: TIntegerField
      FieldName = 'SOLL_STAGE'
    end
    object CpyDstKopfTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
    end
    object CpyDstKopfTabSOLL_NTAGE: TIntegerField
      FieldName = 'SOLL_NTAGE'
    end
    object CpyDstKopfTabSOLL_RATEN: TIntegerField
      FieldName = 'SOLL_RATEN'
    end
    object CpyDstKopfTabSOLL_RATBETR: TFloatField
      FieldName = 'SOLL_RATBETR'
    end
    object CpyDstKopfTabSOLL_RATINTERVALL: TIntegerField
      FieldName = 'SOLL_RATINTERVALL'
    end
    object CpyDstKopfTabIST_ANZAHLUNG: TFloatField
      FieldName = 'IST_ANZAHLUNG'
    end
    object CpyDstKopfTabIST_SKONTO: TFloatField
      FieldName = 'IST_SKONTO'
    end
    object CpyDstKopfTabIST_ZAHLDAT: TDateField
      FieldName = 'IST_ZAHLDAT'
    end
    object CpyDstKopfTabIST_BETRAG: TFloatField
      FieldName = 'IST_BETRAG'
    end
    object CpyDstKopfTabMAHNKOSTEN: TFloatField
      FieldName = 'MAHNKOSTEN'
    end
    object CpyDstKopfTabKONTOAUSZUG: TIntegerField
      FieldName = 'KONTOAUSZUG'
    end
    object CpyDstKopfTabBANK_ID: TIntegerField
      FieldName = 'BANK_ID'
    end
    object CpyDstKopfTabSTADIUM: TIntegerField
      FieldName = 'STADIUM'
    end
    object CpyDstKopfTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object CpyDstKopfTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
    object CpyDstKopfTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Size = 40
    end
    object CpyDstKopfTabKUN_NAME1: TStringField
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object CpyDstKopfTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Size = 40
    end
    object CpyDstKopfTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Size = 40
    end
    object CpyDstKopfTabKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Size = 40
    end
    object CpyDstKopfTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Size = 40
    end
    object CpyDstKopfTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Size = 5
    end
    object CpyDstKopfTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Size = 10
    end
    object CpyDstKopfTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Size = 40
    end
    object CpyDstKopfTabUSR1: TStringField
      FieldName = 'USR1'
      Size = 80
    end
    object CpyDstKopfTabUSR2: TStringField
      FieldName = 'USR2'
      Size = 80
    end
    object CpyDstKopfTabPROJEKT: TStringField
      FieldName = 'PROJEKT'
      Size = 80
    end
    object CpyDstKopfTabORGNUM: TStringField
      FieldName = 'ORGNUM'
    end
    object CpyDstKopfTabBEST_NAME: TStringField
      FieldName = 'BEST_NAME'
      Size = 40
    end
    object CpyDstKopfTabBEST_CODE: TIntegerField
      FieldName = 'BEST_CODE'
    end
    object CpyDstKopfTabINFO: TMemoField
      FieldName = 'INFO'
      BlobType = ftMemo
    end
    object CpyDstKopfTabUW_NUM: TIntegerField
      FieldName = 'UW_NUM'
    end
    object CpyDstKopfTabKUN_NUM: TStringField
      FieldName = 'KUN_NUM'
    end
    object CpyDstKopfTabBEST_DATUM: TDateField
      FieldName = 'BEST_DATUM'
    end
    object CpyDstKopfTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object CpyDstKopfTabMAHNSTUFE: TIntegerField
      FieldName = 'MAHNSTUFE'
    end
    object CpyDstKopfTabMAHNDATUM: TDateField
      FieldName = 'MAHNDATUM'
    end
    object CpyDstKopfTabMAHNPRINT: TIntegerField
      FieldName = 'MAHNPRINT'
    end
    object CpyDstKopfTabFREIGABE1_FLAG: TBooleanField
      FieldName = 'FREIGABE1_FLAG'
      Required = True
    end
    object CpyDstKopfTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object CpyDstKopfTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object CpyDstKopfTabPROVIS_WERT: TFloatField
      FieldName = 'PROVIS_WERT'
    end
    object CpyDstKopfTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
    end
    object CpyDstKopfTabROHGEWINN: TFloatField
      FieldName = 'ROHGEWINN'
    end
  end
  object CpySrcPosTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from JOURNALPOS'
      'where JOURNAL_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 456
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object CpyDstPosTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from JOURNALPOS'
      'limit 0,1')
    Params = <>
    Left = 533
    Top = 67
  end
  object KasBuch: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from FIBU_KASSE'
      'limit 0,1')
    Params = <>
    Left = 26
    Top = 479
    object KasBuchBDATUM: TDateField
      FieldName = 'BDATUM'
      Required = True
    end
    object KasBuchQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object KasBuchJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
    end
    object KasBuchZU_ABGANG: TFloatField
      FieldName = 'ZU_ABGANG'
      Required = True
    end
    object KasBuchBTXT: TMemoField
      FieldName = 'BTXT'
      BlobType = ftMemo
    end
    object KasBuchBELEGNUM: TStringField
      FieldName = 'BELEGNUM'
    end
    object KasBuchGKONTO: TIntegerField
      FieldName = 'GKONTO'
    end
    object KasBuchSKONTO: TFloatField
      FieldName = 'SKONTO'
    end
    object KasBuchMA_ID: TIntegerField
      FieldName = 'MA_ID'
    end
    object KasBuchERSTELLT: TDateField
      FieldName = 'ERSTELLT'
    end
    object KasBuchERST_NAME: TStringField
      FieldName = 'ERST_NAME'
    end
  end
  object STListTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from ARTIKEL_STUECKLIST'
      'where REC_ID=:ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 325
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object STListTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object STListTabART_ID: TIntegerField
      FieldName = 'ART_ID'
      Required = True
      Visible = False
    end
    object STListTabMENGE: TFloatField
      DisplayLabel = 'Menge'
      FieldName = 'MENGE'
      DisplayFormat = '0.00'
    end
    object STListTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
      Visible = False
    end
    object STListTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
      Visible = False
    end
    object STListTabGEAEND: TDateField
      FieldName = 'GEAEND'
      Visible = False
    end
    object STListTabGEAEND_NAME: TStringField
      FieldName = 'GEAEND_NAME'
      Visible = False
    end
  end
  object KunTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from ADRESSEN'
      'where REC_ID = :ID'
      'limit 0,10')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 325
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object KunTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object KunTabKUNNUM1: TStringField
      FieldName = 'KUNNUM1'
    end
    object KunTabKUNNUM2: TStringField
      FieldName = 'KUNNUM2'
    end
    object KunTabDEB_NUM: TIntegerField
      FieldName = 'DEB_NUM'
    end
    object KunTabKRD_NUM: TIntegerField
      FieldName = 'KRD_NUM'
    end
    object KunTabSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object KunTabKUN_LIEFART: TIntegerField
      FieldName = 'KUN_LIEFART'
    end
    object KunTabKUN_ZAHLART: TIntegerField
      FieldName = 'KUN_ZAHLART'
    end
    object KunTabLIEF_LIEFART: TIntegerField
      FieldName = 'LIEF_LIEFART'
    end
    object KunTabLIEF_ZAHLART: TIntegerField
      FieldName = 'LIEF_ZAHLART'
    end
    object KunTabPR_EBENE: TIntegerField
      FieldName = 'PR_EBENE'
    end
    object KunTabLAND: TStringField
      FieldName = 'LAND'
      Size = 5
    end
    object KunTabNAME1: TStringField
      FieldName = 'NAME1'
      Size = 40
    end
    object KunTabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object KunTabORT: TStringField
      FieldName = 'ORT'
      Size = 40
    end
    object KunTabNAME2: TStringField
      FieldName = 'NAME2'
      Size = 40
    end
    object KunTabNAME3: TStringField
      FieldName = 'NAME3'
      Size = 40
    end
    object KunTabANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 40
    end
    object KunTabSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 40
    end
    object KunTabKTO_INHABER: TStringField
      FieldName = 'KTO_INHABER'
      Size = 40
    end
    object KunTabBLZ: TStringField
      FieldName = 'BLZ'
      Size = 8
    end
    object KunTabKTO: TStringField
      FieldName = 'KTO'
      Size = 10
    end
    object KunTabBANK: TStringField
      FieldName = 'BANK'
      Size = 40
    end
    object KunTabEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object KunTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object KunTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object KunTabDEFAULT_LIEFANSCHRIFT_ID: TIntegerField
      FieldName = 'DEFAULT_LIEFANSCHRIFT_ID'
    end
    object KunTabUST_NUM: TStringField
      FieldName = 'UST_NUM'
      Size = 25
    end
    object KunTabFAX: TStringField
      FieldName = 'FAX'
      Size = 100
    end
    object KunTabBRIEFANREDE: TStringField
      FieldName = 'BRIEFANREDE'
      Size = 100
    end
  end
  object CreateMandantStr: TJvStrHolder
    Capacity = 2118
    Macros = <>
    Duplicates = dupAccept
    Left = 644
    Top = 67
    InternalVer = 1
    StrData = (
      ''
      '23'
      
        '2320486f73743a203139322e3136382e322e3130302020204461746162617365' +
        '3a2043414f5f44425f313130'
      '23205374616e64203a2032342e31312e32303034202f204a50'
      
        '23202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d' +
        '2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d'
      '23'
      
        '232044617461626173653a2043414f5f44425f313130205374616e642032342e' +
        '31312e32303034'
      '23'
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027414452' +
        '455353454e27'
      '23'
      ''
      '435245415445205441424c4520414452455353454e2028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204d41544348434f444520766172636861722832353529204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '20204b554e44454e47525550504520696e7428313129204e4f54204e554c4c20' +
        '64656661756c74202730272c'
      
        '20205350524143485f494420696e7428313129204e4f54204e554c4c20646566' +
        '61756c74202732272c'
      
        '202047455343484c454348542043484152283129204e4f54204e554c4c204445' +
        '4641554c5420222d222c'
      
        '20204b554e4e554d312076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e4e554d322076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204e414d45312076617263686172283430292064656661756c74204e554c4c' +
        '2c'
      '2020504c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204f52542076617263686172283430292064656661756c74204e554c4c2c'
      '20204c414e4420766172636861722835292064656661756c74204e554c4c2c'
      
        '20204e414d45322076617263686172283430292064656661756c74204e554c4c' +
        '2c'
      
        '20204e414d45332076617263686172283430292064656661756c74204e554c4c' +
        '2c'
      
        '202041425445494c554e472076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '2020414e524544452076617263686172283430292064656661756c74204e554c' +
        '4c2c'
      
        '2020535452415353452076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      
        '2020504f5354464143482076617263686172283430292064656661756c74204e' +
        '554c4c2c'
      
        '202050465f504c5a2076617263686172283130292064656661756c74204e554c' +
        '4c2c'
      
        '202044454641554c545f4c494546414e534348524946545f494420696e742831' +
        '3129204e4f54204e554c4c2064656661756c7420272d31272c'
      
        '202047525550504520766172636861722834292064656661756c74204e554c4c' +
        '2c'
      
        '202054454c4531207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '202054454c4532207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      '2020464158207661726368617228313030292064656661756c74204e554c4c2c'
      
        '202046554e4b207661726368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020454d41494c207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '2020454d41494c32207661726368617228313030292064656661756c74204e55' +
        '4c4c2c'
      
        '2020494e5445524e4554207661726368617228313030292064656661756c7420' +
        '4e554c4c2c'
      
        '20204449564552534553207661726368617228313030292064656661756c7420' +
        '4e554c4c2c'
      
        '20204252494546414e5245444520766172636861722831303029206465666175' +
        '6c74204e554c4c2c'
      '2020424c5a2076617263686172283230292064656661756c74204e554c4c2c'
      '20204b544f2076617263686172283230292064656661756c74204e554c4c2c'
      '202042414e4b2076617263686172283430292064656661756c74204e554c4c2c'
      
        '20204942414e207661726368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '20205357494654207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '20204b544f5f494e48414245522076617263686172283430292064656661756c' +
        '74204e554c4c2c'
      '20204445425f4e554d20696e74283131292064656661756c74204e554c4c2c'
      '20204b52445f4e554d20696e74283131292064656661756c74204e554c4c2c'
      '202053544154555320696e74283131292064656661756c74204e554c4c2c'
      
        '20204e45545f534b4f4e544f20646563696d616c28352c32292064656661756c' +
        '74204e554c4c2c'
      
        '20204e45545f544147452074696e79696e742834292064656661756c74204e55' +
        '4c4c2c'
      
        '20204252545f544147452074696e79696e742834292064656661756c74204e55' +
        '4c4c2c'
      '20205741454852554e472076617263686172283529204e4f54204e554c4c2c'
      
        '20205553545f4e554d2076617263686172283235292064656661756c74204e55' +
        '4c4c2c'
      
        '20205645525452455445525f494420696e742831312920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      
        '202050524f5649535f50524f5a20646563696d616c28352c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      '2020494e464f20746578742c'
      
        '20204752414241545420646563696d616c28352c32292064656661756c74204e' +
        '554c4c2c'
      
        '20204b554e5f4b52444c494d495420646563696d616c2831302c322920646566' +
        '61756c74204e554c4c2c'
      
        '20204b554e5f4c49454641525420696e7428313129204e4f54204e554c4c2064' +
        '656661756c7420272d31272c'
      
        '20204b554e5f5a41484c41525420696e7428313129204e4f54204e554c4c2064' +
        '656661756c7420272d31272c'
      
        '20204b554e5f50524c4953544520656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '20204b554e5f4c49454653504552524520656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      
        '20204c4945465f4c49454641525420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '20204c4945465f5a41484c41525420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '20204c4945465f50524c4953544520656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '20204c4945465f544b4f5354454e20646563696d616c2831302c3229204e4f54' +
        '204e554c4c2064656661756c742027302e3030272c'
      
        '20204c4945465f4d425745525420646563696d616c2831302c3229204e4f5420' +
        '4e554c4c2064656661756c742027302e3030272c'
      
        '202050525f4542454e452074696e79696e742831292064656661756c74202735' +
        '272c'
      
        '202042525554544f5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '20204d5753545f465245495f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      '20204b554e5f5345495420646174652064656661756c74204e554c4c2c'
      
        '20204b554e5f474542444154554d20646174652064656661756c74204e554c4c' +
        '2c'
      
        '2020454e544645524e554e4720696e742831302920756e7369676e6564206465' +
        '6661756c74204e554c4c2c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      '2020474541454e4420646174652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '202053484f505f4b554e444520656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '202053484f505f4b554e44455f494420696e7428313129204e4f54204e554c4c' +
        '2064656661756c7420272d31272c'
      
        '202053484f505f4348414e47455f464c41472074696e79696e7428312920756e' +
        '7369676e6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '202053484f505f44454c5f464c414720656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '202053484f505f50415353574f52442076617263686172283230292064656661' +
        '756c74204e554c4c2c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b4559204944585f4b554e4e554d3120284b554e4e554d31292c'
      '20204b4559204944585f4d4154434820284d41544348434f444529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027414452' +
        '455353454e5f41535027'
      '23'
      ''
      '435245415445205441424c4520414452455353454e5f4153502028'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204e414d45207661726368617228343029204e4f54204e554c4c2064656661' +
        '756c742027272c'
      
        '2020564f524e414d45207661726368617228343029204e4f54204e554c4c2064' +
        '656661756c742027272c'
      
        '2020414e524544452076617263686172283430292064656661756c74204e554c' +
        '4c2c'
      
        '2020535452415353452076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      '20204c414e4420766172636861722835292064656661756c74202744272c'
      '2020504c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204f52542076617263686172283430292064656661756c74204e554c4c2c'
      
        '202046554e4b54494f4e2076617263686172283430292064656661756c74204e' +
        '554c4c2c'
      
        '202054454c45464f4e207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '202054454c45464158207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '20204d4f42494c46554e4b207661726368617228313030292064656661756c74' +
        '204e554c4c2c'
      
        '202054454c45505249564154207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '2020454d41494c207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '2020454d41494c3220766172636861722831303029204e4f54204e554c4c2064' +
        '656661756c742027272c'
      '2020494e464f20746578742c'
      '2020474542444154554d20646174652064656661756c74204e554c4c2c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020285245435f4944292c'
      
        '20204b4559204e414d452028414444525f49442c4e414d452c564f524e414d45' +
        '29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027414452' +
        '455353454e5f4c49454627'
      '23'
      ''
      '435245415445205441424c4520414452455353454e5f4c4945462028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '2020414e524544452076617263686172283430292064656661756c74204e554c' +
        '4c2c'
      
        '20204e414d4531207661726368617228343029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      
        '20204e414d45322076617263686172283430292064656661756c74204e554c4c' +
        '2c'
      
        '20204e414d45332076617263686172283430292064656661756c74204e554c4c' +
        '2c'
      
        '202041425445494c554e472076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '202053545241535345207661726368617228343029204e4f54204e554c4c2064' +
        '656661756c742027272c'
      '20204c414e4420766172636861722835292064656661756c74204e554c4c2c'
      
        '2020504c5a207661726368617228313029204e4f54204e554c4c206465666175' +
        '6c742027272c'
      
        '20204f5254207661726368617228343029204e4f54204e554c4c206465666175' +
        '6c742027272c'
      '2020494e464f20746578742c'
      '20205052494d415259204b45592020285245435f49442c414444525f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027414452' +
        '455353454e5f4d45524b27'
      '23'
      ''
      '435245415445205441424c4520414452455353454e5f4d45524b2028'
      
        '20204d45524b4d414c5f494420696e7428313129204e4f54204e554c4c206175' +
        '746f5f696e6372656d656e742c'
      
        '20204e414d4520766172636861722831303029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '20205052494d415259204b45592020284d45524b4d414c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027414452' +
        '455353454e5f544f5f4d45524b27'
      '23'
      ''
      '435245415445205441424c4520414452455353454e5f544f5f4d45524b2028'
      
        '20204d45524b4d414c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020414444525f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      
        '20205052494d415259204b45592020284d45524b4d414c5f49442c414444525f' +
        '494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c2028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204152544e554d2076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '202045525341545a5f4152544e554d2076617263686172283230292064656661' +
        '756c74204e554c4c2c'
      
        '20204d41544348434f4445207661726368617228323535292064656661756c74' +
        '204e554c4c2c'
      
        '2020574152454e47525550504520696e7428313129204e4f54204e554c4c2064' +
        '656661756c74202730272c'
      
        '20205241424752505f4944207661726368617228313029204e4f54204e554c4c' +
        '2064656661756c7420272d272c'
      
        '2020424152434f44452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '2020424152434f4445322076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '2020424152434f4445332076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '2020415254494b454c5459502063686172283129204e4f54204e554c4c206465' +
        '6661756c7420274e272c'
      
        '20204b55525a4e414d452076617263686172283830292064656661756c74204e' +
        '554c4c2c'
      '20204c414e474e414d4520746578742c'
      
        '20204b41535f4e414d452076617263686172283830292064656661756c74204e' +
        '554c4c2c'
      '2020494e464f20746578742c'
      
        '20204d455f45494e484549542076617263686172283130292064656661756c74' +
        '20275374fc636b272c'
      
        '202056504520696e7428313129204e4f54204e554c4c2064656661756c742027' +
        '31272c'
      
        '202050525f45494e4845495420646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204c41454e47452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '20204252454954452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020484f4548452076617263686172283230292064656661756c74204e554c4c' +
        '2c'
      
        '202047524f455353452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '202044494d454e53494f4e2076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204745574943485420646563696d616c2831302c3329204e4f54204e554c4c' +
        '2064656661756c742027302e303030272c'
      
        '2020494e56454e5455525f5745525420646563696d616c28352c3229204e4f54' +
        '204e554c4c2064656661756c7420273130302e3030272c'
      
        '2020454b5f505245495320646563696d616c2831322c3429204e4f54204e554c' +
        '4c2064656661756c742027302e30303030272c'
      
        '2020564b3120646563696d616c2831322c3429204e4f54204e554c4c20646566' +
        '61756c742027302e30303030272c'
      
        '2020564b314220646563696d616c2831322c3429204e4f54204e554c4c206465' +
        '6661756c742027302e30303030272c'
      
        '2020564b3220646563696d616c2831322c3429204e4f54204e554c4c20646566' +
        '61756c742027302e30303030272c'
      
        '2020564b324220646563696d616c2831322c3429204e4f54204e554c4c206465' +
        '6661756c742027302e30303030272c'
      
        '2020564b3320646563696d616c2831322c3429204e4f54204e554c4c20646566' +
        '61756c742027302e30303030272c'
      
        '2020564b334220646563696d616c2831322c3429204e4f54204e554c4c206465' +
        '6661756c742027302e30303030272c'
      
        '2020564b3420646563696d616c2831322c3429204e4f54204e554c4c20646566' +
        '61756c742027302e30303030272c'
      
        '2020564b344220646563696d616c2831322c3429204e4f54204e554c4c206465' +
        '6661756c742027302e30303030272c'
      
        '2020564b3520646563696d616c2831322c3429204e4f54204e554c4c20646566' +
        '61756c742027302e30303030272c'
      
        '2020564b354220646563696d616c2831322c3429204e4f54204e554c4c206465' +
        '6661756c742027302e30303030272c'
      
        '20204d415852414241545420646563696d616c28352c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d494e474557494e4e20646563696d616c28352c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '202050524f5649535f50524f5a20646563696d616c28352c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20205354455545525f434f44452074696e79696e74283429204e4f54204e554c' +
        '4c2064656661756c74202732272c'
      
        '2020414c545445494c5f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '20204e4f5f5241424154545f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      
        '20204e4f5f50524f564953494f4e5f464c414720656e756d28274e272c275927' +
        '29204e4f54204e554c4c2064656661756c7420274e272c'
      
        '20204e4f5f42455a454449545f464c414720656e756d28274e272c2759272920' +
        '4e4f54204e554c4c2064656661756c7420274e272c'
      
        '20204e4f5f454b5f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '20204e4f5f564b5f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '2020534e5f464c414720656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '20204155544f44454c5f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '20204b4f4d4d4953494f4e5f464c414720656e756d28274e272c275927292064' +
        '656661756c7420274e272c'
      
        '20204c495a454e5a5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '202050524f44554b54494f4e5f464c414720656e756d28274e272c2759272920' +
        '4e4f54204e554c4c2064656661756c7420274e272c'
      
        '202050524f445f444155455220696e7428352920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c7420273134272c'
      
        '20204d454e47455f535441525420646563696d616c2831322c3429204e4f5420' +
        '4e554c4c2064656661756c742027302e30303030272c'
      
        '20204d454e47455f414b5420646563696d616c2831322c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '20204d454e47455f4d494e20646563696d616c2831322c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '20204d454e47455f42564f5220646563696d616c2831322c3429204e4f54204e' +
        '554c4c2064656661756c742027302e30303030272c'
      
        '202044454641554c545f4c4945465f494420696e7428313129204e4f54204e55' +
        '4c4c2064656661756c7420272d31272c'
      
        '202045524c4f45535f4b544f20696e74283131292064656661756c74204e554c' +
        '4c2c'
      '2020415546575f4b544f20696e74283131292064656661756c74204e554c4c2c'
      
        '20204845524b554e4654534c414e4420636861722833292064656661756c7420' +
        '4e554c4c2c'
      
        '20204845525354454c4c45525f494420696e7428313129204e4f54204e554c4c' +
        '2064656661756c7420272d31272c'
      
        '202048455253545f4152544e554d207661726368617228313030292064656661' +
        '756c74204e554c4c2c'
      
        '20204c414745524f52542076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '20204554494b4554545f5052494e542074696e79696e7428332920756e736967' +
        '6e6564204e4f54204e554c4c2064656661756c74202730272c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      '2020474541454e4420646174652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '202053484f505f49442074696e79696e74283429204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '202053484f505f415254494b454c5f494420696e7428313129204e4f54204e55' +
        '4c4c2064656661756c7420272d31272c'
      '202053484f505f4b55525a5445585420746578742c'
      '202053484f505f4c414e475445585420746578742c'
      
        '202053484f505f494d414745207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '202053484f505f494d4147455f4d454420766172636861722831303029206465' +
        '6661756c74204e554c4c2c'
      
        '202053484f505f494d4147455f4c415247452076617263686172283130302920' +
        '64656661756c74204e554c4c2c'
      
        '202053484f505f444154454e424c415454207661726368617228313030292064' +
        '656661756c74204e554c4c2c'
      
        '202053484f505f4b4154414c4f47207661726368617228313030292064656661' +
        '756c74204e554c4c2c'
      
        '202053484f505f5a454943484e554e4720766172636861722831303029206465' +
        '6661756c74204e554c4c2c'
      
        '202053484f505f48414e44425543482076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '202041555353434852454942554e475354455854207661726368617228313030' +
        '292064656661756c74204e554c4c2c'
      
        '202053484f505f50524549535f4c4953544520646563696d616c2831322c3429' +
        '204e4f54204e554c4c2064656661756c742027302e30303030272c'
      
        '202053484f505f56495349424c4520696e742831292064656661756c74202731' +
        '272c'
      
        '202053484f505f444154455f4e455520646174652064656661756c74204e554c' +
        '4c2c'
      
        '202053484f505f4641454c4c545f5745475f414220646174652064656661756c' +
        '74204e554c4c2c'
      
        '202053484f505f434c49434b5f434f554e5420696e7428313129206465666175' +
        '6c74202730272c'
      
        '202053484f505f53594e432074696e79696e7428312920756e7369676e656420' +
        '64656661756c74202730272c'
      
        '202053484f505f5a55422074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202053484f505f4348414e47455f44415445206461746574696d652064656661' +
        '756c74204e554c4c2c'
      
        '202053484f505f4348414e47455f464c41472074696e79696e7428312920756e' +
        '7369676e6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '202053484f505f44454c5f464c414720656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '202053484f505f50415353574f52442076617263686172283230292064656661' +
        '756c74204e554c4c2c'
      
        '202053484f505f4d4554415f544954454c207661726368617228323535292064' +
        '656661756c74204e554c4c2c'
      '202053484f505f4d4554415f42455343485220746578742c'
      
        '202053484f505f4d4554415f4b45592076617263686172283235352920646566' +
        '61756c74204e554c4c2c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b4559204944585f5747522028574152454e475255505045292c'
      '20204b4559204944585f4d41544348434f444520284d41544348434f4445292c'
      '20204b4559204944585f424152434f44452028424152434f4445292c'
      '20204b4559204944585f4152544e554d20284152544e554d292c'
      
        '20204b4559204944585f48455253545f4152544e554d202848455253545f4152' +
        '544e554d29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f42444154454e27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f42444154454e2028'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20205155454c4c452074696e79696e7428322920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '20204a41485220696e7428342920756e7369676e6564204e4f54204e554c4c20' +
        '64656661756c74202730272c'
      
        '20204d4f4e41542074696e79696e7428322920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '202053554d5f4d454e474520646563696d616c2831322c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '20205052494d415259204b4559202028415254494b454c5f49442c5155454c4c' +
        '452c4a4148522c4d4f4e4154292c'
      
        '20204b4559204944585f5155454c4c4520285155454c4c452c415254494b454c' +
        '5f494429'
      
        '2920434f4d4d454e543d274265776567756e6773646174656e20646572204172' +
        '74696b656c273b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f4554494b45545427'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f4554494b4554542028'
      
        '20205245435f494420696e742831312920756e7369676e6564204e4f54204e55' +
        '4c4c206175746f5f696e6372656d656e742c'
      
        '2020415254494b454c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020414e5a41484c2074696e79696e7428332920756e7369676e656420646566' +
        '61756c74202731272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204745445255434b5420656e756d28274e272c275927292064656661756c74' +
        '20274e272c'
      '20205052494d415259204b45592020285245435f494429'
      
        '2920434f4d4d454e543d27417274696b656c2d4574696b657474656e64727563' +
        '6b273b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f494e56454e54555227'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f494e56454e5455522028'
      
        '2020494e56454e5455525f494420696e7428352920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020415254494b454c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020574152454e47525550504520696e742831312920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '20204152544e554d207661726368617228323530292064656661756c74204e55' +
        '4c4c2c'
      
        '20204d41544348434f4445207661726368617228323530292064656661756c74' +
        '204e554c4c2c'
      
        '2020424152434f4445207661726368617228323530292064656661756c74204e' +
        '554c4c2c'
      
        '20204b55525a54455854207661726368617228323530292064656661756c7420' +
        '4e554c4c2c'
      
        '20204d454e47455f49535420646563696d616c2831322c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '20204d454e47455f534f4c4c20646563696d616c2831322c3429204e4f54204e' +
        '554c4c2064656661756c742027302e30303030272c'
      
        '20204d454e47455f4449464620646563696d616c2831322c3429204e4f54204e' +
        '554c4c2064656661756c742027302e30303030272c'
      
        '2020494e56454e5455525f5745525420646563696d616c28362c3329204e4f54' +
        '204e554c4c2064656661756c742027302e303030272c'
      
        '2020454b5f505245495320646563696d616c2831322c3429204e4f54204e554c' +
        '4c2064656661756c742027302e30303030272c'
      
        '20205354415455532074696e79696e7428312920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '2020424541524245495445522076617263686172283530292064656661756c74' +
        '204e554c4c2c'
      
        '20205052494d415259204b4559202028494e56454e5455525f49442c41525449' +
        '4b454c5f4944292c'
      
        '20204b4559204944585f4b55525a544558542028494e56454e5455525f49442c' +
        '574152454e4752555050452c4b55525a5445585429'
      
        '2920434f4d4d454e543d27417274696b656c646174656e2066fc7220496e7665' +
        '6e747572273b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f4b415427'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f4b41542028'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020494420696e7428313129204e4f54204e554c4c206175746f5f696e637265' +
        '6d656e742c'
      
        '2020544f505f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '2020534f52545f4e554d20696e7428332920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      
        '20204e414d4520766172636861722832353029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '202055524c207661726368617228323530292064656661756c74204e554c4c2c'
      '2020424553434852454942554e4720746578742c'
      
        '2020494d414745207661726368617228323530292064656661756c74204e554c' +
        '4c2c'
      
        '202056495349424c455f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c74202759272c'
      '20204c4945465f494420696e74283133292064656661756c7420272d31272c'
      
        '2020415254494b454c5f54454d504c4154452076617263686172283235302920' +
        '64656661756c7420276e6f726d616c2e74706c272c'
      
        '20204752555050454e5f54454d504c4154452076617263686172283235302920' +
        '64656661756c7420276772705f6e6f726d616c2e74706c272c'
      
        '2020434c49434b5f434f554e5420696e74283131292064656661756c74202730' +
        '272c'
      
        '20204c4153545f49502076617263686172283136292064656661756c74204e55' +
        '4c4c2c'
      
        '202053594e435f464c414720656e756d28274e272c27592729204e4f54204e55' +
        '4c4c2064656661756c7420274e272c'
      
        '20204348414e47455f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202044454c5f464c414720656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      '20205052494d415259204b455920202853484f505f49442c4944292c'
      '20204b4559204944585f49442028494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f4c5445585427'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f4c544558542028'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020535052414348455f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '20204b55525a4e414d452076617263686172283830292064656661756c74204e' +
        '554c4c2c'
      '20204c414e474e414d4520746578742c'
      
        '20204b41535f4e414d452076617263686172283830292064656661756c74204e' +
        '554c4c2c'
      '202053484f505f4b55525a5445585420746578742c'
      '202053484f505f4c414e475445585420746578742c'
      
        '202053484f505f444154454e424c415454207661726368617228313030292064' +
        '656661756c74204e554c4c2c'
      
        '202053484f505f4b4154414c4f47207661726368617228313030292064656661' +
        '756c74204e554c4c2c'
      
        '202053484f505f5a454943484e554e4720766172636861722831303029206465' +
        '6661756c74204e554c4c2c'
      
        '202053484f505f48414e44425543482076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '202053484f505f4d4554415f544954454c207661726368617228323535292064' +
        '656661756c74204e554c4c2c'
      
        '202053484f505f4d4554415f4b45592076617263686172283235352920646566' +
        '61756c74204e554c4c2c'
      '202053484f505f4d4554415f42455343485220746578742c'
      
        '20204348414e47455f464c41472074696e79696e7428312920756e7369676e65' +
        '64204e4f54204e554c4c2064656661756c74202730272c'
      
        '20205052494d415259204b4559202028415254494b454c5f49442c5350524143' +
        '48455f4944292c'
      
        '20204b4559204944585f415254494b454c5f49442028415254494b454c5f4944' +
        '292c'
      
        '20204b4559204944585f535052414348455f49442028535052414348455f4944' +
        '292c'
      
        '20204b4559204944585f415254494b454c5f535052414348452028415254494b' +
        '454c5f49442c535052414348455f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f4d45524b27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f4d45524b2028'
      
        '20204d45524b4d414c5f494420696e7428313129204e4f54204e554c4c206175' +
        '746f5f696e6372656d656e742c'
      
        '20204e414d4520766172636861722831303029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '20205052494d415259204b45592020284d45524b4d414c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f505245495327'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f50524549532028'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204144524553535f494420696e7428313129204e4f54204e554c4c20646566' +
        '61756c7420272d31272c'
      
        '202050524549535f5459502074696e79696e7428322920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      
        '202050543220656e756d2827454b272c27564b272c27564b31272c27564b3227' +
        '2c27564b33272c27564b34272c27564b35272c2741502729204e4f54204e554c' +
        '4c2064656661756c742027454b272c'
      
        '2020424553544e554d2076617263686172283530292064656661756c74204e55' +
        '4c4c2c'
      
        '202056504520696e742831312920756e7369676e6564204e4f54204e554c4c20' +
        '64656661756c74202730272c'
      
        '2020505245495320646563696d616c2831322c3429204e4f54204e554c4c2064' +
        '656661756c742027302e30303030272c'
      
        '202052414241545420646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d454e47453220696e7428362920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '202050524549533220646563696d616c2831322c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '20205052454953325f4155544f20656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202046414b544f523220646563696d616c28382c3529204e4f54204e554c4c20' +
        '64656661756c742027302e3030303030272c'
      
        '20204d454e47453320696e7428362920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '202050524549533320646563696d616c2831322c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '20205052454953335f4155544f20656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202046414b544f523320646563696d616c28382c3529204e4f54204e554c4c20' +
        '64656661756c742027302e3030303030272c'
      
        '20204d454e47453420696e7428362920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '202050524549533420646563696d616c2831322c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '20205052454953345f4155544f20656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202046414b544f523420646563696d616c28382c3529204e4f54204e554c4c20' +
        '64656661756c742027302e3030303030272c'
      
        '20204d454e47453520696e7428362920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '202050524549533520646563696d616c2831322c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '20205052454953355f4155544f20656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202046414b544f523520646563696d616c28382c3529204e4f54204e554c4c20' +
        '64656661756c742027302e3030303030272c'
      '20204755454c5449475f564f4e20646174652064656661756c74204e554c4c2c'
      '20204755454c5449475f42495320646174652064656661756c74204e554c4c2c'
      '2020494e464f20746578742c'
      '2020474541454e442074696d657374616d7028313429204e4f54204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '20205052494d415259204b4559202028415254494b454c5f49442c4144524553' +
        '535f49442c50524549535f54595029'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f5345524e554d27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f5345524e554d2028'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '20205345524e554d4d455220766172636861722832353529204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '2020534e554d5f494420696e7428313129204e4f54204e554c4c206175746f5f' +
        '696e6372656d656e742c'
      
        '202053544154555320656e756d28274c41474552272c27564b5f4c494546272c' +
        '27564b5f52454348272c27524d415f4948272c27524d415f4148272c27524d41' +
        '5f4154272c27494e565f444956272c27454b5f4544492729204e4f54204e554c' +
        '4c2064656661756c7420274c41474552272c'
      '20205052494d415259204b4559202028534e554d5f4944292c'
      
        '2020554e49515545204b4559205345524e554d4d455220285345524e554d4d45' +
        '522c415254494b454c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f53545545434b4c49535427'
      '23'
      ''
      
        '435245415445205441424c4520415254494b454c5f53545545434b4c49535420' +
        '28'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '74202730272c'
      
        '20204152545f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '74202730272c'
      
        '2020415254494b454c5f41525420656e756d282753544c272c27534554272c27' +
        '5a5542272c274552532729204e4f54204e554c4c2064656661756c7420275354' +
        '4c272c'
      
        '2020504f534954494f4e207661726368617228313029204e4f54204e554c4c20' +
        '64656661756c742027272c'
      
        '20204d454e474520646563696d616c2831302c34292064656661756c74202230' +
        '2e3030303022204e4f54204e554c4c2c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      '2020474541454e4420646174652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '20205052494d415259204b45592020285245435f49442c4152545f49442c4152' +
        '54494b454c5f41525429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f544f5f4b415427'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f544f5f4b41542028'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020415254494b454c5f494420696e7428313329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204b41545f494420696e7428313329204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20204348414e47455f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '202044454c5f464c414720656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '20205052494d415259204b455920202853484f505f49442c415254494b454c5f' +
        '49442c4b41545f4944292c'
      
        '20204b4559204b41545f544f5f415254494b454c202853484f505f49442c4b41' +
        '545f49442c415254494b454c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f544f5f4d45524b27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f544f5f4d45524b2028'
      
        '20204d45524b4d414c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020415254494b454c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '20205052494d415259204b45592020284d45524b4d414c5f49442c415254494b' +
        '454c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c65202742454e' +
        '55545a455252454348544527'
      '23'
      ''
      '435245415445205441424c452042454e55545a45525245434854452028'
      
        '20204752555050454e5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020555345525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '20204d4f44554c5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20204d4f44554c5f4e414d45207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '20205355424d4f44554c5f494420696e7428313129204e4f54204e554c4c2064' +
        '656661756c74202730272c'
      
        '20205355424d4f44554c5f4e414d452076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '202052454348544520626967696e742831362920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '202042454d45524b554e47207661726368617228323530292064656661756c74' +
        '204e554c4c2c'
      
        '20205052494d415259204b45592020284752555050454e5f49442c555345525f' +
        '49442c4d4f44554c5f49442c5355424d4f44554c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027424c5a' +
        '27'
      '23'
      ''
      '435245415445205441424c4520424c5a2028'
      
        '20204c414e442076617263686172283529204e4f54204e554c4c206465666175' +
        '6c7420274445272c'
      
        '2020424c5a20696e7428313029204e4f54204e554c4c2064656661756c742027' +
        '30272c'
      
        '202042414e4b5f4e414d4520766172636861722832353529204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '202050525a2063686172283229204e4f54204e554c4c2064656661756c742027' +
        '272c'
      '20205052494d415259204b45592020284c414e442c424c5a292c'
      
        '20204b4559204944585f4e414d4520284c414e442c42414e4b5f4e414d452c42' +
        '4c5a29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027455850' +
        '4f525427'
      '23'
      ''
      '435245415445205441424c45204558504f52542028'
      
        '2020494420696e7428313129204e4f54204e554c4c206175746f5f696e637265' +
        '6d656e742c'
      
        '20204b55525a42455a20766172636861722832353529204e4f54204e554c4c20' +
        '64656661756c742027272c'
      '2020494e464f2074657874204e4f54204e554c4c2c'
      '202051554552592074657874204e4f54204e554c4c2c'
      '202046454c44455220746578742c'
      '2020464f524d554c415220626c6f622c'
      '2020464f524d415420636861722833292064656661756c74204e554c4c2c'
      
        '202046494c454e414d45207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '20204c4153545f4348414e47452074696d657374616d7028313429204e4f5420' +
        '4e554c4c2c'
      
        '20204348414e47455f4e414d4520766172636861722831303029206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b4559202028494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027464942' +
        '555f4b4153534527'
      '23'
      ''
      '435245415445205441424c4520464942555f4b415353452028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      
        '20204a41485220696e7428313129204e4f54204e554c4c2064656661756c7420' +
        '2730272c'
      
        '202042444154554d2064617465204e4f54204e554c4c2064656661756c742027' +
        '303030302d30302d3030272c'
      
        '202042454c45474e554d2076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '20205155454c4c4520696e7428313129204e4f54204e554c4c2064656661756c' +
        '74202730272c'
      
        '20204a4f55524e414c5f494420696e74283131292064656661756c74204e554c' +
        '4c2c'
      '2020474b4f4e544f20696e74283131292064656661756c7420272d31272c'
      
        '2020534b4f4e544f20646563696d616c28352c33292064656661756c74202730' +
        '2e303030272c'
      
        '20205a555f414247414e4720646563696d616c2831322c3229204e4f54204e55' +
        '4c4c2064656661756c742027302e3030272c'
      '20204254585420746578742c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20205052494d415259204b45592020284a4148522c42444154554d2c5245435f' +
        '4944292c'
      '20204b4559204944585f5245435f494420285245435f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027464952' +
        '4d4127'
      '23'
      ''
      '435245415445205441424c45204649524d412028'
      
        '2020414e52454445207661726368617228323530292064656661756c74204e55' +
        '4c4c2c'
      
        '20204e414d4531207661726368617228323530292064656661756c74204e554c' +
        '4c2c'
      
        '20204e414d4532207661726368617228323530292064656661756c74204e554c' +
        '4c2c'
      
        '20204e414d4533207661726368617228323530292064656661756c74204e554c' +
        '4c2c'
      
        '202053545241535345207661726368617228323530292064656661756c74204e' +
        '554c4c2c'
      '20204c414e442076617263686172283130292064656661756c74204e554c4c2c'
      '2020504c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204f5254207661726368617228323530292064656661756c74204e554c4c2c'
      
        '2020564f525741484c207661726368617228323530292064656661756c74204e' +
        '554c4c2c'
      
        '202054454c45464f4e31207661726368617228323530292064656661756c7420' +
        '4e554c4c2c'
      
        '202054454c45464f4e32207661726368617228323530292064656661756c7420' +
        '4e554c4c2c'
      
        '20204d4f42494c46554e4b207661726368617228323530292064656661756c74' +
        '204e554c4c2c'
      '2020464158207661726368617228323530292064656661756c74204e554c4c2c'
      
        '2020454d41494c207661726368617228323530292064656661756c74204e554c' +
        '4c2c'
      
        '20205745425345495445207661726368617228323530292064656661756c7420' +
        '4e554c4c2c'
      
        '202042414e4b315f424c5a20766172636861722838292064656661756c74204e' +
        '554c4c2c'
      
        '202042414e4b315f4b4f4e544f4e522076617263686172283132292064656661' +
        '756c74204e554c4c2c'
      
        '202042414e4b315f4e414d45207661726368617228323530292064656661756c' +
        '74204e554c4c2c'
      
        '202042414e4b315f4942414e207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '202042414e4b315f535749465420766172636861722831303029206465666175' +
        '6c74204e554c4c2c'
      
        '202042414e4b325f424c5a20766172636861722838292064656661756c74204e' +
        '554c4c2c'
      
        '202042414e4b325f4b4f4e544f4e522076617263686172283132292064656661' +
        '756c74204e554c4c2c'
      
        '202042414e4b325f4e414d45207661726368617228323530292064656661756c' +
        '74204e554c4c2c'
      
        '202042414e4b325f4942414e207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '202042414e4b325f535749465420766172636861722831303029206465666175' +
        '6c74204e554c4c2c'
      '20204b4f50465445585420746578742c'
      '2020465553535445585420746578742c'
      
        '2020414253454e444552207661726368617228323530292064656661756c7420' +
        '4e554c4c2c'
      
        '20205354455545524e554d4d4552207661726368617228323529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553545f49442076617263686172283235292064656661756c74204e554c' +
        '4c2c'
      '2020494d4147453120626c6f622c'
      '2020494d4147453220626c6f622c'
      '2020494d4147453320626c6f62'
      
        '2920434f4d4d454e543d27416c6c67656d65696e65204669726d656e64617465' +
        '6e2066fc7220466f726d756c617265273b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027484552' +
        '5354454c4c455227'
      '23'
      ''
      '435245415445205441424c45204845525354454c4c45522028'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204845525354454c4c45525f494420696e7428313129204e4f54204e554c4c' +
        '206175746f5f696e6372656d656e742c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204845525354454c4c45525f4e414d45207661726368617228333229204e4f' +
        '54204e554c4c2064656661756c742027272c'
      
        '20204845525354454c4c45525f494d4147452076617263686172283634292064' +
        '656661756c74204e554c4c2c'
      
        '20204c4153545f4348414e4745206461746574696d652064656661756c74204e' +
        '554c4c2c'
      
        '202053484f505f444154455f4144444544206461746574696d65206465666175' +
        '6c74204e554c4c2c'
      
        '202053484f505f444154455f4348414e4745206461746574696d652064656661' +
        '756c74204e554c4c2c'
      
        '202053594e435f464c414720656e756d28274e272c27592729204e4f54204e55' +
        '4c4c2064656661756c7420274e272c'
      
        '20204348414e47455f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '202044454c5f464c414720656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '20205052494d415259204b455920202853484f505f49442c4845525354454c4c' +
        '45525f4944292c'
      
        '20204b4559204944585f4845525354454c4c45525f4e414d4520284845525354' +
        '454c4c45525f4e414d45292c'
      
        '20204b4559204944585f4845525354454c4c45525f494420284845525354454c' +
        '4c45525f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027484552' +
        '5354454c4c45525f494e464f27'
      '23'
      ''
      '435245415445205441424c45204845525354454c4c45525f494e464f2028'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204845525354454c4c45525f494420696e7428313129204e4f54204e554c4c' +
        '2064656661756c74202730272c'
      
        '2020535052414348455f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '20204845525354454c4c45525f55524c20766172636861722832353529204e4f' +
        '54204e554c4c2064656661756c742027272c'
      
        '202055524c5f434c49434b454420696e74283529204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020444154455f4c4153545f434c49434b206461746574696d65206465666175' +
        '6c74204e554c4c2c'
      
        '20205052494d415259204b455920202853484f505f49442c4845525354454c4c' +
        '45525f49442c535052414348455f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027494e46' +
        '4f27'
      '23'
      ''
      '435245415445205441424c4520494e464f2028'
      
        '20204c46445f4e5220696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      
        '202050524956415420656e756d28274e272c27592729204e4f54204e554c4c20' +
        '64656661756c7420274e272c'
      
        '20205155454c4c452074696e79696e74283429204e4f54204e554c4c20646566' +
        '61756c74202730272c'
      
        '20205155454c4c5f494420696e7428313129204e4f54204e554c4c2064656661' +
        '756c7420272d31272c'
      
        '2020444154554d2064617465204e4f54204e554c4c2064656661756c74202730' +
        '3030302d30302d3030272c'
      '202057565f444154554d20646174652064656661756c74204e554c4c2c'
      
        '202057565f464c414720656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '202045524c45444947545f464c414720656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '2020455253545f564f4e2076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '20204b55525a54455854207661726368617228313030292064656661756c7420' +
        '4e554c4c2c'
      '20204d454d4f20746578742c'
      
        '20205052494d415259204b45592020284c46445f4e522c5155454c4c452c4441' +
        '54554d29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027494e56' +
        '454e54555227'
      '23'
      ''
      '435245415445205441424c4520494e56454e5455522028'
      
        '2020494420696e74283529204e4f54204e554c4c206175746f5f696e6372656d' +
        '656e742c'
      
        '2020444154554d2064617465204e4f54204e554c4c2064656661756c74202730' +
        '3030302d30302d3030272c'
      
        '2020424553434852454942554e47207661726368617228323530292064656661' +
        '756c74204e554c4c2c'
      '2020494e464f20746578742c'
      
        '20205354415455532074696e79696e7428332920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      '20205052494d415259204b4559202028494429'
      
        '2920434f4d4d454e543d274b6f7066646174656e2066fc7220496e76656e7475' +
        '72656e273b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274a4f55' +
        '524e414c27'
      '23'
      ''
      '435245415445205441424c45204a4f55524e414c2028'
      
        '20205445524d5f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202731272c'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      
        '20205155454c4c452074696e79696e74283429204e4f54204e554c4c20646566' +
        '61756c74202730272c'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20205155454c4c455f5355422074696e79696e742834292064656661756c7420' +
        '4e554c4c2c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204c4945465f414444525f494420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '20204154524e554d20696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20205652454e554d207661726368617228323029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020564c534e554d207661726368617228323029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020464f4c47454e5220696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      '20204b4d5f5354414e4420696e74283131292064656661756c74204e554c4c2c'
      
        '20204b465a5f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20205645525452455445525f494420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '2020474c4f4252414241545420666c6f61742831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      '202041444154554d20646174652064656661756c74204e554c4c2c'
      
        '202052444154554d2064617465204e4f54204e554c4c2064656661756c742027' +
        '303030302d30302d3030272c'
      '20204c444154554d20646174652064656661756c74204e554c4c2c'
      
        '20204b4c415353455f49442074696e79696e7428332920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      '20205445524d494e20646174652064656661756c74204e554c4c2c'
      
        '202050525f4542454e452074696e79696e742834292064656661756c74204e55' +
        '4c4c2c'
      
        '20204c4945464152542074696e79696e74283229204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20205a41484c4152542074696e79696e74283229204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204745574943485420666c6f61742831302c3329204e4f54204e554c4c2064' +
        '656661756c742027302e303030272c'
      
        '20204b4f53545f4e4554544f20646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '2020574552545f4e4554544f20646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204c4f484e20646563696d616c2831302c3229204e4f54204e554c4c206465' +
        '6661756c742027302e3030272c'
      
        '20205741524520646563696d616c2831302c3229204e4f54204e554c4c206465' +
        '6661756c742027302e3030272c'
      
        '2020544b4f535420646563696d616c2831302c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '2020524f48474557494e4e20646563696d616c2831302c3229204e4f54204e55' +
        '4c4c2064656661756c742027302e3030272c'
      
        '20204d5753545f3020646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3120646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3220646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3320646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204e53554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20204d53554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20204253554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '2020415453554d4d4520646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '202041544d53554d4d4520646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '202050524f5649535f5745525420646563696d616c2831302c3229204e4f5420' +
        '4e554c4c2064656661756c742027302e3030272c'
      
        '20205741454852554e472076617263686172283529204e4f54204e554c4c2064' +
        '656661756c742027272c'
      
        '20204b55525320646563696d616c2831362c3429204e4f54204e554c4c206465' +
        '6661756c742027312e30303030272c'
      
        '2020474547454e4b4f4e544f20696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020534f4c4c5f4e5441474520494e5428342920554e5349474e454420444546' +
        '41554c5420273027204e4f54204e554c4c2c'
      
        '2020534f4c4c5f534b4f4e544f20666c6f617428352c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '2020534f4c4c5f535441474520494e5428342920554e5349474e454420444546' +
        '41554c5420273027204e4f54204e554c4c2c'
      
        '2020534f4c4c5f524154454e2074696e79696e74283429204e4f54204e554c4c' +
        '2064656661756c74202731272c'
      
        '2020534f4c4c5f5241544245545220646563696d616c2831302c3229204e4f54' +
        '204e554c4c2064656661756c742027302e3030272c'
      
        '2020534f4c4c5f524154494e54455256414c4c20696e7428313129204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20204953545f414e5a41484c554e4720646563696d616c2831302c3229206465' +
        '6661756c74204e554c4c2c'
      
        '20204953545f534b4f4e544f20646563696d616c2831302c3229206465666175' +
        '6c74204e554c4c2c'
      '20204953545f5a41484c44415420646174652064656661756c74204e554c4c2c'
      
        '20204953545f42455452414720646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204d41484e4b4f5354454e20646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204b4f4e544f4155535a554720696e74283131292064656661756c74204e55' +
        '4c4c2c'
      
        '202042414e4b5f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20205354414449554d2074696e79696e74283429204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e554d2076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f414e524544452076617263686172283430292064656661756c74' +
        '204e554c4c2c'
      
        '20204b554e5f4e414d45312076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e414d45322076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e414d45332076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f41425445494c554e472076617263686172283430292064656661' +
        '756c74204e554c4c2c'
      
        '20204b554e5f535452415353452076617263686172283430292064656661756c' +
        '74204e554c4c2c'
      
        '20204b554e5f4c414e4420766172636861722835292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f504c5a2076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f4f52542076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      '2020555352312076617263686172283830292064656661756c74204e554c4c2c'
      '2020555352322076617263686172283830292064656661756c74204e554c4c2c'
      '20204b4f50465445585420746578742c'
      '2020465553535445585420746578742c'
      
        '202050524f4a454b542076617263686172283830292064656661756c74204e55' +
        '4c4c2c'
      
        '20204f52474e554d2076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020424553545f4e414d452076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '2020424553545f434f44452074696e79696e742834292064656661756c74204e' +
        '554c4c2c'
      '2020424553545f444154554d20646174652064656661756c74204e554c4c2c'
      '2020494e464f20746578742c'
      
        '202055575f4e554d20696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20204d41484e53545546452074696e79696e74283129204e4f54204e554c4c20' +
        '64656661756c74202730272c'
      '20204d41484e444154554d20646174652064656661756c74204e554c4c2c'
      
        '20204d41484e5052494e542074696e79696e74283129204e4f54204e554c4c20' +
        '64656661756c74202730272c'
      
        '20204652454947414245315f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      
        '20205052494e545f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '202042525554544f5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '20204d5753545f465245495f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      
        '202050524f5649535f4245524543484e455420656e756d28274e272c27592729' +
        '204e4f54204e554c4c2064656661756c7420274e272c'
      
        '202053484f505f49442074696e79696e74283329204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '202053484f505f4f52444552494420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '202053484f505f5354415455532074696e79696e7428332920756e7369676e65' +
        '64204e4f54204e554c4c2064656661756c74202730272c'
      
        '202053484f505f4348414e47455f464c414720656e756d28274e272c27592729' +
        '204e4f54204e554c4c2064656661756c7420274e272c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b455920524a5f52454e554d20285155454c4c452c5652454e554d292c'
      '20204b455920414444525f49442028414444525f49442c52444154554d292c'
      
        '20204b4559204944585f5155454c4c455f52444154554d20285155454c4c452c' +
        '5155454c4c455f5355422c52444154554d29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274a4f55' +
        '524e414c504f5327'
      '23'
      ''
      '435245415445205441424c45204a4f55524e414c504f532028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20205155454c4c452074696e79696e74283429204e4f54204e554c4c20646566' +
        '61756c74202730272c'
      
        '20205155454c4c455f5355422074696e79696e74283429204e4f54204e554c4c' +
        '2064656661756c74202730272c'
      
        '20205155454c4c455f53524320696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204a4f55524e414c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020415254494b454c5459502063686172283129204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020544f505f504f535f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204154524e554d20696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20205652454e554d207661726368617228323029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020564c534e554d207661726368617228323029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020504f534954494f4e20696e7428313129204e4f54204e554c4c2064656661' +
        '756c74202730272c'
      '2020564945575f504f5320636861722833292064656661756c74204e554c4c2c'
      
        '20204d41544348434f44452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204152544e554d2076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020424152434f44452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204d454e474520646563696d616c2831302c3329204e4f54204e554c4c2064' +
        '656661756c742027302e303030272c'
      
        '20204c41454e47452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '20204252454954452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020484f4548452076617263686172283230292064656661756c74204e554c4c' +
        '2c'
      
        '202047524f455353452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '202044494d454e53494f4e2076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204745574943485420646563696d616c2831302c3329204e4f54204e554c4c' +
        '2064656661756c742027302e303030272c'
      
        '20204d455f45494e484549542076617263686172283130292064656661756c74' +
        '204e554c4c2c'
      
        '202050525f45494e4845495420646563696d616c2831302c3329204e4f54204e' +
        '554c4c2064656661756c742027312e303030272c'
      
        '202056504520696e742831312920756e7369676e6564204e4f54204e554c4c20' +
        '64656661756c74202731272c'
      
        '2020454b5f505245495320646563696d616c2831302c3429204e4f54204e554c' +
        '4c2064656661756c742027302e30303030272c'
      
        '202043414c435f46414b544f5220646563696d616c28362c3529204e4f54204e' +
        '554c4c2064656661756c742027302e3030303030272c'
      
        '202045505245495320646563696d616c2831302c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '202047505245495320646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '2020455f52474557494e4e20646563696d616c2831302c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '2020475f52474557494e4e20646563696d616c2831302c3229204e4f54204e55' +
        '4c4c2064656661756c742027302e3030272c'
      
        '202052414241545420646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20205241424154543220646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '20205241424154543320646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '2020455f5241424154545f42455452414720646563696d616c2831302c342920' +
        '4e4f54204e554c4c2064656661756c742027302e30303030272c'
      
        '2020475f5241424154545f42455452414720646563696d616c2831302c322920' +
        '4e4f54204e554c4c2064656661756c742027302e3030272c'
      
        '20205354455545525f434f44452074696e79696e74283429204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020414c545445494c5f50524f5a20646563696d616c2831302c3229204e4f54' +
        '204e554c4c2064656661756c742027302e3130272c'
      
        '2020414c545445494c5f5354434f44452074696e79696e74283429204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '202050524f5649535f50524f5a20646563696d616c28352c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '202050524f5649535f5745525420646563696d616c2831302c3229204e4f5420' +
        '4e554c4c2064656661756c742027302e3030272c'
      
        '20204745425543485420656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '2020474547454e4b544f20696e7428313129204e4f54204e554c4c2064656661' +
        '756c7420272d31272c'
      '202042455a454943484e554e4720746578742c'
      
        '2020534e5f464c414720656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '2020414c545445494c5f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '202042455a5f464553545f464c414720656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '202042525554544f5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '20204e4f5f5241424154545f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b455920415254494b454c5f49442028415254494b454c5f4944292c'
      '20204b455920414444525f49442028414444525f4944292c'
      
        '20204b4559204a4f55524e414c5f494420284a4f55524e414c5f49442c504f53' +
        '4954494f4e292c'
      '20204b4559205155454c4c455f53524320285155454c4c455f535243292c'
      '20204b4559204944585f5155454c4c4520285155454c4c45292c'
      
        '20204b4559204944585f5153524320285155454c4c455f5352432c5155454c4c' +
        '4529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274a4f55' +
        '524e414c504f535f5345524e554d27'
      '23'
      ''
      '435245415445205441424c45204a4f55524e414c504f535f5345524e554d2028'
      
        '20205155454c4c452074696e79696e7428322920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '20204a4f55524e414c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204a4f55524e414c504f535f494420696e7428313129204e4f54204e554c4c' +
        '2064656661756c7420272d31272c'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020534e554d5f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20205052494d415259204b45592020285155454c4c452c4a4f55524e414c5f49' +
        '442c4a4f55524e414c504f535f49442c415254494b454c5f49442c534e554d5f' +
        '494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274b465a' +
        '27'
      '23'
      ''
      '435245415445205441424c45204b465a2028'
      
        '20204b465a5f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '2020464753545f4e554d207661726368617228323029204e4f54204e554c4c20' +
        '64656661756c742027272c'
      
        '20204b465a5f4752555050452074696e79696e742834292064656661756c7420' +
        '4e554c4c2c'
      
        '2020504f4c5f4b454e4e5a207661726368617228313029204e4f54204e554c4c' +
        '2064656661756c742027272c'
      
        '20205343484c5f5a555f322076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20205343484c5f5a555f332076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      '20205459505f494420696e74283131292064656661756c74204e554c4c2c'
      '20205459502076617263686172283130292064656661756c74204e554c4c2c'
      
        '2020415553465545522076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      '20204152545f494420696e74283131292064656661756c74204e554c4c2c'
      
        '202046414252494b41545f494420696e74283131292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b5241465453544f46465f494420696e74283131292064656661756c7420' +
        '4e554c4c2c'
      '202047525550504520696e74283131292064656661756c74204e554c4c2c'
      
        '20205343484c5545535f4e522076617263686172283130292064656661756c74' +
        '204e554c4c2c'
      
        '20205a5343484c5f4e522076617263686172283130292064656661756c74204e' +
        '554c4c2c'
      
        '20204d4f544f525f4e522076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      
        '20204b465a4252495f4e522076617263686172283135292064656661756c7420' +
        '4e554c4c2c'
      
        '20204d4f544f522076617263686172283135292064656661756c74204e554c4c' +
        '2c'
      
        '202047455452494542452076617263686172283130292064656661756c74204e' +
        '554c4c2c'
      '20204b5720696e74283131292064656661756c74204e554c4c2c'
      '2020505320696e74283131292064656661756c74204e554c4c2c'
      '20204b4d5f5354414e4420696e74283131292064656661756c74204e554c4c2c'
      '20204855425241554d20696e74283131292064656661756c74204e554c4c2c'
      
        '202052454946454e2076617263686172283130292064656661756c74204e554c' +
        '4c2c'
      
        '2020524549465f47522076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      
        '202046415242452076617263686172283130292064656661756c74204e554c4c' +
        '2c'
      
        '2020504f4c535445522076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      '20205a554c415353554e4720646174652064656661756c74204e554c4c2c'
      '20204845525354454c4c554e4720646174652064656661756c74204e554c4c2c'
      '20204b415546444154554d20646174652064656661756c74204e554c4c2c'
      '20204c455f42455355434820646174652064656661756c74204e554c4c2c'
      '20204e41455f5455455620646174652064656661756c74204e554c4c2c'
      '20204e41455f415520646174652064656661756c74204e554c4c2c'
      '20204e41455f535020646174652064656661756c74204e554c4c2c'
      '20204e41455f545020646174652064656661756c74204e554c4c2c'
      '2020454b5f505245495320646f75626c652064656661756c74204e554c4c2c'
      '202052554553544b20646f75626c652064656661756c74204e554c4c2c'
      '2020564b5f4e4554544f20646f75626c652064656661756c74204e554c4c2c'
      '20204d5753545f50524f5a20646f75626c652064656661756c74204e554c4c2c'
      
        '2020554d5341545a5f47455320646f75626c652064656661756c74204e554c4c' +
        '2c'
      
        '2020554d5341545a5f47415220646f75626c652064656661756c74204e554c4c' +
        '2c'
      
        '20205645525452455445525f494420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      '2020494e464f20746578742c'
      '2020574b53545f494e464f20746578742c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020284b465a5f4944292c'
      '20204b4559204b554e4e554d2028414444525f4944292c'
      '20204b4559204b454e4e5a2028504f4c5f4b454e4e5a292c'
      '20204b455920464753545f4e522028464753545f4e554d29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274c414e' +
        '4427'
      '23'
      ''
      '435245415445205441424c45204c414e442028'
      
        '202049442063686172283229204e4f54204e554c4c2064656661756c74202727' +
        '2c'
      
        '20204e414d4520766172636861722831303029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      
        '20204e414d453220766172636861722832353529204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '202049534f5f434f44455f332063686172283329204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020504f53545f434f444520636861722833292064656661756c74204e554c4c' +
        '2c'
      
        '2020464f524d41542074696e79696e74283329204e4f54204e554c4c20646566' +
        '61756c74202731272c'
      
        '2020564f525741484c2076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      
        '20205741454852554e4720766172636861722835292064656661756c74204e55' +
        '4c4c2c'
      
        '20205741454852554e475f4c414e472076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      '20205350524143484520636861722833292064656661756c74204e554c4c2c'
      
        '202045555f4c414e4420656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      '20205052494d415259204b45592020284944292c'
      '2020554e49515545204b4559204944585f4e414d4520284e414d4529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274c494e' +
        '4b27'
      '23'
      ''
      '435245415445205441424c45204c494e4b2028'
      
        '20204d4f44554c5f49442074696e79696e74283329204e4f54204e554c4c2064' +
        '656661756c7420272d31272c'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20205046414420766172636861722832353529204e4f54204e554c4c20646566' +
        '61756c742027272c'
      
        '2020444154454920766172636861722832303029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      '202042454d45524b554e4720746578742c'
      
        '20204c4153545f4348414e47452074696d657374616d7028313429204e4f5420' +
        '4e554c4c2c'
      
        '20204c4153545f4348414e47455f55534552207661726368617228353029204e' +
        '4f54204e554c4c2064656661756c742027272c'
      
        '20204f50454e5f464c414720656e756d28274e272c27592729204e4f54204e55' +
        '4c4c2064656661756c7420274e272c'
      
        '20204f50454e5f55534552207661726368617228353029204e4f54204e554c4c' +
        '2064656661756c742027272c'
      
        '20204f50454e5f54494d452074696d657374616d7028313429204e4f54204e55' +
        '4c4c2c'
      
        '20205052494d415259204b45592020284d4f44554c5f49442c5245435f49442c' +
        '504641442c444154454929'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4148' +
        '4e554e4727'
      '23'
      ''
      '435245415445205441424c45204d41484e554e472028'
      
        '20204a4f55524e414c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '20204d41484e53545546452074696e79696e7428312920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202731272c'
      
        '20204d41484e444154554d2064617465204e4f54204e554c4c2064656661756c' +
        '742027303030302d30302d3030272c'
      
        '20204d41484e4745425545485220646f75626c652831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      '202042454d45524b554e4720746578742c'
      
        '202045524c454449475420656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '20205052494e545f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '20205052494d415259204b45592020284a4f55524e414c5f49442c4d41484e53' +
        '5455464529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c27'
      '23'
      ''
      '435245415445205441424c45204d41494c2028'
      
        '2020494420696e742831312920756e7369676e6564204e4f54204e554c4c2061' +
        '75746f5f696e6372656d656e742c'
      
        '20204d41494c5f494420766172636861722832353529204e4f54204e554c4c20' +
        '64656661756c742027272c'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204d415f4b4f4e544f5f494420696e742831312920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '20205352435f494420696e742831312920756e7369676e6564204e4f54204e55' +
        '4c4c2064656661756c74202730272c'
      
        '20205549444c207661726368617228323030292064656661756c74204e554c4c' +
        '2c'
      
        '20205459502074696e79696e7428312920756e7369676e6564204e4f54204e55' +
        '4c4c2064656661756c74202731272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '2020414444525f4153505f494420696e7428313129204e4f54204e554c4c2064' +
        '656661756c7420272d31272c'
      
        '202047524f4553534520626967696e742831362920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '202053444154554d206461746574696d65204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d30302030303a30303a3030272c'
      
        '202045444154554d206461746574696d65204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d30302030303a30303a3030272c'
      
        '20204f52444e45525f494420696e742831312920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202731272c'
      
        '202053454e44455220766172636861722832353529204e4f54204e554c4c2064' +
        '656661756c742027272c'
      '2020454d504641454e4745522074657874204e4f54204e554c4c2c'
      '2020434320746578742c'
      '202042434320746578742c'
      
        '202042455452454646207661726368617228323535292064656661756c74204e' +
        '554c4c2c'
      '20204e41434852494348545f54455854206d656469756d746578742c'
      '202048454144455220746578742c'
      
        '202053544154555320696e7428352920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020414e48414e475f414e5a20696e7428332920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '20205052494f522074696e79696e7428312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202732272c'
      
        '202053505241434845207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b45592020284944292c'
      
        '2020554e49515545204b4559204944585f4d41494c5f494420284d415f49442c' +
        '4d415f4b4f4e544f5f49442c4d41494c5f4944292c'
      
        '20204b4559204944585f4d415f4f52444e455220284d415f49442c4f52444e45' +
        '525f49442c535441545553292c'
      
        '20204b4559204944585f4d415f4b4f4e544f5f494420284d415f4b4f4e544f5f' +
        '49442c535441545553292c'
      '20204b4559204944585f53524320284d415f49442c5352435f4944292c'
      
        '20204b4559204944585f5549444c20284d415f49442c4d415f4b4f4e544f5f49' +
        '442c5549444c292c'
      
        '20204b4559204944585f4b544f5f4d41494c20284d415f49442c4f52444e4552' +
        '5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c5f414452455353454e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f414452455353454e2028'
      
        '2020454d41494c20766172636861722831353029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204153505f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      '20205052494d415259204b4559202028454d41494c2c414444525f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c5f414e48414e4727'
      '23'
      ''
      '435245415445205441424c45204d41494c5f414e48414e472028'
      
        '20204d41494c5f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      
        '2020504152545f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      '2020545950207661726368617228323530292064656661756c74204e554c4c2c'
      
        '202044415445494e414d45207661726368617228323535292064656661756c74' +
        '204e554c4c2c'
      '202044415441206c6f6e67626c6f622c'
      
        '202047524f4553534520626967696e742832302920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '20205052494d415259204b45592020284d41494c5f49442c504152545f494429' +
        '2c'
      '20204b4559204d41494c5f494420284d41494c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c5f4b4f4e54454e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f4b4f4e54454e2028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204b4f4e544f5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c206175746f5f696e6372656d656e742c'
      
        '20204b4f4e544f5f4e414d4520766172636861722832353529204e4f54204e55' +
        '4c4c2064656661756c742027272c'
      
        '20204b4f4e544f5f44454641554c5420656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '20204b4f4e544f5f474c4f42414c20656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '20204b4f4e544f5f4f52444e455220656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '2020504f50335f53455256455220766172636861722832303029206465666175' +
        '6c74204e554c4c2c'
      
        '2020504f50335f55534552207661726368617228313030292064656661756c74' +
        '204e554c4c2c'
      
        '2020504f50335f50415353574f52442076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '2020504f50335f504f525420696e7428352920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c742027313130272c'
      
        '2020504f50335f454d5046414e475f464c414720656e756d28274e272c275927' +
        '29204e4f54204e554c4c2064656661756c74202759272c'
      
        '2020504f50335f44454c4554455f464c414720656e756d28274e272c27592729' +
        '204e4f54204e554c4c2064656661756c7420274e272c'
      
        '2020504f50335f44454c4554455f5441474520696e7428352920756e7369676e' +
        '6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '2020504f50335f4c455f454d5046414e47206461746574696d65204e4f54204e' +
        '554c4c2064656661756c742027303030302d30302d30302030303a30303a3030' +
        '272c'
      
        '2020534d54505f53455256455220766172636861722832303029206465666175' +
        '6c74204e554c4c2c'
      
        '2020534d54505f55534552207661726368617228313030292064656661756c74' +
        '204e554c4c2c'
      
        '2020534d54505f50415353574f52442076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '2020534d54505f555345524e414d452076617263686172283235352920646566' +
        '61756c74204e554c4c2c'
      
        '2020534d54505f504f525420696e7428352920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c7420273235272c'
      
        '2020534d54505f454d41494c207661726368617228323535292064656661756c' +
        '74204e554c4c2c'
      
        '2020534d54505f44454641554c5420656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '2020534d54505f424343207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '2020534d54505f4d4f44452074696e79696e7428332920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202731272c'
      
        '20205052494d415259204b45592020284d415f49442c4b4f4e544f5f4e414d45' +
        '292c'
      
        '2020554e49515545204b4559204944585f4b544f5f494420284b4f4e544f5f49' +
        '4429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c5f4f52444e455227'
      '23'
      ''
      '435245415445205441424c45204d41494c5f4f52444e45522028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204f52444e45525f494420696e742831312920756e7369676e6564204e4f54' +
        '204e554c4c206175746f5f696e6372656d656e742c'
      
        '20204b4f4e544f5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20204f52444e45525f4e414d4520766172636861722832303029204e4f54204e' +
        '554c4c2064656661756c742027272c'
      
        '20204f52444e45525f54595020656e756d28275045272c275041272c27474f27' +
        '2c274445272c274557272c27474c4f42272c272d2729204e4f54204e554c4c20' +
        '64656661756c7420272d272c'
      
        '202050415252454e545f4f52444e455220696e7428313129204e4f54204e554c' +
        '4c2064656661756c7420272d31272c'
      '20205052494d415259204b45592020284f52444e45525f4944292c'
      
        '20204b4559204944585f4d415f4f524420284d415f49442c4b4f4e544f5f4944' +
        '2c4f52444e45525f49442c4f52444e45525f54595029'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4149' +
        '4c5f524547454c4e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f524547454c4e2028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020524547454c4e414d4520766172636861722831303029204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '20204d415f4b4f4e544f5f494420696e742831312920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '2020524547454c5f414b54495620656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '2020504f534954494f4e2074696e79696e7428332920756e7369676e65642064' +
        '656661756c74204e554c4c2c'
      
        '20204245445f4b4f4e544f5f494420696e742831312920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      
        '20204245445f53454e444552207661726368617228323535292064656661756c' +
        '74204e554c4c2c'
      
        '20204245445f454d5046207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '20204245445f454d50465f4f525f434320766172636861722832353529206465' +
        '6661756c74204e554c4c2c'
      
        '20204245445f42455452207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '20204245445f4e54455854207661726368617228323535292064656661756c74' +
        '204e554c4c2c'
      
        '20204245445f424554525f4f525f4e544558542074696e79696e742833292075' +
        '6e7369676e65642064656661756c74204e554c4c2c'
      
        '20204245445f5052494f522074696e79696e74283329204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '2020414b54494f4e454e2074696e79696e7428332920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f5a49454c4f52444e45525f494420696e742831312920756e7369' +
        '676e6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f4155544f415720696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f574c5f454d41494c207661726368617228323535292064656661' +
        '756c74204e554c4c2c'
      
        '20205052494d415259204b45592020284d415f49442c524547454c4e414d452c' +
        '4d415f4b4f4e544f5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520274d4954' +
        '415242454954455227'
      '23'
      ''
      '435245415445205441424c45204d495441524245495445522028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c206175746f5f696e6372656d656e742c'
      
        '20204d415f4e554d4d45522076617263686172283130292064656661756c7420' +
        '4e554c4c2c'
      
        '20204e414d45207661726368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020564e414d45207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '20204c4f47494e5f4e414d45207661726368617228353029204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '2020414e5a454947455f4e414d45207661726368617228353029204e4f54204e' +
        '554c4c2064656661756c742027272c'
      
        '2020555345525f50415353574f5244207661726368617228333229204e4f5420' +
        '4e554c4c2064656661756c742027272c'
      
        '2020414e524544452076617263686172283135292064656661756c74204e554c' +
        '4c2c'
      
        '2020544954454c2076617263686172283135292064656661756c74204e554c4c' +
        '2c'
      
        '20205a555341545a2076617263686172283430292064656661756c74204e554c' +
        '4c2c'
      
        '20205a555341545a322076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      
        '20205a554841454e44454e2076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '2020535452415353452076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      '20204c414e4420766172636861722835292064656661756c74204e554c4c2c'
      '2020504c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204f52542076617263686172283430292064656661756c74204e554c4c2c'
      
        '202054454c45464f4e207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      '2020464158207661726368617228313030292064656661756c74204e554c4c2c'
      
        '202046554e4b207661726368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020454d41494c207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '2020494e5445524e4554207661726368617228313030292064656661756c7420' +
        '4e554c4c2c'
      
        '20205350524143485f494420736d616c6c696e742836292064656661756c7420' +
        '2732272c'
      
        '20204245534348414546544947554e475341525420736d616c6c696e74283629' +
        '2064656661756c74204e554c4c2c'
      
        '20204245534348414546544947554e47534752414420736d616c6c696e742836' +
        '292064656661756c74204e554c4c2c'
      
        '20204a414852455355524c41554220666c6f61742064656661756c74204e554c' +
        '4c2c'
      
        '20204755454c5449475f564f4e206461746574696d652064656661756c74204e' +
        '554c4c2c'
      
        '20204755454c5449475f424953206461746574696d652064656661756c74204e' +
        '554c4c2c'
      
        '2020474542444154554d206461746574696d652064656661756c74204e554c4c' +
        '2c'
      
        '202047455343484c4543485420656e756d28274d272c27572729204e4f54204e' +
        '554c4c2064656661756c7420274d272c'
      
        '202046414d5354414e4420736d616c6c696e742836292064656661756c74204e' +
        '554c4c2c'
      '202042414e4b2076617263686172283430292064656661756c74204e554c4c2c'
      '2020424c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204b544f2076617263686172283230292064656661756c74204e554c4c2c'
      '202042454d45524b554e4720746578742c'
      
        '202045525354454c4c54206461746574696d652064656661756c74204e554c4c' +
        '2c'
      
        '202045525354454c4c545f4e414d452076617263686172283230292064656661' +
        '756c74204e554c4c2c'
      '2020474541454e44206461746574696d652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020284d415f4944292c'
      
        '2020554e49515545204b4559204944585f4d415f4e554d20284d415f4e554d4d' +
        '4552292c'
      
        '2020554e49515545204b4559204944585f4c4f47494e4e414d4520284c4f4749' +
        '4e5f4e414d4529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c65202750494d' +
        '5f415546474142454e27'
      '23'
      ''
      '435245415445205441424c452050494d5f415546474142454e2028'
      
        '20205245434f5244494420696e7428313129204e4f54204e554c4c206175746f' +
        '5f696e6372656d656e742c'
      
        '20205245534f55524345494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020434f4d504c45544520656e756d28274e272c275927292064656661756c74' +
        '20274e272c'
      
        '20204445534352495054494f4e206368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '202044455441494c53206368617228323535292064656661756c74204e554c4c' +
        '2c'
      
        '2020435245415445444f4e206461746574696d652064656661756c74204e554c' +
        '4c2c'
      '20205052494f5249545920696e74283131292064656661756c74204e554c4c2c'
      '202043415445474f525920696e74283131292064656661756c74204e554c4c2c'
      
        '2020434f4d504c455445444f4e206461746574696d652064656661756c74204e' +
        '554c4c2c'
      '202044554544415445206461746574696d652064656661756c74204e554c4c2c'
      
        '20205052495641544520656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '2020555345524649454c4430206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4431206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4432206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4433206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4434206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4435206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4436206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4437206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4438206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4439206368617228313030292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b45592020285245434f52444944292c'
      '20204b45592052657349445f6e647820285245534f555243454944292c'
      '20204b45592044756544617465202844554544415445292c'
      '20204b455920436f6d706c657465644f6e2028434f4d504c455445444f4e29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c65202750494d' +
        '5f4b4f4e54414b544527'
      '23'
      ''
      '435245415445205441424c452050494d5f4b4f4e54414b54452028'
      
        '20205245434f5244494420696e7428313129204e4f54204e554c4c206175746f' +
        '5f696e6372656d656e742c'
      
        '20205245534f55524345494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '202046495253544e414d452063686172283530292064656661756c74204e554c' +
        '4c2c'
      
        '20204c4153544e414d45206368617228353029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '202042495254484441544520646174652064656661756c74204e554c4c2c'
      '2020414e4e495645525341525920646174652064656661756c74204e554c4c2c'
      '20205449544c452063686172283530292064656661756c74204e554c4c2c'
      
        '2020434f4d50414e59206368617228353029204e4f54204e554c4c2064656661' +
        '756c742027272c'
      
        '20204a4f425f504f534954494f4e2063686172283330292064656661756c7420' +
        '4e554c4c2c'
      
        '202041444452455353206368617228313030292064656661756c74204e554c4c' +
        '2c'
      '2020434954592063686172283530292064656661756c74204e554c4c2c'
      '202053544154452063686172283235292064656661756c74204e554c4c2c'
      '20205a49502063686172283130292064656661756c74204e554c4c2c'
      '2020434f554e5452592063686172283235292064656661756c74204e554c4c2c'
      '20204e4f5445206368617228323535292064656661756c74204e554c4c2c'
      '202050484f4e45312063686172283235292064656661756c74204e554c4c2c'
      '202050484f4e45322063686172283235292064656661756c74204e554c4c2c'
      '202050484f4e45332063686172283235292064656661756c74204e554c4c2c'
      '202050484f4e45342063686172283235292064656661756c74204e554c4c2c'
      '202050484f4e45352063686172283235292064656661756c74204e554c4c2c'
      
        '202050484f4e45545950453120696e74283131292064656661756c74204e554c' +
        '4c2c'
      
        '202050484f4e45545950453220696e74283131292064656661756c74204e554c' +
        '4c2c'
      
        '202050484f4e45545950453320696e74283131292064656661756c74204e554c' +
        '4c2c'
      
        '202050484f4e45545950453420696e74283131292064656661756c74204e554c' +
        '4c2c'
      
        '202050484f4e45545950453520696e74283131292064656661756c74204e554c' +
        '4c2c'
      '202043415445474f525920696e74283131292064656661756c74204e554c4c2c'
      '2020454d41494c206368617228313030292064656661756c74204e554c4c2c'
      
        '2020435553544f4d31206368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020435553544f4d32206368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020435553544f4d33206368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020435553544f4d34206368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020555345524649454c4430206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4431206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4432206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4433206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4434206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4435206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4436206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4437206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4438206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4439206368617228313030292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b45592020285245434f52444944292c'
      '20204b45592052657349445f6e647820285245534f555243454944292c'
      '20204b4559204c4e616d655f6e647820284c4153544e414d45292c'
      '20204b455920436f6d70616e795f6e64782028434f4d50414e5929'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c65202750494d' +
        '5f5445524d494e4527'
      '23'
      ''
      '435245415445205441424c452050494d5f5445524d494e452028'
      
        '20205245434f5244494420696e7428313129204e4f54204e554c4c206175746f' +
        '5f696e6372656d656e742c'
      
        '2020535441525454494d45206461746574696d652064656661756c74204e554c' +
        '4c2c'
      '2020454e4454494d45206461746574696d652064656661756c74204e554c4c2c'
      
        '20205245534f55524345494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '20204445534352495054494f4e206368617228323535292064656661756c7420' +
        '4e554c4c2c'
      '20204e4f544553206368617228323535292064656661756c74204e554c4c2c'
      '202043415445474f525920696e74283131292064656661756c74204e554c4c2c'
      
        '2020414c4c4441594556454e5420656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '202044494e4750415448206368617228323535292064656661756c74204e554c' +
        '4c2c'
      
        '2020414c41524d53455420656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '2020414c41524d414456414e434520696e74283131292064656661756c74204e' +
        '554c4c2c'
      
        '2020414c41524d414456414e43455459504520696e7428313129206465666175' +
        '6c74204e554c4c2c'
      
        '2020534e4f4f5a4554494d45206461746574696d652064656661756c74204e55' +
        '4c4c2c'
      
        '2020524550454154434f444520696e74283131292064656661756c74204e554c' +
        '4c2c'
      
        '202052455045415452414e4745454e44206461746574696d652064656661756c' +
        '74204e554c4c2c'
      
        '2020435553544f4d494e54455256414c20696e74283131292064656661756c74' +
        '204e554c4c2c'
      
        '20205052495641544520656e756d28274e272c27592729204e4f54204e554c4c' +
        '2064656661756c7420274e272c'
      
        '2020555345524649454c4430206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4431206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4432206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4433206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4434206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4435206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4436206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4437206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4438206368617228313030292064656661756c74204e' +
        '554c4c2c'
      
        '2020555345524649454c4439206368617228313030292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b45592020285245434f52444944292c'
      
        '20204b4559207269645f73745f6e647820285245534f5552434549442c535441' +
        '525454494d45292c'
      '20204b45592073745f6e64782028535441525454494d45292c'
      '20204b45592065745f6e64782028454e4454494d45292c'
      '20204b45592052657349445f6e647820285245534f55524345494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027504c5a' +
        '27'
      '23'
      ''
      '435245415445205441424c4520504c5a2028'
      
        '20204c414e442063686172283329204e4f54204e554c4c2064656661756c7420' +
        '2744272c'
      
        '2020504c5a207661726368617228313129204e4f54204e554c4c206465666175' +
        '6c742027272c'
      
        '20204e414d45207661726368617228353029204e4f54204e554c4c2064656661' +
        '756c742027272c'
      
        '2020564f525741484c2076617263686172283132292064656661756c74204e55' +
        '4c4c2c'
      
        '202042554e4445534c414e4420636861722833292064656661756c74204e554c' +
        '4c2c'
      '20205052494d415259204b45592020284c414e442c504c5a2c4e414d45292c'
      '20204b4559204944585f4e414d4520284c414e442c4e414d45292c'
      
        '20204b4559204944585f564f525741484c20284c414e442c564f525741484c29' +
        '2c'
      '20204b4559204944585f4c414e4420284c414e4429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027524142' +
        '4154544752555050454e27'
      '23'
      ''
      '435245415445205441424c45205241424154544752555050454e2028'
      
        '20205241424752505f4944207661726368617228313029204e4f54204e554c4c' +
        '2064656661756c742027272c'
      
        '20205241424752505f5459502074696e79696e74283329204e4f54204e554c4c' +
        '2064656661756c74202730272c'
      
        '20204d494e5f4d454e474520696e7428313129204e4f54204e554c4c20646566' +
        '61756c74202731272c'
      
        '20204c4945465f52414247525020696e7428313029204e4f54204e554c4c2064' +
        '656661756c74202730272c'
      
        '20205241424154543120646563696d616c28352c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20205241424154543220646563696d616c28352c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20205241424154543320646563696d616c28352c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '2020424553434852454942554e47207661726368617228323530292064656661' +
        '756c74204e554c4c2c'
      
        '20205052494d415259204b45592020285241424752505f49442c524142475250' +
        '5f5459502c4c4945465f5241424752502c4d494e5f4d454e474529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027524547' +
        '495354525927'
      '23'
      ''
      '435245415445205441424c452052454749535452592028'
      
        '20204d41494e4b455920766172636861722832353529204e4f54204e554c4c20' +
        '64656661756c742027272c'
      
        '20204e414d4520766172636861722831303029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      
        '202056414c5f43484152207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '202056414c5f44415445206461746574696d652064656661756c74204e554c4c' +
        '2c'
      '202056414c5f494e5420696e74283131292064656661756c74204e554c4c2c'
      
        '202056414c5f494e543220626967696e74283230292064656661756c74204e55' +
        '4c4c2c'
      
        '202056414c5f494e543320626967696e74283230292064656661756c74204e55' +
        '4c4c2c'
      
        '202056414c5f444f55424c4520646f75626c652064656661756c74204e554c4c' +
        '2c'
      '202056414c5f424c4f42206c6f6e67746578742c'
      '202056414c5f42494e206c6f6e67626c6f622c'
      
        '202056414c5f54595020736d616c6c696e742836292064656661756c74204e55' +
        '4c4c2c'
      
        '20204341434841424c4520656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '2020524541444f4e4c5920656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '20204c4153545f4348414e47452074696d657374616d7028313429204e4f5420' +
        '4e554c4c2c'
      '20205052494d415259204b45592020284d41494e4b45592c4e414d4529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027534348' +
        '524946545645524b45485227'
      '23'
      ''
      '435245415445205441424c4520534348524946545645524b4548522028'
      
        '2020494420696e7428313129204e4f54204e554c4c206175746f5f696e637265' +
        '6d656e742c'
      '2020414444525f494420696e74283131292064656661756c7420272d31272c'
      
        '2020424553434852454942554e47207661726368617228323530292064656661' +
        '756c74204e554c4c2c'
      '20204c414e475f5445585420746578742c'
      
        '20204348414e47455f4c4153542074696d657374616d7028313429204e4f5420' +
        '4e554c4c2c'
      
        '20204348414e47455f5553455220766172636861722831303029206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b4559202028494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027535052' +
        '414348454e27'
      '23'
      ''
      '435245415445205441424c4520535052414348454e2028'
      
        '20205350524143485f494420696e7428313129204e4f54204e554c4c20617574' +
        '6f5f696e6372656d656e742c'
      
        '20204e414d45207661726368617228333229204e4f54204e554c4c2064656661' +
        '756c742027272c'
      
        '2020434f44452063686172283229204e4f54204e554c4c2064656661756c7420' +
        '27272c'
      '2020534f525420696e742833292064656661756c74204e554c4c2c'
      
        '202044454641554c545f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      '20205052494d415259204b45592020285350524143485f4944292c'
      '20204b4559204944585f4e414d4520284e414d4529'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027544558' +
        '54424155535445494e4527'
      '23'
      ''
      '435245415445205441424c452054455854424155535445494e452028'
      
        '2020494420696e742831312920756e7369676e6564204e4f54204e554c4c2061' +
        '75746f5f696e6372656d656e742c'
      
        '2020424553434852454942554e4720766172636861722832353529204e4f5420' +
        '4e554c4c2064656661756c742027272c'
      '20204c414e47544558542074657874204e4f54204e554c4c2c'
      '20205052494d415259204b45592020284944292c'
      
        '20204b455920424553434852454942554e472028424553434852454942554e47' +
        '29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027554542' +
        '455257454953554e47454e27'
      '23'
      ''
      '435245415445205441424c4520554542455257454953554e47454e2028'
      
        '2020494420696e7428313129204e4f54204e554c4c206175746f5f696e637265' +
        '6d656e742c'
      
        '202055574e554d20696e7428313129204e4f54204e554c4c2064656661756c74' +
        '202730272c'
      
        '202041525420656e756d282755272c274c2729204e4f54204e554c4c20646566' +
        '61756c74202755272c'
      '20204645525449472074696e79696e742831292064656661756c74202730272c'
      
        '20204a4f55524e414c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      '202055575f444154554d20646174652064656661756c74204e554c4c2c'
      
        '202042455452414720646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      '20204b544f2076617263686172283230292064656661756c74204e554c4c2c'
      '2020424c5a20766172636861722838292064656661756c74204e554c4c2c'
      
        '202042494e48414245522076617263686172283530292064656661756c74204e' +
        '554c4c2c'
      
        '202055575f54455854207661726368617228323530292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b455920202849442c55574e554d29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027564552' +
        '5452414727'
      '23'
      ''
      '435245415445205441424c4520564552545241472028'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20205656544e554d20696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20205645525452455445525f494420696e7428313129204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '20204b4c415353455f49442074696e79696e7428332920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      
        '2020474c4f4252414241545420666c6f61742831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '2020444154554d5f53544152542064617465204e4f54204e554c4c2064656661' +
        '756c742027303030302d30302d3030272c'
      
        '2020444154554d5f454e44452064617465204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d3030272c'
      
        '2020444154554d5f4e4558542064617465204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d3030272c'
      
        '2020494e54455256414c4c2063686172283129204e4f54204e554c4c20646566' +
        '61756c7420274d272c'
      
        '2020494e54455256414c4c5f4e554d2074696e79696e7428332920756e736967' +
        '6e6564204e4f54204e554c4c2064656661756c74202731272c'
      
        '2020414b5449565f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '20205052494e545f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '202050525f4542454e452074696e79696e742834292064656661756c74204e55' +
        '4c4c2c'
      
        '20204c4945464152542074696e79696e742832292064656661756c74204e554c' +
        '4c2c'
      
        '20205a41484c4152542074696e79696e742832292064656661756c74204e554c' +
        '4c2c'
      
        '20204b4f53545f4e4554544f20646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '2020574552545f4e4554544f20646563696d616c2831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204c4f484e20646563696d616c2831302c3229204e4f54204e554c4c206465' +
        '6661756c742027302e3030272c'
      
        '20205741524520646563696d616c2831302c3229204e4f54204e554c4c206465' +
        '6661756c742027302e3030272c'
      
        '2020544b4f535420646563696d616c2831302c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3020646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3120646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3220646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204d5753545f3320646563696d616c28352c3229204e4f54204e554c4c2064' +
        '656661756c742027302e3030272c'
      
        '20204e53554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204e53554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20204d53554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204d53554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20204253554d4d455f3020646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3120646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3220646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d455f3320646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20204253554d4d4520646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '2020415453554d4d4520646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '202041544d53554d4d4520646563696d616c2831302c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '20205741454852554e472076617263686172283529204e4f54204e554c4c2064' +
        '656661756c742027272c'
      
        '20204b55525320646563696d616c2831362c3429204e4f54204e554c4c206465' +
        '6661756c742027312e30303030272c'
      
        '2020474547454e4b4f4e544f20696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020534f4c4c5f53544147452074696e79696e74283429204e4f54204e554c4c' +
        '2064656661756c74202730272c'
      
        '2020534f4c4c5f534b4f4e544f20666c6f617428352c3229204e4f54204e554c' +
        '4c2064656661756c742027302e3030272c'
      
        '2020534f4c4c5f4e544147452074696e79696e74283429204e4f54204e554c4c' +
        '2064656661756c74202730272c'
      
        '2020534f4c4c5f524154454e2074696e79696e74283429204e4f54204e554c4c' +
        '2064656661756c74202731272c'
      
        '2020534f4c4c5f5241544245545220646563696d616c2831302c3229204e4f54' +
        '204e554c4c2064656661756c742027302e3030272c'
      
        '2020534f4c4c5f524154494e54455256414c4c20696e7428313129204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20205354414449554d2074696e79696e74283429204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e554d2076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f414e524544452076617263686172283430292064656661756c74' +
        '204e554c4c2c'
      
        '20204b554e5f4e414d45312076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e414d45322076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f4e414d45332076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '20204b554e5f41425445494c554e472076617263686172283430292064656661' +
        '756c74204e554c4c2c'
      
        '20204b554e5f535452415353452076617263686172283430292064656661756c' +
        '74204e554c4c2c'
      
        '20204b554e5f4c414e4420766172636861722835292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f504c5a2076617263686172283130292064656661756c74204e55' +
        '4c4c2c'
      
        '20204b554e5f4f52542076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      '2020555352312076617263686172283830292064656661756c74204e554c4c2c'
      '2020555352322076617263686172283830292064656661756c74204e554c4c2c'
      '20204b4f50465445585420746578742c'
      '2020465553535445585420746578742c'
      
        '202050524f4a454b542076617263686172283830292064656661756c74204e55' +
        '4c4c2c'
      
        '20204f52474e554d2076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020424553545f4e414d452076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '2020424553545f434f44452074696e79696e742834292064656661756c74204e' +
        '554c4c2c'
      '2020424553545f444154554d20646174652064656661756c74204e554c4c2c'
      '2020494e464f20746578742c'
      
        '202042525554544f5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      
        '20204d5753545f465245495f464c414720656e756d28274e272c27592729204e' +
        '4f54204e554c4c2064656661756c7420274e272c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b455920414444525f49442028414444525f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027564552' +
        '54524147504f5327'
      '23'
      ''
      '435245415445205441424c452056455254524147504f532028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '20204a4f55524e414c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020415254494b454c5459502063686172283129204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20205656544e554d20696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '2020504f534954494f4e20696e7428313129204e4f54204e554c4c2064656661' +
        '756c74202730272c'
      '2020564945575f504f5320636861722833292064656661756c74204e554c4c2c'
      
        '20204d41544348434f44452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204152544e554d2076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020424152434f44452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '20204d454e474520646563696d616c2831302c3329204e4f54204e554c4c2064' +
        '656661756c742027302e303030272c'
      
        '20204c41454e47452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '20204252454954452076617263686172283230292064656661756c74204e554c' +
        '4c2c'
      
        '2020484f4548452076617263686172283230292064656661756c74204e554c4c' +
        '2c'
      
        '202047524f455353452076617263686172283230292064656661756c74204e55' +
        '4c4c2c'
      
        '202044494d454e53494f4e2076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      
        '20204745574943485420646563696d616c2831302c3329204e4f54204e554c4c' +
        '2064656661756c742027302e303030272c'
      
        '20204d455f45494e484549542076617263686172283130292064656661756c74' +
        '204e554c4c2c'
      
        '202050525f45494e4845495420646563696d616c2831302c3329204e4f54204e' +
        '554c4c2064656661756c742027312e303030272c'
      
        '202056504520696e742831312920756e7369676e6564204e4f54204e554c4c20' +
        '64656661756c74202731272c'
      
        '2020454b5f505245495320646563696d616c2831302c3429204e4f54204e554c' +
        '4c2064656661756c742027302e30303030272c'
      
        '202043414c435f46414b544f5220646563696d616c28362c3529204e4f54204e' +
        '554c4c2064656661756c742027302e3030303030272c'
      
        '202045505245495320646563696d616c2831302c3429204e4f54204e554c4c20' +
        '64656661756c742027302e30303030272c'
      
        '202047505245495320646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '2020455f52474557494e4e20646563696d616c2831302c3429204e4f54204e55' +
        '4c4c2064656661756c742027302e30303030272c'
      
        '2020475f52474557494e4e20646563696d616c2831302c3229204e4f54204e55' +
        '4c4c2064656661756c742027302e3030272c'
      
        '202052414241545420646563696d616c2831302c3229204e4f54204e554c4c20' +
        '64656661756c742027302e3030272c'
      
        '20205241424154543220646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '20205241424154543320646563696d616c2831302c3229204e4f54204e554c4c' +
        '2064656661756c742027302e3030272c'
      
        '2020455f5241424154545f42455452414720646563696d616c2831302c342920' +
        '4e4f54204e554c4c2064656661756c742027302e30303030272c'
      
        '2020475f5241424154545f42455452414720646563696d616c2831302c322920' +
        '4e4f54204e554c4c2064656661756c742027302e3030272c'
      
        '20205354455545525f434f44452074696e79696e74283429204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020414c545445494c5f50524f5a20646563696d616c2831302c3229204e4f54' +
        '204e554c4c2064656661756c742027302e3130272c'
      
        '2020414c545445494c5f5354434f44452074696e79696e74283429204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '2020474547454e4b544f20696e7428313129204e4f54204e554c4c2064656661' +
        '756c7420272d31272c'
      '202042455a454943484e554e4720746578742c'
      
        '2020414c545445494c5f464c414720656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '202042455a5f464553545f464c414720656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '202042525554544f5f464c414720656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c7420274e272c'
      '20205052494d415259204b45592020285245435f4944292c'
      '20204b455920415254494b454c5f49442028415254494b454c5f4944292c'
      '20204b455920414444525f49442028414444525f4944292c'
      
        '20204b4559204a4f55524e414c5f494420284a4f55524e414c5f49442c504f53' +
        '4954494f4e29'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027564552' +
        '54524554455227'
      '23'
      ''
      '435245415445205441424c45205645525452455445522028'
      
        '20205645525452455445525f494420696e7428313129204e4f54204e554c4c20' +
        '6175746f5f696e6372656d656e742c'
      
        '202056455254525f4e554d4d4552207661726368617228313029206465666175' +
        '6c74204e554c4c2c'
      
        '2020564e414d452076617263686172283330292064656661756c74204e554c4c' +
        '2c'
      '20204e414d452076617263686172283330292064656661756c74204e554c4c2c'
      
        '2020446174756d4e6575206461746574696d652064656661756c74204e554c4c' +
        '2c'
      
        '2020446174756d4265617262656974656e206461746574696d65206465666175' +
        '6c74204e554c4c2c'
      
        '202042656e75747a65724e65752076617263686172283530292064656661756c' +
        '74204e554c4c2c'
      
        '202042656e75747a65724265617262656974656e207661726368617228353029' +
        '2064656661756c74204e554c4c2c'
      
        '2020414e524544452076617263686172283135292064656661756c74204e554c' +
        '4c2c'
      
        '2020544954454c2076617263686172283135292064656661756c74204e554c4c' +
        '2c'
      
        '20205a555341545a2076617263686172283430292064656661756c74204e554c' +
        '4c2c'
      
        '20205a555341545a322076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      
        '20205a554841454e44454e2076617263686172283430292064656661756c7420' +
        '4e554c4c2c'
      
        '2020535452415353452076617263686172283430292064656661756c74204e55' +
        '4c4c2c'
      '20204c414e4420766172636861722835292064656661756c74204e554c4c2c'
      '2020504c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204f52542076617263686172283430292064656661756c74204e554c4c2c'
      
        '202054454c45464f4e207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      '2020464158207661726368617228313030292064656661756c74204e554c4c2c'
      
        '202046554e4b207661726368617228313030292064656661756c74204e554c4c' +
        '2c'
      
        '2020454d41494c207661726368617228313030292064656661756c74204e554c' +
        '4c2c'
      
        '2020494e5445524e4554207661726368617228313030292064656661756c7420' +
        '4e554c4c2c'
      
        '20205350524143485f494420736d616c6c696e742836292064656661756c7420' +
        '2732272c'
      
        '202050524f564953494f4e5341525420636861722831292064656661756c7420' +
        '4e554c4c2c'
      
        '20204142524543484e554e47535a45495450554e4b5420656e756d282752272c' +
        '275a27292064656661756c7420275a272c'
      
        '202050524f564953494f4e4d49545452414e53504f525420656e756d28275927' +
        '2c274e27292064656661756c7420274e272c'
      
        '202050524f564953494f4e5341545a20666c6f617428352c3229206465666175' +
        '6c74204e554c4c2c'
      
        '20204c45545a54454142524543484e554e4720646174652064656661756c7420' +
        '4e554c4c2c'
      
        '2020554d5341545a20646563696d616c2831322c32292064656661756c74204e' +
        '554c4c2c'
      
        '202050524f564953494f4e20646563696d616c2831302c32292064656661756c' +
        '74204e554c4c2c'
      
        '20204245534348414546544947554e475341525420736d616c6c696e74283629' +
        '2064656661756c74204e554c4c2c'
      
        '20204245534348414546544947554e47534752414420736d616c6c696e742836' +
        '292064656661756c74204e554c4c2c'
      
        '20204755454c5449475f564f4e206461746574696d652064656661756c74204e' +
        '554c4c2c'
      
        '20204755454c5449475f424953206461746574696d652064656661756c74204e' +
        '554c4c2c'
      
        '2020474542444154554d206461746574696d652064656661756c74204e554c4c' +
        '2c'
      
        '202047455343484c4543485420656e756d28274d272c27572729204e4f54204e' +
        '554c4c2064656661756c7420274d272c'
      
        '202046414d5354414e4420736d616c6c696e742836292064656661756c74204e' +
        '554c4c2c'
      '202042414e4b2076617263686172283430292064656661756c74204e554c4c2c'
      
        '20204b544f5f494e48414245522076617263686172283430292064656661756c' +
        '74204e554c4c2c'
      '2020424c5a2076617263686172283130292064656661756c74204e554c4c2c'
      '20204b544f2076617263686172283230292064656661756c74204e554c4c2c'
      '202042454d45524b554e4720746578742c'
      
        '202045525354454c4c54206461746574696d652064656661756c74204e554c4c' +
        '2c'
      
        '202045525354454c4c545f4e414d452076617263686172283230292064656661' +
        '756c74204e554c4c2c'
      '2020474541454e44206461746574696d652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '20205553455246454c445f303120766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303220766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303320766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303420766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303520766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303620766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303720766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303820766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f303920766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      
        '20205553455246454c445f313020766172636861722832353529206465666175' +
        '6c74204e554c4c2c'
      '20205052494d415259204b45592020285645525452455445525f4944292c'
      
        '2020554e49515545204b4559204944585f56455f4e554d202856455254525f4e' +
        '554d4d455229'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027574152' +
        '454e4752555050454e27'
      '23'
      ''
      '435245415445205441424c4520574152454e4752555050454e2028'
      
        '2020494420696e7428313129204e4f54204e554c4c206175746f5f696e637265' +
        '6d656e742c'
      
        '2020544f505f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      
        '20204e414d4520766172636861722832353029204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '2020424553434852454942554e4720746578742c'
      '20204445465f454b544f20696e74283131292064656661756c7420272d31272c'
      '20204445465f414b544f20696e74283131292064656661756c7420272d31272c'
      
        '20205354455545525f434f44452074696e79696e7428342920756e7369676e65' +
        '64204e4f54204e554c4c2064656661756c74202732272c'
      
        '2020564b315f46414b544f5220666c6f617428362c3529204e4f54204e554c4c' +
        '2064656661756c742027302e3030303030272c'
      
        '2020564b325f46414b544f5220666c6f617428362c3529204e4f54204e554c4c' +
        '2064656661756c742027302e3030303030272c'
      
        '2020564b335f46414b544f5220666c6f617428362c3529204e4f54204e554c4c' +
        '2064656661756c742027302e3030303030272c'
      
        '2020564b345f46414b544f5220666c6f617428362c3529204e4f54204e554c4c' +
        '2064656661756c742027302e3030303030272c'
      
        '2020564b355f46414b544f5220666c6f617428362c3529204e4f54204e554c4c' +
        '2064656661756c742027302e3030303030272c'
      '2020564f52474142454e20746578742c'
      '20205052494d415259204b4559202028494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027574152' +
        '54554e4727'
      '23'
      ''
      '435245415445205441424c452057415254554e472028'
      
        '20205245435f494420696e7428313129204e4f54204e554c4c206175746f5f69' +
        '6e6372656d656e742c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '2020424553434852454942554e47207661726368617228323535292064656661' +
        '756c74204e554c4c2c'
      '202057415254554e4720646174652064656661756c74204e554c4c2c'
      '2020494e54455256414c4c20696e74283131292064656661756c74202730272c'
      
        '202057564552545241472076617263686172283230292064656661756c74204e' +
        '554c4c2c'
      '202042454d45524b554e4720746578742c'
      '20204c4542454e534c41554620746578742c'
      '20204c4953544520746578742c'
      
        '202057415254554e475f5459502076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      
        '202057564552545241475f4e5220736d616c6c696e742836292064656661756c' +
        '74202730272c'
      
        '2020534f4c4c5a4549545f4b5720666c6f617428332c31292064656661756c74' +
        '204e554c4c2c'
      
        '2020534f4c4c5a4549545f475720666c6f617428332c31292064656661756c74' +
        '204e554c4c2c'
      
        '2020454e544645524e554e4720696e742831312920756e7369676e6564206465' +
        '6661756c74204e554c4c2c'
      
        '202042454d5f4f5054312074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054322074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054332074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054342074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054352074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054362074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054372074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054382074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      
        '202042454d5f4f5054392074696e79696e7428312920756e7369676e65642064' +
        '656661756c74202730272c'
      '202045525354454c4c5420646174652064656661756c74204e554c4c2c'
      
        '2020455253545f4e414d452076617263686172283230292064656661756c7420' +
        '4e554c4c2c'
      '2020474541454e4445525420646174652064656661756c74204e554c4c2c'
      
        '2020474541454e445f4e414d452076617263686172283230292064656661756c' +
        '74204e554c4c2c'
      '20205052494d415259204b45592020285245435f494429'
      '293b'
      ''
      ''
      ''
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c65202742454e55545a' +
        '455252454348544527'
      '23'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202230222c204e554c4c2c20223131323739222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202231222c2022457277656974657274222c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202232222c2022416e737072656368706172746e6572222c202230222c204e' +
        '554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202233222c20224c6965666572616e73636872696674656e222c202230222c' +
        '204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303230222c2022417274696b656c222c' +
        '202230222c204e554c4c2c20223131323739222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303230222c2022417274696b656c222c' +
        '202231222c2022507265697365222c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303430222c20224d6974617262656974' +
        '6572222c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303530222c202250494d222c20223022' +
        '2c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303630222c20224e6f74697a656e222c' +
        '202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303730222c2022566572747265746572' +
        '222c202230222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303330222c20224b465a222c20223022' +
        '2c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303130222c2022416e6765626f74222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303230222c202241756674726167222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303330222c20224c6965666572736368' +
        '65696e222c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303430222c2022526563686e756e6722' +
        '2c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303530222c202245696e6b617566222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303630222c2022454b2d42657374656c' +
        '6c756e67222c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303030222c20225374616d6d64617465' +
        '6e222c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303030222c2022566f7267e46e676522' +
        '2c20222d31222c204e554c4c2c202232222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303730222c20225665727472e4676522' +
        '2c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303830222c20224d61686e756e67222c' +
        '202230222c204e554c4c2c20223132323933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303930222c2022546578747665726172' +
        '62656974756e67222c202230222c204e554c4c2c202238323037222c204e554c' +
        '4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303030222c20224a6f75726e616c6522' +
        '2c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303130222c2022416e6765626f74222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303230222c202241756674726167222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303330222c20224c6965666572736368' +
        '65696e222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303430222c2022526563686e756e6722' +
        '2c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303530222c202245696e6b617566222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303630222c2022454b2d42657374656c' +
        '6c756e67222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303030222c202246696e616e7a656e22' +
        '2c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303130222c20224b617373656e627563' +
        '68222c202230222c204e554c4c2c202238323037222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303230222c20225a61686c756e677365' +
        '696e67616e67222c202230222c204e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303330222c20225a61686c756e677361' +
        '757367616e67222c202230222c204e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303430222c2022dc6265727765697375' +
        '6e67656e222c202230222c204e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303530222c20224c6173747363687269' +
        '6674656e222c202230222c204e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303630222c20224578706f7274204669' +
        '6275222c202230222c204e554c4c2c202232303439222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303030222c2022546f6f6c73222c2022' +
        '2d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303130222c202253746174697374696b' +
        '222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303230222c202253686f707472616e73' +
        '666572222c202230222c204e554c4c2c202233303733222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303330222c2022496e76656e74757222' +
        '2c202230222c204e554c4c2c20223132323935222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303430222c20224578706f7274222c20' +
        '2230222c204e554c4c2c20223130323535222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303530222c202257617274756e677364' +
        '6174656e222c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303030222c20224b61737365222c20' +
        '222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303230222c2022417274696b656c22' +
        '2c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303330222c20224b756e64656e222c' +
        '202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303130222c20224d61696e222c2022' +
        '30222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282231222c20222d31222c202230222c202241646d696e6973747261746f72' +
        '656e222c202230222c204e554c4c2c20223635353335222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202230222c20224c61676572222c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202230222c202245696e6b617566222c20223022' +
        '2c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202230222c20225665726b617566222c20223022' +
        '2c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202230222c20224275636868616c74756e67222c' +
        '202230222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223131323739222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202235303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202233222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238323037222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202232303830222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223132323933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202232303439222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231303331222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202235303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223130323431222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202234303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202234303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231303235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303130222c204e554c4c2c202230222c' +
        '204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303230222c204e554c4c2c202230222c' +
        '204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303330222c204e554c4c2c202230222c' +
        '204e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282231222c202231222c202230222c2022222c202230222c204e554c4c2c20' +
        '2230222c204e554c4c293b'
      ''
      '23'
      '232044756d70696e67206461746120666f72207461626c6520274c414e4427'
      '23'
      ''
      
        '494e5345525420494e544f204c414e442056414c55455328224154222c202241' +
        '757374726961222c2022d6737465727265696368222c2022415554222c202241' +
        '222c202235222c204e554c4c2c2022455552222c2022204575726f222c204e55' +
        '4c4c2c20225922293b'
      
        '494e5345525420494e544f204c414e442056414c55455328224445222c202247' +
        '65726d616e79222c2022446575747363686c616e64222c2022444555222c2022' +
        '44222c202235222c202230303439222c2022455552222c2022204575726f222c' +
        '202244222c20225922293b'
      
        '494e5345525420494e544f204c414e442056414c55455328224652222c202246' +
        '72616e6365222c20224672616e6b7265696368222c2022465241222c20224622' +
        '2c202231222c204e554c4c2c2022455552222c2022204575726f222c20224622' +
        '2c20225922293b'
      
        '494e5345525420494e544f204c414e442056414c55455328224742222c202255' +
        '6e69746564204b696e67646f6d222c202256657265696e6967746573204bf66e' +
        '6967726569636820766f6e2047726fdf62726974616e6e69656e20756e64204e' +
        '6f72642049726c616e64222c2022474252222c204e554c4c2c202231222c204e' +
        '554c4c2c2022474250222c2022205066756e6420537465726c696e67222c204e' +
        '554c4c2c20225922293b'
      
        '494e5345525420494e544f204c414e442056414c55455328224348222c202253' +
        '7769747a65726c616e64222c20225363687765697a222c2022434845222c204e' +
        '554c4c2c202231222c204e554c4c2c2022434846222c2022205363687765697a' +
        '6572204672616e63222c204e554c4c2c20224e22293b'
      
        '494e5345525420494e544f204c414e442056414c55455328224c49222c20224c' +
        '6965636874656e737465696e222c20224c6965636874656e737465696e222c20' +
        '224c4945222c2022464c222c202231222c204e554c4c2c2022434846222c2022' +
        '205363687765697a6572204672616e6b656e222c204e554c4c2c20224e22293b'
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c652027535052414348' +
        '454e27'
      '23'
      ''
      
        '494e5345525420494e544f20535052414348454e2056414c554553282231222c' +
        '2022456e676c697368222c2022656e222c202232222c20224e22293b'
      
        '494e5345525420494e544f20535052414348454e2056414c554553282232222c' +
        '202244657574736368222c20226465222c202231222c20225922293b'
      
        '494e5345525420494e544f20535052414348454e2056414c554553282233222c' +
        '202245737061f16f6c222c20226573222c202233222c20224e22293b'
      ''
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c652027574152454e47' +
        '52555050454e27'
      '23'
      ''
      
        '494e5345525420494e544f20574152454e4752555050454e2056414c55455328' +
        '2231222c20222d31222c2022576172656e6772757070652031222c204e554c4c' +
        '2c20222d31222c20222d31222c202232222c2022302e3030303030222c202230' +
        '2e3030303030222c2022302e3030303030222c2022302e3030303030222c2022' +
        '302e3030303030222c204e554c4c293b'
      
        '494e5345525420494e544f20574152454e4752555050454e2056414c55455328' +
        '2232222c20222d31222c2022576172656e6772757070652032222c204e554c4c' +
        '2c20222d31222c20222d31222c202232222c2022302e3030303030222c202230' +
        '2e3030303030222c2022302e3030303030222c2022302e3030303030222c2022' +
        '302e3030303030222c204e554c4c293b'
      
        '494e5345525420494e544f20574152454e4752555050454e2056414c55455328' +
        '2233222c20222d31222c2022576172656e6772757070652033222c204e554c4c' +
        '2c20222d31222c20222d31222c202232222c2022302e3030303030222c202230' +
        '2e3030303030222c2022302e3030303030222c2022302e3030303030222c2022' +
        '302e3030303030222c204e554c4c293b'
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c6520274d4954415242' +
        '454954455227'
      '23'
      ''
      
        '494e5345525420494e544f204d495441524245495445522056414c5545532822' +
        '31222c20222d222c202241646d696e6973747261746f72222c2022222c202241' +
        '646d696e6973747261746f72222c202241646d696e222c202237646465393730' +
        '34313032343162353234313731376561383431613832666338222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c202232222c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20224d222c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c2022323030' +
        '342d30372d31382031373a33323a3030222c20224a2e506f6b72616e6474222c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c293b'
      ''
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c652027524142415454' +
        '4752555050454e27'
      '23'
      ''
      
        '494e5345525420494e544f205241424154544752555050454e2056414c554553' +
        '28222d222c202235222c202231222c202230222c2022302e3030222c2022302e' +
        '3030222c2022302e3030222c20222d31222c20226b65696e6520526162617474' +
        '67727570706522293b'
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c652027524547495354' +
        '45525927'
      '23'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e222c202244454641554c54222c2022616c6c672e2050726f6772616d6d6569' +
        '6e7374656c6c756e67656e222c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e22' +
        '2c20224e222c2022323030333039313431393233343722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e222c20224c4549545741454852554e47222c202280222c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c202231222c20224e222c20224e222c202232303033303931343139323334' +
        '3622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e222c202244425f56455253494f4e222c2022312e3130222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c202231222c20224e222c20224e222c2022323030333039313832313536' +
        '343422293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c41594f5554222c202244454641554c54222c20225370616c74656e62' +
        '72656974656e2c204e616d656e206574632e222c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c2022' +
        '31222c20224e222c20224e222c2022323030333039313431393234313522293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c50494d222c2022474c4f425f555345524944222c204e554c4c2c204e55' +
        '4c4c2c20222d31222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c202233222c20224e222c20224e222c20223230303430373138' +
        '31373235343722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c46494255222c202244656661756c74222c202245696e7374656c6c756e' +
        '67656e2066fc722064656e20466962756578706f7274222c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c20224e222c20224e222c2022323030343037313831373237' +
        '353122293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c202244454641554c54222c20224c61796f75742064' +
        '65722042656c656765222c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20' +
        '224e222c2022323030333039313431393234323522293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c2022564b5f4147425f4d41494c5f5355424a454354' +
        '222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e22' +
        '2c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c2022564b5f524543485f4d41494c5f5355424a4543' +
        '54222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e' +
        '222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c2022564b5f4c4945465f4d41494c5f5355424a4543' +
        '54222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e' +
        '222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c2022454b5f424553545f4d41494c5f5355424a4543' +
        '54222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e' +
        '222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5245504f5254222c20225a41484c554e47535a49454c5f534f464f5254' +
        '5f54455854222c2022536f666f7274222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c' +
        '20224e222c20224e222c2022323030333039313431393132353722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5741454852554e47222c2022444d222c20224465757473636865204d61' +
        '726b222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c2022312e' +
        '3935353833222c204e554c4c2c204e554c4c2c202231222c20224e222c20224e' +
        '222c2022323030333039313431393235303922293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5741454852554e47222c202280222c20224575726f222c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c202231222c204e554c4c2c204e55' +
        '4c4c2c202231222c20224e222c20224e222c2022323030333039313431393235' +
        '313022293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5741454852554e47222c2022455552222c20224575726f222c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c204e554c4c2c20' +
        '4e554c4c2c202231222c20224e222c20224e222c202232303033303931343139' +
        '3235313022293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5741454852554e47222c202224222c2022555320446f6c6c6172222c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c2022312e32222c204e' +
        '554c4c2c204e554c4c2c202231222c20224e222c20224e222c20223230303330' +
        '39313431393235313022293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c2022445044222c204e554c4c2c204e554c4c2c20' +
        '2231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c20224e222c20224e222c2022323030333039313431393234' +
        '313622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c2022667265692048617573222c204e554c4c2c20' +
        '4e554c4c2c202232222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c2022323030333039' +
        '313431393234313622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c2022506f73742d4e6163686e61686d65222c204e' +
        '554c4c2c204e554c4c2c202233222c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c202232' +
        '3030333039313431393234313622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c2022506f7374222c204e554c4c2c204e554c4c2c' +
        '202234222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c20224e222c20224e222c20223230303330393134313932' +
        '34313622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c2022555053222c204e554c4c2c204e554c4c2c20' +
        '2235222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c20224e222c20224e222c2022323030333039313431393234' +
        '313722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c20225550532d4e6163686e61686d65222c204e55' +
        '4c4c2c204e554c4c2c202236222c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c20223230' +
        '30333039313431393234313722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4c494546415254222c202253656c6273746162686f6c756e67222c204e' +
        '554c4c2c204e554c4c2c202237222c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c202232' +
        '3030333039313431393234313722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c2022566f726b61737365222c202230222c204e55' +
        '4c4c2c202230222c20223330222c204e554c4c2c202230222c20224265747261' +
        '672070657220566f726b6173736520657268616c74656e222c20224265747261' +
        '672070657220566f726b6173736520657268616c74656e222c204e554c4c2c20' +
        '224e222c20224e222c2022323030343037313831373335323022293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c2022426172222c202231222c204e554c4c2c2022' +
        '31222c20223330222c204e554c4c2c202233222c202242657472616720424152' +
        '20657268616c74656e222c20224265747261672042415220657268616c74656e' +
        '222c204e554c4c2c20224e222c20224e222c2022323030343037313831373335' +
        '323622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c2022dc62657277656973756e672042616e6b222c' +
        '202232222c204e554c4c2c20223134222c20223330222c204e554c4c2c202232' +
        '222c2022dc62657277656973756e672042616e6b222c2022dc62657277656973' +
        '756e672042616e6b222c204e554c4c2c20224e222c20224e222c202232303034' +
        '3037313831373335333122293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c20224e6163686e61686d65222c202233222c204e' +
        '554c4c2c20223134222c20223330222c204e554c4c2c202232222c2022426574' +
        '7261672070657220506f73742d4e6163686e61686d6520657268616c74656e22' +
        '2c20224265747261672070657220506f73742d4e6163686e61686d6520657268' +
        '616c74656e222c204e554c4c2c20224e222c20224e222c202232303034303731' +
        '3831373335333622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c2022555053204e6163686e61686d65222c202234' +
        '222c204e554c4c2c20223134222c20223330222c204e554c4c2c202232222c20' +
        '2242657472616720706572205550532d4e6163686e61686d6520657268616c74' +
        '656e222c202242657472616720706572205550532d4e6163686e61686d652065' +
        '7268616c74656e222c204e554c4c2c20224e222c20224e222c20223230303430' +
        '37313831373335343122293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c202253636865636b222c202235222c204e554c4c' +
        '2c20223134222c20223330222c204e554c4c2c202232222c2022426574726167' +
        '207065722053636865636b20657268616c74656e222c20224265747261672070' +
        '65722053636865636b20657268616c74656e222c204e554c4c2c20224e222c20' +
        '224e222c2022323030343037313831373335343622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c202245432d4b41525445222c202236222c204e55' +
        '4c4c2c20223134222c20223330222c204e554c4c2c202232222c202242657472' +
        '6167207065722045432d4b415254452065696e67657a6f67656e222c20224265' +
        '74726167207065722045432d4b415254452065696e67657a6f67656e222c204e' +
        '554c4c2c20224e222c20224e222c202232303034303731383137333535312229' +
        '3b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c20224b72656469746b61727465222c202237222c' +
        '204e554c4c2c20223134222c20223330222c204e554c4c2c202232222c202242' +
        '6574726167207769726420706572204b72656469746b617274652065696e6765' +
        '7a6f67656e222c2022426574726167207769726420706572204b72656469746b' +
        '617274652065696e67657a6f67656e222c204e554c4c2c20224e222c20224e22' +
        '2c2022323030343037313831373335353622293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c202250617950616c222c202238222c204e554c4c' +
        '2c202230222c202237222c204e554c4c2c202230222c20224265747261672070' +
        '65722050617950616c20657268616c74656e222c202242657472616720706572' +
        '2050617950616c20657268616c74656e222c204e554c4c2c20224e222c20224e' +
        '222c2022323030343037313831373336303222293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c5a41484c415254222c20224c61737473636872696674222c202239222c' +
        '204e554c4c2c20223134222c20223330222c204e554c4c2c202232222c202257' +
        '69722062756368656e2064656e2042657472616720766f6e20696872656d204b' +
        '6f6e746f20254b544f4e522520424c5a2025424c5a252061622e222c20225769' +
        '722062756368656e2064656e2042657472616720766f6e20696872656d204b6f' +
        '6e746f20254b544f4e522520424c5a2025424c5a252061622e222c204e554c4c' +
        '2c20224e222c20224e222c2022323030343037313831373336313122293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e222c20224b544f5f4c454e222c204e554c4c2c204e' +
        '554c4c2c20223130222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c202233222c20224e222c20224e222c202232303033303931' +
        '3431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e222c2022424c5a5f4c454e222c204e554c4c2c204e' +
        '554c4c2c202238222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c202233222c20224e222c20224e222c20223230303330393134' +
        '31393132353722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c202244454641554c54222c' +
        '2022416472657373666f726d617465222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c' +
        '20224e222c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '31222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4f5254402c20404b554e5f504c5a405c5c6e404b554e5f4c414e445f4c414e47' +
        '40222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e222c20223230' +
        '30333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '32222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4c414e444020404b554e5f504c5a4020404b554e5f4f5254405c5c6e404b554e' +
        '5f4c414e445f4c414e4740222c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e22' +
        '2c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '35222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4c414e444020404b554e5f504c5a4020404b554e5f4f5254405c5c6e404b554e' +
        '5f4c414e445f4c414e4740222c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e22' +
        '2c20224e222c2022323030333039313431393132353722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414444525f484952222c2022616c6c6520416472657373656e222c204e' +
        '554c4c2c204e554c4c2c202230222c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c202232' +
        '3030333039313431393234313222293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414444525f484952222c20224b756e64656e2031222c204e554c4c2c20' +
        '4e554c4c2c202231222c204e554c4c2c204e554c4c2c204e554c4c2c20224b55' +
        '4e44454e4752555050453d31222c204e554c4c2c204e554c4c2c20224e222c20' +
        '224e222c2022323030333039313431393234313222293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414444525f484952222c20224b756e64656e2032222c204e554c4c2c20' +
        '4e554c4c2c202232222c204e554c4c2c204e554c4c2c204e554c4c2c20224b55' +
        '4e44454e4752555050453d32222c204e554c4c2c204e554c4c2c20224e222c20' +
        '224e222c2022323030333039313431393234313222293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414444525f484952222c20224b756e64656e2033222c204e554c4c2c20' +
        '4e554c4c2c202233222c204e554c4c2c204e554c4c2c204e554c4c2c20224b55' +
        '4e44454e4752555050453d33222c204e554c4c2c204e554c4c2c20224e222c20' +
        '224e222c2022323030333039313431393234313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414444525f484952222c20224c6965666572616e74656e222c204e554c' +
        '4c2c204e554c4c2c2022393939222c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c20224b554e44454e4752555050453d393939222c204e554c4c2c204e554c4c' +
        '2c20224e222c20224e222c2022323030333039313431393234313522293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022564b2d415546222c2022303030303030222c' +
        '204e554c4c2c202238222c2022323430303030222c202236222c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030' +
        '343037313831373336313822293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022564b2d414742222c2022303030303030222c' +
        '204e554c4c2c202231222c2022323430303030222c202236222c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030' +
        '343037313831373336323422293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022564b2d4c494546222c202230303030303022' +
        '2c204e554c4c2c202232222c2022323430303030222c202236222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30343037313831373336323822293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022564b2d52454348222c202230303030303022' +
        '2c204e554c4c2c202233222c2022323430303030222c202236222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30343037313831373336333122293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022454b2d52454348222c202230303030303022' +
        '2c204e554c4c2c202235222c2022323430303030222c202236222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30343037313831373336333522293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c202245444954222c2022303030303030222c204e' +
        '554c4c2c20223130222c202231303030222c202236222c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030333039' +
        '313431393330313522293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c20224b554e4e554d222c2022303030303030222c' +
        '204e554c4c2c20223939222c202235303030222c202236222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c202233222c20224e222c20224e222c202232303033' +
        '3039313431393234323022293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022564b2d4b41535345222c202230303030222c' +
        '204e554c4c2c20223232222c202231303030222c202234222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c202233222c20224e222c20224e222c202232303033' +
        '3039313431393234323122293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022454b2d42455354222c202230303030222c20' +
        '4e554c4c2c202236222c202231303030222c202234222c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030333039' +
        '313431393234323122293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022554542455257454953554e47222c20223030' +
        '3030222c204e554c4c2c2022313130222c202231303030222c202234222c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20' +
        '22323030333039313431393234323422293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c20224b52442d4e554d222c202230303030303022' +
        '2c204e554c4c2c20223330222c20223735303030222c202236222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30333039313431393234323422293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c20224445422d4e554d222c202230303030303022' +
        '2c204e554c4c2c20223331222c20223135303030222c202236222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30333039313431393234323422293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c202256455254524147222c202230303030303022' +
        '2c204e554c4c2c20223233222c202231303030222c202236222c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030' +
        '333039313431393234323522293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4e554d42455253222c2022415254494b454c4e554d4d4552222c202230' +
        '3030303030222c204e554c4c2c20223938222c202231303030222c2022313022' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e' +
        '222c2022323030333039313832313536343422293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4d575354222c202230222c20226f686e65204d775374222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202230222c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c20224e222c20224e222c202232303033303931343139' +
        '3234313722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4d575354222c202232222c202265726d2e204d7753742d5361747a222c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202237222c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c20223230303430' +
        '37313831373337313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4d575354222c202231222c2022766f6c6c6572204d7753742d5361747a' +
        '222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20223136222c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c20224e222c20224e222c20223230' +
        '30343037313831373337313422293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4d575354222c202233222c202252657365727665222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c202230222c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c20224e222c20224e222c2022323030333039313431393234' +
        '313822293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c4d575354222c202244454641554c54222c204e554c4c2c204e554c4c2c' +
        '202231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c20224e222c20224e222c20223230303330393134313932' +
        '34313822293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022424f4e5f55454245525343485249465431222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030333039' +
        '313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022424f4e5f55454245525343485249465432222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030333039' +
        '313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022424f4e5f55454245525343485249465433222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030333039' +
        '313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022445255434b4552504f5254222c20224c505432222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c202231222c20224e222c20224e222c202232303033303931343139' +
        '3132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022424f4e445255434b4552222c204e554c4c2c204e554c4c2c2022' +
        '31222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c202233222c20224e222c20224e222c20223230303330393134313931333133' +
        '22293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022445255434b4449414c4f47222c204e554c4c2c204e554c4c2c20' +
        '2231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c202233222c20224e222c20224e222c202232303033303931343139313331' +
        '3322293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c2022534f464f5254445255434b222c204e554c4c2c204e554c4c2c20' +
        '2230222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c202233222c20224e222c20224e222c202232303033303931343139313331' +
        '3322293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c202244454641554c545f464f524d554c4152222c2022222c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202231222c20224e222c20224e222c2022323030333039313431' +
        '393133313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224b4153' +
        '5345222c202244454641554c545f445255434b4552222c202244656661756c74' +
        '222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030' +
        '333039313431393133313322293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '49424552222c202244454641554c54222c202244656661756c74222c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202231222c20224e222c20224e222c2022323030333039313431' +
        '393133313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '494245525c5c424f4e445255434b4552222c202244454641554c54222c202254' +
        '7265696265722066fc7220426f6e647275636b6572222c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c202231222c20224e222c20224e222c20223230303330393134313931333133' +
        '22293b'
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '494245525c5c4b415353454e444953504c415953222c202244454641554c5422' +
        '2c2022547265696265722066fc72204b617373656e646973706c617973222c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030333039' +
        '313431393133313322293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c202244454641554c54222c2022616c6c672e2053686f7065696e737465' +
        '6c6c756e67656e222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e' +
        '222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c202244454641554c545f4445424e554d222c204e554c4c2c204e554c4c' +
        '2c202230222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c202233222c20224e222c20224e222c20223230303330393134313931' +
        '33313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c20225553455f53484f50222c204e554c4c2c204e554c4c2c202231222c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c2022' +
        '33222c20224e222c20224e222c2022323030333037323031353531343722293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c20225553455f53484f505f4f524445524944222c204e554c4c2c204e55' +
        '4c4c2c202231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202233222c20224e222c20224e222c2022323030333037323931' +
        '303532323222293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c202242525554544f5f53484f50222c204e554c4c2c204e554c4c2c2022' +
        '31222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c202233222c20224e222c20224e222c20223230303330373237313634393430' +
        '22293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c202253484f505452414e535f55534552222c2022222c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c202231222c20224e222c20224e222c2022323030333037323232333535' +
        '353522293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c202253484f505452414e535f534543524554222c2022222c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c202231222c20224e222c20224e222c202232303033303732323233' +
        '3535353522293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c2022494d504f52545f55524c222c2022222c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '2231222c20224e222c20224e222c202232303033303732353230343931352229' +
        '3b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c20225550444154455f55524c222c2022222c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '2231222c20224e222c20224e222c202232303033303732303135353134372229' +
        '3b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '50222c20225550444154454f524445525354415455535f53454e444d41494c22' +
        '2c204e554c4c2c204e554c4c2c202230222c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20' +
        '22323030333037323031353531343722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4f52444552535441545553222c20224f6666656e222c204e554c4c2c20' +
        '4e554c4c2c202231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c202233222c20224e222c20224e222c202232303033303732' +
        '3132333031353622293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4f52444552535441545553222c2022496e204265617262656974756e67' +
        '222c204e554c4c2c204e554c4c2c202232222c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c' +
        '2022323030333039313431393338343022293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4f52444552535441545553222c202256657273656e646574222c204e55' +
        '4c4c2c204e554c4c2c202233222c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030' +
        '333039313431393339313022293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c202244454641554c54222c20224d6170' +
        '70696e672066fc72205a61686c756e6773617274656e222c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c' +
        '4c2c202231222c20224e222c20224e222c202232303033303531333231343234' +
        '3222293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c20226d6f6e65796f72646572222c204e' +
        '554c4c2c204e554c4c2c202230222c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c20223230' +
        '30333038303132333532333922293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c2022636f64222c204e554c4c2c204e55' +
        '4c4c2c202233222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202233222c20224e222c20224e222c2022323030333037323232' +
        '313131343122293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c202270617970616c222c204e554c4c2c' +
        '204e554c4c2c202238222c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202233222c20224e222c20224e222c2022323030333039' +
        '313431393235333922293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c202262616e6b7472616e73666572222c' +
        '204e554c4c2c204e554c4c2c202239222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c202233222c20224e222c20224e222c2022' +
        '323030333039313431393235343022293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c5a41484c4152545f4d4150222c20226363222c204e554c4c2c204e554c' +
        '4c2c202237222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c202233222c20224e222c20224e222c202232303033303931343139' +
        '3235343122293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4c4945464152545f4d4150222c202244454641554c54222c20224d6170' +
        '70696e672066fc72204c6965666572617274656e222c204e554c4c2c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '202231222c20224e222c20224e222c2022323030333035313332313432343222' +
        '293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4c4945464152545f4d4150222c20226470222c204e554c4c2c204e554c' +
        '4c2c202234222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c202233222c20224e222c20224e222c202232303033303732323031' +
        '3235343622293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4c4945464152545f4d4150222c2022757073222c204e554c4c2c204e55' +
        '4c4c2c202235222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202233222c20224e222c20224e222c2022323030333037323232' +
        '313132303222293b'
      
        '494e5345525420494e544f2052454749535452592056414c554553282253484f' +
        '505c5c4c4945464152545f4d4150222c2022647064222c204e554c4c2c204e55' +
        '4c4c2c202231222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202233222c20224e222c20224e222c2022323030333037323232' +
        '313131353822293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c415254494b454c222c2022535543485f444c4c222c2022254150504449' +
        '522563616f5f73756368652e646c6c222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c' +
        '20224e222c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e222c2022535543485f444c4c222c20222541505044' +
        '49522563616f5f73756368652e646c6c222c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20223122' +
        '2c20224e222c20224e222c2022323030333039313431393132353722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c5545532822555345' +
        '5253455454494e4753222c202244454641554c54222c202262656e75747a6572' +
        '646566696e69657274652045696e7374656c6c756e67656e222c204e554c4c2c' +
        '204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c202231222c20224e222c20224e222c20223230303330393134313932' +
        '33313822293b'
      '20')
  end
  object FirBankTab: TZQuery
    Connection = DB1
    BeforePost = FirBankTabBeforePost
    SQL.Strings = (
      'select'
      
        'NAME as KURZBEZ, VAL_CHAR as INHABER, VAL_INT as BLZ, VAL_INT2 a' +
        's KTONR, VAL_INT3 as FIBU_KTO, MAINKEY'
      'from REGISTRY'
      'where MAINKEY='#39'MAIN\\FIRMENKONTEN'#39
      'order by VAL_INT3, KURZBEZ')
    Params = <>
    Left = 26
    Top = 376
    object FirBankTabkurzbez: TStringField
      DisplayLabel = 'Kurzbezeichnung'
      DisplayWidth = 20
      FieldName = 'KURZBEZ'
      Required = True
      Size = 100
    end
    object FirBankTabinhaber: TStringField
      DisplayLabel = 'Konto-Inhaber'
      FieldName = 'INHABER'
      Size = 255
    end
    object FirBankTabblz: TIntegerField
      DisplayLabel = 'Bankleitzahl'
      FieldName = 'BLZ'
    end
    object FirBankTabmainkey: TStringField
      FieldName = 'MAINKEY'
      Required = True
      Size = 255
    end
    object FirBankTabKTONR: TLargeintField
      DisplayLabel = 'Kontonummer'
      FieldName = 'KTONR'
    end
    object FirBankTabFIBU_KTO: TLargeintField
      DisplayLabel = 'Fibu-Konto'
      DisplayWidth = 6
      FieldName = 'FIBU_KTO'
      MaxValue = 999999
    end
  end
  object UpdateArtTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select '
      'REC_ID, WARENGRUPPE,'
      
        'EK_PREIS, VK1, VK2, VK3, VK4, VK5, VK1B, VK2B, VK3B, VK4B, VK5B,' +
        ' STEUER_CODE,'
      'MENGE_AKT, ERLOES_KTO, AUFW_KTO, RABGRP_ID'
      'from ARTIKEL'
      'where REC_ID = :ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 1
      end>
    Left = 456
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 1
      end>
  end
  object ReKFZTab: TZQuery
    SQL.Strings = (
      'select * from KFZ'
      'where KFZ_ID=:KID '
      'LIMIT 0,2')
    Params = <
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end>
    Left = 253
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'KID'
        ParamType = ptInput
      end>
    object ReKFZTabKFZ_ID: TIntegerField
      FieldName = 'KFZ_ID'
    end
    object ReKFZTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object ReKFZTabFGST_NUM: TStringField
      FieldName = 'FGST_NUM'
      Required = True
    end
    object ReKFZTabPOL_KENNZ: TStringField
      FieldName = 'POL_KENNZ'
      Required = True
      Size = 10
    end
    object ReKFZTabSCHL_ZU_2: TStringField
      FieldName = 'SCHL_ZU_2'
    end
    object ReKFZTabSCHL_ZU_3: TStringField
      FieldName = 'SCHL_ZU_3'
    end
    object ReKFZTabKM_STAND: TIntegerField
      FieldName = 'KM_STAND'
    end
    object ReKFZTabZULASSUNG: TDateField
      FieldName = 'ZULASSUNG'
    end
    object ReKFZTabLE_BESUCH: TDateField
      FieldName = 'LE_BESUCH'
    end
    object ReKFZTabNAE_TUEV: TDateField
      FieldName = 'NAE_TUEV'
    end
    object ReKFZTabNAE_AU: TDateField
      FieldName = 'NAE_AU'
    end
  end
  object LiefRabGrp: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from RABATTGRUPPEN'
      'where RABGRP_TYP=5'
      'order by RABGRP_ID')
    Params = <>
    Left = 184
    Top = 376
    object LiefRabGrpRABGRP_ID: TStringField
      DisplayWidth = 10
      FieldName = 'RABGRP_ID'
      Required = True
      Size = 10
    end
    object LiefRabGrpRABGRP_TYP: TIntegerField
      FieldName = 'RABGRP_TYP'
      Required = True
    end
    object LiefRabGrpMIN_MENGE: TIntegerField
      FieldName = 'MIN_MENGE'
      Required = True
      DisplayFormat = ',#0.0'
    end
    object LiefRabGrpLIEF_RABGRP: TIntegerField
      FieldName = 'LIEF_RABGRP'
      Required = True
      DisplayFormat = '00'
    end
    object LiefRabGrpRABATT1: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT1'
      Required = True
      DisplayFormat = '0"%"'
    end
    object LiefRabGrpRABATT2: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT2'
      Required = True
      DisplayFormat = '0"%"'
    end
    object LiefRabGrpRABATT3: TFloatField
      DisplayWidth = 5
      FieldName = 'RABATT3'
      Required = True
      DisplayFormat = '0"%"'
    end
    object LiefRabGrpADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
    object LiefRabGrpBESCHREIBUNG: TStringField
      DisplayWidth = 52
      FieldName = 'BESCHREIBUNG'
      Size = 100
    end
  end
  object RabGrpDS: TDataSource
    DataSet = LiefRabGrp
    Left = 120
    Top = 376
  end
  object ZBatchSql1: TZSQLProcessor
    Params = <>
    Connection = DB1
    Delimiter = ';'
    AfterExecute = ZBatchSql1AfterExecute
    BeforeExecute = ZBatchSql1BeforeExecute
    Left = 26
    Top = 120
  end
  object FirmaTab: TZQuery
    Connection = DB1
    OnCalcFields = FirmaTabCalcFields
    SQL.Strings = (
      'select * from FIRMA limit 0,1')
    Params = <>
    Left = 325
    Top = 16
    object FirmaTabANREDE: TStringField
      FieldName = 'ANREDE'
      Size = 250
    end
    object FirmaTabNAME1: TStringField
      FieldName = 'NAME1'
      Size = 250
    end
    object FirmaTabNAME2: TStringField
      FieldName = 'NAME2'
      Size = 250
    end
    object FirmaTabNAME3: TStringField
      FieldName = 'NAME3'
      Size = 250
    end
    object FirmaTabSTRASSE: TStringField
      FieldName = 'STRASSE'
      Size = 250
    end
    object FirmaTabLAND: TStringField
      FieldName = 'LAND'
      Size = 10
    end
    object FirmaTabPLZ: TStringField
      FieldName = 'PLZ'
      Size = 10
    end
    object FirmaTabORT: TStringField
      FieldName = 'ORT'
      Size = 250
    end
    object FirmaTabVORWAHL: TStringField
      FieldName = 'VORWAHL'
      Size = 250
    end
    object FirmaTabTELEFON1: TStringField
      FieldName = 'TELEFON1'
      Size = 250
    end
    object FirmaTabTELEFON2: TStringField
      FieldName = 'TELEFON2'
      Size = 250
    end
    object FirmaTabMOBILFUNK: TStringField
      FieldName = 'MOBILFUNK'
      Size = 250
    end
    object FirmaTabFAX: TStringField
      FieldName = 'FAX'
      Size = 250
    end
    object FirmaTabEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object FirmaTabWEBSEITE: TStringField
      FieldName = 'WEBSEITE'
      Size = 250
    end
    object FirmaTabBANK1_BLZ: TStringField
      FieldName = 'BANK1_BLZ'
      Size = 8
    end
    object FirmaTabBANK1_KONTONR: TStringField
      FieldName = 'BANK1_KONTONR'
      Size = 12
    end
    object FirmaTabBANK1_NAME: TStringField
      FieldName = 'BANK1_NAME'
      Size = 250
    end
    object FirmaTabBANK1_IBAN: TStringField
      FieldName = 'BANK1_IBAN'
      Size = 100
    end
    object FirmaTabBANK1_SWIFT: TStringField
      FieldName = 'BANK1_SWIFT'
      Size = 100
    end
    object FirmaTabBANK2_BLZ: TStringField
      FieldName = 'BANK2_BLZ'
      Size = 8
    end
    object FirmaTabBANK2_KONTONR: TStringField
      FieldName = 'BANK2_KONTONR'
      Size = 12
    end
    object FirmaTabBANK2_NAME: TStringField
      FieldName = 'BANK2_NAME'
      Size = 250
    end
    object FirmaTabBANK2_IBAN: TStringField
      FieldName = 'BANK2_IBAN'
      Size = 100
    end
    object FirmaTabBANK2_SWIFT: TStringField
      FieldName = 'BANK2_SWIFT'
      Size = 100
    end
    object FirmaTabKOPFTEXT: TMemoField
      FieldName = 'KOPFTEXT'
      BlobType = ftMemo
    end
    object FirmaTabFUSSTEXT: TMemoField
      FieldName = 'FUSSTEXT'
      BlobType = ftMemo
    end
    object FirmaTabABSENDER: TStringField
      FieldName = 'ABSENDER'
      Size = 250
    end
    object FirmaTabSTEUERNUMMER: TStringField
      FieldName = 'STEUERNUMMER'
      Size = 25
    end
    object FirmaTabUST_ID: TStringField
      FieldName = 'UST_ID'
      Size = 25
    end
    object FirmaTabIMAGE1: TBlobField
      FieldName = 'IMAGE1'
    end
    object FirmaTabIMAGE2: TBlobField
      FieldName = 'IMAGE2'
    end
    object FirmaTabIMAGE3: TBlobField
      FieldName = 'IMAGE3'
    end
    object FirmaTabUSER_AKT: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER_AKT'
      Size = 100
      Calculated = True
    end
    object FirmaTabLEITWAEHRUNG: TStringField
      FieldKind = fkCalculated
      FieldName = 'LEITWAEHRUNG'
      Size = 10
      Calculated = True
    end
    object FirmaTabMANDANT_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'MANDANT_NAME'
      Size = 200
      Calculated = True
    end
  end
  object FirmaDS: TDataSource
    DataSet = FirmaTab
    Left = 253
    Top = 16
  end
  object KunRabGrp: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from RABATTGRUPPEN'
      'where RABGRP_TYP=3'
      'order by RABGRP_ID')
    Params = <>
    Left = 26
    Top = 428
    object KunRabGrpRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Required = True
      Size = 10
    end
    object KunRabGrpRABGRP_TYP: TIntegerField
      FieldName = 'RABGRP_TYP'
      Required = True
    end
    object KunRabGrpMIN_MENGE: TIntegerField
      FieldName = 'MIN_MENGE'
      Required = True
    end
    object KunRabGrpLIEF_RABGRP: TIntegerField
      FieldName = 'LIEF_RABGRP'
      Required = True
    end
    object KunRabGrpRABATT1: TFloatField
      FieldName = 'RABATT1'
      Required = True
    end
    object KunRabGrpRABATT2: TFloatField
      FieldName = 'RABATT2'
      Required = True
    end
    object KunRabGrpRABATT3: TFloatField
      FieldName = 'RABATT3'
      Required = True
    end
    object KunRabGrpADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
    end
  end
  object UniQuery: TZQuery
    Connection = DB1
    Params = <>
    Left = 26
    Top = 173
  end
  object UniQuery2: TZQuery
    Connection = DB1
    Params = <>
    Left = 26
    Top = 223
  end
  object ShopOrderStatusTab: TZQuery
    Connection = DB1
    BeforePost = ShopOrderStatusTabBeforePost
    SQL.Strings = (
      'select VAL_INT as ORDERSTATUS_ID, '
      'NAME as LANGBEZ,  VAL_BLOB as TEXT, MAINKEY'
      'from REGISTRY '
      'where MAINKEY='#39'SHOP\\ORDERSTATUS'#39
      'order by ORDERSTATUS_ID')
    Params = <>
    Left = 184
    Top = 428
    object ShopOrderStatusTabLANGBEZ: TStringField
      FieldName = 'LANGBEZ'
      Required = True
      Size = 100
    end
    object ShopOrderStatusTabTEXT: TMemoField
      FieldName = 'TEXT'
      BlobType = ftMemo
    end
    object ShopOrderStatusTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Size = 255
    end
    object ShopOrderStatusTabORDERSTATUS_ID: TIntegerField
      FieldName = 'ORDERSTATUS_ID'
    end
  end
  object ShopOSDS: TDataSource
    DataSet = ShopOrderStatusTab
    Left = 120
    Top = 428
  end
  object HerstellerTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from HERSTELLER'
      'where SHOP_ID=:SID'
      'order by HERSTELLER_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
    Left = 184
    Top = 479
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SID'
        ParamType = ptUnknown
      end>
  end
  object HerstellerDS: TDataSource
    DataSet = HerstellerTab
    Left = 120
    Top = 479
  end
  object SprachTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from SPRACHEN '
      'order by DEFAULT_FLAG DESC, SORT, SPRACH_ID')
    Params = <>
    Left = 325
    Top = 67
  end
  object SprachDS: TDataSource
    DataSet = SprachTab
    Left = 253
    Top = 67
  end
  object ArtInfoTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select '
      'A.REC_ID,A.EK_PREIS,'
      
        'A.VK1,A.VK2,A.VK3,A.VK4,A.VK5,A.VK1B,A.VK2B,A.VK3B,A.VK4B,A.VK5B' +
        ','
      
        'AP.PREIS,AP.MENGE2,AP.PREIS2,AP.MENGE3,AP.PREIS3,AP.MENGE4,AP.PR' +
        'EIS4,'
      
        'AP.MENGE5,AP.PREIS5,A.MENGE_AKT,AB_EKBEST.SUM_MENGE as MENGE_BES' +
        'TELLT,'
      'A.RABGRP_ID,AB_VKRE_EDI.SUM_MENGE as  MENGE_RESERVIERT,'
      
        'A.ALTTEIL_FLAG,A.NO_RABATT_FLAG,A.NO_PROVISION_FLAG,A.NO_BEZEDIT' +
        '_FLAG,'
      
        'A.NO_VK_FLAG,A.NO_EK_FLAG,A.SN_FLAG,A.PROVIS_PROZ,A.STEUER_CODE,' +
        'A.ERLOES_KTO,A.AUFW_KTO,'
      
        'A.ARTNUM,A.ERSATZ_ARTNUM,A.MATCHCODE,A.WARENGRUPPE,A.BARCODE,A.A' +
        'RTIKELTYP,'
      'A.KAS_NAME,A.ME_EINHEIT,A.PR_EINHEIT,A.VPE,'
      
        'A.LAENGE,A.BREITE,A.HOEHE,A.GROESSE,A.DIMENSION,A.GEWICHT,A.INFO' +
        ',KURZNAME,LANGNAME,'
      'AP.PREIS_TYP,AP.ADRESS_ID,AP.BESTNUM'
      ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, JP1.REC_ID as JID '
      'from JOURNALPOS JP1, ARTIKEL A'
      
        'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID = A.REC_ID and' +
        ' AP.PREIS_TYP=3 and AP.ADRESS_ID = - 99'
      
        'left outer join ARTIKEL_BDATEN AB_EKBEST on AB_EKBEST.ARTIKEL_ID' +
        '=A.REC_ID and AB_EKBEST.QUELLE=16 '
      
        'left outer join ARTIKEL_BDATEN AB_VKRE_EDI on AB_VKRE_EDI.ARTIKE' +
        'L_ID=A.REC_ID and AB_VKRE_EDI.QUELLE=13 '
      
        'where (JP1.JOURNAL_ID=:JID) and (JP1.QUELLE=:QUELLE) and ((JP1.A' +
        'RTIKEL_ID = A.REC_ID) or (A.REC_ID=:AID))'
      'group by A.REC_ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '13'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    Left = 456
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUELLE'
        ParamType = ptInput
        Value = '13'
      end
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptUnknown
        Value = '-1'
      end>
    object ArtInfoTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object ArtInfoTabADRESS_ID: TIntegerField
      FieldName = 'ADRESS_ID'
      Required = True
    end
    object ArtInfoTabEK_PREIS: TFloatField
      FieldName = 'EK_PREIS'
    end
    object ArtInfoTabVK1: TFloatField
      FieldName = 'VK1'
    end
    object ArtInfoTabVK2: TFloatField
      FieldName = 'VK2'
    end
    object ArtInfoTabVK3: TFloatField
      FieldName = 'VK3'
    end
    object ArtInfoTabVK4: TFloatField
      FieldName = 'VK4'
    end
    object ArtInfoTabVK5: TFloatField
      FieldName = 'VK5'
    end
    object ArtInfoTabVK1B: TFloatField
      FieldName = 'VK1B'
      Required = True
    end
    object ArtInfoTabVK2B: TFloatField
      FieldName = 'VK2B'
      Required = True
    end
    object ArtInfoTabVK3B: TFloatField
      FieldName = 'VK3B'
      Required = True
    end
    object ArtInfoTabVK4B: TFloatField
      FieldName = 'VK4B'
      Required = True
    end
    object ArtInfoTabVK5B: TFloatField
      FieldName = 'VK5B'
      Required = True
    end
    object ArtInfoTabPREIS_TYP: TIntegerField
      FieldName = 'PREIS_TYP'
      Required = True
    end
    object ArtInfoTabPREIS: TFloatField
      FieldName = 'PREIS'
      Required = True
    end
    object ArtInfoTabMENGE2: TLargeintField
      FieldName = 'MENGE2'
      Required = True
    end
    object ArtInfoTabPREIS2: TFloatField
      FieldName = 'PREIS2'
      Required = True
    end
    object ArtInfoTabMENGE3: TLargeintField
      FieldName = 'MENGE3'
      Required = True
    end
    object ArtInfoTabPREIS3: TFloatField
      FieldName = 'PREIS3'
      Required = True
    end
    object ArtInfoTabMENGE4: TLargeintField
      FieldName = 'MENGE4'
      Required = True
    end
    object ArtInfoTabPREIS4: TFloatField
      FieldName = 'PREIS4'
      Required = True
    end
    object ArtInfoTabMENGE5: TLargeintField
      FieldName = 'MENGE5'
      Required = True
    end
    object ArtInfoTabPREIS5: TFloatField
      FieldName = 'PREIS5'
      Required = True
    end
    object ArtInfoTabMENGE_AKT: TFloatField
      FieldName = 'MENGE_AKT'
    end
    object ArtInfoTabRABGRP_ID: TStringField
      FieldName = 'RABGRP_ID'
      Size = 10
    end
    object ArtInfoTabMENGE_BESTELLT: TFloatField
      FieldName = 'MENGE_BESTELLT'
    end
    object ArtInfoTabMENGE_RESERVIERT: TFloatField
      FieldName = 'MENGE_RESERVIERT'
    end
    object ArtInfoTabPROVIS_PROZ: TFloatField
      FieldName = 'PROVIS_PROZ'
      Required = True
    end
    object ArtInfoTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
      Required = True
    end
    object ArtInfoTabERLOES_KTO: TIntegerField
      FieldName = 'ERLOES_KTO'
    end
    object ArtInfoTabAUFW_KTO: TIntegerField
      FieldName = 'AUFW_KTO'
    end
    object ArtInfoTabARTNUM: TStringField
      FieldName = 'ARTNUM'
    end
    object ArtInfoTabERSATZ_ARTNUM: TStringField
      FieldName = 'ERSATZ_ARTNUM'
    end
    object ArtInfoTabMATCHCODE: TStringField
      FieldName = 'MATCHCODE'
      Size = 255
    end
    object ArtInfoTabWARENGRUPPE: TIntegerField
      FieldName = 'WARENGRUPPE'
      Required = True
    end
    object ArtInfoTabBARCODE: TStringField
      FieldName = 'BARCODE'
    end
    object ArtInfoTabARTIKELTYP: TStringField
      FieldName = 'ARTIKELTYP'
      Required = True
      Size = 1
    end
    object ArtInfoTabKAS_NAME: TStringField
      FieldName = 'KAS_NAME'
      Size = 80
    end
    object ArtInfoTabME_EINHEIT: TStringField
      FieldName = 'ME_EINHEIT'
      Size = 10
    end
    object ArtInfoTabPR_EINHEIT: TFloatField
      FieldName = 'PR_EINHEIT'
      Required = True
    end
    object ArtInfoTabLAENGE: TStringField
      FieldName = 'LAENGE'
    end
    object ArtInfoTabBREITE: TStringField
      FieldName = 'BREITE'
    end
    object ArtInfoTabHOEHE: TStringField
      FieldName = 'HOEHE'
    end
    object ArtInfoTabGROESSE: TStringField
      FieldName = 'GROESSE'
    end
    object ArtInfoTabDIMENSION: TStringField
      FieldName = 'DIMENSION'
    end
    object ArtInfoTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      Required = True
    end
    object ArtInfoTabKURZNAME: TStringField
      FieldName = 'KURZNAME'
      Size = 80
    end
    object ArtInfoTabLANGNAME: TMemoField
      FieldName = 'LANGNAME'
      BlobType = ftMemo
    end
    object ArtInfoTabALTTEIL_FLAG: TBooleanField
      FieldName = 'ALTTEIL_FLAG'
      Required = True
    end
    object ArtInfoTabNO_RABATT_FLAG: TBooleanField
      FieldName = 'NO_RABATT_FLAG'
      Required = True
    end
    object ArtInfoTabNO_PROVISION_FLAG: TBooleanField
      FieldName = 'NO_PROVISION_FLAG'
      Required = True
    end
    object ArtInfoTabNO_BEZEDIT_FLAG: TBooleanField
      FieldName = 'NO_BEZEDIT_FLAG'
      Required = True
    end
    object ArtInfoTabNO_VK_FLAG: TBooleanField
      FieldName = 'NO_VK_FLAG'
      Required = True
    end
    object ArtInfoTabNO_EK_FLAG: TBooleanField
      FieldName = 'NO_EK_FLAG'
      Required = True
    end
    object ArtInfoTabSN_FLAG: TBooleanField
      FieldName = 'SN_FLAG'
      Required = True
    end
    object ArtInfoTabVPE: TIntegerField
      FieldName = 'VPE'
    end
    object ArtInfoTabMENGE_LIEF: TFloatField
      FieldName = 'MENGE_LIEF'
    end
    object ArtInfoTabMENGE_SOLL: TFloatField
      FieldName = 'MENGE_SOLL'
    end
    object ArtInfoTabJID: TIntegerField
      FieldName = 'JID'
    end
    object ArtInfoTabBESTNUM: TStringField
      FieldName = 'BESTNUM'
      Size = 50
    end
  end
  object ReKunTab: TZQuery
    Connection = DB1
    SQL.Strings = (
      'select * from ADRESSEN'
      'where REC_ID = :ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    Left = 533
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object DBUpDTo1_10: TJvStrHolder
    Capacity = 1085
    Macros = <>
    Left = 644
    Top = 120
    InternalVer = 1
    StrData = (
      ''
      ''
      
        '2f2a2053544152542030372e31322e32303033204a502044422d557064617465' +
        '206175662056657273696f6e20312e3130202a2f'
      ''
      '414c544552205441424c45204c414e4420'
      
        '2041444420504f53545f434f4445204348415228332920204146544552204953' +
        '4f5f434f44455f332c'
      
        '204144442045555f4c414e4420454e554d28274e272c27592729202044454641' +
        '554c5420224e22204e4f54204e554c4c20414654455220535052414348453b'
      ''
      '414c544552205441424c4520415254494b454c'
      
        '204144442042524549544520564152434841522832302920204146544552204c' +
        '41454e47452c'
      
        '2041444420484f45484520564152434841522832302920204146544552204252' +
        '454954452c'
      
        '20414444204d494e474557494e4e20464c4f415428332c32292044454641554c' +
        '5420223022204e4f54204e554c4c204146544552204d41585241424154542c'
      
        '20414444204c495a454e5a5f464c414720454e554d28274e272c275927292044' +
        '454641554c5420224e22204e4f54204e554c4c204146544552204b4f4d4d4953' +
        '494f4e5f464c41472c'
      
        '204144442050524f44554b54494f4e5f464c414720454e554d28274e272c2759' +
        '2729202044454641554c5420224e22204e4f54204e554c4c204146544552204c' +
        '495a454e5a5f464c41472c'
      
        '204144442050524f445f444155455220494e542835292020554e5349474e4544' +
        '2044454641554c542022313422204e4f54204e554c4c2041465445522050524f' +
        '44554b54494f4e5f464c41472c'
      
        '204144442053484f505f4d4554415f544954454c205641524348415228323535' +
        '29202041465445522053484f505f50524549535f4c495354452c'
      
        '204144442053484f505f4d4554415f4245534348522054455854204146544552' +
        '2053484f505f4d4554415f544954454c2c'
      
        '204144442053484f505f4d4554415f4b45592056415243484152283235352920' +
        '2041465445522053484f505f4d4554415f4245534348523b'
      ''
      ''
      ''
      '414c544552205441424c4520415254494b454c5f53545545434b4c495354'
      
        '2041444420504f534954494f4e205641524348415228313029204e4f54204e55' +
        '4c4c20414654455220415254494b454c5f4152542c'
      
        '204348414e4745204d454e4745204d454e474520444543494d414c2831302c34' +
        '29202044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '2044524f50205052494d415259204b45592c20414444205052494d415259204b' +
        '455920285245435f49442c4152545f49442c415254494b454c5f415254293b'
      ''
      ''
      '414c544552205441424c4520415254494b454c5f505245495320'
      
        '204144442050543220454e554d2827454b272c27564b272c27564b31272c2756' +
        '4b32272c27564b33272c27564b34272c27564b35272c27415027292020444546' +
        '41554c542022454b22204e4f54204e554c4c2041465445522050524549535f54' +
        '59503b'
      ''
      
        '55504441544520415254494b454c5f505245495320534554205054323d27454b' +
        '272077686572652050524549535f5459503d353b'
      
        '55504441544520415254494b454c5f505245495320534554205054323d27564b' +
        '272077686572652050524549535f5459503d333b'
      ''
      '414c544552205441424c4520415254494b454c5f5052454953'
      
        '20204144442056504520494e54283131292020554e5349474e45442044454641' +
        '554c5420223022204e4f54204e554c4c20414654455220424553544e554d2c'
      
        '2020414444205052454953325f4155544f20454e554d28274e272c2759272920' +
        '2044454641554c5420225922204e4f54204e554c4c2041465445522050524549' +
        '53322c'
      
        '20204144442046414b544f523220464c4f41542831302c352920204e4f54204e' +
        '554c4c204146544552205052454953325f4155544f2c'
      
        '2020414444205052454953335f4155544f20454e554d28274e272c2759272920' +
        '2044454641554c5420225922204e4f54204e554c4c2041465445522050524549' +
        '53332c'
      
        '20204144442046414b544f523320464c4f41542831302c352920204e4f54204e' +
        '554c4c204146544552205052454953335f4155544f2c'
      
        '2020414444205052454953345f4155544f20454e554d28274e272c2759272920' +
        '2044454641554c5420225922204e4f54204e554c4c2041465445522050524549' +
        '53342c'
      
        '20204144442046414b544f523420464c4f41542831302c352920204e4f54204e' +
        '554c4c204146544552205052454953345f4155544f2c'
      
        '2020414444205052454953355f4155544f20454e554d28274e272c2759272920' +
        '2044454641554c5420225922204e4f54204e554c4c2041465445522050524549' +
        '53352c'
      
        '20204144442046414b544f523520464c4f41542831302c352920204e4f54204e' +
        '554c4c204146544552205052454953355f4155544f3b'
      ''
      ''
      '414c544552205441424c4520415254494b454c5f5345524e554d'
      
        '204144442053544154555320454e554d28274c41474552272c27564b5f4c4945' +
        '46272c27564b5f52454348272c27524d415f4948272c27524d415f4148272c27' +
        '524d415f4154272c27494e565f444956272c27454b5f45444927292020444546' +
        '41554c5420224c4147455222204e4f54204e554c4c3b'
      ''
      ''
      '414c544552205441424c45204d49544152424549544552'
      
        '20414444204752555050455f494420494e54283131292020554e5349474e4544' +
        '2044454641554c5420223122204e4f54204e554c4c204146544552204d415f49' +
        '442c'
      
        '2041444420555345525f50415353574f52442056415243484152283332292020' +
        '4e4f54204e554c4c20414654455220414e5a454947455f4e414d453b'
      ''
      '414c544552205441424c4520464942555f4b4153534520'
      
        '20414444204d415f494420494e5428313129202044454641554c5420222d3122' +
        '204e4f54204e554c4c204146544552205245435f49442c'
      '204144442045525354454c4c5420444154452c'
      '2041444420455253545f4e414d452056415243484152283230293b'
      ''
      '414c544552205441424c4520414452455353454e'
      
        '20414444204b554e5f4c49454653504552524520454e554d28274e272c275927' +
        '29202044454641554c5420224e22204e4f54204e554c4c204146544552204b55' +
        '4e5f50524c495354452c'
      
        '2041444420494e444558204944585f4b554e4e554d3120284b554e4e554d3129' +
        '2c'
      
        '2041444420494e444558204944585f4d4154434820284d41544348434f444529' +
        '3b'
      ''
      ''
      '414c544552205441424c45204a4f55524e414c'
      
        '20414444204d415f494420494e5428313129202044454641554c5420222d3122' +
        '204e4f54204e554c4c204146544552205445524d5f49442c20'
      
        '20414444204b4c415353455f49442054494e59494e542833292020554e534947' +
        '4e45442044454641554c5420223022204e4f54204e554c4c204146544552204c' +
        '444154554d2c'
      '20414444204b4f504654455854205445585420414654455220555352322c'
      
        '204144442046555353544558542054455854204146544552204b4f5046544558' +
        '542c'
      
        '20414444204e53554d4d455f3020464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204d5753545f332c'
      
        '20414444204e53554d4d455f3120464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f302c'
      
        '20414444204e53554d4d455f3220464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f312c'
      
        '20414444204e53554d4d455f3320464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f322c'
      
        '20414444204253554d4d455f3020464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204d53554d4d452c'
      
        '20414444204253554d4d455f3120464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f302c'
      
        '20414444204253554d4d455f3220464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f312c'
      
        '20414444204253554d4d455f3320464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f322c'
      
        '20414444204b55525320444543494d414c2831362c3429202044454641554c54' +
        '20223122204e4f54204e554c4c204146544552205741454852554e472c'
      
        '2041444420494e444558204944585f5155454c4c455f52444154554d20285155' +
        '454c4c452c5155454c4c455f5355422c52444154554d293b'
      ''
      '414c544552205441424c45204a4f55524e414c504f53'
      
        '204348414e4745204d454e4745204d454e474520464c4f41542831302c332920' +
        '2044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '2041444420455f5241424154545f42455452414720464c4f41542831302c3229' +
        '202044454641554c542022302e303022204e4f54204e554c4c20414654455220' +
        '524142415454332c'
      
        '2041444420475f5241424154545f42455452414720464c4f41542831302c3229' +
        '202044454641554c542022302e303022204e4f54204e554c4c20414654455220' +
        '455f5241424154545f4245545241472c'
      
        '204144442047505245495320464c4f41542831302c322920204e4f54204e554c' +
        '4c204146544552204550524549532c'
      
        '2041444420475f52474557494e4e20464c4f41542831302c322920204e4f5420' +
        '4e554c4c20414654455220455f52474557494e4e2c'
      
        '204144442042524549544520564152434841522832302920204146544552204c' +
        '41454e47452c'
      
        '2041444420484f45484520564152434841522832302920204146544552204252' +
        '454954452c'
      '2041444420494e444558204944585f5155454c4c4520285155454c4c45292c'
      
        '2041444420494e444558204944585f5153524320285155454c4c455f5352432c' +
        '5155454c4c45293b'
      ''
      ''
      ''
      ''
      '414c544552205441424c452056455254524147'
      
        '20414444204d415f494420494e5428313129202044454641554c5420222d3122' +
        '204e4f54204e554c4c2046495253542c20'
      
        '20414444204b4c415353455f49442054494e59494e542833292020554e534947' +
        '4e45442044454641554c5420223022204e4f54204e554c4c2041465445522056' +
        '45525452455445525f49442c'
      '20414444204b4f504654455854205445585420414654455220555352322c'
      
        '204144442046555353544558542054455854204146544552204b4f5046544558' +
        '542c'
      
        '20414444204e53554d4d455f3020464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204d5753545f332c'
      
        '20414444204e53554d4d455f3120464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f302c'
      
        '20414444204e53554d4d455f3220464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f312c'
      
        '20414444204e53554d4d455f3320464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204e53554d4d455f322c'
      
        '20414444204253554d4d455f3020464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204d53554d4d452c'
      
        '20414444204253554d4d455f3120464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f302c'
      
        '20414444204253554d4d455f3220464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f312c'
      
        '20414444204253554d4d455f3320464c4f41542831302c322920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552204253554d4d455f322c'
      
        '20414444204b55525320444543494d414c2831362c3429202044454641554c54' +
        '20223122204e4f54204e554c4c204146544552205741454852554e473b'
      ''
      '414c544552205441424c452056455254524147504f53'
      
        '204348414e4745204d454e4745204d454e474520464c4f41542831302c332920' +
        '2044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '2041444420455f5241424154545f42455452414720464c4f41542831302c3229' +
        '202044454641554c542022302e303022204e4f54204e554c4c20414654455220' +
        '524142415454332c'
      
        '2041444420475f5241424154545f42455452414720464c4f41542831302c3229' +
        '202044454641554c542022302e303022204e4f54204e554c4c20414654455220' +
        '455f5241424154545f4245545241472c'
      
        '204144442047505245495320464c4f41542831302c322920204e4f54204e554c' +
        '4c204146544552204550524549532c'
      
        '2041444420475f52474557494e4e20464c4f41542831302c322920204e4f5420' +
        '4e554c4c20414654455220455f52474557494e4e2c'
      
        '204144442042524549544520564152434841522832302920204146544552204c' +
        '41454e47452c'
      
        '2041444420484f45484520564152434841522832302920204146544552204252' +
        '454954452c'
      
        '204144442056504520494e54283131292020554e5349474e4544204445464155' +
        '4c5420223122204e4f54204e554c4c2041465445522050525f45494e48454954' +
        '2c'
      
        '2041444420454b5f505245495320464c4f41542831302c332920204445464155' +
        '4c5420223022204e4f54204e554c4c204146544552205650452c'
      
        '204144442043414c435f46414b544f5220464c4f415428362c35292020444546' +
        '41554c5420223022204e4f54204e554c4c20414654455220454b5f5052454953' +
        '3b'
      ''
      ''
      ''
      ''
      ''
      '414c544552205441424c4520415254494b454c5f494e56454e545552'
      
        '204348414e474520574152454e47525550504520574152454e47525550504520' +
        '494e542831312920554e5349474e45442044454641554c5420223022204e4f54' +
        '204e554c4c2c'
      
        '2041444420494e444558204944585f4b55525a544558542028494e56454e5455' +
        '525f49442c574152454e4752555050452c4b55525a54455854293b'
      '20'
      ''
      
        '757064617465204a4f55524e414c20534554205354414449554d3d3230207768' +
        '657265205354414449554d3c323020616e64205155454c4c453d323b'
      
        '757064617465204a4f55524e414c20534554205052494e545f464c41473d2759' +
        '27207768657265205155454c4c4520696e2028312c322c33293b'
      ''
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027415254' +
        '494b454c5f42444154454e27'
      '23'
      ''
      '435245415445205441424c4520415254494b454c5f42444154454e2028'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20205155454c4c452074696e79696e7428322920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '20204a41485220494e542834292020554e5349474e45442044454641554c5420' +
        '223022204e4f54204e554c4c2c'
      
        '20204d4f4e41542054494e59494e542832292020554e5349474e454420444546' +
        '41554c5420223022204e4f54204e554c4c2c'
      
        '202053554d5f4d454e474520666c6f61742831302c3329204e4f54204e554c4c' +
        '2064656661756c742027302e303030272c'
      
        '20205052494d415259204b4559202028415254494b454c5f49442c5155454c4c' +
        '452c4a4148522c4d4f4e4154292c'
      
        '2020494e444558204944585f5155454c4c4520285155454c4c452c415254494b' +
        '454c5f494429'
      
        '2920434f4d4d454e543d274265776567756e6773646174656e20646572204172' +
        '74696b656c273b'
      ''
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c65202742454e' +
        '55545a455252454348544527'
      '23'
      ''
      '435245415445205441424c452042454e55545a45525245434854452028'
      
        '20204752555050454e5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c74202730272c'
      
        '2020555345525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202730272c'
      
        '20204d4f44554c5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20204d4f44554c5f4e414d45207661726368617228313030292064656661756c' +
        '74204e554c4c2c'
      
        '20205355424d4f44554c5f494420696e7428313129204e4f54204e554c4c2064' +
        '656661756c74202730272c'
      
        '20205355424d4f44554c5f4e414d452076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '202052454348544520626967696e742831362920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '202042454d45524b554e47207661726368617228323530292064656661756c74' +
        '204e554c4c2c'
      
        '20205052494d415259204b45592020284752555050454e5f49442c555345525f' +
        '49442c4d4f44554c5f49442c5355424d4f44554c5f494429'
      '293b'
      ''
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c27'
      '23'
      ''
      '435245415445205441424c45204d41494c2028'
      
        '2020494420696e742831312920756e7369676e6564204e4f54204e554c4c2061' +
        '75746f5f696e6372656d656e742c'
      
        '20204d41494c5f494420766172636861722832353529204e4f54204e554c4c20' +
        '64656661756c742027272c'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204d415f4b4f4e544f5f494420696e742831312920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '20205352435f494420696e742831312920756e7369676e6564204e4f54204e55' +
        '4c4c2064656661756c74202730272c'
      
        '20205549444c207661726368617228323030292064656661756c74204e554c4c' +
        '2c'
      
        '20205459502074696e79696e7428312920756e7369676e6564204e4f54204e55' +
        '4c4c2064656661756c74202731272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '2020414444525f4153505f494420696e7428313129204e4f54204e554c4c2064' +
        '656661756c7420272d31272c'
      
        '202047524f4553534520626967696e742831362920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '202053444154554d206461746574696d65204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d30302030303a30303a3030272c'
      
        '202045444154554d206461746574696d65204e4f54204e554c4c206465666175' +
        '6c742027303030302d30302d30302030303a30303a3030272c'
      
        '20204f52444e45525f494420696e742831312920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202731272c'
      
        '202053454e44455220766172636861722832353529204e4f54204e554c4c2064' +
        '656661756c742027272c'
      '2020454d504641454e4745522074657874204e4f54204e554c4c2c'
      '2020434320746578742c'
      '202042434320746578742c'
      
        '202042455452454646207661726368617228323535292064656661756c74204e' +
        '554c4c2c'
      '20204e41434852494348545f54455854206d656469756d746578742c'
      '202048454144455220746578742c'
      
        '202053544154555320696e7428352920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020414e48414e475f414e5a20696e7428332920756e7369676e6564204e4f54' +
        '204e554c4c2064656661756c74202730272c'
      
        '20205052494f522074696e79696e7428312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202732272c'
      
        '202053505241434845207661726368617228313030292064656661756c74204e' +
        '554c4c2c'
      '20205052494d415259204b45592020284944292c'
      
        '2020554e49515545204b4559204944585f4d41494c5f494420284d415f49442c' +
        '4d415f4b4f4e544f5f49442c4d41494c5f4944292c'
      
        '20204b4559204944585f4d415f4f52444e455220284d415f49442c4f52444e45' +
        '525f49442c535441545553292c'
      
        '20204b4559204944585f4d415f4b4f4e544f5f494420284d415f4b4f4e544f5f' +
        '49442c535441545553292c'
      '20204b4559204944585f53524320284d415f49442c5352435f4944292c'
      
        '20204b4559204944585f5549444c20284d415f49442c4d415f4b4f4e544f5f49' +
        '442c5549444c292c'
      
        '20204b4559204944585f4b544f5f4d41494c20284d415f49442c4f52444e4552' +
        '5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c5f616472657373656e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f414452455353454e2028'
      
        '2020454d41494c20766172636861722831353029204e4f54204e554c4c206465' +
        '6661756c742027272c'
      
        '2020414444525f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c7420272d31272c'
      
        '20204153505f494420696e7428313129204e4f54204e554c4c2064656661756c' +
        '7420272d31272c'
      '20205052494d415259204b4559202028454d41494c2c414444525f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c5f616e68616e6727'
      '23'
      ''
      '435245415445205441424c45204d41494c5f414e48414e472028'
      
        '20204d41494c5f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      
        '2020504152545f494420696e742831312920756e7369676e6564204e4f54204e' +
        '554c4c2064656661756c74202730272c'
      '2020545950207661726368617228323530292064656661756c74204e554c4c2c'
      
        '202044415445494e414d45207661726368617228323535292064656661756c74' +
        '204e554c4c2c'
      '202044415441206c6f6e67626c6f622c'
      
        '202047524f4553534520626967696e742832302920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '20205052494d415259204b45592020284d41494c5f49442c504152545f494429' +
        '2c'
      '20204b4559204d41494c5f494420284d41494c5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c5f6b6f6e74656e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f4b4f4e54454e2028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204b4f4e544f5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c206175746f5f696e6372656d656e742c'
      
        '20204b4f4e544f5f4e414d4520766172636861722832353529204e4f54204e55' +
        '4c4c2064656661756c742027272c'
      
        '20204b4f4e544f5f44454641554c5420656e756d28274e272c27592729204e4f' +
        '54204e554c4c2064656661756c7420274e272c'
      
        '20204b4f4e544f5f474c4f42414c20656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '20204b4f4e544f5f4f52444e455220656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '2020504f50335f53455256455220766172636861722832303029206465666175' +
        '6c74204e554c4c2c'
      
        '2020504f50335f55534552207661726368617228313030292064656661756c74' +
        '204e554c4c2c'
      
        '2020504f50335f50415353574f52442076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '2020504f50335f504f525420696e7428352920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c742027313130272c'
      
        '2020504f50335f454d5046414e475f464c414720656e756d28274e272c275927' +
        '29204e4f54204e554c4c2064656661756c74202759272c'
      
        '2020504f50335f44454c4554455f464c414720656e756d28274e272c27592729' +
        '204e4f54204e554c4c2064656661756c7420274e272c'
      
        '2020504f50335f44454c4554455f5441474520696e7428352920756e7369676e' +
        '6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '2020504f50335f4c455f454d5046414e47206461746574696d65204e4f54204e' +
        '554c4c2064656661756c742027303030302d30302d30302030303a30303a3030' +
        '272c'
      
        '2020534d54505f53455256455220766172636861722832303029206465666175' +
        '6c74204e554c4c2c'
      
        '2020534d54505f55534552207661726368617228313030292064656661756c74' +
        '204e554c4c2c'
      
        '2020534d54505f50415353574f52442076617263686172283130302920646566' +
        '61756c74204e554c4c2c'
      
        '2020534d54505f555345524e414d452076617263686172283235352920646566' +
        '61756c74204e554c4c2c'
      
        '2020534d54505f504f525420696e7428352920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c7420273235272c'
      
        '2020534d54505f454d41494c207661726368617228323535292064656661756c' +
        '74204e554c4c2c'
      
        '2020534d54505f44454641554c5420656e756d28274e272c27592729204e4f54' +
        '204e554c4c2064656661756c7420274e272c'
      
        '2020534d54505f424343207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '2020534d54505f4d4f44452074696e79696e7428332920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202731272c'
      
        '20205052494d415259204b45592020284d415f49442c4b4f4e544f5f4e414d45' +
        '292c'
      
        '2020554e49515545204b4559204944585f4b544f5f494420284b4f4e544f5f49' +
        '4429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c5f6f72646e657227'
      '23'
      ''
      '435245415445205441424c45204d41494c5f4f52444e45522028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '20204f52444e45525f494420696e742831312920756e7369676e6564204e4f54' +
        '204e554c4c206175746f5f696e6372656d656e742c'
      
        '20204b4f4e544f5f494420696e742831312920756e7369676e6564204e4f5420' +
        '4e554c4c2064656661756c74202730272c'
      
        '20204f52444e45525f4e414d4520766172636861722832303029204e4f54204e' +
        '554c4c2064656661756c742027272c'
      
        '20204f52444e45525f54595020656e756d28275045272c275041272c27474f27' +
        '2c274445272c274557272c27474c4f42272c272d2729204e4f54204e554c4c20' +
        '64656661756c7420272d272c'
      
        '202050415252454e545f4f52444e455220696e7428313129204e4f54204e554c' +
        '4c2064656661756c7420272d31272c'
      '20205052494d415259204b45592020284f52444e45525f4944292c'
      
        '20204b4559204944585f4d415f4f524420284d415f49442c4b4f4e544f5f4944' +
        '2c4f52444e45525f49442c4f52444e45525f54595029'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c6520276d6169' +
        '6c5f726567656c6e27'
      '23'
      ''
      '435245415445205441424c45204d41494c5f524547454c4e2028'
      
        '20204d415f494420696e742831312920756e7369676e6564204e4f54204e554c' +
        '4c2064656661756c74202730272c'
      
        '2020524547454c4e414d4520766172636861722831303029204e4f54204e554c' +
        '4c2064656661756c742027272c'
      
        '20204d415f4b4f4e544f5f494420696e742831312920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '2020524547454c5f414b54495620656e756d28274e272c27592729204e4f5420' +
        '4e554c4c2064656661756c74202759272c'
      
        '2020504f534954494f4e2074696e79696e7428332920756e7369676e65642064' +
        '656661756c74204e554c4c2c'
      
        '20204245445f4b4f4e544f5f494420696e742831312920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202730272c'
      
        '20204245445f53454e444552207661726368617228323535292064656661756c' +
        '74204e554c4c2c'
      
        '20204245445f454d5046207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '20204245445f454d50465f4f525f434320766172636861722832353529206465' +
        '6661756c74204e554c4c2c'
      
        '20204245445f42455452207661726368617228323535292064656661756c7420' +
        '4e554c4c2c'
      
        '20204245445f4e54455854207661726368617228323535292064656661756c74' +
        '204e554c4c2c'
      
        '20204245445f424554525f4f525f4e544558542074696e79696e742833292075' +
        '6e7369676e65642064656661756c74204e554c4c2c'
      
        '20204245445f5052494f522074696e79696e74283329204e4f54204e554c4c20' +
        '64656661756c7420272d31272c'
      
        '2020414b54494f4e454e2074696e79696e7428332920756e7369676e6564204e' +
        '4f54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f5a49454c4f52444e45525f494420696e742831312920756e7369' +
        '676e6564204e4f54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f4155544f415720696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '2020414b545f574c5f454d41494c207661726368617228323535292064656661' +
        '756c74204e554c4c2c'
      
        '20205052494d415259204b45592020284d415f49442c524547454c4e414d452c' +
        '4d415f4b4f4e544f5f494429'
      '293b'
      ''
      ''
      ''
      '23'
      
        '23205461626c652073747275637475726520666f72207461626c652027544558' +
        '54424155535445494e4527'
      '23'
      ''
      '435245415445205441424c452054455854424155535445494e452028'
      
        '2020494420696e742831312920756e7369676e6564204e4f54204e554c4c2061' +
        '75746f5f696e6372656d656e742c'
      
        '2020424553434852454942554e4720766172636861722832353529204e4f5420' +
        '4e554c4c2064656661756c742027272c'
      '20204c414e47544558542074657874204e4f54204e554c4c2c'
      '20205052494d415259204b45592020284944292c'
      
        '20204b455920424553434852454942554e472028424553434852454942554e47' +
        '29'
      '293b'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '23'
      
        '232044756d70696e67206461746120666f72207461626c65202742454e55545a' +
        '455252454348544527'
      '23'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202230222c204e554c4c2c20223131323739222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202231222c2022457277656974657274222c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202232222c2022416e737072656368706172746e6572222c20223135222c20' +
        '4e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202233222c20224c6965666572616e73636872696674656e222c2022313522' +
        '2c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303130222c2022416472657373656e22' +
        '2c202239222c2022486973746f726965222c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303230222c2022417274696b656c222c' +
        '202230222c204e554c4c2c20223131323739222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303230222c2022417274696b656c222c' +
        '202231222c2022507265697365222c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303230222c2022417274696b656c222c' +
        '202239222c2022486973746f726965222c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303430222c20224d6974617262656974' +
        '6572222c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303530222c202250494d222c20223022' +
        '2c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303630222c20224e6f74697a656e222c' +
        '202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303730222c2022566572747265746572' +
        '222c202230222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303330222c20224b465a222c20223022' +
        '2c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303130222c2022416e6765626f74222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303230222c202241756674726167222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303330222c20224c6965666572736368' +
        '65696e222c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303430222c2022526563686e756e6722' +
        '2c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303530222c202245696e6b617566222c' +
        '202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303630222c2022454b2d42657374656c' +
        '6c756e67222c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202231303030222c20225374616d6d64617465' +
        '6e222c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303030222c2022566f7267e46e676522' +
        '2c20222d31222c204e554c4c2c202232222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303730222c20225665727472e4676522' +
        '2c202230222c204e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303830222c20224d61686e756e67222c' +
        '202230222c204e554c4c2c20223132323933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232303930222c2022546578747665726172' +
        '62656974756e67222c202230222c204e554c4c2c202238323037222c204e554c' +
        '4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202232313030222c2022454b2d42657374656c' +
        '6c766f727363686ce46765222c202230222c204e554c4c2c202230222c204e55' +
        '4c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303030222c20224a6f75726e616c6522' +
        '2c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303130222c2022416e6765626f74222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303230222c202241756674726167222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303330222c20224c6965666572736368' +
        '65696e222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303430222c2022526563686e756e6722' +
        '2c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233303530222c2022564b2d4b6173736522' +
        '2c202230222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233313030222c202245696e6b617566222c' +
        '202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202233313130222c2022454b2d42657374656c' +
        '6c756e67222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303030222c202246696e616e7a656e22' +
        '2c20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303130222c20224b617373656e627563' +
        '68222c202230222c204e554c4c2c202238323037222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303230222c20225a61686c756e677365' +
        '696e67616e67222c202230222c204e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303330222c20225a61686c756e677361' +
        '757367616e67222c202230222c204e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303430222c2022dc6265727765697375' +
        '6e67656e222c202230222c204e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303530222c20224c6173747363687269' +
        '6674656e222c202230222c204e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202234303630222c20224578706f7274204669' +
        '6275222c202230222c204e554c4c2c202232303439222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303030222c2022546f6f6c73222c2022' +
        '2d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303130222c202253746174697374696b' +
        '222c202230222c204e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303230222c202253686f707472616e73' +
        '666572222c202230222c204e554c4c2c202233303733222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303330222c2022496e76656e74757222' +
        '2c202230222c204e554c4c2c20223132323935222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303430222c20224578706f7274222c20' +
        '2230222c204e554c4c2c20223130323535222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202235303530222c202257617274756e677364' +
        '6174656e222c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303030222c20225370657a69616c222c' +
        '20222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303130222c20224d616e64616e74656e' +
        '7765636873656c222c202230222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303430222c2022446174656e73696368' +
        '6572756e67222c202230222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303530222c2022446174656e72fc636b' +
        '736963686572756e67222c202230222c204e554c4c2c202231222c204e554c4c' +
        '293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303730222c202253514c2d4c6f67222c' +
        '202230222c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303830222c20224442205072fc66656e' +
        '2c4f7074696d696572656e2c52656f7267616e6973696572656e222c20223022' +
        '2c204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303230222c2022616c6c672e2045696e' +
        '7374656c6c756e67656e222c202230222c204e554c4c2c202231222c204e554c' +
        '4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303330222c202253686f7065696e7374' +
        '656c6c756e67656e222c202230222c204e554c4c2c202231222c204e554c4c29' +
        '3b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c202239303630222c2022526567697374726965' +
        '72756e67732d456469746f72222c202230222c204e554c4c2c202231222c204e' +
        '554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303030222c20224b61737365222c20' +
        '222d31222c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303230222c2022417274696b656c22' +
        '2c202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303330222c20224b756e64656e222c' +
        '202230222c204e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '5328222d31222c20222d31222c20223130303130222c20224d61696e222c2022' +
        '30222c204e554c4c2c202231222c204e554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282231222c20222d31222c202230222c202241646d696e6973747261746f72' +
        '656e222c202230222c204e554c4c2c20223635353335222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202230222c20224c61676572222c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202230222c202245696e6b617566222c20223022' +
        '2c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202230222c20225665726b617566222c20223022' +
        '2c204e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202230222c20224275636868616c74756e67222c' +
        '202230222c204e554c4c2c202230222c204e554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c202232222c202230222c20224d69746172626569746572203a20' +
        '31202f20477275707065203a2031203d204c61676572222c202230222c204e55' +
        '4c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c202233222c202230222c20224d69746172626569746572203a20' +
        '32202f20477275707065203a2032203d2045696e6b617566222c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c202234222c202230222c20224d69746172626569746572203a20' +
        '33202f20477275707065203a2033203d205665726b617566222c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c202235222c202230222c20224d69746172626569746572203a20' +
        '34202f20477275707065203a2034203d204275636868616c74756e67222c2022' +
        '30222c204e554c4c2c202230222c204e554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202230222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202235303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202233222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202234303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303130222c204e554c4c2c202232222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303130222c204e554c4c2c202233222c20' +
        '4e554c4c2c202233222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282232222c20222d31222c202231303230222c204e554c4c2c202237222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231303331222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313131222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202235303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233313130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282233222c20222d31222c202233313030222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223130323431222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202237222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202231303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202233303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202234303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202234303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231303235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c202235303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303130222c204e554c4c2c202230222c' +
        '204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303230222c204e554c4c2c202230222c' +
        '204e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282234222c20222d31222c20223130303330222c204e554c4c2c202230222c' +
        '204e554c4c2c202237222c204e554c4c293b'
      ''
      ''
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303730222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223135222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202231222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202231303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238323037222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202232303830222c204e554c4c2c202230222c20' +
        '4e554c4c2c20223132323933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202232303930222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202233303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313933222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303130222c204e554c4c2c202230222c20' +
        '4e554c4c2c202238313939222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303230222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303330222c204e554c4c2c202230222c20' +
        '4e554c4c2c202235222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303430222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303530222c204e554c4c2c202230222c20' +
        '4e554c4c2c202234313033222c204e554c4c293b'
      
        '494e5345525420494e544f2042454e55545a45525245434854452056414c5545' +
        '53282235222c20222d31222c202234303630222c204e554c4c2c202230222c20' +
        '4e554c4c2c202232303439222c204e554c4c293b'
      ''
      ''
      
        '494e5345525420494e544f2052454749535445525920284d41494e4b45592c20' +
        '4e414d452c2056414c5f43484152292056414c5545532028274d41494e5c5c46' +
        '494255272c202744656661756c74272c202745696e7374656c6c756e67656e20' +
        '66fc722064656e20466962756578706f727427293b'
      ''
      ''
      ''
      ''
      
        '2f2a204265776567756e6773646174656e2066fc72204544492d566f7267e46e' +
        '676520284d656e67656e2920616b7475616c6973696572656e202a2f'
      
        '64656c6574652066726f6d20415254494b454c5f42444154454e207768657265' +
        '205155454c4c4520494e202831332c31352c3136293b'
      '696e7365727420696e746f20415254494b454c5f42444154454e'
      
        '2073656c65637420415254494b454c5f49442c205155454c4c452c20302c2030' +
        '2c2053554d284d454e47452920'
      '2066726f6d204a4f55524e414c504f5320'
      
        '207768657265205155454c4c4520494e202831332c31352c31362920616e6420' +
        '415254494b454c54595020494e2028274e272c2753272920616e642041525449' +
        '4b454c5f49443e30'
      '2067726f757020627920415254494b454c5f49442c205155454c4c45'
      '20686176696e672053554d284d454e47452920213d303b'
      ''
      ''
      
        '2f2a2045696e2d20756e64205665726b61756673646174656e20284d656e6765' +
        '6e29202a2f'
      
        '64656c6574652066726f6d20415254494b454c5f42444154454e207768657265' +
        '205155454c4c4520494e28332c35293b'
      ''
      '2f2a2053756d6d656e20fc62657220616c6c65204a616872652a2f'
      '696e7365727420696e746f20415254494b454c5f42444154454e'
      
        '2073656c656374204a502e415254494b454c5f49442c204a2e5155454c4c452c' +
        '20302c20302c2053554d284a502e4d454e47452920'
      '2066726f6d204a4f55524e414c204a2c204a4f55524e414c504f53204a50'
      
        '207768657265204a2e5155454c4c4520494e2028332c352920616e64204a2e52' +
        '45435f49443d4a502e4a4f55524e414c5f494420616e64204a502e415254494b' +
        '454c54595020494e2028274e272c2753272c274c272c274b272920616e64204a' +
        '502e415254494b454c5f49443e30'
      
        '2067726f7570206279204a502e415254494b454c5f49442c204a2e5155454c4c' +
        '453b'
      ''
      '2f2a53756d6d656e2070726f204a6168722a2f'
      '696e7365727420696e746f20415254494b454c5f42444154454e'
      
        '2073656c656374204a502e415254494b454c5f49442c204a2e5155454c4c452c' +
        '2059454152284a2e52444154554d292c20302c2053554d284a502e4d454e4745' +
        '2920'
      '2066726f6d204a4f55524e414c204a2c204a4f55524e414c504f53204a50'
      
        '207768657265204a2e5155454c4c4520494e2028332c352920616e64204a2e52' +
        '45435f49443d4a502e4a4f55524e414c5f494420616e64204a502e415254494b' +
        '454c54595020494e2028274e272c2753272c274c272c274b272920616e64204a' +
        '502e415254494b454c5f49443e30'
      
        '2067726f7570206279204a502e415254494b454c5f49442c204a2e5155454c4c' +
        '452c2059454152284a2e52444154554d293b'
      ''
      '2f2a204f6666656e6520454b2d42657374656c6c6d656e67656e202a2f'
      
        '64656c6574652066726f6d20415254494b454c5f42444154454e207768657265' +
        '205155454c4c4520494e283236293b'
      '696e7365727420696e746f20415254494b454c5f42444154454e'
      '2073656c65637420'
      
        '204a50312e415254494b454c5f49442c2032362c20302c20302c204946285355' +
        '4d284a50312e4d454e474529202d2053554d2849464e554c4c284a50322e4d45' +
        '4e47452c3029293c302c302c53554d284a50312e4d454e474529202d2053554d' +
        '2849464e554c4c284a50322e4d454e47452c30292929206173204d454e47455f' +
        '4f4646454e'
      '2066726f6d204a4f55524e414c504f53204a50312c204a4f55524e414c204a'
      
        '206c656674206f75746572206a6f696e204a4f55524e414c504f53204a503220' +
        '6f6e204a50322e5155454c4c455f5352433d4a50312e5245435f494420616e64' +
        '204a50322e5155454c4c4520494e283529'
      
        '207768657265204a50312e5155454c4c453d3620616e64204a2e5155454c4c45' +
        '3d3620616e64204a2e5354414449554d20494e202832302c33302920616e6420' +
        '4a2e5245435f49443d4a50312e4a4f55524e414c5f494420616e64204a50312e' +
        '415254494b454c54595020494e2028274e272c2753272c274c272c274b2729'
      '2067726f7570206279204a50312e415254494b454c5f4944'
      '20686176696e67204d454e47455f4f4646454e3e303b'
      ''
      '2f2a206e6575652053657269656e6e756d6d65726e746162656c6c65202a2f'
      ''
      
        '44524f50205441424c4520494620455849535453204a4f55524e414c504f535f' +
        '5345524e554d3b'
      ''
      
        '435245415445205441424c45204946204e4f5420455849535453204a4f55524e' +
        '414c504f535f5345524e554d2028'
      
        '20205155454c4c452054494e59494e542832292020554e5349474e4544204445' +
        '4641554c5420223022204e4f54204e554c4c2c'
      
        '20204a4f55524e414c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '20204a4f55524e414c504f535f494420696e7428313129204e4f54204e554c4c' +
        '2064656661756c7420272d31272c'
      
        '2020415254494b454c5f494420696e7428313129204e4f54204e554c4c206465' +
        '6661756c7420272d31272c'
      
        '2020534e554d5f494420696e7428313129204e4f54204e554c4c206465666175' +
        '6c74202d312c'
      
        '20205052494d415259204b45592020285155454c4c452c4a4f55524e414c5f49' +
        '442c4a4f55524e414c504f535f49442c415254494b454c5f49442c534e554d5f' +
        '494429'
      '293b'
      ''
      '696e7365727420696e746f204a4f55524e414c504f535f5345524e554d'
      
        '2073656c65637420352c20454b5f4a4f55524e414c5f49442c20454b5f4a4f55' +
        '524e414c504f535f49442c20415254494b454c5f49442c20534e554d5f4944'
      '2066726f6d20415254494b454c5f5345524e554d'
      '20776865726520454b5f4a4f55524e414c5f4944203e20303b'
      ''
      '696e7365727420696e746f204a4f55524e414c504f535f5345524e554d'
      
        '2073656c65637420322c204c535f4a4f55524e414c5f49442c204c535f4a4f55' +
        '524e414c504f535f49442c20415254494b454c5f49442c20534e554d5f4944'
      '2066726f6d20415254494b454c5f5345524e554d'
      '207768657265204c535f4a4f55524e414c5f4944203e20303b'
      '20'
      '696e7365727420696e746f204a4f55524e414c504f535f5345524e554d'
      
        '2073656c65637420332c20564b5f4a4f55524e414c5f49442c20564b5f4a4f55' +
        '524e414c504f535f49442c20415254494b454c5f49442c20534e554d5f4944'
      '2066726f6d20415254494b454c5f5345524e554d'
      '20776865726520564b5f4a4f55524e414c5f4944203e20303b'
      ''
      ''
      
        '75706461746520415254494b454c5f5345524e554d2053455420535441545553' +
        '3d22564b5f4c4945462220'
      
        '207768657265204c535f4a4f55524e414c5f49443e3020616e64204c535f4a4f' +
        '55524e414c504f535f49443e303b'
      ''
      
        '75706461746520415254494b454c5f5345524e554d2053455420535441545553' +
        '3d22564b5f524543482220'
      
        '20776865726520564b5f4a4f55524e414c5f49443e3020616e6420564b5f4a4f' +
        '55524e414c504f535f49443e303b'
      ''
      ''
      
        '2f2a2053756d6d656e66656c64657220696e204a4f55524e414c504f532066fc' +
        '7220526563686e756e67656e20756e6420416e6765626f746520616b7475616c' +
        '6973696572656e202a2f'
      '757064617465204a4f55524e414c504f532053455420'
      
        '20475052454953203d20524f554e44284d454e4745202a20455052454953202d' +
        '2028284d454e4745202a20455052454953202f2031303029202a205241424154' +
        '54292c32292c'
      
        '20475f5241424154545f424554524147203d20524f554e4428284d454e474520' +
        '2a20455052454953202f2031303029202a205241424154542c32292c'
      
        '20455f5241424154545f424554524147203d20524f554e442828455052454953' +
        '202f2031303029202a205241424154542c3229'
      
        '207768657265205155454c4c4520494e2028312c332c31312c31332920616e64' +
        '20415254494b454c54595020213d2758273b'
      ''
      '757064617465204a4f55524e414c504f5320534554'
      
        '20475f52474557494e4e203d20475052454953202d2028454b5f505245495320' +
        '2a204d454e4745292c'
      
        '20455f52474557494e4e203d20455052454953202d20455f5241424154545f42' +
        '4554524147202d20454b5f50524549532c'
      '2043414c435f46414b544f52203d20455052454953202f20454b5f5052454953'
      
        '207768657265205155454c4c4520494e2028312c332c31312c31332920616e64' +
        '20415254494b454c54595020213d27582720616e6420454b5f50524549532021' +
        '3d303b'
      ''
      ''
      ''
      
        '2f2a202a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a' +
        '2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a' +
        '2a2a2a2a2a2a2a2a2a202a2f'
      ''
      
        '414c544552205441424c45204a4f55524e414c204348414e4745205652454e55' +
        '4d205652454e554d20564152434841522832302920204e4f54204e554c4c3b'
      
        '414c544552205441424c45204a4f55524e414c204348414e474520564c534e55' +
        '4d20564c534e554d20564152434841522832302920204e4f54204e554c4c3b'
      
        '414c544552205441424c45204a4f55524e414c504f53204348414e4745205652' +
        '454e554d205652454e554d20564152434841522832302920204e4f54204e554c' +
        '4c3b'
      
        '414c544552205441424c45204a4f55524e414c504f53204348414e474520564c' +
        '534e554d20564c534e554d20564152434841522832302920204e4f54204e554c' +
        '4c3b'
      ''
      
        '414c544552205441424c4520464942555f4b41535345204348414e4745204245' +
        '4c45474e554d2042454c45474e554d2056415243484152283230293b'
      ''
      '414c544552205441424c4520415254494b454c'
      '2044524f50204d454e47455f42455354454c4c542c'
      '2044524f50204d454e47455f454b424553545f4544492c'
      '2044524f50204d454e47455f564b52455f4544492c'
      '2044524f50204d454e47455f454b52455f4544492c'
      '2044524f50204c4153545f454b2c'
      '2044524f50204c4153545f4c4945462c'
      '2044524f50204c4153545f4c4945464441542c'
      '2044524f50204c4153545f564b2c'
      '2044524f50204c4153545f4b554e44452c'
      '2044524f50204c4153545f564b4441543b'
      ''
      ''
      '414c544552205441424c4520415254494b454c5f5345524e554d'
      '2044524f502045494e4b5f4e554d2c'
      '2044524f50204c4945465f4e554d2c'
      '2044524f50205645524b5f4e554d2c'
      '2044524f5020454b5f4a4f55524e414c5f49442c'
      '2044524f5020564b5f4a4f55524e414c5f49442c'
      '2044524f50204c535f4a4f55524e414c5f49442c'
      '2044524f5020454b5f4a4f55524e414c504f535f49442c'
      '2044524f5020564b5f4a4f55524e414c504f535f49442c'
      '2044524f50204c535f4a4f55524e414c504f535f49443b'
      ''
      ''
      '414c544552205441424c4520415254494b454c'
      
        '204348414e474520454b5f505245495320454b5f505245495320444543494d41' +
        '4c2831322c3429202044454641554c542022302e3030303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520564b3120564b3120444543494d414c2831322c3429202044' +
        '454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3220564b3220444543494d414c2831322c3429202044' +
        '454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3320564b3320444543494d414c2831322c3429202044' +
        '454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3420564b3420444543494d414c2831322c3429202044' +
        '454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3520564b3520444543494d414c2831322c3429202044' +
        '454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b314220564b314220444543494d414c2831322c342920' +
        '2044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b324220564b324220444543494d414c2831322c342920' +
        '2044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b334220564b334220444543494d414c2831322c342920' +
        '2044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b344220564b344220444543494d414c2831322c342920' +
        '2044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b354220564b354220444543494d414c2831322c342920' +
        '2044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e4745204845524b554e46534c414e44204845524b554e4654534c41' +
        '4e4420434841522833292c'
      
        '20414444204554494b4554545f5052494e542054494e59494e54283329202055' +
        '4e5349474e45442044454641554c5420223022204e4f54204e554c4c20414654' +
        '4552204c414745524f52543b'
      ''
      '414c544552205441424c4520415254494b454c5f4c54455854'
      
        '204144442053484f505f4d4554415f544954454c205641524348415228323535' +
        '29202041465445522053484f505f48414e44425543482c'
      
        '204144442053484f505f4d4554415f4245534348522054455854204146544552' +
        '2053484f505f4d4554415f544954454c2c'
      
        '204144442053484f505f4d4554415f4b45592056415243484152283235352920' +
        '2041465445522053484f505f4d4554415f544954454c3b'
      ''
      '414c544552205441424c4520415254494b454c5f494e56454e545552'
      
        '204348414e474520424541524245495445544552204245415242454954455220' +
        '56415243484152283530293b'
      ''
      '414c544552205441424c45204a4f55524e414c504f53'
      
        '204348414e474520454b5f505245495320454b5f505245495320464c4f415428' +
        '31302c34292044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e4745204550524549532045505245495320464c4f41542831302c34' +
        '29202044454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520455f52474557494e4e20455f52474557494e4e20464c4f41' +
        '542831302c3429202044454641554c542022302e3030303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520455f5241424154545f42455452414720455f524142415454' +
        '5f42455452414720464c4f41542831302c3429202044454641554c542022302e' +
        '3030303022204e4f54204e554c4c3b'
      ''
      '414c544552205441424c4520414452455353454e20'
      
        '20414444204c4945465f544b4f5354454e20464c4f41542831302c3229204445' +
        '4641554c5420223022204e4f54204e554c4c204146544552204c4945465f5052' +
        '4c495354452c'
      
        '20414444204c4945465f4d42574552542020464c4f41542831302c3229204445' +
        '4641554c5420223022204e4f54204e554c4c204146544552204c4945465f544b' +
        '4f5354454e3b'
      ''
      '414c544552205441424c45204845525354454c4c455220'
      
        '2041444420494e444558204944585f4845525354454c4c45525f494420284845' +
        '525354454c4c45525f4944293b'
      ''
      '414c544552205441424c4520464942555f4b41535345'
      '2041444420494e444558204944585f5245435f494420285245435f4944293b'
      ''
      ''
      
        '435245415445205441424c45204946204e4f542045584953545320415254494b' +
        '454c5f4554494b4554542028'
      
        '205245435f494420494e54202831312920554e5349474e45442044454641554c' +
        '5420273027204e4f54204e554c4c204155544f5f494e4352454d454e542c20'
      
        '20415254494b454c5f494420494e54202831312920554e5349474e4544204e4f' +
        '54204e554c4c2c20'
      
        '20414e5a41484c2054494e59494e542028332920554e5349474e454420444546' +
        '41554c54202731272c20'
      
        '20414444525f494420494e5420283131292044454641554c5420272d3127204e' +
        '4f54204e554c4c2c20'
      
        '204745445255434b5420454e554d2028274e272c275927292044454641554c54' +
        '20274e272c20'
      '205052494d415259204b4559285245435f494429'
      
        '2920434f4d4d454e54203d2022417274696b656c2d4574696b657474656e6472' +
        '75636b223b'
      ''
      ''
      ''
      ''
      
        '435245415445205441424c45204946204e4f5420455849535453204d41484e55' +
        '4e472028'
      
        '20204a4f55524e414c5f494420696e742831312920756e7369676e6564204e4f' +
        '54204e554c4c2064656661756c74202730272c'
      
        '20204d41484e53545546452074696e79696e7428312920756e7369676e656420' +
        '4e4f54204e554c4c2064656661756c74202731272c'
      
        '20204d41484e444154554d2064617465204e4f54204e554c4c2064656661756c' +
        '742027303030302d30302d3030272c'
      
        '20205a49454c444154554d2064617465204e4f54204e554c4c2064656661756c' +
        '742027303030302d30302d3030272c'
      
        '20204d41484e4745425545485220646f75626c652831302c3229204e4f54204e' +
        '554c4c2064656661756c742027302e3030272c'
      
        '20204d415f494420696e7428313129204e4f54204e554c4c2064656661756c74' +
        '20272d31272c'
      '202042454d45524b554e4720746578742c'
      
        '202045524c454449475420656e756d28274e272c27592729204e4f54204e554c' +
        '4c2064656661756c7420274e272c'
      
        '20205052494e545f464c414720656e756d28274e272c27592729204e4f54204e' +
        '554c4c2064656661756c7420274e272c'
      
        '20205052494d415259204b455920284a4f55524e414c5f49442c4d41484e5354' +
        '55464529'
      '293b'
      ''
      ''
      
        '414c544552205441424c452041504152544e45522052454e414d452041445245' +
        '5353454e5f4153503b'
      ''
      ''
      '414c544552205441424c452050494d5f415546474142454e20'
      
        '20414444205052495641544520454e554d28274e272c27592729202044454641' +
        '554c5420224e22204e4f54204e554c4c20414654455220445545444154453b'
      ''
      '414c544552205441424c452050494d5f5445524d494e45'
      
        '20414444205052495641544520454e554d28274e272c27592729202044454641' +
        '554c5420224e22204e4f54204e554c4c20414654455220435553544f4d494e54' +
        '455256414c3b'
      ''
      
        '414c544552205441424c45205245474953544552592052454e414d4520524547' +
        '49535452593b'
      ''
      ''
      ''
      '414c544552205441424c4520494e464f'
      
        '204144442045524c45444947545f464c414720454e554d28274e272c27592729' +
        '202044454641554c5420224e22204e4f54204e554c4c2041465445522045524c' +
        '45442c'
      
        '204144442057565f464c414720454e554d28274e272c27592729202044454641' +
        '554c5420224e22204e4f54204e554c4c2041465445522057565f444154554d2c'
      
        '20414444204d415f494420494e5428313129202044454641554c5420222d3122' +
        '204e4f54204e554c4c204146544552204c46445f4e522c'
      
        '204144442050524956415420454e554d28274e272c2759272920204445464155' +
        '4c5420224e22204e4f54204e554c4c204146544552204d415f49443b'
      ''
      
        '75706461746520494e464f205345542045524c45444947545f464c41473d2759' +
        '272077686572652045524c45443d313b'
      
        '75706461746520494e464f205345542057565f464c41473d2759272077686572' +
        '6520574945444552564f524c4147453d313b'
      ''
      '414c544552205441424c4520494e464f'
      '2044524f5020574945444552564f524c4147452c'
      '2044524f502045524c45443b'
      ''
      ''
      
        '2f2a202a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a' +
        '2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a' +
        '2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a' +
        '2a2a2a2a202a2f'
      ''
      '414c544552205441424c45204a4f55524e414c20'
      
        '204348414e474520604d5753545f306020604d5753545f306020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f316020604d5753545f316020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f326020604d5753545f326020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f336020604d5753545f336020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604e53554d4d456020604e53554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604e53554d4d455f306020604e53554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f316020604e53554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f326020604e53554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f336020604e53554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d456020604d53554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604d53554d4d455f306020604d53554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f316020604d53554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f326020604d53554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f336020604d53554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d456020604253554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604253554d4d455f306020604253554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f316020604253554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f336020604253554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f326020604253554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604b4f53545f4e4554544f6020604b4f53545f4e4554544f' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e47452060574552545f4e4554544f602060574552545f4e4554544f' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e474520604c4f484e6020604c4f484e6020444543494d414c283130' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e4745206057415245602060574152456020444543494d414c283130' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060524f48474557494e4e602060524f48474557494e4e6020' +
        '444543494d414c2831302c3229202044454641554c542022302e303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e47452060544b4f5354602060544b4f53546020444543494d414c28' +
        '31302c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060415453554d4d45602060415453554d4d45602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e4745206041544d53554d4d4560206041544d53554d4d4560204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e4745206050524f5649535f5745525460206050524f5649535f5745' +
        '52546020444543494d414c2831302c3229202044454641554c542022302e3030' +
        '22204e4f54204e554c4c2c'
      
        '204348414e47452060534f4c4c5f52415442455452602060534f4c4c5f524154' +
        '424554526020444543494d414c2831302c3229202044454641554c542022302e' +
        '303022204e4f54204e554c4c2c'
      
        '204348414e474520604953545f414e5a41484c554e476020604953545f414e5a' +
        '41484c554e476020444543494d414c2831302c32292c'
      
        '204348414e474520604953545f534b4f4e544f6020604953545f534b4f4e544f' +
        '6020444543494d414c2831302c32292c'
      
        '204348414e474520604953545f4245545241476020604953545f424554524147' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e474520604d41484e4b4f5354454e6020604d41484e4b4f5354454e' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c3b'
      ''
      ''
      '414c544552205441424c45204a4f55524e414c504f53'
      
        '204348414e474520604d454e47456020604d454e47456020444543494d414c28' +
        '31302c3329202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e474520604745574943485460206047455749434854602044454349' +
        '4d414c2831302c3329202044454641554c542022302e30303022204e4f54204e' +
        '554c4c2c'
      
        '204348414e4745206050525f45494e4845495460206050525f45494e48454954' +
        '6020444543494d414c2831302c3329202044454641554c542022312e30303022' +
        '204e4f54204e554c4c2c'
      
        '204348414e47452060454b5f5052454953602060454b5f505245495360204445' +
        '43494d414c2831302c3429202044454641554c542022302e3030303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e4745206043414c435f46414b544f5260206043414c435f46414b54' +
        '4f526020444543494d414c28362c3529202044454641554c542022302e303030' +
        '303022204e4f54204e554c4c2c'
      
        '204348414e474520604550524549536020604550524549536020444543494d41' +
        '4c2831302c3429202044454641554c542022302e3030303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520604750524549536020604750524549536020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e47452060455f52474557494e4e602060455f52474557494e4e6020' +
        '444543494d414c2831302c3429202044454641554c542022302e303030302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e47452060475f52474557494e4e602060475f52474557494e4e6020' +
        '444543494d414c2831302c3229202044454641554c542022302e303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e474520605241424154546020605241424154546020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520605241424154543260206052414241545432602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520605241424154543360206052414241545433602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e47452060455f5241424154545f424554524147602060455f524142' +
        '4154545f4245545241476020444543494d414c2831302c342920204445464155' +
        '4c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e47452060475f5241424154545f424554524147602060475f524142' +
        '4154545f4245545241476020444543494d414c2831302c322920204445464155' +
        '4c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060414c545445494c5f50524f5a602060414c545445494c5f' +
        '50524f5a6020444543494d414c2831302c3229202044454641554c542022302e' +
        '313022204e4f54204e554c4c2c'
      
        '204348414e4745206050524f5649535f50524f5a60206050524f5649535f5052' +
        '4f5a6020444543494d414c28352c3229202044454641554c542022302e303022' +
        '204e4f54204e554c4c2c'
      
        '204348414e4745206050524f5649535f5745525460206050524f5649535f5745' +
        '52546020444543494d414c2831302c3229202044454641554c542022302e3030' +
        '22204e4f54204e554c4c3b'
      ''
      '2f2a2031362e31312e32303034202a2f'
      ''
      '44524f50205441424c4520494620455849535453204c414e443b'
      '435245415445205441424c45204c414e442028'
      '2049442063686172283229204e4f54204e554c4c2064656661756c742027272c'
      
        '204e414d4520766172636861722831303029204e4f54204e554c4c2064656661' +
        '756c742027272c'
      
        '204e414d453220766172636861722832353529204e4f54204e554c4c20646566' +
        '61756c742027272c'
      
        '2049534f5f434f44455f332063686172283329204e4f54204e554c4c20646566' +
        '61756c742027272c'
      '20504f53545f434f444520636861722833292064656661756c74204e554c4c2c'
      
        '20464f524d41542074696e79696e74283329204e4f54204e554c4c2064656661' +
        '756c74202731272c'
      
        '20564f525741484c2076617263686172283130292064656661756c74204e554c' +
        '4c2c'
      
        '205741454852554e4720766172636861722835292064656661756c74204e554c' +
        '4c2c'
      
        '205741454852554e475f4c414e47207661726368617228313030292064656661' +
        '756c74204e554c4c2c'
      '205350524143484520636861722833292064656661756c74204e554c4c2c'
      
        '2045555f4c414e4420656e756d28274e272c27592729204e4f54204e554c4c20' +
        '64656661756c7420274e272c'
      '205052494d415259204b455920284944292c'
      '20554e49515545204b4559204944585f4e414d45284e414d4529'
      '293b'
      ''
      '414c544552205441424c4520415254494b454c'
      
        '204348414e47452050525f45494e484549542050525f45494e48454954204445' +
        '43494d414c2831302c32292044454641554c542022302e303022204e4f54204e' +
        '554c4c2c'
      
        '204348414e47452047455749434854204745574943485420444543494d414c28' +
        '31302c33292044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e474520494e56454e5455525f5745525420494e56454e5455525f57' +
        '45525420444543494d414c28352c32292044454641554c5420223130302e3030' +
        '22204e4f54204e554c4c2c'
      
        '204348414e474520454b5f505245495320454b5f505245495320444543494d41' +
        '4c2831322c34292044454641554c542022302e3030303022204e4f54204e554c' +
        '4c2c'
      ''
      
        '204348414e474520564b3120564b3120444543494d414c2831322c3429204445' +
        '4641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3220564b3220444543494d414c2831322c3429204445' +
        '4641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3320564b3320444543494d414c2831322c3429204445' +
        '4641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3420564b3420444543494d414c2831322c3429204445' +
        '4641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b3520564b3520444543494d414c2831322c3429204445' +
        '4641554c542022302e3030303022204e4f54204e554c4c2c'
      ''
      
        '204348414e474520564b314220564b314220444543494d414c2831322c342920' +
        '44454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b324220564b324220444543494d414c2831322c342920' +
        '44454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b334220564b334220444543494d414c2831322c342920' +
        '44454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b344220564b344220444543494d414c2831322c342920' +
        '44454641554c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e474520564b354220564b354220444543494d414c2831322c342920' +
        '44454641554c542022302e3030303022204e4f54204e554c4c2c'
      ''
      
        '204348414e4745204d4158524142415454204d41585241424154542044454349' +
        '4d414c28352c32292044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e4745204d494e474557494e4e204d494e474557494e4e2044454349' +
        '4d414c28352c32292044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e47452050524f5649535f50524f5a2050524f5649535f50524f5a20' +
        '444543494d414c28352c32292044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      ''
      
        '204348414e4745204d454e47455f5354415254204d454e47455f535441525420' +
        '444543494d414c2831322c34292044454641554c542022302e3030303022204e' +
        '4f54204e554c4c2c'
      
        '204348414e4745204d454e47455f414b54204d454e47455f414b542044454349' +
        '4d414c2831322c34292044454641554c542022302e3030303022204e4f54204e' +
        '554c4c2c'
      
        '204348414e4745204d454e47455f4d494e204d454e47455f4d494e2044454349' +
        '4d414c2831322c34292044454641554c542022302e3030303022204e4f54204e' +
        '554c4c2c'
      
        '204348414e4745204d454e47455f42564f52204d454e47455f42564f52204445' +
        '43494d414c2831322c34292044454641554c542022302e3030303022204e4f54' +
        '204e554c4c2c'
      ''
      
        '204348414e47452053484f505f50524549535f4c495354452053484f505f5052' +
        '4549535f4c4953544520444543494d414c2831322c34292044454641554c5420' +
        '22302e3030303022204e4f54204e554c4c3b'
      ''
      ''
      '414c544552205441424c4520415254494b454c5f42444154454e20'
      
        '204348414e47452053554d5f4d454e47452053554d5f4d454e47452044454349' +
        '4d414c2831322c3429202044454641554c542022302e3030303022204e4f5420' +
        '4e554c4c3b'
      ''
      '414c544552205441424c4520415254494b454c5f505245495320'
      
        '204348414e474520505245495320505245495320444543494d414c2831322c34' +
        '29202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e4745205052454953322050524549533220444543494d414c283132' +
        '2c3429202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e4745205052454953332050524549533320444543494d414c283132' +
        '2c3429202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e4745205052454953342050524549533420444543494d414c283132' +
        '2c3429202044454641554c542022302e30303022204e4f54204e554c4c2c20'
      
        '204348414e4745205052454953352050524549533520444543494d414c283132' +
        '2c3429202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e47452046414b544f52322046414b544f523220444543494d414c28' +
        '382c35292044454641554c542022302e303030303022204e4f54204e554c4c2c'
      
        '204348414e47452046414b544f52332046414b544f523320444543494d414c28' +
        '382c35292044454641554c542022302e303030303022204e4f54204e554c4c2c'
      
        '204348414e47452046414b544f52342046414b544f523420444543494d414c28' +
        '382c35292044454641554c542022302e303030303022204e4f54204e554c4c2c'
      
        '204348414e47452046414b544f52352046414b544f523520444543494d414c28' +
        '382c35292044454641554c542022302e303030303022204e4f54204e554c4c2c'
      
        '204144442052414241545420444543494d414c28352c32292044454641554c54' +
        '2022302e303022204e4f54204e554c4c2041465445522050524549533b'
      ''
      '414c544552205441424c4520415254494b454c5f494e56454e545552'
      
        '204348414e4745204d454e47455f495354204d454e47455f4953542044454349' +
        '4d414c2831322c3429202044454641554c542022302e3030303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e4745204d454e47455f534f4c4c204d454e47455f534f4c4c204445' +
        '43494d414c2831322c3429202044454641554c542022302e3030303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e4745204d454e47455f44494646204d454e47455f44494646204445' +
        '43494d414c2831322c3429202044454641554c542022302e3030303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e474520494e56454e5455525f5745525420494e56454e5455525f57' +
        '45525420444543494d414c28362c3329202044454641554c542022302e303030' +
        '22204e4f54204e554c4c2c'
      
        '204348414e474520454b5f505245495320454b5f505245495320444543494d41' +
        '4c2831322c3429202044454641554c542022302e3030303022204e4f54204e55' +
        '4c4c3b'
      ''
      '414c544552205441424c45205241424154544752555050454e'
      
        '204348414e47452052414241545431205241424154543120444543494d414c28' +
        '352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452052414241545432205241424154543220444543494d414c28' +
        '352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452052414241545433205241424154543320444543494d414c28' +
        '352c3229202044454641554c542022302e303022204e4f54204e554c4c3b'
      ''
      '414c544552205441424c4520554542455257454953554e47454e'
      
        '204348414e4745204245545241472042455452414720444543494d414c283130' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c3b'
      ''
      ''
      '414c544552205441424c45205645525452414720'
      
        '204348414e474520604d5753545f306020604d5753545f306020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f316020604d5753545f316020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f326020604d5753545f326020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604d5753545f336020604d5753545f336020444543494d41' +
        '4c28352c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e474520604e53554d4d456020604e53554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604e53554d4d455f306020604e53554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f316020604e53554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f326020604e53554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604e53554d4d455f336020604e53554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d456020604d53554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604d53554d4d455f306020604d53554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f316020604d53554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f326020604d53554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604d53554d4d455f336020604d53554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d456020604253554d4d456020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520604253554d4d455f306020604253554d4d455f3060204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f316020604253554d4d455f3160204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f336020604253554d4d455f3360204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604253554d4d455f326020604253554d4d455f3260204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e474520604b4f53545f4e4554544f6020604b4f53545f4e4554544f' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e47452060574552545f4e4554544f602060574552545f4e4554544f' +
        '6020444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e474520604c4f484e6020604c4f484e6020444543494d414c283130' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e4745206057415245602060574152456020444543494d414c283130' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060544b4f5354602060544b4f53546020444543494d414c28' +
        '31302c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060415453554d4d45602060415453554d4d45602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e4745206041544d53554d4d4560206041544d53554d4d4560204445' +
        '43494d414c2831302c3229202044454641554c542022302e303022204e4f5420' +
        '4e554c4c2c'
      
        '204348414e47452060534f4c4c5f52415442455452602060534f4c4c5f524154' +
        '424554526020444543494d414c2831302c3229202044454641554c542022302e' +
        '303022204e4f54204e554c4c3b'
      ''
      ''
      '414c544552205441424c452056455254524147504f53'
      
        '204348414e474520604d454e47456020604d454e47456020444543494d414c28' +
        '31302c3329202044454641554c542022302e30303022204e4f54204e554c4c2c'
      
        '204348414e474520604745574943485460206047455749434854602044454349' +
        '4d414c2831302c3329202044454641554c542022302e30303022204e4f54204e' +
        '554c4c2c'
      
        '204348414e4745206050525f45494e4845495460206050525f45494e48454954' +
        '6020444543494d414c2831302c3329202044454641554c542022312e30303022' +
        '204e4f54204e554c4c2c'
      
        '204348414e47452060454b5f5052454953602060454b5f505245495360204445' +
        '43494d414c2831302c3429202044454641554c542022302e3030303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e4745206043414c435f46414b544f5260206043414c435f46414b54' +
        '4f526020444543494d414c28362c3529202044454641554c542022302e303030' +
        '303022204e4f54204e554c4c2c'
      
        '204348414e474520604550524549536020604550524549536020444543494d41' +
        '4c2831302c3429202044454641554c542022302e3030303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520604750524549536020604750524549536020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e47452060455f52474557494e4e602060455f52474557494e4e6020' +
        '444543494d414c2831302c3429202044454641554c542022302e303030302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e47452060475f52474557494e4e602060475f52474557494e4e6020' +
        '444543494d414c2831302c3229202044454641554c542022302e303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e474520605241424154546020605241424154546020444543494d41' +
        '4c2831302c3229202044454641554c542022302e303022204e4f54204e554c4c' +
        '2c'
      
        '204348414e474520605241424154543260206052414241545432602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520605241424154543360206052414241545433602044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e47452060455f5241424154545f424554524147602060455f524142' +
        '4154545f4245545241476020444543494d414c2831302c342920204445464155' +
        '4c542022302e3030303022204e4f54204e554c4c2c'
      
        '204348414e47452060475f5241424154545f424554524147602060475f524142' +
        '4154545f4245545241476020444543494d414c2831302c322920204445464155' +
        '4c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452060414c545445494c5f50524f5a602060414c545445494c5f' +
        '50524f5a6020444543494d414c2831302c3229202044454641554c542022302e' +
        '313022204e4f54204e554c4c3b'
      ''
      '414c544552205441424c4520414452455353454e'
      
        '204348414e4745204e45545f534b4f4e544f204e45545f534b4f4e544f204445' +
        '43494d414c28352c32292c'
      
        '204348414e47452050524f5649535f50524f5a2050524f5649535f50524f5a20' +
        '444543494d414c28352c3229202044454641554c542022302e303022204e4f54' +
        '204e554c4c2c'
      
        '204348414e47452047524142415454204752414241545420444543494d414c28' +
        '352c32292c'
      
        '204348414e4745204b554e5f4b52444c494d4954204b554e5f4b52444c494d49' +
        '5420444543494d414c2831322c32292c'
      
        '204348414e4745204c4945465f544b4f5354454e204c4945465f544b4f535445' +
        '4e20444543494d414c2831302c3229202044454641554c542022302e30302220' +
        '4e4f54204e554c4c2c'
      
        '204348414e4745204c4945465f4d4257455254204c4945465f4d425745525420' +
        '444543494d414c2831302c3229202044454641554c542022302e303022204e4f' +
        '54204e554c4c2c'
      
        '204348414e47452057414552554e47205741454852554e472056415243484152' +
        '28352920204e4f54204e554c4c2c'
      
        '204144442047455343484c4543485420434841522831292044454641554c5420' +
        '222d22204e4f54204e554c4c204146544552205350524143485f49443b'
      ''
      ''
      '414c544552205441424c4520464942555f4b41535345'
      
        '204348414e474520534b4f4e544f20534b4f4e544f20444543494d414c28352c' +
        '3329202044454641554c542022302e303030222c'
      
        '204348414e4745205a555f414247414e47205a555f414247414e472044454349' +
        '4d414c2831322c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c3b'
      ''
      ''
      '414c544552205441424c4520564552545245544552'
      
        '204348414e474520554d5341545a20554d5341545a20444543494d414c283132' +
        '2c3229202044454641554c542022302e303022204e4f54204e554c4c2c'
      
        '204348414e47452050524f564953494f4e2050524f564953494f4e2044454349' +
        '4d414c2831302c3229202044454641554c542022302e303022204e4f54204e55' +
        '4c4c3b'
      ''
      
        '757064617465204a4f55524e414c20736574205652454e554d3d636f6e636174' +
        '28224544492d222c5652454e554d29207768657265205155454c4c4520696e20' +
        '2831312c31322c31332c31352c3136293b'
      ''
      ''
      '414c544552205441424c45204a4f55524e414c'
      
        '204348414e474520534f4c4c5f4e5441474520534f4c4c5f4e5441474520494e' +
        '5428342920554e5349474e45442044454641554c5420223022204e4f54204e55' +
        '4c4c2c'
      
        '204348414e474520534f4c4c5f535441474520534f4c4c5f535441474520494e' +
        '5428342920554e5349474e45442044454641554c5420223022204e4f54204e55' +
        '4c4c3b'
      ''
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c202244454641554c54222c' +
        '2022416472657373666f726d617465222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c' +
        '20224e222c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '31222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4f5254402c20404b554e5f504c5a405c5c6e404b554e5f4c414e445f4c414e47' +
        '40222c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c204e554c4c2c204e554c4c2c202231222c20224e222c20224e222c20223230' +
        '30333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '32222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4c414e444020404b554e5f504c5a4020404b554e5f4f5254405c5c6e404b554e' +
        '5f4c414e445f4c414e4740222c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e22' +
        '2c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e5c5c464f524d4154222c2022464f524d41545f3030' +
        '35222c2022404b554e5f4e414d45314020404b554e5f4e414d45324020404b55' +
        '4e5f4e414d4533405c5c6e404b554e5f53545241535345405c5c6e404b554e5f' +
        '4c414e444020404b554e5f504c5a4020404b554e5f4f5254405c5c6e404b554e' +
        '5f4c414e445f4c414e4740222c204e554c4c2c204e554c4c2c204e554c4c2c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c20224e22' +
        '2c20224e222c2022323030333039313431393132353722293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '49424552222c202244454641554c54222c202244656661756c74222c204e554c' +
        '4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c' +
        '204e554c4c2c202231222c20224e222c20224e222c2022323030333039313431' +
        '393133313322293b'
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '494245525c5c424f4e445255434b4552222c202244454641554c54222c202254' +
        '7265696265722066fc7220426f6e647275636b6572222c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c' +
        '2c202231222c20224e222c20224e222c20223230303330393134313931333133' +
        '22293b'
      
        '494e5345525420494e544f2052454749535452592056414c5545532822545245' +
        '494245525c5c4b415353454e444953504c415953222c202244454641554c5422' +
        '2c2022547265696265722066fc72204b617373656e646973706c617973222c20' +
        '4e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c202231222c20224e222c20224e222c2022323030333039' +
        '313431393133313322293b'
      ''
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c415254494b454c222c2022535543485f444c4c222c2022254150504449' +
        '522563616f5f73756368652e646c6c222c204e554c4c2c204e554c4c2c204e55' +
        '4c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c202231222c' +
        '20224e222c20224e222c2022323030333039313431393132353722293b'
      
        '494e5345525420494e544f2052454749535452592056414c55455328224d4149' +
        '4e5c5c414452455353454e222c2022535543485f444c4c222c20222541505044' +
        '49522563616f5f73756368652e646c6c222c204e554c4c2c204e554c4c2c204e' +
        '554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c204e554c4c2c20223122' +
        '2c20224e222c20224e222c2022323030333039313431393132353722293b'
      ''
      
        '2f2a204b656e6e776f7274206675657220616c6c65204d412073797364626120' +
        '2a2f'
      
        '555044415445204d495441524245495445522053455420555345525f50415353' +
        '574f52443d4d4435282773797364626127293b'
      ''
      ''
      '2f2a205570646174652056657273696f6e736e756d6d6572202a2f'
      
        '44454c4554452046524f4d205245474953545259207768657265204d41494e4b' +
        '45593d224d41494e2220616e64204e414d453d2244425f56455253494f4e223b'
      
        '494e5345525420494e544f20524547495354525920284d41494e4b45592c204e' +
        '414d452c2056414c5f434841522c2056414c5f545950292056616c7565732028' +
        '274d41494e272c202744425f56455253494f4e272c2027312e3130272c202731' +
        '27293b')
  end
  object Cipher: TJvVigenereCipher
    Key = '9487jsd987aHGjg76'
    Left = 644
    Top = 16
  end
  object CaoSecurity: TOFSecurity
    OnFindUser = CaoSecurityFindUser
    OnLoadGruppeRechte = CaoSecurityLoadGruppeRechte
    OnLoadUserRechte = CaoSecurityLoadUserRechte
    OnSetLock = CaoSecuritySetLock
    OnReleaseLock = CaoSecurityReleaseLock
    Left = 320
    Top = 344
  end
  object LockQuery: TZQuery
    Connection = DB1
    Params = <>
    Left = 325
    Top = 479
  end
  object KFZGrDS: TDataSource
    DataSet = KFZGrTab
    Left = 253
    Top = 273
  end
  object KFZGrTab: TZQuery
    Connection = DB1
    BeforePost = KGRTabBeforePost
    SQL.Strings = (
      
        'select VAL_INT as GR, NAME as LANGBEZ, VAL_BLOB as SQL_STATEMENT' +
        ', MAINKEY'
      'from REGISTRY'
      'where MAINKEY='#39'MAIN\\KFZ_GRP'#39
      'order by GR')
    Params = <>
    Left = 325
    Top = 273
    object KFZGrTabGR: TIntegerField
      FieldName = 'GR'
    end
    object KFZGrTabLANGBEZ: TStringField
      FieldName = 'LANGBEZ'
      Required = True
      Size = 100
    end
    object KFZGrTabSQL_STATEMENT: TMemoField
      FieldName = 'SQL_STATEMENT'
      BlobType = ftMemo
    end
    object KFZGrTabMAINKEY: TStringField
      FieldName = 'MAINKEY'
      Required = True
      Size = 255
    end
  end
end
