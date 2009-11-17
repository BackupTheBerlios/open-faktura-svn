{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Wiederkehrende Rechnungen u. Verträge u. deren Bearbeitung }
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
{ 16.08.2003 - Bugfix bei Zahlungsart Vorkasse }
{ 10.10.2003 - JvDBSpinEdit für Intervall entfernt, da diese den Wert in der DB }
{              nicht ändert, Komponente ist fehlerhaft !!! }
{ 09.11.2003 - Bug beim Editieren von Texten beseitigt }
{ 10.01.2004 - Brutto-Flag wurde beim Erstellen der Rechnungen nicht }
{              berücksichtigt }
{ 09.02.2004 - Vertrag deaktivieren (Button-Menüeintrag) eingebaut }
{ 14.03.2004 - Auswahl des Kundens über Kundennummer integriert }
{            - Auswahl des Ansprechpartners über Drop-Down-Liste implementiert }
{ 19.03.2004 - Zeitraum um "Wöchentlich" erweitert }
{ 07.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 20.05.2005 - Bei MwSt-freien Verträgen wird jetzt das Mwst-Frei-Flag korrekt in }
{              die Rechnung mit übernommen }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MakeVertragRech;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  JvSpeedButton, ExRxDBGrid{???}, JvExControls, JvComponent, JvArrowButton,
  StdCtrls, DBCtrls, VolDBEdit{???}, JvToolEdit, JvDBControls, JvExStdCtrls,
  JvDBCombobox, Mask, JvExMask, OFGroupBox, ComCtrls, ToolWin, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, JvExComCtrls, JvComCtrls,
  ExtCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

  //OF_Artikel1, OF_Kunde;
{
uses
  DBTables, JvDBComb,
  JvDBCtrl, Buttons,
  JvxCtrls,
  JvLookup,
  JvArrowBtn, ExDBGrid,
}

type
  TMakeVertragReForm = class(TForm)
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
    ReEdiTabREC_ID: TIntegerField;
    ReEdiTabADDR_ID: TIntegerField;
    ReEdiTabVVTNUM: TIntegerField;
    ReEdiTabVERTRETER_ID: TIntegerField;
    ReEdiTabGLOBRABATT: TFloatField;
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
    ReEdiTabSOLL_STAGE: TIntegerField;
    ReEdiTabSOLL_SKONTO: TFloatField;
    ReEdiTabSOLL_NTAGE: TIntegerField;
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
    PosTabJOURNAL_ID: TIntegerField;
    PosTabARTIKELTYP: TStringField;
    PosTabARTIKEL_ID: TIntegerField;
    PosTabADDR_ID: TIntegerField;
    PosTabVVTNUM: TIntegerField;
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
    DelBtn: TToolButton;
    UpBtn: TToolButton;
    DownBtn: TToolButton;
    DBNavigator3: TDBNavigator;
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
    PR_EbeneCB: TJvDBComboBox;
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
    AlgSumPanel: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    FertigSumPan: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    DBMemo1: TDBMemo;
    PosTabCALC_EK: TFloatField;
    InfoPanOut: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    PosInfoPan: TPanel;
    Label52: TLabel;
    Label54: TLabel;
    Label61: TLabel;
    BottomSpacePan: TPanel;
    PosTabCALC_RGEWINN: TFloatField;
    Spezial1: TMenuItem;
    MakeBelege: TMenuItem;
    ArtikelPopupMenu: TPopupMenu;
    freierArtikel1: TMenuItem;
    Text1: TMenuItem;
    Panel1: TPanel;
    NeuArtBtn1: TJvArrowButton;
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
    PosTabCALC_STEUERPORZ: TFloatField;
    N2: TMenuItem;
    UmschaltungBruttoNetto1: TMenuItem;
    ReAllgBottomPan: TPanel;
    InfoGB: TOFGroupBox;
    RechInfoMemo: TDBMemo;
    ReEdiTabDATUM_START: TDateField;
    ReEdiTabDATUM_ENDE: TDateField;
    ReEdiTabDATUM_NEXT: TDateField;
    ReEdiTabINTERVALL_NUM: TIntegerField;
    ReEdiTabAKTIV_FLAG: TBooleanField;
    ReEdiTabPRINT_FLAG: TBooleanField;
    ReEdiTabINTERVALL: TStringField;
    KFZGB: TOFGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    Label42: TLabel;
    Label60: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    JvDBDateEdit2: TJvDBDateEdit;
    JvDBDateEdit3: TJvDBDateEdit;
    VolgaDBEdit1: TVolgaDBEdit;
    JvDBSpinEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label62: TLabel;
    ReEdiTabCALC_DATUM_NEXT: TStringField;
    freienArtikelhinzufgen1: TMenuItem;
    Texthinzufgen1: TMenuItem;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Positionen1: TMenuItem;
    Fertigstellen1: TMenuItem;
    N5: TMenuItem;
    Aktualisieren1: TMenuItem;
    N6: TMenuItem;
    Speichernundaktivieren1: TMenuItem;
    Suchen1: TMenuItem;
    FertigTopKunPan: TPanel;
    PosTopKunPan: TPanel;
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
    SumPan: TPanel;
    Label14: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Label55: TLabel;
    Panel27: TPanel;
    DBText15: TDBText;
    Panel28: TPanel;
    DBText16: TDBText;
    Panel29: TPanel;
    DBText17: TDBText;
    Panel62: TPanel;
    DeaktivierenBtn: TToolButton;
    Vertragdeaktivieren1: TMenuItem;
    PosTabGPREIS: TFloatField;
    PosTabG_RGEWINN: TFloatField;
    PosTabE_RABATT_BETRAG: TFloatField;
    PosTabG_RABATT_BETRAG: TFloatField;
    PosTabEK_PREIS: TFloatField;
    PosTabCALC_FAKTOR: TFloatField;
    ReEdiTabNSUMME_0: TFloatField;
    ReEdiTabNSUMME_1: TFloatField;
    ReEdiTabNSUMME_2: TFloatField;
    ReEdiTabNSUMME_3: TFloatField;
    ReEdiTabBSUMME_0: TFloatField;
    ReEdiTabBSUMME_1: TFloatField;
    ReEdiTabBSUMME_2: TFloatField;
    ReEdiTabBSUMME_3: TFloatField;
    ReEdiTabCALC_NAME: TStringField;
    PosTabVPE: TLargeintField;
    
    
    procedure PosTabCalcFields(DataSet: TDataSet);
    procedure PosTabBeforePost(DataSet: TDataSet);
    procedure PosMatchButtonClick(Sender: TObject);
    procedure NeuArtBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
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
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
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
    procedure ReEdiBtnClick(Sender: TObject);
    procedure GotoPosBtnClick(Sender: TObject);
    procedure GotoFertigBtnClick(Sender: TObject);
    procedure KuNrEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure KuNrEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure PosGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure KuNrEditEnter(Sender: TObject);
    procedure KuNrEditExit(Sender: TObject);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure FormDeactivate(Sender: TObject);
    procedure PosGridApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure ReEdiListGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure UmschaltungBruttoNetto1Click(Sender: TObject);
    procedure PosDSDataChange(Sender: TObject; Field: TField);
    procedure MakeBelegeClick(Sender: TObject);
    procedure ReEdiTabAfterEdit(DataSet: TDataSet);
    procedure PosGridKeyPress(Sender: TObject; var Key: Char);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure DeaktivierenBtnClick(Sender: TObject);
  private
    { Private-Deklarationen}
    Loading     : Boolean;
    AppendOK    : Boolean;
    LastF9      : Boolean;
    QueryTime   : DWord;
    //UseKFZ       : Boolean;
    
    LastTS      : tTabSheet;
    LastEdiID   : Integer;
    LastPosID   : Integer;
    LastKunNum  : String;

    //InDataChange : Boolean;

    procedure OnAddArtikel (ID: Integer; Menge, EPreis, Rabatt: Double;
    AlternativArtnum: String = '');
    procedure UpdateLayout;
    procedure UpdateStatus;
    function  MakeRechnung (SRC_ID: Integer): Integer;  // Liefert Rec-ID zurück
    procedure FindDialog1Find(Sender: TObject);
    procedure SetAdresse (ID: Integer);
    procedure UpdateAnsprechpartner;
  public
    { Public-Deklarationen}
    First       : Boolean;

    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure F9Change (Ein: Boolean);
    procedure PruefeVertraege;

  end;

var
  MakeVertragReForm: TMakeVertragReForm;

implementation

uses
  GNUGetText,
  //ZSqlTypes, {JvDateUtil,}
  OF_DM, OF_Tool1, OF_Function, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_DBGrid_Layout, OF_Artikel1, OF_Kunde;

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
procedure TMakeVertragReForm.PruefeVertraege;
var 
  Anz: Integer;
  Txt: String;
  UniQuery: TZQuery;
begin
  UniQuery := TZQuery.Create(Self);
  try
    UniQuery.Connection := DM1.DB1;  //17.10.09-ud.
    UniQuery.sql.text :=
      'select count(*) as ANZ from VERTRAG ' +
      'where AKTIV_FLAG="Y" and DATUM_NEXT <=NOW()';
    UniQuery.Open;
    if (UniQuery.RecordCount > 0) and (UniQuery.FieldByName('ANZ').AsInteger > 0) then
    begin
      ANZ := UniQuery.FieldByName('ANZ').AsInteger;

      if Anz = 1 then
        txt := _('Ein Vertrag ist zur Berechnung fällig.' +
          #13#10 +
          'Möchen Sie jetzt zu den Verträgen wechseln ?')
      else
        txt := Format(_('%d Verträge sind zur Berechnung fällig.' +
          #13#10 +
          'Möchen Sie jetzt zu den Verträgen wechseln ?'),
          [Anz]);

      if MessageDlg(Txt, mtConfirmation, [mbYes, mbNo], 0) = mryes then
      begin
        MainForm.JumpTo(VK_WKRE_EDI, 0, 0, False);
      end;
    end;
    UniQuery.Close;
  finally
    UniQuery.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormCreate(Sender: TObject);
begin
  Scaled := True;
  //ScaleBy (Screen.Width,800);
  OnUpdateStatusBar      := nil;
  First := True;
  EdiListTS.TabVisible  := False;
  AdressTS.TabVisible   := False;
  PosTS.TabVisible      := False;
  Fertig.TabVisible     := False;
  AppendOK              := False;
  //InDataChange        := False;
  LastTS                := nil;
  LastEdiID             := -1;
  LastPosID             := -1;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormActivate(Sender: TObject);
var 
  i: Integer; Dummy: Boolean;
begin
  if First then
  begin
    First := False;

    PC1.ActivePage := EdiListTS;

    PR_EbeneCB.Items.Clear;
    PR_EbeneCB.Values.Clear;
    For i := 1 to DM1.AnzPreis do
    begin
      PR_EbeneCB.Items.Add ('VK' + Inttostr(i));
      PR_EbeneCB.Values.Add (Inttostr(i));
    end;

    dm1.GridLoadLayout (tDBGrid(ReEdiListGrid), 'VE_EDI_LISTE', 101);
    dm1.GridLoadLayout (tDBGrid(PosGrid), 'VE_EDI_POS');
    PosGrid.DefaultRowHeight  := DM1.ReadIntegerU('', 'VE_EDI_POS_ZH', PosGrid.DefaultRowHeight);
    PosGrid.LinesPerRow       := DM1.ReadIntegerU('', 'VE_EDI_POS_ZZ', PosGrid.LinesPerRow);

    PosTabMATCH_ARTNUM.DisplayLabel  := _('Suchbegriff') + #13#10 + _('Artikelnummer');

    PosGrid.RowColor1       := DM1.C2Color;
    ReEdiListGrid.RowColor1 := DM1.C2Color;
    PosGrid.EditColor       := DM1.EditColor;

    Loading := False;

    QueryTime := GetTickCount;

    ReEdiTabNSUMME.DisplayFormat     := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabMSUMME.DisplayFormat     := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabBSUMME.DisplayFormat     := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    PosTabCalc_RGewinn.DisplayFormat := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    PosTabCalc_EK.DisplayFormat      := ',#0.00 "' + DM1.LeitWaehrung + ' "';
  end;


  DM1.ArtInfoTab.Close;
  DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;

  PosTab.ParamByName ('ID').Value := -1;

  ReEdiTab.Close;
  ReEdiTab.Open;
  LastKunNum := ReEdiTabKUN_NUM.AsString;

  PosTab.Close;
  //PosTab.Open;

  QueryTime := GetTickCount - QueryTime;

  ReEdiTabAfterScroll (nil);

  ButtonPan.Visible      := ReEdiTab.RecordCount>0;
  ReEdiBtn.Enabled       := ReEdiTab.RecordCount>0;
  BelDelBtn.Enabled      := ReEdiTab.RecordCount>0;
  Del1Btn.Enabled        := ReEdiTab.RecordCount>0;
  Allgemein1.Enabled     := ReEdiTab.RecordCount>0;
  Positionen1.Enabled    := ReEdiTab.RecordCount>0;
  Fertigstellen1.Enabled := ReEdiTab.RecordCount>0;


  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);



  if LastEdiID <> -1 then
  begin
    ReEdiTab.Locate ('REC_ID', LastEdiID, []);
    //ReEdiTabAfterScroll(nil);
  end;

  PC1Changing(Sender, Dummy);
  if assigned(LastTS) then PC1.ActivePage := LastTS;

  ReEdiTab.EnableControls;

  PC1Change(Sender);

  if (PC1.ActivePage = EdiListTS) and (ReEdiListGrid.Visible) then 
    try 
      ReEdiListGrid.SetFocus; 
    except 
    end;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FormDeactivate(Sender: TObject);
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
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabCalcFields(DataSet: TDataSet);
var 
  Summe  : Double;
  Steuer : Double;
  PR     : Double;
  S      : String;
begin
  Summe := PosTabEPreis.Value * PosTabMenge.Value;
  if PosTabRabatt.Value <> 0 then 
    Summe := Summe - Summe * PosTabRabatt.Value / 100;

  summe := CAO_round(Summe * 100) / 100;

  Case PosTabSteuer_Code.Value of
    0: Steuer := ReEdiTabMwst_0.Value;
    1: Steuer := ReEdiTabMwst_1.Value;
    2: Steuer := ReEdiTabMwst_2.Value;
    3: Steuer := ReEdiTabMwst_3.Value;
    else Steuer := 0;
  end;

  PosTabCALC_STEUERPORZ.AsFloat := Steuer;

  if not ReEdiTabBrutto_Flag.AsBoolean then
  begin
    PosTabNSumme.Value := Summe;  // Auf ganze Pfennige Runden
    //PosTabMSumme.Value :=CAO_round(Summe * (Steuer / 100) *100)/100; // Auf ganze Pfennige Runden
    //PosTabBSumme.Value :=PosTabNSumme.Value+PosTabMSumme.Value;
  end else
  begin
    //PosTabBSumme.Value :=CAO_round(Summe*100)/100;  // Auf ganze Pfennige Runden
    //PosTabMSumme.Value :=CAO_round(Summe / (100 + Steuer) * Steuer * 100)/100; // Auf ganze Pfennige Runden
    PosTabNSumme.Value := Summe - CAO_round(Summe / (100 + Steuer) * Steuer * 100) / 100;
  end;


  if (ReEdiTabMWST_FREI_FLAG.AsBoolean = False) and (Steuer <> 0) then 
    PosTabMwst.Value := FormatFloat ('0.0"%"', Steuer)
  else 
    PosTabMwst.Value := '-';

  if PosTabArtikelTyp.Value = 'N' then
  begin
    PosTabMATCH_ARTNUM.Value := PosTabMATCHCODE.AsString + #13#10 +
    PosTabARTNUM.AsString;
  end else
  begin
    if PosTabARTIKELTYP.Value = 'F' then
    begin
      PosTabMATCH_ARTNUM.Value := _('freier Artikel') + #13#10 +
      PosTabMatchCode.Value + #13#10 +
      PosTabArtNum.Value;;
    end else 
      PosTabMATCH_ARTNUM.Value := '';
  end;

  if (PosTabArtikelTyp.Value <> 'F') and
     (PosTabArtikelTyp.Value <> 'T') and
     (PosTabArtikelTyp.Value <> '') and
     (PosTabArtikel_ID.Value > 0) and
     (not Loading) and
     (DM1.ArtInfoTab.Active) then
  begin
    if (DM1.ArtInfoTab.RecordCount > 0) and
       (DM1.ArtInfoTab.Locate ('REC_ID', PosTabArtikel_ID.Value, [])) then
    begin
      //ALT PosTabCalc_EK.Value :=ArtInfoTabEK_Preis.Value;
      if DM1.ArtInfoTabRABGRP_ID.AsString <> '-' then
      begin
        case DM1.AnzPreis of
          1: PR := DM1.ArtInfoTabVK1.Value;
          2: PR := DM1.ArtInfoTabVK2.Value;
          3: PR := DM1.ArtInfoTabVK3.Value;
          4: PR := DM1.ArtInfoTabVK4.Value;
          else PR := DM1.ArtInfoTabVK5.Value;
        end;
        DM1.CalcRabGrpPreis (DM1.ArtInfoTabRABGRP_ID.AsString, 0{EK}, PR);
        PosTabCalc_EK.Value := PR;
      end else 
        PosTabCalc_EK.Value := DM1.ArtInfoTabEK_Preis.Value;

      if (PosTabArtikelTyp.AsString = 'N') or (PosTabArtikelTyp.AsString = 'S') then
      begin
        S := _('Lager') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMenge_AKT.Value);
        if DM1.ArtInfoTabMENGE_BESTELLT.Value > 0 then 
          S := S + ' ' + _('Bestellt') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMENGE_BESTELLT.AsFloat);

        S := S + ' ' + _('Benötigt') + ' : ' + FormatFloat (',#0.00', DM1.ArtInfoTabMENGE_RESERVIERT.AsFloat);
      end else 
        S := '';

      PosTabCalc_Lagermenge_Str.Value := S;
      PosTabCalc_Lagermenge.Value := DM1.ArtInfoTabMenge_AKT.Value;
      PosTabCalc_RGewinn.Value := PosTabNSumme.Value - PosTabCalc_EK.Value * PosTabMenge.Value;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforePost(DataSet: TDataSet);
var 
  Summe: Double;
begin
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
    PosTabGPreis.Value      := 0;

    PosTabE_RGewinn.Value   := 0;
    PosTabG_RGewinn.Value   := 0;

    PosTabE_RABATT_BETRAG.Value := 0;
    PosTabG_RABATT_BETRAG.Value := 0;

    PosTabRabatt.Value      := 0;
    //PosTabSteuer_Proz.Value :=0;
    PosTabSteuer_Code.Value := 0;
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
      //PosTabE_RGewinn.Value :=cao_round ((PR - PosTabEK_Preis.AsFloat)*100)/100;

      PosTabG_RGEWINN.Value := cao_round ((PosTabNSumme.Value - PosTabEK_Preis.Value * PosTabMenge.Value) * 100) / 100;
      PosTabE_RGewinn.Value := cao_round (PosTabG_RGEWINN.Value / PosTabMenge.Value * 100) / 100;

      Summe := PosTabEPreis.Value * PosTabMenge.Value;
      if PosTabRabatt.Value <> 0 then 
        Summe := Summe - Summe * PosTabRabatt.Value / 100;

      PosTabGPREIS.Value := Summe;

      PosTabG_RABATT_BETRAG.Value := cao_round((PosTabEPreis.Value * PosTabMenge.Value - Summe) * 100) / 100;
      PosTabE_RABATT_BETRAG.Value := cao_round(PosTabG_RABATT_BETRAG.Value / PosTabMenge.Value * 100) / 100;

    end;
  end;

  // Provision berechnen
  {
  if PosTabPROVIS_PROZ.AsFloat <> 0 then
  begin
  PosTabPROVIS_WERT.AsFloat :=CAO_round (PosTabNSumme.AsFloat / 100 *
  PosTabPROVIS_PROZ.AsFloat * 100) / 100;
  end else PosTabPROVIS_WERT.AsFloat :=0;
  }
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.OnAddArtikel (ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
var 
  PR: Double; 
  Error: Boolean;
begin
  Error := False;

  //wird vom Artikelstamm aufgerufen
  DM1.ArtInfoTab.Close;
  DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW1;
  DM1.ArtInfoTab.ParamByName ('AID').AsInteger := ID;
  DM1.ArtInfoTab.Open;

  if (
     // Entweder Kundenpreis
     (DM1.ArtInfoTab.Locate ('REC_ID;PREIS_TYP;ADRESS_ID', VarArrayOF([ID, 3, ReEdiTabAddr_ID.AsInteger]), [])) or
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
      PosTabAddr_ID.Value         := ReEdiTabADDR_ID.Value;
      PosTabVVTNUM.Value          := ReEdiTabVVTNUM.Value;

      PosTabArtikel_ID.Value      := DM1.ArtInfoTabREC_ID.Value;
      PosTabArtikelTyp.Value      := DM1.ArtInfoTabArtikelTyp.Value;

      PosTabArtNum.Value          := DM1.ArtInfoTabArtnum.Value;
      PosTabMatchCode.Value       := DM1.ArtInfoTabMatchCode.Value;
      PosTabBarCode.Value         := DM1.ArtInfoTabBarCode.Value;

      PosTabBezeichnung.AsString  := DM1.ArtInfoTabLangName.AsString;
      PosTabLaenge.Value          := DM1.ArtInfoTabLaenge.Value;
      PosTabGroesse.Value         := DM1.ArtInfoTabGroesse.Value;
      PosTabDimension.Value       := DM1.ArtInfoTabDimension.Value;
      PosTabGewicht.Value         := DM1.ArtInfoTabGewicht.Value;
      PosTabME_Einheit.Value      := DM1.ArtInfoTabME_Einheit.Value;
      PosTabPR_Einheit.Value      := DM1.ArtInfoTabPR_Einheit.Value;

      PosTabRabatt.Value          := ReEdiTabGlobRabatt.Value;
      PosTabSteuer_Code.Value     := DM1.ArtInfoTabSteuer_Code.Value;
      PosTabAltteil_Flag.Value    := DM1.ArtInfoTabAltTeil_Flag.Value;
      PosTabALTTEIL_PROZ.Value    := 0.1; // 10%
      PosTabALTTEIL_STCODE.Value  := DM1.ArtInfoTabSteuer_Code.Value;
      PosTabBEZ_FEST_Flag.Value   := DM1.ArtInfoTabNO_BEZEDIT_Flag.Value;
      PosTabGEGENKTO.Value        := DM1.ArtInfoTabErloes_Kto.Value;

      {
      if not DM1.ArtInfoTabNO_PROVISION_FLAG.AsBoolean then
      begin
      if DM1.ArtInfoTabPROVIS_PROZ.AsFloat <> 0
      then PosTabPROVIS_PROZ.AsFloat :=DM1.ArtInfoTabPROVIS_PROZ.AsFloat
      else PosTabPROVIS_PROZ.AsFloat :=DM1.GetVertreterProv (ReEdiTabVERTRETER_ID.AsInteger);
      end;
      }

      PosTabMenge.Value           := CAO_round(Menge * 100) / 100;

      if DM1.GetArtikelPreis (DM1.ArtInfoTabREC_ID.AsInteger,
           ReEdiTabADDR_ID.AsInteger,
           ReEdiTabPR_Ebene.Value,
           ReEdiTabBRUTTO_FLAG.AsBoolean,
           PosTabMenge.AsFloat,
           PR) then 
        PosTabEPreis.Value := PR;

      PosTab.Post;
    except
      PosTab.Cancel;
      Error := True;
    end;
    Loading := False;
    AppendOK := False;

    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.Open;

    PosTab.Refresh;
  end else
  if (DM1.ArtInfoTabRec_ID.AsInteger = ID) and (DM1.ArtInfoTabNo_VK_Flag.Value = True) then
  begin
    MessageBeep(0);
    MessageDlg (_('Dieser Artikel hat eine Verkaufssperre' + #13#10 +
      'und kann deshalb nicht verwendet werden !'), mterror, [mbok], 0);

    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.Open;
  end else
  begin
    // Hier Fehler, Artikel nicht gefunden !!!
    DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.SQL.Text := ArtInfoSqlS + ArtInfoSqlW2;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    DM1.ArtInfoTab.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosMatchButtonClick(Sender: TObject);
begin
  if not assigned(MainForm.ArtForm) then
  begin
    MainForm.ArtForm := TArtikelForm.Create (Self{Application});
    MainForm.ArtForm.BorderStyle    := bsSizeable;
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

  MainForm.ArtForm.F9Change (MainForm.F9);
  MainForm.ArtForm.OnAddArtikel := OnAddArtikel;
  MainForm.ArtForm.ShowModal;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DelBtnClick(Sender: TObject);
begin
  PC1Change(Sender);
  PosTab.Delete;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
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
procedure TMakeVertragReForm.DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then 
    PC1.ActivePage := AdressTS;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
  BelDelBtn.Enabled := ReEdiTab.RecordCount > 0;
  Del1Btn.Enabled := ReEdiTab.RecordCount > 0;

  //Ansprechpartner in Drop-Down-Liste laden
  //nur Ausführen wenn ein Belegwechsel stattgefunden hat
  if (PC1.ActivePage <> EdiListTS) and
     (PosTab.ParamByName('ID').Value<>ReEdiTabREC_ID.Value) then
  begin
    UpdateAnsprechpartner;
  end;

  UpdateStatus;
end;                    

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DBGrid1DblClick(Sender: TObject);
var 
  Dummy: Boolean;
begin
  if ReEdiTab.RecordCount = 0 then 
    exit;

  PC1Changing (Sender, Dummy);

  if ReEdiTabAddr_ID.Value < 0 then 
    PC1.ActivePage := AdressTS
  else 
    PC1.ActivePage := PosTS;

  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
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
procedure TMakeVertragReForm.PosTabBeforeEdit(DataSet: TDataSet);
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
procedure TMakeVertragReForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  PosTab.Close;
  ReEdiTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
var 
  Dummy: Boolean;
begin
  ReEdiTabGegenKonto.Value   := -1;
  ReEdiTabADDR_ID.Value      := -1;
  ReEdiTabPR_Ebene.Value     := DM1.AnzPreis;
  ReEdiTabKOST_NETTO.Value   := 0;
  ReEdiTabWERT_NETTO.Value   := 0;
  ReEdiTabLOHN.Value         := 0;
  ReEdiTabWARE.Value         := 0;
  ReEdiTabTKOST.Value        := 0;
  ReEdiTabNSUMME.Value       := 0;
  ReEdiTabMSUMME.Value       := 0;
  ReEdiTabBSUMME.Value       := 0;
  ReEdiTabATMSUMME.Value     := 0;
  ReEdiTabWaehrung.Value     := DM1.LeitWaehrung;
  ReEdiTabVertreter_ID.Value := -1;
  ReEdiTabGlobRabatt.Value   := 0;
  ReEdiTabLiefart.Value      := -1;
  ReEdiTabZahlArt.Value      := -1;

  ReEdiTabErstellt.Value     := now;
  ReEdiTabERST_NAME.Value    := DM1.View_User;

  ReEdiTabMWST_0.Value       := DM1.MWSTTab[0];
  ReEdiTabMWST_1.Value       := DM1.MWSTTab[1];
  ReEdiTabMWST_2.Value       := DM1.MWSTTab[2];
  ReEdiTabMWST_3.Value       := DM1.MWSTTab[3];

  ReEdiTabDATUM_START.Value  := Now;
  ReEdiTabDATUM_ENDE.Value   := EncodeDate (2099, 12, 31);
  ReEdiTabDATUM_NEXT.Value   := Now + 1;
  ReEdiTabAKTIV_FLAG.Value   := False;
  ReEdiTabPRINT_FLAG.Value   := False;

  LastKunNum                 := '';

  if (ReEdiTab.State in [dsEdit, dsInsert]) then
  begin
    try
      ReEdiTab.Post;
    except
      ReEdiTab.Cancel;
    end;
  end;

  //PC1.ActivePage :=AdressTS;
  //PC1Changing (Self,Dummy);
end;   

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabNewRecord(DataSet: TDataSet);
begin
  PosTabJournal_ID.Value  := ReEdiTabRec_ID.Value;
  PosTabAddr_ID.Value     := ReEdiTabAddr_ID.Value;
  PosTabVVTNUM.Value      := ReEdiTabVVTNUM.Value;
  PosTabRabatt.Value      := ReEdiTabGlobRabatt.Value;
  PosTabPosition.Value    := PosTab.RecordCount + 1;
  PosTabE_RGewinn.Value   := 0;
  PosTabBrutto_Flag.Value := ReEdiTabBRUTTO_FLAG.Value;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterScroll(DataSet: TDataSet);
begin
  PosTabMenge.ReadOnly := PosTabArtikelTyp.AsString = 'T';
  PosTabEPreis.ReadOnly := PosTabArtikelTyp.AsString = 'T';
  PosTabBezeichnung.ReadOnly := PosTabBEZ_FEST_FLAG.AsBoolean;

  if (assigned(POsGrid.DBMemo)) and
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

  if PosTab.ControlsDisabled then 
    exit;
  UpdateLayout;

  UpdateStatus;
  DelBtn.Enabled := PosTab.RecordCount > 0;
  Positionlschen1.Enabled := PosTab.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpBtnClick(Sender: TObject);
var 
  CurrPos, Pos: Integer;
begin
  PC1Change(Sender);
  UpBtn.Enabled := False;
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
    UpBtn.Enabled := True;
  end;
  PosTabAfterScroll(nil);
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DownBtnClick(Sender: TObject);
var 
  CurrPos, Pos: Integer;
begin
  PC1Change(Sender);
  PosTab.DisableControls;
  DownBtn.Enabled := False;
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
    DownBtn.Enabled := True;
  end;
  PosTabAfterScroll(nil);
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpdateLayout;
begin
  UpBtn.Enabled := PosTab.RecNo>1;
  DownBtn.Enabled := PosTab.RecNo<PosTab.RecordCount;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuArtBtnClick(Sender: TObject);
begin
  PC1Change(Sender);
  PosMatchButtonClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuFrArtBtnClick(Sender: TObject);
var 
  i: integer;
begin
  PC1Change(Sender);

  AppendOK := True;
  try
    Loading := True;

    PosTab.Append;

    PosTabArtikelTyp.Value      := 'F';
    PosTabArtikel_ID.Value      := - 99;
    //PosTabArtNum.Value     :='fr. Artikel';
    PosTabMatchCode.Value       := PosTabArtNum.Value;
    PosTabBarCode.Value         := '';
    PosTabLaenge.Value          := '';
    PosTabGroesse.Value         := '';
    PosTabDimension.Value       := '';
    PosTabGewicht.Value         := 0;
    PosTabME_Einheit.Value      := _('Stück');
    PosTabPR_Einheit.Value      := 1;
    PosTabMenge.Value           := 1;
    PosTabEPreis.Value          := 0;
    PosTabGPreis.Value          := 0;
    PosTabRabatt.Value          := 0;
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
    AppendOK := False;
  end;
  Loading := False;

  PosGrid.SetFocus;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.NeuKomBtnClick(Sender: TObject);
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
    //PosTabArtNum.Value     :='fr. Text';
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
    PosTabGPreis.Value          := 0;
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
    AppendOK := False;
  end;
  Loading := False;

  PosGrid.SetFocus;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.SetAdresse (ID: Integer);
begin
  DM1.ReKunTab.Close;
  DM1.ReKunTab.ParamByName('ID').AsInteger := ID;
  DM1.ReKunTab.Open;

  if DM1.ReKunTab.RecordCount = 1 then
  begin
    if (DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean) and
       (ReEdiTabBRUTTO_FLAG.Value) then 
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
    ReEdiTabKUN_ANREDE.Value := DM1.ReKunTab.FieldByName('Anrede').AsString;
    ReEdiTabKUN_NAME1.Value := DM1.ReKunTab.FieldByName('Name1').AsString;
    ReEdiTabKUN_NAME2.Value := DM1.ReKunTab.FieldByName('Name2').AsString;
    ReEdiTabKUN_NAME3.Value := DM1.ReKunTab.FieldByName('Name3').AsString;
    ReEdiTabKUN_ABTEILUNG.Value := DM1.ReKunTab.FieldByName('Abteilung').AsString;
    ReEdiTabKUN_STRASSE.Value := DM1.ReKunTab.FieldByName('Strasse').AsString;
    ReEdiTabKUN_LAND.Value := DM1.ReKunTab.FieldByName('Land').AsString;
    ReEdiTabKUN_PLZ.Value := DM1.ReKunTab.FieldByName('PLZ').AsString;
    ReEdiTabKUN_ORT.Value := DM1.ReKunTab.FieldByName('Ort').AsString;

    ReEdiTabGEGENKONTO.Value := DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger;
    ReEdiTabLiefart.Value := DM1.ReKunTab.FieldByName('Kun_Liefart').AsInteger;
    ReEdiTabZahlart.Value := DM1.ReKunTab.FieldByName('Kun_Zahlart').AsInteger;
    ReEdiTabKUN_NUM.Value := DM1.ReKunTab.FieldByName('Kunnum1').AsString;
    ReEdiTabWAEHRUNG.Value := DM1.ReKunTab.FieldByName('Waehrung').AsString;

    ReEdiTabVERTRETER_ID.Value := DM1.ReKunTab.FieldByName('VERTRETER_ID').AsInteger;
    ReEdiTabGLOBRABATT.Value := DM1.ReKunTab.FieldByName('GRabatt').AsFloat;

    ReEdiTabMWST_FREI_FLAG.Value := DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean;

    if ReEdiTabMWST_FREI_FLAG.Value then 
      ReEdiTabBRUTTO_FLAG.Value := False
    else 
      ReEdiTabBRUTTO_FLAG.Value := DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean;

    ReEdiTab.Post;

    LastKunNum := ReEdiTabKUN_NUM.AsString;

    UpdateAnsprechpartner;

    // in Rechnungspositionen neue Adress_ID setzen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Clear;
    DM1.UniQuery.SQL.Add ('UPDATE JOURNALPOS SET ADDR_ID = ' + Inttostr(ReEdiTabADDR_ID.AsInteger));
    DM1.UniQuery.SQL.Add ('WHERE JOURNAL_ID=' + Inttostr(ReEdiTabRec_ID.AsInteger));
    DM1.UniQuery.ExecSql;
    DM1.UniQuery.Close;

    PosTabAfterPost(nil);

    if PosTab.Active then 
      PosTab.Refresh;
  end;

  DM1.ReKunTab.Close;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditButtonClick(Sender: TObject);
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
    //ShowModal;
    if Uebern then
    begin // Adresse in Rechnung überbnehmen
      SetAdresse (KSQueryRec_ID.AsInteger);
      Uebern := False;
      FormDeactivate (Sender);
    end else
    begin  // Übern. abgebrochen
      ReEdiTabKUN_NUM.AsString := LastKunNum;
    end;

    {
    ShowModal;
    if Uebern then
    begin // Adresse in Rechnung überbnehmen
    if not (ReEdiTab.State in [dsEdit,dsInsert]) then ReEdiTab.Edit;
    
    ReEdiTabADDR_ID.Value           :=KSQueryRec_ID.Value;
    
    if (KSQueryPR_EBENE.Value>0)and
    (KSQueryPR_EBENE.Value<=DM1.AnzPreis)
    then  ReEdiTabPR_EBENE.Value          :=KSQueryPR_EBENE.Value;
    
    ReEdiTabSOLL_STAGE.Value        :=KSQueryNET_Tage.Value;
    ReEdiTabSOLL_SKONTO.Value       :=KSQueryNet_Skonto.Value;
    ReEdiTabSOLL_NTAGE.Value        :=KSQueryBRT_Tage.Value;
    ReEdiTabSOLL_RATEN.Value        :=1;
    ReEdiTabSOLL_RATBETR.Value      :=0;
    ReEdiTabSOLL_RATINTERVALL.Value :=1;
    ReEdiTabKUN_ANREDE.Value        :=KSQueryAnrede.Value;
    ReEdiTabKUN_NAME1.Value         :=KSQueryName1.Value;
    ReEdiTabKUN_NAME2.Value         :=KSQueryName2.Value;
    ReEdiTabKUN_NAME3.Value         :=KSQueryName3.Value;
    ReEdiTabKUN_ABTEILUNG.Value     :=KSQueryAbteilung.Value;
    ReEdiTabKUN_STRASSE.Value       :=KSQueryStrasse.Value;
    ReEdiTabKUN_LAND.Value          :=KSQueryLand.Value;
    ReEdiTabKUN_PLZ.Value           :=KSQueryPLZ.Value;
    ReEdiTabKUN_ORT.Value           :=KSQueryOrt.Value;
    
    ReEdiTabGEGENKONTO.Value        :=KSQueryDEB_NUM.Value;
    ReEdiTabLiefart.Value           :=KSQueryKun_Liefart.Value;
    ReEdiTabZahlart.Value           :=KSQueryKun_Zahlart.Value;
    ReEdiTabKUN_NUM.Value           :=KSQueryKunnum1.AsString;
    ReEdiTabWAEHRUNG.Value          :=KSQueryWaehrung.Value;
    
    ReEdiTabVERTRETER_ID.Value      :=-1;
    ReEdiTabGLOBRABATT.Value        :=KSQueryGRabatt.Value;
    
    ReEdiTabMWST_FREI_FLAG.Value    :=KSQueryMWST_FREI_Flag.Value;
    ReEdiTabBRUTTO_FLAG.Value       :=KSQueryBrutto_FLAG.Value;
    
    ReEdiTab.Post;
    
    Uebern := False;
    FormDeactivate (Sender);
    
    // in Rechnungspositionen neue Adress_ID setzen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Clear;
    DM1.UniQuery.Sql.Add ('UPDATE JOURNALPOS SET ADDR_ID = '+
    Inttostr(ReEdiTabADDR_ID.AsInteger));
    DM1.UniQuery.Sql.Add ('WHERE JOURNAL_ID='+
    Inttostr(ReEdiTabRec_ID.AsInteger));
    DM1.UniQuery.ExecSql;
    DM1.UniQuery.Close;
    
    PosTabAfterPost(nil);
    
    if PosTab.Active then PosTab.Refresh;
    
    end;  }

  end; // with
end;   

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterPost(DataSet: TDataSet);
var 
  ID: Integer;
  N, n0, n1, n2, n3,
  M, m0, m1, m2, m3,
  B, b0, b1, b2, b3,
  P, RGW, Lohn, Ware, TKst: Double;
  T: Char;
begin
  if PosTab.ControlsDisabled then 
    exit;

  DM1.UpdateArtikelEdiMenge (VK_RECH_EDI, PosTabArtikel_ID.AsInteger, 0);

  ID := PosTabRec_ID.Value;
  PosTab.DisableControls;

  N := 0; N0 := 0; N1 := 0; N2 := 0; N3 := 0;
  M := 0; M0 := 0; M1 := 0; M2 := 0; M3 := 0;
  B := 0; B0 := 0; B1 := 0; B2 := 0; B3 := 0;
  P := 0; RGW := 0; Lohn := 0; Ware := 0; TKst := 0;
  try
    PosTab.First;
    while not PosTab.Eof do
    begin
      //P :=P+PosTabPROVIS_WERT.Value;

      RGW     := RGW + PosTabG_RGEWINN.AsFloat;

      //Gewicht :=Gewicht+(PosTabGewicht.AsFloat*PosTabMenge.AsFloat);

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
        M1 := CAO_round(B1 / (100 + ReEdiTabMwSt_1.AsFloat) * ReEdiTabMwSt_1.AsFloat * 100) / 100;
        M2 := CAO_round(B2 / (100 + ReEdiTabMwSt_2.AsFloat) * ReEdiTabMwSt_2.AsFloat * 100) / 100;
        M3 := CAO_round(B3 / (100 + ReEdiTabMwSt_3.AsFloat) * ReEdiTabMwSt_3.AsFloat * 100) / 100;

        N0 := B0 - M0;
        N1 := B1 - M1;
        N2 := B2 - M2;
        N3 := B3 - M3;

        M := M0 + M1 + M2 + M3;

        N := B - M;
      end else
      begin
        // Nettofakturierung
        M1 := CAO_round(N1 * ReEdiTabMwSt_1.AsFloat) / 100;
        M2 := CAO_round(N2 * ReEdiTabMwSt_2.AsFloat) / 100;
        M3 := CAO_round(N3 * ReEdiTabMwSt_3.AsFloat) / 100;

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
      B := CAO_Round (B * 100 / DM1.BR_SUM_RUND_WERT) * DM1.BR_SUM_RUND_WERT / 100;

    RGW := cao_round(rgw * 100) / 100;
    //Gewicht :=cao_round(gewicht*1000)/1000;
    //P :=cao_round(p*100)/100;

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
       //(ReEdiTabPROVIS_WERT.Value <> P)or
       (ReEdiTabWare.Value        <> Ware) or
       (ReEdiTabLohn.Value        <> Lohn) or
       (ReEdiTabTKost.Value       <> TKst) then
       //(ReEdiTabROHGEWINN.Value   <> RGW)or
       //(ReEdiTabGewicht.Value     <> Gewicht)then
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

        //ReEdiTabPROVIS_WERT.Value :=P;
        //ReEdiTabRDATUM.Value      :=now;
        ReEdiTabWare.Value        := Ware;
        ReEdiTabLohn.Value        := Lohn;
        ReEdiTabTKost.Value       := TKst;
        //ReEdiTabROHGEWINN.Value   :=RGW;
        //ReEdiTabGewicht.Value     :=Gewicht;

        ReEdiTab.Post;
      except
        ReEdiTab.Cancel;
      end;
    end;
    PosTab.EnableControls;
  end;
  DelBtn.Enabled := PosTab.RecordCount > 0;
  Positionlschen1.Enabled := PosTab.RecordCount > 0;
end;                                              

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PC1Changing(Sender: TObject;
var 
  AllowChange: Boolean);
begin
  QueryTime := GetTickCount;
  if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
  begin
    if DM1.ArtInfoTab.Active then 
      DM1.ArtInfoTab.Close;
    DM1.ArtInfoTab.ParamByName ('JID').AsInteger := ReEdiTabREC_ID.Value;
    //DM1.ArtInfoTab.ParamByName ('AID').AsInteger :=-1;
    DM1.ArtInfoTab.Open;

    if PosTab.Active then 
      PosTab.Close;
    PosTab.ParamByName ('ID').Value := ReEdiTabREC_ID.Value;
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
  end;

  QueryTime := GetTickCount - QueryTime;
  UpdateStatus;
  //mainform.SB1.Panels[1].Text :=FormatFloat ('0.00',(GetTickCount-LastTime)/1000)+' Sek.';

  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
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
  if (Uppercase(Field.FieldName) = 'POSITION') or
     (Uppercase(Field.FieldName) = 'ARTIKELTYP') or
     (Uppercase(Field.FieldName) = 'MATCH_ARTNUM') then 
    AllowEdit := False;
end;                                             

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
  if ReEdiTabVVTNUM.Value < 1 then 
    ReEdiTabVVTNUM.Value := DM1.IncNummer (VK_WKRE_EDI);

  if (ReEdiTabADDR_ID.Value >= 0) and
     (
     (ReEdiTabKUN_NUM.AsString = '') or
     (ReEdiTabKUN_NUM.AsString = '0')
     ) then
  begin
    DM1.ReKunTab.Close;
    DM1.ReKunTab.ParamByName('ID').AsInteger := ReEdiTabADDR_ID.Value;
    DM1.ReKunTab.Open;
    if DM1.ReKunTab.RecordCount = 1 then
    begin
      if length(DM1.ReKunTab.FieldByName('KUNNUM1').AsString) = 0 then
      begin
        DM1.ReKunTab.Edit;
        try
          DM1.ReKunTab.FieldByName('KUNNUM1').AsString := DM1.IncNummerStr (KUNNUM_KEY);
          DM1.ReKunTab.FieldByName('DEB_NUM').AsInteger := DM1.IncNummer (DEB_NUM_KEY);
          //DM1.ReKunTab.FieldByName('KUNNUM1').AsInteger+DEBI_KTOBASIS;

          // Bitcodiertes Flag für "ist Kunde" setzen
          DM1.ReKunTab.FieldByName('STATUS').AsInteger :=
          DM1.ReKunTab.FieldByName('STATUS').AsInteger or 1;

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
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
  if ReEdiTabDATUM_NEXT.AsDateTime < ReEdiTabDATUM_ENDE.AsDateTime then 
    ReEdiTabCALC_DATUM_NEXT.AsString :=
      FormatDateTime (_('dd.mm.yyyy'), ReEdiTabDATUM_NEXT.AsDateTime)
  else 
    ReEdiTabCALC_DATUM_NEXT.AsString := '---';

  ReEdiTabCalc_Name.AsString := Trim(ReEdiTabKUN_Anrede.AsString + ' ' +
  ReEdiTabKUN_NAME1.AsString + ' ' +
  ReEdiTabKUN_NAME2.AsString + ' ' +
  ReEdiTabKUN_NAME3.AsString);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(ReEdiListGrid), 'VE_EDI_LISTE', 101);
  dm1.GridSaveLayout (tDBGrid(PosGrid), 'VE_EDI_POS');
  DM1.WriteIntegerU('', 'VE_EDI_POS_ZH', PosGrid.DefaultRowHeight);
  DM1.WriteIntegerU('', 'VE_EDI_POS_ZZ', PosGrid.LinesPerRow);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
begin
  // evt. vorhandene Positionen löschen
  if PosTab.Active then 
    PosTab.Close;
  PosTab.ParamByName ('ID').Value := ReEdiTabREC_ID.Value;
  PosTab.Open;
  while not PosTab.EOF do
  begin
    PosTab.Delete;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.SichtbareSpalten1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid))
  else
  if PC1.ActivePage = PosTS then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(PosGrid));
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.BuchenBtnClick(Sender: TObject);
//var num : integer;
begin
  if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
    ReEdiTab.Edit;
  ReEdiTabAKTIV_FLAG.AsBoolean := True;
  ReEdiTab.Post;

  LastTS    := EdiListTS;
  LastEdiID := -1;
  FormActivate(Sender);
  MainForm.FormActivate (Self);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.DeaktivierenBtnClick(Sender: TObject);
begin
  if ReEdiTab.RecordCount = 0 then 
    exit;

  if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
    ReEdiTab.Edit;
  ReEdiTabAKTIV_FLAG.AsBoolean := False;
  ReEdiTab.Post;

  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.New1BtnClick(Sender: TObject);
begin
  ReEdiTab.DisableControls;
  ReEdiTab.Append;
  LastEdiID := ReEdiTabRec_ID.Value;
  LastTS := AdressTS;
  FormActivate(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Del1BtnClick(Sender: TObject);
begin
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
procedure TMakeVertragReForm.GotoAllgBtnClick(Sender: TObject);
begin
  PC1.ActivePage := AdressTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
  PC1.ActivePage := EdiListTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiBtnClick(Sender: TObject);
begin
  DBGrid1DblClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoPosBtnClick(Sender: TObject);
begin
  PC1.ActivePage := PosTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.GotoFertigBtnClick(Sender: TObject);
begin
  PC1.ActivePage := Fertig;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TMakeVertragReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if uppercase(tControl(Sender).Name) = 'RECHINFOMEMO' then 
      KuNrEdit.SetFocus
    else 
      SendMessage (MainForm.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PC1Change(Sender: TObject);
var 
  Prob   : Boolean;
  S      : String;
  Dummy  : Boolean;
  I      : Integer;
begin
  if (assigned(POsGrid.DBMemo)) and
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

  if PosTab.ParamByName ('ID').Value <> ReEdiTabRec_ID.Value then
  begin
    PC1Changing (Sender, Dummy);
  end;

  Adressezuweisen1.Enabled := PC1.ActivePage = AdressTS;

  Positionlschen1.Enabled := (PosTab.RecordCount > 0) and (PC1.ActivePage = PosTS);

  Storno1.Enabled := (ReEdiTab.RecordCount > 0) and 
    ((PC1.ActivePage = AdressTS) or (PC1.ActivePage = EdiListTS));

  SichtbareSpalten1.Enabled := (PC1.ActivePage = EdiListTS) or (PC1.ActivePage = PosTS);

  Aktualisieren1.Enabled := (PC1.ActivePage = EdiListTS) or (PC1.ActivePage = PosTS);

  Kopieren1.Enabled := (PC1.ActivePage = EdiListTS) and (ReEdiTab.RecordCount > 0);

  Artikelhinzufgen1.Enabled := PC1.ActivePage = PosTS;
  freienArtikelhinzufgen1.Enabled := Artikelhinzufgen1.Enabled;
  Texthinzufgen1.Enabled := Artikelhinzufgen1.Enabled;

  AuswahlBtn.Font.Style := [];
  AllgemeinBtn.Font.Style := [];
  PositionenBtn.Font.Style := [];
  FertigBtn.Font.Style := [];

  Speichernundaktivieren1.Enabled := False;

  Vertragdeaktivieren1.Enabled := (ReEdiTab.RecordCount > 0) and (ReEdiTabAKTIV_FLAG.AsBoolean = True);

  Suchen1.Enabled := (PC1.ActivePage = EdiListTS);

  if PC1.ActivePage = Fertig then
  begin
    KunDatGB2.Parent := FertigTopKunPan;
    SumPan.Parent    := FertigSumPan;

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
    BuchenBtn.Enabled := (not Prob) and (ReEdiTabAKTIV_FLAG.AsBoolean = False);
    BuchenBtn.Visible := (ReEdiTabAKTIV_FLAG.AsBoolean = False);
    Speichernundaktivieren1.Enabled := (not Prob) and (ReEdiTabAKTIV_FLAG.AsBoolean = False);

    DeaktivierenBtn.Visible := (ReEdiTab.RecordCount > 0) and (ReEdiTabAKTIV_FLAG.AsBoolean = True);
  end else
  if PC1.ActivePage = EdiListTS then
  begin
    AuswahlBtn.Font.Style := [fsBold];
    Auswahl1.Checked := True;
  end else
  if PC1.ActivePage = AdressTS then
  begin
    SumPan.Parent    := AlgSumPanel;
    AllgemeinBtn.Font.Style := [fsBold];
    Allgemein1.Checked := True;
  end else
  if PC1.ActivePage = PosTS then
  begin
    SumPan.Parent    := PosSumPan;
    KunDatGB2.Parent := PosTopKunPan;

    PositionenBtn.Font.Style := [fsBold];
    Positionen1.Checked := True;

    if PosGrid.Columns.Count > 0 then
    begin
      for i := 0 to PosGrid.Columns.Count-1 do
      begin
        {
        if (ReEdiTabBRUTTO_FLAG.AsBoolean)and
        (uppercase(PosGrid.Columns[i].FieldName)='NSUMME') then
        begin
        PosGrid.Columns[i].FieldName:='BSUMME';
              
        end
        else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean)and
        (uppercase(PosGrid.Columns[i].FieldName)='BSUMME') then
        begin
        PosGrid.Columns[i].FieldName:='NSUMME';
        end; }

        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
                PosTabEPREIS.DisplayLabel := _('E-Preis') + #13#10 + _('Brutto');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
          PosTabEPREIS.DisplayLabel := _('E-Preis');
        end;
        
        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis') + #13#10 + _('Brutto');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis');
        end;
      end;
      PosGrid.Invalidate;
    end;
  end;
  UmschaltungBruttoNetto1.Enabled := PC1.ActivePage = PosTS;
  MakeBelege.Enabled := PC1.ActivePage = EdiListTS;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_INSERT then
  begin
    key := 0;
    PosMatchButtonClick(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor; //$009FFF9;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.KuNrEditExit(Sender: TObject);
begin
  if (not ReEdiTabKUN_NUM.IsNull) and (TEdit(Sender).Name = 'KuNrEdit') and
     (LastKunNum<>ReEdiTabKUN_NUM.AsString) and (not ReEdiTab.ControlsDisabled) then
  begin
    DM1.UniQuery.close;
    DM1.UniQuery.sql.text :=
      'select REC_ID, KUNNUM1 from ADRESSEN' +
      ' where KUNNUM1="' + sqlStringToSQL(ReEdiTabKUN_NUM.AsString) + '"';
    DM1.UniQuery.open;

    if DM1.UniQuery.recordcount = 1 then
    begin
      SetAdresse(DM1.UniQuery.FieldByName('Rec_ID').AsInteger);
      TDBEdit(Sender).Color := clWindow;
    end else
    begin
      try
        KuNrEdit.SetFocus;
      except
      end;
      KuNrEditButtonClick (Sender);
    end;

    DM1.UniQuery.close;

    if LastKunNum <> ReEdiTabKUN_NUM.AsString then
      KuNrEditExit(Sender);

  end else
    TDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
  if not AppendOK then
  begin
    MessageBeep(0);
    Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabAfterDelete(DataSet: TDataSet);
var 
  bm: tBookmark;
  p : Integer;
begin
  if PosTab.ControlsDisabled then // Beleg wird gelöscht,
    exit; 
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
procedure TMakeVertragReForm.PosGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (assigned(Field)) and (uppercase(field.FieldName) = 'MENGE') and
     ((PosTabArtikelTyp.AsString = 'N') or (PosTabArtikelTyp.AsString = 'S')) then
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
    if (PosTabMenge.Value <> 0) and (PosTabCalc_EK.Value <> 0) and
       (PosTabNSumme.Value / PosTabMenge.Value < PosTabCalc_EK.Value) then 
      Canvas.Font.Color := clRed;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.F9Change (Ein: Boolean);
begin
  LastF9 := Ein;
  InfoPanOut.Visible := LastF9;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    SuchZeit  := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');
    Datensatz := _('Beleg') + ' ' + inttostr (ReEdiTab.RecNo) +
      ' ' + _('von') + ' ' + inttostr (ReEdiTab.RecordCount);
    Erstellt  := 'le.Änderung:'; //+
      //formatdatetime ('dd.mm.yyyy',ReEdiTabRDATUM.Value);

      {       if (ReEdiTab.RecordCount>0)and
      (not ReEdiTabWV_DATUM.IsNull)and
      (ReEdiTabWV_DATUM.AsDateTime>0)
      then Geaendert :='Termin : '+
      FormatDateTime ('dd.mm.yyy',ReEdiTabWV_Datum.AsDateTime)
      else} 
    Geaendert :='';

    if (PosTab.Active) and (PC1.ActivePage = PosTS) then 
      Sortierung := _('Position') + ' : ' + inttostr (PosTab.RecNo) +
        ' ' + _('von') + ' ' + inttostr (PosTab.RecordCount)
    else 
      Sortierung := '-';

    OnUpdateStatusBar (SuchZeit, DatenSatz, Sortierung, Erstellt, Geaendert);
  end;

  if ReEdiTabBrutto_Flag.AsBoolean then 
    ReEdiTopLab.Caption := '  ' + _('Vertrag bearbeiten ...') + ' ' + _('(BRUTTO)')
  else 
    ReEdiTopLab.Caption := '  ' + _('Vertrag bearbeiten ...');
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiListGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (ReEdiTabDATUM_NEXT.AsDateTime > 0) and
     (ReEdiTabDATUM_NEXT.AsDateTime <= Int(Now)) then
  begin
    Canvas.Font.Color := clRed;
    Canvas.Font.Style := [fsBold]
  end;
end;                                

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                               

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosTabBeforeDelete(DataSet: TDataSet);
begin
  // Reservierte Menge im Artikel aktualisieren
  DM1.UpdateArtikelEdiMenge (VK_WKRE_EDI, PosTabArtikel_ID.AsInteger, PosTabMenge.AsFloat);
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.UmschaltungBruttoNetto1Click(Sender: TObject);
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
        if PosTabSTEUER_CODE.AsInteger > 0 then
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
            PosTabEPREIS.Value := CAO_round( (PosTabEPREIS.Value +
                                              PosTabEPREIS.Value / 100 *
                                              MwSt) * 100) / 100
          else 
            PosTabEPREIS.Value := CAO_round( PosTabEPREIS.Value /
                                             (100 + MwSt) * 100 * 100) / 100;
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
      ReEdiTopLab.Caption := '  ' + _('Vertrag bearbeiten ...') + ' ' + _('(BRUTTO)')
    else 
      ReEdiTopLab.Caption := '  ' + _('Vertrag bearbeiten ...');

    PC1Change(Sender);
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosDSDataChange(Sender: TObject; Field: TField);
begin
  {
  if (not Loading) and
  (not InDataChange) and
  (PosTab.State in [dsEdit, dsInsert])and
  (assigned(Field))and
  (
  (Field.FieldName='MENGE') or
  (Field.FieldName='EPREIS') or
  (Field.FieldName='RABATT')
  ) then
  begin
  InDataChange :=True;
  try
  PosTab.Post;
  finally
  InDataChange := False;
  end;
  end;
  }
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.ReEdiTabAfterEdit(DataSet: TDataSet);
begin
  ReEdiTabAKTIV_FLAG.AsBoolean := False;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.MakeBelegeClick(Sender: TObject);
var 
  ANZ: Integer; 
  MO, JO, J, T, I: Word; 
  Z: String; 
  N: tDateTime;
begin
  Screen.Cursor := crSqlWait;
  try
    ANZ := 0;

    ReEdiTab.DisableControls;
    PosTab.DisableControls;

    DM1.UniQuery2.Close;
    DM1.UniQuery2.Sql.Text :=
      'SELECT REC_ID, DATUM_NEXT, INTERVALL, ' +
      'INTERVALL_NUM from VERTRAG where ' +
      'DATUM_NEXT <= NOW() and AKTIV_FLAG="Y" ' +
      'and DATUM_NEXT<DATUM_ENDE';
    DM1.UniQuery2.ReadOnly := False;
    DM1.UniQuery2.Open;
    while not DM1.UniQuery2.eof do
    begin
      MakeRechnung(DM1.UniQuery2.FieldByName('REC_ID').AsInteger);

      DecodeDate(DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime, JO, MO, T);
      Z := DM1.UniQuery2.FieldByName ('INTERVALL').AsString;
      I := DM1.UniQuery2.FieldByName ('INTERVALL_NUM').AsInteger;

      if Z[1] in ['Q', 'H', 'J', 'M'] then
      begin
        case Z[1] of
          'Q': I := I * 3; // Quartal
          'H': I := I * 6; // Halbjahr
          'J': I := I * 12; // Jahr
        end;

        for J := 1 to I do
        begin
          inc(MO);
          if MO > 12 then
          begin
            MO := 1; inc (JO);
          end;
        end;

        if T > dateDaysPerMonth(Jo, Mo) then
          T := dateDaysPerMonth(Jo, Mo);

        N := EncodeDate (Jo, Mo, T);
      end else
      if Z[1] = 'W' then
      begin
        N := DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime + 7 {1.Woche} * I;
      end;

      DM1.UniQuery2.Edit;
      DM1.UniQuery2.FieldByName ('DATUM_NEXT').AsDateTime := N;
      DM1.UniQuery2.Post;

      inc(ANZ);
      DM1.UniQuery2.Next;
    end;
    DM1.UniQuery2.Close;
    DM1.UniQuery2.ReadOnly := True;
  finally
    ReEdiTab.EnableControls;
    PosTab.EnableControls;
    ReEdiTab.Sql.Text := 'select * FROM VERTRAG order by VVTNUM';
    ReEdiTab.Open;
    Screen.Cursor := crDefault;
  end;
end;

//------------------------------------------------------------------------------
//                            MAKE RECHNUNG                Liefert Rec-ID zurück
//------------------------------------------------------------------------------
function TMakeVertragReForm.MakeRechnung(SRC_ID: Integer): Integer;
var
  id, i   : Integer;
  BelegNr: String;
  Dest   : Integer;
  w      : String;
  ZVON, ZBIS: tDateTime;
  ZeitStr   : String;
  Z, S       : String;
  J, M, T     : Word;
  K         : Word;
const 
  PH: String = '%ZEITRAUM%';
begin
  Result := -1;

  Dest := VK_RECH_EDI;

  ReEdiTab.Close;
  ReEdiTab.Sql.Text := 'select * FROM VERTRAG where REC_ID=' + IntToStr(SRC_ID);
  ReEdiTab.Open;
  if ReEdiTab.RecordCount<>1 then
  begin
    ReEdiTab.Close;
    ReEdiTab.Sql.Text := 'select * FROM VERTRAG order by VVTNUM';
    exit;
  end;

  // Zeitraum berechnen
  DecodeDate (ReEdiTabDATUM_NEXT.AsDateTime, J, M, T);

  if (ReEdiTabINTERVALL.AsString = 'M') and (ReEdiTabINTERVALL_NUM.AsInteger = 1) then
  begin
    ZeitStr := LongMonthNames[m] + ' ' + IntToStr(J);
  end else
  begin
    Z := ReEdiTabINTERVALL.AsString;
    I := ReEdiTabINTERVALL_NUM.AsInteger;

    if Z[1] in ['Q', 'H', 'J', 'M'] then
    begin
      case Z[1] of
        'Q': I := I * 3;
        'H': I := I * 6;
        'J': I := I * 12;
      end;

      ZVon := EncodeDate (J, M, 1);

      for K := 1 to I do
      begin
        inc(M); 
        if M > 12 then
        begin
          M := 1; inc (J);
        end;
      end;

      ZBis := EncodeDate (J, M, 1)-1;
    end else
    if Z[1] = 'W' then
    begin
      ZVon := FirstDayOfWeek (ReEdiTabDATUM_NEXT.AsDateTime);
      ZBis := LastDayOfWeek  (ReEdiTabDATUM_NEXT.AsDateTime);
    end;
    ZeitStr := FormatDateTime ('dd.mm.yyyy', ZVon) + ' bis ' +
      FormatDateTime ('dd.mm.yyyy', ZBis);
  end;

  BelegNr := DM1.IncNummerStr (Dest);
  DM1.CpyDstKopfTab.Open;
  DM1.CpyDstKopfTab.Append;

  W := DM1.LeitWaehrung;

  DM1.CpyDstKopfTabQUELLE.Value        := Dest;
  //DM1.CpyDstKopfTabJAHR.Value          :=0;
  DM1.CpyDstKopfTabQUELLE_SUB.Value    := 0;

  DM1.CpyDstKopfTabATRNUM.Value        := -1;
  DM1.CpyDstKopfTabLief_Addr_ID.Value  := -1;

  DM1.CpyDstKopfTabVRENUM.Value        := BelegNr;
  DM1.CpyDstKopfTabVLSNUM.Value        := '';
  DM1.CpyDstKopfTabFOLGENR.Value       := -1;
  DM1.CpyDstKopfTabKM_STAND.Value      := -1;
  DM1.CpyDstKopfTabADATUM.Value        := 0;
  DM1.CpyDstKopfTabRDATUM.Value        := Now;
  DM1.CpyDstKopfTabLDATUM.Value        := 0;
  DM1.CpyDstKopfTabTermin.Value        := 0;
  DM1.CpyDstKopfTabKOST_NETTO.Value    := DM1.Calcleitwaehrung(ReEdiTabKOST_NETTO.AsFloat, w);
  DM1.CpyDstKopfTabWERT_NETTO.Value    := DM1.CalcLeitWaehrung(ReEdiTabWERT_NETTO.AsFloat, W);
  DM1.CpyDstKopfTabLOHN.Value          := DM1.CalcLeitWaehrung(ReEdiTabLOHN.AsFloat, W);
  DM1.CpyDstKopfTabWARE.Value          := DM1.CalcLeitWaehrung(ReEdiTabWARE.AsFloat, W);
  DM1.CpyDstKopfTabTKOST.Value         := DM1.CalcLeitWaehrung(ReEdiTabTKOST.AsFloat, W);

  DM1.CpyDstKopfTabADDR_ID.Value       := ReEdiTabADDR_ID.Value;
  DM1.CpyDstKopfTabKFZ_ID.Value        := -1;
  DM1.CpyDstKopfTabVERTRETER_ID.Value  := ReEdiTabVERTRETER_ID.Value;
  DM1.CpyDstKopfTabGLOBRABATT.Value    := ReEdiTabGLOBRABATT.Value;

  DM1.CpyDstKopfTabPR_EBENE.Value      := ReEdiTabPR_EBENE.Value;
  DM1.CpyDstKopfTabLIEFART.Value       := ReEdiTabLIEFART.Value;
  DM1.CpyDstKopfTabZAHLART.Value       := ReEdiTabZAHLART.Value;

  DM1.CpyDstKopfTabMWST_0.Value        := ReEdiTabMWST_0.Value;
  DM1.CpyDstKopfTabMWST_1.Value        := ReEdiTabMWST_1.Value;
  DM1.CpyDstKopfTabMWST_2.Value        := ReEdiTabMWST_2.Value;
  DM1.CpyDstKopfTabMWST_3.Value        := ReEdiTabMWST_3.Value;

  DM1.CpyDstKopfTabNSUMME.Value        := DM1.CalcLeitWaehrung(ReEdiTabNSUMME.AsFloat, W);
  DM1.CpyDstKopfTabMSUMME_0.Value      := DM1.CalcLeitWaehrung(ReEdiTabMSUMME_0.AsFloat, W);
  DM1.CpyDstKopfTabMSUMME_1.Value      := DM1.CalcLeitWaehrung(ReEdiTabMSUMME_1.AsFloat, W);
  DM1.CpyDstKopfTabMSUMME_2.Value      := DM1.CalcLeitWaehrung(ReEdiTabMSUMME_2.AsFloat, W);
  DM1.CpyDstKopfTabMSUMME_3.Value      := DM1.CalcLeitWaehrung(ReEdiTabMSUMME_3.AsFloat, W);
  DM1.CpyDstKopfTabMSUMME.Value        := DM1.CalcLeitWaehrung(ReEdiTabMSUMME.AsFloat, W);
  DM1.CpyDstKopfTabBSUMME.Value        := DM1.CalcLeitWaehrung(ReEdiTabBSUMME.AsFloat, W);
  DM1.CpyDstKopfTabATSUMME.Value       := DM1.CalcLeitWaehrung(ReEdiTabATSUMME.AsFloat, W);
  DM1.CpyDstKopfTabATMSUMME.Value      := DM1.CalcLeitWaehrung(ReEdiTabATMSUMME.AsFloat, W);

  DM1.CpyDstKopfTabWAEHRUNG.Value      := W;
  DM1.CpyDstKopfTabGEGENKONTO.Value    := ReEdiTabGEGENKONTO.Value;
  DM1.CpyDstKopfTabSOLL_STAGE.Value    := ReEdiTabSOLL_STAGE.Value;
  DM1.CpyDstKopfTabSOLL_SKONTO.Value   := ReEdiTabSOLL_SKONTO.Value;
  DM1.CpyDstKopfTabSOLL_NTAGE.Value    := ReEdiTabSOLL_NTAGE.Value;
  DM1.CpyDstKopfTabSOLL_RATEN.Value    := ReEdiTabSOLL_RATEN.Value;

  DM1.CpyDstKopfTabSOLL_RATBETR.Value  := DM1.CalcLeitWaehrung(ReEdiTabSOLL_RATBETR.AsFloat, W);

  DM1.CpyDstKopfTabSOLL_RATINTERVALL.Value := ReEdiTabSOLL_RATINTERVALL.Value;

  DM1.CpyDstKopfTabIST_ANZAHLUNG.Value     := 0;
  DM1.CpyDstKopfTabIST_ZAHLDAT.Value       := 0;
  DM1.CpyDstKopfTabMAHNKOSTEN.Value        := 0;
  DM1.CpyDstKopfTabKONTOAUSZUG.Value       := -1;
  DM1.CpyDstKopfTabBANK_ID.Value           := -1;
  DM1.CpyDstKopfTabSTADIUM.Value           := 6;
  DM1.CpyDstKopfTabFREIGABE1_Flag.Value    := False;
  DM1.CpyDstKopfTabERSTELLT.Value          := Now;
  DM1.CpyDstKopfTabERST_NAME.Value         := DM1.View_User;
  DM1.CpyDstKopfTabKUN_NUM.Value           := ReEdiTabKUN_NUM.Value;
  DM1.CpyDstKopfTabKUN_ANREDE.Value        := ReEdiTabKUN_ANREDE.Value;
  DM1.CpyDstKopfTabKUN_NAME1.Value         := ReEdiTabKUN_NAME1.Value;
  DM1.CpyDstKopfTabKUN_NAME2.Value         := ReEdiTabKUN_NAME2.Value;
  DM1.CpyDstKopfTabKUN_NAME3.Value         := ReEdiTabKUN_NAME3.Value;
  DM1.CpyDstKopfTabKUN_ABTEILUNG.Value     := ReEdiTabKUN_ABTEILUNG.Value;
  DM1.CpyDstKopfTabKUN_STRASSE.Value       := ReEdiTabKUN_STRASSE.Value;
  DM1.CpyDstKopfTabKUN_LAND.Value          := ReEdiTabKUN_LAND.Value;
  DM1.CpyDstKopfTabKUN_PLZ.Value           := ReEdiTabKUN_PLZ.Value;
  DM1.CpyDstKopfTabKUN_ORT.Value           := ReEdiTabKUN_ORT.Value;
  DM1.CpyDstKopfTabUSR1.Value              := ReEdiTabUSR1.Value;
  DM1.CpyDstKopfTabUSR2.Value              := ReEdiTabUSR2.Value;
  DM1.CpyDstKopfTabPROJEKT.Value           := ReEdiTabPROJEKT.Value;
  DM1.CpyDstKopfTabORGNUM.Value            := ReEdiTabORGNUM.Value;
  DM1.CpyDstKopfTabBEST_NAME.Value         := ReEdiTabBEST_NAME.Value;
  DM1.CpyDstKopfTabBEST_CODE.Value         := ReEdiTabBEST_CODE.Value;
  DM1.CpyDstKopfTabINFO.AsString           := ReEdiTabINFO.AsString;
  DM1.CpyDstKopfTabBEST_DATUM.Value        := ReEdiTabBEST_DATUM.Value;
  DM1.CpyDstKopfTabUW_NUM.Value            := -1;
  DM1.CpyDstKopfTabBRUTTO_FLAG.Value       := ReEdiTabBRUTTO_FLAG.Value;
  DM1.CpyDstKopfTabMWST_FREI_FLAG.Value    := ReEdiTabMWST_FREI_FLAG.Value;

  DM1.CpyDstKopfTab.Post;

  ID := DM1.CpyDstKopfTabREC_ID.Value;

  PosTab.Close;
  PosTab.ParamByName ('ID').AsInteger := ReEdiTabRec_ID.AsInteger;;
  PosTab.Open;

  DM1.CpyDstPosTab.Open;

  while not PosTab.Eof do
  begin
    DM1.CpyDstPosTab.Append;

    for i := 0 to PosTab.Fields.Count-1 do
    begin
      if (uppercase(PosTab.Fields[i].FieldName) <> 'REC_ID') and
         (uppercase(PosTab.Fields[i].FieldName) <> 'VVTNUM') and
         (PosTab.Fields[i].FieldKind = fkData) then
      begin   
        DM1.CpyDstPosTab.FieldByName (PosTab.Fields[i].FieldName).Value := PosTab.Fields[i].Value;
      end;
    end;
    DM1.CpyDstPosTab.FieldByName('VRENUM').Value     := BelegNr;
    DM1.CpyDstPosTab.FieldByName('QUELLE').Value     := Dest;
    DM1.CpyDstPosTab.FieldByName('QUELLE_SUB').Value := 0;
    DM1.CpyDstPosTab.FieldByName('JOURNAL_ID').Value := ID;
    DM1.CpyDstPosTab.FieldByName('GEBUCHT').Value    := False;
    DM1.CpyDstPosTab.FieldByName('EPREIS').Value     := DM1.CalcLeitwaehrung(PosTab.FieldByName('EPREIS').AsFloat, W);
    DM1.CpyDstPosTab.FieldByName('E_RGEWINN').Value  := DM1.CalcLeitwaehrung(PosTab.FieldByName('E_RGEWINN').AsFloat, W);


    S := DM1.CpyDstPosTab.FieldByName('BEZEICHNUNG').AsString;
    if Pos (PH, S) > 0 then
    begin
      K := Pos (PH, S);
      Delete (S, K, length(PH));
      Insert (ZeitStr, S, K);
      DM1.CpyDstPosTab.FieldByName('BEZEICHNUNG').AsString := S;
    end;

    DM1.CpyDstPosTab.Post;

    // EDI-Mengen aktualisieren
    DM1.UpdateArtikelEdiMenge(Dest, DM1.CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger, 0);

    PosTab.Next;
  end;

  PosTab.Close;
  DM1.CpyDstPosTab.Close;
  DM1.CpyDstKopfTab.Close;
  ReEdiTab.Close;

  Result := ID;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (PosTab.State in [dsEdit, dsInsert]) then 
    PosTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Aktualisieren1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then
  begin
    ReEdiTab.Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.Suchen1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TMakeVertragReForm.FindDialog1Find(Sender: TObject);
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
procedure TMakeVertragReForm.UpdateAnsprechpartner;
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

end.

