{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Artikelstammdaten                                                 }
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
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt }
{ 15.05.2003 - Referenzen auf die RX-Tools entfernt und auf JediVCL umgestellt }
{ 18.05.2003 - Anpassungen für neue DB }
{            - Neue Eingabefelder für Menge-Bestellt und Bestellvorschlag }
{ 26.05.2003 - Historie um Angebote, Bestellungen und unfertige Belege erweitert }
{            - VK-Rabattgruppen und VK-Preis Feldbehandlung implementiert }
{ 31.05.2003 - Feld Artikelnummer wird jetzt bei der Eingabe auf doppeltes Vor- }
{              kommen geprüft und der Hintergrund rot angezeigt }
{ 10.06.2003 - Bug im MwSt-Auswahlfeld beseitigt }
{ 13.06.2003 - ShopEditor implementiert }
{ 22.06.2003 - Bedingte Compilierung für Artikel-Import entfernt, da Import jetzt }
{              auch im GNU-Source enthalten ist. }
{ 26.06.2003 - Die Übernahme des Kurztextes in den Langtext kann jetzt in der }
{              Registry MAIN\ARTIKEL->KURZTEXT_TO_LANGTEXT mit (0,1) ein- bzw. }
{              ausgeschaltet werden }
{ 29.06.2003 - Bug in Sortierung nach EK, VK1-VK4 gefixt (berechnete Felder) }
{ 05.07.2003 - Das Feld Suchbegriff auf 200 Zeichen verlängert }
{ 22.07.2003 - Funktion im Shop für Bilder-Upload hinzugefügt }
{ 25.07.2003 - diverse Feldänderungen im Shopbereich }
{ 27.07.2003 - neue Funktion für Artikel-Export hinzugefügt }
{            - Komponenten tSynEdit für den HTML-Shop-Langtext eingebaut }
{ 30.07.2003 - Bug bei Sortierung nach EK-Preis beseitigt }
{ 01.08.2003 - Default-Kalkulation über Faktoren eingebaut }
{ 02.08.2003 - Berechnung der Bruttopreise VK1B - VK5B hinzugefügt }
{ 20.08.2003 - Multiple Lieferantenpreise u. Bestellnummern jetzt möglich }
{              Ein Lieferantenpreis kann als "Default" gesetzt werden }
{ 27.08.2003 - Feld für abweichende Vertreterprovision eingebaut }
{ 06.08.2003 - Staffelpreise fertiggestellt }
{            - Eingestelltes Suchfeld wird jetzt gespeichert und wieder }
{              hergestellt }
{            - Sortierung wird gespeichert und wieder hergestellt }
{ 20.09.2003 - Merkmal-Anzeige eingebaut }
{            - Artikel-Stückliste um EK-Preis und Preissummierung erweitert }
{              EK-Summe kann jetzt als EK-Preis übernommen werden }
{ 25.09.2003 - sehr viele Änderungen an der Preisberechnung, Datenfelder und }
{              Edits werden jetzt über Tabellen angesprochen, somit sind auch }
{              Schleifen zur Berechnung möglich }
{ 16.10.2003 - neues Feld Hersteller-Artikelnummer hinzugefügt }
{ 17.10.2003 - die automatische Vergabe der Artikelnummern kann jetzt per }
{              Menüeintrag nachträglich erzwungen werden }
{ 22.10.2003 - Suche um Hersteller-Artikelnummer erweitert }
{            - Liste um Brutto-VK's erweitert }
{ 09.11.2003 - Bug bei Suche ohne Ergebnis mit anschließendem Enter gefixt }
{ 22.11.2003 - DLL-Plugin-Schnittstelle implementiert }
{ 16.01.2004 - Beim Erstellen des Langtextes aus einer Stückliste wird jetzt }
{              die Menge mit übernommen }
{ 26.06.2004 - Sortierung der Merkmale (Ausgewählt, Alpha) hinzugefügt }
{ 11.08.2004 - Bug bei extrem vielen Warengruppen (>500) beseitigt }
{              (erster Start des Artikelmoduls dauerte bis zu 5 Minuten) }
{ 21.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 24.11.2004 - Druckfunktionen in unit _printrech.pas verschoben. }
{ 26.02.2005 - Stornorechnungen werden jetzt in der Historie nicht mehr }
{              angezeigt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Artikel1;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, JvComponentBase, JvFormPlacement, DB,
  ZSqlUpdate, SynEditHighlighter, SynHighlighterHtml, Menus, ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvSpin, ComCtrls, JvExControls,
  JvComponent, JvSpeedButton, StdCtrls, Buttons, SynEdit, SynDBEdit, DBCtrls,
  DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ToolWin, Grids, JvExGrids,
  JvStringGrid, CheckLst, JvExCheckLst, JvCheckListBox, JvExMask, JvToolEdit,
  JvBaseEdits, Mask, VolDBEdit, OFGroupBox, JvExComCtrls, JvComCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

type
  TShopTyp = (stOSC, stXTC);

  TAddArtikelEvent = procedure (ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '') of object; //

  TWgrRec = Record
    ID    : Integer;
    Name  : String;
    TOP_ID: Integer;
    //Sort   : Boolean;
    FC_ID : Integer;
  end;
  
  TArtikelForm = class(TForm)
    MainMenu1: TJvMainMenu;
    MnuEdit: TMenuItem;
    MnuNew: TMenuItem;
    MnuDelete: TMenuItem;
    MnuSort: TMenuItem;
    MnuSortMatch: TMenuItem;
    MnuSortArtNo: TMenuItem;
    N1: TMenuItem;
    MnuSearch: TMenuItem;
    ArtikelPanel: TPanel;
    Art_PC: TJvPageControl;
    Allg_TS: TTabSheet;
    Preis_TS: TTabSheet;
    Hist_TS: TTabSheet;
    Such_TS: TTabSheet;
    HistSumBar: TStatusBar;
    ArtSuchGrid: TOFDBGrid;
    AS_DS: TDataSource;
    ArtPan: TPanel;
    ArtSuchenBtn: TJvSpeedButton;
    ArtHistorieBtn: TJvSpeedButton;
    ArtPreiseBtn: TJvSpeedButton;
    ArtAllgemeinBtn: TJvSpeedButton;
    ArtHirViewBtn: TJvSpeedButton;
    ArtWgrPan: TPanel;
    ArtWgrTV: TTreeView;
    Panel1: TPanel;
    ArtHirDockBtn: TJvSpeedButton;
    MnuView: TMenuItem;
    Allgemein1: TMenuItem;
    MengePreise1: TMenuItem;
    Historie1: TMenuItem;
    Liste1: TMenuItem;
    ArtikelToolbar1: TToolBar;
    DBNavigator1: TDBNavigator;
    Label31: TLabel;
    ToolButton9: TToolButton;
    SearchTimer: TTimer;
    ErweitertTS: TTabSheet;
    ArtErweitertBtn: TJvSpeedButton;
    Erweitert1: TMenuItem;
    Panel4: TPanel;
    SuchGB: TOFGroupBox;
    ArtikelTyp: TVolgaDBEdit;
    Label13: TLabel;
    Label30: TLabel;
    Ersatz_artnr: TDBEdit;
    Artikelnr: TDBEdit;
    Label12: TLabel;
    match: TDBEdit;
    Label11: TLabel;
    ZuwGB: TOFGroupBox;
    lagerort: TDBEdit;
    Land: TDBEdit;
    Land_CB: TDBLookupComboBox;
    Warengr: TDBEdit;
    Warengr_CB: TDBLookupComboBox;
    Warengruppe: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EinheitenGB: TOFGroupBox;
    Gewicht: TDBEdit;
    E_KTO: TDBEdit;
    A_KTO: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    Inventur_wert: TDBEdit;
    Label22: TLabel;
    Label19: TLabel;
    Label17: TLabel;
    MEinheit: TDBEdit;
    BewDatGB: TOFGroupBox;
    Label23: TLabel;
    MinMenge: TDBEdit;
    Label28: TLabel;
    Menge: TDBEdit;
    Panel5: TPanel;
    KurztextGB: TOFGroupBox;
    KasTextGB: TOFGroupBox;
    InfoGB: TOFGroupBox;
    LangtextGB: TOFGroupBox;
    InfoMemo: TDBMemo;
    LtextMemo: TDBMemo;
    kasname: TDBEdit;
    kurzname: TDBEdit;
    SerNoTab: TZQuery;
    SerNoDS: TDataSource;
    SerNoTabARTIKEL_ID: TIntegerField;
    SerNoTabSERNUMMER: TStringField;
    SerNoTabSNUM_ID: TIntegerField;
    STListTab: TZQuery;
    STListDS: TDataSource;
    STListTabREC_ID: TIntegerField;
    STListTabART_ID: TIntegerField;
    STListTabMENGE: TFloatField;
    STListTabERSTELLT: TDateField;
    STListTabERST_NAME: TStringField;
    STListTabGEAEND: TDateField;
    STListTabGEAEND_NAME: TStringField;
    MnuSaveLayout: TMenuItem;
    SuchFeldCB: TComboBox;
    Label52: TLabel;
    UebernahmeBtn1: TToolButton;
    N3: TMenuItem;
    Aktualisieren1: TMenuItem;
    MnuVisibleCol: TMenuItem;
    SpezialGB: TOFGroupBox;
    NO_EK: TDBCheckBox;
    NO_VK: TDBCheckBox;
    NO_BEZEICHNUNG: TDBCheckBox;
    NO_PROV: TDBCheckBox;
    NO_RABATT: TDBCheckBox;
    SerNoCB: TDBCheckBox;
    MwstCB: TVolgaDBEdit;
    Label53: TLabel;
    Label54: TLabel;
    dimension: TDBEdit;
    Groesse: TDBEdit;
    Label55: TLabel;
    Laenge: TDBEdit;
    N4: TMenuItem;
    Treffer1: TMenuItem;
    N101: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N5001: TMenuItem;
    alle1: TMenuItem;
    EK_Preis: TDBEdit;
    ListPreis: TDBEdit;
    EKPreisLab: TLabel;
    ListPreisLab: TLabel;
    MnuCopy: TMenuItem;
    gbVorgang: TOFGroupBox;
    HistGrid: TOFDBGrid;
    Panel2: TPanel;
    ToolBar99: TToolBar;
    Label27: TLabel;
    HistorySelCB: TComboBox;
    ToolButton1: TToolButton;
    Label26: TLabel;
    JahrCB: TComboBox;
    ToolButton3: TToolButton;
    MnuDatei: TMenuItem;
    MnuViewEK: TMenuItem;
    MnuClose: TMenuItem;
    MnuPrint: TMenuItem;
    MnuPrintList: TMenuItem;
    FaktorLab: TLabel;
    GewinnFaktor: TJvCalcEdit;  //TJvxCurrencyEdi;
    N6: TMenuItem;
    MnuExtras: TMenuItem;
    ArtikelZusammenfassen1: TMenuItem;
    Label46: TLabel;
    BrLiPreisLab: TLabel;
    BruttoPreis: TDBEdit;
    N5: TMenuItem;
    MnuImportUpdate: TMenuItem;
    RabGrpLoCB: TDBLookupComboBox;
    JumpMenu: TPopupMenu;
    JumpMen1: TMenuItem;
    N7: TMenuItem;
    Rechnungdrucken1: TMenuItem;
    MEBestellt: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    ME_Bestvorschlag: TDBEdit;
    MnuDiscountGroup: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ShopTS: TTabSheet;
    ArtShopBtn: TJvSpeedButton;
    Shop1: TMenuItem;
    ArtKatDS: TDataSource;
    ArtKat: TZQuery;
    ShopRightPanel: TPanel;
    N10: TMenuItem;
    MnuExportCSV: TMenuItem;
    SaveDialog1: TSaveDialog;
    SynHTMLSyn1: TSynHTMLSyn;
    ArtikelUpdateSql: TZUpdateSql;
    ArtPreisTab: TZQuery;
    ArtPreisDS: TDataSource;
    ArtPreisTabARTIKEL_ID: TIntegerField;
    ArtPreisTabADRESS_ID: TIntegerField;
    ArtPreisTabPREIS_TYP: TIntegerField;
    ArtPreisTabBESTNUM: TStringField;
    ArtPreisTabPREIS: TFloatField;
    ArtPreisTabINFO: TMemoField;
    ArtPreisTabGEAEND: TDateTimeField;
    ArtPreisTabGEAEND_NAME: TStringField;
    ArtPreisTabLieferantStr: TStringField;
    Label47: TLabel;
    provision: TDBEdit;
    ArtPreisPanel: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    PreisPC: TJvPageControl;
    PreisStdTS: TTabSheet;
    StaffelpreisTS: TTabSheet;
    KunPreisTS: TTabSheet;
    LiefPreisTS: TTabSheet;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel19: TPanel;
    ArtLiefPreisGrid: TOFDBGrid;
    Panel12: TPanel;
    ToolBar3: TToolBar;
    NewLiefPreisBtn: TToolButton;
    ToolButton11: TToolButton;
    LiefStdBtn: TToolButton;
    ToolButton7: TToolButton;
    LiefDelBtn: TToolButton;
    EKPreisGB: TOFGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ekpreis: TDBEdit;
    lastekpreis: TDBEdit;
    VKPreisGB: TOFGroupBox;
    vk5lab: TLabel;
    vk4lab: TLabel;
    vk3lab: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    MwStLabel: TLabel;
    Label32: TLabel;
    vk5_rgw: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk4_rgw: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk3_rgw: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk2_rgw: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk1_rgw: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk1_brutto: TDBEdit;
    vk1_mwst: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk2_brutto: TDBEdit;
    vk3_brutto: TDBEdit;
    vk4_brutto: TDBEdit;
    vk5_brutto: TDBEdit;
    vk5_mwst: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk4_mwst: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk3_mwst: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk2_mwst: TJvCalcEdit;  //TJvxCurrencyEdi;
    vk2: TDBEdit;
    vk1: TDBEdit;
    vk3: TDBEdit;
    vk4: TDBEdit;
    vk5: TDBEdit;
    Panel20: TPanel;
    N2: TMenuItem;
    uebernehmen1: TMenuItem;
    CaoGroupBox5: TOFGroupBox;
    Panel10: TPanel;
    ArtPreisTabPREIS2: TFloatField;
    ArtPreisTabPREIS3: TFloatField;
    ArtPreisTabPREIS4: TFloatField;
    ArtPreisTabPREIS5: TFloatField;
    ToolButton4: TToolButton;
    LiefPreisSaveBtn: TToolButton;
    ToolButton13: TToolButton;
    LiefPreisAbortBtn: TToolButton;
    ToolBar4: TToolBar;
    KunPreisNeuBtn: TToolButton;
    ToolButton16: TToolButton;
    KunPreisDelBtn: TToolButton;
    ToolButton20: TToolButton;
    KunPreisSaveBtn: TToolButton;
    ToolButton22: TToolButton;
    KunPreisAbortBtn: TToolButton;
    Panel21: TPanel;
    ArtKunPreisGrid: TOFDBGrid;
    PreisGrid: TJvStringGrid;
    Label48: TLabel;
    VPE: TDBEdit;
    MerkmalTab: TZQuery;
    MerkmalTabMERKMAL_ID: TIntegerField;
    STListTabARTNUM: TStringField;
    STListTabMATCHCODE: TStringField;
    STListTabBARCODE: TStringField;
    STListTabKURZNAME: TStringField;
    STListTabEK_PREIS: TFloatField;
    StListUpdSQL: TZUpdateSql;
    Belegbearbeiten1: TMenuItem;
    zumJournal1: TMenuItem;
    SuchBeg: TEdit;
    JumpMenuBtn: TJvSpeedButton;
    STListTabMENGE_AKT: TFloatField;
    AddMengeLab: TLabel;
    AddMengeEdi: TJvSpinEdit;
    Label57: TLabel;
    Artikelnummernvergeben1: TMenuItem;
    MnuDelAllArtikelFromWGR: TMenuItem;
    Link_TS: TTabSheet;
    Dateien1: TMenuItem;
    MerkmaleCB: TOFGroupBox;
    ArtMerkmalLB: TJvCheckListBox;
    HerstellerEdiBtn: TSpeedButton;
    Hersteller_CB: TDBLookupComboBox;
    Label68: TLabel;
    Label56: TLabel;
    HerstArtnum: TDBEdit;
    Label16: TLabel;
    barcode: TDBEdit;
    ArtLinkBtn: TJvSpeedButton;
    gbDateiLink: TOFGroupBox;
    LinkPanel: TPanel;
    ErweitertPC: TJvPageControl;
    SerNoTS: TTabSheet;
    StueckListTS: TTabSheet;
    Panel57: TPanel;
    ArtikelSetTS: TTabSheet;
    ZubehoerTS: TTabSheet;
    ErsatzteilTS: TTabSheet;
    gbSNListe: TOFGroupBox;
    SerNoGrid: TOFDBGrid;
    gbSNDetails: TOFGroupBox;
    gbSNErfassen: TOFGroupBox;
    SNEdit: TEdit;
    SNAddBtn: TButton;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    DBNavigator2: TDBNavigator;
    ToolButton8: TToolButton;
    STListArtDelBtn: TToolButton;
    gbStuecklstSumme: TOFGroupBox;
    Label49: TLabel;
    STListPreisUebernehmenBtn: TSpeedButton;
    STListSumEK: TJvCalcEdit;
    gbStueckliste: TOFGroupBox;
    STListGrid: TOFDBGrid;
    Panel16: TPanel;
    UserFelderTS: TTabSheet;
    Panel17: TPanel;
    gbBenutzerfelder: TOFGroupBox;
    Panel18: TPanel;
    gbZubehoer: TOFGroupBox;
    UFeld01Lab: TLabel;
    UFeld02Lab: TLabel;
    Userfeld01: TDBEdit;
    Userfeld02: TDBEdit;
    Userfeld03: TDBEdit;
    UFeld03Lab: TLabel;
    Userfeld04: TDBEdit;
    UFeld04Lab: TLabel;
    Userfeld05: TDBEdit;
    UFeld05Lab: TLabel;
    Userfeld06: TDBEdit;
    UFeld06Lab: TLabel;
    Userfeld07: TDBEdit;
    UFeld07Lab: TLabel;
    Userfeld08: TDBEdit;
    UFeld08Lab: TLabel;
    Userfeld09: TDBEdit;
    UFeld09Lab: TLabel;
    Userfeld10: TDBEdit;
    UFeld10Lab: TLabel;
    STListTabARTIKEL_ART: TStringField;
    ZubGrid: TOFDBGrid;
    Panel22: TPanel;
    gbErsatzteile: TOFGroupBox;
    ErsGrid: TOFDBGrid;
    N12: TMenuItem;
    MnuExtSearch: TMenuItem;
    SetLangTextfromStklBtn: TSpeedButton;
    JvxSplitter2: TSplitter;
    SB1: TStatusBar;
    ArtTopPanelPreise: TPanel;
    ArtTopPanelErweitert: TPanel;
    ArtTopPanelDateien: TPanel;
    ArtTopPanelHistorie: TPanel;
    ArtKopfGB: TOFGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    FormStorage1: TJvFormStorage;
    bernehmenundSchlieen1: TMenuItem;
    MnuSearchSerNo: TMenuItem;
    ASQuery: TOFZQuery;
    ASQueryREC_ID: TIntegerField;
    ASQueryWARENGRUPPE: TIntegerField;
    ASQueryMATCHCODE: TStringField;
    ASQueryARTNUM: TStringField;
    ASQueryBARCODE: TStringField;
    ASQueryKURZNAME: TStringField;
    ASQueryLANGNAME: TBlobField;
    ASQueryVK1: TFloatField;
    ASQueryVK1B: TFloatField;
    ASQueryCALC_VK1: TFloatField;
    ASQueryCALC_VK1B: TFloatField;
    ASQueryVK2: TFloatField;
    ASQueryVK2B: TFloatField;
    ASQueryCALC_VK2: TFloatField;
    ASQueryCALC_VK2B: TFloatField;
    ASQueryVK3: TFloatField;
    ASQueryVK3B: TFloatField;
    ASQueryCALC_VK3: TFloatField;
    ASQueryCALC_VK3B: TFloatField;
    ASQueryVK4: TFloatField;
    ASQueryVK4B: TFloatField;
    ASQueryCALC_VK4: TFloatField;
    ASQueryCALC_VK4B: TFloatField;
    ASQueryVK5: TFloatField;
    ASQueryVK5B: TFloatField;
    ASQuerySTEUER_CODE: TIntegerField;
    ASQueryARTIKELTYP: TStringField;
    ASQueryME_EINHEIT: TStringField;
    ASQueryERLOES_KTO: TIntegerField;
    ASQueryAUFW_KTO: TIntegerField;
    ASQueryMENGE_AKT: TFloatField;
    ASQueryERSATZ_ARTNUM: TStringField;
    ASQueryKAS_NAME: TStringField;
    ASQueryINFO: TBlobField;
    ASQueryPR_EINHEIT: TFloatField;
    ASQueryLAENGE: TStringField;
    ASQueryGROESSE: TStringField;
    ASQueryDIMENSION: TStringField;
    ASQueryGEWICHT: TFloatField;
    ASQueryINVENTUR_WERT: TFloatField;
    ASQueryPROVIS_PROZ: TFloatField;
    ASQueryEK_PREIS: TFloatField;
    ASQueryCALC_EK: TFloatField;
    ASQueryMENGE_START: TFloatField;
    ASQueryMENGE_MIN: TFloatField;
    ASQueryMENGE_BESTELLT: TFloatField;
    ASQueryMENGE_BVOR: TFloatField;
    ASQueryHERKUNFTSLAND: TStringField;
    ASQueryHERSTELLER_NAME: TStringField;
    ASQueryHERSTELLER_ID: TIntegerField;
    ASQueryLAGERORT: TStringField;
    ASQueryERSTELLT: TDateField;
    ASQueryERST_NAME: TStringField;
    ASQueryGEAEND: TDateField;
    ASQueryGEAEND_NAME: TStringField;
    ASQueryRABGRP_ID: TStringField;
    ASQueryAUTODEL_FLAG: TBooleanField;
    ASQuerySN_FLAG: TBooleanField;
    ASQueryNO_RABATT_FLAG: TBooleanField;
    ASQueryNO_PROVISION_FLAG: TBooleanField;
    ASQueryNO_BEZEDIT_FLAG: TBooleanField;
    ASQueryNO_EK_FLAG: TBooleanField;
    ASQueryNO_VK_FLAG: TBooleanField;
    ASQueryALTTEIL_FLAG: TBooleanField;
    ASQuerySHOP_ID: TIntegerField;
    ASQuerySHOP_LANGTEXT: TMemoField;
    ASQuerySHOP_IMAGE: TStringField;
    ASQuerySHOP_IMAGE_MED: TStringField;
    ASQuerySHOP_IMAGE_LARGE: TStringField;
    ASQuerySHOP_DATENBLATT: TStringField;
    ASQuerySHOP_PREIS_LISTE: TFloatField;
    ASQuerySHOP_CHANGE_DATE: TDateTimeField;
    ASQuerySHOP_CHANGE_FLAG: TIntegerField;
    ASQuerySHOP_ARTIKEL_ID: TIntegerField;
    ASQuerySHOP_VISIBLE: TIntegerField;
    ASQuerySHOP_DEL_FLAG: TBooleanField;
    ASQueryDEFAULT_LIEF_ID: TIntegerField;
    ASQueryVPE: TIntegerField;
    ASQueryHERST_ARTNUM: TStringField;
    ASQueryUSERFELD_01: TStringField;
    ASQueryUSERFELD_02: TStringField;
    ASQueryUSERFELD_03: TStringField;
    ASQueryUSERFELD_04: TStringField;
    ASQueryUSERFELD_05: TStringField;
    ASQueryUSERFELD_06: TStringField;
    ASQueryUSERFELD_07: TStringField;
    ASQueryUSERFELD_08: TStringField;
    ASQueryUSERFELD_09: TStringField;
    ASQueryUSERFELD_10: TStringField;
    MnuPrintPartList: TMenuItem;
    ASQueryLN: TStringField;
    MnuPrintHistory: TMenuItem;
    MerkmalTabFLAG: TLargeintField;
    MerkmalTabNAME: TStringField;
    SerNoTabSTATUS: TStringField;
    ArtPreisTabFAKTOR2: TFloatField;
    ArtPreisTabFAKTOR3: TFloatField;
    ArtPreisTabFAKTOR4: TFloatField;
    ArtPreisTabFAKTOR5: TFloatField;
    ArtPreisTabGUELTIG_VON: TDateField;
    ArtPreisTabGUELTIG_BIS: TDateField;
    ArtKatUpdateSql: TZUpdateSql;
    MnuPrintArtikel: TMenuItem;

    JPosTab: TZQuery;
    JPosTabWAEHRUNG: TStringField;
    JPosTabEPREIS_STR: TStringField;
    JPosTabGPREIS_STR: TStringField;
    JPosTabQUELLE: TIntegerField;
    JPosTabVRENUM: TStringField;
    JPosTabMENGE: TFloatField;
    JPosTabEPREIS: TFloatField;
    JPosTabRABATT: TFloatField;
    JPosTabCalcQuelle: TStringField;
    JPosTabRDATUM: TDateField;
    JPosTabKUN_NAME1: TStringField;
    JPosTabKUN_ANREDE: TStringField;
    JPosTabKUN_NAME2: TStringField;
    JPosTabKUN_NAME3: TStringField;
    JPosTabCALC_KUNDE: TStringField;
    JPosTabMWST_0: TFloatField;
    JPosTabMWST_1: TFloatField;
    JPosTabMWST_2: TFloatField;
    JPosTabMWST_3: TFloatField;
    JPosTabSTEUER_CODE: TIntegerField;
    JPosTabSTEUER_PROZ: TFloatField;
    JPosTabLDATUM: TDateField;
    JPosTabVLSNUM: TStringField;
    JPosTabBRUTTO_FLAG: TBooleanField;
    JPosTabJOURNAL_ID: TIntegerField;
    
    JPosDS: TDataSource;
    ASQuerySHOP_KURZTEXT: TMemoField;
    ASQuerySHOP_META_TITEL: TStringField;
    ASQuerySHOP_META_BESCHR: TMemoField;
    ASQuerySHOP_META_KEY: TStringField;
    ShopLeftPanel: TPanel;
    ShopAllgGB: TOFGroupBox;
    ShopImageLab: TLabel;
    ShopPreisLab: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    ShopImageMedLab: TLabel;
    ShopImageLargeLab: TLabel;
    ProdImageUploadBtn: TSpeedButton;
    ProdImageMedUploadBtn: TSpeedButton;
    ProdImageLargeUploadBtn: TSpeedButton;
    DBEdit18: TDBEdit;
    DBEdit17: TDBEdit;
    ShopImgEdi: TDBEdit;
    ShopPreisEdi: TDBEdit;
    ShopArtLB: TVolgaDBEdit;
    ShopProdUrlEdi: TDBEdit;
    ShopModellEdi: TDBEdit;
    ShopArtName: TDBEdit;
    ShopDivGB: TOFGroupBox;
    ShopAktivCB: TDBCheckBox;
    ShopDelCB: TDBCheckBox;
    ShopKatGB: TOFGroupBox;
    ArtKatGrid: TOFDBGrid;
    ShopBeschrGB: TOFGroupBox;
    Label62: TLabel;
    DBSynEdit1: TDBSynEdit;
    ShopKurztextGB: TOFGroupBox;
    ShopKurztext: TDBSynEdit;
    CaoGroupBox1: TOFGroupBox;
    MetaTitel: TDBEdit;
    MetaKey: TDBEdit;
    MetaBeschreibung: TDBMemo;
    Label10: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    HTMLEditPanel1: TPanel;
    HTMLEditBtn1: TBitBtn;
    ArtPreisTabMENGE2: TLargeintField;
    ArtPreisTabPREIS2_AUTO: TBooleanField;
    ArtPreisTabMENGE3: TLargeintField;
    ArtPreisTabMENGE4: TLargeintField;
    ArtPreisTabMENGE5: TLargeintField;
    ArtPreisTabPREIS3_AUTO: TBooleanField;
    ArtPreisTabPREIS4_AUTO: TBooleanField;
    ArtPreisTabPREIS5_AUTO: TBooleanField;
    ArtPreisTabVPE: TLargeintField;
    
    procedure Art_PCChange(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure ARTIKEL_GRDTitleClick(Column: TColumn);
    procedure JahrCBChange(Sender: TObject);
    procedure UebernahmeBtn1Click(Sender: TObject);
    procedure ArtSuchGridDblClick(Sender: TObject);
    procedure ASQueryAfterScroll(DataSet: TDataSet);
    procedure matchKeyPress(Sender: TObject; var Key: Char);
    procedure matchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vk1Change(Sender: TObject);
    procedure vk1_bruttoChange(Sender: TObject);
    procedure vk1_rgwChange(Sender: TObject);
    procedure MengeChange(Sender: TObject);
    procedure ArtSuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure JPosTabCalcFields(DataSet: TDataSet);
    procedure ASQueryBeforePost(DataSet: TDataSet);
    procedure AS_DSDataChange(Sender: TObject; Field: TField);
    procedure ArtAllgemeinBtnClick(Sender: TObject);
    procedure ArtHirViewBtnClick(Sender: TObject);
    procedure ArtWgrTVDblClick(Sender: TObject);
    procedure ArtWgrTVExit(Sender: TObject);
    procedure ArtHirDockBtnClick(Sender: TObject);
    procedure ArtikelPanelResize(Sender: TObject);
    procedure ArtWgrTVChange(Sender: TObject; Node: TTreeNode);
    procedure SuchbegChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure SerNoTabBeforePost(DataSet: TDataSet);
    procedure STListTabBeforePost(DataSet: TDataSet);
    procedure SNEditChange(Sender: TObject);
    procedure SNAddBtnClick(Sender: TObject);
    procedure MnuSaveLayoutClick(Sender: TObject);
    procedure SuchFeldCBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure MnuVisibleColClick(Sender: TObject);
    procedure MnuNewClick(Sender: TObject);
    procedure MnuDeleteClick(Sender: TObject);
    procedure kurznameExit(Sender: TObject);
    procedure ASQueryBeforeDelete(DataSet: TDataSet);
    procedure ToolButton8Click(Sender: TObject);
    procedure STListTabAfterOpen(DataSet: TDataSet);
    procedure STListArtDelBtnClick(Sender: TObject);
    procedure LtextMemoExit(Sender: TObject);
    procedure MnuSearchClick(Sender: TObject);
    procedure alle1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SuchbegKeyPress(Sender: TObject; var Key: Char);
    procedure MnuCopyClick(Sender: TObject);
    procedure matchEnter(Sender: TObject);
    procedure matchExit(Sender: TObject);
    procedure MnuViewEKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ASQueryNewRecord(DataSet: TDataSet);
    procedure ASQueryBeforeInsert(DataSet: TDataSet);
    procedure ArtSuchGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure MnuCloseClick(Sender: TObject);
    procedure MnuPrintListClick(Sender: TObject);
    procedure EK_PreisChange(Sender: TObject);
    procedure GewinnFaktorChange(Sender: TObject);
    procedure ArtikelZusammenfassen1Click(Sender: TObject);
    procedure MnuImportUpdateClick(Sender: TObject);
    procedure ArtAllgemeinBtnMouseEnter(Sender: TObject);
    procedure ArtAllgemeinBtnMouseLeave(Sender: TObject);
    procedure ASQueryCalcFields(DataSet: TDataSet);
    procedure Rechnungdrucken1Click(Sender: TObject);
    procedure JumpMenuPopup(Sender: TObject);
    procedure MnuDiscountGroupClick(Sender: TObject);
    procedure ArtikelnrChange(Sender: TObject);
    procedure ArtKatBtnClick(Sender: TObject);
    procedure ProdImageUploadBtnClick(Sender: TObject);
    procedure MnuExportCSVClick(Sender: TObject);
    procedure ArtPreisTabCalcFields(DataSet: TDataSet);
    procedure ArtPreisTabBeforePost(DataSet: TDataSet);
    procedure ASQueryBeforeScroll(DataSet: TDataSet);
    procedure ASQueryUpdateRecord(DataSet: TDataSet;
    UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure HerstellerEdiBtnClick(Sender: TObject);
    procedure ASQueryPostError(DataSet: TDataSet; E: EDatabaseError;
    var Action: TDataAction);
    procedure LiefDelBtnClick(Sender: TObject);
    procedure ArtPreisTabAfterScroll(DataSet: TDataSet);
    procedure LiefStdBtnClick(Sender: TObject);
    procedure ArtLiefPreisGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure MwstCBChange(Sender: TObject);
    procedure PreisPCChange(Sender: TObject);
    procedure NewLiefPreisBtnClick(Sender: TObject);
    procedure LiefPreisSaveBtnClick(Sender: TObject);
    procedure LiefPreisAbortBtnClick(Sender: TObject);
    procedure ArtPreisDSDataChange(Sender: TObject; Field: TField);
    procedure CalcStaffelPreise(Sender: TObject);
    procedure PreisGridKeyPress(Sender: TObject; var Key: Char);
    procedure PreisGridSelectCell(Sender: TObject; ACol, ARow: Integer;
    var CanSelect: Boolean);
    procedure PreisGridSetCanvasProperties(Sender: TObject; ACol,
    ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure PreisGridExitCell(Sender: TJvStringGrid; AColumn,
    ARow: Integer; const EditText: String);
    procedure PreisPCChanging(Sender: TObject; var AllowChange: Boolean);
    procedure PreisGridGetEditText(Sender: TObject; ACol, ARow: Integer;
    var Value: String);
    procedure ArtMerkmalLBClickCheck(Sender: TObject);
    procedure STListPreisUebernehmenBtnClick(Sender: TObject);
    procedure Belegbearbeiten1Click(Sender: TObject);
    procedure zumJournal1Click(Sender: TObject);
    procedure EK_PreisKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure ShopPreisEdiExit(Sender: TObject);
    procedure Artikelnummernvergeben1Click(Sender: TObject);
    procedure MnuDelAllArtikelFromWGRClick(Sender: TObject);
    procedure MnuExtSearchClick(Sender: TObject);
    procedure SetLangTextfromStklBtnClick(Sender: TObject);
    procedure ArtWgrPanResize(Sender: TObject);
    procedure bernehmenundSchlieen1Click(Sender: TObject);
    procedure MnuSearchSerNoClick(Sender: TObject);
    procedure MnuPrintPartListClick(Sender: TObject);
    procedure MnuPrintHistoryClick(Sender: TObject);
    procedure ArtKatAfterPost(DataSet: TDataSet);
    procedure ArtKatNewRecord(DataSet: TDataSet);
    procedure ArtKatGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure ArtKatBeforeEdit(DataSet: TDataSet);
    procedure ArtKatBeforePost(DataSet: TDataSet);
    procedure ArtKatGridKeyPress(Sender: TObject; var Key: Char);
    procedure LockError(Error: Integer);
    procedure MnuPrintArtikelClick(Sender: TObject);
    procedure HTMLEditBtn1Click(Sender: TObject);
    procedure ArtikelUpdateSqlBeforeInsertSQL(Sender: TObject);
    procedure ArtikelUpdateSqlBeforeModifySQL(Sender: TObject);
  private
    { Private-Deklarationen }
    
    searchtime : Integer;
    QueryTime  : Integer;
    Limit      : Integer;
    
    sortname   : string;
    SortField  : String;
    SuchBegr   : String;
    WGR        : Integer;
    WgrMitNr   : Boolean;
    WgrSort    : Integer;
    aktsort    : integer;
    
    shop_faktor: Double;
    ShopTyp    : tShopTyp;
    
    BN_CALC_SCHRANKE: Double;
    
    Update     : Boolean;
    ArtWgrDok  : Boolean;
    LastF9     : Boolean;
    
    K2L        : Boolean; // Kurztext in Langtext übernehmen
    
    Artikel_SQL: String;
    
    LastArtikelTyp: String;
    InSListAdd    : Boolean;
    
    ME_EDIT       : Boolean;
    //ME_EKBEST_EDIT : Boolean;
    
    LastID        : Integer;
    
    InFaktorUpdate: Boolean;
    
    LastFocus     : HWND;
    
    ZusammenFassenID: Integer;
    ZusammenFassenMenge: Double;
    
    jour_mwst_tab: array[0..3] of double;
    
    // Hilfsarray um über eine Tab. auf die VK's zuzugreifen
    VKTab        : array[1..5] of tFloatField;
    VKBTab       : array[1..5] of tFloatField;
    CalcVKTab    : array[1..5] of tFloatField;
    CalcVKBTab   : array[1..5] of tFloatField;
    
    
    VKMwStTab    : array[1..5] of TJvCalcEdit;  //TJvxCurrencyEdi;
    VKRgwTab     : array[1..5] of TJvCalcEdit;  //TJvxCurrencyEdi;
    
    ShopVK       : Integer; // 1=VK1..5=VK5, -1=kein sep. Shoppreis
    BruttoShop   : Boolean;
    
    MassLoesch   : Boolean;
    
    procedure OnAddArtikelToStueckList (ID: Integer; Menge, EPreis, Rabatt: Double;
    AlternativArtnum: String = '');
    procedure OnArtikelZusammenfassen (ID: Integer; Menge, EPreis, Rabatt: Double;
    AlternativArtnum: String = '');
    
    procedure SetSort (Sort: Integer);
    procedure UpdateQuery (ExtSearchSQL: String = '');
    procedure UpdateHistory;
    procedure UpdateStatus;
    procedure UpdateGewinnFaktor;
    procedure UpdateMekrmale (ID: Integer);
    procedure UpdateDateien;
    procedure CheckSaved;

    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    First            : Boolean;
    OnlyOneArtikel   : Boolean; // wenn True, wird das Fenser nach der
    // Artikelübernahme geschlossen;
    ArtnumAuto       : Boolean;
    OnAddArtikel     : TAddArtikelEvent; //
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure F9Change (Ein: Boolean);
  end;

var
  ArtikelForm: TArtikelForm;

implementation

uses
  gnugettext, JclStrings,
  OF_DM, OF_Tool1, OF_Function,
  OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_DBGrid_Layout,
  OF_Link, OF_ArtSernumSuchDlg, OF_Artikel_Import,
  OF_RabGrp, OF_Artikel_Kat, OF_ShopImageUpload,
  OF_Hersteller, OF_Progress, OF_Kunde,
  OF_Logging, OF_Plugin_Def, OF_Plugin_Func;

{$R *.DFM}

//----------------------------DLL-STUFF-----------------------------------------
var
  SuchDLL         : tHandle;
  CaoPluginExecCmd: TOFPluginExecCmd;
  CaoPluginInit   : TOFPluginInit;
//------------------------------------------------------------------------------
  
Const
  ModulID: Integer = 1020;

procedure TArtikelForm.FormCreate(Sender: TObject);
var 
  i: Integer;
  JA, MO, TA: Word;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  { TODO : WordWrap in TSynEdit gibt es so nicht mehr } //17.10.09-ud.
  //TSynEdit(DBSynEdit1).WordWrap := True;
  //TSynEdit(ShopKurztext).WordWrap := True;

  SuchDLL           := 0;
  CaoPluginExecCmd  := nil;
  CaoPluginInit     := nil;

  OnlyOneArtikel    := False;
  InFaktorUpdate    := False;
  Limit             := 50;
  InSListAdd        := False;
  OnAddArtikel      := nil;
  OnUpdateStatusBar := nil;
  //Scaled            := TRUE;
  LastID            := -1;
  ME_EDIT           := False;
  //ME_EKBEST_EDIT    := False;
  Artikel_SQL       := '';
  Update            := False;
  LastArtikelTyp    := '';
  First             := True;
  WGr               := 0;
  K2L               := True;
  ArtnumAuto        := False;
  ShopVK            := -1;
  MassLoesch        := False;

  shop_faktor       := 0;

  //For i :=1 to 5 do FaktorTab[i] :=0;

  BN_CALC_SCHRANKE  := 0;

  SetSOrt (1);
  JahrCB.Items.Clear;
  JahrCB.Items.Add (_('alles'));
  decodedate (now, ja, mo, ta);
  for i := 1993 to ja do JahrCB.Items.Add(inttostr(i));
  JahrCB.Itemindex := Ja - 1993 + 1; // aktuelles Jahr
  HistorySelCB.ItemIndex := 0; // alles

  SuchFeldCB.ItemIndex := 0;

  ArtHirViewBtn.Align         := alLeft;
  ArtAllgemeinBtn.Align       := alRight;
  ArtPreiseBtn.Align          := alRight;
  ArtErweitertBtn.Align       := alRight;
  ArtShopBtn.Align            := alRight;
  ArtHistorieBtn.Align        := alRight;
  ArtLinkBtn.Align            := alRight;
  ArtSuchenBtn.Align          := alRight;

  ArtAllgemeinBtn.Font.Color  := clwhite;
  ArtPreiseBtn.Font.Color     := clwhite;
  ArtErweitertBtn.Font.Color  := clwhite;
  ArtHistorieBtn.Font.Color   := clwhite;
  ArtSuchenBtn.Font.Color     := clwhite;
  ArtShopBtn.Font.Color       := clWhite;
  ArtLinkBtn.Font.Color       := clWhite;
  ArtAllgemeinBtn.Font.Style  := [fsBold];

  LastFocus     := 0;
  VKTab[1]      := ASQueryVK1;
  VKTab[2]      := ASQueryVK2;
  VKTab[3]      := ASQueryVK3;
  VKTab[4]      := ASQueryVK4;
  VKTab[5]      := ASQueryVK5;
  CalcVKBTab[1] := ASQueryCALC_VK1B;
  CalcVKBTab[2] := ASQueryCALC_VK2B;
  CalcVKBTab[3] := ASQueryCALC_VK3B;
  CalcVKBTab[4] := ASQueryCALC_VK4B;
  CalcVKBTab[5] := ASQueryVK5B;
  VKBTab[1]     := ASQueryVK1B;
  VKBTab[2]     := ASQueryVK2B;
  VKBTab[3]     := ASQueryVK3B;
  VKBTab[4]     := ASQueryVK4B;
  VKBTab[5]     := ASQueryVK5B;
  CalcVKTab[1]  := ASQueryCALC_VK1;
  CalcVKTab[2]  := ASQueryCALC_VK2;
  CalcVKTab[3]  := ASQueryCALC_VK3;
  CalcVKTab[4]  := ASQueryCALC_VK4;
  CalcVKTab[5]  := ASQueryVK5;
  VKMwStTab[1]  := vk1_mwst; VKRgwTab[1] := vk1_rgw;
  VKMwStTab[2]  := vk2_mwst; VKRgwTab[2] := vk2_rgw;
  VKMwStTab[3]  := vk3_mwst; VKRgwTab[3] := vk3_rgw;
  VKMwStTab[4]  := vk4_mwst; VKRgwTab[4] := vk4_rgw;
  VKMwStTab[5]  := vk5_mwst; VKRgwTab[5] := vk5_rgw;

  {$IFDEF PRO}
  HTMLEditPanel1.Visible := True;
  {$ELSE}
  HTMLEditPanel1.Visible := False;
  {$ENDIF}

  //HELP-ID's
  ArtikelPanel.HelpContext    := 2000;
  Allg_TS.HelpContext         := 2000;
  Preis_TS.HelpContext        := 2100;
  ErweitertTS.HelpContext     := 2200;
  ShopTS.HelpContext          := 2300;
  Link_TS.HelpContext         := 2400;
  Hist_TS.HelpContext         := 2500;

  Such_TS.HelpContext         := 2600;
  PreisStdTS.HelpContext      := 2650;
  StaffelpreisTS.HelpContext  := 2700;
  KunPreisTS.HelpContext      := 2750;
  LiefPreisTS.HelpContext     := 2800;
  SerNoTS.HelpContext         := 2850;
  StueckListTS.HelpContext    := 2900;
  ArtikelSetTS.HelpContext    := 2950;
  ZubehoerTS.HelpContext      := 3000;
  ErsatzteilTS.HelpContext    := 3050;
  UserFelderTS.HelpContext    := 3100;
  {
  if Screen.PixelsPerInch <> 96 then
  begin
  Self.ScaleBy (96, Screen.PixelsPerInch);
  Refresh;
  end;
  }

  //ASQuery.BeforeDelete :=ASQueryBeforeDelete;
  //ASQuery.BeforeInsert :=ASQueryBeforeInsert;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.FormActivate(Sender: TObject);
var 
  WgrA: array of tWgrRec;
  
  Procedure Add( Node: tTreeNode; Top_ID, StartIdx: Integer);
  var 
    i, j: integer; 
    Node1: TTreeNode;
  begin
    for i := StartIdx to length(WGRA)-1 do
    begin
      if WGRA[i].TOP_ID <> TOP_ID then 
        break;

      Node1 := ArtWgrTV.Items.AddChild (Node, WGRA[i].Name);
      Node1.Data := Pointer(WGRA[i].ID);

      if WGRA[i].FC_ID > 0 then 
        Add( Node1, WGRA[i].ID, WGRA[i].FC_ID);
    end;
  end;

var 
  me, i, j, id       : integer;
  tn, wtn, merkmal_tn: ttreenode;
  res                : boolean;
  S, DLLName, WgrName: String;
  FuncPTR            : TFarProc;

begin
  setlength(wgra, 0);

  id := LastID;
  if First then
  begin
    // NEU Erweiterte SuchDLL laden
    DLLName := DM1.ReadString('MAIN\ARTIKEL', 'SUCH_DLL', '');  //Do not Localize

    if Pos('%APPDIR%', DLLName) > 0 then
      StrReplace(DLLName, '%APPDIR%', ExtractFilePath(Paramstr(0)), []);


    if assigned(LogForm) then 
      logform.addlog ('ARTIKEL: DLL ' + DLLName);
    if (not FileExists(DLLName)) and (assigned(LogForm)) then 
      logform.addlog(_('ARTIKEL: DLL nicht gefunden'));

    if (length(DLLName) > 0) and (FileExists(DLLName)) and (SuchDLL = 0) then
    begin
      FuncPtr := nil;
      try
        SuchDLL := LoadLibrary(PChar(DLLName));
        if SuchDLL <> 0 then
        begin
          FuncPtr := GetProcAddress(SuchDLL, 'CaoPluginExecCmd');  //Do not Localize
          if assigned(FuncPtr) then 
            @CaoPluginExecCmd := FuncPTR;

          FuncPtr := GetProcAddress(SuchDLL, 'CaoPluginInit'); //Do not Localize
          if assigned(FuncPtr) then
          begin
            // Init aufrufen und CallBackFunktionen der DLL mitteilen

            @CaoPluginInit := FuncPTR;
            CaoPluginInit(PChar(DM1.AktMandant), GetCaoRegistryFunc);
          end;

          if assigned(LogForm) then 
            logform.addlog(_('ARTIKEL: DLL geladen'));
        end else
        begin
          @CaoPluginExecCmd := nil;
          @CaoPluginInit := nil;
          if assigned(LogForm) then 
            logform.addlog(_('ARTIKEL: DLL Fehler beim laden'));
        end;
      except
        @CaoPluginExecCmd := nil;
        @CaoPluginInit := nil;
        if assigned(LogForm) then 
          logform.addlog (_('ARTIKEL: DLL Exception beim laden'));
      end;
    end;
    if (not Assigned (CaoPluginExecCmd)) and (assigned(LogForm)) then 
      logform.addlog(_('ARTIKEL: DLL Funktion nicht gefunden'));

    MnuExtSearch.Visible := assigned(CaoPluginExecCmd);
    // ENDE NEU DLL

    id := -1;
    LastID := -1;
    ErweitertPC.ActivePage := ErweitertPC.Pages[0];

    SB1.SimplePanel := True;
    SB1.SimpleText := _('Lade Benutzereinstellungen ...');
    if assigned (OnAddArtikel) then 
      MnuImportUpdate.Enabled := False;

    //neu
    Allgemein1.Checked          := True;
    ArtWgrDok                   := False;
    ArtWgrPan.Visible           := False;
    Art_PC.Align                := alNone;
    ArtikelPanelResize(Sender);

    WgrMitNr    := DM1.ReadBoolean('MAIN\ARTIKEL', 'WGR_MIT_NR', False);  //Do not Localize
    WgrSort     := DM1.ReadInteger('MAIN\ARTIKEL', 'WGR_SORT'  , 0);      //Do not Localize


    // Warengruppenauswahl füllen
    try
      ArtWgrTV.Items.BeginUpdate;
      ArtWgrTV.Items.Clear;
      DM1.WgrTab.Close;

      if WgrSort = 1 then 
        DM1.WgrTab.Sql.Text := 'select * from WARENGRUPPEN order by TOP_ID,NAME'  //Do not Localize
      else 
        DM1.WgrTab.Sql.Text := 'select * from WARENGRUPPEN order by TOP_ID,ID';   //Do not Localize

      DM1.WgrTab.Open;

      SetLength(WGRA, DM1.WgrTab.RecordCount);
      I := 0;

      DM1.WgrTab.DisableControls;
      DM1.WgrTab.First;

      WTN := ArtWgrTV.Items.Add(nil, _('alle Warengruppen'));
      WTN.Data := Pointer(-1);

      WTN.Selected := True;
      try
        while not DM1.WgrTab.EOF do
        begin
          WgrName := DM1.WgrTabNAME.AsString;
          if WgrMitNr then 
            WgrName := FormatFloat ('000', DM1.WgrTabID.AsInteger) + ' - ' + WgrName;

          WgrA[I].ID     := DM1.WgrTabID.AsInteger;
          WgrA[I].Name   := WgrName;
          WgrA[I].TOP_ID := DM1.WgrTabTOP_ID.AsInteger;
          WgrA[I].FC_ID  := -1;

          inc(I);

          DM1.WgrTab.Next;
        end;
      finally
        DM1.WgrTab.EnableControls;
      end;

      for i := 0 to length(WGRA)-1 do
      begin
        for j := 0 to length(WGRA)-1 do
        begin
          if (WGRA[j].TOP_ID > 0) and (WGRA[j].TOP_ID = WGRA[i].ID) then
          begin
            WGRA[i].FC_ID := J;
            break;
          end;
        end;
      end;

      Add (WTN, -1, 0);

      setlength(wgra, 0);

      WTN.Selected := True;
      WTN.Collapse (True);
      WTN.Expand ({True}False);
    except
    end;

    // Spezialauswahl hinzufügen
    DM1.Uniquery.Close;
    DM1.UniQuery.Sql.Text := 
      'select VAL_INT AS ID, NAME, VAL_BLOB from REGISTRY ' +
      'where MAINKEY="MAIN\\ART_HIR"';
    DM1.UniQuery.Open;
    if DM1.UniQuery.RecordCount>0 then
    begin
      WTN := ArtWgrTV.Items.Add(nil, _('Spezial'));
      WTN.Data := Pointer(-1);

      while not DM1.UniQuery.Eof do
      begin
        tn := ArtWgrTV.Items.AddChild(WTN, DM1.UniQuery.FieldByName ('NAME').AsString);
        tn.Data := Pointer(DM1.UniQuery.FieldByName ('ID').AsInteger);

        DM1.UniQuery.Next;
      end;
    end;
    DM1.UniQuery.Close;

    // Merkmal-Nodes erzeugen

    DM1.UniQuery.Close;
    DM1.UniQuery.SQL.Text := 
      'SELECT * FROM ARTIKEL_MERK ' +
      'ORDER BY NAME ASC';
    DM1.UniQuery.Open;
    if DM1.UniQuery.RecordCount > 0 then
    begin
      ArtMerkmalLB.Items.Clear;
      tn := ttreenode.Create (ArtWgrTV.Items);
      tn.Data := Pointer(-1);
      merkmal_tn := ArtWgrTV.Items.Add (tn, _('Merkmale'));

      while not DM1.UniQuery.Eof do
      begin
        tn := ArtWgrTV.Items.AddChild(merkmal_tn, DM1.UniQuery.FieldByName('NAME').AsString);
        tn.Data := Pointer(DM1.UniQuery.FieldByName('MERKMAL_ID').AsInteger);
        ArtMerkmalLB.Items.AddObject(tn.Text, Pointer(DM1.UniQuery.FieldByName('MERKMAL_ID').AsInteger));
        DM1.UniQuery.Next;
      end;
      MerkmaleCB.Visible := True;
      MerkmaleCB.Top := 0;
    end else
    begin
      MerkmaleCB.Visible := False;
    end;
    DM1.UniQuery.Close;

    ArtWgrTV.Items.EndUpdate;

    // Ende Warengruppen Tree-View

    {
    // Kalkulationsfaktoren laden
    FaktorTab[1] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK1_CALC_FAKTOR',0);
    FaktorTab[2] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK2_CALC_FAKTOR',0);
    FaktorTab[3] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK3_CALC_FAKTOR',0);
    FaktorTab[4] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK4_CALC_FAKTOR',0);
    FaktorTab[5] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK5_CALC_FAKTOR',0);
    }

    BN_CALC_SCHRANKE := DM1.ReadDouble('MAIN\ARTIKEL', 'BN_CALC_SCHRANKE', 0);

    BruttoShop        := DM1.ReadBoolean ('SHOP', 'BRUTTO_SHOP', False);
    ShopVK            := DM1.ReadInteger ('SHOP', 'SHOP_VK', -1);
    if (ShopVK < 0) or (ShopVK>5) then 
      ShopVK := 5;

    if ShopVK > 0 then
    begin
      S := 'VK' + IntToStr(ShopVK);
      if BruttoShop then 
        S := S + 'B';
      ShopPreisEdi.DataField := S;
      ShopPreisEdi.Tag := ShopVK * -1;

      // Label beschriften
      S := 'Preis(' + IntToStr(ShopVK) + ') ';
      if BruttoShop then 
        S := S + _('brutto :')
      else 
        S := S + _('netto :');
      ShopPreisLab.Caption := S;
    end else
    begin
      ShopPreisEdi.DataField := 'SHOP_PREIS_LISTE';
      ShopPreisEdi.Tag := 0;
      ShopPreisLab.Caption := _('Preis (netto):');
    end;

    ShopTyp := tShopTyp(DM1.ReadInteger('SHOP', 'TYP', ord(stOSC)));

    ShopKurztextGB.Visible := ShopTyp = stXTC;

    {$IFNDEF PRO}
    CaoGroupBox1.Visible := false;
    {$ELSE}
    CaoGroupBox1.Visible := True;
    {$ENDIF}

    Artikel_SQL := '';

    First := False;
    ART_PC.ActivePage := Allg_TS;
    Allgemein1.Checked := True;

    ASQueryVK1.DisplayFormat         := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryVK2.DisplayFormat         := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryVK3.DisplayFormat         := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryVK4.DisplayFormat         := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryVK5.DisplayFormat         := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';

    ASQueryEK_PREIS.DisplayFormat    := DM1.EK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_EK.DisplayFormat     := DM1.EK_DFormat + ' "' + DM1.LeitWaehrung + '"';

    ASQueryVK1B.DisplayFormat        := ',#0.00 "' + DM1.LeitWaehrung + '"'; //NEU
    ASQueryVK2B.DisplayFormat        := ',#0.00 "' + DM1.LeitWaehrung + '"'; //NEU
    ASQueryVK3B.DisplayFormat        := ',#0.00 "' + DM1.LeitWaehrung + '"'; //NEU
    ASQueryVK4B.DisplayFormat        := ',#0.00 "' + DM1.LeitWaehrung + '"'; //NEU
    ASQueryVK5B.DisplayFormat        := ',#0.00 "' + DM1.LeitWaehrung + '"'; //NEU

    ASQueryVK1.EditFormat            := DM1.VK_EFormat;
    ASQueryVK2.EditFormat            := DM1.VK_EFormat;
    ASQueryVK3.EditFormat            := DM1.VK_EFormat;
    ASQueryVK4.EditFormat            := DM1.VK_EFormat;
    ASQueryVK5.EditFormat            := DM1.VK_EFormat;

    ASQueryEK_Preis.EditFormat       := DM1.EK_EFormat;

    ASQueryCALC_VK1.DisplayFormat    := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK2.DisplayFormat    := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK3.DisplayFormat    := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK4.DisplayFormat    := DM1.VK_DFormat + ' "' + DM1.LeitWaehrung + '"';

    ASQueryCALC_VK1B.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK2B.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK3B.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + '"';
    ASQueryCALC_VK4B.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + '"';

    //ASQueryLast_EK.DisplayFormat     :=',#0.00 "'+DM1.LeitWaehrung+'"';

    vk1_mwst.DisplayFormat           := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk2_mwst.DisplayFormat           := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk3_mwst.DisplayFormat           := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk4_mwst.DisplayFormat           := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk5_mwst.DisplayFormat           := ',#0.00 "' + DM1.LeitWaehrung + '"';

    vk1_rgw.DisplayFormat            := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk2_rgw.DisplayFormat            := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk3_rgw.DisplayFormat            := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk4_rgw.DisplayFormat            := ',#0.00 "' + DM1.LeitWaehrung + '"';
    vk5_rgw.DisplayFormat            := ',#0.00 "' + DM1.LeitWaehrung + '"';

    ArtSuchGrid.RowColor1      := DM1.C2Color;
    HistGrid.RowColor1         := DM1.C2Color;
    STListGrid.RowColor1       := DM1.C2Color;
    SerNoGrid.RowColor1        := DM1.C2Color;
    ArtLiefPreisGrid.RowColor1 := DM1.C2Color;
    ArtKunPreisGrid.RowColor1  := DM1.C2Color;
    ErsGrid.RowColor1          := DM1.C2Color;
    ZubGrid.RowColor1          := DM1.C2Color;


    ArtSuchGrid.EditColor      := DM1.EditColor;
    HistGrid.EditColor         := DM1.EditColor;
    STListGrid.EditColor       := DM1.EditColor;
    SerNoGrid.EditColor        := DM1.EditColor;
    ArtLiefPreisGrid.EditColor := DM1.EditColor;
    ArtKunPreisGrid.EditColor  := DM1.EditColor;
    ZubGrid.EditColor          := DM1.EditColor;
    ErsGrid.EditColor          := DM1.EditColor;
    ArtKatGrid.EditColor       := DM1.EditColor;

    Art_PC.HintColor := Application.HintColor;


    if DM1.ReadInteger('MAIN\ARTIKEL', 'KURZTEXT_TO_LANGTEXT', -1) = -1 then
      DM1.WriteBoolean ('MAIN\ARTIKEL', 'KURZTEXT_TO_LANGTEXT', True);

    K2L := DM1.ReadBoolean('MAIN\ARTIKEL', 'KURZTEXT_TO_LANGTEXT', True);

    if DM1.ReadInteger('MAIN\ARTIKEL', 'ARTNUM_AUTO', -1) = -1 then
      DM1.WriteBoolean('MAIN\ARTIKEL', 'ARTNUM_AUTO', False);

    ArtnumAuto := DM1.ReadBoolean('MAIN\ARTIKEL', 'ARTNUM_AUTO', False);
    Artikelnummernvergeben1.Enabled := ArtnumAuto;

    vk3.visible        := DM1.AnzPreis>= 3;
    vk3_mwst.visible   := DM1.AnzPreis>= 3;
    vk3_rgw.visible    := DM1.AnzPreis>= 3;
    vk3_brutto.visible := DM1.AnzPreis>= 3;
    vk3lab.visible     := DM1.AnzPreis>= 3;

    for i := 0 to ArtSuchGrid.Columns.Count-1 do
      if ArtSuchGrid.Columns[i].FieldName = 'CALC_VK3' then
        ArtSuchGrid.Columns[i].Visible := DM1.AnzPreis >= 3;

    vk4.visible        := DM1.AnzPreis>= 4;
    vk4_mwst.visible   := DM1.AnzPreis>= 4;
    vk4_rgw.visible    := DM1.AnzPreis>= 4;
    vk4_brutto.visible := DM1.AnzPreis>= 4;
    vk4lab.visible     := DM1.AnzPreis>= 4;

    for i := 0 to ArtSuchGrid.Columns.Count-1 do
      if ArtSuchGrid.Columns[i].FieldName = 'CALC_VK4' then
        ArtSuchGrid.Columns[i].Visible := DM1.AnzPreis >= 4;

    vk5.visible        := DM1.AnzPreis>= 5;
    vk5_mwst.visible   := DM1.AnzPreis>= 5;
    vk5_rgw.visible    := DM1.AnzPreis>= 5;
    vk5_brutto.visible := DM1.AnzPreis>= 5;
    vk5lab.visible     := DM1.AnzPreis>= 5;

    for i := 0 to ArtSuchGrid.Columns.Count-1 do
      if ArtSuchGrid.Columns[i].FieldName = 'VK5' then
        ArtSuchGrid.Columns[i].Visible := DM1.AnzPreis >= 5;

    case DM1.AnzPreis of
      2: VKPreisGB.Height := vk2.top + vk2.height + 10;
      3: VKPreisGB.Height := vk3.top + vk3.height + 10;
      4: VKPreisGB.Height := vk4.top + vk4.height + 10;
      5: VKPreisGB.Height := vk5.top + vk5.height + 10;
    end;

    ListPreis.Datafield   := 'VK' + Inttostr(DM1.AnzPreis);
    ListPreis.Tag         := DM1.AnzPreis * -1;

    BruttoPreis.Datafield := 'VK' + Inttostr(DM1.AnzPreis) + 'B';
    BruttoPreis.Tag       := DM1.AnzPreis * -1;

    ListPreisLab.Caption := _('Listenpreis') + ' (' + Inttostr(DM1.AnzPreis) + '):';

    dm1.GridLoadLayout(tDBGrid(HistGrid),    'ARTIKEL_HISTORY', 101);
    dm1.GridLoadLayout(tDBGrid(STListGrid),  'ARTIKEL_STLIST', 101);
    dm1.GridLoadLayout(tDBGrid(SerNoGrid),   'ARTIKEL_SERNO', 101);
    dm1.GridLoadLayout(tDBGrid(ArtSuchGrid), 'ARTIKEL_LISTE', 103);
    dm1.GridLoadLayout(tDBGrid(ZubGrid),     'ARTIKEL_ZUBEHOER');
    dm1.GridLoadLayout(tDBGrid(ErsGrid),     'ARTIKEL_ERSATZTEILE');

    ArtWgrPan.Width := DM1.ReadIntegerU('', 'ARTIKEL_HIR_WIDTH', ArtWgrPan.Width);

    if DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'AKTIV', False) then
    begin
      UserFelderTS.TabVisible := True;

      UFeld01Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD01_AKTIV', False);
      UFeld01Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD01', _('Benutzerfeld') + ' 01:');
      Userfeld01.Visible := UFeld01Lab.Visible;

      UFeld02Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD02_AKTIV', False);
      UFeld02Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD02', _('Benutzerfeld') + ' 02:');
      Userfeld02.Visible := UFeld02Lab.Visible;

      UFeld03Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD03_AKTIV', False);
      UFeld03Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD03', _('Benutzerfeld') + ' 03:');
      Userfeld03.Visible := UFeld03Lab.Visible;

      UFeld04Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD04_AKTIV', False);
      UFeld04Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD04', _('Benutzerfeld') + ' 04:');
      Userfeld04.Visible := UFeld04Lab.Visible;

      UFeld05Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD05_AKTIV', False);
      UFeld05Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD05', _('Benutzerfeld') + ' 05:');
      Userfeld05.Visible := UFeld05Lab.Visible;

      UFeld06Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD06_AKTIV', False);
      UFeld06Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD06', _('Benutzerfeld') + ' 06:');
      Userfeld06.Visible := UFeld06Lab.Visible;

      UFeld07Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD07_AKTIV', False);
      UFeld07Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD07', _('Benutzerfeld') + ' 07:');
      Userfeld07.Visible := UFeld07Lab.Visible;

      UFeld08Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD08_AKTIV', False);
      UFeld08Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD08', _('Benutzerfeld') + ' 08:');
      Userfeld08.Visible := UFeld08Lab.Visible;

      UFeld09Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD09_AKTIV', False);
      UFeld09Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD09', _('Benutzerfeld') + ' 09:');
      Userfeld09.Visible := UFeld09Lab.Visible;

      UFeld10Lab.Visible := DM1.ReadBoolean('MAIN\ARTIKEL\USERFELDER', 'FELD10_AKTIV', False);
      UFeld10Lab.Caption := DM1.ReadString('MAIN\ARTIKEL\USERFELDER', 'FELD10', _('Benutzerfeld') + ' 10:');
      Userfeld10.Visible := UFeld10Lab.Visible;
    end else
    begin
      UserFelderTS.TabVisible := False;
    end;

    Res := DM1.ReadBooleanU('', 'ARTIKEL_HIR_DOK', True);
    if Res then
    begin
      ArtHirViewBtnClick(nil);
      ArtHirDockBtnClick(nil);
    end;

    Limit := DM1.ReadIntegerU('', 'ARTIKEL_TREFFER', 50);
    case Limit of
      10: N101.Checked := True;
      50: N501.Checked := True;
      100: N1001.Checked := True;
      200: N2001.Checked := True;
      500: N5001.Checked := True;
      999999999: alle1.Checked := True;
    end;
    if Limit < 10 then
      Limit := 10;

    me := DM1.ReadIntegerU('', 'ARTIKEL_ME_EDI', -1);
    if me = -1 then
    begin
      DM1.WriteBooleanU('', 'ARTIKEL_ME_EDI', False);
      me := 0;
    end;

    ME_EDIT := me = 1;

    {
    me :=DM1.ReadIntegerU('','ARTIKEL_MEBEST_EDI',-1);
    if me=-1 then
    begin
    DM1.WriteBooleanU('','ARTIKEL_MEBEST_EDI',False);
    me :=0;
    end;
    }
    //ME_EKBEST_EDIT :=me=1;

    PreisPC.ActivePage := PreisStdTS;
    PreisPCChange(Self);

    // letztes Tabsheet wiederherstellen
    me := DM1.ReadIntegerU('', 'ARTIKEL_TABSHEET', -1);

    if (me >= 0) and (me<ART_PC.PageCount) then
      ART_PC.ActivePage := ART_PC.Pages[me]
    else
      ART_PC.ActivePage := Allg_TS;

    SortField := DM1.ReadStringU('', 'ARTIKEL_SORTFELD', 'MATCHCODE');

    // Bugfix, kann ab Ver. 1.3 wieder entfernt werden
    If Uppercase(SortField) = 'HERSTELLER_NAME' then
      SortField := 'HERSTELLER_ID';
    // Ende Bugfix

    SortName  := DM1.ReadStringU('', 'ARTIKEL_SORTNAME', 'MATCH');

    SuchFeldCB.ItemIndex := DM1.ReadIntegerU('', 'ARTIKEL_SUCHBEGRIFF', 0);


    for i := 0 to ArtSuchGrid.Columns.Count-1 do
    begin
      if Uppercase(ArtSuchGrid.Columns[i].FieldName) = 'MENGE_AKT' then
        ArtSuchGrid.Columns[i].ReadOnly := not ME_EDIT;
      if Uppercase(ArtSuchGrid.Columns[i].FieldName) = 'ARTIKELTYP' then
        ArtSuchGrid.Columns[i].ReadOnly := TRUE;

      if ArtSuchGrid.Columns[i].Field.DisplayLabel = SortName then
        ArtSuchGrid.Columns[i].Title.Font.Style := [fsBold]
      else
        ArtSuchGrid.Columns[i].Title.Font.Style := [];
    end;

    SB1.SimplePanel := False;
    SB1.SimpleText := '';
    SB1.Invalidate;

    PreisGrid.Height := 20 + ((DM1.AnzPreis + 2) * (PreisGrid.DefaultRowHeight + 1));
    PreisGrid.RowCount := DM1.AnzPreis + 3;

    PreisGrid.Cells[0, 1] := _('ab Menge');
    PreisGrid.Cells[0, 2] := _('Mengenrab.') + ' %';
    PreisGrid.Cells[0, 3] := _('VK') + ' 1';
    PreisGrid.Cells[0, 4] := _('VK') + ' 2';
    PreisGrid.Cells[0, 5] := _('VK') + ' 3';
    PreisGrid.Cells[0, 6] := _('VK') + ' 4';
    PreisGrid.Cells[0, 7] := _('VK') + ' 5';

    PreisGrid.Cells[1, 0] := _('Standard');
    PreisGrid.Cells[2, 0] := _('Staffelpreis') + ' 2';
    PreisGrid.Cells[3, 0] := _('Staffelpreis') + ' 3';
    PreisGrid.Cells[4, 0] := _('Staffelpreis') + ' 4';
    PreisGrid.Cells[5, 0] := _('Staffelpreis') + ' 5';

    PreisGrid.Col := 2; PreisGrid.Row := 1;

    Application.ProcessMessages;
    Art_PCChange (Self);
  end;

  ArtWGRTV.Color         := DM1.C2Color;
  UebernahmeBtn1.Visible := Assigned(OnAddArtikel);
  uebernehmen1.Visible   := Assigned(OnAddArtikel);
  bernehmenundSchlieen1.visible := Assigned(OnAddArtikel);

  MnuDatei.Visible       := Assigned(OnAddArtikel);
  AddMengeLab.Visible    := Assigned(OnAddArtikel);
  AddMengeEdi.Visible    := Assigned(OnAddArtikel);

  MwstCB.Comboprops.ComboItems.Clear;
  MwstCB.Comboprops.ComboItems.Add (_('keine'));
  MwstCB.Comboprops.ComboItems.Add ('1=' + FormatFloat('0.0"%"', DM1.MwstTab[1]));
  MwstCB.Comboprops.ComboItems.Add ('2=' + FormatFloat('0.0"%"', DM1.MwstTab[2]));
  MwstCB.Comboprops.ComboItems.Add ('3=' + FormatFloat('0.0"%"', DM1.MwstTab[3]));

  MwstCB.Comboprops.ComboValues.Clear;
  MwstCB.Comboprops.ComboValues.Add ('0');
  MwstCB.Comboprops.ComboValues.Add ('1');
  MwstCB.Comboprops.ComboValues.Add ('2');
  MwstCB.Comboprops.ComboValues.Add ('3');

  MwstCB.CreateDropDownList; // wichtig, damit die neuen Werte übernommen werden

  MnuViewEK.Checked := LastF9;

  LastArtikelTyp := '@@@';


  UpdateQuery;

  if ID > 0 then
    ASQuery.Locate ('REC_ID', ID, []);

  {
  try
  if Art_PC.Enabled then
  begin
  case Art_PC.ActivePage.Tag of
  1: match.setfocus;
  2: if (ekpreis.visible)and(ekpreis.enabled)
  then ekpreis.setfocus
  else if vk1.enabled then vk1.setfocus;
  //3: SerNoGrid.SetFocus;//SernoSelCB.SetFocus;

  3: ErweitertPC.SetFocus; // Erweitert
  4: ShopModellEdi.SetFocus; // Shop
  5: LinkForm.LV1.SetFocus; // Dateien
  6: HistorySelCB.SetFocus;
  7: ArtSuchGrid.SetFocus;
  end;
  end;
  except end; }

  if not DM1.LiefRabGrp.Active then
    DM1.LiefRabGrp.Open;

  if (UebernahmeBtn1.Visible) and (ASQuery.RecordCount > 0) then
  begin
    Uebernehmen1.Enabled := True;
    bernehmenundSchlieen1.Enabled := True;
    MnuClose.ShortCut := vk_escape;

    //if Suchbeg.CanFocus then Suchbeg.SetFocus;
  end else
    MnuClose.ShortCut := 0;

  //Neu 04.09.2004 JP
  try
    if Suchbeg.CanFocus then
      Suchbeg.SetFocus;
    Suchbeg.SelectAll;
  except
  end;

  // Funktionen deaktivieren wenn Kasse oder aus Vorgang aufgerufen
  //MnuExtras.Enabled := (Application.Name = 'CAO') and (not Uebernehmen1.Visible); //07.11.09-ud.
  MnuExtras.Enabled := True; //07.11.09-ud.
  MnuDiscountGroup.Enabled := MnuExtras.Enabled;
  MnuPrintList.Enabled     := MnuExtras.Enabled;


  if DM1.HerstellerTab.Active then 
    DM1.HerstellerTab.Close;
  DM1.HerstellerTab.ParamByName ('SID').AsInteger := 1;
  DM1.HerstellerTab.Open;

  if not (ASquery.State in [dsInsert]) then 
    Art_PCChange(Sender);
  ArtikelPanelResize(Sender);

  //Funktionen je nach Berechtigung aktivieren
  MnuPrint.Enabled        := DM1.CaoSecurity.CanPrint  (ModulID, 0);
  MnuImportUpdate.Enabled := DM1.CaoSecurity.CanImport (ModulID, 0);
  MnuExportCSV.Enabled    := DM1.CaoSecurity.CanExport (ModulID, 0);


  ArtPreiseBtn.Enabled := 
    (DM1.CaoSecurity.CanOpenModul (ModulID, 1)) or
    (DM1.CaoSecurity.CanOpenModul (ModulID, 2)) or
    (DM1.CaoSecurity.CanOpenModul (ModulID, 3)) or
    (DM1.CaoSecurity.CanOpenModul (ModulID, 4));

  MengePreise1.Enabled := ArtPreiseBtn.Enabled;

  PreisStdTS.TabVisible     := DM1.CaoSecurity.CanOpenModul (ModulID, 1);
  StaffelpreisTS.TabVisible := DM1.CaoSecurity.CanOpenModul (ModulID, 2);
  KunPreisTS.TabVisible     := DM1.CaoSecurity.CanOpenModul (ModulID, 3);
  LiefPreisTS.TabVisible    := DM1.CaoSecurity.CanOpenModul (ModulID, 4);

  ArtShopBtn.Enabled        := DM1.CaoSecurity.CanOpenModul (ModulID, 10);
  Shop1.Enabled             := ArtShopBtn.Enabled;

  ArtLinkBtn.Enabled        := DM1.CaoSecurity.CanOpenModul (ModulID, 98);
  ArtHistorieBtn.Enabled    := DM1.CaoSecurity.CanOpenModul (ModulID, 99);

  EK_Preis.Enabled          := DM1.CaoSecurity.CanEKEdit    (ModulID, 0);
  ekpreis.Enabled           := DM1.CaoSecurity.CanEKEdit    (ModulID, 0);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.CheckSaved;
begin
  if (ASQuery.State in [dsEdit, dsInsert]) or (ArtPreisTab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg(_('Der aktuelle Artikel wurde verändert,' + #13#10 +
                    'wollen Sie die Änderung speichern ?'),
                     mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      if (ASQuery.State in [dsEdit, dsInsert]) then 
        ASQuery.Post;
      if (ArtPreisTab.State in [dsEdit, dsInsert]) then 
        ArtPreisTab.Post;
    end  else
    begin
      try 
        if (ASQuery.State in [dsEdit, dsInsert]) then 
          ASQuery.Cancel; 
      except 
      end;
      try 
        if (ArtPreisTab.State in [dsEdit, dsInsert]) then 
          ArtPreisTab.cancel; 
      except 
      end;
    end;
  end;
end;      

//------------------------------------------------------------------------------
procedure TArtikelForm.FormDeactivate(Sender: TObject);
begin
  CheckSaved;

  if not assigned (OnAddArtikel) then
  begin
    DM1.WriteIntegerU('', 'ARTIKEL_TABSHEET', ART_PC.ActivePageIndex);
    DM1.WriteStringU('', 'ARTIKEL_SORTFELD', SortField);
    DM1.WriteStringU('', 'ARTIKEL_SORTNAME', SortName);
    DM1.WriteIntegerU('', 'ARTIKEL_SUCHBEGRIFF', SuchFeldCB.ItemIndex);
    DM1.WriteIntegerU('', 'ARTIKEL_HIR_WIDTH', ArtWgrPan.Width);
  end;

  if (not (ArtikelPanel.Parent is tForm)) and
    (ArtikelPanel.Parent.Parent is tForm) and
    (assigned(TForm(ArtikelPanel.Parent.Parent).ActiveControl)) then
  begin
    TDBEdit(tForm(ArtikelPanel.Parent.Parent).ActiveControl).Color := clWindow;
  end;

  if ASQuery.Active        then ASQuery.Close;
  if STListTab.Active      then STListTab.Close;
  if JPosTab.Active        then JPosTab.Close;
  if SerNoTab.Active       then SerNoTab.Close;
  if DM1.LiefRabGrp.Active then DM1.LiefRabGrp.Close;
  if ArtKat.Active         then ArtKat.Close;
  if ArtPreisTab.Active    then ArtPreisTab.Close;

  if LinkForm.MainPanel.Parent = LinkPanel then
  begin
    LinkForm.MainPanel.Parent := Twincontrol(LinkForm.MainPanel.Owner);
    LinkForm.FormDeactivate (Sender);
  end;
end;           

//------------------------------------------------------------------------------
procedure TArtikelForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 705;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 680;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.F9Change (Ein: Boolean);
var 
  i: integer;
begin
  LastF9 := Ein;

  EK_Preis.Visible     := LastF9;
  EKPreisLab.Visible   := LastF9;
  FaktorLab.Visible    := LastF9;
  GewinnFaktor.Visible := LastF9;

  EKPreisGB.Visible    := False;
  VKPreisGB.Visible    := False;

  VKPreisGB.Visible    := True;
  EKPreisGB.Visible    := LastF9;
  //EKPreisGB.Top :=CaoGroupBox3.Top+CaoGroupBox3.Height-5;

  for i := 0 to ArtSuchGrid.Columns.Count-1 do
  begin
    if (ArtSuchGrid.Columns[i].FieldName = 'EK_PREIS') or
       (ArtSuchGrid.Columns[i].FieldName = 'CALC_EK') then 
    begin
      ArtSuchGrid.Columns[i].Visible := LastF9;
    end;
  end;

  MnuViewEK.Checked := LastF9;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.SetSort (Sort: Integer);
var 
  I: Integer;
begin
  if sort < 0 then 
    sort := aktsort;
  if sort = aktsort then 
    exit;
  case sort of
    {mach}     
    1: begin
      sortname         := _('Suchbegriff');
      SortField        := 'MATCHCODE'
    end;
    {name}     
    2: begin
      sortname         := _('Artikelnr.');
      SortField        := 'ARTNUM'
    end;
  end;
  AktSort := Sort;

  if First then 
    exit;

  UpdateQuery;
  UpdateStatus;

  for i := 0 to ArtSuchGrid.Columns.Count-1 do
  begin
    if ArtSuchGrid.Columns[i].Field.DisplayLabel = SortName then 
      ArtSuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      ArtSuchGrid.Columns[i].Title.Font.Style := [];
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateQuery(ExtSearchSQL: String = '');
var 
  LastTime: DWord;
begin
  // Wenn noch Datensatz im Edit, dann Fragen und ggf. Speichern
  CheckSaved;

  LastTime := GetTickCount;
  ASQuery.SQL.Clear;
  ASQuery.Close;

  ASQuery.SQL.Add(
    'SELECT ARTIKEL.*,SUBSTRING(LANGNAME,1,200) as LN,' +
    'IFNULL(AB_EKBEST.SUM_MENGE,0) as MENGE_BESTELLT ' +
    //      'IFNULL(AB_EKBEST_EDI.SUM_MENGE,0) as MENGE_EKBEEST_EDI,'+
    //      'IFNULL(AB_VKRE_EDI.SUM_MENGE,0) as MENGE_VKRE_EDI,'+
    //      'IFNULL(AB_EKRE_EDI.SUM_MENGE,0) as MENGE_EKRE_EDI '+
    'FROM ARTIKEL'
  );

  if (SuchBegr <> '') and (SuchFeldCB.ItemIndex = 5) then 
    ASQuery.SQL.Add (', ARTIKEL_PREIS');

  ASQuery.SQL.Add(
    'left outer join ARTIKEL_BDATEN AB_EKBEST on AB_EKBEST.QUELLE=26 and AB_EKBEST.ARTIKEL_ID=ARTIKEL.REC_ID '
  );
  {
  'left outer join ARTIKEL_BDATEN AB_VKRE_EDI on AB_VKRE_EDI.QUELLE=13 and AB_VKRE_EDI.ARTIKEL_ID=ARTIKEL.REC_ID '+
  'left outer join ARTIKEL_BDATEN AB_EKRE_EDI on AB_EKRE_EDI.QUELLE=15 and AB_EKRE_EDI.ARTIKEL_ID=ARTIKEL.REC_ID '+
  'left outer join ARTIKEL_BDATEN AB_EKBEST_EDI on AB_EKBEST_EDI.QUELLE=16 and AB_EKBEST_EDI.ARTIKEL_ID=ARTIKEL.REC_ID');
  }


  if (Pos('INNER JOIN', uppercase(Artikel_SQL)) > 0) or (Pos('WHERE', uppercase(Artikel_SQL)) > 0) then 
    ASQuery.SQL.Add(Artikel_SQL);

  if (SuchBegr <> '') or (ExtSearchSQL <> '') or
     ((Artikel_SQL <> '') and (Pos('INNER JOIN', uppercase(Artikel_SQL)) = 0)) then
  begin
    if Pos('WHERE', UpperCase(Artikel_SQL)) = 0 then 
      ASQuery.SQL.Add('WHERE')
    else
      if (SuchBegr <> '') or (ExtSearchSQL <> '') then
        ASQuery.SQL.Add('AND ');
  end;

  if length(ExtSearchSQL) > 0 then
  begin
    ASQuery.SQL.Add('(' + ExtSearchSQL + ') ');
    SuchBegr := '';
    if (Artikel_SQL <> '') and 
       (Pos('INNER JOIN', uppercase(Artikel_SQL)) = 0) and
       (Pos('WHERE', uppercase(Artikel_SQL)) = 0) then 
    begin
      ASQuery.SQL.Add ('and ');
    end;
  end;

  if SuchBegr <> '' then
  begin
    Suchbegr := sqlStringToSql(SuchBegr);
    case SuchFeldCB.ItemIndex of
      1: begin
        ASQuery.SQL.Add('(' + DM1.GetSearchSQL (['MATCHCODE'], Suchbegr) + ')');
      end;
      2: begin
        ASQuery.SQL.Add('(' + DM1.GetSearchSQL (['ARTNUM'], Suchbegr) + ')');
      end;
      3: begin
        ASQuery.SQL.Add ('(' + DM1.GetSearchSQL (['BARCODE', 'BARCODE2', 'BARCODE3'], Suchbegr) + ')');
      end;
      4: begin
        ASQuery.SQL.Add ('(' + DM1.GetSearchSQL (['HERST_ARTNUM'], Suchbegr) + ')');
      end;
      5: begin
        ASQuery.SQL.Add ('(' + DM1.GetSearchSQL (['ARTIKEL_PREIS.BESTNUM'], Suchbegr) +
                         ') AND ARTIKEL_PREIS.ARTIKEL_ID=ARTIKEL.REC_ID');
      end;
      6: begin
        ASQuery.SQL.Add ('(' + DM1.GetSearchSQL (['INFO'], Suchbegr) + ')');
      end;
      else begin
        ASQuery.SQL.Add ('(' + DM1.GetSearchSQL (['LANGNAME', 'KURZNAME', 'KAS_NAME'], Suchbegr) + ')');
      end;
    end; //case
    if (Artikel_SQL <> '') and 
       (Pos('INNER JOIN', Uppercase(Artikel_SQL)) = 0) and
       (Pos('WHERE', Uppercase(Artikel_SQL)) = 0) then 
    begin
      ASQuery.SQL.Add (' and ');
    end;
  end;
  if (Artikel_SQL <> '') and
    (Pos('INNER JOIN', Uppercase(Artikel_SQL)) = 0) and
    (Pos('WHERE', Uppercase(Artikel_SQL)) = 0) then 
  begin
    ASQuery.SQL.Add (Artikel_SQL);
  end;

  ASQuery.SQL.Add ('ORDER BY ' + SortField);
  ASQuery.SQL.Add ('LIMIT 0,' + Inttostr(limit));
  Screen.Cursor := crSQLWait;

  try
    ASQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;

  QueryTime := GetTickCount - LastTime;
  UpdateStatus;

  if (ASQuery.RecordCount = 0) and (Art_PC.Enabled) then 
    Art_PC.Enabled := False
  else
  if (ASQuery.RecordCount > 0) and (not Art_PC.Enabled) then 
    Art_PC.Enabled := True;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.Art_PCChange(Sender: TObject);
var 
  SID: Integer;
begin
  if Art_PC.ActivePage = ShopTS then
  begin
    if (
         (ArtKat.ParamByName('SHOP_ID').AsInteger<>ASQueryShop_ID.AsInteger) or
         (ArtKat.ParamByName('ARTIKEL_ID').AsInteger<>ASQueryRec_ID.AsInteger)
       ) and (ASQueryShop_ID.AsInteger>= 1) then
    begin
      ArtKat.Close;
      ArtKat.ParamByName('SHOP_ID').AsInteger := ASQueryShop_ID.AsInteger;
      ArtKat.ParamByName('ARTIKEL_ID').AsInteger := ASQueryRec_ID.AsInteger;
      ArtKat.Open;
      ArtKatGrid.Invalidate;
    end  else
    begin
      if ASQueryShop_ID.AsInteger < 1 then
      begin
        ArtKat.Close;
        ArtKat.ParamByName('SHOP_ID').AsInteger := -1;
      end else 
      begin
        if ArtKat.Active = False then 
          ArtKat.Open;;
      end;
    end;
  end else
  begin 
    ArtKat.Close;
  end;

  if Art_PC.ActivePage = Hist_TS then
  begin
    ArtKopfGB.Parent := ArtTopPanelHistorie;
    UpdateHistory;
  end else
  begin
    if JPosTab.Active then 
      JPosTab.Close;
  end;

  if Art_PC.ActivePage = Preis_TS then
  begin
    ArtKopfGB.Parent := ArtTopPanelPreise;

    vk1Change(vk1);
    vk1Change(vk2);
    vk1Change(vk3);
    vk1Change(vk4);
    vk1Change(vk5);
    ArtPreisTab.Close;
    ArtPreisTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
    ArtPreisTab.Open;
  end else
  begin
    if ArtPreisTab.State in [dsEdit, dsInsert] then 
      ArtPreisTab.Cancel;
    ArtPreisTab.Close;
  end;

  if Art_PC.ActivePage = ErweitertTS then
  begin
    ArtKopfGB.Parent := ArtTopPanelErweitert;

    if (ASQueryARTIKELTYP.Value = 'T') and (not UserFelderTS.TabVisible) then
    begin
      Art_PC.ActivePage := Allg_TS;
      Art_PCChange (Self);
    end;

    if ErweitertPC.ActivePage = SerNoTS then
    begin
      SerNoTab.Close;
      SerNoTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
      SerNoTab.Open;
    end else 
      SerNoTab.Close;

    if ErweitertPC.ActivePage = StueckListTS then
    begin
      ToolBar2.Parent := StueckListTS;
      ToolBar2.Top := StueckListTS.Height;
      STListTab.Close;
      STListTab.ParamByName('ART').AsString := 'STL';
      STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
      STListTab.Open;
    end else
    if ErweitertPC.ActivePage = ZubehoerTS then
    begin
        ToolBar2.Parent := ZubehoerTS;
        STListTab.Close;
        STListTab.ParamByName('ART').AsString := 'ZUB';
        STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
        STListTab.Open;
    end else
    if ErweitertPC.ActivePage = ErsatzteilTS then
    begin
          ToolBar2.Parent := ErsatzteilTS;
          STListTab.Close;
          STListTab.ParamByName('ART').AsString := 'ERS';
          STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
          STListTab.Open;
    end else 
      STListTab.Close;
  end;

  if Art_PC.ActivePage = Link_TS then
  begin
    ArtKopfGB.Parent := ArtTopPanelDateien;
  end;

  MnuVisibleCol.Enabled :=
      ((Art_PC.ActivePage.Tag = 2) and (assigned(PreisPC.ActivePage)) and (PreisPC.ActivePage.Tag in [3, 4])) or
      ((Art_PC.ActivePage.Tag = 3) and (assigned(ErweitertPC.ActivePage)) and (ErweitertPC.ActivePage.Tag in [2, 3, 5, 6])) or
      (Art_PC.ActivePage.Tag in [6, 7]);

  ArtAllgemeinBtn.Font.Style  := [];
  ArtPreiseBtn.Font.Style     := [];
  ArtErweitertBtn.Font.Style  := [];
  ArtHistorieBtn.Font.Style   := [];
  ArtLinkBtn.Font.Style       := [];
  ArtSuchenBtn.Font.Style     := [];
  ArtShopBtn.Font.Style       := [];

  case Art_PC.ActivePageIndex of
    0: begin
      ArtAllgemeinBtn.Font.Style := [fsBold];
      Allgemein1.Checked := True;

      UpdateMekrmale (ASQueryRec_ID.Value);

      SID := ASQueryShop_ID.AsInteger; 
      if SID < 1 then 
        SID := 1;
      if DM1.HerstellerTab.ParamByName ('SID').AsInteger <> SID then
      begin
        DM1.HerstellerTab.Close;
        DM1.HerstellerTab.ParamByName ('SID').AsInteger := SID;
        DM1.HerstellerTab.Open;
      end;
    end;
    1: begin
      ArtPreiseBtn.Font.Style := [fsBold];
      MengePreise1.Checked := True;
    end;
    2: begin
      ArtErweitertBtn.Font.Style := [fsBold];
      Erweitert1.Checked := True;
    end;
    3: begin
      ArtShopBtn.Font.Style := [fsBold];
      Shop1.Checked := True;
    end;
    4: begin // Dateien
      ArtLinkBtn.Font.Style := [fsBold];
      Dateien1.Checked := True;
      UpdateDateien;
    end;
    5: begin
      ArtHistorieBtn.Font.Style := [fsBold];
      Historie1.Checked := True;
    end;
    6: begin
      ArtSuchenBtn.Font.Style := [fsBold];
      Liste1.Checked := True;
    end;
  end{case};

  MnuPrintPartList.Enabled := (Art_PC.ActivePage = ErweitertTS) and (ErweitertPC.ActivePage = StueckListTS);
  MnuPrintHistory.Enabled  := Art_PC.ActivePage = Hist_TS;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SortierungClick(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 6) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ARTIKEL_GRDTitleClick(Column: TColumn);
begin
  case Column.Index of
    {match}   
    1: SetSort (1);
    {artnum}  
    5: SetSort (2);
  end;
end;   

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtSuchGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (not (gdSelected in State)) and 
     (uppercase(Field.FieldName) = 'MENGE_AKT') and
     (Field.AsFloat < 0) then 
  begin
    Canvas.Font.Color := clRed;
  end;
end;

procedure TArtikelForm.JahrCBChange(Sender: TObject);
begin
  UpdateHistory;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateHistory;
var 
  VJahr : Integer;
  BJahr : Integer;
  EKSum : Double;
  VKSum : Double;
  EKMEN : Double;
  VKMEN : Double;
  SUM   : Double;
  i     : Integer;
begin
  screen.cursor := crsqlwait;
  try
    if JahrCB.ItemIndex = 0 then 
    begin 
      vjahr := 1900; 
      bjahr := 2300; 
    end else 
    begin 
      vjahr := 1992 + JahrCB.ItemIndex;
      bjahr := 1992 + JahrCB.Itemindex;
    end;

    JPosTab.Close;
    JPosTab.SQL.Clear;
    if length(ASQueryRec_ID.AsString) = 0 then 
      exit;
    JPosTab.SQL.Add ('select');
    JPosTab.SQL.Add ('JOURNAL_ID,JOURNALPOS.QUELLE,ARTIKEL_ID,');
    JPosTab.SQL.Add ('JOURNALPOS.VRENUM,BEZEICHNUNG,MENGE,EPREIS,RABATT,');
    JPosTab.SQL.Add ('JOURNAL.REC_ID,JOURNAL.RDATUM,JOURNAL.KUN_NAME1,');
    JPosTab.SQL.Add ('JOURNAL.KUN_NAME2,JOURNAL.KUN_NAME3,JOURNAL.WAEHRUNG,');
    JPosTab.SQL.Add ('JOURNAL.KUN_ANREDE,');
    JPosTab.SQL.Add ('MWST_0,MWST_1,MWST_2,MWST_3,STEUER_CODE,');
    JPosTab.SQL.Add ('LDATUM,JOURNAL.VLSNUM,JOURNAL.BRUTTO_FLAG');
    JPosTab.SQL.Add ('from JOURNALPOS, JOURNAL');
    JPosTab.SQL.Add ('where ARTIKEL_ID=' + ASQueryRec_ID.AsString);
    JPosTab.SQL.Add ('and JOURNALPOS.JOURNAL_ID = JOURNAL.REC_ID');
    JPosTab.SQL.Add ('and JOURNAL.STADIUM<127');

    if HistorySelCB.ItemIndex < 7 then
    begin
      if HistorySelCB.ItemIndex = 4 then// Lieferschein
      begin
        JPosTab.SQL.Add('and YEAR(JOURNAL.LDATUM) BETWEEN ' + inttostr (vjahr) +
          ' and ' + inttostr (bjahr));
      end  else
      begin
        JPosTab.SQL.Add ('and YEAR(JOURNAL.RDATUM) BETWEEN ' + inttostr (vjahr) +
          ' and ' + inttostr (bjahr));
      end;
    end;

    case HistorySelCB.ItemIndex of
      0: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE in (1,3,5)');
      1: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 5');
      2: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 3');
      3: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 1'); // Angebote
      4: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 2'); // Lieferscheine
      5: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 6'); // Bestellungen
      6: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 6 ' +
      'and JOURNAL.STADIUM BETWEEN 20 and 99'); // EK-Best-Edi
      7: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 16'); // EK-Best-Edi
      8: JPosTab.SQL.Add ('and JOURNALPOS.QUELLE = 13'); // VK-Rech-Edi
    end;

    if HistGrid.Columns.Count > 0 then
    begin
      for i := 0 to HistGrid.Columns.Count-1 do
      begin
        if (HistorySelCB.ItemIndex = 4) and (uppercase(HistGrid.Columns[i].FieldName) = 'RDATUM') then 
          HistGrid.Columns[i].FieldName := 'LDATUM'
        else
        if (HistorySelCB.ItemIndex <> 4) and (uppercase(HistGrid.Columns[i].FieldName) = 'LDATUM') then 
          HistGrid.Columns[i].FieldName := 'RDATUM';

        if (HistorySelCB.ItemIndex = 4) and (uppercase(HistGrid.Columns[i].FieldName) = 'VRENUM') then 
          HistGrid.Columns[i].FieldName := 'VLSNUM'
        else
        if (HistorySelCB.ItemIndex <> 4) and (uppercase(HistGrid.Columns[i].FieldName) = 'VLSNUM') then 
          HistGrid.Columns[i].FieldName := 'VRENUM';
      end;
    end;
    EKSum := 0; 
    EKMEN := 0;
    VKSum := 0; 
    VKMEN := 0;
    JPosTab.Open;
    JPosTab.DisableControls;
    try
      while not JPosTab.Eof do
      begin
        Sum := JPosTabMenge.Value * JPosTabEPreis.Value;
        sum := trunc((sum - (sum / 100 * JPosTabRabatt.Value)) * 100) / 100;

        case JPosTabquelle.Value of
          3: begin
            if JPosTabWaehrung.Value <> DM1.LeitWaehrung then 
              VKSUM := VKSUM + DM1.CalcLeitWaehrung (Sum, JPosTabWaehrung.Value)
            else 
              VKSUM := VKSUM + Sum;
            VKMEN := VKMEN + JPosTabMenge.Value;
          end;
          5: begin
            if JPosTabWaehrung.Value <> DM1.LeitWaehrung then 
              EKSUM := EKSUM + DM1.CalcLeitWaehrung (Sum, JPosTabWaehrung.Value)
            else 
              EKSUM := EKSUM + Sum;
            EKMEN := EKMEN + JPosTabMenge.Value;
          end;
        end;
        JPosTab.Next;
      end;
    finally
      JPosTab.First;
      JPosTab.EnableControls;
    end;
    HistSumBar.Panels[1].Text := FormatFloat(',##0.00', eksum) + ' ' + DM1.LeitWaehrung;
    HistSumBar.Panels[2].Text := FormatFloat(',##0.00', ekmen) + ' ' + _('Stück');
    HistSumBar.Panels[4].Text := FormatFloat(',##0.00', vksum) + ' ' + DM1.LeitWaehrung;
    HistSumBar.Panels[5].Text := FormatFloat(',##0.00', vkmen) + ' ' + _('Stück');
  finally
    screen.cursor := crdefault;
  end;
end;                                        

//------------------------------------------------------------------------------
procedure TArtikelForm.UebernahmeBtn1Click(Sender: TObject);
begin
  if not uebernehmen1.visible then 
    exit;

  Uebernehmen1.Enabled := False;
  bernehmenundSchlieen1.Enabled := False;

  if ASQuery.State in [dsEdit, dsInsert] then 
    ASQuery.Post;
  if Assigned (OnAddArtikel) then 
    OnAddArtikel (ASQueryRec_ID.Value, AddMengeEdi.Value, 0, 0);
  if OnlyOneArtikel then 
    Close;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.bernehmenundSchlieen1Click(Sender: TObject);
begin
  UebernahmeBtn1Click(Sender);
  Close;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtSuchGridDblClick(Sender: TObject);
begin
  Art_PC.ActivePage := Allg_TS;
  Art_PCChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryAfterScroll(DataSet: TDataSet);
begin
  //try
  if LastFocus > 0 then
  begin
    Windows.SetFocus (LastFocus);
    LastFocus := 0;
  end;

  if Art_PC.ActivePage = Hist_TS then
  begin
    // wenn es ein Text ist, dann keine History !!! -> dann Wechseln auf Allgemein !!!
    if (ASQueryArtikelTyp.Value = 'T') then
    begin
      Art_PC.ActivePage := Allg_TS;
      Art_PCChange (Self);
      exit;
    end;
  end;

  if Art_PC.ActivePage = ErweitertTS then
  begin
    try
      if ((ASQueryARTIKELTYP.Value = 'T') or
          (ASQueryARTIKELTYP.Value = 'K') or
          (ASQueryARTIKELTYP.Value = 'L')) and (not UserFelderTS.TabVisible) then
      begin
        Art_PC.ActivePage := Allg_TS;
        Art_PCChange (Self);
      end;

      if (ErweitertPC.ActivePage = StueckListTS) and (ASQueryArtikelTyp.Value = 'S') then
      begin
        STListTab.Close;
        STListTab.ParamByName('ART').AsString := 'STL';
        STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
        STListTab.Open;
      end else
      if ErweitertPC.ActivePage = ZubehoerTS then
      begin
        STListTab.Close;
        STListTab.ParamByName('ART').AsString := 'ZUB';
        STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
        STListTab.Open;
      end else
      if ErweitertPC.ActivePage = ErsatzteilTS then
      begin
        STListTab.Close;
        STListTab.ParamByName('ART').AsString := 'ERS';
        STListTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
        STListTab.Open;
      end else 
        STListTab.Close;

      if ErweitertPC.ActivePage = SerNoTS then
      begin
        // wenn es ein Artikel ohne Seriennummern ist, dann Wechseln auf Allgemein !!!
        if (ASQueryArtikelTyp.Value <> 'T') then
        begin
          Art_PC.ActivePage := Allg_TS;
          SerNoTab.Close;
          Art_PCChange(Self);
          exit;
        end;
        SerNoTab.Close;
        SerNoTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
        SerNoTab.Open;
      end else
      begin
        SerNoTab.Close;
      end;
    except 
    end;
  end else
  begin
    SerNoTab.Close;
    STListTab.Close;
  end;

  if (ASQueryARTIKELTYP.Value = 'S') and (not assigned(OnAddArtikel)) then
  begin
    try 
      StueckListTS.TabVisible := True; 
    except 
    end;
  end else
  begin
    try 
      StueckListTS.TabVisible := False; 
    except 
    end;
  end;

  ArtikelSetTS.TabVisible := (ASQueryARTIKELTYP.Value = 'E') and (not assigned (OnAddArtikel));

  ArtPreiseBtn.Enabled := (ASQueryARTIKELTYP.Value <> 'T') and (
      (DM1.CaoSecurity.CanOpenModul (ModulID, 1)) or
      (DM1.CaoSecurity.CanOpenModul (ModulID, 2)) or
      (DM1.CaoSecurity.CanOpenModul (ModulID, 3)) or
      (DM1.CaoSecurity.CanOpenModul (ModulID, 4)) );
  MengePreise1.Enabled := ArtPreiseBtn.Enabled;

  ArtErweitertBtn.Enabled := (
      (ASQueryARTIKELTYP.Value<>'T') and
      (ASQueryARTIKELTYP.Value<>'K') and
      (ASQueryARTIKELTYP.Value<>'L') and
      ( (DM1.CaoSecurity.CanOpenModul(ModulID, 5)) or
        (DM1.CaoSecurity.CanOpenModul(ModulID, 6)) or
        (DM1.CaoSecurity.CanOpenModul(ModulID, 8)) or
        (DM1.CaoSecurity.CanOpenModul(ModulID, 9)) ) 
      ) or
      ((UserFelderTS.Tabvisible) and (DM1.CaoSecurity.CanOpenModul(ModulID, 11))
      );

  Erweitert1.Enabled := ArtErweitertBtn.Enabled;

  try
    SerNoTS.TabVisible := 
      (ASQueryARTIKELTYP.Value <> 'T') and
      (ASQueryARTIKELTYP.Value <> 'L') and
      (ASQueryARTIKELTYP.Value <> 'K') and
      (ASQuerySN_FLAG.Value = True) and
      (DM1.CaoSecurity.CanOpenModul(ModulID, 5));
  except 
  end;

  try
    ZubehoerTS.Tabvisible := 
    (ASQueryARTIKELTYP.Value <> 'T') and
    (ASQueryARTIKELTYP.Value <> 'L') and
    (ASQueryARTIKELTYP.Value <> 'K') and
    (DM1.CaoSecurity.CanOpenModul(ModulID, 8));
  except 
  end;

  try
    ErsatzteilTS.Tabvisible := 
      (ASQueryARTIKELTYP.Value <> 'T') and
      (ASQueryARTIKELTYP.Value <> 'L') and
      (ASQueryARTIKELTYP.Value <> 'K') and
      (DM1.CaoSecurity.CanOpenModul(ModulID, 9));
  except 
  end;

  ArtShopBtn.Enabled  := 
    (length(ASQueryARTIKELTYP.Value) > 0) and
    (ASQueryARTIKELTYP.Value[1] in ['N', 'L', 'S', 'K']) and
    (DM1.CaoSecurity.CanOpenModul(ModulID, 10));
  Shop1.Enabled := ArtShopBtn.Enabled;


  NO_EK.Enabled := ASQueryARTIKELTYP.Value <> 'S';

  if (ASQuery.RecordCount = 0) and (Art_PC.Enabled) and (not (ASquery.State in [dsInsert])) then 
    Art_PC.Enabled := False
  else
  if (ASQuery.RecordCount > 0) and (not Art_PC.Enabled) then 
    Art_PC.Enabled := True;


  if LastID = ASQueryRec_ID.Value then 
    exit;

  if Art_PC.ActivePage = ShopTS then
  begin
    Art_PCChange (Self);
  end;

  if Art_PC.ActivePage = Hist_TS then
  begin
    Screen.Cursor := crSQLWait;
    try
      UpdateHistory;
    finally
      Screen.Cursor := crDefault;
    end;
  end;



  if Art_PC.ActivePage = Preis_TS then
  begin
    // wenn es ein Artikel ein Text ist, dann Wechseln auf Allgemein !!!
    if (ASQueryArtikelTyp.Value = 'T') then
    begin
      Art_PC.ActivePage := Allg_TS;
      Art_PCChange (Self);
      exit;
    end;
    vk1Change(vk1);
    vk1Change(vk2);
    vk1Change(vk3);
    vk1Change(vk4);
    vk1Change(vk5);

    ArtPreisTab.Close;
    ArtPreisTab.ParamByName('ID').AsInteger := ASQueryREC_ID.Value;
    ArtPreisTab.Open;

    if PreisPC.ActivePage = StaffelpreisTS then 
      CalcStaffelPreise (Self);
  end;


  if Art_PC.ActivePage = Allg_TS then
  begin
    UpdateMekrmale(ASQueryRec_ID.Value);
  end;

  if Art_PC.ActivePage = Link_TS then 
    UpdateDateien;

  UpdateStatus;

  LastID := ASQueryRec_ID.Value;


  UpdateGewinnFaktor;

  MwStLabel.Caption := Formatfloat ('"' + _('MwSt') + ' ("0.0"%)"', DM1.MwStTab[ASQuerySTEUER_CODE.Value]);

  if Uebernehmen1.Visible then
  begin
    Uebernehmen1.Enabled := True;
    bernehmenundSchlieen1.Enabled := True;
  end;

  //except
  //end;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.matchKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;

    try
      if (uppercase(tControl(Sender).Name) = 'SERNOCB') and (SernoCB.Enabled) then 
        Match.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'NO_BEZEICHNUNG') and (not SernoCB.Enabled) then 
        Match.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'EKPREIS') then VK1.SetFocus 
      else
      if (uppercase(tControl(Sender).Name) = 'VK2_RGW') and (EKPreisGB.Visible)and(not VK3.Visible) then 
        EKPreis.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK2_RGW') and (not EKPreisGB.Visible)and(not VK3.Visible) then 
        VK1.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK3_RGW') and (EKPreisGB.Visible)and(not VK4.Visible) then 
        EKPreis.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK3_RGW') and (not EKPreisGB.Visible)and(not VK4.Visible) then 
        VK1.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK4_RGW') and (EKPreisGB.Visible)and(not VK5.Visible) then 
        EKPreis.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK4_RGW') and (not EKPreisGB.Visible)and(not VK5.Visible) then 
        VK1.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK5_RGW') and (EKPreisGB.Visible) then 
        EKPreis.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'VK5_RGW') and (not EKPreisGB.Visible) then 
        VK1.SetFocus
      else
      begin
        if ArtikelPanel.Parent is tForm then 
          SendMessage (ArtikelPanel.Parent.Handle, WM_NEXTDLGCTL, 0, 0)
        else 
          SendMessage (ArtikelPanel.Parent.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    except 
    end;
  end else
    if Key = #9 then 
      Key := #0;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.matchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//var k : char;
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    ASQuery.Prior;
    key := 0;
  end else
  if (Shift = []) and (key = 34) then // PGDOWN
  begin
    ASQuery.Next;
    key := 0;
  end else
  if (key = 9) and (uppercase(tControl(Sender).Name) = 'LTEXTMEMO') and (Shift = [ssShift]) then
  begin
    key := 0;
    kasname.setfocus;
  end else
  if (key = 9) and (uppercase(tControl(Sender).Name) = 'LTEXTMEMO') and (Shift = [ssCtrl]) then
  begin
    LtextMemo.SelText := #9;
    key := 0;
  end else
  if (key = 9) and (uppercase(tControl(Sender).Name) = 'LTEXTMEMO') and (Shift = []) then
  begin
    InfoMemo.setfocus;
    key := 0;
  end;
  
      { else
      if (key = 13)and
      (uppercase(tControl(Sender).Name) = 'LTEXTMEMO')and
      (Shift = [ssCtrl]) then
      begin
        LtextMemo.SelText := #13;
        key := 0;
        end};
end;

//------------------------------------------------------------------------------
// VKx wurde geändert, Bruttopreis, Mwst, Rohgewinn berechnen
//------------------------------------------------------------------------------
procedure TArtikelForm.vk1Change(Sender: TObject);
var 
  B: Double; 
  PR: Integer;
begin
  // MWST-Summen berechnen
  // Brutto-Preise berechnen
  Update := True;
  try
    PR := tControl(Sender).Tag * -1;
    if (PR < 1) or (PR > 5) then 
      exit;
    if ((VKTab[PR].Value * (1 + DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100) > VKBTab[PR].Value + BN_CALC_SCHRANKE) or
        (VKTab[PR].Value * (1 + DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100) < VKBTab[PR].Value - BN_CALC_SCHRANKE)) and 
        (asquery.state in [dsedit, dsinsert]) then
    begin
      VKTab[PR].Value := CAO_Round_NK (VKTab[PR].Value, DM1.VK_NACHKOMMA);  //NEU

      B := VKTab[PR].Value * (1 + DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100);
      // Runden
      B := CAO_round(B * 100); // jetzt ganze Cent
      B := CAO_Round (B / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
      VKBTab[PR].Value := B;
    end;

    VKMwstTab[PR].Value := CalcVKTab[PR].Value * (DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100);
    if not VKRgwTab[PR].focused then 
      VKRgwTab[PR].Value := CalcVKTab[PR].Value - ASQueryCalc_EK.Value;
    VKRgwTab[PR].Font.Color := clRed * ord (VKRgwTab[PR].value<0);
  finally
    Update := False;
  end;
  UpdateGewinnFaktor;
  matchExit(Sender);
end;                    

//------------------------------------------------------------------------------
// Nettopreis zurückrechnen, da der Brutto-Preis geändert wurde !
//------------------------------------------------------------------------------
procedure TArtikelForm.vk1_bruttoChange(Sender: TObject);
var 
  B, N: Double; 
  PR: Integer;
begin
  if Update then 
    exit;

  PR := tControl(Sender).Tag * -1;
  if (PR > 0) and (PR < 6) and (ASQuery.State in [dsEdit, dsInsert]) then
  begin
    // Runden
    B := CAO_round(VKBTab[PR].Value * 100); // jetzt ganze Cent
    B := CAO_Round (B / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
    VKBTab[PR].Value := B;

    // jetzt ggf. Netto berechnen
    N := VKBTab[PR].Value / (1 + DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100);

    //N :=CAO_round(N * 100)/100;
    N := CAO_round_NK (N, DM1.VK_NACHKOMMA); //NEU

    if (asquery.state in [dsedit, dsinsert]) and
       ( (N>VKTab[PR].Value + BN_CALC_SCHRANKE) or
         (N<VKTab[PR].Value - BN_CALC_SCHRANKE) ) then 
    begin
      VKTab[PR].Value := N;
    end;

    VKMwstTab[PR].Value := VKTab[PR].Value * (DM1.MwStTab[ASQuerySTEUER_CODE.Value] / 100);
    //       if not VKRgwTab[PR].focused then
    VKRgwTab[PR].Value := VKTab[PR].Value - ASQueryCalc_EK.Value;
    VKRgwTab[PR].Font.Color := clRed * ord(vk1_rgw.value < 0);
  end;
  UpdateGewinnFaktor;
  MatchExit (Sender);
end;                                      

//------------------------------------------------------------------------------
procedure TArtikelForm.vk1_rgwChange(Sender: TObject);
begin
  // VK-Preise neu berechnen, da der Gewinn geändert wurde !
  if Update then 
    exit;
  if not (ASQuery.State in [dsEdit, dsInsert]) then 
    ASQuery.Edit;
  case TControl(Sender).Tag of
    -1: begin
      ASQueryVK1.Value := ASQueryCalc_EK.Value + vk1_rgw.value;
      vk1_rgw.Font.Color := clRed * ord(vk1_rgw.value < 0);
      VK1Change(VK1);
    end;
    -2: begin
      ASQueryVK2.Value := ASQueryCalc_EK.Value + vk2_rgw.value;
      vk2_rgw.Font.Color := clRed * ord(vk2_rgw.value < 0);
      VK1Change(VK2);
    end;
    -3: begin
      ASQueryVK3.Value := ASQueryCalc_EK.Value + vk3_rgw.value;
      vk3_rgw.Font.Color := clRed * ord(vk3_rgw.value < 0);
      VK1Change(VK3);
    end;
    -4: begin
      ASQueryVK4.Value := ASQueryCalc_EK.Value + vk4_rgw.value;
      vk4_rgw.Font.Color := clRed * ord(vk4_rgw.value < 0);
      VK1Change(VK4);
    end;
    -5: begin
      ASQueryVK5.Value := ASQueryCalc_EK.Value + vk5_rgw.value;
      vk5_rgw.Font.Color := clRed * ord(vk5_rgw.value < 0);
      VK1Change(VK5);
    end;
  end;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.MengeChange(Sender: TObject);
begin
  if ASQueryMenge_Akt.Value < 0 then 
    Menge.Font.Color := clRed
  else 
    Menge.Font.Color := clBlack;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtSuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  S: String; 
  i: Integer;
begin
  S := Field.FieldName;
  if Uppercase(S) = 'CALC_EK' then 
    S := 'EK_PREIS'  
  else 
  if (Pos('CALC_', Uppercase(S)) = 1) then 
    delete(S, 1, 5);

  If Uppercase(S) = 'HERSTELLER_NAME' then 
    S := 'HERSTELLER_ID';

  if SortField <> S then
  begin
    SortField := S;
    SortName := Field.DisplayLabel;
    UpdateQuery;
  end else
  begin
    SortField := SortField + ' DESC';
    SortName := Field.DisplayLabel;
    UpdateQuery;
  end;

  for i := 0 to ArtSuchGrid.Columns.Count-1 do
  begin
    if ArtSuchGrid.Columns[i].Field.DisplayLabel = SortName then 
      ArtSuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      ArtSuchGrid.Columns[i].Title.Font.Style := [];
  end;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.JPosTabCalcFields(DataSet: TDataSet);
var 
  sum, ep: double; w: string;
begin
  case JPosTabquelle.Value of
    1: JPosTabCalcQuelle.Value := _('Angebot');
    2: JPosTabCalcQuelle.Value := _('Lieferschein');
    3: JPosTabCalcQuelle.Value := _('Verkauf');
    5: JPosTabCalcQuelle.Value := _('Einkauf');
    6: JPosTabCalcQuelle.Value := _('EK-BEST');
    13: JPosTabCalcQuelle.Value := _('VK-EDI');
    15: JPosTabCalcQuelle.Value := _('EK-EDI');
    16: JPosTabCalcQuelle.Value := _('EK-BEST-EDI');
    else  JPosTabCalcQuelle.Value := '???';
  end;

  Sum := JPosTabMenge.Value * JPosTabEPreis.Value;
  sum := trunc((sum - (sum / 100 * JPosTabRabatt.Value)) * 100) / 100;

  w := JPosTabWaehrung.Value;

  jour_mwst_tab[0] := JPosTabMwst_0.Value;
  jour_mwst_tab[1] := JPosTabMwst_1.Value;
  jour_mwst_tab[2] := JPosTabMwst_2.Value;
  jour_mwst_tab[3] := JPosTabMwst_3.Value;

  if (JPosTabSteuer_Code.Value >= 0) and  (JPosTabSteuer_Code.Value <= 3) then 
    JPosTabSteuer_Proz.Value := Jour_MwSt_Tab[JPosTabSteuer_Code.Value]
  else 
    JPosTabSteuer_Proz.Value := 0;

  EP := JPosTabEPreis.Value;
  if JPosTabBRUTTO_FLAG.AsBoolean then
  begin
    EP := CAO_round(EP * 100) / 100;  // Auf ganze Pfennige Runden
    EP := EP - CAO_round(EP / 
      (100 + JPosTabSteuer_Proz.Value) * JPosTabSteuer_Proz.Value * 100) / 100; // Auf ganze Pfennige Runden

    SUM := CAO_round(SUM * 100) / 100;  // Auf ganze Pfennige Runden
    SUM := SUM - CAO_round(SUM /
      (100 + JPosTabSteuer_Proz.Value) * JPosTabSteuer_Proz.Value * 100) / 100; // Auf ganze Pfennige Runden
  end;

  JPosTabEPreis_Str.Value := FormatFloat(',#0.00 "' + w + '"', EP);
  JPosTabGPreis_Str.Value := FormatFloat(',#0.00 "' + w + '"', sum);

  JPosTabCalc_Kunde.AsString := 
    Trim(JPosTabKUN_Anrede.AsString + ' ' +
         JPosTabKUN_NAME1.AsString + ' ' +
         JPosTabKUN_NAME2.AsString + ' ' +
         JPosTabKUN_NAME3.AsString);
end;   

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryBeforePost(DataSet: TDataSet);
var 
  AKTO, EKTO: Integer; //Faktor : Doubl;
begin
  // Wichtig :
  // Wenn eines dieser Felder den Focus hat, dann muß der Focus zunächst
  // auf ein anderes Feld (Suchbegriff) gelegt werden, damit die jeweilige
  // "OnExit" Routine ausgeführt wird bevor der DS gespeichert wird
  //
  // Im Ereignis AfterPost wird dann der Focus zurück auf das le. aktive
  // Feld gesetzt

  if (vk1.Focused) or 
     (vk2.Focused) or 
     (vk3.Focused) or 
     (vk4.Focused) or
     (vk5.Focused) or
     (vk1_brutto.Focused) or
     (vk2_brutto.Focused) or
     (vk3_brutto.Focused) or
     (vk4_brutto.Focused) or 
     (vk5_brutto.Focused) or
     (listpreis.Focused) or
     (BruttoPreis.Focused) or
     (PreisGrid.Focused) or
     (ShoppreisEdi.Focused) then
  begin
    LastFocus := getfocus; // Feld was den Focus hatte merken
    Suchbeg.SetFocus;     // Focus umlegen, führt zu auslösung von OnExit
    Application.ProcessMessages;
  end;

  if LtextMemo.Focused then  
    LtextMemoExit(Self);

  ASQueryMATCHCODE.Value := Uppercase(ASQueryMATCHCODE.Value);
  ASQueryARTNUM.Value := Uppercase(ASQueryARTNUM.Value);
  ASQueryERSATZ_ARTNUM.Value := Uppercase(ASQueryERSATZ_ARTNUM.Value);

  if ASQueryWarengruppe.Value = 0 then
  begin
    if WGR = 0 then
    begin
      MessageDlg (_('Bitte erst Warengruppe zuweisen !'), mterror, [mbok], 0);
      Abort;
      try 
        Warengr_CB.SetFocus; 
      except 
      end;
      Exit;
    end;
  end;

  if ASQuery.State = dsInsert then
  begin
    ASQueryERSTELLT.Value := now;
    ASQueryERST_NAME.Value := DM1.view_user;
  end;

  if ASQueryArtikelTyp.Value = 'T' then // Text
  begin
    ASQueryBarCode.AsString     := '';
    ASQueryME_Einheit.AsString  := '';
    ASQueryPR_Einheit.AsInteger := 0;
    ASQuerySteuer_Code.Value    := 0;
    ASQueryAufw_Kto.AsInteger   := -1;
    ASQueryErloes_Kto.AsInteger := -1;
    ASQueryInventur_Wert.Value  := 0;
    ASQueryGewicht.AsFloat      := 0;
    ASQueryMenge_Min.Value      := 0;
    ASQueryMenge_Akt.Value      := 0;
    ASQueryek_preis.Value       := 0;
    ASQueryvk1.Value            := 0;   ASQueryvk1b.Value := 0;
    ASQueryvk2.Value            := 0;   ASQueryvk2b.Value := 0;
    ASQueryvk3.Value            := 0;   ASQueryvk3b.Value := 0;
    ASQueryvk4.Value            := 0;   ASQueryvk4b.Value := 0;
    ASQueryvk5.Value            := 0;   ASQueryvk5b.Value := 0;
    ASQueryDimension.Value      := '';
    ASQueryLaenge.Value         := '';
    ASQueryGroesse.Value        := '';
    ASQueryVPE.Value            := 0;
    ASQueryPROVIS_PROZ.Value    := 0;

    ASQuerySN_FLAG.Value        := False;
  end else
  begin
    if ASQueryArtikelTyp.Value = 'L' then // Lohn
    begin
      EKTO := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_ERLOESKTO', 8400);
      AKTO := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_AUFWANDSKTO', 3400);

      ASQueryBarCode.AsString := '';
      if (ASQueryAufw_Kto.Value = 0) or (ASQueryAufw_Kto.Value = AKTO) then 
        ASQueryAufw_Kto.Value := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_LOHN_AUFWANDSKTO', 3401);

      if (ASQueryErloes_Kto.Value = 0) or (ASQueryErloes_Kto.Value = EKTO) then 
        ASQueryErloes_Kto.Value := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_LOHN_ERLOESKTO', 8401);

      ASQueryInventur_Wert.Value := 0;
      ASQueryGewicht.AsFloat     := 0;
      ASQueryMenge_Min.Value     := 0;
      ASQueryDimension.Value     := '';
      ASQueryLaenge.Value        := '';
      ASQueryGroesse.Value       := '';
      ASQueryVPE.Value           := 0;

      ASQuerySN_FLAG.Value       := False;
    end else
    if ASQueryArtikelTyp.Value = 'K' then // Transportkosten
    begin
      EKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_ERLOESKTO', 8400);
      AKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_AUFWANDSKTO', 3400);

      ASQueryBarCode.AsString := '';
      if (ASQueryAufw_Kto.Value = 0) or (ASQueryAufw_Kto.Value = AKTO) then 
        ASQueryAufw_Kto.Value := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_TKOST_AUFWANDSKTO', 3402);

      if (ASQueryErloes_Kto.Value = 0) or (ASQueryErloes_Kto.Value = EKTO) then 
        ASQueryErloes_Kto.Value := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_TKOST_ERLOESKTO', 8402);

      ASQueryInventur_Wert.Value := 0;
      ASQueryGewicht.AsFloat     := 0;
      ASQueryMenge_Min.Value     := 0;
      ASQueryDimension.Value     := '';
      ASQueryLaenge.Value        := '';
      ASQueryGroesse.Value       := '';
      ASQueryVPE.Value           := 0;

      ASQuerySN_FLAG.Value       := False;
    end else
    if ASQueryARTIKELTYP.Value = 'S' then
    begin
      EKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_ERLOESKTO', 8400);
      AKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_AUFWANDSKTO', 3400);

      DM1.GetWGRDefaultKonten (WGR, EKTO, AKTO);

      ASQueryNo_Ek_Flag.Value := True;
      if (ASQueryAufw_Kto.Value < 1) then 
        ASQueryAufw_Kto.Value   := AKTO;
      if (ASQueryErloes_Kto.Value < 1) then 
        ASQueryErloes_Kto.Value := EKTO;
    end else
    begin
      EKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_ERLOESKTO', 8400);
      AKTO := DM1.ReadInteger ('MAIN\ARTIKEL', 'DEF_AUFWANDSKTO', 3400);

      DM1.GetWGRDefaultKonten (WGR, EKTO, AKTO);

      if (ASQueryAufw_Kto.Value < 1) then 
        ASQueryAufw_Kto.Value := AKTO;
      if (ASQueryErloes_Kto.Value < 1) then 
        ASQueryErloes_Kto.Value := EKTO;

      if (ArtnumAuto) and (length(ASQueryARTNUM.AsString) = 0) then
      begin
        // Artikelnummer vergeben
        ASQueryARTNUM.AsString := DM1.IncNummerStr(ARTNUM_KEY);
      end;
    end;
  end;
  ASQueryGEAEND.Value := now;
  ASQueryGEAEND_NAME.Value := DM1.View_User;

  if ASQuerySHOP_ID.AsInteger > 0 then
  begin
    ASQuerySHOP_Change_Flag.Value := 1;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.AS_DSDataChange(Sender: TObject; Field: TField);
var 
  C, C1: TColor; 
  E, E1: Boolean; 
  Dummy, Dummy2: Double;
begin
  if LastArtikelTyp <> ASQueryArtikelTyp.Value then
  begin
    LastArtikelTyp := ASQueryArtikelTyp.Value;
    if LastArtikelTyp = 'T' then 
      C := clBtnFace 
    else 
      C := clWindow;
    c1 := c;
    if (length(LastArtikelTyp) > 0) and (LastArtikelTyp[1] in ['L', 'K']) then 
      C1 := clBtnFace;
    E := LastArtikelTyp <> 'T';
    E1 := E;
    if (length(LastArtikelTyp) > 0) and (LastArtikelTyp[1] in ['L', 'K']) then 
      E1 := False;
    A_KTO.Enabled           := E;
    E_KTO.Enabled           := E;
    MEinheit.Enabled        := E;
    RabGrpLoCB.Enabled      := E;


    //PEinheit.Enabled        :=E;
    MwstCB.Enabled          := E;
    MinMenge.Enabled        := E;
    Menge.Enabled           := E and ME_EDIT;

    MEBestellt.Enabled      := False; //E and ME_EKBEST_EDI;

    ME_Bestvorschlag.Enabled := E1;
    Gewicht.Enabled         := E1;
    Inventur_wert.Enabled   := E1;
    Barcode.Enabled         := E1;
    Lagerort.Enabled        := E1;
    Land.Enabled            := E1;
    Land_CB.Enabled         := E1;
    NO_RABATT.Enabled       := E;
    NO_PROV.Enabled         := E;
    Laenge.Enabled          := E1;
    Groesse.Enabled         := E1;
    Dimension.Enabled       := E1;
    VPE.Enabled             := E1;
    provision.enabled       := E;

    SernoCB.Enabled         := E1;
    //EK_Preis.Enabled        :=E;
    ListPreis.Enabled       := E;
    BruttoPreis.Enabled     := E;
    GewinnFaktor.Enabled    := E;

    //-------------------------

    A_KTO.Color             := C;
    E_KTO.Color             := C;
    MEinheit.Color          := C;
    RabGrpLoCB.Color        := C;
    //PEinheit.Color          :=C;
    MwstCB.Color            := C;
    MinMenge.Color          := C;
    Menge.Color             := C;
    //EK_Preis.Color          :=C;
    ListPreis.Color         := C;
    BruttoPreis.Color       := C;
    Gewicht.Color           := C1;
    Inventur_wert.Color     := C1;
    Barcode.Color           := C1;
    Lagerort.Color          := C1;
    Land.Color              := C1;
    Land_CB.Color           := C1;
    Laenge.Color            := C1;
    Groesse.Color           := C1;
    Dimension.Color         := C1;
    VPE.Color               := C1;
    provision.color         := C;

    ME_Bestvorschlag.Color  := C1;
    //MEBestellt.Color        :=C1;
    GewinnFaktor.Color      := C;
  end;
  EK_Preis.Enabled := (ASQueryRABGRP_ID.AsString = '-') and
                      (ASQueryArtikelTyp.Value <> 'T') and
                      (DM1.CaoSecurity.CanEKEdit(ModulID, 0));

  if not EK_Preis.Enabled then 
    EK_Preis.Color := clBtnFace
  else 
    EK_Preis.Color := clWindow;
  ekpreis.enabled := EK_Preis.Enabled;
  ekpreis.color   := EK_Preis.Color;

  Dummy := 1;
  vk1.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (
      (ASQueryRABGRP_ID.AsString = '-') or
      (not DM1.CalcRabGrpPreis(ASQueryRABGRP_ID.AsString, 1{VK1}, Dummy))
    ) and
    (DM1.GCalcFaktorTab[1] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, 1, Dummy2));
  Dummy := 1;
  vk2.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (
      (ASQueryRABGRP_ID.AsString = '-') or
      (not DM1.CalcRabGrpPreis(ASQueryRABGRP_ID.AsString, 2, Dummy))
    ) and
    (DM1.GCalcFaktorTab[2] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, 2, Dummy2));
  Dummy := 1;
  vk3.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (
      (ASQueryRABGRP_ID.AsString = '-') or
      (not DM1.CalcRabGrpPreis(ASQueryRABGRP_ID.AsString, 3{VK3}, Dummy))
    )and
    (DM1.GCalcFaktorTab[3] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, 3, Dummy2));
  Dummy := 1;
  vk4.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (
      (ASQueryRABGRP_ID.AsString = '-') or
      (not DM1.CalcRabGrpPreis(ASQueryRABGRP_ID.AsString, 4{VK4}, Dummy))
    ) and
    (DM1.GCalcFaktorTab[4] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, 4, Dummy2));

  vk5.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (DM1.GCalcFaktorTab[5] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, 5, Dummy2));

  ListPreis.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (DM1.GCalcFaktorTab[DM1.AnzPreis] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, DM1.AnzPreis, Dummy2));

  BruttoPreis.Enabled := (ASQueryArtikelTyp.Value <> 'T') and
    (DM1.GCalcFaktorTab[DM1.AnzPreis] = 0) and
    (not DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, DM1.AnzPreis, Dummy2));

  if VK1.Enabled then 
    VK1.DataField := 'VK1' 
  else 
    VK1.DataField := 'CALC_VK1';
  vk1_brutto.enabled := vk1.enabled; 
  vk1_rgw.enabled := vk1.enabled;

  if VK2.Enabled then 
    VK2.DataField := 'VK2' 
  else 
    VK2.DataField := 'CALC_VK2';
  vk2_brutto.enabled := vk2.enabled; 
  vk2_rgw.enabled := vk2.enabled;

  if VK3.Enabled then 
    VK3.DataField := 'VK3' 
  else 
    VK3.DataField := 'CALC_VK3';
  vk3_brutto.enabled := vk3.enabled; 
  vk3_rgw.enabled := vk3.enabled;

  if VK4.Enabled then 
    VK4.DataField := 'VK4' 
  else 
    VK4.DataField := 'CALC_VK4';
  vk4_brutto.enabled := vk4.enabled; 
  vk4_rgw.enabled := vk4.enabled;

  vk5_brutto.enabled := vk5.enabled; 
  vk5_rgw.enabled := vk5.enabled;

  if VK1.Enabled then 
    VK1_BRUTTO.DataField := 'VK1B'
  else 
    VK1_BRUTTO.DataField := 'CALC_VK1B';
  if VK2.Enabled then 
    VK2_BRUTTO.DataField := 'VK2B'
  else 
    VK2_BRUTTO.DataField := 'CALC_VK2B';
  if VK3.Enabled then 
    VK3_BRUTTO.DataField := 'VK3B'
  else 
    VK3_BRUTTO.DataField := 'CALC_VK3B';
  if VK4.Enabled then 
    VK4_BRUTTO.DataField := 'VK4B'
  else 
    VK4_BRUTTO.DataField := 'CALC_VK4B';

  gewinnfaktor.enabled := (ekpreis.enabled)and(ListPreis.Enabled);

  if gewinnfaktor.enabled then 
    gewinnfaktor.color := clWindow
  else 
    gewinnfaktor.color := clBtnFace;

  if (ASQueryRABGRP_ID.AsString = '-') then 
    EK_Preis.DataField := 'EK_PREIS'
  else 
    EK_Preis.DataField := 'CALC_EK';

  ekpreis.DataField := ek_preis.DataField;

  ShopArtLB.Enabled := (not ASQuerySHOP_DEL_FLAG.AsBoolean) and (ASQuerySHOP_ID.AsInteger < 1);

  case ShopVK of
    1: begin 
      ShopPreisEdi.DataField := VK1.DataField; 
      ShopPreisEdi.Enabled := VK1.Enabled; 
    end;
    2: begin 
      ShopPreisEdi.DataField := VK2.DataField; 
      ShopPreisEdi.Enabled := VK2.Enabled; 
    end;
    3: begin 
      ShopPreisEdi.DataField := VK3.DataField; 
      ShopPreisEdi.Enabled := VK3.Enabled; 
    end;
    4: begin 
      ShopPreisEdi.DataField := VK4.DataField; 
      ShopPreisEdi.Enabled := VK4.Enabled; 
    end;
    5: begin 
      ShopPreisEdi.DataField := VK5.DataField; 
      ShopPreisEdi.Enabled := VK5.Enabled; 
    end;
    else begin 
      ShopPreisEdi.DataField := 'SHOP_PREIS_LISTE'; 
      ShopPreisEdi.Enabled := True;   
    end;
  end;
  if (BruttoShop) and (ShopVK > 0) and (ShopVK < 6) then 
    ShopPreisEdi.DataField := ShopPreisEdi.DataField + 'B';

  if (ASQueryArtikelTyp.Value = 'T') or (shop_faktor<>0) then 
    ShopPreisEdi.Enabled := False;

  if ASQueryRec_ID.Value <> LastID then 
    ASQueryAfterScroll(nil);
end;                  

//------------------------------------------------------------------------------
procedure TArtikelForm.ShopPreisEdiExit(Sender: TObject);
begin
  if BruttoShop then 
    vk1_bruttoChange(Sender)
  else 
    vk1Change(Sender);

  matchExit(Sender);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtAllgemeinBtnClick(Sender: TObject);
var 
  LastPage: TTabsheet;
begin
  LastPage := Art_PC.ActivePage;
  if ASQuery.State in [dsInsert] then
  begin
    //MessageDlg ('Bitte erst den Datensatz speichern !',mtinformation,[mbok],0);
    ASQuery.Post;
    if ASQuery.State in [dsEdit, dsInsert] then
      exit;
  end;

  if (Sender is TMenuItem) then
    Art_PC.ActivePage := Art_PC.Pages[TMenuItem(Sender).Tag-1]
  else
    Art_PC.ActivePage := Art_PC.Pages[TSpeedButton(Sender).Tag-1];

  Art_PCChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtHirViewBtnClick(Sender: TObject);
begin
  if not ArtWGRPan.Visible then
  begin
    ArtWGrPan.Visible := True;
    JvxSplitter2.Visible := False;
    try 
      if Assigned(Sender) then 
        ArtWgrTV.SetFocus; 
    except 
    end;
  end else
  begin
    ArtWGRPan.Hide;
    JvxSplitter2.Visible := False;
  end;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtWgrTVDblClick(Sender: TObject);
begin
  if not ArtWgrDok then 
    ArtWgrPan.Hide;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtWgrTVExit(Sender: TObject);
begin
  if not ArtWgrDok then 
    ArtWgrPan.Hide;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtHirDockBtnClick(Sender: TObject);
begin
  if not ArtWgrDok then
  begin
    ArtWgrDok := True;
    JvxSplitter2.Enabled := False;
    JvxSplitter2.Visible := True;
    JvxSplitter2.Enabled := True;
    JvxSplitter2.Left := ArtWgrPan.Width + 1;
    Art_PC.Align := Alclient;
  end else
  begin
    ArtWgrDok := False;
    ArtWgrPan.Hide;
    Art_PC.Align := alNone;
    ArtikelPanelResize(Sender);
  end;
  DM1.WriteBooleanU('', 'ARTIKEL_HIR_DOK', ArtWgrDok);
end;               

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtikelPanelResize(Sender: TObject);
begin
  if Art_PC.Align = alNone then
  begin
    Art_PC.Left := 0;
    Art_PC.Top := ArtPan.Height;
    Art_PC.width := ArtikelPanel.ClientWidth;

    if SB1.Visible then 
      Art_PC.Height := ArtikelPanel.ClientHeight - ArtPan.Height - ArtikelToolbar1.Height - sb1.height
    else 
      Art_PC.Height := ArtikelPanel.ClientHeight - ArtPan.Height - ArtikelToolbar1.Height;
  end;
end;                                                                                      

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtWgrPanResize(Sender: TObject);
begin
  ArtHirDockBtn.Left := Panel1.Width - ArtHirDockBtn.Width - 3;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtWgrTVChange(Sender: TObject; Node: TTreeNode);
var 
  Last : String;
  N   : tTreeNode;
begin
  if First then 
    exit;
  Last := Artikel_SQL;

  // obersten Node ermitteln
  n := Node;
  repeat
    if assigned(N.Parent) then 
      N := N.Parent 
    else 
      break;
  until (not assigned(N))or(not assigned(N.Parent));


  if (Node = N) and
    (
     (Node.Text = _('alle Warengruppen')) or
     (Node.Text = _('Spezial')) or
     (Node.Text = _('Merkmale'))
    ) then
  begin
    Artikel_SQL := '';
  end else
  if (assigned(N)) and (N.Text = _('alle Warengruppen')) and (Node <> N) then
  begin
    Wgr := Integer(Node.Data);
      {if not DM1.WgrTab.Active then DM1.WgrTab.Open;
      if DM1.WgrTab.Locate ('ID',variant (wgr),[])
      then }Artikel_SQL :='WARENGRUPPE='+IntToStr(wgr){
      else Artikel_SQL := ''};
  end else
  if (assigned(N)) and (N.Text = _('Spezial')) and (Node <> N) then
  begin
    // Spezialauswahl laden
    DM1.Uniquery.Close;
    DM1.UniQuery.Sql.Text := 'select VAL_INT AS ID, NAME, VAL_BLOB ' +
        'from REGISTRY where ' +
        'MAINKEY="MAIN\\ART_HIR" ' +
        'and VAL_INT=' + IntToStr(Integer(Node.Data));
    DM1.UniQuery.Open;
    if DM1.UniQuery.RecordCount = 1 then 
       Artikel_SQL := DM1.UniQuery.FieldByName ('VAL_BLOB').AsString;
    DM1.UniQuery.Close;
  end else
  if (assigned(N)) and (N.Text = _('Merkmale')) and (Node <> N) then
  begin
    Artikel_SQL := 'inner join ARTIKEL_TO_MERK ATM on ATM.MERKMAL_ID = ' +
          IntToStr(Integer(Node.Data)) +
          ' and ARTIKEL.REC_ID = ATM.ARTIKEL_ID';
  end;

  if Last <> Artikel_SQL then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SuchbegChange(Sender: TObject);
begin
  {
  if (ASQuery.State in [dsEdit,dsInsert]) or
  (ArtPreisTab.State in [dsEdit,dsInsert]) then
  begin
  if MessageDlg (_('Der aktuelle Artikel wurde verändert,'+#13#10+
  'wollen Sie die Änderung speichern ?'),
  mtconfirmation,[mbYes, mbNo],0) = mryes then
  begin
  if (ASQuery.State in [dsEdit,dsInsert]) then ASQuery.Post;
  if (ArtPreisTab.State in [dsEdit,dsInsert]) then ArtPreisTab.Post;
  end
  else
  begin
  try
  if (ASQuery.State in [dsEdit,dsInsert])
  then ASQuery.Cancel;
  except end;
  try
  if (ArtPreisTab.State in [dsEdit,dsInsert])
  then ArtPreisTab.cancel;
  except end;
  end;
  end;
  }
  CheckSaved;

  searchtime := 15;
  searchtimer.enabled := true;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then 
    exit;
  SuchBegr := Suchbeg.Text;

  // führende Leerzeichen entfernen
  while (length(Suchbegr) > 0) and (Suchbegr[1] = ' ') do 
    delete(Suchbegr, 1, 1);
  // Leerzeichen am ende Entfernen
  while (length(Suchbegr) > 0) and (Suchbegr[length(Suchbegr)] = ' ') do 
    delete (Suchbegr, length(SuchBegr), 1);

  if searchtime > 0 then 
    dec(searchtime) 
  else
  begin
    searchtimer.enabled := false;
    UpdateQuery;
  end;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.SerNoTabBeforePost(DataSet: TDataSet);
begin
  SerNoTabARTIKEL_ID.Value := ASQueryREC_ID.Value;
  SerNoTabSTATUS.Value     := 'LAGER';
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.STListTabBeforePost(DataSet: TDataSet);
begin
  STListTabREC_ID.Value := ASQueryREC_ID.Value;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SNEditChange(Sender: TObject);
begin
  SNAddBtn.Enabled := length(SNEdit.Text) > 0;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SNAddBtnClick(Sender: TObject);
begin
  SerNoTab.Append;
  try
    SerNoTabSERNUMMER.Value := SNEdit.Text;
    SerNoTab.Post;
  except
    SerNoTab.Cancel;
    MessageDlg (_('Diese Seriennummer existiert bereits !'), mterror, [mbok], 0);
  end;

  SNEdit.Text := '';
  SNAddBtn.Enabled := False;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuSaveLayoutClick(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(HistGrid), 'ARTIKEL_HISTORY', 101);
  dm1.GridSaveLayout (tDBGrid(STListGrid), 'ARTIKEL_STLIST', 101);
  dm1.GridSaveLayout (tDBGrid(SerNoGrid), 'ARTIKEL_SERNO', 101);
  dm1.GridSaveLayout (tDBGrid(ArtSuchGrid), 'ARTIKEL_LISTE', 103);
  dm1.GridSaveLayout (tDBGrid(ZubGrid), 'ARTIKEL_ZUBEHOER');
  dm1.GridSaveLayout (tDBGrid(ErsGrid), 'ARTIKEL_ERSATZTEILE');
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SuchFeldCBChange(Sender: TObject);
begin
  if SuchBeg.Text <> '' then
  begin
    searchtime := 15;
    searchtimer.enabled := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.Aktualisieren1Click(Sender: TObject);
begin
  ASQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuVisibleColClick(Sender: TObject);
begin
  case Art_PC.ActivePage.Tag of
    2: begin
      case PreisPC.ActivePage.Tag of
        3: VisibleSpaltenForm.UpdateTable (tDBGrid(ArtKunPreisGrid));
        4: VisibleSpaltenForm.UpdateTable (tDBGrid(ArtLiefPreisGrid));
      end;
    end;
    3: begin
      case ErweitertPC.ActivePage.Tag of
        2: VisibleSpaltenForm.UpdateTable (tDBGrid(SerNoGrid));
        3: VisibleSpaltenForm.UpdateTable (tDBGrid(STListGrid));
        5: VisibleSpaltenForm.UpdateTable (tDBGrid(ZubGrid));
        6: VisibleSpaltenForm.UpdateTable (tDBGrid(ErsGrid));
      end;
    end;
    6: VisibleSpaltenForm.UpdateTable (tDBGrid(HistGrid));
    7: begin
      VisibleSpaltenForm.UpdateTable (tDBGrid(ArtSuchGrid));
      F9Change (LastF9);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuNewClick(Sender: TObject);
begin
  ASQuery.Append;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuDeleteClick(Sender: TObject);
begin
  ASQuery.Delete;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.kurznameExit(Sender: TObject);
begin
  MatchExit(Sender);

  if (length(ASQueryKURZNAME.Value) = 0) or
    (ASQueryKas_Name.Value = ASQueryKURZNAME.Value) or
    (length(ASQueryKURZNAME.Value) = 0) then 
  begin
    exit;
  end;

  if not (ASQuery.State in [dsEdit, dsInsert]) then 
    ASQuery.Edit;
  if ASQueryKas_Name.Value = '' then 
    ASQueryKas_Name.Value := ASQueryKURZNAME.Value;

  if K2L then
  begin
    if ASqueryLANGNAME.AsString = '' then 
      ASqueryLANGNAME.AsString := ASQueryKURZNAME.Value;
  end;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryBeforeDelete(DataSet: TDataSet);
var Anz: Integer;
begin
  if (ASQuerySHOP_ID.AsInteger>0) then
  begin
    MessageDlg (_('Shopartikel können nicht gelöscht werden.' + #13#10 +
      'Entfernen Sie zunächst den Artikel aus dem ' +
      'Shop und' + #13#10 + 'führen Sie anschließend einen ' +
      '"Shoptransfer" durch !'), mterror, [mbok], 0
    );
    Abort;
    exit;
  end;

  // Prüfen of Artikel in Stücklisten ist
  dm1.uniquery.close;
  dm1.uniquery.Sql.text :=
    'select count(*) as IN_STKL from ARTIKEL_STUECKLIST' +
    ' where ART_ID=' + Inttostr(ASQueryRec_ID.Value);
  dm1.uniquery.open;
  if dm1.uniquery.recordcount > 0 then 
    anz := dm1.uniquery.fieldbyname('IN_STKL').AsInteger
  else 
    anz := 0;
  dm1.uniquery.close;

  if Anz > 0 then
  begin
    if (not MassLoesch) and
      (MessageDlg (Format(_('Dieser Artikel wird in %d Stücklisten ' +
      'verwendet, wollen Sie den Artikel wirklich löschen ?'), [Anz]),
      mtconfirmation, [mbyes, mbno], 0) <> mryes) then 
    begin
      abort;
    end;
  end else
  if (not MassLoesch) and
     (MessageDlg (_('Wollen Sie diesen Artikel wirklich löschen ?'),
     mtconfirmation, [mbyes, mbno], 0) <> mryes) then
  begin
    Abort;
    exit;
  end;

  // 1. Artikel im Journal aktualisieren ( auf Freien Artikel setzten )
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('Update JOURNALPOS');
    SQL.Add ('Set ARTIKELTYP="F", ARTIKEL_ID="-1"');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 2. Langtexte löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_LTEXT');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 3. Seriennummern löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_SERNUM');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 4. Stücklisten löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_STUECKLIST');
    SQL.Add ('Where REC_ID=' + IntToStr(ASQueryRec_ID.Value));
    SQL.Add ('or ART_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 5. ArtikelToKatalog löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_TO_KAT');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 6. ArtikelPreise löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_PREIS');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;

  // 7. Merkmale löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add ('delete from ARTIKEL_TO_MERK');
    SQL.Add ('Where ARTIKEL_ID=' + IntToStr(ASQueryRec_ID.Value));
    execsql;
  end;
end;
//------------------------------------------------------------------------------

procedure TArtikelForm.OnArtikelZusammenfassen(ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
begin
  ZusammenFassenID := ID;

  DM1.Uniquery.Close;
  DM1.UniQuery.Sql.Clear;
  DM1.UniQuery.SQL.Add ('select REC_ID, MENGE_AKT from ARTIKEL ' +
    'where REC_ID=' + Inttostr(ID));
  DM1.UniQuery.Open;
  if DM1.UniQuery.RecordCount = 1 then
  begin
    ZusammenFassenMenge := DM1.UniQuery.FieldByName ('MENGE_AKT').AsFloat;
  end else 
    ZusammenFassenID := -1;
  DM1.UniQuery.Close;
end;                     

//------------------------------------------------------------------------------
procedure TArtikelForm.OnAddArtikelToStueckList(ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
var 
  //T1, T2,
  Art     : String;
  AnzSNArt: Integer;
begin
  InSListAdd := True;

  if ErweitertPC.ActivePage = StueckListTS then 
    ART := 'STL' 
  else
  if ErweitertPC.ActivePage = ZubehoerTS then 
    ART := 'ZUB' 
  else
  if ErweitertPC.ActivePage = ErsatzteilTS then 
    ART := 'ERS';

  try
    // Artikel zur Stückliste hinzufügen
    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.Sql.Text :=
    'select A.REC_ID,A.EK_PREIS,' +
    'A.VK1,A.VK2,A.VK3,A.VK4,A.VK5,A.VK1B,A.VK2B,A.VK3B,A.VK4B,A.VK5B, ' +
    'AP.PREIS,AP.MENGE2,AP.PREIS2,AP.MENGE3,AP.PREIS3,AP.MENGE4,AP.PREIS4, ' +
    'AP.MENGE5,AP.PREIS5,A.MENGE_AKT,AB_EKBEST.SUM_MENGE as MENGE_BESTELLT, ' +
    'A.RABGRP_ID,AB_VKRE_EDI.SUM_MENGE as  MENGE_RESERVIERT, ' +
    'A.ALTTEIL_FLAG,A.NO_RABATT_FLAG,A.NO_PROVISION_FLAG,A.NO_BEZEDIT_FLAG,' +
    'A.NO_VK_FLAG,A.NO_EK_FLAG,A.SN_FLAG,A.PROVIS_PROZ,A.STEUER_CODE,A.ERLOES_KTO,A.AUFW_KTO,' +
    'A.ARTNUM,A.ERSATZ_ARTNUM,A.MATCHCODE,A.WARENGRUPPE,A.BARCODE,A.ARTIKELTYP,' +
    'A.KAS_NAME,A.ME_EINHEIT,A.PR_EINHEIT,A.VPE,' +
    'A.LAENGE,A.BREITE,A.HOEHE,A.GROESSE,A.DIMENSION,A.GEWICHT,A.INFO,KURZNAME,' +
    'LANGNAME,AP.PREIS_TYP,AP.ADRESS_ID,AP.BESTNUM ' +
    ',0.00 as MENGE_LIEF, 0.00 as MENGE_SOLL, A.REC_ID as JID ' +
    'from ARTIKEL A ' +
    'left outer join ARTIKEL_PREIS AP on AP.ARTIKEL_ID=A.REC_ID ' +
    'left outer join ARTIKEL_BDATEN AB_EKBEST on AB_EKBEST.ARTIKEL_ID=A.REC_ID and AB_EKBEST.QUELLE=16 ' +
    'left outer join ARTIKEL_BDATEN AB_VKRE_EDI on AB_VKRE_EDI.ARTIKEL_ID=A.REC_ID and AB_VKRE_EDI.QUELLE=13 ' +
    'where A.REC_ID=:AID group by A.REC_ID, AP.PREIS_TYP, AP.ADRESS_ID';

    with DM1.UniQuery do
    begin
      SQL.Text := 'select COUNT(*) as ANZ ' +
      'from ARTIKEL_STUECKLIST ASL, ARTIKEL A ' +
      'where ASL.ART_ID=A.REC_ID and A.SN_FLAG="Y" ' +
      'and ASL.ARTIKEL_ART="STL" and ASL.REC_ID=' +
      IntToStr(ASQueryRec_ID.AsInteger);
      Open;
      AnzSNArt := FieldByName('ANZ').AsInteger;
      Close;
    end;

    DM1.ArtInfoTab.ParamByName ('AID').Value := ID;
    DM1.ArtInfoTab.Open;
    if DM1.ArtInfoTab.RecordCount >= 1 then
    begin
      if ( // Stückliste
        (Art = 'STL') and
        (
          (DM1.ArtInfoTabArtikelTyp.Value = 'N') or
          (DM1.ArtInfoTabArtikelTyp.Value = 'L') or
          (DM1.ArtInfoTabArtikelTyp.Value = 'K')
        ) and
        (
          (DM1.ArtInfoTabSN_FLAG.Value = False)
        )
        ) or
        ( // Zubehör und Ersatzteile
        ((Art = 'ZUB')or(ART = 'ERS'))and
        (
          (DM1.ArtInfoTabArtikelTyp.Value = 'N') or
          (DM1.ArtInfoTabArtikelTyp.Value = 'L') or
          (DM1.ArtInfoTabArtikelTyp.Value = 'K') or
          (DM1.ArtInfoTabArtikelTyp.Value = 'S')
        )  
        ) then
      begin
        STListTab.Append;
        STListTabArt_ID.Value := ID;
        STListTabMenge.Value := CAO_round(Menge * 100) / 100;
        STListTabERST_NAME.AsString := DM1.View_User;
        STListTabARTIKEL_ART.AsString := ART;
        try
          STListTab.Post;
        except
          STListTab.Cancel;
          MessageDlg (_('Der Artikel konnte nicht ' +
            'hinzugefügt werden.' + #13#10 +
            'Evt. befindet sich der Artikel ' +
            'bereits in der Liste !'), mterror, [mbok], 0);
        end;
      end else
      begin
        if DM1.ArtInfoTabArtikelTyp.AsString = 'T' then
        begin
          MessageDlg (_('Texte können nicht zu einer Stückliste ' +
          'hinzugefügt werden.'), mterror, [mbok], 0);
        end else
        begin
          MessageDlg (_('Artikel, die selbst aus einer Stückliste ' +
            'bestehen oder' + #13#10 +
            'bei denen die Seriennummernverwaltung ' +
            'aktiviert ist,' + #13#10 +
            'können nicht zu einer Stückliste hinzugefügt werden.'),
            mterror, [mbok], 0);
        end;
      end;
    end;
    DM1.ArtInfoTab.Close;
    STListTab.Refresh;
  finally
    InSListAdd := False;
  end;
end;      

//------------------------------------------------------------------------------
procedure TArtikelForm.ToolButton8Click(Sender: TObject);
var 
  MyArtikelForm: TArtikelForm;
begin
  MyArtikelForm := TArtikelForm.Create (Self{Application});
  try
    MyArtikelForm.OnAddArtikel := OnAddArtikelToStueckList;
    MyArtikelForm.Borderstyle := bsSizeable;
    MyArtikelForm.Width := 660;
    MyArtikelForm.Height := 555;

    MyArtikelForm.Left := Application.MainForm.Left + 60;
    MyArtikelForm.Top := Application.MainForm.Top + 30;

    MyArtikelForm.Invalidate;
    MyArtikelForm.ShowModal;
  finally
    MyArtikelForm.Free;
  end;
  STListTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.STListTabAfterOpen(DataSet: TDataSet);
begin
  STListArtDelBtn.Enabled := STListTab.RecordCount > 0;

  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Text := 'select SUM(ARS.MENGE * A.EK_PREIS) as GESAMT ' +
    'from ARTIKEL_STUECKLIST ARS, ARTIKEL A ' +
    'where ARS.REC_ID=' +
    IntToStr(ASQueryRec_ID.AsInteger) +
    ' and A.REC_ID=ARS.ART_ID and ' +
    'ARTIKEL_ART="' + STListTabARTIKEL_ART.AsString + '"';
  DM1.UniQuery.Open;
  STListSumEK.Value := DM1.UniQuery.FieldByName ('GESAMT').AsFloat;
  DM1.UniQuery.Close;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.STListPreisUebernehmenBtnClick(Sender: TObject);
begin
  if ASQuery.State <> dsEdit then 
    ASQuery.Edit;
  ASQueryEK_Preis.AsFloat := STListSumEK.Value;
  EK_PreisChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.STListArtDelBtnClick(Sender: TObject);
begin
  STListTab.Delete;
end;
//------------------------------------------------------------------------------
procedure TArtikelForm.LtextMemoExit(Sender: TObject);
begin
  if ((ASQueryKas_Name.Value = '') or (ASQueryKurzName.Value = '')) and
     (not (ASQuery.State in [dsEdit, dsInsert])) and
     (length(LtextMemo.Lines[0]) > 0) then 
  begin
    ASQuery.Edit;
  end;

  if ASQueryKas_Name.Value = '' then 
    ASQueryKas_Name.Value := LtextMemo.Lines[0];
  if ASQueryKurzName.Value = '' then 
    ASQueryKurzName.Value := LtextMemo.Lines[0];

  MatchExit (Sender);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuSearchClick(Sender: TObject);
begin
  try
    Suchbeg.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.alle1Click(Sender: TObject);
begin
  Limit := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
  DM1.WriteIntegerU('', 'ARTIKEL_TREFFER', Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if ASQuery.RecordCount = 0 then 
    Datensatz := _('keine')
  else 
  if ASQuery.RecordCount = Limit then 
    Datensatz := inttostr (ASQuery.RecNo) +
      ' ' + _('von') + ' >=' +
      inttostr (ASQuery.RecordCount)
  else 
    Datensatz := inttostr (ASQuery.RecNo) +
      ' ' + _('von') + ' ' +
      inttostr (ASQuery.RecordCount);

  Sortierung := _('Sortierung') + ' : ' + sortname;

  if (asquery.active) and (asquery.recordcount > 0) then
  begin
    Erstellt := _('Erstellt:') + formatdatetime (_('dd.mm.yyyy'), ASQueryErstellt.Value);

    if ASQueryGeaend.Value > 1 then 
      Geaendert := _('Geändert:') + formatdatetime (_('dd.mm.yyyy'), ASQueryGeaend.Value)
    else 
      Geaendert := '-';
  end else
  begin
    Erstellt := '';
    Geaendert := '';
  end;

  SuchZeit := FormatFloat('0.00', (querytime) / 1000) + ' ' + _('Sek.');

  if assigned (OnUpdateStatusBar) then
  begin
    SB1.Visible := False;
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end else
  begin
    SB1.Visible := True;

    sb1.panels[0].Text := SuchZeit;
    sb1.panels[1].Text := Datensatz;
    SB1.Panels[2].Text := Sortierung;
    Sb1.Panels[3].Text := Erstellt;
    Sb1.Panels[4].Text := Geaendert;
  end;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.FormShow(Sender: TObject);
begin
  Uebernehmen1.Visible   := Assigned(OnAddArtikel);
  bernehmenundSchlieen1.Visible   := Assigned(OnAddArtikel);
  UebernahmeBtn1.Visible := Assigned(OnAddArtikel);
  AddMengeLab.Visible    := Assigned(OnAddArtikel);
  AddMengeEdi.Visible    := Assigned(OnAddArtikel);
  MainForm.XPMenu1.InitComponent (Self);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SuchbegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    try
      if Art_PC.ActivePage = Allg_TS then 
        Match.SetFocus 
      else
      if Art_PC.ActivePage = Such_TS then 
        ArtSuchGrid.SetFocus;
    except 
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuCopyClick(Sender: TObject);
var 
  data  : array of Variant;
  i     : Integer;
  LastID: Integer;
begin
  if ASquery.State in [dsEdit, dsInsert] then 
    ASQuery.Post;

  // ID merken
  LastID := ASQueryRec_ID.AsInteger;

  // Artikel kopieren
  setlength(data, ASQuery.Fields.Count);
  for i := 0 to ASQuery.Fields.Count-1 do 
    data[i] := ASQuery.Fields[i].Value;
  ASQuery.Append;

  for i := 0 to ASQuery.Fields.Count-1 do
  begin
    if (Uppercase(ASQuery.Fields[i].FieldName) <> 'REC_ID') and
       (Uppercase(ASQuery.Fields[i].FieldName) <> 'SHOP_ID') and
       (Uppercase(ASQuery.Fields[i].FieldName) <> 'SHOP_ARTIKEL_ID') and
       (Uppercase(ASQuery.Fields[i].FieldName) <> 'SHOP_CHANGE_FLAG') and
       (Uppercase(ASQuery.Fields[i].FieldName) <> 'SHOP_DEL_FLAG') and
       (Uppercase(ASQuery.Fields[i].FieldName) <> 'SHOP_VISIBLE') then 
    begin
      ASQuery.Fields[i].Value := data[i];
    end;
  end;

  ASqueryMenge_Akt.Value   := 0;
  ASQueryMENGE_START.Value := 0;

  ASQuery.Post;

  if AsQueryArtikelTyp.AsString = 'S' then
  begin
    STListTab.Close;
    STListTab.ParamByName('ID').AsInteger := ASQueryRec_ID.AsInteger;
    STListTab.Open;

    // Stückliste Kopieren
    dm1.UniQuery2.close;
    dm1.uniquery2.sql.text :=
    'SELECT * FROM ARTIKEL_STUECKLIST WHERE REC_ID=' + IntToStr(LastID);
    dm1.uniquery2.open;
    while not dm1.uniquery2.eof do
    begin
      STListTab.Append;
      STListTabREC_ID.AsInteger := ASQueryRec_ID.AsInteger;
      STListTabART_ID.AsInteger := DM1.UniQuery2.FieldByName ('ART_ID').AsInteger;
      STListTabMENGE.AsFloat    := DM1.UniQuery2.FieldByName ('MENGE').AsFloat;
      STListTabERSTELLT.AsDateTime := Now;
      STListTabERST_NAME.AsString := dm1.View_User;
      STListTabGEAEND.AsDateTime := Now;
      STListTabGEAEND_NAME.AsString := dm1.View_User;
      STListTab.Post;
      dm1.uniquery2.next;
    end;
    dm1.uniquery2.close;
  end;

  SetLength(Data, 0);
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.matchEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor;;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.matchExit(Sender: TObject);
begin
  tDBEdit(sender).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TArtikelForm.MnuViewEKClick(Sender: TObject);
begin
  MnuViewEK.Checked := not MnuViewEK.Checked;
  F9Change (MnuViewEK.Checked);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryNewRecord(DataSet: TDataSet);
var 
  i: Integer;
begin
  ASQueryMenge_Akt.Value      := 0;
  ASQueryMenge_Min.Value      := 0;
  ASQueryMenge_BVor.Value     := 0;
  //ASQueryMENGE_BESTELLT.Value :=0;
  ASQueryMENGE_START.Value    := 0;
  ASQueryAUTODEL_Flag.Value   := False;
  ASQueryEK_PREIS.Value       := 0;

  for i := 1 to 5 do
  begin
    VKTab[i].Value := 0; VKBTab[i].Value := 0;
  end;
  ASQuerySTEUER_CODE.Value    := DM1.DefMwStCD;
  ASQueryWarengruppe.Value    := WGR;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryBeforeInsert(DataSet: TDataSet);
begin
  try
    if not Art_PC.Enabled then 
      Art_PC.Enabled := True;

    ART_PC.ActivePage := Allg_TS;
    Art_PCChange (Self);
    PreisPC.ActivePage := PreisStdTS;

    Match.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuCloseClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuPrintArtikelClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //30.10.09-ud.
  //PrintRechForm.ShowArtikelDlg(ASQueryREC_ID.AsInteger, False);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuPrintListClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //30.10.09-ud.
  //PrintRechForm.ShowArtikelListDlg (ASQuery.Sql.Text, False);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuPrintPartListClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //30.10.09-ud.
  //PrintRechForm.ShowArtStuecklistDlg (ASQueryREC_ID.AsInteger, False);;
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuPrintHistoryClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //
  {$ENDIF}
end;

//------------------------------------------------------------------------------
// Berechnet das Feld Gewinnfaktor auf der Seite Allgemein neu
//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateGewinnFaktor;
var
  VK, EK: Double; S: String;
begin
  if InFaktorUpdate then 
    exit;
  InFaktorUpdate := True;
  try
    EK := 0;
    try
      if (EK_Preis.Focused) and (length(EK_Preis.Text) > 0) then
      begin
        S := EK_Preis.Text;
        if pos(' ', s) > 0 then 
          delete(s, pos(' ', s), length(s) - pos(' ', s) + 1);
        EK := StrToFloat (S);
      end else
      if (ekpreis.Focused) and (length(EKPreis.Text) > 0) then
      begin
        S := EKPreis.Text;
        if pos(' ', s) > 0 then 
          delete(s, pos(' ', s), length(s) - pos(' ', s) + 1);
        EK := StrToFloat (S);
      end
      else 
        EK := ASQuery.FieldByName (EK_Preis.DataField).AsFloat;
    except 
    end;

    if (GewinnFaktor.Enabled) or (EK_Preis.DataField = 'CALC_EK') then
    begin                   {EK * VK / 100}
      VK := VKtab[DM1.AnzPreis].Value;

      if EK <> 0 then 
        GewinnFaktor.Value := ((VK - EK) / EK) + 1
      else 
        GewinnFaktor.Value := 0;
    end else 
      GewinnFaktor.Value := 0;

    if (GewinnFaktor.Value <> 0) and (GewinnFaktor.Value < 1.03) then 
      GewinnFaktor.Font.Color := clRed
    else 
      GewinnFaktor.Font.Color := clBlack;
  finally
    InFaktorUpdate := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.EK_PreisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  EK_PreisChange(Sender);
end;

//------------------------------------------------------------------------------
// Berechnet alle Preise Netto + Brutto neu wenn ein Calc-Faktor eingestellt ist
//------------------------------------------------------------------------------
procedure TArtikelForm.EK_PreisChange(Sender: TObject);
var 
  Faktor, FaktorWgr, EK, 
  B: Double; 
  I: Integer; 
  S: String;
begin
  EK := 0;
  try
    if (EK_Preis.Focused) and (length(EK_Preis.Text) > 0) then
    begin
      S := EK_Preis.Text;
      if pos(' ', s) > 0 then 
        delete(s, pos(' ', s), length(s) - pos(' ', s) + 1);
      EK := StrToFloat (S);
    end else
    if (ekpreis.Focused) and (length(EKPreis.Text) > 0) then
    begin
      S := EKPreis.Text;
      if pos(' ', s) > 0 then 
        delete(s, pos(' ', s), length(s) - pos(' ', s) + 1);
        EK := StrToFloat (S);
    end else 
      EK := ASQueryCALC_EK.AsFloat;
  except 
  end;

  if not (ASQuery.State in [dsEdit, dsInsert]) then 
    exit;
  for i := 1 to DM1.AnzPreis do
  begin
    Faktor := DM1.GCalcFaktorTab[i];
    FaktorWgr := 0;
    DM1.GetWGRCalcFaktor(ASQueryWarengruppe.AsInteger, i, FaktorWgr);
    if FaktorWgr <> 0 then 
      Faktor := FaktorWgr;

    if (Faktor > 0) then
    begin
      VKTab[i].AsFloat := CAO_round_nk(EK * Faktor, DM1.VK_NACHKOMMA);

      B := CAO_round(VKTab[i].AsFloat * (100 + DM1.MwStTab[ASQuerySTEUER_CODE.AsInteger]));

      B := CAO_Round (B / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;

      VKBTab[i].AsFloat := B

    end;
    // Rohgewinne aktualisieren
    Update := True;
    try
      VKRgwTab[i].Value := VKTab[i].AsFloat - EK;
      VKRgwTab[i].Font.Color := clRed * ord (VKRgwTab[i].value<0);
    finally
      Update := False;
    end;
  end;

  // Faktor aktualisieren wenn er nicht den Fokus hat
  if (not GewinnFaktor.Focused) then
  begin
    if EK <> 0 then 
      GewinnFaktor.Value := ((VKTab[DM1.AnzPreis].AsFloat - EK) / EK) + 1
    else 
      GewinnFaktor.Value := 0;
  end;
end;

//------------------------------------------------------------------------------
// Berechnet den Listenpreis (höchsten VK) mittels des Faktors neu
//------------------------------------------------------------------------------
procedure TArtikelForm.GewinnFaktorChange(Sender: TObject);
var 
  //i : Intege;
  B: Double;
begin
  if (InFaktorUpdate)or(not GewinnFaktor.Focused) then 
    exit;
  InFaktorUpdate := True;
  try
    if not (ASQuery.State in [dsEdit, dsInsert]) then 
      ASQuery.Edit;

    VKTab[DM1.AnzPreis].AsFloat := ASQueryEK_Preis.Value * GewinnFaktor.Value;
    B := CAO_round(VKTab[DM1.AnzPreis].AsFloat * (100 + DM1.MwStTab[ASQuerySTEUER_CODE.AsInteger])) / 100;
    // Runden
    B := CAO_round(B * 100); // jetzt ganze Cent
    B := CAO_Round (B / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
    VKBTab[DM1.AnzPreis].AsFloat := B;
    // neuberechnen der Preis auf der Seite Erweitert erzwingen
    vk1Change(vk1);
    vk1Change(vk2);
    vk1Change(vk3);
    vk1Change(vk4);
    vk1Change(vk5);
  finally
    InFaktorUpdate := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtikelZusammenfassen1Click(Sender: TObject);
var 
  MyArtikelForm: TArtikelForm;
begin
  if (ASQuery.State in [dsEdit, dsInsert]) then 
    ASQuery.Post;
  try
    if ASQuery.RecordCount > 0 then
    begin
      if MessageDlg(_('Mit dieser Funktion können Sie 2 Artikel' +
        ' zusammenfassen.' + #13#10 +
        'Alle Querverweise des zugefügten Artikels werden ' +
        'auf den aktuelle Artikel' + #13#10 +
        'abgeändert und dann der zugefügte Artikel gelöscht.' +
        #13#10 + #13#10 + 'Wollen Sie den Vorgang fortsetzen ?'),
        mtconfirmation, mbyesnocancel, 0) = mryes then
      begin
        ZusammenFassenID := -1;
        MyArtikelForm := TArtikelForm.Create(Self{Application});
        try
          MyArtikelForm.OnAddArtikel := OnArtikelZusammenfassen;
          MyArtikelForm.Borderstyle := bsSizeable;
          MyArtikelForm.Width := 660;
          MyArtikelForm.Height := 555;

          MyArtikelForm.Left := Application.MainForm.Left + 60;
          MyArtikelForm.Top  := Application.MainForm.Top + 30;

          MyArtikelForm.Invalidate;
          MyArtikelForm.OnlyOneArtikel := True;
          MyArtikelForm.ShowModal;

          if ZusammenFassenID > -1 then
          begin // Artikel überbnehmen
            if ZusammenFassenID <> ASQueryRec_ID.Value then
            begin
              if MessageDlg(_('Artikel wirklich zusammenfassen ????'),
                mtconfirmation, mbyesnocancel, 0) = mryes then
              begin
                DM1.DB1.AutoCommit := False;

                // Artikel_Langtext löschen
                dm1.UniQuery.Close;
                dm1.UniQuery.Sql.Clear;
                dm1.UniQuery.SQL.Add ('DELETE FROM ARTIKEL_LTEXT WHERE ARTIKEL_ID=' +
                Inttostr(ZusammenFassenID));
                dm1.UniQuery.ExecSql;

                // Seriennummern-Zuweisung ändern
                dm1.UniQuery.Close;
                dm1.UniQuery.Sql.Clear;
                dm1.UniQuery.SQL.Add ('UPDATE ARTIKEL_SERNUM SET ARTIKEL_ID=' +
                inttostr(ASQueryRec_ID.Value) +
                ' WHERE ARTIKEL_ID=' +
                Inttostr(ZusammenFassenID));

                //evt. Stückliste löschen
                dm1.UniQuery.Close;
                dm1.UniQuery.Sql.Clear;
                dm1.UniQuery.SQL.Add ('DELETE FROM ARTIKEL_STUECKLIST WHERE ART_ID=' +
                Inttostr(ZusammenFassenID));
                dm1.UniQuery.ExecSql;

                //Journalpositionen ändern
                dm1.UniQuery.Close;
                dm1.UniQuery.Sql.Clear;
                dm1.UniQuery.SQL.Add ('UPDATE JOURNALPOS SET ARTIKEL_ID=' +
                inttostr(ASQueryRec_ID.Value) +
                ' WHERE ARTIKEL_ID=' +
                Inttostr(ZusammenFassenID));
                dm1.UniQuery.ExecSql;
                dm1.UniQuery.Close;

                //Artikel löschen
                dm1.UniQuery.Close;
                dm1.UniQuery.Sql.Clear;
                dm1.UniQuery.SQL.Add ('DELETE FROM ARTIKEL WHERE REC_ID=' +
                Inttostr(ZusammenFassenID));
                dm1.UniQuery.ExecSql;
                dm1.UniQuery.Close;

                // Mengen zusammenfassen
                if ZusammenFassenMenge <> 0 then
                begin
                  if not (ASQuery.State in [dsEdit, dsInsert]) then 
                    ASQuery.Edit;
                  ASQueryMenge_Akt.Value := ZusammenFassenMenge + ASQueryMenge_Akt.Value;
                  ASQuery.Post;
                end;

                DM1.DB1.Commit;
                MessageDlg (_('Zusammenfassen erfolgreich abgeschlossen !'),
                mtinformation, [mbok], 0);
                FormActivate(Sender);
              end;
            end else
            begin
              MessageDlg (_('Sie können keinen Artikel sich selbst zuweisen.' + #13#10 +
                'Beide Artikel müssen unterschiedlich sein !'),
                mterror, [mbok], 0);
            end;
          end;
        finally
          MyArtikelForm.Free;
        end;
      end;
    end;
  finally
    DM1.DB1.AutoCommit := True;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuImportUpdateClick(Sender: TObject);
var 
  ArtikelImportForm: TArtikelImportForm;
begin
  Application.CreateForm(TArtikelImportForm, ArtikelImportForm);
  try
    { TODO : Monitor Transaction gibt es so nicht mehr } //17.10.09-ud.
    //MainForm.ZMonitor1.Transaction := nil; // Monitor aus !
    ArtikelImportForm.ShowModal;
  finally
    ArtikelImportForm.Free;
    { TODO : Monitor Transaction gibt es so nicht mehr } //17.10.09-ud.
    //MainForm.ZMonitor1.Transaction := DM1.Transact1;
  end;
  if ASQuery.Active then 
    ASQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtAllgemeinBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                               

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtAllgemeinBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;   

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryCalcFields(DataSet: TDataSet);
var P, PR, B, M: Double; I: Integer;
begin
  if (ASQuerySTEUER_CODE.AsInteger >= 0) and (ASQuerySTEUER_CODE.AsInteger < 4) then 
    M := DM1.MwStTab[ASQuerySTEUER_CODE.AsInteger] + 100 
  else 
    M := 100;

  if ASQueryRABGRP_ID.AsString <> '-' then
  begin
    PR := VKTab[DM1.AnzPreis].AsFloat;
    P := PR;
    DM1.CalcRabGrpPreis(ASQueryRABGRP_ID.AsString, 0{EK}, P);
    ASQueryCalc_EK.Value := P;

    for i := 1 to 4 do
    begin
      P := PR;
      if DM1.CalcRabGrpPreis (ASQueryRABGRP_ID.AsString, I{VKx}, P) then
      begin
        CalcVKTab[i].Value := P;
        B := CAO_round(P * M); // jetzt ganze Cent
        B := CAO_Round (B / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
        CalcVKBTab[i].Value := B;
      end  else
      begin
        CalcVKTab[i].Value := VKTab[i].Value;
        CalcVKBTab[i].Value := VKBTab[i].Value;
      end;
    end;
  end else
  begin
    ASQueryCalc_EK.Value := ASQueryEK_Preis.Value;

    for i := 1 to 4 do
    begin
      CalcVKTab[i].Value  := VKTab[i].Value;
      CalcVKBTab[i].Value := VKBTab[i].Value;
    end;
  end;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.JumpMenuPopup(Sender: TObject);
begin
  Rechnungdrucken1.enabled := 
    (not assigned(OnAddArtikel)) and
    (JPosTab.RecordCount > 0) and
    (JPosTabQUELLE.Value in [VK_RECH, VK_AGB, EK_BEST]);

  Belegbearbeiten1.Enabled :=
    (not assigned(OnAddArtikel)) and
    (JPosTab.RecordCount > 0) and
    (JPosTabQUELLE.Value in [VK_RECH_EDI, VK_AGB_EDI, EK_BEST_EDI, EK_RECH_EDI]);

  zumJournal1.Enabled :=
    (not assigned(OnAddArtikel)) and
    (JPosTab.RecordCount > 0) and
    (JPosTabQUELLE.Value in [VK_RECH, VK_AGB, EK_BEST, EK_RECH]);
end;                          

//------------------------------------------------------------------------------
procedure TArtikelForm.Rechnungdrucken1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg(JPosTabQuelle.Value, JPosTabJournal_ID.AsInteger, False);
  {$ELSE}
  MessageDlg(_('Der Code zum drucken der Rechnung' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0
  );
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.Belegbearbeiten1Click(Sender: TObject);
begin
  MainForm.JumpTo(JPosTabQuelle.Value, JPosTabJOURNAL_ID.Value, 0, False);
end;                                                           

//------------------------------------------------------------------------------
procedure TArtikelForm.zumJournal1Click(Sender: TObject);
var 
  Ja, Mo, Ta: Word;
begin
  DecodeDate(JPosTabRDatum.AsDateTime, Ja, Mo, Ta);
  MainForm.JumpTo(JPosTabQuelle.Value, JPosTabJOURNAL_ID.Value, Ja, {JPosTabJahr.AsInteger,} False);
end;             

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuDiscountGroupClick(Sender: TObject);
var 
  RabGrpForm: tRabGrpForm;
begin
  RabGrpForm := tRabGrpForm.Create(Self);
  try
    RabGrpForm.ShowModal;
  finally
    RabGrpForm.Free;
  end;
  // Tabellen mit den Rabattgruppen im Datenmodul aktualisieren
  if DM1.LiefRabGrp.Active then 
    DM1.LiefRabGrp.Refresh;
  if DM1.KunRabGrp.Active  then 
    DM1.KunRabGrp.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtikelnrChange(Sender: TObject);
begin
  if (length(Artikelnr.Text) = 0) or (Art_PC.ActivePage<>Allg_TS) then 
    exit;

  dm1.uniquery.close;
  dm1.uniquery.sql.text := 'SELECT REC_ID FROM ARTIKEL WHERE ARTNUM=''' +
    sqlStringToSql(Artikelnr.Text) +
    ''' and REC_ID!=' +
    IntToStr(ASQueryREC_ID.AsInteger);
  dm1.uniquery.open;

  if dm1.uniquery.recordcount > 0 then 
    Artikelnr.Color := clRed
  else
  if Artikelnr.Focused then 
    Artikelnr.Color := DM1.EditColor//$009FFF9F
  else 
    Artikelnr.Color := clWindow;

  dm1.uniquery.close;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatBtnClick(Sender: TObject);
var 
  KatForm: tKatForm;
begin
  if (ASqueryShop_ID.AsInteger < 1) or (ArtKat.State in [dsEdit, dsInsert]) then 
    exit;

  KatForm := tKatForm.Create(Self);
  try
    KatForm.ShowKatalog (ASqueryShop_ID.AsInteger, ASQueryRec_ID.AsInteger);
  finally
    KatForm.Free;
  end;

  if ArtKat.Active then 
    Artkat.Refresh 
  else
  begin
    ArtKat.ParamByName('SHOP_ID').AsInteger := ASQueryShop_ID.AsInteger;
    ArtKat.ParamByName('ARTIKEL_ID').AsInteger := ASQueryRec_ID.AsInteger;
    ArtKat.Open;
  end;
  ArtKatGrid.Invalidate;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ProdImageUploadBtnClick(Sender: TObject);
var 
  Name, LocalFileName: String;
  Img : TImageSize;
begin
  if ASqueryShop_ID.AsInteger < 1 then 
    exit;

  case tSpeedButton(Sender).Tag of
    2: Img := isMedium;
    3: Img := isLarge;
    else Img := isDefault;
  end;

  if FileUpload.ProduktImage (Name, LocalFileName, Img) then
  begin
    if not (ASQuery.State in [dsEdit, dsInsert]) then 
      ASQuery.Edit;
    case Img of
      isMedium: ASQuerySHOP_IMAGE_Med.AsString := Name;
      isLarge : ASQuerySHOP_IMAGE_Large.AsString := Name;
      else      ASQuerySHOP_IMAGE.AsString := Name;
    end;
    try 
      ASQuery.Post; 
    except 
    end;
    ProgressForm.Stop;
    if (length(LocalFileName) > 0) and (FileExists(LocalFileName)) then
    begin
      LinkForm.AddLink(MOD_ARTIKEL, ASQueryRec_ID.AsInteger, LocalFileName);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuExportCSVClick(Sender: TObject);
begin
  SaveDialog1.InitialDir := DM1.ExportDir;
  SaveDialog1.DefaultExt := 'csv';                      //Do not Localize
  SaveDialog1.Title      := _('Artikel exportieren');
  SaveDialog1.Filter     := _('CSV-Dateien') + '|*.csv' + '|' + _('Excel-Dateien') + '|*.xls';
  if SaveDialog1.Execute then
  begin
    try
      ASQuery.DisableControls;

      if Uppercase(ExtractFileExt(SaveDialog1.FileName)) = '.XLS' then 
        DM1.ExportDatasetToExcel (SaveDialog1.FileName, ASQuery, True)
      else 
        DM1.ExportDatasetToFile  (SaveDialog1.FileName, ASQuery, ListSeparator, False);
    finally
      ASQuery.EnableControls;
    end;
  end;
end;                                                   

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtPreisTabCalcFields(DataSet: TDataSet);
var 
  S: String;
begin
  S := '???';
  DM1.GetLieferant (ArtPreisTabADRESS_ID.AsInteger, S);
  ArtPreisTabLieferantStr.AsString := S;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtPreisTabBeforePost(DataSet: TDataSet);
var 
  C: Integer;
begin
  if PreisGrid.Focused then
  begin
    // Focus auf andere Zelle verlagern damit der Inplace-Editor
    // deaktiviert wird
    C := PreisGrid.Col;
    if C = 2 then
    begin
      PreisGrid.Col := 3;
      PreisGrid.Col := C;
    end else
    begin
      PreisGrid.Col := 2;
      PreisGrid.Col := C;
    end;
  end;

  if PreisPC.ActivePage = StaffelpreisTS then
  begin
    // Staffelpreise
    ArtPreisTabADRESS_ID.AsInteger := - 99;
    ArtPreisTabPREIS_TYP.AsInteger := 3;
  end else
  begin
    if PreisPC.ActivePage = KunPreisTS then
    begin
      // Kundenpreise
      ArtPreisTabPREIS_TYP.AsInteger := 3;
    end else
    if PreisPC.ActivePage = LiefPreisTS then
    begin
      // Lieferantenpreise
      ArtPreisTabPREIS_TYP.AsInteger := 5;
    end;
  end;
  ArtPreisTabGEAEND_NAME.AsString := DM1.View_User;
  ArtPreisTabGEAEND.AsDateTime := Now;
end;
  
//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryBeforeScroll(DataSet: TDataSet);
begin
  if (PreisGrid.Focused) or ((assigned(PreisGrid.InplaceEditor)) and (PreisGrid.InplaceEditor.Visible)) then
  begin
    LastFocus := getfocus; // Feld was den Focus hatte merken

    Suchbeg.SetFocus;     // Focus umlegen, führt zu auslösung von OnExit
    Application.ProcessMessages;
  end;
end;

procedure TArtikelForm.ArtikelUpdateSqlBeforeInsertSQL(Sender: TObject);
var
  i: integer;
  first: boolean;
  SQL: tStrings;
begin
  // InsertSQL bestücken
  First := True;

  ArtikelUpdateSQL.InsertSql.Clear;
  SQL := ArtikelUpdateSQL.InsertSql;
  SQL.Add('INSERT INTO ARTIKEL SET');

  for i := 0 to ASQuery.FieldCount-1 do
  begin
    if (ASQuery.Fields[i].CanModify) and
       (not ASQuery.Fields[i].Calculated) then
    begin
      if First then
        First := False
      else
        SQL.Add(', ');

      if (ASQuery.Fields[i].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency]) and
         (ASQuery.Fields[i].IsNull) then
        SQL.Add(ASQuery.Fields[i].FieldName + '= 0')
      else
        SQL.Add(ASQuery.Fields[i].FieldName + '= :' + ASQuery.Fields[i].FieldName);
    end;
  end;

  if First then
  begin
    SQL.Clear;
    Abort;
  end;
end;

procedure TArtikelForm.ArtikelUpdateSqlBeforeModifySQL(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var
  i: integer;
  first: boolean;
  SQL: tStrings;
begin
  if UpdateKind in [ukModify, ukInsert] then
  begin
    // SQL bestücken

    case UpdateKind of
      ukModify: SQL := ArtikelUpdateSQL.ModifySql;
      ukInsert: SQL := ArtikelUpdateSQL.InsertSql;
    end;

    First := True;

    SQL.Clear;

    if UpdateKind = ukModify  then
      SQL.Add ('UPDATE ARTIKEL SET')
    else
      SQL.Add ('INSERT INTO ARTIKEL SET');

    for i := 0 to DataSet.FieldCount-1 do
    begin
      if (DataSet.Fields[i].CanModify) and
        (not DataSet.Fields[i].Calculated) and
        ((DataSet.Fields[i].CurValue<>DataSet.Fields[i].OldValue) or
        (
        (DataSet.Fields[i].IsBlob) and
        (tBlobField(DataSet.Fields[i]).Modified)
        ) or
        (
        (UpdateKind = ukInsert) and
        (DataSet.Fields[i].FieldName <> 'REC_ID') and
        (DataSet.Fields[i].FieldName <> 'MENGE_BESTELLT')
        )
        ) then
      begin
        if First then
          First := False
        else
          SQL.Add (', ');

        if (DataSet.Fields[i].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency]) and
           (DataSet.Fields[i].IsNull) then
          SQL.Add (DataSet.Fields[i].FieldName + '=0')
        else
          SQL.Add (DataSet.Fields[i].FieldName + '=:' + DataSet.Fields[i].FieldName);
      end;
    end;
    if UpdateKind = ukModify then
      SQL.Add ('where REC_ID=:REC_ID');
    if First then
    begin
      SQL.Clear;
      UpdateAction := uaAbort;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.HerstellerEdiBtnClick(Sender: TObject);
var
  HerstellerForm: tHerstellerForm;
begin
  HerstellerForm := tHerstellerForm.Create(Self);
  try
    HerstellerForm.ShowDialog (ASqueryShop_ID.AsInteger);
  finally
    HerstellerForm.Free;
  end;
  DM1.HerstellerTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ASQueryPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ASQuery.Cancel;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.LiefDelBtnClick(Sender: TObject);
var 
  TXT: String;
begin
  if PreisPC.ActivePage = LiefPreisTS then 
    TXT := _('Wollen Sie diesen Lieferannten/Preis wirklich löschen ?')
  else 
    TXT := _('Wollen Sie diesen Kunden/Preis wirklich löschen ?');

  if MessageDlg (TXT, mtconfirmation, [mbyes, mbno], 0) = mryes then 
    ArtPreisTab.Delete;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtPreisTabAfterScroll(DataSet: TDataSet);
begin
  LiefDelBtn.Enabled := 
    (ASQuery.RecordCount > 0) and 
    (ASqueryRec_ID.AsInteger > 0)and
    (ArtPreisTab.RecordCount > 0);

  LiefStdBtn.Enabled := 
    (LiefDelBtn.Enabled) and
    (ArtPreisTabADRESS_ID.AsInteger <> ASQueryDEFAULT_LIEF_ID.AsInteger);

  KunPreisDelBtn.Enabled := 
    (ASQuery.RecordCount > 0) and
    (ASqueryRec_ID.AsInteger > 0) and
    (ArtPreisTab.RecordCount > 0);
end;                              

//------------------------------------------------------------------------------
procedure TArtikelForm.LiefStdBtnClick(Sender: TObject);
begin
  if not (ASQuery.State in [dsEdit, dsInsert]) then 
    ASQuery.Edit;
  ASQueryDEFAULT_LIEF_ID.AsInteger := ArtPreisTabADRESS_ID.AsInteger;
  ASQuery.Post;
  ArtPreisTab.Refresh;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtLiefPreisGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (ArtPreisTabADRESS_ID.AsInteger = ASQueryDEFAULT_LIEF_ID.AsInteger) then 
    Canvas.Font.Style := [fsBold];
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MwstCBChange(Sender: TObject);
var 
  i: integer;
begin
  // Bruttopreis neu berechnen
  for i := 1 to DM1.AnzPreis do
  begin
    case i of
      1: vk1change(vk1);
      2: vk1change(vk2);
      3: vk1change(vk3);
      4: vk1change(vk4);
      5: vk1change(vk5);
    end;
  end;
  MwStLabel.Caption := Formatfloat ('"' + _('MwSt') + ' ("0.0"%)"',
  DM1.MwStTab[ASQuerySTEUER_CODE.Value]);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisPCChange(Sender: TObject);
begin
  MnuVisibleCol.Enabled :=
    ((Art_PC.ActivePage.Tag = 2) and (PreisPC.ActivePage.Tag in [3, 4])) or
    ((Art_PC.ActivePage.Tag = 3) and (ErweitertPC.ActivePage.Tag in [2, 3, 5, 6])) or
    (Art_PC.ActivePage.Tag in [6, 7]);

  //if ArtPreisTab.State in [dsEdit, dsInsert] then ArtPreisTab.Post;


  ArtPreisTab.Close;

  if PreisPC.ActivePage = StaffelpreisTS then
  begin
    // Staffelpreise
    ArtPreisTab.SQL.Text := 'select * from ARTIKEL_PREIS ' +
      'where ARTIKEL_ID=:ID and PREIS_TYP=3 and ' +
      'ADRESS_ID=-99';
  end else
  if PreisPC.ActivePage = KunPreisTS then
  begin
    // Kundenpreise
    ArtPreisTab.SQL.Text := 'select * from ARTIKEL_PREIS ' +
      'where ARTIKEL_ID=:ID and PREIS_TYP=3 and ' +
      'ADRESS_ID>0';
  end else
  if PreisPC.ActivePage = LiefPreisTS then
  begin
     // Lieferantenpreise
     ArtPreisTab.SQL.Text := 'select * from ARTIKEL_PREIS ' +
      'where ARTIKEL_ID=:ID and PREIS_TYP=5 and ' +
      'ADRESS_ID>0';
  end;

  if (Art_PC.ActivePage = Preis_TS) and (PreisPC.ActivePage<>PreisStdTS) then 
    ArtPreisTab.Open;

  if PreisPC.ActivePage = StaffelpreisTS then 
    CalcStaffelPreise (Self);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.NewLiefPreisBtnClick(Sender: TObject);
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
      //Formactivate(Sender);
      UebernahmeBtn.Visible := True;
      uebernehmen1.Visible := True;
      bernehmenundSchlieen1.Visible := True;
      Button1.Cancel := True;
      Invalidate;
    end;
  end;
  with MainForm.AddrForm do
  begin
    ShowModal;
    if Uebern then
    begin
      if ArtPreisTab.Locate ('ADRESS_ID', KSQueryRec_ID.AsInteger, []) then
      begin
        if PreisPC.ActivePage = KunPreisTS then 
          MessageDlg (_('Dieser Kunde befindet sich breits ' +
          'in der Preistabelle,' + #13#10 +
          'eine Mehrfachanlage ist nicht möglich.'),
          mterror, [mbok], 0)
        else 
          MessageDlg (_('Dieser Lieferant befindet sich breits ' +
            'in der Preistabelle,' + #13#10 +
            'eine Mehrfachanlage ist nicht möglich.'),
            mterror, [mbok], 0);
      end else
      begin
        // Adresse in Preisliste übernehmen
        ArtPreisTab.Append;
        ArtPreisTabAdress_ID.AsInteger := KSQueryRec_ID.AsInteger;
        ArtPreisTabARTIKEL_ID.AsInteger := ASQueryRec_ID.AsInteger;
      end;
      Uebern := False;
      FormDeactivate (Sender);
    end;
  end{with};
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.LiefPreisSaveBtnClick(Sender: TObject);
begin
  ArtPreisTab.Post;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.LiefPreisAbortBtnClick(Sender: TObject);
begin
  ArtPreisTab.Cancel;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtPreisDSDataChange(Sender: TObject; Field: TField);
begin
  LiefPreisSaveBtn.Enabled  := ArtPreisTab.State in [dsEdit, dsInsert];
  LiefPreisAbortBtn.Enabled := LiefPreisSaveBtn.Enabled;
  KunPreisSaveBtn.Enabled   := LiefPreisSaveBtn.Enabled;
  KunPreisAbortbtn.Enabled  := LiefPreisSaveBtn.Enabled;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.CalcStaffelPreise(Sender: TObject);
begin
  PreisGrid.Cells[2, 1] := FormatFloat (',#0', ArtPreisTabMENGE2.AsInteger);
  PreisGrid.Cells[3, 1] := FormatFloat (',#0', ArtPreisTabMENGE3.AsInteger);
  PreisGrid.Cells[4, 1] := FormatFloat (',#0', ArtPreisTabMENGE4.AsInteger);
  PreisGrid.Cells[5, 1] := FormatFloat (',#0', ArtPreisTabMENGE5.AsInteger);

  PreisGrid.Cells[2, 2] := FormatFloat (',#0.000', ArtPreisTabPREIS2.AsFloat);
  PreisGrid.Cells[3, 2] := FormatFloat (',#0.000', ArtPreisTabPREIS3.AsFloat);
  PreisGrid.Cells[4, 2] := FormatFloat (',#0.000', ArtPreisTabPREIS4.AsFloat);
  PreisGrid.Cells[5, 2] := FormatFloat (',#0.000', ArtPreisTabPREIS5.AsFloat);

  PreisGrid.Cells[1, 3] := FormatFloat (',#0.00', ASQueryCALC_VK1.AsFloat);
  PreisGrid.Cells[2, 3] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK1.AsFloat * 100 - ASQueryCALC_VK1.AsFloat * ArtPreisTabPREIS2.AsFloat) / 100);
  PreisGrid.Cells[3, 3] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK1.AsFloat * 100 - ASQueryCALC_VK1.AsFloat * ArtPreisTabPREIS3.AsFloat) / 100);
  PreisGrid.Cells[4, 3] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK1.AsFloat * 100 - ASQueryCALC_VK1.AsFloat * ArtPreisTabPREIS4.AsFloat) / 100);
  PreisGrid.Cells[5, 3] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK1.AsFloat * 100 - ASQueryCALC_VK1.AsFloat * ArtPreisTabPREIS5.AsFloat) / 100);

  PreisGrid.Cells[1, 4] := FormatFloat (',#0.00', ASQueryCALC_VK2.AsFloat);
  PreisGrid.Cells[2, 4] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK2.AsFloat * 100 - ASQueryCALC_VK2.AsFloat * ArtPreisTabPREIS2.AsFloat) / 100);
  PreisGrid.Cells[3, 4] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK2.AsFloat * 100 - ASQueryCALC_VK2.AsFloat * ArtPreisTabPREIS3.AsFloat) / 100);
  PreisGrid.Cells[4, 4] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK2.AsFloat * 100 - ASQueryCALC_VK2.AsFloat * ArtPreisTabPREIS4.AsFloat) / 100);
  PreisGrid.Cells[5, 4] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK2.AsFloat * 100 - ASQueryCALC_VK2.AsFloat * ArtPreisTabPREIS5.AsFloat) / 100);

  PreisGrid.Cells[1, 5] := FormatFloat (',#0.00', ASQueryCALC_VK3.AsFloat);
  PreisGrid.Cells[2, 5] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK3.AsFloat * 100 - ASQueryCALC_VK3.AsFloat * ArtPreisTabPREIS2.AsFloat) / 100);
  PreisGrid.Cells[3, 5] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK3.AsFloat * 100 - ASQueryCALC_VK3.AsFloat * ArtPreisTabPREIS3.AsFloat) / 100);
  PreisGrid.Cells[4, 5] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK3.AsFloat * 100 - ASQueryCALC_VK3.AsFloat * ArtPreisTabPREIS4.AsFloat) / 100);
  PreisGrid.Cells[5, 5] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK3.AsFloat * 100 - ASQueryCALC_VK3.AsFloat * ArtPreisTabPREIS5.AsFloat) / 100);

  PreisGrid.Cells[1, 6] := FormatFloat (',#0.00', ASQueryCALC_VK4.AsFloat);
  PreisGrid.Cells[2, 6] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK4.AsFloat * 100 - ASQueryCALC_VK4.AsFloat * ArtPreisTabPREIS2.AsFloat) / 100);
  PreisGrid.Cells[3, 6] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK4.AsFloat * 100 - ASQueryCALC_VK4.AsFloat * ArtPreisTabPREIS3.AsFloat) / 100);
  PreisGrid.Cells[4, 6] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK4.AsFloat * 100 - ASQueryCALC_VK4.AsFloat * ArtPreisTabPREIS4.AsFloat) / 100);
  PreisGrid.Cells[5, 6] := FormatFloat (',#0.00', CAO_round(ASQueryCALC_VK4.AsFloat * 100 - ASQueryCALC_VK4.AsFloat * ArtPreisTabPREIS5.AsFloat) / 100);

  PreisGrid.Cells[1, 7] := FormatFloat (',#0.00', ASQueryVK5.AsFloat);
  PreisGrid.Cells[2, 7] := FormatFloat (',#0.00', CAO_round(ASQueryVK5.AsFloat * 100 - ASQueryVK5.AsFloat * ArtPreisTabPREIS2.AsFloat) / 100);
  PreisGrid.Cells[3, 7] := FormatFloat (',#0.00', CAO_round(ASQueryVK5.AsFloat * 100 - ASQueryVK5.AsFloat * ArtPreisTabPREIS3.AsFloat) / 100);
  PreisGrid.Cells[4, 7] := FormatFloat (',#0.00', CAO_round(ASQueryVK5.AsFloat * 100 - ASQueryVK5.AsFloat * ArtPreisTabPREIS4.AsFloat) / 100);
  PreisGrid.Cells[5, 7] := FormatFloat (',#0.00', CAO_round(ASQueryVK5.AsFloat * 100 - ASQueryVK5.AsFloat * ArtPreisTabPREIS5.AsFloat) / 100);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisGridKeyPress(Sender: TObject; var Key: Char);
var
  S: String;
  NK: Integer;
begin
  // Inhalt der Zelle ermitteln
  S := PreisGrid.Cells[PreisGrid.Col, PreisGrid.Row];
  // Bereits eingegebene Nachkommastellen ermitteln
  if (Length(S) > 0) and (POS(',', S) > 0) then
    NK := Length(S) - Pos(',', S)
  else
    NK := 0;

  // Wenn mind. 1 Zeichen markiert ist, dann Nachkommastellen löschen
  if (Assigned(PreisGrid.InplaceEditor)) and (length(PreisGrid.InplaceEditor.SelText) > 0) then 
    NK := 0;

  // Nur Zahlen und Komma zulassen
  // Dabei überprüfen wie viele Nachkommastellen bereits eingegeben wurden
  // Abbruch wenn zu viele Nachkommastellen

  // In Zeile 1 sind keine Kommastellen und kein Komma erlaubt
  // In Zeile 2 sind 3 Nachkommastellen erlaubt
  // In Zeile 3-7 sind 2 Nachkommastellen erlaubt (Preisangaben)

  if key in ['0'..'9', ',', '-'] then
  begin
    if ((PreisGrid.Row > 2) and (NK >= 2)) or
       ((PreisGrid.Row = 2) and (NK >= 3)) or
       ((PreisGrid.Row = 1) and (Key in [',', '-'])) or
       ((Key = '-') and (length(S) > 0)) then // Minus nur an 1. Stelle
    begin
      key := #0;
      MessageBeep(0);
    end;
  end else
  begin
    if not (key in [#8, #27, #13]) then // Backspace und ESC und Enter erlauben
    begin
      key := #0;
      MessageBeep(0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := (ACol > 1) and (DM1.CaoSecurity.CanEdit(ModulID, 2));
end;                                                  

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisGridSetCanvasProperties(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol = 1 then
  begin
    PreisGrid.Canvas.Font.Style := [fsBold];
  end else
  if (gdSelected in State) or (gdFocused in State) then
  begin
    if PreisGrid.Focused  then 
      PreisGrid.Canvas.Brush.Color := DM1.EditColor//$009FFF9F
    else 
      PreisGrid.Canvas.Brush.Color := clWindow;

    PreisGrid.Canvas.Font.Color := clBlack;
  end;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisGridExitCell(Sender: TJvStringGrid; AColumn, ARow: Integer; const EditText: String);
var 
  P1, P2: Double; 
  M: Integer;
begin
  if ArtPreisTab.RecordCount = 0 then
  begin
    ArtPreisTab.Append;
    ArtPreisTabARTIKEL_ID.AsInteger := ASQueryRec_ID.AsInteger;
  end else
  begin
    if not (ArtPreisTab.State in [dsEdit, dsInsert]) then 
      ArtPreisTab.Edit;
  end;

  if ARow > 2 then
  begin
    // Preis wurde geändert, also den Rabatt berechnen
    P2 := StrToFloat (EditText);

    case ARow of
      3: P1 := ASQueryCALC_VK1.AsFloat;
      4: P1 := ASQueryCALC_VK2.AsFloat;
      5: P1 := ASQueryCALC_VK3.AsFloat;
      6: P1 := ASQueryCALC_VK4.AsFloat;
      else P1 := ASQueryVK5.AsFloat;
    end;

    if P1 <> 0 then 
      P1 := 100 - (CAO_round(P2 / P1 * 100000) / 1000)
    else 
      P1 := 0;

    case AColumn of
      2: ArtPreisTabPREIS2.AsFloat := P1;
      3: ArtPreisTabPREIS3.AsFloat := P1;
      4: ArtPreisTabPREIS4.AsFloat := P1;
      5: ArtPreisTabPREIS5.AsFloat := P1;
    end;
  end else
  if ARow = 2 then
  begin
    // Rabatt wurde geändert
    P1 := StrToFloat (EditText);
    case AColumn of
      2: ArtPreisTabPREIS2.AsFloat := P1;
      3: ArtPreisTabPREIS3.AsFloat := P1;
      4: ArtPreisTabPREIS4.AsFloat := P1;
      5: ArtPreisTabPREIS5.AsFloat := P1;
    end;
  end else
  if ARow = 1 then
  begin
    // Menge wurde geändert
    M := StrToInt (EditText);
    case AColumn of
      2: ArtPreisTabMENGE2.AsFloat := M;
      3: ArtPreisTabMENGE3.AsFloat := M;
      4: ArtPreisTabMENGE4.AsFloat := M;
      5: ArtPreisTabMENGE5.AsFloat := M;
    end;
  end;

  ArtPreisTab.Post;
  CalcStaffelPreise (Self);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisPCChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  if ASQuery.State in [dsInsert] then
  begin
    AllowChange := False;
    MessageDlg (_('Bitte zunächst den Artikel speichern !'), mterror, [mbok], 0);
  end else
  begin
    CheckSaved;
    AllowChange := True;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.PreisGridGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: String);
var 
  P1, P2, PR: Double;
begin
  if assigned(PreisGrid.InplaceEditor) then 
    PreisGrid.InplaceEditor.Brush.Color := DM1.EditColor; //$009FFF9;

  if ARow>2 then
  begin
    case ARow of
      3: P1 := ASQueryCALC_VK1.AsFloat;
      4: P1 := ASQueryCALC_VK2.AsFloat;
      5: P1 := ASQueryCALC_VK3.AsFloat;
      6: P1 := ASQueryCALC_VK4.AsFloat;
      7: P1 := ASQueryVK5.AsFloat;
    end;

    case ACol of
      2: P2 := ArtPreisTabPREIS2.AsFloat;
      3: P2 := ArtPreisTabPREIS3.AsFloat;
      4: P2 := ArtPreisTabPREIS4.AsFloat;
      5: P2 := ArtPreisTabPREIS5.AsFloat;
    end;

    PR := cao_round((P1 - P1 * P2 / 100) * 100) / 100;
    Value := FormatFloat ('0.00', PR);
  end;
end;                                  

//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateMekrmale (ID: Integer);
var 
  i: integer;
begin
  ArtMerkmalLB.Enabled := ID > 0;

  if (not MerkmalTab.Active) or (MerkmalTab.ParamByName('ID').AsInteger <> ID) then
  begin
    MerkmalTab.Close;
    MerkmalTab.ParamByName('ID').AsInteger := ID;
    MerkmalTab.Open;

    ArtMerkmalLB.Items.BeginUpdate;
    try
      ArtMerkmalLB.Items.Clear;
      while not MerkmalTab.Eof do
      begin
        i := ArtMerkmalLB.Items.AddObject(MerkmalTabNAME.AsString, Pointer(MerkmalTabMERKMAL_ID.AsInteger));

        ArtMerkmalLB.Checked[i] := MerkmalTabFLAG.AsInteger = 1;
        MerkmalTab.Next;
      end;
    finally
      ArtMerkmalLB.Items.EndUpdate;
    end;
    {
    if ArtMerkmalLB.Items.Count>0 then
    begin
    for i:=0 to ArtMerkmalLB.Items.Count-1 do
    begin
    ArtMerkmalLB.Checked[i] :=
    MerkmalTab.Locate ('MERKMAL_ID',
    Integer(ArtMerkmalLB.Items.Objects[i]),[]);
    end;
    end;}
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtMerkmalLBClickCheck(Sender: TObject);
begin
  if AsQueryRec_ID.AsInteger < 1 then 
    exit;

  if ArtMerkmalLB.Itemindex > -1 then
  begin
    if ArtMerkmalLB.Checked[ArtMerkmalLB.ItemIndex] then
    begin
      DM1.Uniquery.Close;
      DM1.UniQuery.Sql.Text :=
        'INSERT INTO ARTIKEL_TO_MERK ' +
        'SET MERKMAL_ID=' +
        Inttostr(Integer(ArtMerkmalLB.Items.Objects[ArtMerkmalLB.ItemIndex])) +
        ', ARTIKEL_ID=' + IntToStr(AsQueryRec_ID.AsInteger);
      DM1.UniQuery.ExecSql;
    end
    else
    begin
      DM1.Uniquery.Close;
      DM1.UniQuery.Sql.Text :=
        'DELETE FROM ARTIKEL_TO_MERK ' +
        'WHERE MERKMAL_ID=' +
        Inttostr(Integer(ArtMerkmalLB.Items.Objects[ArtMerkmalLB.ItemIndex])) +
        ' AND ARTIKEL_ID=' + IntToStr(AsQueryRec_ID.AsInteger);
      DM1.UniQuery.ExecSql;
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TArtikelForm.Artikelnummernvergeben1Click(Sender: TObject);
begin
  if not ArtnumAuto then 
    exit;
  ASQuery.Close;
  ASQuery.SQL.Text := 'select ARTIKEL.*,SUBSTRING(LANGNAME,1,200) as LN, ' +
    'IFNULL(AB_EKBEST.SUM_MENGE,0) as MENGE_BESTELLT ' +
    'from ARTIKEL left outer join ARTIKEL_BDATEN AB_EKBEST ' +
    'on AB_EKBEST.QUELLE=26 and ' +
    'AB_EKBEST.ARTIKEL_ID=ARTIKEL.REC_ID ' +
    'where (ISNULL(ARTNUM))or(ARTNUM="")';
  ASQuery.Open;
  if ASQuery.RecordCount>0 then
  begin
    if MessageDlg (Format(_('Wollen Sie wirklich bei %d ' +
      'Artikeln automatisch eine ' +
      'Artikelnummer zuweisen ???'),
      [ASQuery.RecordCount]), mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      ASQuery.DisableControls;
      DM1.SqlLog := False;
      try
        ASQuery.First;
        while not asquery.eof do
        begin
          try
            asquery.edit;
            ASQueryARTNUM.AsString := DM1.IncNummerStr(ARTNUM_KEY);
            asquery.post;
          except
            asquery.cancel;
          end;
          asquery.next;
        end;
      finally
        ASQuery.EnableControls;
        DM1.SqlLog := True;
      end;
      MessageDlg (_('Die Zuweisung der Artikelnummern ist abgeschlossen'), mtinformation, [mbok], 0);
    end;
  end else
  begin
    MessageDlg (_('Alle Artikel haben bereits eine Artikelnummer.' + #13#10 +
      'Keine Zuweisung notwendig.'), mtinformation, [mbok], 0);
  end;
  UpdateQuery;
end; 

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuDelAllArtikelFromWGRClick(Sender: TObject);
begin
  if ASQuery.RecordCount > 0 then
  begin
    if MessageDlg(Format(_('Wollen Sie wirklich alle ' +
      'Artikel (%d) löschen ???'),
      [ASQuery.RecordCount]),
      mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      try
        MassLoesch := True;
        ASQuery.DisableControls;
        DM1.SqlLog := False;
        try
          ASQuery.First;
          while not asquery.eof do
          begin
            ASQuery.First;
            try
              asquery.Delete;
            except
            end;
            asquery.next;
          end;
        finally
          ASQuery.EnableControls;
          DM1.SqlLog := True;
        end;
      finally
        MessageDlg (_('Das Löschen ist abgeschlossen.'), mtinformation, [mbok], 0);
      end;
      MassLoesch := False;
    end;
  end;
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.UpdateDateien;
begin
  if LinkForm.MainPanel.Parent <> LinkPanel then 
    LinkForm.MainPanel.Parent := LinkPanel;

  LinkForm.SetModul(MOD_ARTIKEL, ASQueryRec_ID.AsInteger, Link_TS);
  try
    if (LinkForm.LV1.CanFocus) then 
      LinkForm.LV1.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuExtSearchClick(Sender: TObject);
var 
  P: PChar; 
  S: String;
begin
  if (ASQuery.State in [dsEdit, dsInsert]) or (ArtPreisTab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg (_('Der aktuelle Artikel wurde verändert,' + #13#10 +
      'wollen Sie die Änderung speichern ?'),
      mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      if (ASQuery.State in [dsEdit, dsInsert]) then 
        ASQuery.Post;
      if (ArtPreisTab.State in [dsEdit, dsInsert]) then 
        ArtPreisTab.Post;
    end else
    begin
      try
        if (ASQuery.State in [dsEdit, dsInsert]) then 
          ASQuery.Cancel;
      except 
      end;
      try
        if (ArtPreisTab.State in [dsEdit, dsInsert]) then 
          ArtPreisTab.cancel;
      except 
      end;
    end;
  end;

  // Plugin aufrufen
  // Rückgabe True wenn erfolgreich
  // in P wird dann der SQL-Suchstring zurückgegeben
  if (Assigned(CaoPluginExecCmd)) and (CaoPluginExecCmd(ARTIKEL_PLUGIN, ARTIKEL_SUCHE_CMD, 0{Rechte}, P)) then
  begin
    s := P;
    UpdateQuery (s);
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.SetLangTextfromStklBtnClick(Sender: TObject);
var 
  S: String;
begin
  if (not STListTab.Active)or(STListTab.RecordCount = 0) then 
    exit;

  STListTab.DisableControls;
  try
    if not (ASQuery.State in [dsEdit, dsInsert]) then 
      ASQuery.Edit;

    STListTab.First;
    while not STListTab.Eof do
    begin
      if length(S) > 0 then 
        S := S + #13;
      S := S + '  ' + Inttostr(STListTabMenge.AsInteger) + 'x ' + STListTabKURZNAME.AsString;
      STListTab.Next;
    end;
    if length(ASQueryLangname.AsString) > 0 then 
      ASQueryLangName.AsString := ASQueryLangName.AsString + #13;

    ASQueryLangName.AsString := ASQueryLangName.AsString + S;

    ArtAllgemeinBtnClick(ArtAllgemeinBtn);
    LtextMemo.SetFocus;

  finally
    STListTab.EnableControls;
  end;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.MnuSearchSerNoClick(Sender: TObject);
var 
  SerNumSuchForm: TSerNumSuchForm;
begin
  SerNumSuchForm := TSerNumSuchForm.Create(self);
  try
    SerNumSuchForm.ShowModal;
  finally
    SerNumSuchForm.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatAfterPost(DataSet: TDataSet);
begin
  //ArtKatGrid.Options :=ArtKatGrid.Options - [dgEditing];
  ArtKat.Refresh;
  //ArtKatGrid.DataSource :=nil;
  //ArtKatGrid.DataSource :=ArtKatDS;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatNewRecord(DataSet: TDataSet);
begin
  ArtKatUpdateSQL.Params[0].AsInteger := ASQueryShop_ID.AsInteger;
  ArtKatUpdateSQL.Params[1].AsInteger := ASQueryREC_ID.AsInteger;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not (ArtKat.State in [dsEdit, dsInsert])) then
  begin
    if (Shift = []) and (Key = vk_delete) then
    begin
      if ASqueryShop_ID.AsInteger < 1 then 
        Abort;
      if (ArtKat.Active) and (ArtKat.RecordCount > 0) then
      begin
        if MessageDlg(_('Wollen Sie diese Kategoriezuordnung wirklich löschen ?'),
          mtconfirmation, [mbyes, mbno], 0) = mryes then
        begin
          ArtKatUpdateSQL.Params[0].AsInteger := ASQueryShop_ID.AsInteger;
          ArtKatUpdateSQL.Params[1].AsInteger := ASQueryREC_ID.AsInteger;
          ArtKat.Delete;
          ArtKat.Refresh;
        end;
        Key := 0;
      end;
    end else
    if (Shift = []) and (Key = vk_insert) then
    begin
      if ASqueryShop_ID.AsInteger < 1 then 
        Abort;
      if (ArtKat.Active) then
      begin
        //ArtKatGrid.Options :=ArtKatGrid.Options + [dgEditing];
        //ArtKatGrid.DataSource :=nil;
        //ArtKatGrid.DataSource :=ArtKatDS;
        ArtKat.Insert;

        Key := 0;
      end;
    end else
    if (Shift = []) and (Key = VK_ESCAPE) and (ArtKat.Active) then
    begin        
      ArtKat.Cancel;
      Key := 0;
      ArtKat.Refresh;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatBeforeEdit(DataSet: TDataSet);
begin
  Abort;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatBeforePost(DataSet: TDataSet);
var 
  Anz: Integer;
begin
  Anz := 0;
  with dm1.uniquery do
  begin
    Sql.Text := 'SELECT * FROM ARTIKEL_KAT WHERE ' +
      'SHOP_ID=' + IntToStr(ASQueryShop_ID.AsInteger) + ' AND ' +
      'ID=' + IntToStr(ArtKat.FieldByName('ID').AsInteger);
    Open;
    Anz := RecordCount;
    Close;
    if Anz <> 1 then
    begin
      MessageDlg (_('Diese Kategorie existiert nicht !'), mterror, [mbok], 0);
      Abort;
      ArtKat.Cancel;
    end;

    Sql.Text := 'SELECT * FROM ARTIKEL_TO_KAT WHERE ' +
      'SHOP_ID=' + IntToStr(ASQueryShop_ID.AsInteger) + ' AND ' +
      'KAT_ID=' + IntToStr(ArtKat.FieldByName('ID').AsInteger) +
      ' AND ARTIKEL_ID=' + IntToStr(AsQueryREC_ID.AsInteger);
    Open;
    Anz := RecordCount;
    Close;
    if Anz = 1 then
    begin
      MessageDlg (_('Diese Zuordnung existiert bereits !'), mterror, [mbok], 0);
      Abort;
      ArtKat.Cancel;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TArtikelForm.ArtKatGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (ArtKat.Active) and (ArtKat.State in [dsEdit, dsInsert]) and (Key = #27) then
  begin
    key := #0;

    ArtKat.Cancel;
    ArtKat.Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.LockError(Error: Integer);
begin
  dm1.LockError (Error);
end;

//------------------------------------------------------------------------------
procedure TArtikelForm.HTMLEditBtn1Click(Sender: TObject);
{$IFDEF PRO}
var 
  HTMLStr: String;
  HTMLEditorForm: tHTMLEditorForm;
{$ENDIF}
begin
  {$IFDEF PRO}
  HTMLStr := DBSynEdit1.Text;

  Application.CreateForm(tHTMLEditorForm, HTMLEditorForm);
  with HTMLEditorForm do
  begin
    if EditHTML (HTMLStr) then
    begin
      if not (ASQuery.State in [dsEdit, dsInsert]) then 
        ASQuery.Edit;
      AsQueryShop_Langtext.AsString := HTMLStr;
    end;
    Free;
  end;
  {$ENDIF}
end;

initialization

finalization
  if SuchDLL <> 0 then
  begin
    try
      FreeLibrary(SuchDLL);
    except
      MessageDlg(_('Fehler beim entladen der ArtikelSuche-DLL'),
      mtWarning, [mbOK], 0);
    end;
  end;
  
end.

