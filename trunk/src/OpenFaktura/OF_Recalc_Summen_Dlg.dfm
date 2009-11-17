object SumRecalcForm: TSumRecalcForm
  Left = 402
  Top = 236
  BorderStyle = bsDialog
  Caption = 'Summen neu berechnen ...'
  ClientHeight = 64
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ProzLab: TLabel
    Left = 286
    Top = 16
    Width = 115
    Height = 16
    Alignment = taRightJustify
    Caption = '0% abgeschlossen'
  end
  object PB: TProgressBar
    Left = 8
    Top = 40
    Width = 393
    Height = 16
    TabOrder = 0
  end
  object JTab: TZQuery
    Connection = DM1.DB1
    SQL.Strings = (
      'select REC_ID,  QUELLE,'
      'MWST_0,MWST_1,MWST_2,MWST_3,'
      'NSUMME_0,NSUMME_1,NSUMME_2,NSUMME_3,NSUMME,'
      'MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,'
      'BSUMME_0,BSUMME_1,BSUMME_2,BSUMME_3,BSUMME,'
      'BRUTTO_FLAG, MWST_FREI_FLAG'
      'from JOURNAL')
    Params = <>
    Left = 40
    Top = 8
    object JTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object JTabQUELLE: TIntegerField
      FieldName = 'QUELLE'
      Required = True
    end
    object JTabMWST_0: TFloatField
      FieldName = 'MWST_0'
      Required = True
    end
    object JTabMWST_1: TFloatField
      FieldName = 'MWST_1'
      Required = True
    end
    object JTabMWST_2: TFloatField
      FieldName = 'MWST_2'
      Required = True
    end
    object JTabMWST_3: TFloatField
      FieldName = 'MWST_3'
      Required = True
    end
    object JTabNSUMME_0: TFloatField
      FieldName = 'NSUMME_0'
      Required = True
    end
    object JTabNSUMME_1: TFloatField
      FieldName = 'NSUMME_1'
      Required = True
    end
    object JTabNSUMME_2: TFloatField
      FieldName = 'NSUMME_2'
      Required = True
    end
    object JTabNSUMME_3: TFloatField
      FieldName = 'NSUMME_3'
      Required = True
    end
    object JTabNSUMME: TFloatField
      FieldName = 'NSUMME'
      Required = True
    end
    object JTabMSUMME_0: TFloatField
      FieldName = 'MSUMME_0'
      Required = True
    end
    object JTabMSUMME_1: TFloatField
      FieldName = 'MSUMME_1'
      Required = True
    end
    object JTabMSUMME_2: TFloatField
      FieldName = 'MSUMME_2'
      Required = True
    end
    object JTabMSUMME_3: TFloatField
      FieldName = 'MSUMME_3'
      Required = True
    end
    object JTabMSUMME: TFloatField
      FieldName = 'MSUMME'
      Required = True
    end
    object JTabBSUMME_0: TFloatField
      FieldName = 'BSUMME_0'
      Required = True
    end
    object JTabBSUMME_1: TFloatField
      FieldName = 'BSUMME_1'
      Required = True
    end
    object JTabBSUMME_2: TFloatField
      FieldName = 'BSUMME_2'
      Required = True
    end
    object JTabBSUMME_3: TFloatField
      FieldName = 'BSUMME_3'
      Required = True
    end
    object JTabBSUMME: TFloatField
      FieldName = 'BSUMME'
      Required = True
    end
    object JTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object JTabMWST_FREI_FLAG: TBooleanField
      FieldName = 'MWST_FREI_FLAG'
      Required = True
    end
  end
  object JPOSTab: TZQuery
    Connection = DM1.DB1
    OnCalcFields = JPOSTabCalcFields
    SQL.Strings = (
      'select'
      ''
      'JOURNAL_ID, REC_ID,'
      'MENGE,EPREIS,RABATT, STEUER_CODE, BRUTTO_FLAG'
      'from JOURNALPOS '
      'where JOURNAL_ID=:JID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'JID'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JID'
        ParamType = ptUnknown
      end>
    object JPOSTabJOURNAL_ID: TIntegerField
      FieldName = 'JOURNAL_ID'
      Required = True
    end
    object JPOSTabREC_ID: TIntegerField
      FieldName = 'REC_ID'
    end
    object JPOSTabMENGE: TFloatField
      FieldName = 'MENGE'
      Required = True
    end
    object JPOSTabEPREIS: TFloatField
      FieldName = 'EPREIS'
      Required = True
    end
    object JPOSTabRABATT: TFloatField
      FieldName = 'RABATT'
      Required = True
    end
    object JPOSTabSTEUER_CODE: TIntegerField
      FieldName = 'STEUER_CODE'
      Required = True
    end
    object JPOSTabBRUTTO_FLAG: TBooleanField
      FieldName = 'BRUTTO_FLAG'
      Required = True
    end
    object JPOSTabSUMME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMME'
      Calculated = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 176
    Top = 8
  end
end
