{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Druckausgabe Belege + Journale                                    }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  gehört zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code ( based on the sources of CAO-Faktura, see above ) is part }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id$ }
{                                                                              }
{ TODO:                                                                        }
{ - Hersteller löschen                                                         }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 09.02.2004 - Dialog überarbeitet, da nicht gespeichert wurde, wenn das Name-Feld }
{              nicht verlassen wurde }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_FreePrintRech;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FR_Chart, FR_BarC, FR_Shape, FR_ChBox, FR_Rich,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, FR_Class, FR_Desgn,
  FR_DSet, FR_DBSet, StdCtrls, JvToolEdit, Buttons, Mask, JvExMask, JvSpin,
  JvExStdCtrls, JvHtControls, ExtCtrls, JvExControls, JvComponent,
  JvDBLookup, OFValueComboBox, JvExExtCtrls, JvPanel;
  

  (*
uses
  ExtCtrls,
  FR_View,
  ZQuery, ZConnect, Grids, DBGrids,
  Clipbrd,
  JvMaskEdit, FR_Intrp, FR_Pars,
  JvLookup, Registry, JvComponent, JvBaseDlg,
  JvCombobox,
  *)

  
type
  TPrintRechForm = class(TForm)
    DBDataSet: TfrDBDataSet;
    Designer: TfrDesigner;
    Report1: TfrReport;
    ReKopfTabDS: TDataSource;
    RePosTab: TZQuery;
    RePosTabMATCHCODE: TStringField;
    RePosTabARTNUM: TStringField;
    RePosTabBARCODE: TStringField;
    RePosTabMENGE: TFloatField;
    RePosTabLAENGE: TStringField;
    RePosTabGROESSE: TStringField;
    RePosTabDIMENSION: TStringField;
    RePosTabGEWICHT: TFloatField;
    RePosTabME_EINHEIT: TStringField;
    RePosTabPR_EINHEIT: TFloatField;
    RePosTabEPREIS: TFloatField;
    RePosTabRABATT: TFloatField;
    RePosTabRABATT2: TFloatField;
    RePosTabRABATT3: TFloatField;
    RePosTabSTEUER_CODE: TIntegerField;
    RePosTabALTTEIL_FLAG: TBooleanField;
    RePosTabALTTEIL_PROZ: TFloatField;
    RePosTabALTTEIL_STCODE: TIntegerField;
    RePosTabBEZEICHNUNG: TMemoField;
    RePosTabVIEW_POS: TStringField;
    RePosTabGPREIS: TFloatField;
    RePosTabMwstProz: TFloatField;
    RePosTabERPREIS: TFloatField;
    RePosTabMWST_BETRAG: TFloatField;
    RePosTabREC_ID: TIntegerField;
    RePosTabARTIKEL_ID: TIntegerField;
    RePosTabSN_FLAG: TBooleanField;
    RePosTabDS: TDataSource;
    frRichObject1: TfrRichObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    frShapeObject1: TfrShapeObject;
    frBarCodeObject1: TfrBarCodeObject;
    frChartObject1: TfrChartObject;
    RePosTabQUELLE: TIntegerField;
    RePosTabQUELLE_SUB: TIntegerField;
    RePosTabQUELLE_SRC: TIntegerField;
    RePosTabJOURNAL_ID: TIntegerField;
    RePosTabARTIKELTYP: TStringField;
    RePosTabTOP_POS_ID: TIntegerField;
    RePosTabADDR_ID: TIntegerField;
    RePosTabATRNUM: TIntegerField;
    RePosTabPOSITION: TIntegerField;
    RePosTabVPE: TIntegerField;
    RePosTabEK_PREIS: TFloatField;
    RePosTabCALC_FAKTOR: TFloatField;
    RePosTabE_RGEWINN: TFloatField;
    RePosTabPROVIS_PROZ: TFloatField;
    RePosTabPROVIS_WERT: TFloatField;
    RePosTabGEBUCHT: TBooleanField;
    RePosTabGEGENKTO: TIntegerField;
    RePosTabBEZ_FEST_FLAG: TBooleanField;
    RePosTabBRUTTO_FLAG: TBooleanField;
    RePosTabNO_RABATT_FLAG: TBooleanField;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    ReSNTab: TZQuery;
    ReSNTabARTIKEL_ID: TIntegerField;
    ReSNTabSERNUMMER: TStringField;
    ReSNTabVERK_NUM: TIntegerField;
    ReSNTabSNUM_ID: TIntegerField;
    ReSNTabVK_JOURNAL_ID: TIntegerField;
    ReSNTabVK_JOURNALPOS_ID: TIntegerField;
    ReSDNS: TDataSource;
    JournalTab: TZQuery;
    JournalDS: TDataSource;
    OposDS: TDataSource;
    OposTab: TZQuery;
    Label8: TLabel;
    Label9: TLabel;
    OposTabQUELLE: TIntegerField;
    OposTabVRENUM: TIntegerField;
    OposTabRDATUM: TDateField;
    OposTabADDR_ID: TIntegerField;
    OposTabNSUMME: TFloatField;
    OposTabMSUMME_0: TFloatField;
    OposTabMSUMME_1: TFloatField;
    OposTabMSUMME_2: TFloatField;
    OposTabMSUMME_3: TFloatField;
    OposTabMSUMME: TFloatField;
    OposTabBSUMME: TFloatField;
    OposTabZAHLART: TIntegerField;
    OposTabSTADIUM: TIntegerField;
    OposTabWAEHRUNG: TStringField;
    OposTabSOLL_STAGE: TIntegerField;
    OposTabSOLL_SKONTO: TFloatField;
    OposTabSOLL_NTAGE: TIntegerField;
    OposTabIST_ANZAHLUNG: TFloatField;
    OposTabIST_SKONTO: TFloatField;
    OposTabIST_ZAHLDAT: TDateField;
    OposTabIST_BETRAG: TFloatField;
    OposTabMAHNKOSTEN: TFloatField;
    OposTabGEGENKONTO: TIntegerField;
    OposTabKUN_NUM: TStringField;
    OposTabKUN_ANREDE: TStringField;
    OposTabKUN_NAME1: TStringField;
    OposTabKUN_NAME2: TStringField;
    OposTabKUN_NAME3: TStringField;
    OposTabKUN_ABTEILUNG: TStringField;
    OposTabKUN_STRASSE: TStringField;
    OposTabKUN_PLZ: TStringField;
    OposTabKUN_LAND: TStringField;
    OposTabKUN_ORT: TStringField;
    OposTabSALDO: TFloatField;
    OposTabMAHNSTUFE: TFloatField;
    OposTabTAGE_OFFEN: TLargeintField;
    OposTabORGNUM: TStringField;
    LsKopfTab: TZQuery;
    LsKopfTabQUELLE: TIntegerField;
    LsKopfTabREC_ID: TIntegerField;
    LsKopfTabKM_STAND: TIntegerField;
    LsKopfTabLDATUM: TDateField;
    LsKopfTabLIEFART: TIntegerField;
    LsKopfTabKOST_NETTO: TFloatField;
    LsKopfTabWERT_NETTO: TFloatField;
    LsKopfTabWAEHRUNG: TStringField;
    LsKopfTabERSTELLT: TDateField;
    LsKopfTabERST_NAME: TStringField;
    LsKopfTabKUN_NUM: TStringField;
    LsKopfTabKUN_ANREDE: TStringField;
    LsKopfTabKUN_NAME1: TStringField;
    LsKopfTabKUN_NAME2: TStringField;
    LsKopfTabKUN_NAME3: TStringField;
    LsKopfTabKUN_ABTEILUNG: TStringField;
    LsKopfTabKUN_STRASSE: TStringField;
    LsKopfTabKUN_LAND: TStringField;
    LsKopfTabKUN_PLZ: TStringField;
    LsKopfTabKUN_ORT: TStringField;
    LsKopfTabUSR1: TStringField;
    LsKopfTabUSR2: TStringField;
    LsKopfTabPROJEKT: TStringField;
    LsKopfTabORGNUM: TStringField;
    LsKopfTabBEST_NAME: TStringField;
    LsKopfTabBEST_CODE: TIntegerField;
    LsKopfTabBEST_DATUM: TDateField;
    LsKopfTabLIEFART_KURZ: TStringField;
    LsKopfTabLIEFART_LANG: TStringField;
    LsKopfTabCALC_EMAIL: TStringField;
    LsKopfTabADDR_ID: TIntegerField;
    LsKopfTabCALC_LANDLANG: TStringField;
    LsKopfTabGEWICHT: TFloatField;
    LsKopfTabPRINT_FLAG: TBooleanField;
    LsKopfTabBRUTTO_FLAG: TBooleanField;
    LsPosTab: TZQuery;
    LsKopfTabDS: TDataSource;
    LsPosTabDS: TDataSource;
    SumQuery: TZQuery;
    SumQuerynetto: TFloatField;
    SumQuerymwst: TFloatField;
    SumQuerybrutto: TFloatField;
    SumQuerybezahlt: TFloatField;
    SumQuerywaehrung: TStringField;
    SumQuerySTADIUM: TIntegerField;
    SumQueryMWST_1: TFloatField;
    SumQueryMWST_2: TFloatField;
    SumQueryMWST_3: TFloatField;
    ArtTab: TZQuery;
    ArtDS: TDataSource;
    tblAdressen: TZQuery;
    AddrDS: TDataSource;
    KasBuch: TZQuery;
    KasBuchREC_ID: TIntegerField;
    KasBuchJAHR: TIntegerField;
    KasBuchBDATUM: TDateField;
    KasBuchQUELLE: TIntegerField;
    KasBuchJOURNAL_ID: TIntegerField;
    KasBuchZU_ABGANG: TFloatField;
    KasBuchBTXT: TMemoField;
    KasBuchBELEGNUM: TStringField;
    KasBuchGKONTO: TIntegerField;
    KasBuchSKONTO: TFloatField;
    KasBuchQuelleStr: TStringField;
    KasBuchDS: TDataSource;
    KasTagSumDS: TDataSource;
    KasTagSumTab: TZQuery;
    KasTagDetailDS: TDataSource;
    KasTagDetailTab: TZQuery;
    MahnPrintTab: TZQuery;
    MahnPrintTabquelle: TIntegerField;
    MahnPrintTabrdatum: TDateField;
    MahnPrintTabaddr_id: TIntegerField;
    MahnPrintTabbsumme: TFloatField;
    MahnPrintTabwaehrung: TStringField;
    MahnPrintTabsoll_ntage: TIntegerField;
    MahnPrintTabmahnkosten: TFloatField;
    MahnPrintTabgegenkonto: TIntegerField;
    MahnPrintTabkun_num: TStringField;
    MahnPrintTabkun_name1: TStringField;
    MahnPrintTabsaldo: TFloatField;
    MahnPrintTabmahnstufe: TIntegerField;
    MahnPrintTabtage_offen: TLargeintField;
    MahnPrintTabrec_id: TIntegerField;
    MahnPrintTabmahnprint: TIntegerField;
    MahnPrintTabnsumme: TFloatField;
    MahnPrintTabmsumme_0: TFloatField;
    MahnPrintTabmsumme_1: TFloatField;
    MahnPrintTabmsumme_2: TFloatField;
    MahnPrintTabmsumme_3: TFloatField;
    MahnPrintTabmsumme: TFloatField;
    MahnPrintTabzahlart: TIntegerField;
    MahnPrintTabstadium: TIntegerField;
    MahnPrintTabsoll_stage: TIntegerField;
    MahnPrintTabsoll_skonto: TFloatField;
    MahnPrintTabist_anzahlung: TFloatField;
    MahnPrintTabist_skonto: TFloatField;
    MahnPrintTabist_zahldat: TDateField;
    MahnPrintTabist_betrag: TFloatField;
    MahnPrintTabkun_anrede: TStringField;
    MahnPrintTabkun_name2: TStringField;
    MahnPrintTabkun_name3: TStringField;
    MahnPrintTabkun_abteilung: TStringField;
    MahnPrintTabkun_strasse: TStringField;
    MahnPrintTabkun_plz: TStringField;
    MahnPrintTabkun_land: TStringField;
    MahnPrintTabkun_ort: TStringField;
    MahnPrintTabfrist: TDateField;
    MahnPrintTabMAHNDATUM: TDateField;
    MahnPrintTabEMAIL: TStringField;
    MahnPrintTabEMAIL2: TStringField;
    MahnPrintTabTELE1: TStringField;
    MahnPrintTabFAX: TStringField;
    MahnPrintDS: TDataSource;
    BonTab: TZQuery;
    BonTabBELEGNUMMER: TIntegerField;
    BonTabBELEGDATUM: TDateField;
    BonTabBEDIENER: TStringField;
    BonTabMWST_0: TFloatField;
    BonTabMWST_1: TFloatField;
    BonTabMWST_2: TFloatField;
    BonTabMWST_3: TFloatField;
    BonTabNSUMME: TFloatField;
    BonTabMSUMME_0: TFloatField;
    BonTabMSUMME_1: TFloatField;
    BonTabMSUMME_2: TFloatField;
    BonTabMSUMME_3: TFloatField;
    BonTabBSUMME: TFloatField;
    BonTabWAEHRUNG: TStringField;
    BonTabZAHLART: TIntegerField;
    BonTabZAHLART_KURZ: TStringField;
    BonTabREC_ID: TIntegerField;
    BonDS: TDataSource;
    BonPosDS: TDataSource;
    BonPosTab: TZQuery;
    BonPosTabMATCHCODE: TStringField;
    BonPosTabARTNUM: TStringField;
    BonPosTabBARCODE: TStringField;
    BonPosTabLAENGE: TStringField;
    BonPosTabGROESSE: TStringField;
    BonPosTabDIMENSION: TStringField;
    BonPosTabGEWICHT: TFloatField;
    BonPosTabBEZEICHNUNG: TMemoField;
    BonPosTabME_EINHEIT: TStringField;
    BonPosTabMENGE: TFloatField;
    BonPosTabPR_EINHEIT: TFloatField;
    BonPosTabEPREIS: TFloatField;
    BonPosTabRABATT: TFloatField;
    BonPosTabRABATT2: TFloatField;
    BonPosTabRABATT3: TFloatField;
    BonPosTabERPREIS: TFloatField;
    BonPosTabGPREIS: TFloatField;
    BonPosTabSTEUER_CODE: TIntegerField;
    BonPosTabMWST_BETRAG: TFloatField;
    BonPosTabMWSTPROZ: TFloatField;
    TextTab: TZQuery;
    TextTabMATCHCODE: TStringField;
    TextTabKUNDENGRUPPE: TIntegerField;
    TextTabKUNNUM1: TStringField;
    TextTabKUNNUM2: TStringField;
    TextTabANREDE: TStringField;
    TextTabNAME1: TStringField;
    TextTabNAME2: TStringField;
    TextTabNAME3: TStringField;
    TextTabABTEILUNG: TStringField;
    TextTabSTRASSE: TStringField;
    TextTabLAND: TStringField;
    TextTabPLZ: TStringField;
    TextTabORT: TStringField;
    TextTabGRUPPE: TStringField;
    TextTabTELE1: TStringField;
    TextTabTELE2: TStringField;
    TextTabFAX: TStringField;
    TextTabFUNK: TStringField;
    TextTabEMAIL: TStringField;
    TextTabEMAIL2: TStringField;
    TextTabINTERNET: TStringField;
    TextTabDIVERSES: TStringField;
    TextTabBRIEFANREDE: TStringField;
    TextTabDEB_NUM: TIntegerField;
    TextTabKRD_NUM: TIntegerField;
    TextTabUST_NUM: TStringField;
    TextTabBRIEFTEXT: TMemoField;
    TextTabDATUM: TDateTimeField;
    TextTabERSTELLER: TStringField;
    TextTabBETREFF: TStringField;
    TextTabID: TIntegerField;
    TextTabADDR_ID: TIntegerField;
    TextDS: TDataSource;
    ReKopfTab: TZQuery;
    ReKopfTabLIEFART_KURZ: TStringField;
    ReKopfTabLIEFART_LANG: TStringField;
    ReKopfTabZAHLART_KURZ: TStringField;
    ReKopfTabZAHLART_LANG: TStringField;
    ReKopfTabSOLL_ZAHLUNGSZIEL: TStringField;
    ReKopfTabSOLL_STAGE: TIntegerField;
    ReKopfTabSOLL_SKONTO: TFloatField;
    ReKopfTabSOLL_NTAGE: TIntegerField;
    ReKopfTabLIEFART: TIntegerField;
    ReKopfTabZAHLART: TIntegerField;
    ReKopfTabQUELLE: TIntegerField;
    ReKopfTabREC_ID: TIntegerField;
    ReKopfTabQUELLE_SUB: TIntegerField;
    ReKopfTabADDR_ID: TIntegerField;
    ReKopfTabRDATUM: TDateField;
    ReKopfTabKUN_NUM: TStringField;
    ReKopfTabKUN_ANREDE: TStringField;
    ReKopfTabKUN_NAME1: TStringField;
    ReKopfTabKUN_NAME2: TStringField;
    ReKopfTabKUN_NAME3: TStringField;
    ReKopfTabKUN_ABTEILUNG: TStringField;
    ReKopfTabKUN_STRASSE: TStringField;
    ReKopfTabKUN_LAND: TStringField;
    ReKopfTabKUN_PLZ: TStringField;
    ReKopfTabKUN_ORT: TStringField;
    ReKopfTabLDATUM: TDateField;
    ReKopfTabLOHN: TFloatField;
    ReKopfTabWARE: TFloatField;
    ReKopfTabTKOST: TFloatField;
    ReKopfTabMWST_0: TFloatField;
    ReKopfTabMWST_1: TFloatField;
    ReKopfTabMWST_2: TFloatField;
    ReKopfTabMWST_3: TFloatField;
    ReKopfTabNSUMME: TFloatField;
    ReKopfTabMSUMME_0: TFloatField;
    ReKopfTabMSUMME_1: TFloatField;
    ReKopfTabMSUMME_2: TFloatField;
    ReKopfTabMSUMME_3: TFloatField;
    ReKopfTabMSUMME: TFloatField;
    ReKopfTabBSUMME: TFloatField;
    ReKopfTabWAEHRUNG: TStringField;
    ReKopfTabSOLL_RATEN: TIntegerField;
    ReKopfTabSOLL_RATBETR: TFloatField;
    ReKopfTabSOLL_RATINTERVALL: TIntegerField;
    ReKopfTabERSTELLT: TDateField;
    ReKopfTabERST_NAME: TStringField;
    ReKopfTabUSR1: TStringField;
    ReKopfTabUSR2: TStringField;
    ReKopfTabPROJEKT: TStringField;
    ReKopfTabORGNUM: TStringField;
    ReKopfTabBEST_NAME: TStringField;
    ReKopfTabBEST_CODE: TIntegerField;
    ReKopfTabBEST_DATUM: TDateField;
    ReKopfTabCALC_LIEF_ANREDE: TStringField;
    ReKopfTabCALC_LIEF_NAME1: TStringField;
    ReKopfTabCALC_LIEF_NAME2: TStringField;
    ReKopfTabCALC_LIEF_NAME3: TStringField;
    ReKopfTabCALC_LIEF_STRASSE: TStringField;
    ReKopfTabCALC_LIEF_PLZ: TStringField;
    ReKopfTabCALC_LIEF_ORT: TStringField;
    ReKopfTabCALC_LIEF_LAND: TStringField;
    ReKopfTabLIEF_ADDR_ID: TIntegerField;
    ReKopfTabKFZ_ID: TIntegerField;
    ReKopfTabCALC_POLKZ: TStringField;
    ReKopfTabCALC_FGSTNR: TStringField;
    ReKopfTabKM_STAND: TIntegerField;
    ReKopfTabCALC_EMAIL: TStringField;
    ReKopfTabCALC_UST_ID: TStringField;
    ReKopfTabCALC_BRIEFANREDE: TStringField;
    ReKopfTabCALC_LANDLANG: TStringField;
    ReKopfTabTERMIN: TDateField;
    ReKopfTabGEWICHT: TFloatField;
    ReKopfTabSOLL_NDATUM: TDateTimeField;
    ReKopfTabSOLL_SDATUM: TDateTimeField;
    ReKopfTabCALC_SKONTOBETRAG: TFloatField;
    ReKopfTabCALC_BSUM_SKONTO: TFloatField;
    ReKopfTabFREIGABE1_FLAG: TBooleanField;
    ReKopfTabPRINT_FLAG: TBooleanField;
    ReKopfTabBRUTTO_FLAG: TBooleanField;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ReportTab: TZQuery;
    ReportTabMAINKEY: TStringField;
    ReportTabNAME: TStringField;
    ReportTabVAL_BLOB: TMemoField;
    ReportTabVAL_CHAR: TStringField;
    ReportTabVAL_BIN: TBlobField;
    ReportTabVAL_TYP: TIntegerField;
    ReportDS: TDataSource;
    RePosTabGPREIS1: TFloatField;
    ReKopfTabVRENUM: TStringField;
    ReKopfTabVLSNUM: TStringField;
    RePosTabVRENUM: TStringField;
    RePosTabVLSNUM: TStringField;
    MahnPrintTabVRENUM: TStringField;
    CBFormular: TJvFilenameEdit;
    LsKopfTabVLSNUM: TStringField;
    Label18: TLabel;
    Inventur: TZQuery;
    InventurDS: TDataSource;
    InventurPos: TZQuery;
    InventurPosDS: TDataSource;
    InventurSumme: TZQuery;
    InventurSumDS: TDataSource;
    InvArtDS: TDataSource;
    InvArtListe: TZQuery;
    Label20: TLabel;
    ReJournalTab: TZQuery;
    ReJourDS: TDataSource;
    Lagerliste: TZQuery;
    LagerDS: TDataSource;
    LsKopfTabCALC_LiefAnrede: TStringField;
    LsKopfTabCALC_LiefName1: TStringField;
    LsKopfTabCALC_LiefName2: TStringField;
    LsKopfTabCALC_LiefName3: TStringField;
    LsKopfTabCALC_LiefStrasse: TStringField;
    LsKopfTabCALC_LiefLand: TStringField;
    LsKopfTabCALC_LiefPLZ: TStringField;
    LsKopfTabCALC_LiefOrt: TStringField;
    LsKopfTabLIEF_ADDR_ID: TIntegerField;
    LsKopfTabSTADIUM: TIntegerField;
    ReKopfTabVERBAND: TIntegerField;
    ReKopfTabCALC_VERBAND_ANREDE: TStringField;
    ReKopfTabCALC_VERBAND_NAME1: TStringField;
    ReKopfTabCALC_VERBAND_NAME2: TStringField;
    ReKopfTabCALC_VERBAND_NAME3: TStringField;
    ReKopfTabCALC_VERBAND_STRASSE: TStringField;
    ReKopfTabCALC_VERBAND_LAND: TStringField;
    ReKopfTabCALC_VERBAND_PLZ: TStringField;
    ReKopfTabCALC_VERBAND_ORT: TStringField;
    WGSUmmeDelete: TZQuery;
    MailDS: TDataSource;
    UmsatzWG: TZQuery;
    UmsatzWGGPREIS: TFloatField;
    UmsatzWGGEGENKTO: TIntegerField;
    UmsatzWGSTEUER_CODE: TIntegerField;
    Label21: TLabel;
    ReKopfTabNSUMME_0: TFloatField;
    ReKopfTabNSUMME_1: TFloatField;
    ReKopfTabNSUMME_2: TFloatField;
    ReKopfTabNSUMME_3: TFloatField;
    ReKopfTabBSUMME_0: TFloatField;
    ReKopfTabBSUMME_1: TFloatField;
    ReKopfTabBSUMME_2: TFloatField;
    ReKopfTabBSUMME_3: TFloatField;
    KasTagDetailPos: TZQuery;
    DBDetailDataSet: TfrDBDataSet;
    KasTagDetailPosREC_ID: TIntegerField;
    KasTagDetailPosQUELLE: TIntegerField;
    KasTagDetailPosQUELLE_SUB: TIntegerField;
    KasTagDetailPosQUELLE_SRC: TIntegerField;
    KasTagDetailPosJOURNAL_ID: TIntegerField;
    KasTagDetailPosARTIKELTYP: TStringField;
    KasTagDetailPosARTIKEL_ID: TIntegerField;
    KasTagDetailPosTOP_POS_ID: TIntegerField;
    KasTagDetailPosADDR_ID: TIntegerField;
    KasTagDetailPosATRNUM: TIntegerField;
    KasTagDetailPosVRENUM: TStringField;
    KasTagDetailPosVLSNUM: TStringField;
    KasTagDetailPosPOSITION: TIntegerField;
    KasTagDetailPosVIEW_POS: TStringField;
    KasTagDetailPosMATCHCODE: TStringField;
    KasTagDetailPosARTNUM: TStringField;
    KasTagDetailPosBARCODE: TStringField;
    KasTagDetailPosMENGE: TFloatField;
    KasTagDetailPosLAENGE: TStringField;
    KasTagDetailPosBREITE: TStringField;
    KasTagDetailPosHOEHE: TStringField;
    KasTagDetailPosGROESSE: TStringField;
    KasTagDetailPosDIMENSION: TStringField;
    KasTagDetailPosGEWICHT: TFloatField;
    KasTagDetailPosME_EINHEIT: TStringField;
    KasTagDetailPosPR_EINHEIT: TFloatField;
    KasTagDetailPosVPE: TIntegerField;
    KasTagDetailPosEK_PREIS: TFloatField;
    KasTagDetailPosCALC_FAKTOR: TFloatField;
    KasTagDetailPosEPREIS: TFloatField;
    KasTagDetailPosGPREIS: TFloatField;
    KasTagDetailPosE_RGEWINN: TFloatField;
    KasTagDetailPosG_RGEWINN: TFloatField;
    KasTagDetailPosRABATT: TFloatField;
    KasTagDetailPosRABATT2: TFloatField;
    KasTagDetailPosRABATT3: TFloatField;
    KasTagDetailPosE_RABATT_BETRAG: TFloatField;
    KasTagDetailPosG_RABATT_BETRAG: TFloatField;
    KasTagDetailPosSTEUER_CODE: TIntegerField;
    KasTagDetailPosALTTEIL_PROZ: TFloatField;
    KasTagDetailPosALTTEIL_STCODE: TIntegerField;
    KasTagDetailPosPROVIS_PROZ: TFloatField;
    KasTagDetailPosPROVIS_WERT: TFloatField;
    KasTagDetailPosGEBUCHT: TStringField;
    KasTagDetailPosGEGENKTO: TIntegerField;
    KasTagDetailPosBEZEICHNUNG: TMemoField;
    KasTagDetailPosSN_FLAG: TStringField;
    KasTagDetailPosALTTEIL_FLAG: TStringField;
    KasTagDetailPosBEZ_FEST_FLAG: TStringField;
    KasTagDetailPosBRUTTO_FLAG: TStringField;
    KasTagDetailPosNO_RABATT_FLAG: TStringField;
    KasTagDetailPosMwst: TFloatField;
    KasTagDetailPosWGName: TStringField;
    KasTagDetailPosDEF_EKTO: TIntegerField;
    RePosTabHinweis: TStringField;
    RePosTabWGNR: TIntegerField;
    RePosTabWGName: TStringField;
    RePosTabCALC_BPREIS: TCurrencyField;
    ReKopfTabIST_ANZAHLUNG: TFloatField;
    ReKopfTabIST_BETRAG: TFloatField;
    MahnPrintTabBRIEFANREDE: TStringField;
    ReJournalPos: TZQuery;
    ReJournalPosDS: TDataSource;
    ReKopfTabINFO: TMemoField;
    RePosTabCALC_MENGE: TStringField;
    RePosTabCALC_EPREIS: TStringField;
    RePosTabCALC_GPREIS: TStringField;
    ReKopfTabCALC_ANZAHLUNG_LBL: TStringField;
    ReKopfTabCALC_ANZAHLUNG_VALUE: TStringField;
    ReKopfTabCALC_RESTZAHLUNG_LBL: TStringField;
    ReKopfTabCALC_RESTZAHLUNG_VALUE: TStringField;
    LsKopfTabMATCHCODE: TStringField;
    ReKopfTabCALC_LDATUM: TStringField;
    LagerWGInv: TZQuery;
    LagerWGInvDS: TDataSource;
    LsKopfTabMWST_0: TFloatField;
    LsKopfTabMWST_1: TFloatField;
    LsKopfTabMWST_2: TFloatField;
    LsKopfTabMWST_3: TFloatField;
    LsKopfTabNSUMME_0: TFloatField;
    LsKopfTabNSUMME_1: TFloatField;
    LsKopfTabNSUMME_2: TFloatField;
    LsKopfTabNSUMME_3: TFloatField;
    LsKopfTabNSUMME: TFloatField;
    LsKopfTabMSUMME_0: TFloatField;
    LsKopfTabMSUMME_1: TFloatField;
    LsKopfTabMSUMME_2: TFloatField;
    LsKopfTabMSUMME_3: TFloatField;
    LsKopfTabMSUMME: TFloatField;
    LsKopfTabBSUMME_0: TFloatField;
    LsKopfTabBSUMME_1: TFloatField;
    LsKopfTabBSUMME_2: TFloatField;
    LsKopfTabBSUMME_3: TFloatField;
    LsKopfTabBSUMME: TFloatField;
    LsKopfTabADATUM: TDateField;
    LsKopfTabCALC_LDATUM: TStringField;
    LsPosTabCALC_MENGE: TStringField;
    LsPosTabCALC_GEWICHT: TStringField;
    LsPosTabREC_ID: TIntegerField;
    LsPosTabQUELLE: TIntegerField;
    LsPosTabQUELLE_SUB: TIntegerField;
    LsPosTabQUELLE_SRC: TIntegerField;
    LsPosTabJOURNAL_ID: TIntegerField;
    LsPosTabARTIKELTYP: TStringField;
    LsPosTabARTIKEL_ID: TIntegerField;
    LsPosTabTOP_POS_ID: TIntegerField;
    LsPosTabADDR_ID: TIntegerField;
    LsPosTabATRNUM: TIntegerField;
    LsPosTabVRENUM: TStringField;
    LsPosTabVLSNUM: TStringField;
    LsPosTabPOSITION: TIntegerField;
    LsPosTabVIEW_POS: TStringField;
    LsPosTabMATCHCODE: TStringField;
    LsPosTabARTNUM: TStringField;
    LsPosTabBARCODE: TStringField;
    LsPosTabMENGE: TFloatField;
    LsPosTabLAENGE: TStringField;
    LsPosTabBREITE: TStringField;
    LsPosTabHOEHE: TStringField;
    LsPosTabGROESSE: TStringField;
    LsPosTabDIMENSION: TStringField;
    LsPosTabGEWICHT: TFloatField;
    LsPosTabME_EINHEIT: TStringField;
    LsPosTabPR_EINHEIT: TFloatField;
    LsPosTabVPE: TIntegerField;
    LsPosTabEK_PREIS: TFloatField;
    LsPosTabCALC_FAKTOR: TFloatField;
    LsPosTabEPREIS: TFloatField;
    LsPosTabGPREIS: TFloatField;
    LsPosTabE_RGEWINN: TFloatField;
    LsPosTabG_RGEWINN: TFloatField;
    LsPosTabRABATT: TFloatField;
    LsPosTabRABATT2: TFloatField;
    LsPosTabRABATT3: TFloatField;
    LsPosTabE_RABATT_BETRAG: TFloatField;
    LsPosTabG_RABATT_BETRAG: TFloatField;
    LsPosTabSTEUER_CODE: TIntegerField;
    LsPosTabALTTEIL_PROZ: TFloatField;
    LsPosTabALTTEIL_STCODE: TIntegerField;
    LsPosTabPROVIS_PROZ: TFloatField;
    LsPosTabPROVIS_WERT: TFloatField;
    LsPosTabGEBUCHT: TBooleanField;
    LsPosTabGEGENKTO: TIntegerField;
    LsPosTabBEZEICHNUNG: TMemoField;
    LsPosTabSN_FLAG: TBooleanField;
    LsPosTabALTTEIL_FLAG: TBooleanField;
    LsPosTabBEZ_FEST_FLAG: TBooleanField;
    LsPosTabBRUTTO_FLAG: TBooleanField;
    LsPosTabNO_RABATT_FLAG: TBooleanField;
    LsKopfTabCALC_LiefCO: TStringField;
    ReKopfTabCALC_LIEF_CO: TStringField;
    Label22: TLabel;
    FormularCB: TJvDBLookupCombo;
    paReports: TJvPanel;
    Label3: TLabel;
    cbReport: TOFValueComboBox;
    Label4: TLabel;
    ZielCB: TComboBox;
    Label5: TLabel;
    BinNamCB: TJvHTComboBox;
    Label6: TLabel;
    KopienSpin: TJvSpinEdit;
    cbDHL: TCheckBox;
    gbSeitenbereich: TGroupBox;
    Label19: TLabel;
    RButton1: TRadioButton;
    RButton2: TRadioButton;
    Edit1: TEdit;
    VorschauBtn: TBitBtn;
    PrintBtn: TBitBtn;
    SendEMailBtn: TBitBtn;
    CloseBtn: TBitBtn;
    DruEinrBtn: TBitBtn;
    PDFBtn: TBitBtn;
    LayoutBtn: TBitBtn;
    tblAnsprechpartner: TZQuery;
    procedure LayoutBtnClick(Sender: TObject);
    procedure VorschauBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure DruEinrBtnClick(Sender: TObject);
    procedure LsKopfTabCalcFields(DataSet: TDataSet);
    procedure LsKopfTabAfterScroll(DataSet: TDataSet);
    procedure ReKopfTabCalcFields(DataSet: TDataSet);
    procedure ReKopfTabAfterScroll(DataSet: TDataSet);
    procedure JournalTabCalcFields(DataSet: TDataSet);
    procedure RePosTabCalcFields(DataSet: TDataSet);
    procedure KasBuchCalcFields(DataSet: TDataSet);
    procedure MahnPrintTabCalcFields(DataSet: TDataSet);
    procedure BonTabCalcFields(DataSet: TDataSet);
    procedure BonPosTabCalcFields(DataSet: TDataSet);
    procedure SumQueryAfterOpen(DataSet: TDataSet);
    procedure SendEMailBtnClick(Sender: TObject);
    procedure PDFBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZielCBClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure RButton2Click(Sender: TObject);
    procedure RButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure RePosTabAfterScroll(DataSet: TDataSet);
    procedure BinNamCBClick(Sender: TObject);
    procedure ReportTabBeforeOpen(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
    procedure LsPosTabCalcFields(DataSet: TDataSet);
    procedure DesignerSave(Report: TfrReport; var RepName: String;
      var Saved: Boolean);
    procedure DesignerSaveAs(Report: TfrReport; var RepName: String;
      var Saved: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private-Deklarationen }
    Quelle      : Integer;
    CurrBelegID : Integer;

    MKey: string;
    MainKey: String;

    jour_netto  : Double;
    jour_brutto : Double;
    jour_mwst   : Double;
    jour_mwst1  : Double;
    jour_mwst2  : Double;
    jour_mwst3  : Double;
    jour_offen  : Double;
    jour_bezahlt: Double;

    JName       : String;

    VDat, BDat  : tDateTime;
    ZeitraumStr : String;

    TmpSN: String; // Liste der Seriennummern des akt. Artikels
    TmpSNPos: Integer;

    PrintAbort     : Boolean;

    EMail, Fax     : String;

    procedure Report_Daten_zuweisen(BelegArt, BelegID: Integer);
    function DB_Spalte_ermitteln: Integer;
    procedure LoadReport;
    procedure DHLExport;
  public
    { Public-Deklarationen }
    procedure MapiError(Sender: TObject; ErrorCode: Integer);
    procedure ShowJournalDlg(NewQuelle: Integer; Von, Bis: tDateTime; Z: String; KundenID: integer);
    Procedure ShowBelegDlg(BelegArt, BelegID: Integer; Preview: Boolean);
    procedure ShowOposDlg (NewQuelle: Integer; Von, Bis: tDateTime; Z: String);
    procedure ShowKasBuchDlg (Von, Bis, LeBuchung: tDateTime; StartSaldo, EndSaldo: Double; Z: String);
    procedure ShowMahnungDlg (Addr_ID: Integer);
    procedure ShowBriefDlg(TextID: Integer; Vorschau: Boolean);
    procedure ShowAdresseDlg(Adressen_Id: integer; preview: Boolean);
    procedure ShowAdressenListeDlg(SQL: String; preview: Boolean);
    procedure ShowArtikelliste();
    procedure MakePDF (SendEmail: Boolean);
    procedure ShowInventurListe(InventurID: integer);
    procedure ShowLagerbestandsliste(InventurID: integer);
    procedure Lagerbestandsliste();
    procedure KasseTagesAbRechnung(DatumVon, DatumBis: TDate);
    procedure DatevExport(Von, Bis: TDate);
    procedure ShowUniDlg (Modul: Integer; SQL: String; RegKey: String; DlgTxt: String; EdiTxt: String; JobTxt: String; Vorschau: Boolean);
  end;

procedure LoadFromBlobField(BlobFld: TField);
procedure SaveToBlobField(BlobFld: TField);

var
  PrintRechForm: TPrintRechForm;

implementation

uses
  //gnugettext,
  Printers, Clipbrd, SMapi, EMail,
  FR_E_TNPDF, FR_E_RTF,
  OF_DM, OF_MAIN, OF_Var_Const, OF_Link, OF_Tool1;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TPrintRechForm.FormCreate(Sender: TObject);
begin
  Quelle       := - 1;
  EMail        := '';
  Fax          := '';
  ClientHeight := paReports.Height;
  Report1.DatasetStrList.Clear;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.FormDestroy(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.FormDeactivate(Sender: TObject);
begin
  // ReportTab.close;
end;

//-----------------------------------------------------------------
procedure TPrintRechForm.FormShow(Sender: TObject);
begin
  Printer.PrinterIndex := - 1;
  ZielCB.Items.Assign(Printer.Printers);
  ZielCB.ItemIndex := Printer.PrinterIndex;

  //  BinNamCB.Items.Assign(Printer.PaperSources);
  // BinNamCB.ItemIndex := Printer.PaperSourceIndex;  //aktueller Schacht

  RButton1.Checked := true;
  PrintBtn.SetFocus;
  //if not ReportTab.Active then  //31.10.09-ud.
  //  ReportTab.Open;
end;

//------------------------------------------------------------------------------
Procedure TPrintRechForm.LoadReport;
begin
  case Quelle of
    VK_RECH: begin
      Report1.Title := 'Faktura Rechnung Nr.:' + ReKopfTabVRENUM.Value;
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_AGB: begin
      Report1.Title := 'Faktura Angebot Nr.:' + ReKopfTabVRENUM.Value;
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_LIEF: begin
      Report1.Title := 'Faktura Lieferschein Nr.:' + LsKopfTabVLSNUM.Value;
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    EK_BEST: begin
      Report1.Title := 'Faktura EK-Bestellung Nr.:' + ReKopfTabVRENUM.Value;
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_KASSE: begin
      Report1.Title := 'Faktura Kassenbon Nr.:' + ReKopfTabVRENUM.Value;
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_RECH + 100: begin
      Report1.Title := 'Faktura Verkaufsjournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_KASSE + 100: begin
      Report1.Title := 'Faktura Kassenjournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_AGB + 100 : begin
      Report1.Title := 'Faktura Angebotsjournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    EK_RECH + 100: begin
      Report1.Title := 'Faktura Einkaufsjournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    VK_LIEF + 100: begin
      Report1.Title := 'Faktura Lieferscheinjournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    EK_BEST + 100: begin
      Report1.Title := 'Faktura EK-Bestelljournal';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    KRD_OPOS: begin
      Report1.Title := 'Faktura OPOS-Debitoren';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    DEB_OPOS: begin
      Report1.Title := 'Faktura OPOS-Kreditoren';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    KAS_BUCH: begin
      Report1.Title := 'Faktura Kassenbuch';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    TEXTVERARB: begin
      Report1.Title := 'Faktura Schriftverkehr';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    MAHNUNG: begin
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    MOD_INV_WERTLISTE:
    begin
      Report1.Title := 'Inventur Wertliste';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    (*
    MOD_INV_ZAEHLLISTE:
    begin
      Report1.Title := 'Inventur Zählliste';
      Report1.LoadFromFile(CBFormular.Filename);
    end;
    *)
    else
    begin
      Report1.LoadFromFile(CBFormular.Filename);
    end;
  end;
end;

procedure TPrintRechForm.MapiError(Sender: TObject; ErrorCode: Integer);
var
  EStr: String;
begin
  if ErrorCode < 2 then
    exit;

  case ErrorCode of
    3: EStr := 'MAPI_E_LOGIN_FAILURE';
    4: EStr := 'MAPI_E_DISK_FULL';
    5: EStr := 'MAPI_E_INSUFFICIENT_MEMORY';
    6: EStr := 'MAPI_E_ACCESS_DENIED';
    8: EStr := 'MAPI_E_TOO_MANY_SESSIONS';
    9: EStr := 'MAPI_E_TOO_MANY_FILES';
    10: EStr := 'MAPI_E_TOO_MANY_RECIPIENTS';
    11: EStr := 'MAPI_E_ATTACHMENT_NOT_FOUND';
    12: EStr := 'MAPI_E_ATTACHMENT_OPEN_FAILURE';
    13: EStr := 'MAPI_E_ATTACHMENT_WRITE_FAILURE';
    14: EStr := 'MAPI_E_UNKNOWN_RECIPIENT';
    15: EStr := 'MAPI_E_BAD_RECIPTYPE';
    16: EStr := 'MAPI_E_NO_MESSAGES';
    17: EStr := 'MAPI_E_INVALID_MESSAGE';
    18: EStr := 'MAPI_E_TEXT_TOO_LARGE';
    19: EStr := 'MAPI_E_INVALID_SESSION';
    20: EStr := 'MAPI_E_TYPE_NOT_SUPPORTED';
    21: EStr := 'MAPI_E_AMBIGUOUS_RECIPIENT';
    22: EStr := 'MAPI_E_MESSAGE_IN_USE';
    23: EStr := 'MAPI_E_NETWORK_FAILURE';
    24: EStr := 'MAPI_E_INVALID_EDITFIELDS';
    25: EStr := 'MAPI_E_INVALID_RECIPS';
    26: EStr := 'MAPI_E_NOT_SUPPORTED';
    else
      EStr := '';
  end;
  MessageDlg('Ein MAPI-Fehler ist aufgetreten.' + #13#10 +
             'Fehlercode : ' + Inttostr(ErrorCode) + ' ' + EStr,
             mterror, [mbok], 0
  );
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowMahnungDlg (Addr_ID: Integer);
var
  Res: Boolean;
  i: Integer;
begin
  EMail  := '';
  Fax    := '';
  Quelle := MAHNUNG;
  frVariables.Clear;

  if DM1.ReadString ('MAIN\MAHNUNG', 'DEFAULT', '') = '' then
    DM1.WriteString ('MAIN\MAHNUNG', 'DEFAULT', 'Einstellungen für Mahnlauf');

  for i := 1 to 5 do
  begin
    DM1.MahnFrist[i] := DM1.ReadInteger ('MAIN\MAHNUNG', 'FRIST_STUFE_' + Inttostr(I), -1);
    if DM1.MahnFrist[i ]< 0 then
    begin
      DM1.MahnFrist[i] := 14;
      DM1.WriteInteger ('MAIN\MAHNUNG', 'FRIST_STUFE_' + Inttostr(I), DM1.MahnFrist[i]);
    end;
  end;


  MahnPrintTab.Close;
  MahnPrintTab.Sql.Clear;
  MahnPrintTab.SQL.Add ('select J2.REC_ID,J2.QUELLE,J2.VRENUM,J2.RDATUM,J2.ADDR_ID,');
  MahnPrintTab.SQL.Add ('J2.NSUMME,J2.MSUMME_0,J2.MSUMME_1,J2.MSUMME_2,J2.MSUMME_3,J2.MSUMME,J2.BSUMME,');
  MahnPrintTab.SQL.Add ('J2.ZAHLART,J2.STADIUM,J2.WAEHRUNG,');
  MahnPrintTab.SQL.Add ('J2.SOLL_STAGE,J2.SOLL_SKONTO,J2.SOLL_NTAGE,');
  MahnPrintTab.SQL.Add ('J2.IST_ANZAHLUNG,J2.IST_SKONTO,J2.IST_ZAHLDAT,J2.IST_BETRAG,J2.MAHNKOSTEN,J2.GEGENKONTO,');
  MahnPrintTab.SQL.Add ('J2.KUN_NUM,J2.KUN_ANREDE,AD.BRIEFANREDE,J2.KUN_NAME1,J2.KUN_NAME2,J2.KUN_NAME3,J2.KUN_ABTEILUNG,');
  MahnPrintTab.SQL.Add ('J2.KUN_STRASSE,J2.KUN_PLZ,J2.KUN_LAND,J2.KUN_ORT,');
  MahnPrintTab.SQL.Add ('(J2.BSUMME - J2.IST_ANZAHLUNG - J2.IST_BETRAG) as SALDO,');
  MahnPrintTab.SQL.Add ('J2.MAHNSTUFE, to_days(curdate())-TO_DAYS(J2.RDATUM) as TAGE_OFFEN,J2.MAHNPRINT,J2.MAHNDATUM,');
  MahnPrintTab.SQL.Add ('AD.EMAIL,AD.EMAIL2,AD.TELE1,AD.FAX');
  MahnPrintTab.SQL.Add ('from JOURNAL as J1');
  MahnPrintTab.SQL.Add ('INNER JOIN JOURNAL as J2 ON J1.ADDR_ID=J2.ADDR_ID');
  MahnPrintTab.SQL.Add ('LEFT OUTER JOIN ADRESSEN AD ON AD.REC_ID=J1.ADDR_ID');
  MahnPrintTab.SQL.Add ('where ');
  if Addr_ID = -1 then
    MahnPrintTab.SQL.Add ('J1.MAHNPRINT=1 and ');
  MahnPrintTab.SQL.Add ('J1.STADIUM BETWEEN 20 and 79 and J1.QUELLE=3 and YEAR(J1.RDATUM)>2000 and ');
  MahnPrintTab.SQL.Add ('J2.STADIUM BETWEEN 20 and 79 and J2.Quelle=3 and YEAR(J2.RDATUM)>2000 and J2.BSUMME !=0');
  if Addr_ID > 0 then
    MahnPrintTab.SQL.Add ('and J2.ADDR_ID=' + Inttostr(Addr_ID));
  MahnPrintTab.SQL.Add ('GROUP BY J2.REC_ID order by J2.KUN_NAME1, J2.ADDR_ID, MAHNSTUFE DESC, J2.RDATUM, J2.VRENUM');

  Caption := 'Mahnung drucken';

  DbDataset.DataSource  := MahnPrintDS;

  MKey := 'MAIN\FREEREPORT\MAHNUNG';

  MahnPrintTab.Open;

  EMail := MahnPrintTabEMail.AsString;
  Fax   := MahnPrintTabFax.AsString;

  //Formulare_aus_DB_laden;
  CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Mahnung' + intToStr(MahnprintTabMahnstufe.Value) + '.frf';

  if Quelle <> MAHNUNG then
  begin
    Quelle := MAHNUNG;
  end;
  DM1.FirmaTab.Open;

  repeat
  until ShowModal <> mrRetry;

  if DM1.FirmaTab.Active then
    DM1.FirmaTab.Close;
  if MahnPrintTab.Active then
    MahnPrintTab.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowKasBuchDlg (Von, Bis, LeBuchung: tDateTime; StartSaldo, EndSaldo: Double; Z: String);
var
  Res: Boolean;
  i: integer;
  ja, mo, ta: word;
begin
  EMail  := '';
  Fax    := '';

  KasBuch.Close;

  Caption := 'Kassenbuch drucken';

  DEcodeDate (Von, Ja, Mo, Ta);

  KasBuch.ParamByName ('JAHR').Value := Ja;
  KasBuch.ParamByName ('VDAT').Value := Von;
  KasBuch.ParamByName ('BDAT').Value := Bis;

  KasBuch.Open;

  DbDataset.DataSource  := KasBuchDS;
  MKey := 'MAIN\FREEREPORT\KASSENBUCH';

  frVariables.Clear;

  frVariables['KasBuchEndDatum']       := Bis;
  frVariables['KasBuchLeBuchungDatum'] := leBuchung;
  frVariables['KasBuchStartSaldo']     := StartSaldo;
  frVariables['KasBuchEndSaldo']       := EndSaldo;
  frVariables['KasBuchZeitraumv']      := Z;
  frVariables['KasBuchStartDatum']     := Von;

  if Quelle <> KAS_BUCH then
  begin
    Quelle := KAS_BUCH;
  end;

  DM1.FirmaTab.Open;

  repeat
  until ShowModal <> mrRetry;

  if DM1.FirmaTab.Active then
    DM1.FirmaTab.Close;
  if KasBuch.Active then
    KasBuch.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowOposDlg (NewQuelle: Integer; Von, Bis: tDateTime; Z: String);
var
  Res: Boolean;
  i: integer;
begin
  EMail  := '';
  Fax    := '';
  frVariables.Clear;
  OPosTab.Close;

  case NewQuelle of
    DEB_OPOS: begin
      Caption := 'OPOS Debitoren drucken';
      OPosTab.ParamByName ('QUELLE').Value := VK_RECH;
      OPosTab.ParamByName ('VONDATUM').Value := Von;
      MKey := 'MAIN\FREEREPORT\OPOS_DEB';
    end;
    KRD_OPOS: begin
      Caption := 'OPOS Kreditoren drucken';
      OPosTab.ParamByName ('QUELLE').Value := EK_RECH;
      OPosTab.ParamByName ('VONDATUM').Value := Von;
      MKey := 'MAIN\FREEREPORT\OPOS_KRD';
    end;

  end; //case Quelle

  DbDataset.DataSource := OposDS;

  OPosTab.Open;

  if Quelle <> NewQuelle then
  begin
    Quelle := NewQuelle;
  end;
  DM1.FirmaTab.Open;

  repeat
  until ShowModal <> mrRetry;

  if DM1.FirmaTab.Active then
    DM1.FirmaTab.Close;

  if OPosTab.Active then
    OPosTab.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.Report_Daten_zuweisen(BelegArt, BelegID: Integer);
var
  RTitle: String;
begin
  case BelegArt of
    VK_AGB,
    VK_AGB_EDI : Begin //Angebot
      Caption := 'Angebot drucken';
      MKey := 'MAIN\FREEREPORT\ANGEBOT';
      DbDataset.DataSource := RePosTabDS;
      RTitle := 'Angebot';
    end;
    VK_LIEF,
    VK_LIEF_EDI: Begin //Lieferschein
      Caption := 'Lieferschein drucken';
      MKey := 'MAIN\FREEREPORT\LIEFERSCHEIN';
      DbDataset.DataSource  := LsPosTabDS;
      RTitle := 'Lieferschein';
    end;
    VK_RECH,
    VK_RECH_EDI,
    VK_WKRE_EDI: Begin //Rechnung
      Caption := 'Rechnung drucken';
      MKey := 'MAIN\FREEREPORT\RECHNUNG';
      DbDataset.DataSource  := RePosTabDS;
      RTitle := 'Rechnung';
    end;
    EK_BEST,
    EK_BEST_EDI: Begin //EK Bestellung
      Caption := 'EK Bestellung drucken';
      MKey := 'MAIN\FREEREPORT\EK_BESTELLUNG';
      DbDataset.DataSource  := RePosTabDS;
      RTitle := 'Bestellung';
    end;
    (*
    VK_AB      : Begin //Auftragsbestätigung
      Caption := 'Auftragsbestätigung drucken';
      MKey := 'MAIN\FREEREPORT\AUFTRAGSBESTAETIGUNG';
      DbDataset.DataSource  := RePosTabDS;
      RTitle := 'Auftragsbestätigung';
    end;
    *)
  end; //case
  Report1.Title := RTitle + ' Nr. ' + ReKopfTabVRENUM.Value; //Name des zu druckenden Dokuments
end;

//-----------------------------------------------------------
procedure TPrintRechForm.ShowJournalDlg (NewQuelle: Integer; Von, Bis: tDateTime; Z: String; KundenId: Integer);
var
  Res: Boolean;
  i: integer;
begin
  Quelle := NewQuelle;

  EMail  := '';
  Fax    := '';

  VDat := Von;
  BDat := Bis;

  frVariables.Clear;

  frVariables['Zeitraum'] := Z;
  frVariables['DatumVon'] := DateToStr(Von);
  frVariables['DatumBis'] := DateToStr(Bis);

  case NewQuelle of
    VK_RECH: begin
      Caption := 'Rechnungsjournal drucken';
      JName := 'Rechnungsjournal';
      DbDataset.DataSource  := ReJourDS;
      DbDetailDataset.DataSource  := ReJournalPosDS;
      ReJournalTab.Close;
      ReJournalPos.Close;
      ReJournalTab.ParamByName('Von').Value := Von;
      ReJournalTab.ParamByName('Bis').Value := Bis;
      ReJournalTab.ParamByName('AddrId').Value := 0; //KundenI;
      ReJournalPos.ParamByName('DatVon').Value := Von;
      ReJournalPos.ParamByName('DatBis').Value := Bis;

      ReJournalPos.Open;
      ReJournalTab.Open;
      MKey := 'MAIN\FREEREPORT\VK_RE_JOURNAL';
      CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Rechnungsjournal.frf';
    end;
    VK_KASSE: begin
      if pos('Tagesjournal', z) <> 0 then
      begin
        Caption := 'Tageskassenjournal drucken';
        JName := 'Kassenjournal';
        MKey := 'MAIN\FREEREPORT\VK_KAS_JOURNAL';
        DbDataset.DataSource  := KasTagDetailDS;
        DbDetailDataSet.DataSet := KasTagDetailPos;
        CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\KassenTagesJournal.frf';
      end else
      begin
        Caption := 'Kassenjournal drucken';
        JName := 'Kassenjournal';
        MKey := 'MAIN\FREEREPORT\VK_KAS_JOURNAL';
        DbDataset.DataSource  := KasTagSumDS;
        CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Kassenjournal.frf';
      end;
    end;
    VK_LIEF: begin
      Caption := 'Lieferscheinjournal drucken';
      JName := 'Lieferschein-Journal';
      DbDataset.DataSource  := JournalDS;
      MKey := 'MAIN\FREEREPORT\VK_LI_JOURNAL';
      CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Lieferscheinjournal.frf';
    end;
    VK_AGB: begin
      Caption := 'Angebotsjournal drucken';
      JName := 'Angebotsjournal';
      DbDataset.DataSource  := JournalDS;
      MKey := 'MAIN\FREEREPORT\VK_AGB_JOURNAL';
      CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Angebotsjournal.frf';
    end;
    EK_RECH: begin
      Caption := 'Einkaufsjournal drucken';
      DbDataset.DataSource  := JournalDS;
      JName := 'Einkaufsjournal';
      MKey := 'MAIN\FREEREPORT\EK_RE_JOURNAL';
      CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Einkaufsjournal.frf';
    end;
    EK_BEST: begin
      Caption := 'EK-Bestelljournal drucken';
      JName := 'EK-Bestelljournal';
      DbDataset.DataSource  := JournalDS;
      MKey := 'MAIN\FREEREPORT\EK_BE_JOURNAL';
      CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Bestellungsjournal.frf';
    end;
  end; //case Quelle

  if NewQuelle <> VK_KASSE then
  begin
    JournalTab.Close;
    JournalTab.Sql.Clear;
    JournalTab.SQL.Add ('select * from JOURNAL');
    JournalTab.SQL.Add ('where QUELLE=:QUELLE');

    // Bei VK-Rechnung keine Kasse anzeigen
    if NewQuelle = VK_RECH then
      JournalTab.SQL.Add ('and QUELLE_SUB <> 2');

    if NewQuelle = VK_LIEF then
      JournalTab.SQL.Add ('and LDATUM >=:VDAT and LDATUM <=:BDAT')
    else
      JournalTab.SQL.Add ('and RDATUM >=:VDAT and RDATUM <=:BDAT');

    if KundenId <> 0 then
      JournalTab.SQL.Add ('and ADDR_ID=' + intToStr(KundenID));

    if NewQuelle = VK_LIEF then
      JournalTab.SQL.Add ('ORDER BY LDATUM, VLSNUM')
    else
      JournalTab.SQL.Add ('ORDER BY RDATUM, VRENUM');

    JournalTab.ParamByName ('QUELLE').Value := NewQuelle;
    JournalTab.ParamByName ('VDAT').Value   := VDAT;
    JournalTab.ParamByName ('BDAT').Value   := BDAT;
    JournalTab.Open;

    SumQuery.Close;

    SumQuery.Sql.Clear;
    SumQuery.SQL.Add('select');
    SumQuery.SQL.Add('STADIUM, sum(NSUMME) as NETTO,');
    SumQuery.SQL.Add('sum(MSUMME) as MWST,');
    SumQuery.SQL.Add('sum(MSUMME_1) as MWST_1,');
    SumQuery.SQL.Add('sum(MSUMME_2) as MWST_2,');
    SumQuery.SQL.Add('sum(MSUMME_3) as MWST_3,');
    SumQuery.SQL.Add('sum(BSUMME) as BRUTTO,');
    SumQuery.SQL.Add('sum(IST_BETRAG) as BEZAHLT,');
    SumQuery.SQL.Add('WAEHRUNG');

    SumQuery.SQL.Add('from JOURNAL');
    SumQuery.SQL.Add('where QUELLE=:QUELLE');
    SumQuery.SQL.Add('and RDATUM >=:VDAT and RDATUM <=:BDAT');

    if NewQuelle = VK_RECH then // KAsse nicht mit hinzurechnen !!!
      SumQuery.SQL.Add('and QUELLE_SUB != 2');

    SumQuery.SQL.Add('group by WAEHRUNG, STADIUM');

    SumQuery.ParamByName ('QUELLE').Value := NewQuelle;
    SumQuery.ParamByName ('VDAT').Value   := VDAT;
    SumQuery.ParamByName ('BDAT').Value   := BDAT;
    SumQuery.Open;

    frVariables['Jour_offen']   := jour_Offen;
    frVariables['Jour_bezahlt'] := jour_bezahlt;
    frVariables['Jour_Netto']   := jour_netto;
    frVariables['Jour_Brutto']  := jour_brutto;
    frVariables['Jour_MwSt']    := jour_mwst;
    frVariables['Jour_MwSt1']   := jour_mwst1;
    frVariables['Jour_MwSt2']   := jour_mwst2;
    frVariables['Jour_MwSt3']   := jour_mwst3;

  end else
  begin
    //VK-Kasse
    if KasTagSumTab.Active then KasTagSumTab.Close;
    if KasTagDetailTab.Active then KasTagDetailTab.Close;
    if KasTagDetailPos.Active then KasTagDetailPos.Close;

    KasTagSumTab.ParamByName ('VDAT').Value   := VDAT;
    KasTagSumTab.ParamByName ('BDAT').Value   := BDAT;
    KasTagDetailTab.ParamByName ('VDAT').Value   := VDAT;
    KasTagDetailTab.ParamByName ('BDAT').Value   := BDAT;

    KasTagSumTab.Open;
    KasTagDetailTab.Open;
    KasTagDetailPos.Open;
  end;

  if Quelle <> NewQuelle + 100 then
  begin
    Quelle := NewQuelle + 100;

    ReportTab.Close;
    ReportTab.Open;

    //Res :=CBFormular.Locate (ReportTabVal_Char,'DEFAULT',True);
    if not Res then
    begin
      ReportTab.First;
      //FormularCB.DisplayValue :=ReportTabName.Value;
    end else
    begin
      //FormularCB.DisplayValue :=ReportTabName.Value;
    end;
  end;
  Report1.Title := JName; //Name des zu druckenden Dokuments

  DM1.FirmaTab.Open;

  repeat
  until ShowModal <> mrRetry;

  if DM1.FirmaTab.Active then
    DM1.FirmaTab.Close;
  if JournalTab.Active then
    JournalTab.Close;
  if KasTagSumTab.Active then
    KasTagSumTab.Close;
  if KasTagDetailTab.Active then
    KasTagDetailTab.Close;
end;

//--------------------------------------------------------------
procedure TPrintRechForm.ShowBelegDlg(BelegArt, BelegID: Integer; Preview: Boolean);
begin
  Quelle := BelegArt;
  frVariables.Clear;
  case BelegArt of
    VK_AGB,
    VK_AGB_EDI,
    VK_RECH_EDI,
    VK_RECH,
    VK_WKRE_EDI,
    EK_BEST,
    VK_Kasse,
    VK_AB:
    begin
      ReKopfTab.Close;
      RePosTab.Close;
      with ReKopfTab.SQL do // SQl Anweisung Rechnungs-Nr
      begin
        Clear;
        Add('select * from JOURNAL');
        Add('where REC_ID= ' + IntToStr(BelegID)); //QuotedStr(IntToStr(BelegID));
        //Add('and QUELLE= ' +IntToStr(BelegArt));//wieso keine Kassenbelege?+' and QUELLE_SUB<>2');
      end;
      with RePosTab.SQL do // SQL Anweisung Rechnungspositionen
      begin
        Clear;
        Add('select JournalPos.*, Warengruppen.ID as WGNr, Warengruppen.Hinweis, Warengruppen.Name as WGName, ROUND(MENGE * EPREIS - ((MENGE * EPREIS / 100) * RABATT),2) AS GPREIS1,    ROUND(EPREIS - ((EPREIS / 100) * RABATT), 2) AS ERPREIS');
        Add('from JOURNALPOS');
        Add('left join Artikel on journalpos.Artikel_id=Artikel.Rec_id ');
        Add('left join Warengruppen on artikel.Warengruppe=Warengruppen.ID ');
        Add('where JOURNAL_ID= ' + QuotedStr(IntToStr(BelegID)) + ' AND journalpos.ARTIKELTYP != "X"');
        Add('order by POSITION, REC_ID');
      end;
      RePosTab.open;
      ReKopfTab.open;
    end; //Rechnung

    VK_LIEF,
    VK_LIEF_EDI:
    begin
      {$IFDEF DHL_EXPORT}
      cbDHL.Visible := true;
      {$ENDIF}
      with LSKopfTab.SQL do //neue SQl Anweisung Rechnungs-Nr
      begin
        Clear;
        Add('select *, Adressen.Matchcode from JOURNAL');
        Add('left join Adressen on Journal.Addr_ID=Adressen.Rec_ID');
        Add('where JOURNAL.REC_ID = ' + QuotedStr(IntToStr(BelegID)));
      end;
      LsKopfTab.open;

      with LSPosTab.SQL do //neue SQl Anweisung Rechnungs-Nr
      begin
        Clear;
        Add('select *');
        {JOURNAL_ID, ARTIKELTYP, VIEW_POS, POSITION, MATCHCODE, ARTNUM, BARCODE, LAENGE, GROESSE, DIMENSION,');
        Add('GEWICHT, MENGE, ME_EINHEIT, VPE, EPREIS, RABATT, BEZEICHNUNG, REC_ID, ARTIKEL_ID, SN_FLAG');
        // Add(',MENGE*EPREIS AS POSSUMME');
        }
        Add('from JOURNALPOS');
        Add('where JOURNAL_ID = ' + QuotedStr(IntToStr(BelegID)));
        Add(' and ArtikelTyp <> ''X'' ');
        Add(' order by POSITION');
      end;
      LsPosTab.open;
    end; //Lieferschein
  end; //case

  Report_Daten_zuweisen(BelegArt, BelegID);
  //Reportdatei voreinstellen
  case BelegArt of
    VK_AGB,
    VK_AGB_EDI:
      CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Angebot.frf';
    VK_RECH_EDI,
    VK_RECH, VK_KASSE:
    begin
      if ReKopfTabVerband.Value <> 0 then
        CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\RechnungVerband.frf'
      else
        CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Rechnung.frf';
    end;
    VK_LIEF:
      CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Lieferschein.frf';
    //VK_AB:
    //  CBFormular.Filename:=ExtractFilePath(Application.ExeName)+'Formulare\Auftragsbestaetigung.frf';
    VK_WKRE_EDI:
      CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Rechnung.frf';
    EK_BEST:
      CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\Bestellung.frf';
  end; //case

  if not Preview then
    PrintBtnClick(self)
  else
  begin
    repeat
    until ShowModal <> mrRetry;
  end;

  if DM1.FirmaTab.Active then
    DM1.FirmaTab.Close;
  if ReSNTab.Active then
    ReSNTab.Close;
  if RePosTab.Active then
    RePosTab.Close;
  if REKopfTab.Active then
    ReKopfTab.Close;
  if LsKopfTab.Active then
    LsKopfTab.Close;
  if LSPosTab.Active then
    LsPosTab.Close;
  if BonTab.Active then
    BonTab.Close;
  if BonPosTab.Active then
    BonPosTab.Close;
  if ArtTab.Active then
    ArtTab.Close;
  if tblAdressen.Active then  //???
    tblAdressen.Close;
end;

//-----------------------------------------------------------------
procedure TPrintRechForm.LayoutBtnClick(Sender: TObject);
begin
  if cbReport.ItemIndex >= 0 then
  begin
    if ReportTab.Locate('NAME', cbReport.ItemValue, []) then
    begin
      Report1.Pages.Clear;
      if not ReportTabVAL_BIN.IsNull then //nur laden wenn nicht leer...
        LoadFromBlobField(ReportTabVAL_BIN);
      Report1.Title := ReportTabNAME.AsString;
      Report1.FileName := ReportTabNAME.AsString;
      //Report1.PrepareReport;
      Report1.DesignReport;
    end else
    begin
      // Report nicht gefunden...
    end;
  end;
end;

//-----------------------------------------------------------------
procedure TPrintRechForm.VorschauBtnClick(Sender: TObject);
begin
  {
  if ReportTabName.Value > '' then
  begin
  }
  //     RepTab.Open;
  //     Report1.LoadFromDB(RepTab,1);
  //     Report1.LoadFromFile('Formulare\test.frf');
  //     RepTab.Close;
  //   end;

  if cbReport.ItemIndex >= 0 then
  begin
    if ReportTab.Locate('NAME', cbReport.ItemValue, []) then
    begin
      Report1.Pages.Clear;
      if not ReportTabVAL_BIN.IsNull then //nur laden wenn nicht leer...
      begin
        LoadFromBlobField(ReportTabVAL_BIN);
        Report1.Title := ReportTabNAME.AsString;
        Report1.FileName := ReportTabNAME.AsString;
        Report1.PrepareReport;
        Report1.ShowReport;
      end else
      begin
        // kein Report vorhanden...
      end;
    end else
    begin
      // Report nicht gefunden...
    end;
  end;
end;

//-------------------------------------------------------------
function GetDefaultPrinter: string;
var
  ResStr: array [0..255] of char;
begin
  GetProfileString('Windows', 'device', '', ResStr, 255);
  Result := StrPas(ResStr);
end;

//----------------------------------------------------------
procedure TPrintRechForm.CloseBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowBriefDlg (TextID: Integer; Vorschau: Boolean);
var
  Res: Boolean;
  i: integer;
begin
  EMail  := '';
  Fax    := '';

  frVariables.Clear;
  DbDataset.DataSource := TextDS;

  MKey := 'MAIN\REPORT\SCHRIFTVERKEHR';
  try
    Caption := 'Brief drucken';

    TextTab.Close;
    TextTab.ParamByName ('ID').AsInteger := TextID;
    TextTab.Open;

    EMail := TextTabEMail.AsString;
    Fax   := TextTabFax.AsString;


    DM1.FirmaTab.Open;

    if Quelle <> TEXTVERARB then
    begin
      Quelle := TEXTVERARB;
    end;
    if Vorschau then
      VorschauBtnClick(Self)
    else
    begin
      repeat
      until ShowModal <> mrRetry;
    end;

  finally
    TextTab.Close;
    DM1.FirmaTab.Close;
  end;
end;

//--------------------------------------------------------
procedure TPrintRechForm.PrintBtnClick(Sender: TObject);
Var
  RepPrint: Boolean;
{$IFDEF PRO}
var Reg     : tRegistry;
  //FaxMaker : variant;
  //FaxError : Boolean;
  //OldPort  : String;
 {$ENDIF}
begin
  LoadReport;
  PrintAbort := False;
  Printer.PrinterIndex := ZielCB.ItemIndex; //welcher Drucker
  RepPrint := Report1.PrepareReport;
  Report1.PrintPreparedReport(Edit1.Text, KopienSpin.AsInteger{, true, frAll});  //25.10.09-ud.
  PrintAbort := Report1.Terminated; //Mitteilung von FreeReport über Druckstatus
  if not PrintAbort then
  begin
    if Quelle in [VK_RECH, VK_AGB, EK_BEST] then
    begin
      ReKopfTab.DisableControls;
      try
        ReKopfTab.First;
        while not ReKopfTab.Eof do
        begin
          //Beleg als gedruckt markieren
          if (ReKopfTabPrint_Flag.AsBoolean = False) then
          begin
            DM1.Uniquery.Close;
            DM1.Uniquery.SQL.Text := 'UPDATE JOURNAL SET PRINT_FLAG="Y" ' +
              'WHERE REC_ID=' + IntToStr(ReKopfTabRec_ID.AsInteger);
            DM1.Uniquery.ExecSQL;
          end;

          ReKopfTab.Next;
        end;
      finally
        ReKopfTab.EnableControls;
      end;

    end else
    //if quelle in [VK_RECH, VK_AGB, EK_BEST] then
    if Quelle = VK_LIEF then
    begin
      LsKopfTab.DisableControls;
      try
        LsKopfTab.First;
        while not LsKopfTab.Eof do
        begin
          //Beleg als gedruckt markieren
          if (LsKopfTabPrint_Flag.AsBoolean = False) then
          begin
            DM1.Uniquery.Close;
            DM1.Uniquery.SQL.Text := 'UPDATE JOURNAL SET PRINT_FLAG="Y" ' +
              'WHERE REC_ID=' + IntToStr(LsKopfTabRec_ID.AsInteger);
            DM1.Uniquery.ExecSQL;
          end;
          lsKopfTab.Next;
        end;
      finally
        LsKopfTab.EnableControls;
      end;
      {$IFDEF DHL_EXPORT}
      if cbDHL.Checked = true then
        DHLExport;
        {$ENDIF}
    end; //if Quelle = VK_LIEF then
  end; //if not PrintAbort then
end;

//----------------------------------------------------------------------------
procedure TPrintRechForm.DruEinrBtnClick(Sender: TObject);
begin
  MainForm.PrinterSetupDialog1.Execute;
  ZielCB.ItemIndex := Printer.PrinterIndex;

  //////////////////////////////////////////////////////////////
  //auf veränderung nach einrichtdialog reagieren
  /////////////////////////////////////////////////
  //Neue Schächte einlesen

  //BinNamCB.Items.Assign(Printer.PaperSources);
  //BinNamCB.ItemIndex := Printer.PaperSourceIndex;
end;

//----------------------------------------------------------------------------
procedure TPrintRechForm.LsKopfTabCalcFields(DataSet: TDataSet);
begin
  DM1.KunTab.Close;
  DM1.KunTab.ParamByName ('ID').AsInteger := LsKopfTabAddr_ID.Value;
  DM1.KunTab.Open;
  if DM1.KunTab.RecordCount = 1 then
  begin
    LsKopfTabCALC_EMAIL.AsString := DM1.KunTabEMail.AsString;
    EMail := DM1.KunTabEMail.AsString;
    Fax   := DM1.KunTabFAX.AsString;
  end else
  begin
    LsKopfTabCALC_EMAIL.AsString := '';
    EMail := '';
    Fax   := '';
  end;
  if (LsKopfTabKUN_LAND.AsString  <> '') and
     (DM1.LandTab.Locate ('ID', LsKopfTabKUN_LAND.AsString, [])) then
  begin
    lsKopfTabCALC_LANDLANG.AsString := DM1.LandTab.FieldByName ('NAME').AsString;
  end;
  //leeres LieferDatum
  if ReKopfTabTermin.AsString = '' then
    ReKopfTabCalc_LDATUM.Value := 'unbestimmt'
  else
    ReKopfTabCalc_LDATUM.Value := ReKopfTabLDATUM.AsString;

  //Lieferanschrift setzen
  if LsKopfTabLIEF_ADDR_ID.Value <> -1 then
  begin
    with dm1.UniQuery do begin
      Close;
      Sql.Text := 'Select * from adressen_lief where Rec_ID=' + LsKopfTabLIEF_ADDR_ID.AsString;
      Open;
      LsKopfTabCALC_LiefAnrede.Value := FieldByName ('ANREDE').AsString;
      LsKopfTabCALC_LiefName1.Value := FieldByName ('NAME1').AsString;
      LsKopfTabCALC_LiefName2.Value := FieldByName ('NAME2').AsString;
      LsKopfTabCALC_LiefName3.Value := FieldByName ('NAME3').AsString;
      LsKopfTabCALC_LiefCO.Value := FieldByName ('ABTEILUNG').AsString;
      LsKopfTabCALC_LiefStrasse.Value := FieldByName ('STRASSE').AsString;
      LsKopfTabCALC_LiefPLZ.Value := FieldByName ('PLZ').AsString;
      LsKopfTabCALC_LiefOrt.Value := FieldByName ('ORT').AsString;
      LsKopfTabCALC_LiefLand.Value := FieldByName ('LAND').AsString;
    end;
  end else
  begin
    LsKopfTabCALC_LiefAnrede.Value := LsKopfTabKUN_ANREDE.Value;
    LsKopfTabCALC_LiefName1.Value := LsKopfTabKUN_NAME1.Value;
    LsKopfTabCALC_LiefName2.Value := LsKopfTabKUN_NAME2.Value;
    LsKopfTabCALC_LiefName3.Value := LsKopfTabKUN_NAME3.Value;
    LsKopfTabCALC_LiefCO.Value := LsKopfTabKUN_ABTEILUNG.Value;
    LsKopfTabCALC_LiefStrasse.Value := LsKopfTabKUN_STRASSE.Value;
    LsKopfTabCALC_LiefPLZ.Value := LsKopfTabKUN_PLZ.Value;
    LsKopfTabCALC_LiefOrt.Value := LsKopfTabKUN_ORT.Value;
    LsKopfTabCALC_LiefLand.Value := LsKopfTabKUN_LAND.Value;
  end;
end;

//----------------------------------------------------------------------------
procedure TPrintRechForm.LsKopfTabAfterScroll(DataSet: TDataSet);
begin
  {     LsPosTab.Close;
  LsPosTab.ParamByName ('REC_ID').Value :=LsKopfTabRec_ID.AsInteger;
  LsPosTab.Open;

  tblAdressen.Locate ('J_REC_ID',LsKopfTabAddr_ID.AsInteger,[]);

  ArtTab.Close;
  ArtTab.ParamByName ('JOURNAL_ID').AsInteger :=LsKopfTabRec_ID.AsInteger;
  ArtTab.Open;  }
end;

procedure TPrintRechForm.ReKopfTabCalcFields(DataSet: TDataSet);
var
  S, Text: String;
  I: Integer;
  SK_Betrag: Double;
begin
  if (ReKopfTabSOLL_STAGE.Value > 0) and (ReKopfTabSOLL_SKONTO.Value > 0) then
  begin
    ReKopfTabSOLL_ZAHLUNGSZIEL.Value :=
      Inttostr(ReKopfTabSOLL_STAGE.Value) + ' Tage ' +
      FormatFloat ('0.0"%"', ReKopfTabSOLL_SKONTO.Value) + ' Skonto, ' +
      Inttostr(ReKopfTabSOLL_NTAGE.Value) + ' Tage ohne Abzug';
  end else
  if (ReKopfTabSOLL_NTAGE.Value > 1) then
  begin
    ReKopfTabSOLL_ZAHLUNGSZIEL.Value :=
      Inttostr(ReKopfTabSOLL_NTAGE.Value) + ' Tage ohne Abzug';
  end else
  begin
    //ReKopfTabSOLL_ZAHLUNGSZIEL.Value :='Sofort';
    ReKopfTabSOLL_ZAHLUNGSZIEL.Value :=
      DM1.ReadString ('MAIN\REPORT', 'ZAHLUNGSZIEL_SOFORT_TEXT', 'Sofort');
  end;
  //leeres LieferDatum
  if ReKopfTabTermin.AsString = '' then
    ReKopfTabCalc_LDATUM.Value := 'unbestimmt'
  else
    ReKopfTabCalc_LDATUM.Value := ReKopfTabLDATUM.AsString;

  // Lieferanschrift für Bestellungen
  if (ReKopfTabQuelle.Value = EK_BEST) and (ReKopfTabLief_Addr_ID.Value >= 0) then
  begin
    DM1.KunTab.Close;
    DM1.KunTab.ParamByName ('ID').AsInteger := ReKopfTabLief_Addr_ID.Value;
    DM1.KunTab.Open;

    if (DM1.KunTab.RecordCount = 1) and
       (DM1.KunTabDEFAULT_LIEFANSCHRIFT_ID.Value > 0) then
    begin
      // Lieferanschrift aus Kundendaten übernehmen
      with DM1.UniQuery do
      begin
        SQL.Text := 'select * from ADRESSEN_LIEF where REC_ID=' +
          IntToStr(DM1.KunTabDEFAULT_LIEFANSCHRIFT_ID.AsInteger);
        Open;
        if RecordCount > 0 then
        begin
          ReKopfTabCALC_LIEF_ANREDE.AsString  := FieldByName ('ANREDE').AsString;
          ReKopfTabCALC_LIEF_NAME1.AsString   := FieldByName ('NAME1').AsString;
          ReKopfTabCALC_LIEF_NAME2.AsString   := FieldByName ('NAME2').AsString;
          ReKopfTabCALC_LIEF_NAME3.AsString   := FieldByName ('NAME3').AsString;
          ReKopfTabCALC_LIEF_CO.AsString      := FieldByName ('ABTEILUNG').AsString;
          ReKopfTabCALC_LIEF_STRASSE.AsString := FieldByName ('STRASSE').AsString;
          ReKopfTabCALC_LIEF_LAND.AsString    := FieldByName ('LAND').AsString;
          ReKopfTabCALC_LIEF_PLZ.AsString     := FieldByName ('PLZ').AsString;
          ReKopfTabCALC_LIEF_ORT.AsString     := FieldByName ('ORT').AsString;
        end;
        Close;
      end;
    end else
    if (DM1.KunTab.RecordCount = 1) then
    begin
      // Rechnungsanschrift des Kunden übernehmen
      ReKopfTabCALC_LIEF_ANREDE.AsString  := DM1.KunTabAnrede.Value;
      ReKopfTabCALC_LIEF_NAME1.AsString   := DM1.KunTabName1.Value;
      ReKopfTabCALC_LIEF_NAME2.AsString   := DM1.KunTabName2.Value;
      ReKopfTabCALC_LIEF_NAME3.AsString   := DM1.KunTabName3.Value;
      //ReKopfTabCALC_LIEF_CO.AsString      :=DM1.KunTabAbteilung.Value;  //25.10.09-ud.
      ReKopfTabCALC_LIEF_STRASSE.AsString := DM1.KunTabStrasse.Value;
      ReKopfTabCALC_LIEF_LAND.AsString    := DM1.KunTabLand.Value;
      ReKopfTabCALC_LIEF_PLZ.AsString     := DM1.KunTabPLZ.Value;
      ReKopfTabCALC_LIEF_ORT.AsString     := DM1.KunTabOrt.Value;
    end;

    // EMail-Adresse etc.
    DM1.KunTab.Close;
    DM1.KunTab.ParamByName ('ID').AsInteger := ReKopfTabAddr_ID.Value;
    DM1.KunTab.Open;

    if (DM1.KunTab.RecordCount = 1) then
    begin
      ReKopfTabCALC_EMAIL.AsString := DM1.KunTabEMail.AsString;
      ReKopfTabCALC_UST_ID.AsString := DM1.KunTabUST_NUM.AsString;
      ReKopfTabCALC_BRIEFANREDE.AsString := DM1.KunTabBriefanrede.AsString;

      EMail := DM1.KunTabEMail.AsString;
      Fax   := DM1.KunTabFax.AsString;
    end;
  end else
  begin
    DM1.KunTab.Close;
    DM1.KunTab.ParamByName ('ID').AsInteger := ReKopfTabAddr_ID.Value;
    DM1.KunTab.Open;

    if (DM1.KunTab.RecordCount = 1){and(DM1.KunTabHAT_LIEFANSR.Value = 1)} then
    begin
      // Lieferanschrift aus Kundendaten übernehmen
      with DM1.UniQuery do
      begin
        SQL.Text := 'select * from ADRESSEN_LIEF where REC_ID=' +
          IntToStr(ReKopfTabLIEF_ADDR_ID.AsInteger);
        Open;
        if RecordCount>0 then
        begin
          ReKopfTabCALC_LIEF_ANREDE.AsString  := FieldByName ('ANREDE').AsString;
          ReKopfTabCALC_LIEF_NAME1.AsString   := FieldByName ('NAME1').AsString;
          ReKopfTabCALC_LIEF_NAME2.AsString   := FieldByName ('NAME2').AsString;
          ReKopfTabCALC_LIEF_NAME3.AsString   := FieldByName ('NAME3').AsString;
          ReKopfTabCALC_LIEF_CO.AsString      := FieldByName ('ABTEILUNG').AsString;
          ReKopfTabCALC_LIEF_STRASSE.AsString := FieldByName ('STRASSE').AsString;
          ReKopfTabCALC_LIEF_LAND.AsString    := FieldByName ('LAND').AsString;
          ReKopfTabCALC_LIEF_PLZ.AsString     := FieldByName ('PLZ').AsString;
          ReKopfTabCALC_LIEF_ORT.AsString     := FieldByName ('ORT').AsString;
        end;
      end;
      ReKopfTabCALC_EMAIL.AsString := DM1.KunTabEMail.AsString;
      ReKopfTabCALC_UST_ID.AsString := DM1.KunTabUST_NUM.AsString;
      ReKopfTabCALC_BRIEFANREDE.AsString := DM1.KunTabBriefanrede.AsString;

      EMail := DM1.KunTabEMail.AsString;
      Fax   := DM1.KunTabFax.AsString;
    end;
  end;

  // Fahrzeugdaten
  if ReKopfTabKFZ_ID.AsInteger > -1 then
  begin
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Clear;
    DM1.UniQuery.SQL.Add ('select * from KFZ where KFZ_ID=' + ReKopfTabKFZ_ID.AsString);
    DM1.UniQuery.Open;
    if DM1.UniQuery.RecordCount = 1 then
    begin
      ReKopfTabCALC_POLKZ.AsString  := DM1.UniQuery.FieldByName ('POL_KENNZ').AsString;
      ReKopfTabCALC_FGSTNR.AsString := DM1.UniQuery.FieldByName ('FGST_NUM').AsString;
    end;
    DM1.UniQuery.Close;
  end;

  if not DM1.ZahlartTab.Active then
    DM1.ZahlartTab.Open;

  if (DM1.ZahlartTab.Locate ('ZAHL_ID', ReKopfTabZahlart.AsInteger, [])) and
     (DM1.ZahlartTabZahl_ID.AsInteger = ReKopfTabZahlart.AsInteger) then
  begin
    Text := DM1.ZahlartTabTEXT.AsString;

    // Kontonummer, BLZ und Bank aus Kundenstammdaten holen und ggf. einsetzen
    if (Pos('%BLZ%', Text) > 0) or (Pos('%KTONR%', Text) > 0) or (Pos('%BANK%' , Text) > 0) then
    begin
      dm1.uniquery.close;
      dm1.uniquery.sql.text := 'select * from ADRESSEN where REC_ID=' +
      IntToStr(ReKopfTabAddr_ID.AsInteger);
      dm1.uniquery.open;
      if dm1.uniquery.recordcount = 1 then
      begin
        S := dm1.uniquery.fieldbyname ('KTO').AsString;
        I := Pos('%KTONR%', Text);
        if i > 0 then
        begin
          delete (Text, i, length('%KTONR%'));
          Insert (S, Text, I);
        end;

        S := dm1.uniquery.fieldbyname ('BLZ').AsString;
        I := Pos('%BLZ%', Text);
        if i > 0 then
        begin
          delete (Text, i, length('%BLZ%'));
          Insert (S, Text, I);
        end;

        S := dm1.uniquery.fieldbyname ('BANK').AsString;
        I := Pos('%BANK%', Text);
        if i > 0 then
        begin
          delete (Text, i, length('%BANK%'));
          Insert (S, Text, I);
        end;
      end;
      dm1.uniquery.close;
    end;

    ReKopfTabZAHLART_LANG.AsString := Text;
  end;

  if (ReKopfTabKUN_LAND.AsString <> '') and
     (DM1.LandTab.Locate ('ID', ReKopfTabKUN_LAND.AsString, [])) then
  begin
    ReKopfTabCALC_LANDLANG.AsString := DM1.LandTab.FieldByName ('NAME').AsString;
  end;

  ReKopfTabSoll_NDatum.AsDateTime := ReKopfTabRDatum.AsDateTime + ReKopfTabSoll_NTage.AsInteger;
  ReKopfTabSoll_SDatum.AsDateTime := ReKopfTabRDatum.AsDateTime + ReKopfTabSoll_STage.AsInteger;


  SK_Betrag := 0;
  ReKopfTabCALC_BSUM_SKONTO.AsFloat := ReKopfTabBSUMME.AsFloat;
  if (ReKopfTabSoll_Skonto.Value > 0) and (ReKopfTabBSUMME.AsFloat <> 0) then
  begin
    SK_Betrag := cao_round (ReKopfTabBSUMME.AsFloat * ReKopfTabSoll_Skonto.AsFloat) / 100;
    ReKopfTabCALC_BSUM_SKONTO.AsFloat := ReKopfTabBSUMME.AsFloat - SK_Betrag;
  end;
  ReKopfTabCALC_SKONTOBETRAG.AsFloat := SK_Betrag;

  //Verbandsdaten
  with DM1.UniQuery do
  begin
    SQL.Text := 'select * from ADRESSEN where REC_ID=' +
    IntToStr(ReKopfTabVERBAND.AsInteger);
    Open;
    if RecordCount>0 then
    begin
      ReKopfTabCALC_VERBAND_ANREDE.AsString  := FieldByName ('ANREDE').AsString;
      ReKopfTabCALC_VERBAND_NAME1.AsString   := FieldByName ('NAME1').AsString;
      ReKopfTabCALC_VERBAND_NAME2.AsString   := FieldByName ('NAME2').AsString;
      ReKopfTabCALC_VERBAND_NAME3.AsString   := FieldByName ('NAME3').AsString;
      ReKopfTabCALC_VERBAND_STRASSE.AsString := FieldByName ('STRASSE').AsString;
      ReKopfTabCALC_VERBAND_LAND.AsString    := FieldByName ('LAND').AsString;
      ReKopfTabCALC_VERBAND_PLZ.AsString     := FieldByName ('PLZ').AsString;
      ReKopfTabCALC_VERBAND_ORT.AsString     := FieldByName ('ORT').AsString;
    end;
  end;

  //Anzahlung und Restzahlung
  if ReKopfTabIST_ANZAHLUNG.Value <> 0 then
  begin
    ReKopfTabCALC_ANZAHLUNG_LBL.Value := 'Anzahlung:';
    ReKopfTabCALC_ANZAHLUNG_VALUE.Value := format('%1.2f', [ReKopfTabIST_ANZAHLUNG.Value]) + ' ' + ReKopfTabWAEHRUNG.Value;
    ReKopfTabCALC_RESTZAHLUNG_LBL.Value := 'Restzahlung:';
    ReKopfTabCALC_RESTZAHLUNG_VALUE.Value := format('%1.2f', [ReKopfTabBSUMME.Value - ReKopfTabIST_ANZAHLUNG.Value]) + ' ' + ReKopfTabWAEHRUNG.Value;
  end else
  begin
    ReKopfTabCALC_ANZAHLUNG_LBL.Value := '';
    ReKopfTabCALC_ANZAHLUNG_VALUE.Value := '';
    ReKopfTabCALC_RESTZAHLUNG_LBL.Value := '';
    ReKopfTabCALC_RESTZAHLUNG_VALUE.Value := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ReKopfTabAfterScroll(DataSet: TDataSet);
begin
  if ReKopfTab.ControlsDisabled then exit;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.JournalTabCalcFields(DataSet: TDataSet);
var
  S: String;
begin
  {
  if Quelle=VK_LIEF+100
  then JournalTabStatus.Value :=GetLiefStatus(JournalTabStadium.AsInteger,True)
  else
  if Quelle=EK_BEST+100
  then JournalTabStatus.Value :=GetEKBestStatus(JournalTabStadium.AsInteger)
  else
  if Quelle=VK_RECH+100
  then JournalTabStatus.Value :=GetRechStatus(JournalTabStadium.AsInteger,VK_RECH)
  else JournalTabStatus.Value :=GetRechStatus(JournalTabStadium.AsInteger,EK_RECH);

  if (JournalTabSOLL_SKONTO.Value>0)and(JournalTabSOLL_STAGE.Value>0)
  then S :=JournalTabSOLL_STAGE.AsString+' T. '+
  formatfloat ('0.0"%"',JournalTabSOLL_SKONTO.Value)+' '+
  JournalTabSOLL_NTAGE.AsString+' T.Netto'
  else if JournalTabSOLL_NTAGE.Value < 2
  then S :='sofort'
  else S :=JournalTabSOLL_NTAGE.AsString+' Tage Netto';

  if Quelle in [VK_RECH+100, VK_AGB+100, EK_RECH+100]
  then JournalTabKonditionen.Value :=S;

  DM1.KunTab.Close;
  DM1.KunTab.ParamByName ('ID').AsInteger :=JournalTabAddr_ID.Value;
  DM1.KunTab.Open;

  if (DM1.KunTab.RecordCount=1) then
  begin
  // aus Kundendaten übernehmen
  JournalTabCALC_USTID.AsString :=DM1.KunTabUST_NUM.AsString;
  end;
  DM1.KunTab.Close;
  }
end;

//----------------------------------------------------------------------------
procedure TPrintRechForm.RePosTabCalcFields(DataSet: TDataSet);
begin
  case RePosTabSTEUER_CODE.Value of
    0: RePosTabMwstProz.Value := ReKopfTabMwst_0.Value;
    1: RePosTabMwstProz.Value := ReKopfTabMwst_1.Value;
    2: RePosTabMwstProz.Value := ReKopfTabMwst_2.Value;
    3: RePosTabMwstProz.Value := ReKopfTabMwst_3.Value;
  end;
  RePosTabCALC_BPREIS.AsFloat := CAO_round_nk(RePosTabGPreis.AsFloat * (100 + RePosTabMwstProz.Value) / 100, 2); // Auf ganze Pfennige Runden
  if RePosTabARTIKELTYP.Value = 'T' then begin
    RePosTabCALC_MENGE.AsString := '';
    RePosTabCALC_EPREIS.AsString := '';
    RePosTabCALC_GPREIS.AsString := '';
  end else
  begin
    RePosTabCALC_MENGE.AsString := RePosTabMenge.AsString + ' ' + RePosTabME_EINHEIT.Value;
    RePosTabCALC_EPREIS.AsString := format('%1.2f', [RePosTabEPreis.Value]) + ' ' + ReKopfTabWAEHRUNG.Value;
    RePosTabCALC_GPREIS.AsString := format('%1.2f', [RePosTabGPreis.Value]) + ' ' + ReKopfTabWAEHRUNG.Value;
  end;
end;

//----------------------------------------------------------------------------
procedure TPrintRechForm.KasBuchCalcFields(DataSet: TDataSet);
begin
  Case KasBuchQuelle.Value of
    0: frVariables['KasBuchQuelle'] := 'Anfangsbestand';
    3: frVariables['KasBuchQuelle'] := 'Verkauf';
    13: frVariables['KasBuchQuelle'] := 'VK-Kasse';
    5: frVariables['KasBuchQuelle'] := 'Einkauf';
    99: frVariables['KasBuchQuelle'] := 'man. Buchung';
    else frVariables['KasBuchQuelle']  := '???';
  end;
end;

//------------------------------------------------------------------------
procedure TPrintRechForm.MahnPrintTabCalcFields(DataSet: TDataSet);
var
  D: Integer;
begin
  if (MahnPrintTabmahnstufe.AsInteger > 0) and
     (MahnPrintTabmahnstufe.AsInteger < 6) then
  begin
    D := Round(Int(MahnPrintTabMAHNDATUM.AsDateTime));
    D := D + DM1.MahnFrist[MahnPrintTabmahnstufe.AsInteger];
    MahnPrintTabfrist.AsDateTime := D;
  end;
end;

//-----------------------------------------------------------------
procedure TPrintRechForm.BonTabCalcFields(DataSet: TDataSet);
begin
  if not DM1.ZahlartTab.Active then
    DM1.ZahlartTab.Open;

  if (DM1.ZahlartTab.Locate ('ZAHL_ID', ReKopfTabZahlart.AsInteger, [])) and
     (DM1.ZahlartTabZahl_ID.AsInteger = ReKopfTabZahlart.AsInteger) then
  begin
    BonTabZAHLART_KURZ.AsString := DM1.ZahlartTabTEXT.AsString;
  end;
end;

//---------------------------------------------------------------------
procedure TPrintRechForm.BonPosTabCalcFields(DataSet: TDataSet);
begin
  case BonPosTabSTEUER_CODE.Value of
    0: BonPosTabMwstProz.Value := BonTabMwst_0.Value;
    1: BonPosTabMwstProz.Value := BonTabMwst_1.Value;
    2: BonPosTabMwstProz.Value := BonTabMwst_2.Value;
    3: BonPosTabMwstProz.Value := BonTabMwst_3.Value;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.SumQueryAfterOpen(DataSet: TDataSet);
begin
  jour_netto   := 0;
  jour_brutto  := 0;
  jour_mwst    := 0;
  jour_mwst1   := 0;
  jour_mwst2   := 0;
  jour_mwst3   := 0;
  jour_bezahlt := 0;
  jour_offen   := 0;


  while not SumQuery.Eof do
  begin
    jour_netto   := jour_netto   +
    dm1.CalcLeitWaehrung (SumQueryNetto.Value,
    SumQueryWaehrung.Value);
    jour_brutto  := jour_brutto  +
    dm1.CalcLeitWaehrung (SumQueryBrutto.Value,
    SumQueryWaehrung.Value);
    jour_mwst    := jour_mwst    +
    dm1.CalcLeitWaehrung (SumQueryMwst.Value,
    SumQueryWaehrung.Value);
    jour_mwst1   := jour_mwst1   +
    dm1.CalcLeitWaehrung (SumQueryMWST_1.Value,
    SumQueryWaehrung.Value);
    jour_mwst2   := jour_mwst2   +
    dm1.CalcLeitWaehrung (SumQueryMWST_2.Value,
    SumQueryWaehrung.Value);
    jour_mwst3   := jour_mwst3   +
    dm1.CalcLeitWaehrung (SumQueryMWST_3.Value,
    SumQueryWaehrung.Value);

    if SumQuerySTADIUM.AsInteger in [80..99] then
    begin
      jour_bezahlt := jour_bezahlt +
      dm1.CalcLeitWaehrung (SumQueryBezahlt.Value,
      SumQueryWaehrung.Value);
    end else
    begin
      jour_Offen := jour_Offen +
      dm1.CalcLeitWaehrung (SumQueryBrutto.Value,
      SumQueryWaehrung.Value);
    end;
    SumQuery.Next;
  end;
  SumQuery.Close;
  jour_Offen := jour_Brutto - jour_Bezahlt;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.SendEMailBtnClick(Sender: TObject);
begin
  if ReKopfTab.Active then
    Clipboard.AsText := ReKopfTabCalc_Email.AsString;
  MakePDF (True);
  ModalResult := mrRetry;
end;

//------------------------------------------------------------------------------
function TPrintRechForm.DB_Spalte_ermitteln: Integer;
Var
  a: Integer;
begin
  (* //25.10.09-ud.
  if not RepTab.Active then RepTab.Open;
  for a := 0 to RepTab.FieldCount - 1 do
    if RepTab.Fields[a].FieldName = 'VAL_BLOB' then break;
  Result := a;
  *)
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowAdresseDlg(Adressen_Id: integer; preview: Boolean);
begin
  try
    ReportTab.Close;
    MainKey := 'MAIN\FREEREPORT\ADRESSEN';
    ReportTab.Open;
    cbReport.Items.Clear;
    cbReport.Values.Clear;
    ReportTab.First;
    while not ReportTab.Eof do
    begin
      cbReport.Items.Add(ReportTab.FieldByName('NAME').AsString);
      cbReport.Values.Add(ReportTab.FieldByName('NAME').AsString);
      ReportTab.Next;
    end;
    cbReport.ItemIndex := 0;


    tblAdressen.Close;
    tblAdressen.ParamByName('ADDR_ID').AsInteger := Adressen_Id;
    tblAdressen.Open;
    

    tblAnsprechpartner.Close;
    //tblAnsprechpartner.Name := 'Ansprechpartner';
    tblAnsprechpartner.Connection := DM1.DB1;
    tblAnsprechpartner.SQL.Text :=
      'select * from ADRESSEN_ASP '+
      'where ADDR_ID= :ID ';
    tblAnsprechpartner.ParamByName('ID').AsInteger := Adressen_Id;
    tblAnsprechpartner.Open;


    Report1.DatasetStrList.Clear;
    Report1.DatasetStrList.Add(tblAdressen.Name);
    Report1.DatasetStrList.Add(tblAnsprechpartner.Name);

    //Report1.LoadFromFile('Formulare\KundenInfoBlatt.frf');
(*

  if ReportTabName.Value > '' then
  begin
    Report1.LoadFromBlobField(ReportTab.FieldByName('VAL_BLOB'));
    Report1.FileName := ReportTabName.Value;
    Report1.DesignReport;
  end;



*)

    if preview then
      VorschauBtnClick(Self)
    else
    begin
      repeat
      until ShowModal <> mrRetry;
    end;
  finally
    tblAdressen.Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowAdressenListeDlg(SQL: String; preview: Boolean);
var
  prevSQL: String;
begin
  try
    tblAdressen.Close;
    prevSQL := tblAdressen.Sql.Text;
    tblAdressen.SQL.Text := SQL;
    tblAdressen.Open;
    DBDataSet.DataSet := tblAdressen;
    CBFormular.Filename := ExtractFilePath(Application.ExeName) + 'Formulare\AdressenListe.frf';
    Report1.LoadFromFile(CBFormular.Filename);
    if preview then
      VorschauBtnClick(self)
    else
    begin
      repeat
      until ShowModal <> mrRetry;
    end;
  finally
    tblAdressen.Close;
    tblAdressen.SQL.Text := prevSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.MakePDF (SendEmail: Boolean);
var
  Title, UserTitel, T, FileName, Key: String;
  Count: Integer;
  MyEMail: TEMail;
  Res, a    : Integer;
  AddrID : Integer;

  procedure ReplacePlaceHolder(DS: tDataset; var Txt: String);
  var
    I, J, L: Integer;
  begin
    if (not assigned(DS)) or (not DS.Active) or (DS.RecordCount = 0) then
      exit;

    if DS.Fields.Count>0 then
    begin
      for i := 0 to DS.Fields.Count - 1 do
      begin
        if Pos('%' + Uppercase(DS.Fields[i].FieldName) + '%', Txt) > 0 then
        begin
          J := Pos('%' + Uppercase(DS.Fields[i].FieldName + '%'), Txt);
          L := Length (DS.Fields[i].FieldName) + 2;
          delete (Txt, J, L);
          Insert (DS.Fields[i].AsString, Txt, J);
        end;
      end;
    end;
  end;

begin
  case quelle of
    VK_RECH:
      Title := 'ODIn Rechnung Nr.:' + ReKopfTabVRENUM.Value;
    VK_AGB:
      Title := 'ODIn Angebot Nr.:' + ReKopfTabVRENUM.Value;
    VK_LIEF:
      Title := 'ODIn Lieferschein Nr.:' + LsKopfTabVLSNUM.Value;
    EK_BEST:
      Title := 'ODIn EK-Bestellung Nr.:' + ReKopfTabVRENUM.Value;
    VK_RECH + 100:
      Title := 'ODIn Verkaufsjournal';
    VK_KASSE + 100:
      Title := 'ODIn Kassenjournal';
    VK_AGB + 100 :
      Title := 'ODIn Angebotsjournal';
    EK_RECH + 100:
      Title := 'ODIn Einkaufsjournal';
    VK_LIEF + 100:
      Title := 'ODIn Lieferscheinjournal';
    KRD_OPOS:
      Title := 'ODIn OPOS-Debitoren';
    DEB_OPOS:
      Title := 'ODIn OPOS-Kreditoren';
    KAS_BUCH:
      Title := 'ODIn Kassenbuch';
    MAHNUNG:
      Title := 'ODIn Mahnung';
    TEXTVERARB:
      Title := 'ODIn Brief';
  end;

  // NEU, User-Titel (Subjekt) aus der Registry laden...
  UserTitel := '';
  Key := '';

  case Quelle of
    VK_RECH   : Key := 'VK_RECH_MAIL_';
    VK_AGB    : Key := 'VK_AGB_MAIL_';
    VK_LIEF   : Key := 'VK_LIEF_MAIL_';
    EK_BEST   : Key := 'EK_BEST_MAIL_';
    MAHNUNG   : Key := 'MAHNUNG_MAIL_';
    TEXTVERARB: Key := 'TEXTVERARB_MAIL_';
  end;

  if length(Key) > 0 then
  begin
    UserTitel := DM1.ReadString ('MAIN\REPORT', Key + 'SUBJECT', '');

    if Quelle in [VK_RECH, VK_AGB, EK_BEST] then
    begin
      ReplacePlaceHolder (ReKopfTab, UserTitel);
    end else
    if Quelle = VK_LIEF then
    begin
      ReplacePlaceHolder (LsKopfTab, UserTitel);
    end else
    if Quelle = MAHNUNG then
    begin
      ReplacePlaceHolder (MahnPrintTab, UserTitel);
    end else
    if Quelle = TEXTVERARB then
    begin
      ReplacePlaceHolder (TextTab, UserTitel);
    end;

    if length(UserTitel) > 0 then
      Title := UserTitel;
  end;

  case quelle of
    VK_RECH:
      FileName := 'RECH' + ReKopfTabVRENUM.Value;
    VK_AGB:
      FileName := 'ANGB' + ReKopfTabVRENUM.Value;
    VK_LIEF:
      FileName := 'LIEF' + LsKopfTabVLSNUM.Value;
    EK_BEST:
      FileName := 'BEST' + ReKopfTabVRENUM.Value;
    VK_RECH + 100:
      FileName := 'ODIn-Verkaufsjournal';
    VK_KASSE + 100:
      FileName := 'ODIn-Kassenjournal ' + formatDateTime('YYYYMM', VDat);
    VK_AGB + 100 :
      FileName := 'ODIn-Angebotsjournal';
    EK_RECH + 100:
      FileName := 'ODIn-Einkaufsjournal';
    VK_LIEF + 100:
      FileName := 'ODIn-Lieferscheinjournal';
    EK_BEST + 100:
      FileName := 'ODIn-EK-Bestelljournal';
    KRD_OPOS:
      FileName := 'ODIn-OPOS-Debitoren';
    DEB_OPOS:
      FileName := 'ODIn-OPOS-Kreditoren';
    KAS_BUCH:
      FileName := 'ODIn-Kassenbuch';
    MAHNUNG:
      FileName := 'MAHN_KU' + MahnPrintTabkun_num.AsString + '_RE' + MahnPrintTabvrenum.AsString; //+MahnPrintTabKun_Name1.AsStrin;
    TEXTVERARB:
      FileName := 'BRIEF_' + InttoStr(TextTabID.AsInteger);
    MOD_INV_WERTLISTE:
      FileName := 'InventurWertliste';
    //MOD_INV_ZAEHLLISTE:
    //  FileName :='InventurZaehlliste'; //25.10.09-ud.
  end;

  //RepTab.Open;
  //Report1.LoadFromDB(RepTab,1);
  LoadReport;
  Report1.PrepareReport;
  Report1.ExportTo(TfrTNPDFExportFilter, DM1.ExportDir + FileName + '.pdf');
  //RepTab.Close;

  if Not SendEmail then
    MessageDlg ('PDF wurde unter dem Dateinamen:' + #13#10 +
                DM1.ExportDir + FileName + '.pdf ' + 'gespeichert.',
                mtinformation, [mbok], 0
    );

  if Quelle in [VK_RECH, VK_AGB, VK_LIEF, EK_BEST, TEXTVERARB, MAHNUNG] then
  begin
    try
      // Link an Beleg anhängen
      LinkForm.AddLink(Quelle,
        CurrBelegID,
        DM1.ExportDir + FileName + '.pdf');

      // Link bei Adresse eintragen
      if (tblAdressen.Active) and (tblAdressen.RecordCount = 1) then
      begin
        if Quelle = Mahnung then
          AddrID := MahnPrintTabaddr_id.AsInteger
        else
        if Quelle = TEXTVERARB then
          AddrID := TextTabADDR_ID.AsInteger
        else
          AddrID := tblAdressen.FieldByName('REC_ID').AsInteger;

        LinkForm.AddLink (MOD_ADRESSEN, AddrID,
        DM1.ExportDir + FileName + '.pdf');
      end;
    except
    end;
  end;

  if SendEMail then
  begin
    if length(Key) > 0 then
    begin
      T := DM1.ReadLongString ('MAIN\REPORT', Key + 'TEXT', '');

      if Quelle in [VK_RECH, VK_AGB, EK_BEST] then
      begin
        ReplacePlaceHolder (ReKopfTab, T);
      end else
      if Quelle = VK_LIEF then
      begin
        ReplacePlaceHolder (LsKopfTab, T);
      end else
      if Quelle = MAHNUNG then
      begin
        ReplacePlaceHolder (MahnPrintTab, T);
      end else
      if Quelle = TEXTVERARB then
      begin
        ReplacePlaceHolder (TextTab, T);
      end;
    end else
      T := '';

    MyEMail := tEMail.Create (Self);
    try
      if not MyEMail.MapiAvail then
      begin
        MessageDlg ('Die MAPI-Schnittstelle ist auf Ihrem System' + #13#10 +
                    'nicht installiert, ein ' +
                    'EMail-Versand ist nicht möglich !', mterror, [mbOK], 0
        );
      end else
      begin
        MyEMail.OnMapiError   := MapiError;
        MyEMail.TruncAttFN    := False; // Dateinamen nicht auf 8.3 reduzieren
        MyEMail.UseDefProfile := True;
        MyEMail.NewSession    := False;
        MyEMail.ShowDialog    := True;
        MyEMail.Attachment.Add (DM1.ExportDir + FileName + '.pdf');
        MyEMail.Recipient.Text := EMail; //Emp;
        MyEMail.Subject := Title;
        MyEMail.SetLongText (PChar(T));
        MyEMail.ShowDialog := True;
        Res := MyEMail.SendMail;

        if not (Res in [SUCCESS_SUCCESS, MAPI_USER_ABORT, MAPI_E_UNKNOWN_RECIPIENT]) then
          MessageDlg ('Beim Senden der Nachricht ' +
                      'ist ein Fehler aufgetreten !', mterror, [mbOK], 0
          );
      end;
    finally
      MyEMail.Free;
    end;
  end;

  //Beleg als gedruckt markieren
  if (Quelle in [VK_RECH, VK_AGB, EK_BEST]) and (ReKopfTabPrint_Flag.AsBoolean = False) then
  begin
    DM1.Uniquery.Close;
    DM1.Uniquery.SQL.Text := 'UPDATE JOURNAL SET PRINT_FLAG="Y" ' +
      'WHERE REC_ID=' + IntToStr(ReKopfTabRec_ID.AsInteger);
    DM1.Uniquery.ExecSQL;
  end else
  if (Quelle in [VK_LIEF]) and (LsKopfTabPrint_Flag.AsBoolean = False) then
  begin
    DM1.Uniquery.Close;
    DM1.Uniquery.SQL.Text := 'UPDATE JOURNAL SET PRINT_FLAG="Y" ' +
      'WHERE REC_ID=' + IntToStr(LsKopfTabRec_ID.AsInteger);
    DM1.Uniquery.ExecSQL;
  end
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.PDFBtnClick(Sender: TObject);
begin
  MakePdf (False);
  //wird mit FreePDF XP realisiert
  //ZielCB.ItemIndex:= ZielCB.Items.IndexOf('FreePDF XP');
  //PrintBtnClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ZielCBClick(Sender: TObject);
begin
  Printer.PrinterIndex := ZielCB.ItemIndex;
  //  BinNamCB.Items.Assign(Printer.PaperSources);
  // BinNamCB.ItemIndex := Printer.PaperSourceIndex;  //aktueller Schacht
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.Edit1Click(Sender: TObject);
begin
  RButton2.checked := true;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.RButton2Click(Sender: TObject);
begin
  Edit1.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.RButton1Click(Sender: TObject);
begin
  Edit1.Text := '';
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['0'..'9', '-', ',', #8, #46] then
    key := key
  else
    key := chr(0);
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.RePosTabAfterScroll(DataSet: TDataSet);
begin
  TmpSN := '';
  ReSNTab.Close;

  if RePosTabSN_FLAG.AsBoolean then
  begin
    ReSNTab.SQL.Text := 'select * from ARTIKEL_SERNUM ' +
    'where VK_JOURNALPOS_ID=:REC_ID';
    ReSNTab.ParamByName('REC_ID').AsInteger := RePosTabRec_ID.AsInteger;
    ReSNTab.Open;

    while not ReSNTab.Eof do
    begin
      if length(TmpSN)>0 then TmpSN := TmpSN + ', ';
      TmpSN := TmpSN + ReSNTabSERNUMMER.AsString;
      ReSNTab.Next;
    end;
    ReSNTab.Close;

    TmpSNPos := 0;
  end;

  if ArtTab.Active then
    ArtTab.Locate ('J_REC_ID', RePosTabRec_ID.AsInteger, []);
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.BinNamCBClick(Sender: TObject);
begin
  // Printer.PaperSourceIndex := BinNamCB.ItemIndex;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ReportTabBeforeOpen(DataSet: TDataSet);
begin
  ReportTab.ParamByName('KEY').Value := MainKey;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowInventurListe(InventurID: integer);
//Zählliste
begin
  CBFormular.filename := ExtractFilePath(Application.ExeName) + 'Formulare\Zaehlliste.frf';
  DbDataset.DataSource := InventurPosDS;
  //Quelle:=MOD_INV_ZAEHLLISTE;  //25.10.09-ud.
  InventurPos.ParamByName('ID').Value := InventurID;
  Inventur.ParamByName('ID').Value := InventurID;
  InventurPos.Open;
  Inventur.Open;

  repeat
  until ShowModal <> mrRetry;

  InventurPos.Close;
  Inventur.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowLagerbestandsliste(InventurID: integer);
begin
  CBFormular.filename := ExtractFilePath(Application.ExeName) + 'Formulare\Wertliste.frf';
  DbDataset.DataSource := InventurSumDS;
  Quelle := MOD_INV_WERTLISTE;
  InventurSumme.ParamByName('ID').Value := InventurID;
  InventurSumme.Open;

  repeat
  until ShowModal <> mrRetry;

  InventurSumme.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.Lagerbestandsliste();
begin
  CBFormular.filename := ExtractFilePath(Application.ExeName) + 'Formulare\Wertliste.frf';
  DBDataset.Close;
  DBDetailDataset.Close;
  DbDataset.DataSource := LagerDS;
  DBDetailDataset.DataSource := LagerWGInvDS;
  Quelle := MOD_INV_WERTLISTE;
  Lagerliste.Open;
  LagerWGInv.Open;
  DBDataset.Open;
  DBDetailDataset.Open;

  repeat
  until ShowModal <> mrRetry;

  Lagerliste.Close;
  LagerWGInv.Close;
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowArtikelliste();
begin
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.LsPosTabCalcFields(DataSet: TDataSet);
begin
  if LsPosTabArtikelTyp.Value = 'T' then
  begin
    LsPosTabCALC_MENGE.Value := '';
    LsPosTabCALC_GEWICHT.Value := '';
  end else
  begin
    LsPosTabCALC_MENGE.Value := LsPosTabMenge.AsString + ' ' + LsPosTabME_EINHEIT.Value;
    LsPosTabCALC_GEWICHT.Value := FloatToStr(LsPosTabGewicht.Value * LsPosTabMenge.Value) + ' ' + LsPosTabME_EINHEIT.Value;
  end
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.DHLExport;
var
  DHLFile: TextFile;
  DateiName: string;
begin
  {$IFDEF DHL_EXPORT}
  DateiName := ExtractFilePath(Application.ExeName) + 'Export\Poll.txt';
  AssignFile(DHLFile, DateiName);
  try
    Append(DHLFile);
  except
    Rewrite(DHLFile);
  end;
  Writeln(DHLFile,
    LsKopfTabVLSNUM.Value + ';',
    LsKopfTabCALC_LiefName1.Value + ';',
    LsKopfTabCALC_LiefName2.Value + ';',
    LsKopfTabCALC_LiefName3.Value + ';',
    LsKopfTabCALC_LiefStrasse.Value + ';',
    LsKopfTabCALC_LiefPLZ.Value + ';',
    LsKopfTabCALC_LiefOrt.Value + ';',
    LsKopfTabORGNUM.Value + ';',
    '01;03;101'
  );
  CloseFile(DHLFile);
  LsKopfTab.Edit;
  LsKopfTabStadium.Value := 40;
  LsKopfTab.Post;
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.KasseTagesAbRechnung(DatumVon, DatumBis: TDate);
  {
  Spezialanfertigung für Beaux Salons
  Sortiert den tagesumsatz etwas anders und schickt ihn per Mail
  }
  //------------------------------------------------------------------------------
  function SumGegenKto(GegenKto: Integer): String;
  var Umsatz: double;
    tmpResult: String;
  begin
    Umsatz := 0;
    UmsatzWG.ParamByName('Gegenkto').Value := GegenKto;
    UmsatzWG.Open;
    while not UmsatzWG.Eof do
    begin
      //Umsatz:=Umsatz+UmsatzWGGPreis.Value/(1+dm1.GetVat(UmsatzWGSteuer_Code.Value)/100);  //25.10.09-ud.
      UmsatzWG.Next;
    end;
    UmsatzWG.Close;
    str(Umsatz: 2: 2, tmpResult);
    SumGegenKto := StringReplace(tmpResult, '.', ',', []);
  end;

begin
  UmsatzWG.ParamByName('RDatumVon').Value := DatumVon;
  UmsatzWG.ParamByName('RDatumBis').Value := DatumBis;
  FrVariables['Zeitraum'] := formatDateTime('DD.MM.YYYY', DatumVon);
  (*  //25.10.09-ud.
  WGSummeDelete.execSQL; //Tabelle leeren
  WGSumme.Open;
  WGSumme.AppendRecord(['4400', 'Möbel', SumGegenKto(4400)]);
  WGSumme.AppendRecord(['4401', 'Haushaltsgegenstände', SumGegenKto(4401)]);
  WGSumme.AppendRecord(['4402', 'Wein', SumGegenKto(4402)]);
  WGSumme.AppendRecord(['4403', 'Sonstiges', SumGegenKto(4403)]);
  WGSumme.AppendRecord(['4302', 'Food', SumGegenKto(4302)]);
  WGSumme.AppendRecord(['4303', 'Bücher', SumGegenKto(4303)]);
  DBDataset.DataSet := WGSumme;
  CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Rechnungsjournal.frf';
  //Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Formulare\KassenTagesJournal.frf');
  repeat until ShowModal<>mrRetry;
  WGSumme.Close;
  *)
end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.DatevExport(Von, Bis: TDate);
begin
  Quelle := 3;
  frVariables.Clear;

  frVariables['Zeitraum'] := DateToStr(Von) + ' - ' + DateToStr(Bis);
  frVariables['DatumVon'] := DateToStr(Von);
  frVariables['DatumBis'] := DateToStr(Bis);
  Caption := 'Rechnungsjournal drucken';

  DbDataset.DataSource  := ReJourDS;
  DbDetailDataset.DataSource  := ReJournalPosDS;
  ReJournalTab.Close;
  ReJournalPos.Close;
  ReJournalTab.ParamByName('Von').Value := Von;
  ReJournalTab.ParamByName('Bis').Value := Bis;
  ReJournalTab.ParamByName('AddrId').Value := 0;
  ReJournalPos.ParamByName('DatVon').Value := Von;
  ReJournalPos.ParamByName('DatBis').Value := Bis;

  ReJournalPos.Open;
  ReJournalTab.Open;
  CBFormular.FileName := ExtractFilePath(Application.ExeName) + 'Formulare\Rechnungsjournal.frf';

  JournalTab.Close;
  JournalTab.Sql.Clear;
  JournalTab.SQL.Add ('select * from JOURNAL');
  JournalTab.SQL.Add ('where QUELLE=:QUELLE');

  // Bei VK-Rechnung keine Kasse anzeigen
  JournalTab.SQL.Add ('and QUELLE_SUB <> 2');

  JournalTab.SQL.Add ('and RDATUM >=:VDAT and RDATUM <=:BDAT');

  JournalTab.SQL.Add ('ORDER BY RDATUM, VRENUM');


  JournalTab.ParamByName ('QUELLE').Value := 3;
  JournalTab.ParamByName ('VDAT').Value   := VDAT;
  JournalTab.ParamByName ('BDAT').Value   := BDAT;
  JournalTab.Open;

  SumQuery.Close;

  SumQuery.Sql.Clear;
  SumQuery.SQL.Add('select');
  SumQuery.SQL.Add('STADIUM, sum(NSUMME) as NETTO,');
  SumQuery.SQL.Add('sum(MSUMME) as MWST,');
  SumQuery.SQL.Add('sum(MSUMME_1) as MWST_1,');
  SumQuery.SQL.Add('sum(MSUMME_2) as MWST_2,');
  SumQuery.SQL.Add('sum(MSUMME_3) as MWST_3,');
  SumQuery.SQL.Add('sum(BSUMME) as BRUTTO,');
  SumQuery.SQL.Add('sum(IST_BETRAG) as BEZAHLT,');
  SumQuery.SQL.Add('WAEHRUNG');

  SumQuery.SQL.Add('from JOURNAL');
  SumQuery.SQL.Add('where QUELLE=:QUELLE');
  SumQuery.SQL.Add('and RDATUM >=:VDAT and RDATUM <=:BDAT');

  SumQuery.SQL.Add('and QUELLE_SUB != 2');

  SumQuery.SQL.Add('group by WAEHRUNG, STADIUM');

  SumQuery.ParamByName ('QUELLE').Value := 3;
  SumQuery.ParamByName ('VDAT').Value   := VDAT;
  SumQuery.ParamByName ('BDAT').Value   := BDAT;
  SumQuery.Open;

  frVariables['Jour_offen']   := jour_Offen;
  frVariables['Jour_bezahlt'] := jour_bezahlt;
  frVariables['Jour_Netto']   := jour_netto;
  frVariables['Jour_Brutto']  := jour_brutto;
  frVariables['Jour_MwSt']    := jour_mwst;
  frVariables['Jour_MwSt1']   := jour_mwst1;
  frVariables['Jour_MwSt2']   := jour_mwst2;
  frVariables['Jour_MwSt3']   := jour_mwst3;

  Report1.Title := 'Rechnungsjournal'; //Name des zu druckenden Dokuments

  DM1.FirmaTab.Open;

  repeat
  until ShowModal <> mrRetry;

end;

//------------------------------------------------------------------------------
procedure TPrintRechForm.ShowUniDlg(
    Modul: Integer;
    SQL     : String;
    RegKey  : String;
    DlgTxt  : String;
    EdiTxt  : String;
    JobTxt  : String;
    Vorschau: Boolean);
var
  Res: Boolean;
  i: integer;
begin
(*  //30.10.09-ud.
  EMail  := '';
  Fax    := '';

  try
    JobText := JobTxt;
    MainKey := RegKey;
    Caption := DlgTxt;
    ppDesigner1.Caption := EdiTxt;
    RechReport.DataPipeline := UniPipeline;

    UniTab.Close;
    UniTab.Sql.Text := SQL;
    UniTab.Open;

    DM1.FirmaTab.Open;

    Quelle := 9999;

    ReportTab.Close;
    ReportTab.Open;

    Res := FormularCB.Locate (ReportTabVal_Char, 'DEFAULT', True);
    if not Res then
    begin
      ReportTab.First;
      FormularCB.DisplayValue := ReportTabName.Value;
    end else
    begin
      FormularCB.DisplayValue := ReportTabName.Value;
    end;

    ZielCB.Items.Assign (RechReport.PrinterSetup.PrinterNames);
    I := ZielCB.Items.IndexOf ('Screen');
    if I >= 0 then
      ZielCB.Items.Delete (i);

    if ZielCB.Items.Count >= 0 then
      for i := 0 to ZielCB.Items.Count - 1 do
        if ZielCB.Items[i] = RechReport.PrinterSetup.PrinterName then
          ZielCB.ItemIndex := I;

    if ZielCB.ItemIndex = - 1 then
      if ZielCB.Items.IndexOf ('Default') > -1 then
        ZielCB.ItemIndex := ZielCB.Items.IndexOf ('Default');

    ZielCBChange(Self);

    LayoutBtn.Enabled := DM1.CaoSecurity.CanEditPrintForm (Modul, 0);

    if Vorschau then
      VorschauBtnClick(Self)
    else
      repeat until ShowModal <> mrRetry;

  finally
    UniTab.Close;
    DM1.FirmaTab.Close;
  end;
  //ReportTab.Close;

*)
end;

procedure TPrintRechForm.DesignerSave(Report: TfrReport;
  var RepName: String; var Saved: Boolean);
begin
  if cbReport.ItemIndex >= 0 then
  begin
    if ReportTab.Locate('NAME', cbReport.ItemValue, []) then
    begin
      ReportTab.Edit;
      SaveToBlobField(ReportTab.FieldByName('VAL_BIN'));
      ReportTab.Post;
    end else
    begin
      // Report nicht gefunden...
    end;
  end;
end;
(*
  if FormularCB.Text = '' then
  begin
    ReportTab.Append;
    ReportTab.FieldByName('MainKey').AsString := MainKey;
    ReportTab.FieldByName('Name').AsString := 'Artikel-Stammblatt';
    ReportTab.FieldByName('VAL_TYP').AsInteger := 8;
    ReportTab.Post;

    FormularCB.DisplayValue := 'Artikel-Stammblatt';
  end;
*)

procedure TPrintRechForm.DesignerSaveAs(Report: TfrReport;
  var RepName: String; var Saved: Boolean);
begin
  //Report.SaveToFile(RepName);
end;

procedure LoadFromBlobField(BlobFld: TField);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    TBlobField(BlobFld).SaveToStream(Stream);
    Stream.Position := 0;
    PrintRechForm.Report1.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure SaveToBlobField(BlobFld: TField);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    PrintRechForm.Report1.SaveToStream(Stream);
    Stream.Position := 0;
    TBlobField(BlobFld).LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

end.

//------------------------------------------------------------------------------


procedure TPrintRechForm.ShowAdresseDlg (ADDR_ID: Integer; Vorschau: Boolean);
var Res         : Boolean;
  I           : integer;
  AddrDS      : tDataSource;
  AddrPipeline: TppDBPipeline;

  //Ansprechpartner
  ASPTab      : TZQuery;
  ASPDS       : tDataSource;
  ASPPipeline : TppDBPipeline;

  //Lieferanschriften

  //Kundenpreise

begin
  AddrTab := TZQuery.Create(Self);
  AddrTab.Database := DM1.DB1;
  AddrTab.Sql.Text := 'SELECT * FROM ADRESSEN WHERE REC_ID=' + IntToStr(Addr_ID);

  AddrDS := tDataSource.Create(Self);
  AddrDS.Dataset := AddrTab;

  AddrPipeline := TppDBPipeline.Create(Self);
  AddrPipeline.DataSource := AddrDS;
  AddrPipeline.AutoCreateFields := True;
  AddrPipeline.UserName := 'Adressen';
  AddrPipeline.Name     := 'AddrPipeline';

  ASPTab := TZQuery.Create (Self);
  ASPTab.Database    := DM1.DB1;
  ASPTab.Sql.Text    := 'SELECT * FROM ADRESSEN_ASP where ADDR_ID=' +
  IntToStr(ADDR_ID) + ' ORDER BY NAME, VORNAME';

  ASPDS := tDataSource.Create (Self);
  ASPDS.DataSet      := ASPTab;

  ASPPipeline := tppDBPipeline.Create (Self);
  ASPPipeline.DataSource := ASPDS;
  ASPPipeline.AutoCreateFields := True;
  ASPPipeline.UserName := 'Ansprechpartner';
  ASPPipeline.Name     := 'ASPPipeline';


  try
    MainKey := 'MAIN\REPORT\ADRESSEN';
    Caption := _('Adresse drucken');
    ppDesigner1.Caption := _('Adresse Layout bearbeiten');
    RechReport.DataPipeline := ReKopfPipeline;


    AddrTab.Open;
    ASPTab.Open;

    //LayoutBtn.Enabled :=DM1.CaoSecurity.CanEditPrintForm (2040,0); //????

    UpdateForm (MOD_ADRESSEN, False, 2040);  //NEU

    if AddrTab.Active then AddrTab.Close;
    if ASPTab.Active  then ASPTab.Close;
  finally
    AddrPipeline.Free;
    AddrDS.Free;
    AddrTab.Free;

    ASPPipeline.Free;
    ASPDS.Free;
    ASPTab.Free;
  end;
end;

procedure TPrintRechForm.UpdateForm (NewQuelle: Integer; Preview  : Boolean; ModulID  : Integer);
var
  PrintPreviewForm: TPrintPreviewForm; I: Integer;
begin
  if Preview then
  begin
    PrintPreviewForm := TPrintPreviewForm.Create (Self);
  end;
  try
    if Quelle<>NewQuelle then
    begin
      Quelle := NewQuelle;

      ReportTab.Close;
      ReportTab.Open;

      if not FormularCB.Locate (ReportTabVal_Char, 'DEFAULT', True) then
      begin
        ReportTab.First;
        FormularCB.DisplayValue := ReportTabName.Value;
      end
      else
      begin
        FormularCB.DisplayValue := ReportTabName.Value;
      end;

      ZielCB.Items.Assign (RechReport.PrinterSetup.PrinterNames);
      I := ZielCB.Items.IndexOf ('Screen');
      if I>= 0 then ZielCB.Items.Delete (i);

      if ZielCB.Items.Count >= 0 then
        for i := 0 to ZielCB.Items.Count - 1 do
          if ZielCB.Items[i] = RechReport.PrinterSetup.PrinterName
        then ZielCB.ItemIndex := I;

        if ZielCB.ItemIndex = - 1 then
          if ZielCB.Items.IndexOf ('Default')> - 1
        then ZielCB.ItemIndex := ZielCB.Items.IndexOf ('Default');

      end;
      ZielCBChange(Self);
      FormularCBChange(Self);

      //Prüfen of akt. User Layouts bearbeiten darf
      LayoutBtn.Enabled := DM1.CaoSecurity.CanEditPrintForm (ModulID, 0);

      DM1.FirmaTab.Open;

      if not Preview then
      begin
        repeat until ShowModal<>mrRetry;
        end
        else
        begin
          PrintPreviewForm.FormularCB.LookupDisplay := 'NAME';
          PrintPreviewForm.FormularCB.LookupField   := 'NAME';
          PrintPreviewForm.FormularCB.LookupSource  := ReportDS;
          PrintPreviewForm.FormularCB.DisplayValue  := FormularCB.DisplayValue;

          PrintPreviewForm.ppViewer1.Reset;
          PrintPreviewForm.ppViewer1.Report := RechReport;
          PrintPreviewForm.ShowModal;
          PrintPreviewForm.ppViewer1.Report := nil;
        end;

        if DM1.FirmaTab.Active then DM1.FirmaTab.Close;
      finally
        if Preview then
        begin
          PrintPreviewForm.Free;
          PrintPreviewForm := nil;
        end;
      end;
    end;
    //------------------------------------------------------------------------------

