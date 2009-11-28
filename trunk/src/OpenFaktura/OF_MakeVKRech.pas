{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Rechnungserstellung u. Bearbeitung                         }
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
{ - Provision aus dem Kundenstamm muß noch einbezogen werden                   }
{ - Staffelpreise müssen noch berücksichtigt werden                            }
{ - Prüfung der Bankverbindung bei Lastschrift/nur Rechnung                    }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt }
{ 17.03.2003 - Rechnungen mit Betrag 0,00 jetzt möglich }
{ 11.05.2003 - Tabellen und Code zur Auswahl von Seriennummern hinzugefügt }
{ 18.05.2003 - Anpassungen an neue DB }
{ 23.05.2003 - Brutto-Preisberechnung implementiert }
{ 26.05.2003 - Verwendung von VK-Rabattgruppen implementiert }
{ 31.05.2003 - neuen Code zur Aktualisierung des Artikelfeldes MENGE_VKRE_EDI }
{              hinzugefügt }
{ 26.06.2003 - im Menü Spezial gibt es einen neuen Menüpunkt zur Umrechnung }
{              Brutto<-->Netto }
{ 29.06.2003 - Update Orderstatus für Shop eingebaut }
{ 16.08.2003 - Bugfix bei Zahlungsart Vorkasse }
{ 25.08.2003 - Auswahl der Lieferadresse eingebaut }
{ 27.08.2003 - Provisionsberechnung eingebaut }
{ 06.09.2003 - Lieferanschrift kann jetzt auch gelöscht werden }
{            - Tabelle JOURNALPOS Feld E_ROHGEWINN wird jetzt berechnet }
{              (VK-Einzelpreis - EK-Preis) bei Menge = 1 !!! }
{              Es muß also noch mit der Menge multipliziert werden und ggf. die }
{              Vertreterprovision abgezogen werden ! }
{ 18.10.2003 - Brutto-Summen-Rundung eingebaut }
{ 21.10.2003 - Kundenpreise werden jetzt berücksichtigt }
{ 23.10.2003 - ShortCuts im Menü angepaßt }
{ 02.11.2003 - Gewicht und Rohgewinn zum Journal hinzugefügt, beides wird jetzt }
{              zudem summiert }
{            - EK-Preis und CALC-Faktor in die POS-Tab hinzugefügt }
{            - Dieses Formular wird jetzt für Angebot + Rechnung verwendet }
{ 09.11.2003 - Bug nach Fertigstellen der Rechnung }
{              (Liste wurde nicht aktualisiert) gefixt }
{            - Bug beim editieren von Texten beseitigt }
{ 14.11.2003 - beim Hinzufügen von "freien Artikeln" wird jetzt die }
{              "Default-MwSt" verwendet }
{ 22.12.2003 - Shop-Status wird jetzt in der Liste mit angezeigt }
{ 24.12.2003 - die Kundennummer kann jetzt auch alphanumerisch eingegeben werden }
{ 07.01.2004 - Suchdialog auf Seite Auswahl eingebaut }
{ 18.01.2004 - Aufruf für den Export der Lieferdaten an Paketdienste hinzugefügt }
{ 19.02.2004 - Bug in der Berechnung des Rohgewinnes beseitigt }
{ 10.10.2004 - Recordlocking implementiert }
{ 27.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{            - Sortierung der Liste (Auswahl) eingebaut }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MakeVKRech;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, JvExStdCtrls, JvDBCombobox, JvBaseEdits, JvSpin, Grids,
  JvExGrids, JvStringGrid, ExRxDBGrid{???}, JvArrowButton, DBCtrls, JvToolEdit,
  JvDBControls, JvExControls, JvComponent, JvSpeedButton, Buttons,
  VolDBEdit, Mask, JvExMask, OFGroupBox, ComCtrls, ToolWin, DBGrids,
  JvExDBGrids, JvDBGrid, OFDBGrid, JvExComCtrls, JvComCtrls, ExtCtrls,
  OFSecurity, OF_Var_Const, JvMenus;

  //CaoSecurity,
  //OF_Artikel1, OF_Kunde;

{
uses
  DBTables, JvDBComb, JvDBCtrl, JvxCtrls,
  JvLookup, JvArrowBtn, ExDBGrid, JvEdit,
  JvTypedEdit, JvCurrEdit, JvMaskEdit, JvDBSpinEdit, JvFloatEdit;
}

type
  TMakeVKReForm = class(TForm)
    PosDS: TDataSource;
    EdiListTS: TTabSheet;
    RePanel: TPanel;
    PC1: TJvPageControl;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    ReEdiDS: TDataSource;
    ReEdiTab: TOFZQuery;
    PosTab: TZQuery;
    ReEdiTabQUELLE: TIntegerField;
    ReEdiTabREC_ID: TIntegerField;
    ReEdiTabQUELLE_SUB: TIntegerField;
    ReEdiTabADDR_ID: TIntegerField;
    ReEdiTabATRNUM: TIntegerField;
    ReEdiTabVRENUM: TStringField;
    ReEdiTabVLSNUM: TStringField;
    ReEdiTabFOLGENR: TIntegerField;
    ReEdiTabKM_STAND: TIntegerField;
    ReEdiTabKFZ_ID: TIntegerField;
    ReEdiTabVERTRETER_ID: TIntegerField;
    ReEdiTabGLOBRABATT: TFloatField;
    ReEdiTabADATUM: TDateField;
    ReEdiTabRDATUM: TDateField;
    ReEdiTabLDATUM: TDateField;
    ReEdiTabWV_DATUM: TDateField;
    ReEdiTabPR_EBENE: TIntegerField;
    ReEdiTabKOST_NETTO: TFloatField;
    ReEdiTabWERT_NETTO: TFloatField;
    ReEdiTabLOHN: TFloatField;
    ReEdiTabWARE: TFloatField;
    ReEdiTabTKOST: TFloatField;
    ReEdiTabMWST_0: TFloatField;
    ReEdiTabMWST_1: TFloatField;
    ReEdiTabMWST_2: TFloatField;
    ReEdiTabMWST_3: TFloatField;
    ReEdiTabNSUMME: TFloatField;
    ReEdiTabMSUMME_0: TFloatField;
    ReEdiTabMSUMME_1: TFloatField;
    ReEdiTabMSUMME_2: TFloatField;
    ReEdiTabMSUMME_3: TFloatField;
    ReEdiTabMSUMME: TFloatField;
    ReEdiTabBSUMME: TFloatField;
    ReEdiTabATSUMME: TFloatField;
    ReEdiTabATMSUMME: TFloatField;
    ReEdiTabWAEHRUNG: TStringField;
    ReEdiTabGEGENKONTO: TIntegerField;
    ReEdiTabSOLL_SKONTO: TFloatField;
    ReEdiTabSOLL_RATEN: TIntegerField;
    ReEdiTabSOLL_RATBETR: TFloatField;
    ReEdiTabSOLL_RATINTERVALL: TIntegerField;
    ReEdiTabSTADIUM: TIntegerField;
    ReEdiTabERSTELLT: TDateField;
    ReEdiTabERST_NAME: TStringField;
    ReEdiTabKUN_NUM: TStringField;
    ReEdiTabKUN_ANREDE: TStringField;
    ReEdiTabKUN_NAME1: TStringField;
    ReEdiTabKUN_NAME2: TStringField;
    ReEdiTabKUN_NAME3: TStringField;
    ReEdiTabKUN_ABTEILUNG: TStringField;
    ReEdiTabKUN_STRASSE: TStringField;
    ReEdiTabKUN_LAND: TStringField;
    ReEdiTabKUN_PLZ: TStringField;
    ReEdiTabKUN_ORT: TStringField;
    ReEdiTabUSR1: TStringField;
    ReEdiTabUSR2: TStringField;
    ReEdiTabPROJEKT: TStringField;
    ReEdiTabORGNUM: TStringField;
    ReEdiTabBEST_NAME: TStringField;
    ReEdiTabBEST_CODE: TIntegerField;
    ReEdiTabINFO: TBlobField;
    PosTabREC_ID: TIntegerField;
    PosTabQUELLE: TIntegerField;
    PosTabQUELLE_SUB: TIntegerField;
    PosTabJOURNAL_ID: TIntegerField;
    PosTabARTIKELTYP: TStringField;
    PosTabARTIKEL_ID: TIntegerField;
    PosTabADDR_ID: TIntegerField;
    PosTabATRNUM: TIntegerField;
    PosTabVRENUM: TStringField;
    PosTabVLSNUM: TStringField;
    PosTabPOSITION: TIntegerField;
    PosTabMATCHCODE: TStringField;
    PosTabARTNUM: TStringField;
    PosTabBARCODE: TStringField;
    PosTabMENGE: TFloatField;
    PosTabLAENGE: TStringField;
    PosTabGROESSE: TStringField;
    PosTabDIMENSION: TStringField;
    PosTabGEWICHT: TFloatField;
    PosTabME_EINHEIT: TStringField;
    PosTabPR_EINHEIT: TFloatField;
    PosTabEPREIS: TFloatField;
    PosTabE_RGEWINN: TFloatField;
    PosTabRABATT: TFloatField;
    PosTabSTEUER_CODE: TIntegerField;
    PosTabALTTEIL_STCODE: TIntegerField;
    PosTabGEGENKTO: TIntegerField;
    PosTabNSumme: TCurrencyField;
    ReEdiTabLIEFART: TIntegerField;
    ReEdiTabZAHLART: TIntegerField;
    PosTabBEZEICHNUNG: TMemoField;
    PosTabMwSt: TStringField;
    PosTabALTTEIL_PROZ: TFloatField;
    ReEdiListGrid: TOFDBGrid;
    PosTabMATCH_ARTNUM: TStringField;
    ToolBar1: TToolBar;
    PosDelBtn1: TToolButton;
    UpBtn1: TToolButton;
    DownBtn1: TToolButton;
    DBNavigator3: TDBNavigator;
    
    ReEdiTabWV_DatumStr: TStringField;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    Storno1: TMenuItem;
    N1: TMenuItem;
    Layoutspeichern1: TMenuItem;

    SichtbareSpalten1: TMenuItem;
    KundatGB: TOFGroupBox;
    Panel10: TPanel;
    DBText6: TDBText;
    Panel11: TPanel;
    DBText5: TDBText;
    Panel9: TPanel;
    DBText7: TDBText;
    Label31: TLabel;
    Label53: TLabel;
    Panel8: TPanel;
    DBText4: TDBText;
    KuNrEdit: TJvDBComboEdit;
    Panel2: TPanel;
    DBText1: TDBText;
    Label22: TLabel;
    Label47: TLabel;
    AlgPan3: TPanel;
    CaoGroupBox3: TOFGroupBox;
    Label30: TLabel;
    Label29: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    GlobRabatt: TDBEdit;
    PR_EbeneCB: TVolgaDBEdit;
    VertreterCB: TDBLookupComboBox;
    ZahlartDB: TDBLookupComboBox;
    WaehrungCB: TDBLookupComboBox;
    waehrung: TDBEdit;
    Zahlart: TDBEdit;
    Vertreter: TDBEdit;
    Versand: TDBEdit;
    ToolBar2: TToolBar;
    KopfNav2: TDBNavigator;
    New1Btn: TToolButton;
    Del1Btn: TToolButton;
    ToolBar3: TToolBar;
    DBNavigator1: TDBNavigator;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    GotoAllgBtn: TToolButton;
    GotoFertigBtn: TToolButton;
    GotoAuswahlBtn: TToolButton;
    GotoPosBtn: TToolButton;
    ReEdiBtn: TToolButton;
    ToolBar5: TToolBar;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    Label6: TLabel;
    SK_Skonto_Tage: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SK_Skonto_Proz: TDBEdit;
    SK_Netto_Tage: TDBEdit;
    Positionlschen1: TMenuItem;
    Adressezuweisen1: TMenuItem;
    Artikelhinzufgen1: TMenuItem;
    AlgPan2: TPanel;
    TexteGB: TOFGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    usr2: TDBEdit;
    usr1: TDBEdit;
    projekt: TDBEdit;
    BestellGB: TOFGroupBox;
    Label21: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    best_num: TDBEdit;
    best_datum: TJvDBDateEdit;
    best_name: TVolgaDBEdit;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    Kopieren1: TMenuItem;
    ReEdiTabBEST_DATUM: TDateField;
    VersandCB: TDBLookupComboBox;
    BuchenBtn: TToolButton;
    ToolButton6: TToolButton;
    LieferscheinBuchenBtn: TToolButton;
    Panel3: TPanel;
    CaoGroupBox1: TOFGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CaoGroupBox2: TOFGroupBox;
    DBEdit4: TDBEdit;
    DBDateEdit1: TJvDBDateEdit;
    DBEdit5: TDBEdit;
    Panel7: TPanel;
    CaoGroupBox5: TOFGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    CaoGroupBox6: TOFGroupBox;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    CaoGroupBox7: TOFGroupBox;
    ProblemLab: TLabel;
    neuenBelegerstellen1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    TopPan: TPanel;
    ReEdiTopLab: TLabel;
    ButtonPan: TPanel;
    AuswahlBtn: TJvSpeedButton;
    AllgemeinBtn: TJvSpeedButton;
    PositionenBtn: TJvSpeedButton;
    FertigBtn: TJvSpeedButton;
    CaoGroupBox8: TOFGroupBox;
    PosGrid: TExRxDBGrid;
    PosSumPan: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    AlgSumPan: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    FertigSumPan: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    DBMemo1: TDBMemo;
    InfoPanOut: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    PosInfoPan: TPanel;
    InfoEKLab: TLabel;
    InfoRGWLab: TLabel;
    Label61: TLabel;
    BottomSpacePan: TPanel;
    ReKFZTab: TZQuery;
    ReKFZDS: TDataSource;
    ReKFZTabKFZ_ID: TIntegerField;
    ReKFZTabADDR_ID: TIntegerField;
    ReKFZTabFGST_NUM: TStringField;
    ReKFZTabPOL_KENNZ: TStringField;
    ReKFZTabSCHL_ZU_2: TStringField;
    ReKFZTabSCHL_ZU_3: TStringField;
    ReKFZTabKM_STAND: TIntegerField;
    ReKFZTabZULASSUNG: TDateField;
    ReKFZTabLE_BESUCH: TDateField;
    ReKFZTabNAE_TUEV: TDateField;
    ReKFZTabNAE_AU: TDateField;
    Spezial1: TMenuItem;
    AtrisImport1: TMenuItem;
    EKBestellungerstellen1: TMenuItem;
    Label63: TLabel;
    DBDateEdit2: TJvDBDateEdit;
    SNTab: TZQuery;
    SNTabARTIKEL_ID: TIntegerField;
    SNTabSERNUMMER: TStringField;
    SNDS: TDataSource;
    ArtikelPopupMenu: TPopupMenu;
    freierArtikel1: TMenuItem;
    Text1: TMenuItem;
    Panel1: TPanel;
    NeuArtBtn1: TJvArrowButton;
    EditSNBtn1: TToolButton;
    PosTabSN_FLAG: TBooleanField;
    PosTabALTTEIL_FLAG: TBooleanField;
    PosTabBEZ_FEST_FLAG: TBooleanField;
    PosTabCALC_LAGERMENGE_STR: TStringField;
    PosTabCALC_LAGERMENGE: TFloatField;
    DBText29: TDBText;
    InfoEK: TDBText;
    InfoRGW: TDBText;
    
    PosTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabMWST_FREI_FLAG: TBooleanField;
    PosTabCALC_STEUERPROZ: TFloatField;
    
    N2: TMenuItem;
    UmschaltungBruttoNetto1: TMenuItem;
    ReAllgBottomPan: TPanel;
    InfoGB: TOFGroupBox;
    RechInfoMemo: TDBMemo;
    ReEdiTabSHOP_ID: TIntegerField;
    ReEdiTabSHOP_ORDERID: TIntegerField;
    ReEdiTabSHOP_STATUS: TIntegerField;
    ReEdiTabSHOP_CHANGE_FLAG: TBooleanField;
    ToolButton1: TToolButton;
    PrintPrevBtn: TToolButton;
    LiefanschrGB: TOFGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    Label42: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    L_Anrede: TEdit;
    L_Name1: TEdit;
    L_Name2: TEdit;
    L_Name3: TEdit;
    L_Strasse: TEdit;
    L_LAND: TEdit;
    L_PLZ: TEdit;
    L_Ort: TEdit;
    ReEdiTabLIEF_ADDR_ID: TIntegerField;

    PosTabPROVIS_PROZ: TFloatField;
    PosTabPROVIS_WERT: TFloatField;
    
    ReEdiTabPROVIS_WERT: TFloatField;
    LiefAnschriftDelBtn: TSpeedButton;
    LiefAnschriftAuswahlBtn: TJvSpeedButton;
    PosDetailTS: TTabSheet;
    PosDetailBtn: TJvSpeedButton;
    ToolBar4: TToolBar;
    PosDetailZurueckBtn: TToolButton;
    ToolButton7: TToolButton;
    Panel37: TPanel;
    JvArrowButton1: TJvArrowButton;
    EditSNBtn2: TToolButton;
    PosDelBtn2: TToolButton;
    UpBtn2: TToolButton;
    DownBtn2: TToolButton;
    DBNavigator2: TDBNavigator;
    ToolButton14: TToolButton;
    PosDetailWeiterBtn: TToolButton;
    PosDetailKundatPan: TPanel;
    CaoGroupBox10: TOFGroupBox;
    Label79: TLabel;
    DetailMatchLab: TLabel;
    DetailArtNumLab: TLabel;
    PosDetailSumPan: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    DetailText: TDBMemo;
    DetailArtnum: TDBEdit;
    DetailMatch: TDBEdit;
    DetailBarcode: TDBEdit;
    DBText31: TDBText;
    DetailBarcodeLab: TLabel;
    Panel53: TPanel;
    ShopStatusGB: TOFGroupBox;
    ShopStatusLab: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    KFZGB: TOFGroupBox;
    Label60: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    KFZUebernehmenBtn: TSpeedButton;
    KFZAddrAssign: TSpeedButton;
    Label65: TLabel;
    Label66: TLabel;
    KFZAddrErase: TSpeedButton;
    KFZAuswahlBtn: TJvSpeedButton;
    KFZNavZurueckBtn: TSpeedButton;
    KFZNavVorBtn: TSpeedButton;
    KFZFGSTNR: TDBEdit;
    KFZ_KMSTAND: TDBEdit;
    KFZPolKZ: TDBEdit;
    KFZ_SCHL_ZU_2: TDBEdit;
    KFZ_SCHL_ZU_3: TDBEdit;
    PosDetailInfoPan: TPanel;
    HisDS: TDataSource;
    HisTab: TZQuery;
    HisTabQUELLE: TIntegerField;
    HisTabRDATUM: TDateField;
    HisTabLDATUM: TDateField;
    HisTabVRENUM: TStringField;
    HisTabVLSNUM: TStringField;
    HisTabKUN_NAME1: TStringField;
    HisTabMENGE: TFloatField;
    HisTabEPREIS: TFloatField;
    HisTabEPREIS_STR: TStringField;
    HisTabRABATT: TFloatField;
    HisTabGPREIS_STR: TStringField;
    HisTabWAEHRUNG: TStringField;
    HisTabMWST_0: TFloatField;
    HisTabMWST_1: TFloatField;
    HisTabMWST_2: TFloatField;
    HisTabMWST_3: TFloatField;
    HisTabSTEUER_CODE: TIntegerField;
    HisTabSTEUER_PROZ: TFloatField;
    HisTabBRUTTO_FLAG: TBooleanField;
    HisTabARTIKEL_ID: TIntegerField;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Positionen1: TMenuItem;
    PosDetails1: TMenuItem;
    Fertigstellen1: TMenuItem;
    N5: TMenuItem;
    Aktualisieren1: TMenuItem;
    PosDetailCalcGB: TOFGroupBox;
    DetailRGW_NR: TDBEdit;
    DetailEPreisR: TJvCalcEdit; //TJvCurrencyEdi;
    DetailEPreisRLab: TLabel;
    DetailRabattLab: TLabel;
    DetailRabatt: TDBEdit;
    DetailRohertragLab: TLabel;
    DetailEPreis: TDBEdit;
    DetailEPreisLab: TLabel;
    DetailFaktor: TJvCalcEdit;  //TJvFloatEdi;
    DetailRGW: TJvCalcEdit; //TJvCurrencyEdi;
    DetailFaktorLab: TLabel;
    DetailAufpreisLab: TLabel;
    DetailEKPreisLab: TLabel;
    Panel55: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel57: TPanel;
    PreisPC: TJvPageControl;
    PreisAlgTS: TTabSheet;
    PreisGrid: TJvStringGrid;
    PreisVKHisTS: TTabSheet;
    HistGrid: TOFDBGrid;
    LiefPreisTS: TTabSheet;
    ArtLiefPreisGrid: TOFDBGrid;
    Panel56: TPanel;
    PreisEKHisTS: TTabSheet;
    EKBestTS: TTabSheet;
    TabSheet6: TTabSheet;
    Memo1: TMemo;
    StueckListTS: TTabSheet;
    Panel60: TPanel;
    SchnellerfassungGB: TOFGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    SchnellArtnum: TEdit;
    SchnellBarcode: TEdit;
    SchnellMatchcode: TEdit;
    LiefTS: TTabSheet;
    PosTabMENGE_GELIEFERT: TFloatField;
    TeillieferungBtn: TToolButton;
    ToolButton8: TToolButton;
    ReEdiTabZAHLART_STR: TStringField;
    ReEdiTabLIEFART_STR: TStringField;
    ArtPreisTab: TZQuery;
    ArtPreisTabARTIKEL_ID: TIntegerField;
    ArtPreisTabADRESS_ID: TIntegerField;
    ArtPreisTabPREIS_TYP: TIntegerField;
    ArtPreisTabBESTNUM: TStringField;
    ArtPreisTabPREIS: TFloatField;
    ArtPreisTabINFO: TMemoField;
    ArtPreisTabGEAEND: TDateTimeField;
    ArtPreisTabGEAEND_NAME: TStringField;
    ArtPreisTabLieferantStr: TStringField;
    ArtPreisTabPREIS2: TFloatField;
    ArtPreisTabPREIS3: TFloatField;
    ArtPreisTabPREIS4: TFloatField;
    ArtPreisTabPREIS5: TFloatField;
    ArtPreisDS: TDataSource;
    DetailEKPreis: TDBEdit;
    DetailMenge: TDBEdit;
    DetailMengeLab: TLabel;
    DetailMEEinheit: TDBEdit;
    Label84: TLabel;
    DetailArtikelTyp: TLabel;
    StListGrid: TOFDBGrid;
    STListTab: TZQuery;
    STListTabREC_ID: TIntegerField;
    STListTabART_ID: TIntegerField;
    STListTabMENGE: TFloatField;
    STListTabERSTELLT: TDateField;
    STListTabERST_NAME: TStringField;
    STListTabGEAEND: TDateField;
    STListTabGEAEND_NAME: TStringField;
    STListTabARTNUM: TStringField;
    STListTabMATCHCODE: TStringField;
    STListTabBARCODE: TStringField;
    STListTabKURZNAME: TStringField;
    STListTabEK_PREIS: TFloatField;
    STListDS: TDataSource;
    DetailGPreis: TDBEdit;
    DetailGPreisB: TDBEdit;
    STListTabMENGE_AKT: TFloatField;
    LiefTab: TZQuery;
    LiefDS: TDataSource;
    LiefTabVLSNUM: TStringField;
    LiefTabLDATUM: TDateField;
    LiefTabLIEFART: TIntegerField;
    LiefTabKUN_NAME1: TStringField;
    LiefTabARTNUM: TStringField;
    LiefTabMENGE: TFloatField;
    LiefTabBEZEICHNUNG: TMemoField;
    LiefGrid: TOFDBGrid;
    LiefTabLIEFART_STR: TStringField;
    AddMengeEdi: TJvSpinEdit;
    Label94: TLabel;
    DetailVPELab: TLabel;
    DetailVPE: TDBEdit;
    freienArtikelhinzufgen1: TMenuItem;
    Texthinzufgen1: TMenuItem;
    DetailGPreisLab: TLabel;
    DetailGPreisBLab: TLabel;
    ReEdiTabGEWICHT: TFloatField;
    ReEdiTabROHGEWINN: TFloatField;
    DetailGewichtLab: TLabel;
    DetailGewichtEdi: TDBEdit;
    PosTabEK_PREIS: TFloatField;
    PosTabCALC_FAKTOR: TFloatField;
    DetailMEEinheitLab: TLabel;
    ToolButton5: TToolButton;
    Label78: TLabel;
    ReEdiTabSTADIUM_STR: TStringField;
    N6: TMenuItem;
    Teillieferung1: TMenuItem;
    Lieferscheinerstellen1: TMenuItem;
    Speichernundbuchen1: TMenuItem;
    StadiumCB: TJvDBComboBox;
    PosTabNO_RABATT_FLAG: TBooleanField;
    PossortierennachArtikelnummer1: TMenuItem;
    ReEdiTabCALC_SHOPSTATUS: TStringField;
    SumPan: TPanel;
    Label14: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Label55: TLabel;
    Label83: TLabel;
    Panel27: TPanel;
    DBText15: TDBText;
    Panel28: TPanel;
    DBText16: TDBText;
    Panel29: TPanel;
    DBText17: TDBText;
    Panel62: TPanel;
    DBText41: TDBText;
    PosKunDatPan: TPanel;
    KunDatGB2: TOFGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    DBText2: TDBText;
    Panel5: TPanel;
    DBText3: TDBText;
    Panel6: TPanel;
    DBText8: TDBText;
    Panel12: TPanel;
    DBText9: TDBText;
    Panel13: TPanel;
    DBText11: TDBText;
    Panel25: TPanel;
    DBText23: TDBText;
    FertigKundDatPan: TPanel;
    Suchen1: TMenuItem;
    N7: TMenuItem;
    RohgewLab2: TPanel;
    DBText10: TDBText;
    RohgewLab1: TLabel;
    PosTabGPREIS: TFloatField;
    PosTabG_RGEWINN: TFloatField;
    PosTabE_RABATT_BETRAG: TFloatField;
    PosTabG_RABATT_BETRAG: TFloatField;
    ReEdiTabNSUMME_0: TFloatField;
    ReEdiTabNSUMME_1: TFloatField;
    ReEdiTabNSUMME_2: TFloatField;
    ReEdiTabNSUMME_3: TFloatField;
    ReEdiTabBSUMME_0: TFloatField;
    ReEdiTabBSUMME_1: TFloatField;
    ReEdiTabBSUMME_2: TFloatField;
    ReEdiTabBSUMME_3: TFloatField;
    SNTabSNUM_ID: TIntegerField;
    PosTabBREITE: TStringField;
    PosTabHOEHE: TStringField;
    ReEdiTabCALC_NAME: TStringField;
    PosTabCALC_BPREIS: TFloatField;
    ReEdiTabSOLL_STAGE: TLargeintField;
    ReEdiTabSOLL_NTAGE: TLargeintField;
    PosTabVPE: TLargeintField;
    ArtPreisTabMENGE2: TLargeintField;
    ArtPreisTabMENGE3: TLargeintField;
    ArtPreisTabMENGE4: TLargeintField;
    ArtPreisTabMENGE5: TLargeintField;
    
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosMatchButtonClick(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure PosDelBtn1Click(Sender: TObject);
    procedure ReEdiTabAfterScroll(DataSet: TDataSet);
    procedure DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
    procedure ReEdiTabAfterPost(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ReEdiTabBeforeClose(DataSet: TDataSet);
    procedure PosTabBeforeEdit(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ReEdiTabOnNewRecord(DataSet: TDataSet);
    procedure PosTabNewRecord(DataSet: TDataSet);
    procedure PosTabAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure UpBtn1Click(Sender: TObject);
    procedure DownBtn1Click(Sender: TObject);
    procedure NeuKomBtnClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PosGridShowEditor(Sender: TObject; Field: TField;
    var AllowEdit: Boolean);
    procedure ReEdiTabBeforePost(DataSet: TDataSet);
    procedure ReEdiTabCalcFields(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure ReEdiTabBeforeDelete(DataSet: TDataSet);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure New1BtnClick(Sender: TObject);
    procedure Del1BtnClick(Sender: TObject);
    procedure GotoAllgBtnClick(Sender: TObject);
    procedure GotoAuswahlBtnClick(Sender: TObject);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure KuNrEditKeyPress(Sender: TObject; var Key: Char);
    procedure Kopieren1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LieferscheinBuchenBtnClick(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure KuNrEditEnter(Sender: TObject);
    procedure KuNrEditExit(Sender: TObject);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
    procedure PosGridApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure KFZIDCBButtonClick(Sender: TObject);
    procedure ReKFZTabAfterScroll(DataSet: TDataSet);
    procedure KFZAddrAssignClick(Sender: TObject);
    procedure KFZUebernehmenBtnClick(Sender: TObject);
    procedure KFZAddrEraseClick(Sender: TObject);
    procedure KFZNavZurueckBtnClick(Sender: TObject);
    procedure KFZNavVorBtnClick(Sender: TObject);
    procedure AtrisImport1Click(Sender: TObject);
    procedure EKBestellungerstellen1Click(Sender: TObject);
    procedure ReEdiListGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure EditSNBtn1Click(Sender: TObject);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure UmschaltungBruttoNetto1Click(Sender: TObject);
    procedure PrintPrevBtnClick(Sender: TObject);
    procedure AlgPan3Resize(Sender: TObject);
    procedure LiefAnschriftAuswahlBtnClick(Sender: TObject);
    procedure LiefAnschriftDelBtnClick(Sender: TObject);
    procedure PosDetailBtnClick(Sender: TObject);
    procedure DetailArtnumEnter(Sender: TObject);
    procedure DetailArtnumExit(Sender: TObject);
    procedure DetailArtnumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DetailArtnumKeyPress(Sender: TObject; var Key: Char);
    procedure PreisPCChange(Sender: TObject);
    procedure HisTabCalcFields(DataSet: TDataSet);
    procedure PreisPCResize(Sender: TObject);
    procedure DetailFaktorChange(Sender: TObject);
    procedure DetailRGWChange(Sender: TObject);
    procedure DetailEPreisChange(Sender: TObject);
    procedure DetailRGW_NRChange(Sender: TObject);
    procedure DetailEPreisRChange(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure SchnellArtnumKeyPress(Sender: TObject; var Key: Char);
    procedure SchnellArtnumExit(Sender: TObject);
    procedure TeillieferungBtnClick(Sender: TObject);
    procedure ArtPreisTabCalcFields(DataSet: TDataSet);
    procedure DetailRabattChange(Sender: TObject);
    procedure ReEdiListGridDrawColumnCell(Sender: TObject; const Rect: TRect;
              DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PosGridKeyPress(Sender: TObject; var Key: Char);
    procedure PossortierennachArtikelnummer1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure ReEdiTabBeforeEdit(DataSet: TDataSet);
    procedure ReEdiTabLockError(Error: Integer);
    procedure ReEdiListGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
  private
    { Private-Deklarationen}

    BelegArt     : Integer; // AGB, RE oder Lieferschein
    BelegArtStr  : String;
    BelegName    : String;

    Loading      : Boolean;
    AppendOK     : Boolean;
    LastF9       : Boolean;
    QueryTime    : DWord;

    LastTS       : tTabSheet;
    LastEdiID    : Integer;
    LastKunNum   : String;

    InDetailCalc : Boolean;
    //InDataChange : Boolean;
    InBuchung    : Boolean;
    
    UseKurztext  : Boolean;
    OldShopStatus: Integer;
    
    ListSortField: String;
    ListSortName : String;
    
    ArtInfoRefresh: Boolean;
    
    procedure OnAddArtikel(ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
    procedure UpdateLayout;
    function  AtrisImport: Boolean;
    procedure UpdateStatus;
    
    procedure SetSort (Index: Integer);
    
    procedure UpdateLieferanschrift;
    procedure UpdateArtikelDetails;
    procedure FindDialog1Find(Sender: TObject);
    procedure UpdateAnsprechpartner;
  public
    { Public-Deklarationen}
    First       : Boolean;
    
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure F9Change (Ein: Boolean);
    procedure SetAdresse (ID: Integer);
    procedure SetBelegArt(NewBelegArt: Integer);
  end;

var
  MakeVKReForm     : TMakeVKReForm; // Rechnung
  MakeAGBForm      : TMakeVKReForm; // Angebot
  {$IFDEF ALPHA}
  MakeVKAuftragForm: TMakeVKReForm; // Auftrag
  {$ENDIF}

implementation

uses
  GNUGetText,
  OF_DM, OF_Tool1, OF_Function, OF_Progress, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_LiefExport_Dlg, OF_TeilLieferDlg, OF_KFZ1, OF_SN_Auswahl,
  OF_Adressen_Lief, OF_DBGrid_Layout,
  OF_Artikel1, OF_Kunde;
  //OLD: ZSqlTypes,

{$R *.DFM}

const
  ArtInfoSqlS =
    'select ' +
    'A.REC_ID,A.EK_PREIS,' +
    'A.VK1,A.VK2,A.VK3,A.VK4,A.VK5,A.VK1B,A.VK2B,A.VK3B,A.VK4B,A.VK5B, ' +
    'AP.PREIS,AP.MENGE2,AP.PREIS2,AP.MENGE3,AP.PREIS3,AP.MENGE4,AP.PREIS4, ' +
    'AP.MENGE5,AP.PREIS5,A.MENGE_AKT,AB_EKBEST.SUM_MENGE as MENGE_BESTELLT, ' +
    'A.RABGRP_ID,AB_VKRE_EDI.SUM_MENGE as  MENGE_RESERVIERT, ' +
    'A.ALTTEIL_FLAG,A.NO_RABATT_FLAG,A.NO_PROVISION_FLAG,A.NO_BEZEDIT_FLAG,' +
    'A.NO_VK_FLAG,A.NO_EK_FLAG,A.SN_FLAG,A.PROVIS_PROZ,A.STEUER_CODE,' +
    'A.ERLOES_KTO,A.AUFW_KTO,' +
    'A.ARTNUM,A.ERSATZ_ARTNUM,A.MATCHCODE,A.WARENGRUPPE,A.BARCODE,A.ARTIKELTYP,' +
    'A.KAS_NAME,A.ME_EINHEIT,A.PR_EINHEIT,A.VPE,' +
    'A.LAENGE,A.BREITE,A.HOEHE,A.GROESSE,A.DIMENSION,A.GEWICHT,A.INFO,KURZNAME,' +
    'LANGNAME,AP.PREIS_TYP,AP.ADRESS_ID,AP.BESTNUM ';
  ArtInfoSQLW1 =
    ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, A.REC_ID as JID ' +
    'from ARTIKEL A ' +
    'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID ' +
    'left outer join ARTIKEL_BDATEN AB_EKBEST on AB_EKBEST.ARTIKEL_ID=A.REC_ID and AB_EKBEST.QUELLE=16 ' +
    'left outer join ARTIKEL_BDATEN AB_VKRE_EDI on AB_VKRE_EDI.ARTIKEL_ID=A.REC_ID and AB_VKRE_EDI.QUELLE=13 ' +
    'where A.REC_ID=:AID ' +
    'group by A.REC_ID, AP.PREIS_TYP, AP.ADRESS_ID';
  ArtInfoSQLW2 =
    ',SUM(JP2.MENGE) as MENGE_LIEF, JP1.MENGE as MENGE_SOLL, JP1.REC_ID as JID ' +
    'from JOURNALPOS JP1,ARTIKEL A ' +
    'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID ' +
    'left outer join JOURNALPOS JP2 USE INDEX (QUELLE_SRC) on JP2.QUELLE_SRC=JP1.REC_ID and JP2.QUELLE=2 ' +
    'left outer join ARTIKEL_BDATEN AB_EKBEST on AB_EKBEST.ARTIKEL_ID=A.REC_ID and AB_EKBEST.QUELLE=26 ' +
    'left outer join ARTIKEL_BDATEN AB_VKRE_EDI on AB_VKRE_EDI.ARTIKEL_ID=A.REC_ID and AB_VKRE_EDI.QUELLE=13 ' +
    'where (JP1.JOURNAL_ID=:JID) and (JP1.QUELLE=:QUELLE) and ' +
    '(JP1.ARTIKEL_ID=A.REC_ID) ' +
    'group by A.REC_ID, AP.PREIS_TYP, AP.ADRESS_ID, JP1.REC_ID';


//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  try
    TranslateComponent(self);
  except
  end;

  SetBelegArt(VK_RECH_EDI);

  for i := 0 to PC1.PageCount-1 do
    PC1.Pages[i].TabVisible := False;
  PreisPC.ActivePage := PreisPC.Pages[0];

  ToolButton8.Visible := BelegArt = VK_RECH_EDI;
  TeillieferungBtn.Visible := BelegArt = VK_RECH_EDI;

  OnUpdateStatusBar := nil;
  First             := True;
  AppendOK          := False;
  LastTS            := nil;
  LastEdiID         := -1;
  InDetailCalc      := False;
  InBuchung         := False;
  UseKurztext       := False; // Default = Langtext
  ArtInfoRefresh    := False;

  PreisGrid.Cells[0, 0] := '';
  PreisGrid.Cells[0, 1] := _('Preis');
  PreisGrid.Cells[0, 2] := _('Kundenpreis');
  PreisGrid.Cells[0, 3] := _('Aktionspreis');

  PreisGrid.Cells[1, 0] := _('Normalpreis');
  PreisGrid.Cells[2, 0] := _('Staffelpreis 2');
  PreisGrid.Cells[3, 0] := _('Staffelpreis 3');
  PreisGrid.Cells[4, 0] := _('Staffelpreis 4');
  PreisGrid.Cells[5, 0] := _('Staffelpreis 5');

  ListSortName  := _('Belegnummer');
  ListSortField := 'VRENUM, RDATUM';
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.SetBelegArt(NewBelegArt: Integer);
var
  i: integer; found: boolean;
begin
  BelegArt := NewBelegArt;
  case BelegArt of
    VK_RECH_EDI:
    begin
      BelegArtStr := 'RE_EDI';
      BelegName   := _('Rechnung');
      ReEdiTab.OFModulID := 2040;
    end;
    VK_AUF_EDI :
    begin
      BelegArtStr := 'AUF_EDI';
      BelegName   := _('Auftrag');

      //div. Buttons abschalten
      LieferscheinBuchenBtn.Visible := False;

      ToolButton8.Visible := False;
      TeillieferungBtn.Visible := False;
      Teillieferung1.Visible := False;
      Lieferscheinerstellen1.Visible := False;

      BuchenBtn.Caption := _('Speichern');
      Speichernundbuchen1.Caption := _('Speichern');

      try
        LiefTS.TabVisible := False;
      except
      end;

      EditSNBtn1.Visible := False;
      EditSNBtn2.Visible := False;

      if PosGrid.Columns.Count > 0 then
      begin
        repeat
          found := false;
          for i := 0 to PosGrid.Columns.Count-1 do
          begin
            if (uppercase(PosGrid.Columns[i].FieldName) = 'MENGE_GELIEFERT') or
               (uppercase(PosGrid.Columns[i].FieldName) = 'VLSNUM') then
            begin
              PosGrid.Columns[i].Free;
              Found := True;
              break;
            end;
          end;
        until found = False;
      end;

      ReEdiTab.OFModulID := 2020;
    end;
    VK_AGB_EDI :
    begin
      BelegArtStr := 'AGB_EDI';
      BelegName   := _('Angebot');
      //div. Buttons abschalten
      LieferscheinBuchenBtn.Visible := False;

      ToolButton8.Visible := False;
      TeillieferungBtn.Visible := False;
      Teillieferung1.Visible := False;
      Lieferscheinerstellen1.Visible := False;

      ToolButton6.Visible := False;
      BuchenBtn.Caption := _('Speichern');
      Speichernundbuchen1.Caption := _('Speichern');

      try
        LiefTS.TabVisible := False;
      except
      end;

      EditSNBtn1.Visible := False;
      EditSNBtn2.Visible := False;

      if PosGrid.Columns.Count > 0 then
      begin
        repeat
          found := false;
          for i := 0 to PosGrid.Columns.Count-1 do
          begin
            if (uppercase(PosGrid.Columns[i].FieldName) = 'MENGE_GELIEFERT') or
               (uppercase(PosGrid.Columns[i].FieldName) = 'VLSNUM') then
            begin
              PosGrid.Columns[i].Free;
              Found := True;
              break;
            end;
          end;
        until found = False;
      end;

      ReEdiTab.OFModulID := 2010;
    end;
  end{case};
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormActivate(Sender: TObject);
var
  i: Integer;
  Dummy   : Boolean;
  MyLastTS: tTabSheet;
begin
  MyLastTS := LastTS;
  QueryTime := GetTickCount;
  if First then
  begin
    First := False;

    PC1.ActivePage := EdiListTS;

    PR_EbeneCB.ComboProps.ComboItems.Clear;
    PR_EbeneCB.ComboProps.ComboValues.Clear;

    For i := 1 to DM1.AnzPreis do
    begin
      PR_EbeneCB.ComboProps.ComboItems.Add('VK' + Inttostr(i));
      PR_EbeneCB.ComboProps.ComboValues.Add(Inttostr(i));
    end;
    PR_EbeneCB.CreateDropDownList;


    if DM1.Use_KFZ then
    begin
      KFZGB.Align := alClient;
      KFZGB.Visible := True;
    end else
    begin
      KFZGB.Align := alNone;
      KFZGB.Visible := False;
    end;

    AlgPan3Resize(Sender);

    dm1.GridLoadLayout(TDBGrid(ReEdiListGrid), BelegArtStr + '_LISTE', 104);
    dm1.GridLoadLayout(TDBGrid(PosGrid), BelegArtStr + '_POS', 102);

    PosGrid.DefaultRowHeight := DM1.ReadIntegerU('', BelegArtStr + '_POS_ZH', PosGrid.DefaultRowHeight);
    PosGrid.LinesPerRow      := DM1.ReadIntegerU('', BelegArtStr + '_POS_ZZ', PosGrid.LinesPerRow);


    PosTabMATCH_ARTNUM.DisplayLabel := _('Suchbegriff') + #13#10 + _('Artikelnummer');

    PosGrid.RowColor1          := DM1.C2Color;
    ReEdiListGrid.RowColor1    := DM1.C2Color;
    ArtLiefPreisGrid.RowColor1 := DM1.C2Color;
    HistGrid.RowColor1         := DM1.C2Color;
    PosGrid.EditColor          := DM1.EditColor;
    StListGrid.RowColor1       := DM1.C2Color;
    LiefGrid.RowColor1         := DM1.C2Color;

    PC1.HintColor := Application.HintColor;

    Loading := False;

    ReEdiTabNSUMME.DisplayFormat    := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabMSUMME.DisplayFormat    := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabBSUMME.DisplayFormat    := ',#0.00 "' + DM1.LeitWaehrung + ' "';

    PosTabEPREIS.DisplayFormat      := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + ' "';
    PosTabEPREIS.EditFormat         := DM1.VK_EFormat;

    PosTabGPREIS.DisplayFormat      := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    PosTabCALC_BPREIS.DisplayFormat := ',#0.00 "' + DM1.Leitwaehrung + ' "';

    PosTabNSUMME.DisplayFormat      := ',#0.00 "' + DM1.LeitWaehrung + ' "';

    PosTabE_RGEWINN.DisplayFormat   := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + ' "';
    PosTabG_RGEWINN.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + ' "';

    PosTabEK_Preis.DisplayFormat    := DM1.EK_DFormat + ' "' + DM1.LeitWaehrung + ' "';
    PosTabEK_Preis.EditFormat       := DM1.EK_EFormat;

    UseKurztext := DM1.ReadBoolean('MAIN\BELEGE', 'KURZTEXT_VERWENDEN', UseKurztext);
  end;

  DM1.ArtInfoTab.Close;
  DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;

  PosTab.ParamByName('ID').Value := -1;
  SetSort(1);
  if not PosTab.Active then
    PosTab.Open;

  ButtonPan.Visible      := ReEdiTab.RecordCount>0;
  ReEdiBtn.Enabled       := ReEdiTab.RecordCount>0;
  BelDelBtn.Enabled      := ReEdiTab.RecordCount>0;
  Del1Btn.Enabled        := ReEdiTab.RecordCount>0;
  Allgemein1.Enabled     := ReEdiTab.RecordCount>0;
  Positionen1.Enabled    := ReEdiTab.RecordCount>0;
  PosDetails1.Enabled    := ReEdiTab.RecordCount>0;
  Fertigstellen1.Enabled := ReEdiTab.RecordCount>0;

  if DM1.VertreterTab.Active then
    DM1.VertreterTab.Close;
  DM1.VertreterTab.Open;

  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);

  if LastEdiID <> -1 then
  begin
    ReEdiTab.Locate('REC_ID', LastEdiID, []);
    ReEdiTabAfterScroll(nil);
  end;

  PC1Changing(Sender, Dummy);
  if assigned(MyLastTS) then
    PC1.ActivePage := MyLastTS;
  PC1Change(Sender);

  if (PC1.ActivePage = EdiListTS) and (ReEdiListGrid.Visible) then
  begin
    try
      ReEdiListGrid.SetFocus;
    except
    end;
  end;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormDeactivate(Sender: TObject);
begin
  LastTS := PC1.ActivePage;

  PC1Change(Sender);
  if assigned(MainForm.ArtForm) then
    MainForm.ArtForm.FormDeactivate (Sender);

  LastEdiID := ReEdiTabRec_ID.AsInteger;
  ReEdiTab.Close;
  PosTab.Close;
  DM1.ReKunTab.Close;
  DM1.ArtInfoTab.Close;
  ReKFZTab.Close;
  SNTab.Close;
  ArtPreisTab.Close;
  STListTab.Close;
  LiefTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.Aktualisieren1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then
  begin
    ReEdiTab.Refresh;
  end else
  begin
    if (PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS) then
    begin
      DM1.ArtInfoTab.Refresh;
      PosTab.Refresh;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabCalcFields(DataSet: TDataSet);
var
  Summe  : Double;
  Steuer : Double;
  S      : String;
begin
  Summe := PosTabEPreis.Value * PosTabMenge.Value;
  if PosTabRabatt.Value <> 0 then
    Summe := Summe - Summe * PosTabRabatt.Value / 100;

  summe := CAO_Round(Summe * 100) / 100;

  Case PosTabSteuer_Code.Value of
    0: Steuer := ReEdiTabMwst_0.Value;
    1: Steuer := ReEdiTabMwst_1.Value;
    2: Steuer := ReEdiTabMwst_2.Value;
    3: Steuer := ReEdiTabMwst_3.Value;
    else Steuer := 0;
  end;

  PosTabCALC_STEUERPROZ.AsFloat := Steuer;

  if not ReEdiTabBrutto_Flag.AsBoolean then
  begin
    PosTabNSumme.Value := Summe;
    PosTabCALC_BPREIS.AsFloat := CAO_round_nk(PosTabGPreis.AsFloat * (100 + Steuer) / 100, 2); // Auf ganze Pfennige Runden
  end else
  begin
    PosTabNSumme.Value := Summe - CAO_round_nk(Summe / (100 + Steuer) * Steuer, 2);
    PosTabCALC_BPREIS.AsFloat := PosTabGPreis.AsFloat;
  end;

  if (ReEdiTabMWST_FREI_FLAG.AsBoolean = False) and (Steuer <> 0) then
    PosTabMwst.Value := FormatFloat ('0.0"%"', Steuer)
  else
    PosTabMwst.Value := '-';

  if (PosTabArtikelTyp.Value = 'N') or
     (PosTabArtikelTyp.Value = 'L') or
     (PosTabArtikelTyp.Value = 'K') or
     (PosTabArtikelTyp.Value = 'S') then
  begin
    PosTabMATCH_ARTNUM.Value := PosTabMATCHCODE.AsString + #13#10 +
    PosTabARTNUM.AsString;
  end else
  if PosTabARTIKELTYP.Value = 'F' then
  begin
    PosTabMATCH_ARTNUM.Value := _('freier Artikel') + #13#10 +
      PosTabMatchCode.Value + #13#10 +
    PosTabArtNum.Value;;
  end else
    PosTabMATCH_ARTNUM.Value := '';

  if (PosTabArtikelTyp.Value <> 'F') and
     (PosTabArtikelTyp.Value <> 'T') and
     (PosTabArtikelTyp.Value <> '') and
     (PosTabArtikel_ID.Value > 0) and
     (not Loading) and
     (DM1.ArtInfoTab.Active) then
  begin
    if (DM1.ArtInfoTab.RecordCount > 0) and
       (DM1.ArtInfoTab.Locate ('REC_ID;JID', VarArrayof ([PosTabArtikel_ID.Value, PosTabRec_ID.AsInteger]), [])) then
    begin
      if (PosTabArtikelTyp.AsString = 'N') or
         (PosTabArtikelTyp.AsString = 'S') then
      begin
        S := _('Lager') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMenge_AKT.Value);
        if DM1.ArtInfoTabMENGE_BESTELLT.Value > 0 then
          S := S + ' ' + _('Bestellt') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMENGE_BESTELLT.AsFloat);

        S := S + ' ' + _('Benötigt') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMENGE_RESERVIERT.AsFloat);
      end else
        S := '';

      PosTabCalc_Lagermenge_Str.Value := S;
      PosTabCalc_Lagermenge.Value := DM1.ArtInfoTabMenge_AKT.Value;
      //PosTabCalc_RGewinn.Value :=PosTabNSumme.Value -
      //                           PosTabEK_Preis.Value * PosTabMenge.Value;

      PosTabMenge_Geliefert.AsFloat := DM1.ArtInfoTabMENGE_LIEF.AsFloat;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforePost(DataSet: TDataSet);
var
  //PR : Doubl;
  Summe, EP_Netto: Double;
begin
  DetailArtnumExit(nil);
  if PosTabArtikel_ID.Value = 0 then
  begin
    try
      Abort;
    finally
      PosTab.Cancel;
    end;
  end;
  if (PosTabArtikelTyp.Value = 'T') then
  begin
    PosTabMenge.Value       := 0;
    PosTabME_EInheit.Value  := '';
    PosTabPR_Einheit.Value  := 0;

    PosTabEPreis.Value      := 0;
    PosTabGPREIS.Value      := 0;

    PosTabE_RGewinn.Value   := 0;
    PosTabG_RGewinn.Value   := 0;

    PosTabE_RABATT_BETRAG.Value := 0;
    PosTabG_RABATT_BETRAG.Value := 0;

    PosTabRabatt.Value      := 0;
    PosTabSteuer_Code.Value := 0;
    PosTabGewicht.Value     := 0;

    PosTabCALC_FAKTOR.Value := 0;

    PosTabEK_Preis.Value    := 0;

    PosTabVPE.AsInteger     := 0;
  end else
  begin
    if PosTabMenge.Value = 0 then
    begin
      PosTabE_RGEWINN.Value := 0;
      PosTabG_RGEWINN.Value := 0;

      PosTabGPREIS.Value    := 0;

      PosTabE_RABATT_BETRAG.Value := 0;
      PosTabG_RABATT_BETRAG.Value := 0;
    end else
    begin
      //PR :=PosTabEPreis.Value;
      //PR :=cao_round((PR - (PR * PosTabRabatt.Value /100))*100) / 100;
      //PosTabE_RGewinn.Value :=CAO_Round((PR - PosTabEK_Preis.AsFloat)*100)/100;

      PosTabG_RGEWINN.Value := CAO_Round((PosTabNSumme.Value - PosTabEK_Preis.Value * PosTabMenge.Value) * 100) / 100;
      PosTabE_RGewinn.Value := cao_round_nk (PosTabG_RGEWINN.Value / PosTabMenge.Value, DM1.VK_NACHKOMMA);

      Summe := PosTabEPreis.Value * PosTabMenge.Value;
      if PosTabRabatt.Value <> 0 then
        Summe := Summe - Summe * PosTabRabatt.Value / 100;

      PosTabGPREIS.Value := Summe;

      PosTabG_RABATT_BETRAG.Value := cao_round((PosTabEPreis.Value * PosTabMenge.Value - Summe) * 100) / 100;
      PosTabE_RABATT_BETRAG.Value := cao_round(PosTabG_RABATT_BETRAG.Value / PosTabMenge.Value * 100) / 100;

    end;

    if PosTabEK_Preis.Value = 0 then
      PosTabCALC_FAKTOR.Value := 0
    else
    begin
      if ReEdiTabBrutto_Flag.AsBoolean then
        EP_Netto := PosTabEPreis.Value / (100 + PosTabCALC_STEUERPROZ.Value) * 100
      else
        EP_Netto := PosTabEPreis.Value;

      PosTabCALC_FAKTOR.Value := cao_round(EP_Netto / PosTabEK_Preis.Value * 100000) / 100000; // max.5 NK
    end;
  end;

  { TODO : Der vergleich von PosTabMenge.Value zu ..OldValue ist nicht mehr möglich. Überarbeiten! }
  (*
  if PosTabMenge.Value <> PosTabMenge.OldValue then
  begin
    PosTabVLSNum.AsString := '';
    ArtInfoRefresh := True;
  end;
  *)

  // Provision berechnen
  if PosTabPROVIS_PROZ.AsFloat <> 0 then
  begin
    PosTabPROVIS_WERT.AsFloat := CAO_Round(PosTabNSumme.AsFloat / 100 *
      PosTabPROVIS_PROZ.AsFloat * 100) / 100;
  end else
    PosTabPROVIS_WERT.AsFloat := 0;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.OnAddArtikel(ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
var
  PR: Double; Error: Boolean;
begin
  Error := False;

  //wird vom Artikelstamm aufgerufen
  DM1.ArtInfoTab.Close;
  DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW1;
  DM1.ArtInfoTab.ParamByName ('AID').AsInteger := ID;
  DM1.ArtInfoTab.Open;

  if (
     // Entweder Kundenpreis
     (DM1.ArtInfoTab.Locate ('REC_ID;PREIS_TYP;ADRESS_ID', VarArrayOF([ID, 3, ReEdiTabAddr_ID.AsInteger]), []))or
     (DM1.ArtInfoTab.Locate ('REC_ID', ID, []))
     ) and
    (DM1.ArtInfoTabRec_ID.AsInteger = ID) and
    (DM1.ArtInfoTabNo_VK_Flag.Value = False) then
  begin
    AppendOK := True;
    try
      Loading := True;
      PosTab.Append;

      PosTabJournal_ID.Value      := ReEdiTabREC_ID.Value;
      PosTabQuelle.Value          := ReEdiTabQuelle.Value;
      PosTabQuelle_Sub.Value      := ReEdiTabQuelle_Sub.Value;
      //PosTabJahr.Value            :=ReEdiTabJahr.Value;
      PosTabAddr_ID.Value         := ReEdiTabADDR_ID.Value;
      PosTabVRENUM.Value          := ReEdiTabVRENUM.Value;
      PosTabVLSNUM.Value          := '';
      PosTabATRNum.Value          := -1;

      PosTabArtikel_ID.Value      := DM1.ArtInfoTabREC_ID.Value;
      PosTabArtikelTyp.Value      := DM1.ArtInfoTabArtikelTyp.Value;

      PosTabArtNum.Value          := DM1.ArtInfoTabArtnum.Value;

      PosTabMatchCode.Value       := DM1.ArtInfoTabMatchCode.Value;
      PosTabBarCode.Value         := DM1.ArtInfoTabBarCode.Value;

      if UseKurztext then
        PosTabBezeichnung.AsString  := DM1.ArtInfoTabKURZNAME.AsString
      else
        PosTabBezeichnung.AsString  := DM1.ArtInfoTabLangName.AsString;

      PosTabLaenge.Value          := DM1.ArtInfoTabLaenge.Value;
      PosTabBreite.Value          := DM1.ArtInfoTabBreite.Value;
      PosTabHoehe.Value           := DM1.ArtInfoTabHoehe.Value;
      PosTabGroesse.Value         := DM1.ArtInfoTabGroesse.Value;
      PosTabDimension.Value       := DM1.ArtInfoTabDimension.Value;
      PosTabGewicht.Value         := DM1.ArtInfoTabGewicht.Value;
      PosTabME_Einheit.Value      := DM1.ArtInfoTabME_Einheit.Value;
      PosTabPR_Einheit.Value      := DM1.ArtInfoTabPR_Einheit.Value;
      PosTabSN_Flag.AsBoolean     := DM1.ArtInfoTabSN_Flag.AsBoolean;

      PosTabNO_RABATT_FLAG.Value  := DM1.ArtInfoTabNO_RABATT_FLAG.Value;
      if (PosTabNO_RABATT_FLAG.Value = False) and
         (DM1.ArtInfoTabADRESS_ID.AsInteger<>ReEdiTabAddr_ID.AsInteger) then //bei Kundenpreisen keinen Rabatt zusätzlich
        PosTabRabatt.Value    := ReEdiTabGlobRabatt.Value
      else
        PosTabRabatt.Value    := 0;

      PosTabSteuer_Code.Value     := DM1.ArtInfoTabSteuer_Code.Value;
      PosTabAltteil_Flag.Value    := DM1.ArtInfoTabAltTeil_Flag.Value;
      PosTabALTTEIL_PROZ.Value    := 0.1; // 10%
      PosTabALTTEIL_STCODE.Value  := DM1.ArtInfoTabSteuer_Code.Value;
      PosTabBEZ_FEST_Flag.Value   := DM1.ArtInfoTabNO_BEZEDIT_Flag.Value;

      PosTabGEGENKTO.Value        := DM1.ArtInfoTabErloes_Kto.Value;
      PosTabVPE.Value             := DM1.ArtInfoTabVPE.AsInteger;

      if not DM1.ArtInfoTabNO_PROVISION_FLAG.AsBoolean then
      begin
        if DM1.ArtInfoTabPROVIS_PROZ.AsFloat <> 0 then
          PosTabPROVIS_PROZ.AsFloat := DM1.ArtInfoTabPROVIS_PROZ.AsFloat
        else
          PosTabPROVIS_PROZ.AsFloat := DM1.GetVertreterProv (ReEdiTabVERTRETER_ID.AsInteger);
      end;

      // wenn Kundenpreis, dann Artikelnummer übernehmen wenn gesetzt
      if (length(DM1.ArtInfoTabBestnum.AsString) > 0) and
         (DM1.ArtInfoTabADRESS_ID.AsInteger = ReEdiTabAddr_ID.AsInteger) then
      begin
        PosTabArtnum.AsString := DM1.ArtInfoTabBESTNUM.AsString;
      end;

      PosTabMenge.Value := CAO_Round(Menge * 100) / 100;


      if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
           ReEdiTabADDR_ID.AsInteger,
           ReEdiTabPR_Ebene.Value,
           ReEdiTabBRUTTO_FLAG.AsBoolean,
           PosTabMenge.AsFloat,
           PR) then
        PosTabEPreis.Value := PR;
      // EK laden
      if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
           -1,
           0{EK},
           False,
           PosTabMenge.AsFloat,
           PR) then
        PosTabEK_Preis.Value := PR;

      PosTab.Post;
    except
      PosTab.Cancel;
      Error := True;
    end;

    if (not Error) and (PosTabArtikelTyp.AsString = 'S') then
      DM1.InsertStuecklistenArtikel(ReEdiTabRec_ID.AsInteger, PosTabRec_ID.AsInteger,
        PosTabArtikel_ID.AsInteger,
        ReEdiTabAddr_ID.AsInteger,
        ReEdiTabQuelle.AsInteger,
        PosTabMenge.AsFloat,
        ReEdiTabVRENUM.AsString
      );

    Loading := False;
    AppendOK := False;

    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger := BelegArt;
    DM1.ArtInfoTab.Open;

    PosTab.Refresh;
  end else
  if (DM1.ArtInfoTabRec_ID.AsInteger = ID) and
     (DM1.ArtInfoTabNo_VK_Flag.Value = True) then
  begin
    MessageBeep(0);
    MessageDlg (_('Dieser Artikel hat eine Verkaufssperre' + #13#10 +
    'und kann deshalb nicht verwendet werden !'),
    mterror, [mbok], 0);

    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger := BelegArt;
    DM1.ArtInfoTab.Open;
  end else
  begin
    // Hier Fehler, Artikel nicht gefunden !!!
    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.ParamByName ('QUELLE').AsInteger := BelegArt;
    DM1.ArtInfoTab.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosMatchButtonClick(Sender: TObject);
begin
  if not Assigned(MainForm.ArtForm) then
  begin
    MainForm.ArtForm := TArtikelForm.Create(Self);
    MainForm.ArtForm.BorderStyle := bsSizeable;
    MainForm.ArtForm.Width  := 660;
    MainForm.Artform.Height := 520;
    MainForm.Artform.Left := MainForm.Left + 90;
    MainForm.Artform.Top  := MainForm.Top + 10;

    MainForm.Artform.MainMenu1.Images       := MainForm.ImageList1;
    MainForm.Artform.ArtikelToolBar1.Images := MainForm.ImageList1;
    MainForm.Artform.Toolbar2.Images        := MainForm.ImageList1;

    MainForm.ArtForm.OnAddArtikel := OnAddArtikel;
    MainForm.ArtForm.AddMengeEdi.Value := 1;

    MainForm.ArtForm.Invalidate;
  end;
  MainForm.ArtForm.F9Change(MainForm.F9);
  MainForm.ArtForm.OnAddArtikel := OnAddArtikel;
  MainForm.ArtForm.ShowModal;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosDelBtn1Click(Sender: TObject);
begin
  PC1Change(Sender);
  PosTab.Delete;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
begin
  ReEdiTabAfterPost (nil);

  try
    if ReEdiTabKUN_NUM.IsNull then
      LastKunNum := ''
    else
      LastKunNum := ReEdiTabKUN_NUM.AsString;
  except
    LastKunNum := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
  BelDelBtn.Enabled := ReEdiTab.RecordCount > 0;
  Del1Btn.Enabled := ReEdiTab.RecordCount > 0;

  // KFZ's aktualisieren
  if (PC1.ActivePage <> EdiListTS) and (DM1.Use_KFZ) and
     ((ReKFZTab.ParamByName('AID').asInteger <> ReEdiTabADDR_ID.AsInteger) or
     (ReKFZTab.Active = False)) then
  begin
    if  ReKFZTab.Active then
      ReKFZTab.Close;
    ReKFZTab.ParamByName ('KID').asInteger := ReEdiTabKFZ_ID.AsInteger;
    ReKFZTab.ParamByName ('AID').asInteger := ReEdiTabADDR_ID.AsInteger;
    ReKFZTab.Open;
    ReKFZTab.Locate ('KFZ_ID', ReEdiTabKFZ_ID.AsInteger, []);
  end;

  //Ansprechpartner in Drop-Down-Liste laden
  //nur Ausführen wenn ein Belegwechsel stattgefunden hat
  if (PC1.ActivePage <> EdiListTS) and
     (PosTab.ParamByName('ID').Value <> ReEdiTabREC_ID.Value) then
  begin
    UpdateAnsprechpartner;
  end;

  if (PC1.ActivePage <> EdiListTS) then
    UpdateLieferanschrift;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then 
    PC1.ActivePage := AdressTS;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DBGrid1DblClick(Sender: TObject);
var 
  Dummy: Boolean;
begin
  if ReEdiTab.RecordCount = 0 then 
    exit;

  if not ReEdiTab.SetLock then 
    exit;

  PC1Changing (Sender, Dummy);

  if ReEdiTabAddr_ID.Value<0 then 
    PC1.ActivePage := AdressTS
  else 
    PC1.ActivePage := PosTS;

  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
begin
  if DataSet.State in [dsEdit, dsInsert] then
  begin
    try
      DataSet.Post;
    except
      Dataset.Cancel;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforeEdit(DataSet: TDataSet);
begin
  try
    ReEdiTab.Edit;
    // Wenn hier ein fehler auftritt, dann ist evtl. der
    // Datenssatz durch anderen Anwender gesperrt !!!
  except
    Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.FormCloseQuery(Sender: TObject;
var CanClose: Boolean);
begin
  PosTab.Close;
  ReEdiTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
begin
  ReEdiTabQuelle.Value     := BelegArt;
  ReEdiTabQUELLE_SUB.Value := 0;
  ReEdiTabVLSNUM.Value     := '';
  ReEdiTabATRNUM.Value     := -1;
  ReEdiTabGegenKonto.Value := -1;
  ReEdiTabADDR_ID.Value    := -1;
  ReEdiTabRDatum.Value     := Trunc (Now);
  ReEdiTabLDatum.Value     := 0;
  ReEdiTabADatum.Value     := 0;
  ReEdiTabPR_Ebene.Value   := DM1.AnzPreis;
  ReEdiTabKOST_NETTO.Value := 0;
  ReEdiTabWERT_NETTO.Value := 0;
  ReEdiTabLOHN.Value       := 0;
  ReEdiTabWARE.Value       := 0;
  ReEdiTabTKOST.Value      := 0;
  ReEdiTabNSUMME.Value     := 0;
  ReEdiTabMSUMME.Value     := 0;
  ReEdiTabBSUMME.Value     := 0;
  ReEdiTabATMSUMME.Value   := 0;
  ReEdiTabWaehrung.Value   := DM1.LeitWaehrung;
  ReEdiTabFolgeNr.Value    := -1;
  ReEdiTabKM_Stand.Value   := -1;
  ReEdiTabKFZ_ID.Value     := -1;
  ReEdiTabVertreter_ID.Value := -1;
  ReEdiTabGlobRabatt.Value := 0;
  ReEdiTabWV_Datum.Value   := 0;
  ReEdiTabLiefart.Value    := -1;
  ReEdiTabZahlArt.Value    := -1;
  ReEdiTabLIEF_ADDR_ID.AsInteger  := -1;

  ReEdiTabErstellt.Value  := now;
  ReEdiTabERST_NAME.Value := dm1.View_User;

  ReEdiTabMWST_0.Value     := DM1.MWSTTab[0];
  ReEdiTabMWST_1.Value     := DM1.MWSTTab[1];
  ReEdiTabMWST_2.Value     := DM1.MWSTTab[2];
  ReEdiTabMWST_3.Value     := DM1.MWSTTab[3];

  LastKunNum               := '';

  if (ReEdiTab.State in [dsEdit, dsInsert]) then
  begin
    try
      ReEdiTab.Post;
    except
      ReEdiTab.Cancel;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabNewRecord(DataSet: TDataSet);
begin
  PosTabJournal_ID.Value  := ReEdiTabRec_ID.Value;
  PosTabQuelle.Value      := ReEdiTabQuelle.Value;
  PosTabQuelle_Sub.Value  := ReEdiTabQuelle_Sub.Value;
  //PosTabJahr.Value        :=ReEdiTabJahr.Value;
  PosTabAddr_ID.Value     := ReEdiTabAddr_ID.Value;
  PosTabVRENUM.Value      := ReEdiTabVRENUM.Value;
  PosTabRabatt.Value      := ReEdiTabGlobRabatt.Value;
  PosTabPosition.Value    := PosTab.RecordCount + 1;
  PosTabE_RGewinn.Value   := 0;
  PosTabG_RGewinn.Value   := 0;
  PosTabBrutto_Flag.Value := ReEdiTabBRUTTO_FLAG.Value;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabAfterScroll(DataSet: TDataSet);
var 
  T: Char;
begin
  PosTabMenge.ReadOnly := PosTabArtikelTyp.AsString = 'T';

  if (Assigned(POsGrid.DBMemo))and
     (PosGrid.DBMemo.Visible) and
     (PosGrid.DBMemo.Focused)  then
  begin
    PosGrid.OnDBExit(Self);
  end;

  PosTabRabatt.ReadOnly := PosTabNO_RABATT_FLAG.Value;
  PosTabEPreis.ReadOnly := PosTabArtikelTyp.AsString = 'T';
  PosTabBezeichnung.ReadOnly := PosTabBEZ_FEST_FLAG.AsBoolean;

  if PosTab.ControlsDisabled then 
    exit;

  UpdateLayout;
  UpdateStatus;

  PosDelBtn1.Enabled := (PosTab.RecordCount > 0) and ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS));
  PosDelBtn2.Enabled := (PosTab.RecordCount > 0) and ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS));

  Positionlschen1.Enabled := (PosTab.RecordCount > 0) and ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS));

  EditSNBtn1.Enabled := (PosTab.RecordCount > 0) and (PosTabSN_Flag.AsBoolean = True) and (PosTabMenge.AsFloat >= 1);
  EditSNBtn2.Enabled := EditSNBtn1.Enabled;

  if Length(PosTabArtikelTyp.AsString) > 0 then 
    T := PosTabArtikelTyp.AsString[1]
  else 
    T := #0;

  case T of
    'N': DetailArtikelTyp.Caption := _('normaler Artikel');
    'S': DetailArtikelTyp.Caption := _('Artikel m. Stückliste');
    'L': DetailArtikelTyp.Caption := _('Lohn');
    'K': DetailArtikelTyp.Caption := _('Transportkosten');
    'T': DetailArtikelTyp.Caption := _('Text');
    'F': DetailArtikelTyp.Caption := _('freier Artikel');
  end;

  DetailArtNumLab.Enabled  := T <> 'T';
  DetailMatchLab.Enabled   := T <> 'T';
  DetailBarcodeLab.Enabled := T <> 'T';
  DetailGewichtLab.Enabled := T <> 'T';
  DetailVPELab.Enabled     := T <> 'T';
  DetailArtnum.Enabled     := T <> 'T';
  DetailMatch.Enabled      := T <> 'T';
  DetailBarcode.Enabled    := T <> 'T';
  DetailGewichtEdi.Enabled := T <> 'T';
  DetailVPE.Enabled        := T <> 'T';
end;                               

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpBtn1Click(Sender: TObject);
var 
  CurrPos, Pos: Integer;
begin
  PC1Change(Sender);
  UpBtn1.Enabled := False;
  UpBtn2.Enabled := False;
  PosTab.DisableControls;
  try
    Pos := PosTabPosition.Value;
    if PosTab.State in [dsEdit, dsInsert] then
      PosTab.Post;
    CurrPos := PosTab.RecNo;
    if CurrPos = 1 then 
      exit;
    PosTab.Prior;
    PosTab.Edit;
    PosTabPosition.Value := CurrPos;
    PosTab.Post;
    PosTab.Next;
    PosTab.Edit;
    PosTabPosition.Value := CurrPos-1;
    PosTab.Post;
    PosTab.Refresh;
    PosTab.Locate ('POSITION', variant(Pos-1), []);
  finally
    PosTab.EnableControls;
    UpBtn1.Enabled := True;
    UpBtn2.Enabled := True;
  end;
  PosTabAfterScroll(nil);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DownBtn1Click(Sender: TObject);
var 
  CurrPos, Pos: Integer;
begin
  PC1Change(Sender);
  PosTab.DisableControls;
  DownBtn1.Enabled := False;
  DownBtn2.Enabled := False;
  try
    Pos := PosTabPosition.Value;
    if PosTab.State in [dsEdit, dsInsert] then 
      PosTab.Post;
    CurrPos := PosTab.RecNo;
    if CurrPos = PosTab.RecordCount then 
      exit;
    PosTab.Next;
    PosTab.Edit;
    PosTabPosition.Value := CurrPos;
    PosTab.Post;
    PosTab.Prior;
    PosTab.Edit;
    PosTabPosition.Value := CurrPos + 1;
    PosTab.Post;
    PosTab.Refresh;
    PosTab.Locate ('POSITION', variant (Pos + 1), []);
  finally
    PosTab.EnableControls;
    DownBtn1.Enabled := True;
    DownBtn2.Enabled := True;
  end;
  PosTabAfterScroll(nil);
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateLayout;
begin
  UpBtn1.Enabled := PosTab.RecNo>1;
  UpBtn2.Enabled := PosTab.RecNo>1;
  DownBtn1.Enabled := PosTab.RecNo<PosTab.RecordCount;
  DownBtn2.Enabled := PosTab.RecNo<PosTab.RecordCount;

  InfoEKLab.Visible  := (PosTab.RecordCount > 0) and (PosTabArtikelTyp.AsString <> 'T');
  InfoEK.Visible     := (PosTab.RecordCount > 0) and (PosTabArtikelTyp.AsString <> 'T');
  InfoRGWLab.Visible := (PosTab.RecordCount > 0) and (PosTabArtikelTyp.AsString <> 'T');
  InfoRGW.Visible    := (PosTab.RecordCount > 0) and (PosTabArtikelTyp.AsString <> 'T');
end;                                                                               

//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuArtBtnClick(Sender: TObject);
begin
  PC1Change(Sender);
  PosMatchButtonClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuFrArtBtnClick(Sender: TObject);
var 
  i: integer;
begin
  PC1Change(Sender);

  AppendOK := True;
  try
    Loading := True;

    PosTab.Append;

    PosTabArtikelTyp.Value := 'F';
    PosTabArtikel_ID.Value := - 99;
    PosTabMatchCode.Value  := PosTabArtNum.Value;

    PosTabBarCode.Value    := '';

    PosTabLaenge.Value          := '';
    PosTabGroesse.Value         := '';
    PosTabDimension.Value       := '';
    PosTabGewicht.Value         := 0;
    PosTabME_Einheit.Value      := _('Stück');
    PosTabPR_Einheit.Value      := 1;
    PosTabMenge.Value           := 1;

    PosTabEPreis.Value          := 0;
    PosTabGPREIS.Value          := 0;

    PosTabRabatt.Value          := 0;
    PosTabVPE.Value             := 0;

    PosTabGEGENKTO.Value        := DM1.ReadInteger ('MAIN\KONTEN', 'DEF_ERLOESKTO', 8400);

    PosTabBEZ_FEST_Flag.Value   := False;
    PosTabSteuer_Code.Value     := DM1.DefMwStCD;
    PosTabAltteil_Flag.Value    := False;
    PosTabALTTEIL_PROZ.Value    := 0.1;
    PosTabALTTEIL_STCODE.Value  := DM1.DefMwStCD;
    UpdateLayout;

    PosTab.Post;
  except
    PosTab.Cancel;
  end;
  Loading := False;
  AppendOK := False;

  try 
    PosGrid.SetFocus; 
  except 
  end;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.NeuKomBtnClick(Sender: TObject);
var 
  i: integer;
begin
  PC1Change(Sender);

  AppendOK := True;
  try
    Loading := True;

    PosTab.Append;

    PosTabArtikelTyp.Value := 'T';
    PosTabArtikel_ID.Value := - 99;
    PosTabMatchCode.Value  := PosTabArtNum.Value;


    PosTabBarCode.Value    := '';

    PosTabLaenge.Value          := '';
    PosTabGroesse.Value         := '';
    PosTabDimension.Value       := '';
    PosTabGewicht.Value         := 0;
    PosTabME_Einheit.Value      := '';
    PosTabPR_Einheit.Value      := 1;
    PosTabMenge.Value           := 0;

    PosTabEPreis.Value          := 0;
    PosTabGPREIS.Value          := 0;

    PosTabRabatt.Value          := 0;
    PosTabGEGENKTO.Value        := -1;
    PosTabBEZ_FEST_Flag.Value   := False;
    PosTabSteuer_Code.Value     := 0;
    PosTabAltteil_Flag.Value    := False;
    PosTabALTTEIL_PROZ.Value    := 0;
    PosTabALTTEIL_STCODE.Value  := 0;

    UpdateLayout;

    PosTab.Post;
  except
    PosTab.Cancel;
  end;
  Loading := False;
  AppendOK := False;

  try 
    PosGrid.SetFocus; 
  except 
  end;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.SetAdresse (ID: Integer);
begin
  DM1.ReKunTab.Close;
  DM1.ReKunTab.ParamByName('ID').AsInteger := ID;
  DM1.ReKunTab.Open;

  if DM1.ReKunTab.RecordCount = 1 then
  begin
    if //(DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean) and
       (ReEdiTabBRUTTO_FLAG.Value<>DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean) then 
      UmschaltungBruttoNetto1Click(Self);

    if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
      ReEdiTab.Edit;

    ReEdiTabADDR_ID.Value := DM1.ReKunTab.FieldByName('Rec_ID').AsInteger;

    if (DM1.ReKunTab.FieldByName('PR_EBENE').Value > 0) and 
       (DM1.ReKunTab.FieldByName('PR_EBENE').Value <= DM1.AnzPreis) then  
      ReEdiTabPR_EBENE.Value := DM1.ReKunTab.FieldByName('PR_EBENE').Value;

    ReEdiTabSOLL_STAGE.Value := DM1.ReKunTab.FieldByName('NET_Tage').AsInteger;
    ReEdiTabSOLL_SKONTO.Value := DM1.ReKunTab.FieldByName('Net_Skonto').AsFloat;
    ReEdiTabSOLL_NTAGE.Value := DM1.ReKunTab.FieldByName('BRT_Tage').AsInteger;
    ReEdiTabSOLL_RATEN.Value := 1;
    ReEdiTabSOLL_RATBETR.Value := 0;
    ReEdiTabSOLL_RATINTERVALL.Value := 1;
    
    ReEdiTabKUN_ANREDE.Value    := DM1.ReKunTab.FieldByName('Anrede').AsString;
    ReEdiTabKUN_NAME1.Value     := DM1.ReKunTab.FieldByName('Name1').AsString;
    ReEdiTabKUN_NAME2.Value     := DM1.ReKunTab.FieldByName('Name2').AsString;
    ReEdiTabKUN_NAME3.Value     := DM1.ReKunTab.FieldByName('Name3').AsString;
    ReEdiTabKUN_ABTEILUNG.Value := DM1.ReKunTab.FieldByName('Abteilung').AsString;
    ReEdiTabKUN_STRASSE.Value   := DM1.ReKunTab.FieldByName('Strasse').AsString;
    ReEdiTabKUN_LAND.Value      := DM1.ReKunTab.FieldByName('Land').AsString;
    ReEdiTabKUN_PLZ.Value       := DM1.ReKunTab.FieldByName('PLZ').AsString;
    ReEdiTabKUN_ORT.Value       := DM1.ReKunTab.FieldByName('Ort').AsString;

    ReEdiTabGEGENKONTO.Value := DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger;
    ReEdiTabLiefart.Value    := DM1.ReKunTab.FieldByName('Kun_Liefart').AsInteger;
    ReEdiTabZahlart.Value    := DM1.ReKunTab.FieldByName('Kun_Zahlart').AsInteger;
    ReEdiTabKUN_NUM.Value    := DM1.ReKunTab.FieldByName('Kunnum1').AsString;
    ReEdiTabWAEHRUNG.Value   := DM1.ReKunTab.FieldByName('Waehrung').AsString;

    ReEdiTabVERTRETER_ID.Value      := DM1.ReKunTab.FieldByName('VERTRETER_ID').AsInteger;
    ReEdiTabGLOBRABATT.Value        := DM1.ReKunTab.FieldByName('GRabatt').AsFloat;

    ReEdiTabMWST_FREI_FLAG.Value    := DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean;

    if ReEdiTabMWST_FREI_FLAG.Value then 
      ReEdiTabBRUTTO_FLAG.Value := False
    else 
      ReEdiTabBRUTTO_FLAG.Value := DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean;

    ReEdiTabLIEF_ADDR_ID.AsInteger  := DM1.ReKunTab.FieldByName('DEFAULT_LIEFANSCHRIFT_ID').AsInteger;

    ReEdiTab.Post;

    LastKunNum                      := ReEdiTabKUN_NUM.AsString;

    if (DM1.Use_KFZ) then
    begin
      if  ReKFZTab.Active then 
        ReKFZTab.Close;
      ReKFZTab.ParamByName ('KID').asInteger := ReEdiTabKFZ_ID.Value;
      ReKFZTab.ParamByName ('AID').asInteger := ReEdiTabADDR_ID.Value;
      ReKFZTab.Open;

      ReKFZTab.Locate ('KFZ_ID', ReEdiTabKFZ_ID.Value, []);
    end;

    UpdateAnsprechpartner;

    // in Rechnungspositionen neue Adress_ID setzen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Clear;
    DM1.UniQuery.SQL.Add ('UPDATE JOURNALPOS SET ADDR_ID = ' +
      Inttostr(ReEdiTabADDR_ID.AsInteger));
    DM1.UniQuery.SQL.Add ('WHERE JOURNAL_ID=' +
      Inttostr(ReEdiTabRec_ID.AsInteger));
    DM1.UniQuery.ExecSql;
    DM1.UniQuery.Close;

    PosTabAfterPost(nil);

    if PosTab.Active then 
      PosTab.Refresh;

    UpdateLieferanschrift;
  end;

  DM1.ReKunTab.Close;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditButtonClick(Sender: TObject);
begin
  if not assigned(MainForm.AddrForm) then
  begin
    MainForm.AddrForm := TAdressForm.Create (Self{MainForm});
    with MainForm.AddrForm do
    begin
      BorderStyle := bsSizeable;
      Height      := 500;
      Width       := 620;
      Left        := MainForm.Left + 160;
      Top         := MainForm.Top + 10;
      UebernahmeBtn.Visible := True;
      uebernehmen1.Visible := True;
      Button1.Cancel := True;
      Invalidate;
    end;
  end;
  with MainForm.AddrForm do
  begin
    SearchKunnum (KuNrEdit.Text, True);
    if Uebern then
    begin // Adresse in Rechnung überbnehmen
      SetAdresse (KSQueryRec_ID.AsInteger);
      Uebern := False;
      FormDeactivate (Sender);
    end else
    begin  // Übern. abgebrochen
      ReEdiTabKUN_NUM.AsString := LastKunNum;
    end;
  end; // with
end;   

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabAfterPost(DataSet: TDataSet);
var 
  ID: Integer;
  N, n0, n1, n2, n3,
  M, m0, m1, m2, m3,
  B, b0, b1, b2, b3,
  P, Lohn, Ware, TKst, Gewicht, RGW: Double;
  T: Char;
begin
  if PosTabArtikelTyp.AsString = 'S' then
  begin
    DM1.UpdateStuecklistenArtikel (ReEdiTabREC_ID.AsInteger,
    PosTabRec_ID.AsInteger,
    PosTabArtikel_ID.AsInteger,
    PosTabMenge.AsFloat);
  end;

  if PosTab.ControlsDisabled then 
    exit;

  DM1.UpdateArtikelEdiMenge (BelegArt, PosTabArtikel_ID.AsInteger, 0);

  ID := PosTabRec_ID.Value;
  PosTab.DisableControls;

  N := 0; N0 := 0; N1 := 0; N2 := 0; N3 := 0;
  M := 0; M0 := 0; M1 := 0; M2 := 0; M3 := 0;
  B := 0; B0 := 0; B1 := 0; B2 := 0; B3 := 0;
  P := 0; Gewicht := 0; RGW := 0; Lohn := 0; Ware := 0; TKst := 0;
  try
    PosTab.First;
    while not PosTab.Eof do
    begin
      P := P + PosTabPROVIS_WERT.Value;

      RGW     := RGW + PosTabG_RGEWINN.AsFloat;

      Gewicht := Gewicht + (PosTabGewicht.AsFloat * PosTabMenge.AsFloat);

      if ReEdiTabBrutto_Flag.ASBoolean then
      begin
        //Bruttofakturierung
        B := B + PosTabGPreis.Value;

        case PosTabSteuer_code.Value of
          0: B0 := B0 + PosTabGPreis.Value;
          1: B1 := B1 + PosTabGPreis.Value;
          2: B2 := B2 + PosTabGPreis.Value;
          3: B3 := B3 + PosTabGPreis.Value;
        end;
      end else
      begin
        // Netto
        N := N + PosTabGPreis.Value;

        case PosTabSteuer_code.Value of
          0: N0 := N0 + PosTabGPreis.Value;
          1: N1 := N1 + PosTabGPreis.Value;
          2: N2 := N2 + PosTabGPreis.Value;
          3: N3 := N3 + PosTabGPreis.Value;
        end;
      end;

      // Lohn, Ware, Transportkosten
      if Length(PosTabArtikelTyp.AsString) = 1 then 
        T := PosTabArtikelTyp.AsString[1]
      else 
        T := '?';

      case t of
        'N', 'S', 'V', 'F': Ware := Ware + PosTabNSumme.Value;
        'L'            : Lohn := Lohn + PosTabNSumme.Value;
        'K'            : TKst := TKst + PosTabNSumme.Value;
      end;

      PosTab.Next;
    end;

    if not ReEdiTabMWST_FREI_Flag.AsBoolean then
    begin
      if ReEdiTabBrutto_Flag.ASBoolean then
      begin
        //Bruttofakturierung
        M1 := CAO_Round(B1 / (100 + ReEdiTabMwSt_1.AsFloat) * ReEdiTabMwSt_1.AsFloat * 100) / 100;
        M2 := CAO_Round(B2 / (100 + ReEdiTabMwSt_2.AsFloat) * ReEdiTabMwSt_2.AsFloat * 100) / 100;
        M3 := CAO_Round(B3 / (100 + ReEdiTabMwSt_3.AsFloat) * ReEdiTabMwSt_3.AsFloat * 100) / 100;

        N0 := B0 - M0;
        N1 := B1 - M1;
        N2 := B2 - M2;
        N3 := B3 - M3;

        M := M0 + M1 + M2 + M3;
        N := B - M;
      end else
      begin
        // Nettofakturierung
        M1 := CAO_Round(N1 * ReEdiTabMwSt_1.AsFloat) / 100;
        M2 := CAO_Round(N2 * ReEdiTabMwSt_2.AsFloat) / 100;
        M3 := CAO_Round(N3 * ReEdiTabMwSt_3.AsFloat) / 100;

        B0 := N0 + M0;
        B1 := N1 + M1;
        B2 := N2 + M2;
        B3 := N3 + M3;

        M := M0 + M1 + M2 + M3;
        B := N + M;
      end;
    end else
    begin  // MwSt-Frei ...
      M := 0; M1 := 0; M2 := 0; M3 := 0;
      if ReEdiTabBrutto_Flag.ASBoolean then 
        N := B else B := N;
    end;

    PosTab.Refresh;

    PosTab.Locate ('REC_ID', variant(ID), []);
  finally
    // Brutto-Wert-Rundung
    if DM1.BR_SUM_RUND_WERT > 1 then 
      B := CAO_Round(B * 100 / DM1.BR_SUM_RUND_WERT) * DM1.BR_SUM_RUND_WERT / 100;

    RGW := cao_round(rgw * 100) / 100;
    Gewicht := cao_round(gewicht * 1000) / 1000;
    P := cao_round(p * 100) / 100;

    if (ReEdiTabNSumme.Value      <> N) or
       (ReEdiTabNSumme_0.Value    <> N0) or
       (ReEdiTabNSumme_1.Value    <> N1) or
       (ReEdiTabNSumme_2.Value    <> N2) or
       (ReEdiTabNSumme_3.Value    <> N3) or
       (ReEdiTabMSumme.Value      <> M) or
       (ReEdiTabMSumme_0.Value    <> M0) or
       (ReEdiTabMSumme_1.Value    <> M1) or
       (ReEdiTabMSumme_2.Value    <> M2) or
       (ReEdiTabMSumme_3.Value    <> M3) or
       (ReEdiTabBSumme.Value      <> B) or
       (ReEdiTabBSumme_0.Value    <> B0) or
       (ReEdiTabBSumme_1.Value    <> B1) or
       (ReEdiTabBSumme_2.Value    <> B2) or
       (ReEdiTabBSumme_3.Value    <> B3) or
       (ReEdiTabPROVIS_WERT.Value <> P) or
       (ReEdiTabWare.Value        <> Ware) or
       (ReEdiTabLohn.Value        <> Lohn) or
       (ReEdiTabTKost.Value       <> TKst) or
       (ReEdiTabROHGEWINN.Value   <> RGW) or
       (ReEdiTabGewicht.Value     <> Gewicht) then
    begin
      try
        if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
          ReEdiTab.Edit;

        ReEdiTabNSumme.Value      := N;
        ReEdiTabNSumme_0.Value    := N0;
        ReEdiTabNSumme_1.Value    := N1;
        ReEdiTabNSumme_2.Value    := N2;
        ReEdiTabNSumme_3.Value    := N3;

        ReEdiTabMSumme.Value      := M;
        ReEdiTabMSumme_0.Value    := M0;
        ReEdiTabMSumme_1.Value    := M1;
        ReEdiTabMSumme_2.Value    := M2;
        ReEdiTabMSumme_3.Value    := M3;

        ReEdiTabBSumme.Value      := B;
        ReEdiTabBSumme_0.Value    := B0;
        ReEdiTabBSumme_1.Value    := B1;
        ReEdiTabBSumme_2.Value    := B2;
        ReEdiTabBSumme_3.Value    := B3;

        ReEdiTabPROVIS_WERT.Value := P;
        ReEdiTabRDATUM.Value      := now;
        ReEdiTabWare.Value        := Ware;
        ReEdiTabLohn.Value        := Lohn;
        ReEdiTabTKost.Value       := TKst;
        ReEdiTabROHGEWINN.Value   := RGW;
        ReEdiTabGewicht.Value     := Gewicht;

        ReEdiTab.Post;
      except
        ReEdiTab.Cancel;
      end;
    end;
    PosTab.EnableControls;
  end;

  PosDelBtn1.Enabled := PosTab.RecordCount > 0;
  PosDelBtn2.Enabled := PosTab.RecordCount > 0;

  Positionlschen1.Enabled := PosTab.RecordCount > 0;

  EditSNBtn1.Enabled := (PosTab.RecordCount > 0) and (PosTabSN_Flag.AsBoolean = True);
  EditSNBtn2.Enabled := EditSNBtn1.Enabled;

  if ArtInfoRefresh then
  begin
    ArtInfoRefresh := False;
    if DM1.ArtInfoTab.Active then 
      DM1.ArtInfoTab.Refresh;
    PosTab.Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PC1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  QueryTime := GetTickCount;
  if PosTab.ParamByName('ID').Value <> ReEdiTabREC_ID.Value then
  begin
    if DM1.ArtInfoTab.Active then
      DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.ParamByName('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.ParamByName('QUELLE').AsInteger := BelegArt;

    DM1.ArtInfoTab.Open;

    if PosTab.Active then
      PosTab.Close;
    PosTab.ParamByName('ID').Value := ReEdiTabREC_ID.Value;
    PosTab.Open;

    if (ReEdiTab.RecordCount > 0) and
       ((ReEdiTabMWST_0.Value <> DM1.MWSTTab[0]) or
       (ReEdiTabMWST_1.Value <> DM1.MWSTTab[1]) or
       (ReEdiTabMWST_2.Value <> DM1.MWSTTab[2]) or
       (ReEdiTabMWST_3.Value <> DM1.MWSTTab[3])) then
    begin
      ReEdiTab.Edit;
      try
        ReEdiTabMWST_0.Value := DM1.MWSTTab[0];
        ReEdiTabMWST_1.Value := DM1.MWSTTab[1];
        ReEdiTabMWST_2.Value := DM1.MWSTTab[2];
        ReEdiTabMWST_3.Value := DM1.MWSTTab[3];
        ReEdiTab.Post;
      except
        ReEdiTab.Cancel;
      end;
    end;
    ReEdiTabAfterPost (nil);
    PosTab.Refresh;

    UpdateLieferanschrift;
    UpdateAnsprechpartner;
  end;

  QueryTime := GetTickCount - QueryTime;
  UpdateStatus;

  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridShowEditor(Sender: TObject; Field: TField;
var AllowEdit: Boolean);
begin
  if (uppercase(PosTabARTIKELTYP.Value) = 'T') and
     (
     (Field.FieldName = 'MENGE') or
     (Field.FieldName = 'EPREIS') or
     (Field.FieldName = 'ME_EINHEIT') or
     (Field.FieldName = 'RABATT') or
     (Field.FieldName = 'STEUER_CODE')
     ) then 
    AllowEdit := False;

  if (
     (uppercase(PosTabARTIKELTYP.Value) = 'T') or
     (uppercase(PosTabARTIKELTYP.Value) = 'K') or
     (uppercase(PosTabARTIKELTYP.Value) = 'L')
     ) and (Field.FieldName = 'GEWICHT') then 
    AllowEdit := False;

  if (Uppercase(Field.FieldName) = 'POSITION') or
     (Uppercase(Field.FieldName) = 'ARTIKELTYP') or
     (Uppercase(Field.FieldName) = 'MATCH_ARTNUM') then 
    AllowEdit := False;

  if (PosTabNO_RABATT_FLAG.AsBoolean) and 
     (Uppercase(Field.FieldName) = 'RABATT') then 
    AllowEdit := False;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
  if ReEdiTabVRENUM.Value = '' then 
    ReEdiTabVRENUM.Value := DM1.IncNummerStr (BelegArt);

  if (ReEdiTabADDR_ID.Value >= 0) and
     (
     (ReEdiTabKUN_NUM.AsString = '') or
     (ReEdiTabKUN_NUM.AsString = '0') or
     (ReEdiTabGegenkonto.AsInteger<1)
     ) then
  begin
    DM1.ReKunTab.Close;
    DM1.ReKunTab.ParamByName('ID').AsInteger := ReEdiTabADDR_ID.Value;
    DM1.ReKunTab.Open;
    if DM1.ReKunTab.RecordCount = 1 then
    begin
      if (length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString) = 0) or
         (length(DM1.ReKunTab.FieldByName('DEB_NUM').AsString) = 0) or
         (DM1.ReKunTab.FieldByName('KUNNUM1').AsString = '0') or
         (DM1.ReKunTab.FieldByName('DEB_NUM').AsString = '0')then
      begin
        // neue Kundennummer vergeben !
        DM1.ReKunTab.Edit;
        try
          if (length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString) = 0) or
             (DM1.ReKunTab.FieldByName('KUNNUM1').AsString = '0') then 
            DM1.ReKunTab.FieldByName('KUNNUM1').AsString := DM1.IncNummerStr (KUNNUM_KEY);

          if (length(DM1.ReKunTab.FieldByName('DEB_NUM').AsString) = 0) or
             (DM1.ReKunTab.FieldByName('DEB_NUM').AsString = '0') then 
            DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger := DM1.IncNummer (DEB_NUM_KEY);


          // Bitcodiertes Flag für "ist Kunde" setzen
          DM1.ReKunTab.FieldByName('STATUS').AsInteger := DM1.ReKunTab.FieldByName('STATUS').AsInteger or 1;
          DM1.ReKunTab.Post;
        except
          DM1.ReKunTab.Cancel;
        end;
      end;
    end;

    ReEdiTabKUN_NUM.Value := DM1.ReKunTab.FieldByName('KUNNUM1').AsString;
    ReEdiTabGegenkonto.Value := DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger;

    DM1.ReKunTab.Close;
  end;

  if OldShopStatus<>ReEdiTabSHOP_STATUS.Value then 
    ReEdiTabSHOP_CHANGE_FLAG.AsBoolean := True;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
  if ReEdiTabWV_Datum.Value > 100 then 
    ReEdiTabWV_DatumStr.Value := FormatDateTime (_('dd.mm.yyyy'), ReEdiTabWV_Datum.Value);

  case ReEdiTabStadium.AsInteger of
    10: ReEdiTabSTADIUM_STR.AsString := _('bitte prüfen');
    20: ReEdiTabSTADIUM_STR.AsString := _('Freigegeben');
    30: ReEdiTabSTADIUM_STR.AsString := _('Stapeldruck');
    else  ReEdiTabSTADIUM_STR.AsString := _('in Bearbeitung');
  end;

  if (ReEdiTabShop_ID.AsInteger > 0) then
  begin
    if DM1.ShopOrderStatusTab.Locate ('ORDERSTATUS_ID', ReEdiTabShop_Status.AsInteger, []) then 
      ReEdiTabCalc_Shopstatus.AsString := DM1.ShopOrderStatusTabLANGBEZ.AsString;
  end;

  ReEdiTabCalc_Name.AsString := Trim(ReEdiTabKUN_Anrede.AsString + ' ' +
    ReEdiTabKUN_NAME1.AsString + ' ' +
    ReEdiTabKUN_NAME2.AsString + ' ' +
    ReEdiTabKUN_NAME3.AsString
  );
end;                          

//------------------------------------------------------------------------------
procedure TMakeVKReForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(ReEdiListGrid), BelegArtStr + '_LISTE', 104);
  dm1.GridSaveLayout (tDBGrid(PosGrid), BelegArtStr + '_POS', 102);
  DM1.WriteIntegerU ('', BelegArtStr + '_POS_ZH', PosGrid.DefaultRowHeight);
  DM1.WriteIntegerU ('', BelegArtStr + '_POS_ZZ', PosGrid.LinesPerRow);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
begin
  // evt. vorhandene Positionen löschen
  if PosTab.Active then
    PosTab.Close;
  PosTab.ParamByName('ID').Value := ReEdiTabREC_ID.Value;
  PosTab.Open;
  try
    PosTab.DisableControls;
    while not PosTab.EOF do
    begin
      PosTab.Delete;
    end;
  finally
    PosTab.EnableControls;
  end;

  //EDI-Mengen aktualisieren in Tabelle ARTIKEL_BDATEN
  DM1.UpdateArtikelEdiMenge (BelegArt,
  PosTabArtikel_ID.AsInteger,
  PosTabMenge.AsFloat);
end;                   

//------------------------------------------------------------------------------
procedure TMakeVKReForm.SichtbareSpalten1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid))
  else
  if PC1.ActivePage = PosTS then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(PosGrid));
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.BuchenBtnClick(Sender: TObject);
var 
  BelegNr: String;
begin
  if InBuchung then exit;
  try
    InBuchung := True;
    if ReEdiTab.State in [dsEdit, dsInsert] then 
      ReEdiTab.Post;

    case BelegArt of
      VK_RECH_EDI: BelegNr := dm1.Buche_Rechnung (ReEdiTabREC_ID.Value);
      VK_AGB_EDI : BelegNr := dm1.Buche_Angebot  (ReEdiTabREC_ID.Value);
      VK_AUF_EDI : BelegNr := dm1.Buche_Auftrag  (ReEdiTabREC_ID.Value);
    end;
    {$IFDEF WITH_REPORT}
    if BelegNr <> '' then 
      PrintRechForm.ShowBelegDlg (BelegArt - 10, ReEdiTabREC_ID.Value, False);
    {$ELSE}
    {$IFDEF TERMINMANAGER}//Kommputer
    if BelegNr <> '' then 
      MainForm.CAO_To_TMObj.OpenPrintBelegDialog (BelegArt - 10, ReEdiTabREC_ID.AsInteger);
    {$ELSE}
    MessageDlg (_('Der Code zum drucken des Beleges' + #13#10 +
      'ist in die GNU-Version noch nicht implementiert !'),
      mterror, [mbok], 0);
    {$ENDIF}
    {$ENDIF}

    LastTS := EdiListTS;
    LastEdiID := -1;
    ReEdiTab.Close;
    FormActivate(Sender);
    MainForm.FormActivate (Self);
  finally
    InBuchung := False;
  end;
end;              

//------------------------------------------------------------------------------
procedure TMakeVKReForm.New1BtnClick(Sender: TObject);
begin
  ReEdiTab.DisableControls;
  try
    ReEdiTab.Append;
    LastEdiID := ReEdiTabRec_ID.Value;
    LastTS := AdressTS;
  finally
    ReEdiTab.EnableControls;
  end;
  FormActivate(Sender);
  ReEdiTab.SetLock;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.Del1BtnClick(Sender: TObject);
begin
  if not ReEdiTab.SetLock then 
    exit;

  if MessageDlg (_('Wollen Sie diesen Beleg wirklich löschen ?'),
    mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    PosTab.DisableControls;
    try
      ReEdiTab.Delete;
    finally
      PosTab.EnableControls;
    end;
    FormActivate(Sender);
  end;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoAllgBtnClick(Sender: TObject);
begin
  if ReEdiTab.SetLock then
  begin
    PC1.ActivePage := AdressTS;
    PC1Change(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
  PC1.ActivePage := EdiListTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoPosBtnClick(Sender: TObject);
begin
  if ReEdiTab.SetLock then
  begin
    PC1.ActivePage := PosTS;
    PC1Change(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.GotoFertigBtnClick(Sender: TObject);
begin
  if ReEdiTab.SetLock then
  begin
    PC1.ActivePage := Fertig;
    PC1Change(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosDetailBtnClick(Sender: TObject);
begin
  if ReEdiTab.SetLock then
  begin
    PC1.ActivePage := PosDetailTS;
    PC1Change(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    ReEdiTab.Prior;
    key := 0;
  end else
  if (Shift = []) and (key = 34) then // PGDOWN
  begin
    ReEdiTab.Next;
    key := 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    try
      if uppercase(tControl(Sender).Name) = 'RECHINFOMEMO' then 
        KuNrEdit.SetFocus
      else 
        SendMessage (MainForm.Handle, WM_NEXTDLGCTL, 0, 0);
    except
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.Kopieren1Click(Sender: TObject);
begin
  DM1.CopyRechnung (ReEdiTabREC_ID.Value, BelegArt);
  ReEdiTab.Refresh;
  ReEdiTab.Last;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.LieferscheinBuchenBtnClick(Sender: TObject);
var 
  ls_num        : String;
  CurrPos       : Integer;
  LiefExportDlg : TLiefExportDlg;
  LieferscheinID: Integer;
begin
  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;

  if ReEdiTabLiefart.AsInteger < 0 then
  begin
    MessageDlg (_('Bitte erst eine Versandart auswählen !'), mterror, [mbok], 0);
    PC1.ActivePage := AdressTS;
    PC1Change(Sender);
    try 
      Versand.SetFocus; 
    except 
    end;
    exit;
  end;

  LieferscheinID := -1;

  // nur in der Rechnungsbearbeitung ausführen !!!
  if BelegArt <> VK_RECH_EDI then 
    Exit;

  // 1. Kopie der EDI-Rechnung erstellen
  // und in Lieferschein umwandeln
  ls_num := dm1.buche_lieferschein (ReEdiTabRec_ID.Value, False, LieferscheinID);

  // 2. In allen Positionen der EDI-Rechnung die Lieferscheinnummer eintragen
  if length(ls_num) > 0 then
  begin
    //LS-Nummer in die Positionen eintragen
    PosTab.DisableControls;
    try
      CurrPos := PosTab.RecNo;

      PosTab.First;
      while not PosTab.Eof do
      begin
        PosTab.Edit;
        PosTabVLSNum.AsString := ls_num;
        PosTab.Post;
        PosTab.Next;
      end;
      PosTab.Locate ('POSITION', variant (CurrPos), []);
    finally
      PosTab.EnableControls;
      UpBtn1.Enabled := True;
      UpBtn2.Enabled := True;
    end;

    if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
      ReEdiTab.Edit;
    try
      ReEdiTabVLSNum.AsString := ls_num;
      ReEdiTabLDatum.AsDateTime := Now;
      ReEdiTab.Post;
    except
      ReEdiTab.Cancel;
    end;
  end;

  try
    LiefExportDlg := TLiefExportDlg.Create(Self);
    try
      LiefExportDlg.MakeExport (ReEdiTabLiefArt.AsInteger, LieferscheinID);
    finally
      LiefExportDlg.Free;
    end;
  except 
  end;


  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (VK_LIEF, LieferscheinID, False);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Lieferscheines' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}

  LieferscheinBuchenBtn.Enabled := False;
  TeillieferungBtn.Enabled := False;
  Teillieferung1.Enabled := False;
  Lieferscheinerstellen1.Enabled := False;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PC1Change(Sender: TObject);
var 
  CurrPos    : Integer;
  LSDruck    : Boolean;
  LSTeilDruck: Boolean;
  Prob       : Boolean;
  S, S1      : String;
  Dummy      : Boolean;
  I          : Integer;
begin
  if (Assigned(POsGrid.DBMemo)) and
     (PosGrid.DBMemo.Visible) and
     (PosGrid.DBMemo.Focused)  then
  begin
    with PosGrid.DBMemo do
    begin
      Visible := False;
      DataSource := nil;
      DataField := '';
    end;
  end;


  if ReEdiTab.State in [dsEdit, dsInsert] then
    ReEdiTab.Post;
  if PosTab.State in [dsEdit, dsInsert] then
    PosTab.Post;

  if PosTab.ParamByName('ID').Value <> ReEdiTabRec_ID.Value then
  begin
    PC1Changing(Sender, Dummy);
  end;

  Adressezuweisen1.Enabled := PC1.ActivePage = AdressTS;

  PosDelBtn1.Enabled := (PosTab.RecordCount > 0) and
    ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS));
  PosDelBtn2.Enabled := PosDelBtn1.Enabled;
  Positionlschen1.Enabled := PosDelBtn1.Enabled;

  Storno1.Enabled := (ReEdiTab.RecordCount > 0) and
    ((PC1.ActivePage = AdressTS) or (PC1.ActivePage = EdiListTS));

  SichtbareSpalten1.Enabled := (PC1.ActivePage = EdiListTS) or
    (PC1.ActivePage = PosTS);

  Aktualisieren1.Enabled := (PC1.ActivePage = EdiListTS) or
    (PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS);

  Kopieren1.Enabled := (PC1.ActivePage = EdiListTS) and (ReEdiTab.RecordCount > 0);

  EKBestellungerstellen1.Enabled := Kopieren1.Enabled;

  Artikelhinzufgen1.Enabled := (PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS);
  freienArtikelhinzufgen1.Enabled := Artikelhinzufgen1.Enabled;
  Texthinzufgen1.Enabled          := Artikelhinzufgen1.Enabled;
  Speichernundbuchen1.Enabled     := False;
  Teillieferung1.Enabled          := False;
  Lieferscheinerstellen1.Enabled  := False;

  Suchen1.Enabled := (PC1.ActivePage = EdiListTS);


  AuswahlBtn.Font.Style    := [];
  AllgemeinBtn.Font.Style  := [];
  PositionenBtn.Font.Style := [];
  FertigBtn.Font.Style     := [];
  PosDetailBtn.Font.Style  := [];


  if PC1.ActivePage = Fertig then
  begin
    SumPan.Parent    := FertigsumPan;
    KunDatGB2.Parent := FertigKundDatPan;

    FertigBtn.Font.Style := [fsBold];
    Fertigstellen1.Checked := True;

    Prob := False;
    S    := '';

    if ReEdiTabAddr_ID.Value < 0 then
    begin
      S := S + _('Kein Kunde zugewiesen') + #13#10;
      Prob := True;
    end;
    if ReEdiTabZAHLART.Value < 0 then
    begin
      S := S + _('Keine Zahlungsart zugewiesen') + #13#10;
      Prob := True;
    end;
    if (PosTab.RecordCount = 0) then
    begin
      S := S + _('Beleg hat keine Positionen') + #13#10;
      Prob := True;
    end;

    if BelegArt = VK_RECH_EDI then
    begin
      // Seriennummern (Anzahl zu Pos.-Menge) prüfen
      dm1.UniQuery.close;
      dm1.uniquery.sql.text :=
        'select JP.REC_ID,JP.QUELLE,JP.JOURNAL_ID,' +
        'JP.REC_ID as JOURNALPOS_ID,JP.ARTIKEL_ID,JP.POSITION,JP.MENGE,' +
        'COUNT(JPS.SNUM_ID)as ANZ_SN from JOURNALPOS as JP ' +
        'left outer join JOURNALPOS_SERNUM as JPS on ' +
        'JP.ARTIKEL_ID=JPS.ARTIKEL_ID and ' +
        'JP.REC_ID=JPS.JOURNALPOS_ID and ' +
        'JP.JOURNAL_ID=JPS.JOURNAL_ID ' +
        'where JP.JOURNAL_ID=' + Inttostr(ReEdiTabRec_ID.AsInteger) +
        ' and JP.SN_FLAG="Y" and JP.MENGE>0 ' +
        'group by JP.REC_ID having MENGE!=ANZ_SN';

      dm1.uniquery.open;
      if dm1.uniquery.recordcount > 0 then
      begin
        S1 := '';
        while not dm1.uniquery.eof do
        begin
          if length(s1) > 0 then
            S1 := S1 + ', ';
          S1 := S1 + dm1.uniquery.fieldbyname ('POSITION').AsString;
          dm1.uniquery.next;
        end;
        Prob := True;
      end;

      if dm1.uniquery.RecordCount = 1 then
      begin
        S := S + Format(_('Bei der Artikelposition %s' +
          ' stimmt die Anz. der Seriennummern nicht mit' +
          ' der Artikelmenge überein' + #13#10), [S1]);
      end else
      if dm1.uniquery.RecordCount > 1 then
      begin
        S := S + Format(_('Bei den Artikelpositionen %s' +
          ' stimmt die Anz. der Seriennummern nicht mit' +
          ' der Artikelmenge überein' + #13#10), [S1]);
      end;

      dm1.uniquery.close;
    end;

    if Prob then
    begin
      ProblemLab.Caption := S + #13#10 + _('Bitte beheben Sie die oben aufgeführten Probleme !');
      ProblemLab.Font.Color := clRed;
      MessageBeep(0);
    end else
    begin
      ProblemLab.Caption := _('keine');
      ProblemLab.Font.Color := clBlack;
    end;

    BuchenBtn.Enabled           := not Prob;
    StadiumCB.Enabled           := not Prob;
    Speichernundbuchen1.Enabled := not Prob;

    if BelegArt = VK_RECH_EDI then
    begin
      // Prüfen, ob Lieferschein bereits gedruckt !
      LSDruck := False;
      LSTeilDruck := False;
      PosTab.DisableControls;
      try
        CurrPos := PosTab.RecNo;

        PosTab.First;
        while not PosTab.Eof do
        begin
          if length(PosTabVLSNum.AsString) = 0 then
            LSDruck := True;
          if PosTabMENGE_GELIEFERT.Value < PosTabMenge.Value then
            LSTeilDruck := True;
          PosTab.Next;
        end;
        PosTab.Locate ('POSITION', variant (CurrPos), []);
      finally
        PosTab.EnableControls;
        LieferscheinBuchenBtn.Enabled  := LSDruck and not Prob;
        TeillieferungBtn.Enabled       := LSTeilDruck and not Prob;
        Lieferscheinerstellen1.Enabled := LSDruck     and not Prob;
        Teillieferung1.Enabled         := LSTeilDruck and not Prob;
      end;
    end;
  end else
  if PC1.ActivePage = EdiListTS then
  begin
    AuswahlBtn.Font.Style := [fsBold];
    Auswahl1.Checked := True;

    ReEdiTab.ReleaseLock; // Satzsperre aufheben
  end else
  if PC1.ActivePage = AdressTS then
  begin
    SumPan.Parent := AlgSumPan;

    AllgemeinBtn.Font.Style := [fsBold];
    Allgemein1.Checked := True;

    ReEdiTabAfterPost (nil);
  end else
  if PC1.ActivePage = PosTS then
  begin
    SumPan.Parent := PosSumPan;
    KunDatGB2.Parent := PosKunDatPan;

    PositionenBtn.Font.Style := [fsBold];
    Positionen1.Checked := True;

    if PosGrid.Columns.Count>0 then
    begin
      for i := 0 to PosGrid.Columns.Count-1 do
      begin
        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and
           (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
          PosTabEPREIS.DisplayLabel := _('E-Preis') + #13#10 + _('Brutto');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and
           (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
          PosTabEPREIS.DisplayLabel := _('E-Preis');
        end;

        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and
           (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis') + #13#10 + _('Brutto');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and
           (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis');
        end;
      end;
    end;
    PosGrid.Invalidate;

    SchnellerfassungGB.Parent := BottomSpacePan;
    BottomSpacePan.Height := SchnellerfassungGB.Height + 3;
  end else
  if PC1.ActivePage = PosDetailTS then
  begin
    SumPan.Parent := PosDetailSumPan;
    KunDatGB2.Parent := PosDetailKunDatPan;

    PosDetailBtn.Font.Style := [fsBold];
    PosDetails1.Checked := True;

    SchnellerfassungGB.Parent := PosDetailInfoPan;

    if ReEdiTabBrutto_Flag.AsBoolean then
      DetailGPreisB.DataField := 'GPREIS'
    else
      DetailGPreisB.DataField := 'CALC_BPREIS';
  end;

  UmschaltungBruttoNetto1.Enabled :=
    (PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS);
  PossortierennachArtikelnummer1.Enabled :=
    (PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS);

  AtrisImport1.Enabled :=
    (DM1.AtrisEnable) and
    ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS));

  UpdateStatus;

  LastTS := PC1.ActivePage;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KuNrEditExit(Sender: TObject);
begin
  if (not ReEdiTabKUN_NUM.IsNull) and
     (tEdit(Sender).Name = 'KuNrEdit')and
     (LastKunNum <> ReEdiTabKUN_NUM.AsString) then
  begin
    dm1.uniquery.close;
    dm1.uniquery.sql.text := 'select REC_ID, KUNNUM1 from ADRESSEN' +
      ' where KUNNUM1="' + sqlStringToSQL(ReEdiTabKUN_NUM.AsString) + '"';
    dm1.uniquery.open;

    if dm1.uniquery.recordcount = 1 then
    begin
      SetAdresse (DM1.Uniquery.FieldByName('Rec_ID').AsInteger);
      tDBEdit(sender).Color := clWindow;
    end else
    begin
      try 
        KuNrEdit.SetFocus; 
      except 
      end;
      KuNrEditButtonClick (Sender);
    end;

    dm1.uniquery.close;

    if LastKunNum<>ReEdiTabKUN_NUM.AsString then 
      KuNrEditExit(Sender);

  end else 
    tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
  if not AppendOK then
  begin
    MessageBeep(0);
    Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabAfterDelete(DataSet: TDataSet);
var 
  bm: tBookmark;
  p : Integer;
begin
  if PosTab.ControlsDisabled then exit; // Beleg wird gelöscht,
  // jetzt abbrechen da die Positionen somit
  // auch nicht aktualisiert werden müssen

  // Positionsnummer aktualisieren
  PosTab.DisableControls;
  BM := PosTab.GetBookmark;
  p := 0;
  postab.first;
  while not postab.eof do
  begin
    inc(p);
    if p <> postabposition.asinteger then
    begin
      postab.edit;
      postabposition.asinteger := p;
      postab.post;
    end;
    postab.next;
  end;
  PosTab.GotoBookmark (BM);
  PosTab.FreeBookmark (BM);
  PosTab.EnableControls;

  // Kopf aktualisieren
  PosTabAfterPost (nil);
end;        

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (assigned(Field)) and (uppercase(field.FieldName) = 'MENGE') and
     (PosTabArtikelTyp.AsString = 'N') then
  begin
    if PosTabMenge.Value > PosTabCalc_Lagermenge.Value then 
      Canvas.Font.Color := clRed;
  end else
  if (assigned(Field)) and
     (
     (uppercase(field.FieldName) = 'EPREIS') or
     (uppercase(field.FieldName) = 'NSUMME')
     ) then
  begin
    if (PosTabMenge.Value <> 0) and
       (PosTabEK_Preis.Value <> 0) and
       (PosTabNSumme.Value / PosTabMenge.Value < PosTabEK_Preis.Value) then 
      Canvas.Font.Color := clRed;
  end;

  if (PosTabArtikelTyp.AsString = 'T') and
     (
     (field.FieldName = 'MENGE') or
     (field.FieldName = 'ME_EINHEIT') or
     (field.FieldName = 'EPREIS') or
     (field.FieldName = 'RABATT') or
     (field.FieldName = 'NSUMME') or
     (field.FieldName = 'BSUMME') or
     (field.FieldName = 'STEUER_CODE') or
     (field.FieldName = 'MWST') or
     (field.FieldName = 'MENGE_GELIEFERT') or
     (field.FieldName = 'GEWICHT')
     ) then
  begin
    if (gdSelected in State) then 
      Canvas.Font.Color := PosGrid.HighlightColor
    else 
      Canvas.Font.Color := Canvas.Brush.Color;
  end;
end;                                          

//------------------------------------------------------------------------------
procedure TMakeVKReForm.F9Change (Ein: Boolean);
begin
  LastF9 := Ein;
  InfoPanOut.Visible         := LastF9;
  DetailEKPreisLab.Visible   := LastF9;
  DetailFaktorLab.Visible    := LastF9;
  DetailRohertragLab.Visible := LastF9;
  DetailAufpreisLab.Visible  := LastF9;
  DetailEKPreis.Visible      := LastF9;
  DetailFaktor.Visible       := LastF9;
  DetailRGW.Visible          := LastF9;
  DetailRGW_NR.Visible       := LastF9;

  RohgewLab2.Visible         := LastF9;
  RohgewLab1.Visible         := LastF9;

  DetailEPreis.Left       := 185 - Ord(not Ein) * 174;
  DetailEPreisLab.Left    := 186 - Ord(not Ein) * 174;
  DetailRabattLab.Left    := 278 - Ord(not Ein) * 174;
  DetailRabatt.Left       := 277 - Ord(not Ein) * 174;
  DetailEPreisRLab.Left   := 344 - Ord(not Ein) * 174;
  DetailEPreisR.Left      := 343 - Ord(not Ein) * 174;
  DetailMengeLab.Left     := 435 - Ord(not Ein) * 174;
  DetailMenge.Left        := 436 - Ord(not Ein) * 174;
  DetailMEEinheitLab.Left := 486 - Ord(not Ein) * 174;
  DetailMEEinheit.Left    := 485 - Ord(not Ein) * 174;
  DetailGPreisLab.Left    := 540 - Ord(not Ein) * 174;
  DetailGPreis.Left       := 539 - Ord(not Ein) * 174;
  DetailGPreisBLab.Left   := 630 - Ord(not Ein) * 174;
  DetailGPreisB.Left      := 630 - Ord(not Ein) * 174;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZIDCBButtonClick(Sender: TObject);
begin
  if not assigned(MainForm.KFZForm2) then
  begin
    MainForm.KFZForm2 := TKFZForm.Create (Self{MainForm});
    with MainForm.KFZForm2 do
    begin
      BorderStyle := bsSizeable;
      Height      := 500;
      Width       := 620;
      Left        := MainForm.Left + 160;
      Top         := MainForm.Top + 10;
      //Formactivate(Sender);
      UebernahmeBtn.Visible := True;
      Invalidate;
    end;
  end;
  with MainForm.KFZForm2 do
  begin
    ShowModal;
    if Uebern then
    begin // KFZ in Rechnung überbnehmen
      if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
        ReEdiTab.Edit;

      ReEdiTabKFZ_ID.Value       := KFZTabKFZ_ID.Value;
      ReEdiTabKM_Stand.Value     := KFZTabKM_STAND.VAlue;

      ReEdiTab.Post;

      Uebern := False;
      FormDeactivate (Sender);

      if (DM1.Use_KFZ) then
      begin
        if  ReKFZTab.Active then 
          ReKFZTab.Close;
        ReKFZTab.ParamByName ('KID').asInteger := ReEdiTabKFZ_ID.Value;
        ReKFZTab.ParamByName ('AID').asInteger := ReEdiTabADDR_ID.Value;
        ReKFZTab.Open;

        ReKFZTab.Locate ('KFZ_ID', ReEdiTabKFZ_ID.Value, []);
      end;
    end;
  end; // with
end;      

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReKFZTabAfterScroll(DataSet: TDataSet);
begin
  KFZUebernehmenBtn.Enabled := (ReKFZTab.RecordCount > 0) and
    (ReEdiTabKFZ_ID.Value<>ReKFZTabKFZ_ID.Value);
  KFZAddrAssign.Enabled := (ReKFZTab.RecordCount > 0) and
    (ReEdiTabAddr_ID.Value <> ReKFZTabAddr_ID.Value);

  KFZAddrErase.Enabled := ReEdiTabKFZ_ID.Value > -1;

  KFZNavZurueckBtn.Enabled := (ReKFZTab.RecordCount > 1) and (not ReKFZTab.Bof);
  KFZNavVorBtn.Enabled     := (ReKFZTab.RecordCount > 1) and (not ReKFZTab.Eof);
end;                                                         

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZAddrAssignClick(Sender: TObject);
begin
  ReKFZTab.Edit;
  ReKFZTabAddr_ID.Value := ReEdiTabAddr_ID.Value;
  ReKFZTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZUebernehmenBtnClick(Sender: TObject);
begin
  if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
    ReEdiTab.Edit;

  ReEdiTabKFZ_ID.Value       := ReKFZTabKFZ_ID.Value;
  ReEdiTabKM_Stand.Value     := ReKFZTabKM_STAND.VAlue;

  ReEdiTab.Post;
  ReKFZTabAfterScroll(nil);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZAddrEraseClick(Sender: TObject);
begin
  if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
    ReEdiTab.Edit;

  ReEdiTabKFZ_ID.Value       := -1;
  ReEdiTabKM_Stand.Value     := -1;

  ReEdiTab.Post;
  ReKFZTabAfterScroll(nil);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZNavZurueckBtnClick(Sender: TObject);
begin
  if ReKFZTab.Active then 
    ReKFZTab.Prior;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.KFZNavVorBtnClick(Sender: TObject);
begin
  if ReKFZTab.Active then 
    ReKFZTab.Next;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.AtrisImport1Click(Sender: TObject);
begin
  AtrisImport;
end;

//------------------------------------------------------------------------------
function TMakeVKReForm.AtrisImport: Boolean;
const 
  AtrisArtStart: String = '0011200'; // 1-7=Kennung, 8-10=Position, 11-32=Artikelnummer, 33-42=Hersteller, 43-102=Bezeichnung, 207-212=Menge, 219-226=Stahlgruber-Nr.
  AtrisArtPreis: String = '0011201'; // 1-7=Kennung, 8-10=Position                     , 45-52=VK-Preis, 53-54 VKPreis Nachkomma
  AtrisArtHSTNR: String = '0011203'; // 1-7=Kennung, 8-10=Position, 11-Ende=Hersteller-Artikelnummer
var
  F: TextFile;
  S, S2: String;
  HasPos: Boolean;
  //Artikelfelder
  Menge  : Double;
  VKPreis: Double;
  Langtext: String;
  Match   : String;
  ArtNr   : String;
  StgNr   : String; // Stahlgruber-Nr.
begin
  Result := True;
  HasPos := False;

  if FileExists (DM1.AtrisPfad + 'tcdbest2.txt') then
  begin
    //FileGetDate
    AssignFile (F, DM1.AtrisPfad + 'tcdbest2.txt');
    Reset (F);
    try
      while not EOF(F) do
      begin
        Readln (F, S); 
        while length(S) < 300 do 
          S := S + #32;

        if Copy(S, 1, 7) = AtrisArtStart then
        begin
          // 1-7=Kennung, 8-10=Position, 11-32=Artikelnummer, 33-42=Hersteller,
          // 43-102=Bezeichnung, 207-212=Menge, 219-226=Stahlgruber-Nr.

          if HasPos then
          begin
            // Artikel Eintragen
            NeuFrArtBtnClick(Self);

            if length(Stgnr) > 0 then
            begin
              if length(LangText) > 0 then 
                Langtext := LangText + #13#10;
              Langtext := LangText + 'STG-NR:' + StgNr;
            end;
            if not (PosTab.State in [dsEdit, dsInsert]) then 
              PosTab.Edit;

            PosTabMENGE.Value := Menge;
            PosTabEPreis.Value := VKPreis;
            PosTabARTNUM.AsString := ArtNr;
            PosTabMATCHCODE.AsString := Match;
            PosTabBezeichnung.AsString := LangText;

            PosTab.Post;
          end;
          HasPos   := True;

          S2 := copy (S, 207, 212 - 207 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          try 
            Menge := StrToInt(S2); 
          except 
            Menge := 0; 
          end;

          VKPreis  := 0;

          S2 := copy (s, 43, 102 - 43 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          Langtext := s2;

          S2 := copy (S, 33, 42 - 33 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          Match := S2;
          Langtext := LangText + ' / ' + Match;

          S2 := Copy(S, 11, 32 - 11 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          ArtNr := S2;

          S2 := Copy (S, 219, 226 - 219 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          StgNr := S2;

        end else
        if Copy (S, 1, 7) = AtrisArtPreis then
        begin
          // 1-7=Kennung, 8-10=Position, 45-52=VK-Preis, 53-54 VKPreis Nachkomma
          try
            VKPreis := StrToInt(Copy(S, 45, 52 - 45 + 1));
            VKPreis := VKPreis + (StrToInt(Copy(S, 53, 54 - 53 + 1)) / 100);
          except 
          end;
        end else
        if Copy (S, 1, 7) = AtrisArtHSTNR then
        begin
          // 1-7=Kennung, 8-10=Position, 11-Ende=Hersteller-Artikelnummer
          S2 := Copy (S, 11, length(S) - 11 + 1);
          while (length(S2) > 0) and (S2[length(S2)] = #32) do 
            delete (S2, length(S2), 1);
          if length(S2) > 0 then
          begin
            if length(LangText) > 0 then 
              Langtext := LangText + #13#10;
            Langtext := LangText + S2;
          end;
        end;
      end; //While not EOF

      if HasPos then
      begin
        // Artikel Eintragen
        NeuFrArtBtnClick(Self);

        if length(Stgnr) > 0 then
        begin
          if length(LangText) > 0 then 
            Langtext := LangText + #13#10;
          Langtext := LangText + 'STG-NR:' + StgNr;
        end;
        if not (PosTab.State in [dsEdit, dsInsert]) then 
          PosTab.Edit;

        PosTabMENGE.Value := Menge;
        PosTabEPreis.Value := VKPreis;
        PosTabARTNUM.AsString := ArtNr;
        PosTabMATCHCODE.AsString := Match;
        PosTabBezeichnung.AsString := LangText;
        PosTab.Post;
      end;
    finally
      CloseFile (F);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.EKBestellungerstellen1Click(Sender: TObject);
begin
  DM1.CopyRechnung (ReEdiTabREC_ID.Value, EK_BEST_EDI);
  ReEdiTab.Refresh;
  ReEdiTab.Last;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    SuchZeit  := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');
    Datensatz := _('Beleg') + ' ' + inttostr (ReEdiTab.RecNo) +
      ' ' + _('von') + ' ' + inttostr (ReEdiTab.RecordCount);
    Erstellt  := _('le.Änderung:') +
      formatdatetime ('dd.mm.yyyy', ReEdiTabRDATUM.Value);

    if (ReEdiTab.RecordCount > 0) and
       (not ReEdiTabWV_DATUM.IsNull) and
       (ReEdiTabWV_DATUM.AsDateTime > 0) then 
      Geaendert := _('Termin') + ' : ' +
        FormatDateTime ('dd.mm.yyy', ReEdiTabWV_Datum.AsDateTime)
    else 
      Geaendert := '';

    if (PosTab.Active) and ((PC1.ActivePage = PosTS) or (PC1.ActivePage = PosDetailTS)) then 
      Sortierung := _('Position') + ' : ' + inttostr (PosTab.RecNo) +
        ' ' + _('von') + ' ' + inttostr (PosTab.RecordCount)
    else
    if PC1.ActivePage = EdiListTS then 
      Sortierung := ListSortName
    else 
      Sortierung := '-';

    OnUpdateStatusBar (SuchZeit, DatenSatz, Sortierung, Erstellt, Geaendert);
  end;

  if ReEdiTabBrutto_Flag.AsBoolean then 
    ReEdiTopLab.Caption := '  ' + BelegName + ' ' + _('bearbeiten ...') + ' ' + _('(BRUTTO)')
  else 
    ReEdiTopLab.Caption := '  ' + BelegName + ' ' + _('bearbeiten ...');

  if (ReEdiTab.RecordCount > 0) and
     (ReEdiTabSHOP_ID.AsInteger > 0) and
     (ReEdiTabSHOP_ORDERID.AsInteger > 0) and
     (BelegArt = VK_RECH_EDI) then
  begin
    // Shop-Box anzeigen, KFZ aus
    if KFZGB.Visible then 
      KFZGB.Visible := False;
    ShopStatusGB.Align := alClient;
    ShopStatusGB.Visible := True;
    Panel53.Visible := True;
  end else
  begin
    // Shop-Box aus
    ShopStatusGB.Align := alNone;
    ShopStatusGB.Visible := False;
    // KFZ an wenn aktiviert
    if DM1.Use_KFZ then 
      KFZGB.Visible := True;
    Panel53.Visible := DM1.Use_KFZ;
  end;

  UpdateArtikelDetails;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiListGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (ReEdiTabWV_Datum.AsDateTime > 0) and 
     (ReEdiTabWV_Datum.AsDateTime<Int(Now) + 7) then 
  begin 
    Canvas.Font.Color := clRed; 
    Canvas.Font.Style := [fsBold] 
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and
     (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.EditSNBtn1Click(Sender: TObject);
begin
  SNTab.Close;
  SNTab.Sql.Text :=
    'select SN.SERNUMMER,SN.SNUM_ID,SN.ARTIKEL_ID ' +
    'from JOURNALPOS_SERNUM JPS, ARTIKEL_SERNUM SN ' +
    'where JPS.ARTIKEL_ID=SN.ARTIKEL_ID and JPS.SNUM_ID=SN.SNUM_ID and ' +
    'JPS.JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) +
    ' and JPS.JOURNALPOS_ID=' + IntToStr(PosTabRec_ID.AsInteger);

  SNTab.Open;
  SNAuswahlForm.AuswahlSN (PosTabMenge.AsInteger,
    PosTabArtikel_ID.AsInteger,
    SNTab,
    ReEdiTabRec_ID.AsInteger,
    PosTabRec_ID.AsInteger,
    SNDS
  );
  SNTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosTabBeforeDelete(DataSet: TDataSet);
Var 
  DStr: String;
begin
  if (PosTabSN_Flag.AsBoolean)and(ReEdiTabQuelle.AsInteger = VK_RECH_EDI) then
  begin
    // Seriennummern Verweis löschen ....
    dm1.UniQuery.close;
    dm1.UniQuery.sql.text :=
      'DELETE FROM JOURNALPOS_SERNUM WHERE ' +
      'JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
      'JOURNALPOS_ID=' + IntToStr(PosTabRec_ID.AsInteger);

    dm1.UniQuery.ExecSql;
    dm1.UniQuery.close;
  end;

  //Stücklisten-Unterartikel löschen
  if PosTabArtikelTyp.AsString = 'S' then
  begin
    // Prüfen, ob Unterartikel Seriennummerpflichtig,
    // wenn ja dann JOURNALPOS_SERNUM bereinigen
    // Jedoch nur bei Rechnungen, bei Angeboten mach das keinen Sinn
    DStr := '';

    if ReEdiTabQuelle.AsInteger = VK_RECH_EDI then
    begin
      // Stücklisten-Unterartikel finden, die seriennummernpflichtig sind.
      dm1.UniQuery.sql.text :=
        'SELECT REC_ID FROM JOURNALPOS ' +
        'WHERE JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
        'TOP_POS_ID=' + IntToStr(PosTabRec_ID.AsInteger) + ' and ' +
        'SN_FLAG="Y"';
      dm1.UniQuery.Open;
      while not DM1.UniQuery.Eof do
      begin
        // Einen String erzeugen um die Seriennummerntabelle zu bereinigen
        DStr := DStr +
          'DELETE FROM JOURNALPOS_SERNUM WHERE ' +
          'JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
          'JOURNALPOS_ID=' +
          IntToStr(DM1.UniQuery.FieldByName('REC_ID').AsInteger) + ';';

        DM1.UniQuery.Next;
      end;
      DM1.UniQuery.Close;
    end;

    DM1.ZBatchSql1.Script.Clear;
    if length(DStr) > 0 then
      DM1.ZBatchSql1.Script.Add(DStr);

    DM1.ZBatchSql1.Script.Add ('DELETE FROM JOURNALPOS ' +
      'WHERE JOURNAL_ID=' +
      IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
      'TOP_POS_ID=' + IntToStr(PosTabRec_ID.AsInteger) +
      ';'
    );

    DM1.ZBatchSql1.Execute;
    ProgressForm.Stop;
  end;

  //Lieferschein-Verweise löschen
  dm1.UniQuery.sql.text :=
    'UPDATE JOURNALPOS SET QUELLE_SRC=-1 where QUELLE_SRC=' +
    IntToStr(PosTabRec_ID.AsInteger);

  dm1.UniQuery.ExecSql;
  dm1.UniQuery.close;

  // Reservierte Menge im Artikel aktualisieren
  if not PosTab.ControlsDisabled then
    DM1.UpdateArtikelEdiMenge (BelegArt,
      PosTabArtikel_ID.AsInteger,
      PosTabMenge.AsFloat
    );
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UmschaltungBruttoNetto1Click(Sender: TObject);
var 
  CurrPos: Integer;
  Brutto : Boolean;
  MwSt   : Double;
begin
  if ReEdiTabMwst_frei_Flag.AsBoolean then 
    exit;

  if PosTab.RecordCount > 0 then
  begin
    PC1Change(Sender);
    PosTab.DisableControls;
    try
      if PosTab.State in [dsEdit, dsInsert] then 
        PosTab.Post;

      if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
        ReEdiTab.Edit;

      Brutto := not ReEdiTabBRUTTO_FLAG.AsBoolean;
      ReEdiTabBRUTTO_FLAG.AsBoolean := Brutto;

      CurrPos := PosTabPosition.Value;

      PosTab.First;
      while not PosTab.Eof do
      begin
        if PosTabSTEUER_CODE.AsInteger>0 then
        begin
          PosTab.Edit;

          PosTabBrutto_Flag.Value := Brutto;

          case PosTabSTEUER_CODE.AsInteger of
            1: MwSt := ReEdiTabMWST_1.AsFloat;
            2: MwSt := ReEdiTabMWST_2.AsFloat;
            3: MwSt := ReEdiTabMWST_3.AsFloat;
            else MwSt := ReEdiTabMWST_0.AsFloat;
          end;

          if Brutto then 
            PosTabEPREIS.Value := CAO_Round( 
              (PosTabEPREIS.Value +
              PosTabEPREIS.Value / 100 *
              MwSt) * 100
              ) / 100
          else 
            PosTabEPREIS.Value := CAO_Round( 
              PosTabEPREIS.Value /
              (100 + MwSt) * 100 * 100
              ) / 100;
          PosTab.Post;
        end;
        PosTab.Next;
      end;
      PosTab.Refresh;
      PosTab.Locate ('POSITION', variant (CurrPos), []);
    finally
      PosTab.EnableControls;
      PosTabAfterPost (nil);
    end;
    PosTabAfterScroll(nil);

    if ReEdiTabBrutto_Flag.AsBoolean then 
      ReEdiTopLab.Caption := '  ' + BelegName + ' ' + _('bearbeiten ...') + ' ' + _('(BRUTTO)')
    else 
      ReEdiTopLab.Caption := '  ' + BelegName + ' ' + _('bearbeiten ...');

    PC1Change(Sender);
  end;

  if ReEdiTabBrutto_Flag.AsBoolean then 
    DetailGPreisB.DataField := 'GPREIS'
  else 
    DetailGPreisB.DataField := 'CALC_BPREIS';
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PrintPrevBtnClick(Sender: TObject);
begin
  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;

  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (BelegArt, ReEdiTabREC_ID.AsInteger, True);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Beleges' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.AlgPan3Resize(Sender: TObject);
begin
  if LiefanschrGB.Visible then
  begin
    LiefAnschriftAuswahlBtn.Left := LiefanschrGB.Width -
      LiefAnschriftAuswahlBtn.Width - 9;

    LiefAnschriftDelBtn.Left := LiefAnschriftAuswahlBtn.Left -
      LiefAnschriftDelBtn.Width - 4;

    L_Anrede.Width := LiefanschrGB.Width -
      LiefAnschriftAuswahlBtn.Width -
      LiefAnschriftDelBtn.Width - 5 - 9 - 5 - L_Anrede.Left;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.LiefAnschriftAuswahlBtnClick(Sender: TObject);
var 
  ID: Integer;
begin
  if (ReEdiTab.RecordCount > 0) then
  begin
    if ReEdiTabADDR_ID.AsInteger < 1 then
    begin
      MessageDlg (_('Bitte erst Kunden zuweisen !'), mterror, [mbok], 0);
      KuNrEdit.SetFocus;
      exit;
    end;

    if AdressenLiefForm.Get (ReEdiTabADDR_ID.AsInteger, ID) then
    begin
      if not(ReEdiTab.State in [dsEdit, dsInsert]) then 
        ReEdiTab.Edit;
      ReEdiTabLIEF_ADDR_ID.AsInteger := ID;
      ReEdiTab.Post;

      UpdateLieferanschrift;
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TMakeVKReForm.LiefAnschriftDelBtnClick(Sender: TObject);
begin
  if (ReEdiTab.RecordCount > 0) and (ReEdiTabADDR_ID.AsInteger > 1) then
  begin
    if not(ReEdiTab.State in [dsEdit, dsInsert]) then 
      ReEdiTab.Edit;
    ReEdiTabLIEF_ADDR_ID.AsInteger := -1;
    ReEdiTab.Post;
    UpdateLieferanschrift;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateLieferanschrift;
begin
  with DM1.UniQuery do
  begin
    SQL.Text := 'select * from ADRESSEN_LIEF where REC_ID=' +
      IntToStr(ReEdiTabLIEF_ADDR_ID.AsInteger);
    Open;
    if RecordCount > 0 then
    begin
      L_Anrede.Text  := FieldByName ('ANREDE').AsString;
      L_NAME1.Text   := FieldByName ('NAME1').AsString;
      L_NAME2.Text   := FieldByName ('NAME2').AsString;
      L_NAME3.Text   := FieldByName ('NAME3').AsString;
      L_Strasse.Text := FieldByName ('STRASSE').AsString;
      L_LAND.Text    := FieldByName ('LAND').AsString;
      L_PLZ.Text     := FieldByName ('PLZ').AsString;
      L_Ort.Text     := FieldByName ('ORT').AsString;
    end else
    begin
      L_Anrede.Text  := '';
      L_NAME1.Text   := '';
      L_NAME2.Text   := '';
      L_NAME3.Text   := '';
      L_Strasse.Text := '';
      L_LAND.Text    := '';
      L_PLZ.Text     := '';
      L_Ort.Text     := '';
    end;
  end;
end;   

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumExit(Sender: TObject);
var 
  me1, me2: double;
begin
  if (Sender = nil) or (tWinControl(Sender).Name = 'DetailMenge') then
  begin
    if PosTabVPE.AsInteger <> 0 then 
      me1 := int(PosTabMenge.AsFloat / PosTabVPE.AsInteger)
    else 
      me1 := 0;

    if PosTabVPE.AsInteger <> 0 then 
      me2 := PosTabMenge.AsFloat / PosTabVPE.AsInteger
    else 
      me2 := 0;

    if (PosTabVPE.AsInteger > 0) and (me1 <> me2) then
    begin
      MessageDlg (_('Die Menge muß gleich oder ein vielfaches ' +
        'der Verpackungseinheit sein !'), mterror, [mbok], 0);

      PosTabMenge.AsFloat := (me1 + 1) * PosTabVPE.AsInteger;
    end;
  end;
  if assigned(Sender) then 
    tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    PosTab.Prior;
    key := 0;
  end else
  if (Shift = []) and (key = 34) then // PGDOWN
  begin
    PosTab.Next;
    key := 0;
  end else
  if (Shift = []) and (key = VK_UP) and
     (
     (uppercase(tControl(Sender).Name) = 'SCHNELLARTNUM') or
     (uppercase(tControl(Sender).Name) = 'SCHNELLBARCODE') or
     (uppercase(tControl(Sender).Name) = 'SCHNELLMATCHCODE')
     ) then
  begin
    AddMengeEdi.Value := AddMengeEdi.Value + 1;
    key := 0;
  end else
  if (Shift = []) and (key = VK_DOWN) and
     (
     (uppercase(tControl(Sender).Name) = 'SCHNELLARTNUM') or
     (uppercase(tControl(Sender).Name) = 'SCHNELLBARCODE') or
     (uppercase(tControl(Sender).Name) = 'SCHNELLMATCHCODE')
     ) then
  begin
    if AddMengeEdi.Value >= 1 then 
      AddMengeEdi.Value := AddMengeEdi.Value-1
    else 
      MessageBeep(0);
    key := 0;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'DETAILTEXT') and
     (Shift = [ssShift]) then
  begin
    key := 0;
    DetailVPE.setfocus;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'DETAILTEXT') and
     (Shift = [ssCtrl]) then
  begin
    DetailText.SelText := #9;
      key := 0;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'DETAILTEXT') and
     (Shift = []) then
  begin
    SendMessage (RePanel.Parent.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
    key := 0;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailArtnumKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    SendMessage (RePanel.Parent.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
  end else
  if Key = #9 then 
    Key := #0;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateArtikelDetails;
var 
  P: Double;
begin
  if (PC1.ActivePage <> PosDetailTS) or
     (INDetailCalc) or
     (PosTab.Active = False) or
     (DM1.ArtInfoTab.Active = False) or
     (PosTab.ControlsDisabled) then 
    exit;

  if PreisPC.ActivePage = PreisAlgTS then
  begin
    PreisGrid.Cells[0, 1] := _('Preis') + ' (' + _('VK') + IntToStr(ReEdiTabPR_Ebene.Value) + ')';

    // Default-Preise
    P := 0;
    DM1.GetArtikelPreis (PosTabArtikel_ID.AsInteger, -99 {Kunde},
      ReEdiTabPR_Ebene.Value,
      ReEdiTabBRUTTO_FLAG.AsBoolean,
      1{Menge},
      P
    );

    if (DM1.ArtInfoTab.RecordCount > 0) and
       ((DM1.ArtInfoTab.Locate ('REC_ID, PREIS_TYP, ADRESS_ID', VarArrayOf([PosTabArtikel_ID.AsInteger, 3, - 99]), [])) or
       (DM1.ArtInfoTab.Locate ('REC_ID', PosTabArtikel_ID.AsInteger, []))) then
    begin
      PreisGrid.Cells[1, 1] := FormatFloat (',#0.00', P);

      if (DM1.ArtInfoTabAdress_ID.AsInteger = -99) and
         (DM1.ArtInfoTabPreis_Typ.AsInteger = 3) then
      begin
        if DM1.ArtInfoTabMENGE2.AsInteger > 1 then 
          PreisGrid.Cells[2, 1] := _('ab') + ' ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE2.AsInteger) + ' / ' +
            FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS2.AsFloat) / 100)
        else 
          PreisGrid.Cells[2, 1] := '-';

        if DM1.ArtInfoTabMENGE3.AsInteger > 1 then 
          PreisGrid.Cells[3, 1] := _('ab') + ' ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE3.AsInteger) + ' / ' +
            FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS3.AsFloat) / 100)
        else 
          PreisGrid.Cells[3, 1] := '-';

        if DM1.ArtInfoTabMENGE4.AsInteger > 1 then 
          PreisGrid.Cells[4, 1] := _('ab') + ' ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE4.AsInteger) + ' / ' +
            FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS4.AsFloat) / 100)
        else 
          PreisGrid.Cells[4, 1] := '-';

        if DM1.ArtInfoTabMENGE5.AsInteger > 1 then 
          PreisGrid.Cells[5, 1] := _('ab') + ' ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE5.AsInteger) + ' / ' +
            FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS5.AsFloat) / 100)
        else 
          PreisGrid.Cells[5, 1] := '-';
      end else
      begin
        PreisGrid.Cells[2, 1] := '-';
        PreisGrid.Cells[3, 1] := '-';
        PreisGrid.Cells[4, 1] := '-';
        PreisGrid.Cells[5, 1] := '-';
      end;
    end else
    begin
      PreisGrid.Cells[1, 1] := '-';
      PreisGrid.Cells[2, 1] := '-';
      PreisGrid.Cells[3, 1] := '-';
      PreisGrid.Cells[4, 1] := '-';
      PreisGrid.Cells[5, 1] := '-';
    end;

    // Kunden-Preise
    if (DM1.ArtInfoTab.RecordCount > 0) and
       (DM1.ArtInfoTab.Locate ('REC_ID, PREIS_TYP, ADRESS_ID', VarArrayOf([PosTabArtikel_ID.AsInteger, 3, ReEdiTabAddr_ID.AsInteger]), [])) then
    begin
      P := DM1.ArtInfoTab.FieldByName('PREIS').AsFloat;
      if ReEdiTabBRUTTO_FLAG.AsBoolean then 
        P := CAO_Round(P * (100 + PosTabCALC_STEUERPROZ.AsFloat)) / 100;

      PreisGrid.Cells[1, 2] := FormatFloat (',#0.00', P);

      if DM1.ArtInfoTabMENGE2.AsInteger > 1 then 
        PreisGrid.Cells[2, 2] := 'ab ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE2.AsInteger) + ' / ' +
          FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS2.AsFloat) / 100)
      else 
        PreisGrid.Cells[2, 2] := '-';

      if DM1.ArtInfoTabMENGE3.AsInteger > 1 then 
        PreisGrid.Cells[3, 2] := 'ab ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE3.AsInteger) + ' / ' +
          FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS3.AsFloat) / 100)
      else 
        PreisGrid.Cells[3, 2] := '-';

      if DM1.ArtInfoTabMENGE4.AsInteger > 1 then 
        PreisGrid.Cells[4, 2] := 'ab ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE4.AsInteger) + ' / ' +
          FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS4.AsFloat) / 100)
      else 
        PreisGrid.Cells[4, 2] := '-';

      if DM1.ArtInfoTabMENGE5.AsInteger > 1 then 
        PreisGrid.Cells[5, 2] := 'ab ' + FormatFloat (',#0', DM1.ArtInfoTabMENGE5.AsInteger) + ' / ' +
          FormatFloat (',#0.00', CAO_Round(P * 100 - P * DM1.ArtInfoTabPREIS5.AsFloat) / 100)
      else 
        PreisGrid.Cells[5, 2] := '-';
    end else
    begin
      PreisGrid.Cells[1, 2] := '-';
      PreisGrid.Cells[2, 2] := '-';
      PreisGrid.Cells[3, 2] := '-';
      PreisGrid.Cells[4, 2] := '-';
      PreisGrid.Cells[5, 2] := '-';
    end;
  end;

  try 
    StueckListTS.TabVisible := PosTabArtikelTyp.AsString = 'S'; 
  except 
  end;

  if PreisPC.ActivePage = PreisVKHisTS then
  begin
    if (HisTab.ParamByName ('AID').AsInteger <> PosTabArtikel_ID.AsInteger) or
       (HisTab.ParamByName ('QID').AsInteger <> VK_RECH) or
       (not HisTab.Active) then
    begin
      HisTab.Close;
      HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
      HisTab.ParamByName ('QID').AsInteger := VK_RECH;
      HisTab.Open;
    end;
    HistGrid.Parent := PreisVKHisTS;
  end else
  if PreisPC.ActivePage = PreisEKHisTS then
  begin
    if (HisTab.ParamByName ('AID').AsInteger <> PosTabArtikel_ID.AsInteger) or
       (HisTab.ParamByName ('QID').AsInteger <> EK_RECH) or
       (not HisTab.Active) then
    begin
      HisTab.Close;
      HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
      HisTab.ParamByName ('QID').AsInteger := EK_RECH;
      HisTab.Open;
    end;
    HistGrid.Parent := PreisEKHisTS;
  end else
  if PreisPC.ActivePage = EKBestTS then
  begin
    if (HisTab.ParamByName ('AID').AsInteger <> PosTabArtikel_ID.AsInteger) or
       (HisTab.ParamByName ('QID').AsInteger <> EK_BEST) or
       (not HisTab.Active) then
    begin
      HisTab.Close;
      HisTab.ParamByName ('AID').AsInteger := PosTabArtikel_ID.AsInteger;
      HisTab.ParamByName ('QID').AsInteger := EK_BEST;
      HisTab.Open;
    end;
    HistGrid.Parent := EKBestTS;
  end else 
    HisTab.Close;

  If PreisPC.ActivePage = LiefPreisTS then
  begin
    if (not ArtPreisTab.Active) or
       (ArtPreisTab.ParamByName ('ID').AsInteger <> PosTabArtikel_ID.AsInteger) then
    begin
      ArtPreisTab.Close;
      ArtPreisTab.ParamByName ('ID').AsInteger := PosTabArtikel_ID.AsInteger;
      ArtPreisTab.Open;
    end;
  end else 
    ArtPreisTab.Close;

  if PreisPC.ActivePage = StueckListTS then
  begin
    if (not STListTab.Active) or
       (STListTab.ParamByName ('ID').AsInteger <> PosTabArtikel_ID.AsInteger) then
    begin
      STListTab.Close;
      STListTab.ParamByName ('ID').AsInteger := PosTabArtikel_ID.AsInteger;
      STListTab.Open;
    end;
  end else 
    StListTab.Close;

  if PreisPC.ActivePage = LiefTS then
  begin
    if (not LiefTab.Active) or
       (LiefTab.ParamByName ('SRC_ID').AsInteger <> PosTabRec_ID.AsInteger) then
    begin
      LiefTab.Close;
      LiefTab.ParamByName ('SRC_ID').AsInteger := PosTabRec_ID.AsInteger;
      LiefTab.Open;
    end; 
  end else 
    LiefTab.Close;
    
  InDetailCalc := True;
  try
    DetailRGW.Value := PosTabEPreis.Value - PosTabEK_Preis.AsFloat;

    if PosTabEK_Preis.AsFloat <> 0 then 
      DetailFaktor.Value := CAO_round_nk(PosTabEPreis.Value / PosTabEK_Preis.AsFloat, 5) // auf 5 Nachk.-Stellen begrenzen
    else 
      DetailFaktor.Value := 0;

    // Einzelpreis nach Rabatt
    P := PosTabEPreis.Value;
    P := cao_round((P - (P * PosTabRabatt.Value / 100)) * 100) / 100;
    DetailEPreisR.Value := P;

    // Rohgewinn nach Rabatt
    { TODO : Hier wird der geschlossenen Tabelle PosTab ein Wert zugewiesen. Geht nicht !!! }
    //PosTabE_RGewinn.Value := cao_round_nk(P - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);

  finally
    InDetailCalc := False;
  end;

  DetailFaktor.Enabled  := PosTabEK_Preis.AsFloat <> 0;
  DetailRGW_NR.Enabled  := PosTabRabatt.Value <> 100;
  DetailEPreisR.Enabled := PosTabRabatt.Value <> 100;
  PosDetailCalcGB.Enabled := PosTabArtikelTyp.AsString <> 'T';
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PreisPCChange(Sender: TObject);
begin
  UpdateArtikelDetails;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.HisTabCalcFields(DataSet: TDataSet);
var 
  sum, m: double; w: string;
begin
  w := HisTabWaehrung.Value;

  Sum := HisTabMENGE.Value * HisTabEPreis.Value;
  sum := trunc((sum - (sum / 100 * HisTabRabatt.Value)) * 100) / 100;

  case HisTabSTEUER_CODE.AsInteger of
    0:  M := HisTabMWST_0.AsFloat;
    1:  M := HisTabMWST_1.AsFloat;
    2:  M := HisTabMWST_2.AsFloat;
    3:  M := HisTabMWST_3.AsFloat;
    else M := 0;
  end;

  HisTabEPreis_Str.Value := FormatFloat (',#0.00 "' + w + '"', HisTabEPreis.Value);
  HisTabGPreis_Str.Value := FormatFloat (',#0.00 "' + w + '"', sum);

  HisTabSTEUER_PROZ.AsFloat := M;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PreisPCResize(Sender: TObject);
var 
  I, J: Integer;
begin
  PreisGrid.Width := PreisAlgTS.Width - PreisGrid.Left * 2;
  I := (PreisGrid.Width - 7 ) div 6;
  for j := 0 to PreisGrid.ColCount-1 do 
    PreisGrid.ColWidths[j] := i;
end;                               

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailFaktorChange(Sender: TObject);
var P: Double;
begin
  if (PC1.ActivePage <> PosDetailTS)or
  (INDetailCalc) or
  (PosTab.Active = False)or
  (DM1.ArtInfoTab.Active = False)or
  (not DetailFaktor.Focused)or
  (not DetailFaktor.Enabled) then exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      PosTab.Edit;
    PosTabCalc_Faktor.Value := DetailFaktor.Value;
    PosTabEPreis.Value := CAO_Round(PosTabEK_Preis.AsFloat * {PosTabCalc_Faktor.Value}DetailFaktor.Value * 100) / 100;
    DetailRGW.Value := PosTabEPreis.Value - PosTabEK_Preis.AsFloat;
    // Einzelpreis nach Rabatt
    P := PosTabEPreis.Value;
    P := cao_round((P - (P * PosTabRabatt.Value / 100)) * 100) / 100;
    DetailEPreisR.Value := P;
    // Rohgewinn nach Rabatt
    PosTabE_RGewinn.Value := cao_round_nk(P - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);
  finally
    InDetailCalc := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailRGWChange(Sender: TObject);
var P: Double;
begin
  if (PC1.ActivePage <> PosDetailTS) or (INDetailCalc) or
     (PosTab.Active = False) or (DM1.ArtInfoTab.Active = False) then 
    exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      PosTab.Edit;
    PosTabEPreis.Value := ((PosTabEK_Preis.AsFloat + DetailRGW.Value) * 100) / 100;

    if PosTabEK_Preis.AsFloat <> 0 then 
      DetailFaktor.Value := CAO_Round(PosTabEPreis.Value / PosTabEK_Preis.AsFloat * 100000) / 100000 // auf 5 Nachk.-Stellen begrenzen
    else 
      DetailFaktor.Value := 0;

    // Einzelpreis nach Rabatt
    P := PosTabEPreis.Value;
    P := cao_round((P - (P * PosTabRabatt.Value / 100)) * 100) / 100;
    DetailEPreisR.Value := P;
    // Rohgewinn nach Rabatt
    PosTabE_RGewinn.Value := cao_round_nk(P - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);
  finally
    InDetailCalc := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailEPreisChange(Sender: TObject);
var 
P: Double;
begin
  if (PC1.ActivePage <> PosDetailTS) or (INDetailCalc) or
     (PosTab.Active = False) or (DM1.ArtInfoTab.Active = False) then 
    exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then exit; //PosTab.Edi;

    if PosTabEK_Preis.AsFloat <> 0 then 
      DetailFaktor.Value := CAO_Round(PosTabEPreis.Value / PosTabEK_Preis.AsFloat * 100000) / 100000 // auf 5 Nachk.-Stellen begrenzen
    else 
      DetailFaktor.Value := 0;


    DetailRGW.Value := PosTabEPreis.Value - PosTabEK_Preis.AsFloat;
    // Einzelpreis nach Rabatt
    P := PosTabEPreis.Value;
    P := cao_round((P - (P * PosTabRabatt.Value / 100)) * 100) / 100;
    DetailEPreisR.Value := P;
    // Rohgewinn nach Rabatt
    PosTabE_RGewinn.Value := cao_round_nk(P - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);
  finally
    InDetailCalc := False;
  end;

  DetailFaktor.Enabled  := PosTabEK_Preis.AsFloat <> 0;
end;  

//------------------------------------------------------------------------------
// Rohertrag nach Rabatt wurde geändert
procedure TMakeVKReForm.DetailRGW_NRChange(Sender: TObject);
begin
  if (PC1.ActivePage <> PosDetailTS) or (INDetailCalc) or
     (PosTab.Active = False) or (DM1.ArtInfoTab.Active = False) then 
    exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      Exit;
    // Einzelpreis nach Rabatt
    DetailEPreisR.Value := cao_round((PosTabEK_Preis.AsFloat + PosTabE_RGewinn.Value) * 100) / 100;
    //Einzelpreis vor Rabatt
    if PosTabRabatt.Value <> 100 then 
      PosTabEPreis.Value := cao_round(DetailEPreisR.Value / (100 - PosTabRabatt.Value) * 10000) / 100
    else 
      PosTabEPreis.Value := 0;
    // Einzelpreis nach Rabatt erneut berechnen (rundungsfehler)
    DetailEPreisR.Value := cao_round((PosTabEPreis.Value - (PosTabEPreis.Value * PosTabRabatt.Value / 100)) * 100) / 100;
    // Rohgewinn vor Rabatt
    DetailRGW.Value := PosTabEPreis.Value - PosTabEK_Preis.Value;
    // Faktor vor Rabatt

    if PosTabEK_Preis.AsFloat <> 0 then 
      DetailFaktor.Value := CAO_Round(PosTabEPreis.Value / PosTabEK_Preis.AsFloat * 100000) / 100000 // auf 5 Nachk.-Stellen begrenzen
    else 
      DetailFaktor.Value := 0;

  finally
    InDetailCalc := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailRabattChange(Sender: TObject);
var 
  P, R: Double; S: String;
begin
  if (PC1.ActivePage <> PosDetailTS) or (INDetailCalc) or
     (PosTab.Active = False) or (DM1.ArtInfoTab.Active = False) then 
    exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      exit; //PosTab.Edi;
    try
      S := DetailRabatt.Text;
      if Pos('%', S) > 0 then 
        Delete (S, Pos('%', S), 1);
      if S > '' then 
        R := StrToFloat(S)
      else 
        R := 0;
    except
      R := 0;
    end;
    // Einzelpreis nach Rabatt
    P := PosTabEPreis.Value;
    P := cao_round((P - (P * R / 100)) * 100) / 100;
    DetailEPreisR.Value := P;
    // Rohgewinn nach Rabatt
    PosTabE_RGewinn.Value := cao_round_nk(P - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);
  finally
    InDetailCalc := False;
  end;
end;    

//------------------------------------------------------------------------------
// Einzelpreis nach Rabatt geändert
//------------------------------------------------------------------------------
procedure TMakeVKReForm.DetailEPreisRChange(Sender: TObject);
begin
  if (PC1.ActivePage <> PosDetailTS) or (INDetailCalc) or
     (PosTab.Active = False) or (DM1.ArtInfoTab.Active = False) then 
    exit;

  InDetailCalc := True;
  try
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      PosTab.Edit;

    // Rohgewinn nach Rabatt
    PosTabE_RGewinn.Value := CAO_round_nk(DetailEPreisR.Value - PosTabEK_Preis.AsFloat, DM1.VK_NACHKOMMA);

    //Einzelpreis vor Rabatt
    if PosTabRabatt.Value <> 100 then 
      PosTabEPreis.Value := CAO_Round(DetailEPreisR.Value / (100 - PosTabRabatt.Value) * 10000) / 100
    else 
      PosTabEPreis.Value := 0;
    // Rohgewinn vor Rabatt
    DetailRGW.Value := CAO_Round((PosTabEPreis.Value - PosTabEK_Preis.AsFloat) * 100) / 100;
    // Faktor vor Rabatt

    if PosTabEK_Preis.AsFloat <> 0 then 
      DetailFaktor.Value := CAO_Round(PosTabEPreis.Value / PosTabEK_Preis.AsFloat * 100000) / 100000 // auf 5 Nachk.-Stellen begrenzen
    else 
      DetailFaktor.Value := 0;
  finally
    InDetailCalc := False;
  end;
end;                          

//------------------------------------------------------------------------------
// Schnellerfassung
//------------------------------------------------------------------------------
procedure TMakeVKReForm.SchnellArtnumKeyPress(Sender: TObject; var Key: Char);
var 
  Data, SFeld: String; 
  ID: Integer; 
  M: Double;
begin
  if Key = '*' then
  begin
    try
      if Sender is TEdit then
      begin
        M := StrToFloat (tEdit(Sender).Text);
        tEdit(Sender).Text := '';
        AddMengeEdi.Value := M;
      end;
    except 
    end;
    key := #0;
    exit;
  end;

  if key = #13 then
  begin
    if (Sender is TEdit) then
    begin
      ID := tEdit(Sender).Tag * -1;
      Key := #0;
      if tEdit(Sender).Text = '' then 
        ID := -1;
    end else 
      ID := 0;

    case ID of
      1: begin SFeld := 'MATCHCODE'; Data := SchnellMatchcode.Text end;
      2: begin SFeld := 'ARTNUM';    Data := SchnellArtnum.Text    end;
      3: begin SFeld := 'BARCODE';   Data := SchnellBarcode.Text   end;
      else ID := 0;
    end; // case


    if ID in [1, 2, 3] then
    begin
      dm1.uniquery.close;
      dm1.uniquery.sql.text := 'select REC_ID from ARTIKEL where ' +
      SFeld + '="' + sqlStringToSQL(Data) + '"';
      dm1.UniQuery.open;
      if dm1.UniQuery.RecordCount = 1 then
      begin
        OnAddartikel (DM1.Uniquery.FieldByName('REC_ID').AsInteger,
        AddMengeEdi.Value, 0, 0);

        SchnellArtnumExit(Sender);
      end else
      if (dm1.UniQuery.RecordCount > 1) or (dm1.UniQuery.RecordCount = 0) then
      begin
        if not assigned(MainForm.ArtForm) then
        begin
          MainForm.ArtForm := tArtikelForm.Create (Self);
          MainForm.ArtForm.BorderStyle    := bsSizeable;
          MainForm.ArtForm.Width  := 660;
          MainForm.Artform.Height := 520;
          MainForm.Artform.Left := MainForm.Left + 90;
          MainForm.Artform.Top  := MainForm.Top + 10;

          MainForm.Artform.MainMenu1.Images       := MainForm.ImageList1;
          MainForm.Artform.ArtikelToolBar1.Images := MainForm.ImageList1;
          MainForm.Artform.Toolbar2.Images        := MainForm.ImageList1;

          MainForm.ArtForm.OnAddArtikel := OnAddArtikel;
          MainForm.ArtForm.Invalidate;
        end;

        MainForm.ArtForm.F9Change (MainForm.F9);
        MainForm.ArtForm.OnAddArtikel := OnAddArtikel;
        MainForm.ArtForm.AddMengeEdi.Value := AddMengeEdi.Value;

        MainForm.ArtForm.SuchFeldCB.ItemIndex := ID;
        MainForm.ArtForm.SuchBeg.Text := Data;
        MainForm.ArtForm.SearchTimerTimer(Sender);
        MainForm.ArtForm.SearchTimer.Enabled := False;
        MainForm.ArtForm.ShowModal;
      end;
      dm1.UniQuery.close;

      SchnellArtnumExit(Sender);
    end;
  end;
end;                                       

//------------------------------------------------------------------------------
procedure TMakeVKReForm.SchnellArtnumExit(Sender: TObject);
begin
  SchnellArtnum.Text    := '';
  SchnellBarcode.Text   := '';
  SchnellMatchcode.Text := '';
  DetailArtnumExit (Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.TeillieferungBtnClick(Sender: TObject);
begin
  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;

  if ReEdiTabLiefart.AsInteger < 0 then
  begin
    MessageDlg (_('Bitte erst eine Versandart auswählen !'), mterror, [mbok], 0);
    PC1.ActivePage := AdressTS;
    PC1Change(Sender);
    try 
      Versand.SetFocus; 
    except 
    end;
    exit;
  end;

  TeilLieferForm.ShowDlg (ReEdiTabRec_ID.AsInteger);
  DM1.ArtInfoTab.Refresh;
  PosTab.Refresh;
end;                                                

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ArtPreisTabCalcFields(DataSet: TDataSet);
var 
  S: String;
begin
  S := '???';
  DM1.GetLieferant (ArtPreisTabADRESS_ID.AsInteger, S);
  ArtPreisTabLieferantStr.AsString := S;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiListGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var 
  Num: Integer;
begin
  with sender as tdbgrid do
  begin
    if (column.fieldname = 'STADIUM') then
    begin
      canvas.fillrect (rect);
      case column.field.asinteger of
        10 : num := 4; // violett, bitte Prüfen
        20 : num := 2; // Freigegeben, grün
        30 : num := 0; // cyan Stapeldruck
        else num := 3; // gelb, in Bearbeitung
      end;
      mainform.imagelist1.Draw (Canvas, rect.left, rect.top, num, true);
    end;
  end;
end;   

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (PosTab.State in [dsEdit, dsInsert]) then 
    PosTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.PossortierennachArtikelnummer1Click(Sender: TObject);
var
  LastSQL: String;
begin
  PosTab.DisableControls;
  try
    LastSQL := PosTab.Sql.Text;
    PosTab.Sql.Text :=
      'select * from JOURNALPOS where JOURNAL_ID = :ID ' +
      'and ARTIKELTYP != "X" order by ARTNUM';
    PosTab.ParamByName('ID').Value := ReEdiTabREC_ID.Value;
    PosTab.Open;
    while not PosTab.Eof do
    begin
      try
        PosTab.Edit;
        PosTabPosition.AsInteger := PosTab.RecNo;
        PosTab.Post;
      except
        PosTab.Cancel;
      end;
      PosTab.Next;
    end;
    PosTab.Close;
    PosTab.Sql.Text := LastSQL;
    PosTab.ParamByName('ID').Value := ReEdiTabREC_ID.Value;
    PosTab.Open;
  finally
    PosTab.EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.Suchen1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := ReEdiListGrid.Col;
  f := ReEdiListGrid.Columns[i-1].FieldName;
  t := MainForm.FindDialog1.FindText;
  Found := False;
  if frDown in MainForm.FindDialog1.Options then 
    ReEdiTab.Next
  else 
    ReEdiTab.Prior;
  repeat
    if frMatchCase in MainForm.FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, ReEdiTab.FieldByName(f).AsString) > 0;
    end else
    begin
      // Groß- und Kleinschreibung nicht beachten
      Found := Pos (uppercase(t), uppercase(ReEdiTab.FieldByName(f).AsString))>0;
    end;

    if not Found then
    begin
      if frDown in MainForm.FindDialog1.Options then 
        ReEdiTab.Next
      else 
        ReEdiTab.Prior;
    end;
  until (ReEdiTab.Eof) or (ReEdiTab.Bof) or (Found);
end;                                        

//------------------------------------------------------------------------------
procedure TMakeVKReForm.UpdateAnsprechpartner;
var 
  S, S1, S2, S3: String;
begin
  best_name.ComboProps.ComboItems.Clear;
  dm1.uniquery.close;
  dm1.uniquery.sql.text := 'select ANREDE, NAME, VORNAME ' +
    'from ADRESSEN_ASP WHERE ADDR_ID=' +
  Inttostr(ReEdiTabAddr_ID.AsInteger);
  dm1.uniquery.Open;

  if dm1.uniquery.recordcount > 0 then 
    best_name.DialogStyle := vdsCombo
  else 
    best_name.DialogStyle := vdsEdit;

  while not dm1.uniquery.eof do
  begin
    S1 := dm1.uniquery.fieldbyname ('ANREDE').AsString;
    S2 := dm1.uniquery.fieldbyname ('VORNAME').AsString;
    S3 := dm1.uniquery.fieldbyname ('NAME').AsString;

    S := S1;
    if length(S2) > 0 then
    begin
      if length(S) > 0 then 
        S := S + ' ';
      S := S + S2;
    end;
    if length(S3) > 0 then
    begin
      if length(S) > 0 then  
        S := S + ' ';
      S := S + S3;
    end;
    best_name.ComboProps.ComboItems.Add (S);
    dm1.uniquery.next;
  end;
  if dm1.uniquery.recordcount > 0 then 
    best_name.CreateDropDownList;
  dm1.uniquery.close;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabBeforeEdit(DataSet: TDataSet);
begin
  OldShopStatus := ReEdiTabSHOP_STATUS.AsInteger;
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiTabLockError(Error: Integer);
begin
  DM1.LockError (Error);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.ReEdiListGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  fn: string; 
  i: integer;
begin
  fn := uppercase (Field.FieldName);

  if fn = 'VRENUM'       then I := 1 else
  if fn = 'RDATUM'       then I := 2 else
  if fn = 'CALC_NAME'    then I := 3 else
  if fn = 'STADIUM'      then I := 4 else
  if fn = 'STADIUM_STR'  then I := 4 else
  if fn = 'NSUMME'       then I := 5 else
  if fn = 'MSUMME'       then I := 5 else
  if fn = 'BSUMME'       then I := 5 else
  if fn = 'TERMIN'       then I := 6 else
  if fn = 'WV_DATUM-STR' then I := 6 else
  if fn = 'ERST_NAME'    then I := 7 else
  if fn = 'ZAHLART_STR'  then I := 8 else
  if fn = 'LIEFART_STR'  then I := 9 else
  if fn = 'KUN_NUM'      then i := 10 else
  if fn = 'PROJEKT'      then i := 11
  else I := 0;

  SetSort (I);
end;

//------------------------------------------------------------------------------
procedure TMakeVKReForm.SetSort (Index: Integer);
var 
  LastSortField: String; 
  SF: String; 
  I: Integer;
begin
  LastSortField := ListSortField;

  case Index of
    {RDATUM} 
    2: begin 
      //Datum1.Checked :=True;
      Listsortfield := 'RDATUM,length(VRENUM),VRENUM';
      ListSortName  := _('le. Änderung');
    end;
    {NAME}   
    3: begin 
      //Name1.Checked :=True;
      Listsortfield := 'KUN_NAME1,KUN_NAME2,KUN_NAME3';
      ListSortName  := _('Kunde');
    end;
    {STADIUM}
    4:begin 
      //Stadium1.Checked :=True;
      Listsortfield := 'STADIUM,RDATUM,length(VRENUM),VRENUM';
      ListSortName  := _('Stadium');
    end;
    {PREIS}  
    5: begin 
      //Preis1.Checked :=True;
      Listsortfield := 'BSUMME,RDATUM,length(VRENUM),VRENUM';
      ListSortName  := _('Summe');
    end;
    6: begin
      ListSortField  := 'TERMIN';
      ListSortName   := _('Termin');
    end;
    7: begin
      ListSortField  := 'ERST_NAME';
      ListSortName   := _('erstellt von');
    end;
    8: begin
      ListSortField  := 'ZAHLART';
      ListSortName   := _('Zahlart');
    end;
    9: begin
      ListSortField  := 'LIEFART';
      ListSortName   := _('Versandart');
    end;
    10: begin
      ListSortField  := 'KUN_NUM';
      ListSortName   := _('Kundennummer');
    end;
    11: begin
      ListSortField  := 'PROJEKT';
      ListSortName   := _('Projekt');
    end;
    {RNUM}
    else begin 
      //Belegnummer1.Checked :=True;
      Listsortfield := 'length(VRENUM),VRENUM,RDATUM';
      ListSortName  := _('Belegnummer');
    end;
  end;

  if (ListSortField = LastSortField) and (ReEdiTab.Active) then 
    exit;

  ReEdiTab.Sql.Text := 'select * FROM JOURNAL ' +
    'where QUELLE=:QUELLE and QUELLE_SUB<>2 ' +
    'order by ' + ListSortField;

  ReEdiTab.ParamByName ('QUELLE').Value := BelegArt;

  //if Not First then UpdateQuery;

  QueryTime := GetTickCount;
  if not ReEdiTab.Active then
    ReEdiTab.Open
  else 
    ReEdiTab.Refresh;

  SF := Uppercase(ListSortField);
  if Pos('LENGTH(', SF) = 1 then 
    delete (SF, 1, length('LENGTH('));
  if Pos('KUN_NAME1', SF) = 1 then 
    SF := 'CALC_NAME';
  if Pos('STADIUM', SF) = 1 then
    SF := 'STADIUM_STR';
  for I := 0 to ReEdiListGrid.Columns.Count-1 do
  begin
    ReEdiListGrid.Columns[i].Title.Font.Style := [];
    if Pos(uppercase(ReEdiListGrid.Columns[i].Field.FieldName), SF) = 1 then 
      ReEdiListGrid.Columns[i].Title.Font.Style := [fsBold];
  end;

  QueryTime := GetTickCount - QueryTime;
  UpdateStatus;
end;

//------------------------------------------------------------------------------

end.

{

SQL-Script um alle Vorgänge/Rechnungen anzuzeigen bei denen
alle Positonen lieferbar sind (z.B. als Filter im Menü)

select J.REC_ID, J.VRENUM, J.RDATUM, J.KUN_NAME1,
COUNT(JP.REC_ID) as ANZ_POS,
SUM(A.MENGE_AKT>=JP.MENGE) as ANZ_POS_LIEFERBAR
from JOURNAL J

left outer JOIN JOURNALPOS JP on J.REC_ID=JP.JOURNAL_ID and JP.QUELLE=13 and JP.QUELLE_SUB!=2 and
JP.ARTIKELTYP IN("N","S")
left outer JOIN ARTIKEL A on JP.ARTIKEL_ID=A.REC_ID
where J.QUELLE=13 and J.QUELLE_SUB!=2
group by JP.JOURNAL_ID
/*having ANZ_POS=ANZ_POS_LIEFERBAR */

}
