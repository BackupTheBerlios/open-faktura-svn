object MakeEKBestForm: TMakeEKBestForm
  Left = 222
  Top = 107
  Width = 696
  Height = 480
  Caption = 'MakeEKBestForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object RePanel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 48
      Top = 56
      Width = 289
      Height = 193
      ActivePage = PosTS
      TabOrder = 0
      object EdiListTS: TTabSheet
        Caption = 'EdiListTS'
      end
      object AdressTS: TTabSheet
        Caption = 'AdressTS'
        ImageIndex = 1
      end
      object PosTS: TTabSheet
        Caption = 'PosTS'
        ImageIndex = 2
      end
      object Fertig: TTabSheet
        Caption = 'Fertig'
        ImageIndex = 3
      end
    end
  end
  object MainMenu1: TJvMainMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 88
    Top = 88
    object Dummy1: TMenuItem
      Caption = '&Dummy'
      GroupIndex = 3
    end
  end
  object ReEdiTab: TOFZQuery
    Connection = DM1.DB1
    OFSecurity = DM1.CaoSecurity
    OFModulID = 2060
    OFSubModulID = 0
    UseRecordLock = False
    ShowLockErrors = False
    AutoReleaseLock = False
    Params = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    Sql.Strings = (
      'select '
      ''
      
        'REC_ID,QUELLE,QUELLE_SUB,ADDR_ID,VRENUM,RDATUM,GLOBRABATT,LDATUM' +
        ',LOHN,WARE,TKOST,'
      'MWST_0,MWST_1,MWST_2,MWST_3,'
      'NSUMME,NSUMME_0,NSUMME_1,NSUMME_2,NSUMME_3,'
      'MSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,'
      'BSUMME,BSUMME_0,BSUMME_1,BSUMME_2,BSUMME_3,'
      'ATSUMME,ATMSUMME,GEGENKONTO,'
      'SOLL_STAGE,SOLL_SKONTO,SOLL_NTAGE,'
      'STADIUM,ERSTELLT,ERST_NAME,'
      'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,'
      'KUN_ABTEILUNG,KUN_STRASSE,KUN_LAND,KUN_PLZ,KUN_ORT,'
      
        'USR1,USR2,PROJEKT,ORGNUM,BEST_NAME,BEST_CODE,INFO,LIEFART,ZAHLAR' +
        'T,WAEHRUNG,'
      'LIEF_ADDR_ID,BRUTTO_FLAG,MWST_FREI_FLAG,GEWICHT'
      ''
      'FROM JOURNAL'
      'where QUELLE=:QUELLE'
      'order by VRENUM')
    Left = 89
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'QUELLE'
        ParamType = ptUnknown
        Value = '13'
      end>
    object ReEdiTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
      Visible = False
    end
    object ReEdiTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
      Visible = False
    end
    object ReEdiTabQUELLE_SUB: TIntegerField
      FieldName = 'QUELLE_SUB'
      Visible = False
    end
    object ReEdiTabADDR_ID: TIntegerField
      FieldName = 'ADDR_ID'
      Required = True
      Visible = False
    end
    object ReEdiTabVRENUM: TStringField
      Alignment = taCenter
      DisplayLabel = 'int. Nr.'
      DisplayWidth = 5
      FieldName = 'VRENUM'
      Required = True
    end
    object ReEdiTabRDATUM: TDateField
      DisplayLabel = 'le.'#196'nderung'
      FieldName = 'RDATUM'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabGLOBRABATT: TFloatField
      FieldName = 'GLOBRABATT'
      Visible = False
      DisplayFormat = '0.0%'
    end
    object ReEdiTabLDATUM: TDateField
      FieldName = 'LDATUM'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object ReEdiTabLOHN: TFloatField
      FieldName = 'LOHN'
      Visible = False
    end
    object ReEdiTabWARE: TFloatField
      FieldName = 'WARE'
      Visible = False
    end
    object ReEdiTabTKOST: TFloatField
      FieldName = 'TKOST'
      Visible = False
    end
    object ReEdiTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Visible = False
    end
    object ReEdiTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Visible = False
    end
    object ReEdiTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Visible = False
    end
    object ReEdiTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Visible = False
    end
    object ReEdiTabNSUMME: TFloatField
      DisplayLabel = 'Gesamt (netto)'
      DisplayWidth = 9
      FieldName = 'NSUMME'
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
    end
    object ReEdiTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
    end
    object ReEdiTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
    end
    object ReEdiTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
    end
    object ReEdiTabMSUMME: TFloatField
      FieldName = 'MSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabBSUMME: TFloatField
      DisplayLabel = 'Brutto'
      FieldName = 'BSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
    end
    object ReEdiTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
    end
    object ReEdiTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
    end
    object ReEdiTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
    end
    object ReEdiTabATSUMME: TFloatField
      FieldName = 'ATSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabATMSUMME: TFloatField
      FieldName = 'ATMSUMME'
      Visible = False
      DisplayFormat = ',###,##0.00'
      currency = True
    end
    object ReEdiTabGEGENKONTO: TIntegerField
      FieldName = 'GEGENKONTO'
      Visible = False
    end
    object ReEdiTabSOLL_STAGE: TIntegerField
      FieldName = 'SOLL_STAGE'
      Visible = False
    end
    object ReEdiTabSOLL_SKONTO: TFloatField
      FieldName = 'SOLL_SKONTO'
      Visible = False
      DisplayFormat = '0.0%'
      EditFormat = '0.0'
    end
    object ReEdiTabSOLL_NTAGE: TIntegerField
      FieldName = 'SOLL_NTAGE'
      Visible = False
    end
    object ReEdiTabSTADIUM: TIntegerField
      FieldName = 'STADIUM'
      Visible = False
    end
    object ReEdiTabERSTELLT: TDateField
      FieldName = 'ERSTELLT'
      Visible = False
    end
    object ReEdiTabERST_NAME: TStringField
      FieldName = 'ERST_NAME'
      Visible = False
    end
    object ReEdiTabKUN_NUM: TStringField
      Alignment = taCenter
      FieldName = 'KUN_NUM'
      Visible = False
    end
    object ReEdiTabKUN_ANREDE: TStringField
      FieldName = 'KUN_ANREDE'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME1: TStringField
      DisplayLabel = 'Kunde'
      FieldName = 'KUN_NAME1'
      Size = 40
    end
    object ReEdiTabKUN_NAME2: TStringField
      FieldName = 'KUN_NAME2'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_NAME3: TStringField
      FieldName = 'KUN_NAME3'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_ABTEILUNG: TStringField
      FieldName = 'KUN_ABTEILUNG'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_STRASSE: TStringField
      FieldName = 'KUN_STRASSE'
      Visible = False
      Size = 40
    end
    object ReEdiTabKUN_LAND: TStringField
      FieldName = 'KUN_LAND'
      Visible = False
      Size = 5
    end
    object ReEdiTabKUN_PLZ: TStringField
      FieldName = 'KUN_PLZ'
      Visible = False
      Size = 10
    end
    object ReEdiTabKUN_ORT: TStringField
      FieldName = 'KUN_ORT'
      Visible = False
      Size = 40
    end
    object ReEdiTabUSR1: TStringField
      FieldName = 'USR1'
      Visible = False
      Size = 80
    end
    object ReEdiTabUSR2: TStringField
      FieldName = 'USR2'
      Visible = False
      Size = 80
    end
    object ReEdiTabPROJEKT: TStringField
      DisplayLabel = 'Projekt / Beschreibung'
      FieldName = 'PROJEKT'
      Size = 40
    end
    object ReEdiTabORGNUM: TStringField
      FieldName = 'ORGNUM'
      Visible = False
    end
    object ReEdiTabBEST_NAME: TStringField
      FieldName = 'BEST_NAME'
      Visible = False
      Size = 40
    end
    object ReEdiTabBEST_CODE: TIntegerField
      FieldName = 'BEST_CODE'
      Visible = False
    end
    object ReEdiTabINFO: TBlobField
      FieldName = 'INFO'
      Visible = False
    end
    object ReEdiTabLIEFART: TIntegerField
      FieldName = 'LIEFART'
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '#0'
    end
    object ReEdiTabZAHLART: TIntegerField
      FieldName = 'ZAHLART'
      Visible = False
      DisplayFormat = '0;-;0'
      EditFormat = '#0'
    end
    object ReEdiTabWAEHRUNG: TStringField
      DisplayLabel = 'WA'
      DisplayWidth = 3
      FieldName = 'WAEHRUNG'
      Size = 5
    end
    object ReEdiTabWV_DatumStr: TStringField
      DisplayLabel = 'Termin'
      FieldKind = fkCalculated
      FieldName = 'WV_Datum-Str'
      Size = 15
      Calculated = True
    end
    object ReEdiTabZahlart_Str: TStringField
      FieldKind = fkLookup
      FieldName = 'Zahlart_Str'
      LookupDataSet = DM1.ZahlartTab
      LookupKeyFields = 'ZAHL_ID'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'ZAHLART'
      Size = 50
      Lookup = True
    end
    object ReEdiTabWaehrung_Str: TStringField
      FieldKind = fkLookup
      FieldName = 'Waehrung_Str'
      LookupDataSet = DM1.WhrungTab
      LookupKeyFields = 'WAEHRUNG'
      LookupResultField = 'LANGBEZ'
      KeyFields = 'WAEHRUNG'
      Size = 50
      Lookup = True
    end
    object ReEdiTabLIEF_ADDR_ID: TIntegerField
      FieldName = 'LIEF_ADDR_ID'
    end
    object ReEdiTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object ReEdiTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
    object ReEdiTabGEWICHT: TFloatField
      FieldName = 'GEWICHT'
      Required = True
    end
  end
end
