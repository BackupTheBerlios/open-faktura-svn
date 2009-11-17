{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zur Einkauf-Erstellung u. Bearbeitung                      }
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
{ 09.05.2003 - Unit zum GNU-Source hinzugefügt }
{ 18.05.2003 - Anpassungen an neue DB }
{ 31.05.2003 - neuen Code zur Aktualisierung des Artikelfeldes MENGE_EKRE_EDI }
{              hinzugefügt }
{ 03.07.2003 - Bug in der Überprüfung der Anzahl der Seriennummern beseitigt }
{ 16.08.2003 - Bugfix bei Zahlungsart Vorkasse }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 05.08.2005 - Lieferantenpreise werden jetzt übernommen }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MakeEKRech;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  JvSpeedButton, JvExControls, JvComponent, JvArrowButton, ExRxDBGrid{???},
  JvExExtCtrls, JvSplit, JvToolEdit, JvDBControls, DBCtrls, StdCtrls, Mask,
  JvExMask, OFGroupBox, ComCtrls, ToolWin, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, OFDBGrid, JvExComCtrls, JvComCtrls, ExtCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

  //OF_ARTIKEL1, OF_Kunde,
{
uses
  DBTables, JvDBComb,
  JvDBCtrl,
  JvxCtrls, DBCGrids,
  JvArrowBtn,
}

type
  TMakeEKReForm = class(TForm)
    PosDS: TDataSource;
    EdiListTS: TTabSheet;
    RePanel: TPanel;
    PC1: TJvPageControl;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    ReEdiDS: TDataSource;
    ArtikelTab: TZQuery;
    ReEdiTab: TOFZQuery;
    PosTab: TZQuery;
    ArtikelTabREC_ID: TIntegerField;
    ArtikelTabARTNUM: TStringField;
    ArtikelTabERSATZ_ARTNUM: TStringField;
    ArtikelTabMATCHCODE: TStringField;
    ArtikelTabWARENGRUPPE: TIntegerField;
    ArtikelTabBARCODE: TStringField;
    ArtikelTabARTIKELTYP: TStringField;
    ArtikelTabKAS_NAME: TStringField;
    ArtikelTabME_EINHEIT: TStringField;
    ArtikelTabPR_EINHEIT: TFloatField;
    ArtikelTabLAENGE: TStringField;
    ArtikelTabGROESSE: TStringField;
    ArtikelTabDIMENSION: TStringField;
    ArtikelTabGEWICHT: TFloatField;
    ArtikelTabEK_PREIS: TFloatField;
    ArtikelTabVK1: TFloatField;
    ArtikelTabVK2: TFloatField;
    ArtikelTabVK3: TFloatField;
    ArtikelTabVK4: TFloatField;
    ArtikelTabVK5: TFloatField;
    ArtikelTabSTEUER_CODE: TIntegerField;
    ArtikelTabMENGE_AKT: TFloatField;
    ArtikelTabERLOES_KTO: TIntegerField;
    ArtikelTabAUFW_KTO: TIntegerField;
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
    ReEdiTabTermin: TDateField;
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
    PosTabVRENUM: TStringField;
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
    PosTabGPREIS: TFloatField;
    PosTabE_RGEWINN: TFloatField;
    PosTabG_RGEWINN: TFloatField;
    PosTabE_RABATT_BETRAG: TFloatField;
    PosTabG_RABATT_BETRAG: TFloatField;
    PosTabRABATT: TFloatField;
    PosTabSTEUER_CODE: TIntegerField;
    PosTabGEGENKTO: TIntegerField;
    PosTabNSumme: TCurrencyField;
    ReEdiTabLIEFART: TIntegerField;
    ReEdiTabZAHLART: TIntegerField;
    PosTabBEZEICHNUNG: TMemoField;
    PosTabMwSt: TStringField;
    PosTabALTTEIL_PROZ: TFloatField;
    ReEdiListGrid: TOFDBGrid;
    PosTabMATCH_ARTNUM: TStringField;
    ArtikelTabKURZNAME: TStringField;
    ArtikelTabLANGNAME: TBlobField;
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
    KunDatGB2: TOFGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    DBText2: TDBText;
    Panel5: TPanel;
    DBText3: TDBText;
    Panel6: TPanel;
    DBText8: TDBText;
    Panel12: TPanel;
    DBText9: TDBText;
    KunDatGB4: TOFGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel20: TPanel;
    DBText18: TDBText;
    Panel21: TPanel;
    DBText19: TDBText;
    Panel22: TPanel;
    DBText20: TDBText;
    Panel23: TPanel;
    DBText21: TDBText;
    Panel24: TPanel;
    DBText22: TDBText;
    Panel26: TPanel;
    DBText24: TDBText;
    ToolBar2: TToolBar;
    KopfNav2: TDBNavigator;
    New1Btn: TToolButton;
    Del1Btn: TToolButton;
    ToolBar3: TToolBar;
    DBNavigator1: TDBNavigator;
    NewBelBtn: TToolButton;
    BelDelBtn: TToolButton;
    GotoAuswahlBtn: TToolButton;
    GotoPosBtn: TToolButton;
    ReEdiBtn: TToolButton;
    ToolBar5: TToolBar;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    Positionlschen1: TMenuItem;
    Adressezuweisen1: TMenuItem;
    N2: TMenuItem;
    AlgPan2: TPanel;
    InfoGB: TOFGroupBox;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    Kopieren1: TMenuItem;
    ZuweisungenGB: TOFGroupBox;
    Label27: TLabel;
    Label38: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ZahlartDB: TDBLookupComboBox;
    WaehrungCB: TDBLookupComboBox;
    waehrung: TDBEdit;
    Zahlart: TDBEdit;
    SK_Skonto_Tage: TDBEdit;
    SK_Skonto_Proz: TDBEdit;
    SK_Netto_Tage: TDBEdit;
    Label15: TLabel;
    RE_Datum: TJvDBDateEdit;
    Label32: TLabel;
    Org_num: TDBEdit;
    USR1: TDBEdit;
    USR2: TDBEdit;
    Label23: TLabel;
    RechInfoMemo: TDBMemo;
    Panel3: TPanel;
    CaoGroupBox1: TOFGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    BuchenBtn: TToolButton;
    DBEdit9: TDBEdit;
    ReEdiTabZahlart_Str: TStringField;
    ReEdiTabWaehrung_Str: TStringField;
    CaoGroupBox2: TOFGroupBox;
    CaoGroupBox4: TOFGroupBox;
    ProblemLab: TLabel;
    neuenBelegerstellen1: TMenuItem;
    N3: TMenuItem;
    ArtikelHinzufgen1: TMenuItem;
    TopPan: TPanel;
    ReEdiTopLab: TLabel;
    ButtonPan: TPanel;
    AuswahlBtn: TJvSpeedButton;
    AllgemeinBtn: TJvSpeedButton;
    PositionenBtn: TJvSpeedButton;
    FertigBtn: TJvSpeedButton;
    Panel7: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Panel19: TPanel;
    DBText15: TDBText;
    Panel27: TPanel;
    DBText16: TDBText;
    Panel28: TPanel;
    DBText17: TDBText;
    CaoGroupBox3: TOFGroupBox;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Panel33: TPanel;
    DBText27: TDBText;
    Panel34: TPanel;
    DBText28: TDBText;
    Panel35: TPanel;
    DBText29: TDBText;
    Label30: TLabel;
    Label34: TLabel;
    DBMemo1: TDBMemo;
    ArtikelTabRABGRP_ID: TStringField;
    SNTab: TZQuery;
    SNDS: TDataSource;
    ArtikelPopupMenu: TPopupMenu;
    freierArtikel1: TMenuItem;
    Text1: TMenuItem;
    SNTabARTIKEL_ID: TIntegerField;
    SNTabSERNUMMER: TStringField;
    CenterPan: TPanel;
    OffBestGB: TOFGroupBox;
    OffBestGrid: TOFDBGrid;
    OffBestTab: TZQuery;
    OffBestDS: TDataSource;
    ToolBar1: TToolBar;
    GotoAllgBtn: TToolButton;
    ToolButton3: TToolButton;
    Panel36: TPanel;
    NeuArtBtn1: TJvArrowButton;
    EditSNBtn: TToolButton;
    DelBtn: TToolButton;
    UpBtn: TToolButton;
    DownBtn: TToolButton;
    DBNavigator3: TDBNavigator;
    ToolButton2: TToolButton;
    GotoFertigBtn: TToolButton;
    Panel1: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    SumPan: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label33: TLabel;
    bsumpan: TPanel;
    DBText10: TDBText;
    msumpan: TPanel;
    DBText25: TDBText;
    nsumpan: TPanel;
    DBText26: TDBText;
    OffBestSplitter: TJvxSplitter;
    PosiGB: TOFGroupBox;
    PosGrid: TExRxDBGrid;
    PosTabQUELLE_SRC: TIntegerField;
    PosTabSN_FLAG: TBooleanField;
    ArtikelTabALTTEIL_FLAG: TBooleanField;
    ArtikelTabNO_RABATT_FLAG: TBooleanField;
    ArtikelTabNO_BEZEDIT_FLAG: TBooleanField;
    ArtikelTabNO_EK_FLAG: TBooleanField;
    ArtikelTabSN_FLAG: TBooleanField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabMWST_FREI_FLAG: TBooleanField;
    PosTabBRUTTO_FLAG: TBooleanField;
    freienArtikelhinzufgen1: TMenuItem;
    Texthinzufgen1: TMenuItem;
    OffBestTabVRENUM: TStringField;
    OffBestTabRDATUM: TDateField;
    OffBestTabLDATUM: TDateField;
    OffBestTabMENGE_EK: TFloatField;
    OffBestTabMENGE_OFFEN: TFloatField;
    OffBestTabMENGE_BEST: TFloatField;
    OffBestTabPOSREC_ID: TIntegerField;
    OffBestTabMATCHCODE: TStringField;
    OffBestTabARTNUM: TStringField;
    OffBestTabARTIKEL_ID: TIntegerField;
    OffBestTabEPREIS: TFloatField;
    OffBestTabRABATT: TFloatField;
    OffBestTabRABATT2: TFloatField;
    OffBestTabRABATT3: TFloatField;
    OffBestTabBEZEICHNUNG: TMemoField;
    Auswahl1: TMenuItem;
    Allgemein1: TMenuItem;
    Positionen1: TMenuItem;
    Fertigstellen1: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    N5: TMenuItem;
    SpeichernundBuchen1: TMenuItem;
    Panel13: TPanel;
    DBText11: TDBText;
    Panel25: TPanel;
    DBText12: TDBText;
    Label1: TLabel;
    Label4: TLabel;
    N6: TMenuItem;
    Suchen1: TMenuItem;
    ReEdiTabNSUMME_0: TFloatField;
    ReEdiTabNSUMME_1: TFloatField;
    ReEdiTabNSUMME_2: TFloatField;
    ReEdiTabNSUMME_3: TFloatField;
    ReEdiTabBSUMME_0: TFloatField;
    ReEdiTabBSUMME_1: TFloatField;
    ReEdiTabBSUMME_2: TFloatField;
    ReEdiTabBSUMME_3: TFloatField;
    SNTabSNUM_ID: TIntegerField;
    Extras1: TMenuItem;
    UmschaltungBruttoNetto1: TMenuItem;
    ReEdiTabSOLL_STAGE: TLargeintField;
    ReEdiTabSOLL_NTAGE: TLargeintField;
        
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
    procedure AddTextBtnClick(Sender: TObject);
    procedure NeuFrArtBtnClick(Sender: TObject);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure PosTabAfterPost(DataSet: TDataSet);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PosGridShowEditor(Sender: TObject; Field: TField;
    var AllowEdit: Boolean);
    procedure ReEdiListGridGetCellParams(Sender: TObject; Field: TField;
    AFont: TFont; var Background: TColor; Highlight: Boolean);
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
    procedure Kopieren1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure PosGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure RechInfoMemoEnter(Sender: TObject);
    procedure RechInfoMemoExit(Sender: TObject);
    procedure PosTabAfterDelete(DataSet: TDataSet);
    procedure PosTabBeforeInsert(DataSet: TDataSet);
    procedure EditSNBtnClick(Sender: TObject);
    procedure PosTabBeforeDelete(DataSet: TDataSet);
    procedure OffBestGridDblClick(Sender: TObject);
    procedure OffBestTabAfterOpen(DataSet: TDataSet);
    procedure ReEdiDSDataChange(Sender: TObject; Field: TField);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure PosGridKeyPress(Sender: TObject; var Key: Char);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure UmschaltungBruttoNetto1Click(Sender: TObject);
  private
    { Private-Deklarationen}
    AppendOK    : Boolean;
    InBuchung   : Boolean;
    
    LastTS      : tTabSheet;
    LastEdiID   : Integer;
    LastPosID   : Integer;
    
    QueryTime   : DWord;
    
    procedure OnAddArtikel (ID: Integer; Menge, EPreis, Rabatt: Double;
    AlternativArtnum: String = '');
    procedure UpdateLayout;
    procedure UpdateStatus;
    procedure FindDialog1Find(Sender: TObject);
  public
    { Public-Deklarationen}
    First    : Boolean;
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure SetAdresse (ID: Integer);
  end;
    
var
  MakeEKReForm: TMakeEKReForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Main, OF_Tool1, OF_Progress, OF_DBGrid_Layout,
  OF_MakeEKRech_FertigDlg, OF_SN_Erfassen,
  OF_ARTIKEL1, OF_Kunde;

{$R *.DFM}

procedure TMakeEKReForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  Scaled := True;
  //ScaleBy (Screen.Width,800);
  First                 := True;
  InBuchung             := False;
  EdiListTS.TabVisible  := False;
  AdressTS.TabVisible   := False;
  PosTS.TabVisible      := False;
  Fertig.TabVisible     := False;
  AppendOK              := False;
  LastTS                := nil;
  LastEdiID             := -1;
  LastPosID             := -1;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormActivate(Sender: TObject);
var 
  Dummy: Boolean;
begin
  QueryTime := GetTickCount;
  if first then
  begin
    first := False;

    PC1.ActivePage := EdiListTS;

    dm1.GridLoadLayout (tDBGrid(ReEdiListGrid), 'EDI_LISTE_EKRE', 102);
    dm1.GridLoadLayout (tDBGrid(PosGrid), 'EDI_POS_EKRE', 102);

    PosTabMATCH_ARTNUM.DisplayLabel  := _('Suchbegriff') + #13#10 + _('Artikelnummer');

    PosGrid.RowColor1       := DM1.C2Color;
    OffBestGrid.RowColor1   := DM1.C2Color;
    ReEdiListGrid.RowColor1 := DM1.C2Color;

    OffBestGrid.EditColor   := DM1.EditColor;
    PosGrid.EditColor       := DM1.EditColor;

    ReEdiTabNSUMME.DisplayFormat := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabMSUMME.DisplayFormat := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    ReEdiTabBSUMME.DisplayFormat := ',#0.00 "' + DM1.LeitWaehrung + ' "';

    PosTabEPREIS.DisplayFormat   := DM1.EK_DFormat + ' "' + DM1.LeitWaehrung + ' "';
    PosTabEPREIS.EditFormat      := DM1.EK_EFormat;

    PosTabGPREIS.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + ' "';
    PosTabNSumme.DisplayFormat   := ',#0.00 "' + DM1.LeitWaehrung + ' "';
  end;

  PosTab.ParamByName ('ID').Value := -1;
  ReEdiTab.Close;
  ReEdiTab.ParamByName ('QUELLE').Value := EK_RECH_EDI;
  ReEdiTab.Open;
  PosTab.Open;

  ReEdiTabAfterScroll (nil);

  ButtonPan.Visible       := ReEdiTab.RecordCount>0;
  ReEdiBtn.Enabled        := ReEdiTab.RecordCount>0;
  BelDelBtn.Enabled       := ReEdiTab.RecordCount>0;
  Del1Btn.Enabled         := ReEdiTab.RecordCount>0;
  Allgemein1.Enabled      := ReEdiTab.RecordCount>0;
  Positionen1.Enabled     := ReEdiTab.RecordCount>0;
  Fertigstellen1.Enabled  := ReEdiTab.RecordCount>0;


  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);

  if LastEdiID <> -1 then
  begin
    ReEdiTab.Locate ('REC_ID', LastEdiID, []);
    ReEdiTabAfterScroll(nil);
  end;

  PC1Changing(Sender, Dummy);
  if assigned(LastTS) then PC1.ActivePage := LastTS;
  PC1Change(Sender);

  if PC1.ActivePage = EdiListTS then 
    try 
      ReEdiListGrid.SetFocus; 
    except 
    end;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.FormDeactivate(Sender: TObject);
begin
  LastTS := PC1.ActivePage;
  PC1Change(Sender);
  if assigned(MainForm.ArtForm) then 
    MainForm.ArtForm.FormDeactivate (Sender);

  LastEdiID := ReEdiTabRec_ID.AsInteger;
  ReEdiTab.Close;
  PosTab.Close;
  OffBestTab.Close;
  ArtikelTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabCalcFields(DataSet: TDataSet);
var 
  Summe  : Double;
  Steuer : Double;
begin
  Summe := PosTabEPreis.Value * PosTabMenge.Value;
  if PosTabRabatt.Value <> 0 then 
    Summe := Summe - Summe * PosTabRabatt.Value / 100;

  Case PosTabSteuer_Code.Value of
    0: Steuer := ReEdiTabMwst_0.Value;
    1: Steuer := ReEdiTabMwst_1.Value;
    2: Steuer := ReEdiTabMwst_2.Value;
    3: Steuer := ReEdiTabMwst_3.Value;
    else Steuer := 0;
  end;

  PosTabNSumme.Value := CAO_round_NK(Summe, 2);  // Auf ganze Pfennige Runden

  if (ReEdiTabMWST_FREI_FLAG.AsBoolean = False) and (Steuer <> 0) then 
    PosTabMwst.Value := FormatFloat ('0.0"%"', Steuer)
  else 
    PosTabMwst.Value := '-';

  if PosTabArtikelTyp.Value = 'N' then
  begin
    PosTabMATCH_ARTNUM.Value := PosTabMATCHCODE.AsString + #13#10 + PosTabARTNUM.AsString;
  end else
  if PosTabARTIKELTYP.Value = 'F' then
  begin
    PosTabMATCH_ARTNUM.Value := _('freier Artikel');
  end
  else 
    PosTabMATCH_ARTNUM.Value := '';
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabBeforePost(DataSet: TDataSet);
var Summe: Double;
begin
  if PosTabArtikel_ID.Value = 0 then
  begin
    try
      Abort;
    finally
      PosTab.Cancel;
    end;
    MessageBeep (0);
  end;
  if (PosTabArtikelTyp.Value = 'T') then
  begin
    PosTabMenge.Value       := 0;
    PosTabME_EInheit.Value  := '';
    PosTabPR_Einheit.Value  := 0;
    PosTabEPreis.Value      := 0;
    PosTabGPreis.Value      := 0;
    PosTabRabatt.Value      := 0;
    PosTabSteuer_Code.Value := 0;
  end else
  begin
    PosTabEPreis.AsFloat := cao_round_nk (PosTabEPreis.AsFloat, DM1.EK_NACHKOMMA);

    if PosTabMenge.Value = 0 then
    begin
      PosTabGPREIS.Value    := 0;
    end else
    begin
      Summe := PosTabEPreis.Value * PosTabMenge.Value;
      if PosTabRabatt.Value <> 0 then
        Summe := Summe - Summe * PosTabRabatt.Value / 100;

      PosTabGPREIS.Value := cao_round_nk(Summe, 2); // Auf 2 NK runden
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TMakeEKReForm.OnAddArtikel (ID: Integer; Menge, EPreis, Rabatt: Double; AlternativArtnum: String = '');
var 
  EK: Double;
begin
  //wir vom Artikelstamm aufgerufen
  ArtikelTab.Close;
  ArtikelTab.ParamByName ('ID').Value := ID;
  ArtikelTab.Open;
  if (ArtikelTab.RecordCount = 1) and (ArtikelTabNo_EK_Flag.Value = False) then
  begin
    AppendOK := True;
    try
      PosTab.Append;

      PosTabJournal_ID.Value      := ReEdiTabREC_ID.Value;
      PosTabQuelle.Value          := ReEdiTabQuelle.Value;
      PosTabQuelle_Sub.Value      := ReEdiTabQuelle_Sub.Value;
      PosTabAddr_ID.Value         := ReEdiTabADDR_ID.Value;
      PosTabVRENUM.Value          := ReEdiTabVRENUM.Value;
      //PosTabVLSNUM.Value          :=-1;
      //PosTabATRNum.Value          :=-1;

      PosTabArtikel_ID.Value      := ArtikelTabREC_ID.Value;
      PosTabArtikelTyp.Value      := ArtikelTabArtikelTyp.Value;

      PosTabArtNum.Value          := ArtikelTabArtnum.Value;
      PosTabMatchCode.Value       := ArtikelTabMatchCode.Value;
      PosTabBarCode.Value         := ArtikelTabBarCode.Value;

      PosTabBezeichnung.AsString  := ArtikelTabKurzName.AsString; //ArtikelTabLangName.AsStrin;
      PosTabLaenge.Value          := ArtikelTabLaenge.Value;
      PosTabGroesse.Value         := ArtikelTabGroesse.Value;
      PosTabDimension.Value       := ArtikelTabDimension.Value;
      PosTabGewicht.Value         := ArtikelTabGewicht.Value;
      PosTabME_Einheit.Value      := ArtikelTabME_Einheit.Value;
      PosTabPR_Einheit.Value      := ArtikelTabPR_Einheit.Value;

      // NEU
      PosTabSN_Flag.AsBoolean     := ArtikelTabSN_Flag.AsBoolean;

      PosTabMenge.Value           := CAO_round_NK(Menge, 2);

      if (ArtikelTabRABGRP_ID.AsString <> '-') and (length(ArtikelTabRABGRP_ID.AsString) > 0) then
      begin
        // Ist ein Artikel mit Rabattgruppe !!!

        case DM1.AnzPreis of
          1: EK := ArtikelTabVK1.Value;
          2: EK := ArtikelTabVK2.Value;
          3: EK := ArtikelTabVK3.Value;
          4: EK := ArtikelTabVK4.Value;
          else EK := ArtikelTabVK5.Value;
        end;

        DM1.CalcRabGrpPreis (ArtikelTabRABGRP_ID.AsString, 0{EK}, EK);
        PosTabEPreis.Value := EK;

      end else 
        PosTabEPreis.Value := ArtikelTabEK_Preis.Value;

      if EPreis <> 0 then 
        PosTabEPreis.Value := EPreis;

      PosTabRabatt.Value := ReEdiTabGlobRabatt.Value;

      if Rabatt <> 0 then 
        ReEdiTabGlobRabatt.Value := Rabatt;

      PosTabSteuer_Code.Value := ArtikelTabSteuer_Code.Value;

      PosTabGEGENKTO.Value := ArtikelTabAufw_Kto.Value;


      // Artikelnummer und Preis des Lieferanten holen wenn verfügbar
      DM1.Uniquery.Close;
      DM1.UniQuery.Sql.Text :=
        'select * from ARTIKEL_PREIS where PREIS_TYP=5 and ' +
        'ARTIKEL_ID=' + Inttostr(PosTabArtikel_ID.AsInteger) +
        ' and ADRESS_ID=' + IntToStr(ReEdiTabAddr_ID.AsInteger);
      DM1.Uniquery.Open;
      if DM1.UniQuery.RecordCount>0 then
      begin
        EK := DM1.UniQuery.FieldByName('PREIS').AsFloat;
        if EK <> 0 then 
          PosTabEPreis.AsFloat := EK;

        if length(DM1.UniQuery.FieldByName('BESTNUM').AsString) > 0 then 
          PosTabArtnum.AsString := DM1.UniQuery.FieldByName('BESTNUM').AsString;
      end;
      DM1.UniQuery.Close;

      PosTab.Post;
    except
      PosTab.Cancel;
    end;
    AppendOK := False;
  end else
  if (ArtikelTab.RecordCount = 1) and (ArtikelTabNo_EK_Flag.Value = True) then
  begin
    MessageBeep(0);
    MessageDlg (_('Dieser Artikel hat eine Einkaufssperre' + #13#10 +
      'und kann deshalb nicht verwendet werden !'),
      mterror, [mbok], 0);
  end else
  begin
    // Hier Fehler, Artikel nicht gefunden !!!
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosMatchButtonClick(Sender: TObject);
begin
  if not Assigned(MainForm.ArtForm) then
  begin
    MainForm.ArtForm := TArtikelForm.Create(Self{MainForm});
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
procedure TMakeEKReForm.DelBtnClick(Sender: TObject);
begin
  PC1Change(Sender);
  PosTab.Delete;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabAfterScroll(DataSet: TDataSet);
begin
  ReEdiTabAfterPost (nil);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then 
    PC1.ActivePage := AdressTS;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabAfterPost(DataSet: TDataSet);
begin
  BelDelBtn.Enabled := ReEdiTab.RecordCount > 0;
  Del1Btn.Enabled := ReEdiTab.RecordCount > 0;

  UpdateStatus;
end;                                        

//------------------------------------------------------------------------------
procedure TMakeEKReForm.DBGrid1DblClick(Sender: TObject);
var 
  Dummy: Boolean;
begin
  if ReEdiTab.RecordCount = 0 then 
    exit;

  PC1Changing (Sender, Dummy);

  if (ReEdiTabAddr_ID.Value < 0) or
     (ReEdiTabORGNUM.AsString = '') or
     (ReEdiTabRDATUM.AsDateTime < 1) then 
    PC1.ActivePage := AdressTS
  else 
    PC1.ActivePage := PosTS;

  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabBeforeClose(DataSet: TDataSet);
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
procedure TMakeEKReForm.PosTabBeforeEdit(DataSet: TDataSet);
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
procedure TMakeEKReForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  PosTab.Close;
  ReEdiTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabOnNewRecord(DataSet: TDataSet);
var 
  Dummy   : Boolean;
begin
  ReEdiTabQuelle.Value     := EK_RECH_EDI;
  ReEdiTabQUELLE_SUB.Value := 0;
  ReEdiTabVLSNUM.Value     := '';
  ReEdiTabATRNUM.Value     := -1;
  ReEdiTabGegenKonto.Value := -1;
  ReEdiTabADDR_ID.Value    := -1;
  ReEdiTabRDatum.Value     := Trunc (Now);
  ReEdiTabLDatum.Value     := 0;
  ReEdiTabADatum.Value     := 0;
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
  ReEdiTabPR_Ebene.Value   := 0; //EK
  ReEdiTabFolgeNr.Value    := -1;
  ReEdiTabKM_Stand.Value   := -1;
  ReEdiTabKFZ_ID.Value     := -1;
  ReEdiTabVertreter_ID.Value := -1;
  ReEdiTabGlobRabatt.Value := 0;
  ReEdiTabTermin.Value     := 0;
  ReEdiTabLiefart.Value    := -1;
  ReEdiTabZahlArt.Value    := -1;

  ReEdiTabErstellt.Value  := now;
  ReEdiTabERST_NAME.Value := DM1.View_User;

  ReEdiTabMWST_0.Value     := DM1.MWSTTab[0];
  ReEdiTabMWST_1.Value     := DM1.MWSTTab[1];
  ReEdiTabMWST_2.Value     := DM1.MWSTTab[2];
  ReEdiTabMWST_3.Value     := DM1.MWSTTab[3];

  if (PosTab.State = dsEdit) or (PosTab.State = dsInsert) then
  begin
    try
      PosTab.Post;
    except
      PosTab.Cancel;
    end;
  end;

  PC1.ActivePage := AdressTS;

  PC1Changing (Self, Dummy);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabNewRecord(DataSet: TDataSet);
begin
  PosTabJournal_ID.Value      := ReEdiTabRec_ID.Value;
  PosTabQuelle.Value          := ReEdiTabQuelle.Value;
  PosTabQuelle_Sub.Value      := ReEdiTabQuelle_Sub.Value;
  PosTabAddr_ID.Value         := ReEdiTabAddr_ID.Value;
  PosTabVRENUM.Value          := ReEdiTabVRENUM.Value;
  PosTabRabatt.Value          := ReEdiTabGlobRabatt.Value;
  PosTabPosition.Value        := PosTab.RecordCount + 1;
  PosTabE_RGewinn.Value       := 0;
  PosTabG_RGewinn.Value       := 0;
  PosTabE_RABATT_BETRAG.Value := 0;
  PosTabG_RABATT_BETRAG.Value := 0;

  PosTabBrutto_Flag.Value := ReEdiTabBRUTTO_FLAG.Value;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabAfterScroll(DataSet: TDataSet);
begin
  PosTabMenge.ReadOnly := PosTabArtikelTyp.AsString = 'T';
  PosTabEPreis.ReadOnly := PosTabArtikelTyp.AsString = 'T';

  if (assigned(POsGrid.DBMemo)) and (PosGrid.DBMemo.Visible) and (PosGrid.DBMemo.Focused) then
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
  DelBtn.Enabled := PosTab.RecordCount>0;
  Positionlschen1.Enabled := PosTab.RecordCount>0;

  EditSNBtn.Enabled := (PosTab.RecordCount > 0) and (PosTabSN_Flag.AsBoolean = True);
end;                                                

//------------------------------------------------------------------------------
procedure TMakeEKReForm.UpBtnClick(Sender: TObject);
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
procedure TMakeEKReForm.DownBtnClick(Sender: TObject);
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
procedure TMakeEKReForm.UpdateLayout;
begin
  UpBtn.Enabled := PosTab.RecNo>1;
  DownBtn.Enabled := PosTab.RecNo<PosTab.RecordCount;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.NeuArtBtnClick(Sender: TObject);
begin
  PC1Change(Sender);
  PosMatchButtonClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.AddTextBtnClick(Sender: TObject);
var i: integer;
begin
  PC1Change(Sender);

  AppendOK := True;
  try
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
    PosTabRabatt.Value          := 0;
    PosTabGEGENKTO.Value        := -1;
    //PosTabBEZ_FEST.Value        :=0;
    PosTabSteuer_Code.Value     := 0;
    //PosTabAltteil.Value         :=0;
    //PosTabALTTEIL_PROZ.Value    :=0;
    //PosTabALTTEIL_STCODE.Value  :=0;

    UpdateLayout;

    PosTab.Post;
  except
    PosTab.Cancel;
  end;
  AppendOK := False;

  PosGrid.SetFocus;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.NeuFrArtBtnClick(Sender: TObject);
var 
  i: integer;
begin
  PC1Change(Sender);

  AppendOK := True;
  try
    PosTab.Append;

    PosTabArtikelTyp.Value      := 'F';
    PosTabArtikel_ID.Value      := - 99;
    //PosTabArtNum.Value          :='fr. Artikel';
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
    PosTabRabatt.Value          := 0;
    PosTabGEGENKTO.Value        := DM1.ReadInteger ('MAIN\KONTEN', 'DEF_AUFANDKTO', 3400);
    //PosTabBEZ_FEST.Value        :=0;
    PosTabSteuer_Code.Value     := DM1.DefMwStCD;
    //PosTabAltteil.Value         :=0;
    //PosTabALTTEIL_PROZ.Value    :=0.1;
    //PosTabALTTEIL_STCODE.Value  :=DM1.DefMwStCD;
    UpdateLayout;

    PosTab.Post;
  except
    PosTab.Cancel;
  end;
  AppendOK := False;

  PosGrid.SetFocus;

  for i := 0 to PosGrid.Columns.Count-1 do
    if (PosGrid.Columns[i].FieldName) = 'BEZEICHNUNG' then 
      PosGrid.Col := i + 1;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.SetAdresse (ID: Integer);
begin
  DM1.ReKunTab.Close;
  DM1.ReKunTab.ParamByName('ID').AsInteger := ID;
  DM1.ReKunTab.Open;

  if DM1.ReKunTab.RecordCount = 1 then
  begin
    if //(DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean) and
       (ReEdiTabBRUTTO_FLAG.Value<>DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean) then 
    begin
      UmschaltungBruttoNetto1Click(Self);
    end;

    if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
      ReEdiTab.Edit;

    ReEdiTabADDR_ID.Value           := DM1.ReKunTab.FieldByName('Rec_ID').AsInteger;
    ReEdiTabPR_EBENE.Value          := 0; //Einkauf !!!

    ReEdiTabSOLL_STAGE.Value        := DM1.ReKunTab.FieldByName('NET_Tage').AsInteger;
    ReEdiTabSOLL_SKONTO.Value       := DM1.ReKunTab.FieldByName('Net_Skonto').AsFloat;
    ReEdiTabSOLL_NTAGE.Value        := DM1.ReKunTab.FieldByName('BRT_Tage').AsInteger;
    ReEdiTabSOLL_RATEN.Value        := 1;
    ReEdiTabSOLL_RATBETR.Value      := 0;
    ReEdiTabSOLL_RATINTERVALL.Value := 1;
    ReEdiTabKUN_ANREDE.Value        := DM1.ReKunTab.FieldByName('Anrede').AsString;
    ReEdiTabKUN_NAME1.Value         := DM1.ReKunTab.FieldByName('Name1').AsString;
    ReEdiTabKUN_NAME2.Value         := DM1.ReKunTab.FieldByName('Name2').AsString;
    ReEdiTabKUN_NAME3.Value         := DM1.ReKunTab.FieldByName('Name3').AsString;
    ReEdiTabKUN_ABTEILUNG.Value     := DM1.ReKunTab.FieldByName('Abteilung').AsString;
    ReEdiTabKUN_STRASSE.Value       := DM1.ReKunTab.FieldByName('Strasse').AsString;
    ReEdiTabKUN_LAND.Value          := DM1.ReKunTab.FieldByName('Land').AsString;
    ReEdiTabKUN_PLZ.Value           := DM1.ReKunTab.FieldByName('PLZ').AsString;
    ReEdiTabKUN_ORT.Value           := DM1.ReKunTab.FieldByName('Ort').AsString;

    ReEdiTabGEGENKONTO.Value        := DM1.ReKunTab.FieldByName('KRD_NUM').AsInteger;
    ReEdiTabLiefart.Value           := DM1.ReKunTab.FieldByName('LIEF_Liefart').AsInteger;
    ReEdiTabZahlart.Value           := DM1.ReKunTab.FieldByName('LIEF_Zahlart').AsInteger;
    ReEdiTabKUN_NUM.Value           := DM1.ReKunTab.FieldByName('Kunnum2').AsString;
    ReEdiTabWAEHRUNG.Value          := DM1.ReKunTab.FieldByName('Waehrung').AsString;

    ReEdiTabVERTRETER_ID.Value      := DM1.ReKunTab.FieldByName('VERTRETER_ID').AsInteger;
    ReEdiTabGLOBRABATT.Value        := DM1.ReKunTab.FieldByName('GRabatt').AsFloat;

    ReEdiTabMWST_FREI_FLAG.Value    := DM1.ReKunTab.FieldByName('MWST_FREI_Flag').AsBoolean;

    if ReEdiTabMWST_FREI_FLAG.Value then 
      ReEdiTabBRUTTO_FLAG.Value := False
    else 
      ReEdiTabBRUTTO_FLAG.Value := DM1.ReKunTab.FieldByName('Brutto_FLAG').AsBoolean;

    ReEdiTab.Post;

    // in EK-Rechnungspositionen neue Adress_ID setzen
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
  end;

  DM1.ReKunTab.Close;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.KuNrEditButtonClick(Sender: TObject);
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
    ShowModal;
    if Uebern then
    begin // Adreese in Rechnung überbnehmen
      if not (ReEdiTab.State in [dsEdit, dsInsert]) then 
        ReEdiTab.Edit;

      SetAdresse (KSQueryRec_ID.AsInteger);
      Uebern := False;
      FormDeactivate (Sender);
    end;
  end; // with
end;    

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabAfterPost(DataSet: TDataSet);
var 
  ID: Integer;
  N, n0, n1, n2, n3,
  M, m0, m1, m2, m3,
  B, b0, b1, b2, b3,
  Lohn, Ware, TKst: Double;
  T: Char;
begin
  if PosTab.ControlsDisabled then 
    exit;

  // im Artkikel die MENGE_EKRE_EDI aktualisieren
  DM1.UpdateArtikelEdiMenge (EK_RECH_EDI, PosTabArtikel_ID.AsInteger, 0);

  ID := PosTabRec_ID.Value;
  PosTab.DisableControls;
  N := 0; N0 := 0; N1 := 0; N2 := 0; N3 := 0;
  M := 0; M0 := 0; M1 := 0; M2 := 0; M3 := 0;
  B := 0; B0 := 0; B1 := 0; B2 := 0; B3 := 0;
  Lohn := 0; Ware := 0; TKst := 0;
  try
    PosTab.First;
    while not PosTab.Eof do
    begin
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
        N := B 
      else 
        B := N;
    end;

    PosTab.Locate ('REC_ID', variant(ID), []);
  finally
    // Brutto-Wert-Rundung
    if DM1.BR_SUM_RUND_WERT > 1 then 
      B := CAO_Round (B * 100 / DM1.BR_SUM_RUND_WERT) * DM1.BR_SUM_RUND_WERT / 100;

    if (ReEdiTabNSumme.Value <> N) or
       (ReEdiTabNSumme_0.Value <> N0) or
       (ReEdiTabNSumme_1.Value <> N1) or
       (ReEdiTabNSumme_2.Value <> N2) or
       (ReEdiTabNSumme_3.Value <> N3) or
       (ReEdiTabMSumme.Value   <> M) or
       (ReEdiTabMSumme_0.Value <> M0) or
       (ReEdiTabMSumme_1.Value <> M1) or
       (ReEdiTabMSumme_2.Value <> M2) or
       (ReEdiTabMSumme_3.Value <> M3) or
       (ReEdiTabBSumme.Value   <> B) or
       (ReEdiTabBSumme_0.Value <> B0) or
       (ReEdiTabBSumme_1.Value <> B1) or
       (ReEdiTabBSumme_2.Value <> B2) or
       (ReEdiTabBSumme_3.Value <> B3) or
       (ReEdiTabWare.Value     <> Ware) or
       (ReEdiTabLohn.Value     <> Lohn) or
       (ReEdiTabTKost.Value    <> TKst) then
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

        ReEdiTabWare.Value        := Ware;
        ReEdiTabLohn.Value        := Lohn;
        ReEdiTabTKost.Value       := TKst;

        ReEdiTab.Post;
      except
        ReEdiTab.Cancel;
      end;
    end;

    PosTab.EnableControls;
  end;
  DelBtn.Enabled := PosTab.RecordCount>0;
  Positionlschen1.Enabled := PosTab.RecordCount>0;
  EditSNBtn.Enabled := (PosTab.RecordCount > 0) and (PosTabSN_Flag.AsBoolean = True);

  // Offene Bestellungen aktualisieren
  if OffBestTab.Active then
  begin
    OffBestTab.Refresh;
    OffBestTabAfterOpen(nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PC1Changing(Sender: TObject;
var 
  AllowChange: Boolean);
begin
  QueryTime := GetTickCount;
  if PosTab.ParamByName ('ID').Value<>ReEdiTabREC_ID.Value then
  begin
    // Pos Tab aktualisieren
    if PosTab.Active then 
      PosTab.Close;
    PosTab.ParamByName ('ID').AsInteger := ReEdiTabREC_ID.Value;
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
  end;

  QueryTime := GetTickCount - QueryTime;
  UpdateStatus;

  if ReEdiTab.State in [dsEdit, dsInsert] then 
    ReEdiTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosGridShowEditor(Sender: TObject; Field: TField; var AllowEdit: Boolean);
begin
  if (uppercase(PosTabARTIKELTYP.Value) = 'T') and
     (
     (Field.FieldName = 'MENGE') or
     (Field.FieldName = 'EPREIS') or
     (Field.FieldName = 'ME_EINHEIT') or
     (Field.FieldName = 'RABATT') or
     (Field.FieldName = 'STEUER_CODE')
     ) then 
  begin
    AllowEdit := False;
  end;
  if (Uppercase(Field.FieldName) = 'POSITION') or
     (Uppercase(Field.FieldName) = 'ARTIKELTYP') or
     (Uppercase(Field.FieldName) = 'MATCH_ARTNUM') then 
  begin
    AllowEdit := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiListGridGetCellParams(Sender: TObject;
                  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (assigned(TJvDBGrid (Sender).DataSource.DataSet)) and
     (odd(TJvDBGrid(Sender).DataSource.DataSet.RecNo)) and
     (not Highlight) then 
  begin
    Background := DM1.C2Color;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabBeforePost(DataSet: TDataSet);
begin
  if ReEdiTabVRENUM.Value = '' then 
    ReEdiTabVRENUM.Value := DM1.IncNummerStr (EK_RECH_EDI);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabCalcFields(DataSet: TDataSet);
begin
  if ReEdiTabTermin.Value > 100 then 
    ReEdiTabWV_DatumStr.Value := FormatDateTime ('dd.mm.yyyy', ReEdiTabTermin.Value);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(ReEdiListGrid), 'EDI_LISTE_EKRE', 102);
  dm1.GridSaveLayout (tDBGrid(PosGrid), 'EDI_POS_EKRE', 102);
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiTabBeforeDelete(DataSet: TDataSet);
begin
  // evt. vorhandene Positionen löschen
  if PosTab.Active then 
    PosTab.Close;
  PosTab.ParamByName ('ID').Value := ReEdiTabREC_ID.Value;
  PosTab.Open;
  PosTab.DisableControls;
  try
    while not PosTab.EOF do
    begin
      // Positionen löschen
      PosTab.Delete;
      {
      //Seriennummern löschen
      dm1.UniQuery.close;
      dm1.UniQuery.sql.text :='DELETE from ARTIKEL_SERNUM where EK_JOURNAL_ID='+IntToStr(ReEdiTabRec_ID.AsInteger);
      dm1.UniQuery.ExecSql;
      dm1.UniQuery.close; }
    end;
  finally
    PosTab.EnableControls;

    DM1.UpdateArtikelEdiMenge (EK_RECH_EDI, PosTabArtikel_ID.AsInteger, PosTabMenge.AsFloat);
  end;
end;                                                                   

//------------------------------------------------------------------------------
procedure TMakeEKReForm.SichtbareSpalten1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(ReEdiListGrid));
end;
//------------------------------------------------------------------------------
procedure TMakeEKReForm.BuchenBtnClick(Sender: TObject);
var 
  BelegNr: String;
  MakeVK: Boolean;
begin
  if InBuchung then 
    exit;
  try
    InBuchung := True;
    BelegNr := dm1.Buche_Einkauf (ReEdiTabREC_ID.Value);

    EKRechFertigDlg.ExecDialog (BelegNr, MakeVK);

    if MakeVK then 
      DM1.CopyRechnung (ReEdiTabREC_ID.Value, VK_RECH_EDI);

    LastTS    := EdiListTS;
    LastEdiID := -1;
    FormActivate(Sender);
    MainForm.FormActivate (Self);
  finally
    InBuchung := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.New1BtnClick(Sender: TObject);
begin
  ReEdiTab.Append;
  LastEdiID := ReEdiTabRec_ID.Value;
  LastTS := AdressTS;
  FormActivate(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.Del1BtnClick(Sender: TObject);
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
procedure TMakeEKReForm.GotoAllgBtnClick(Sender: TObject);
begin
  PC1.ActivePage := AdressTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoAuswahlBtnClick(Sender: TObject);
begin
  PC1.ActivePage := EdiListTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiBtnClick(Sender: TObject);
begin
  DBGrid1DblClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoPosBtnClick(Sender: TObject);
begin
  PC1.ActivePage := PosTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.GotoFertigBtnClick(Sender: TObject);
begin
  PC1.ActivePage := Fertig;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.KuNrEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TMakeEKReForm.KuNrEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if uppercase(tControl(Sender).Name) = 'RECHINFOMEMO' then 
      KuNrEdit.SetFocus
    else 
      SendMessage(MainForm.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.Kopieren1Click(Sender: TObject);
begin
  DM1.CopyRechnung (ReEdiTabREC_ID.Value, EK_RECH_EDI);
  ReEdiTab.Refresh;
  ReEdiTab.Last;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PC1Change(Sender: TObject);
var 
  Prob : Boolean;
  S, S1 : String;
  Dummy: Boolean;
  I    : Integer;
begin
  if (assigned(POsGrid.DBMemo)) and (PosGrid.DBMemo.Visible) and (PosGrid.DBMemo.Focused) then
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

  Positionlschen1.Enabled := (PosTab.RecordCount > 0) and (PC1.ActivePage = PosTS);

  Storno1.Enabled := (ReEdiTab.RecordCount > 0) and ((PC1.ActivePage = AdressTS) or (PC1.ActivePage = EdiListTS));

  SichtbareSpalten1.Enabled := PC1.ActivePage = EdiListTS;

  Kopieren1.Enabled := (PC1.ActivePage = EdiListTS) and (ReEdiTab.RecordCount > 0);

  Adressezuweisen1.Enabled := PC1.ActivePage = AdressTS;

  Artikelhinzufgen1.Enabled := PC1.ActivePage = PosTS;
  freienArtikelhinzufgen1.Enabled := Artikelhinzufgen1.Enabled;
  Texthinzufgen1.Enabled := Artikelhinzufgen1.Enabled;

  Aktualisieren1.Enabled := (PC1.ActivePage = EdiListTS) or (PC1.ActivePage = PosTS);

  AuswahlBtn.Font.Style    := [];
  AllgemeinBtn.Font.Style  := [];
  PositionenBtn.Font.Style := [];
  FertigBtn.Font.Style     := [];

  SpeichernundBuchen1.Enabled := False;
  Suchen1.Enabled := (PC1.ActivePage = EdiListTS);

  Prob := False;
  S    := '';
  if PC1.ActivePage = Fertig then
  begin
    FertigBtn.Font.Style := [fsBold];
    Fertigstellen1.Checked := True;

    if ReEdiTabAddr_ID.Value < 0 then
    begin
      S := S + _('Kein Lieferant zugewiesen') + #13#10;
      Prob := True;
    end;
    if ReEdiTabZAHLART.Value<0 then
    begin
      S := S + _('Keine Zahlungsart zugewiesen') + #13#10;
      Prob := True;
    end;
    {
    if (ReEdiTabNSumme.Value=0)or(PosTab.RecordCount=0) then
    begin
    S :=S+_('Beleg hat einen Betrag von 0,00 bzw. keine Positionen')+#13#10;
    Prob :=True;
    end;
    }
    if (PosTab.RecordCount = 0) then
    begin
      S := S + _('Beleg hat keine Positionen') + #13#10;
      Prob := True;
    end;
    if ReEdiTabOrgnum.Value = '' then
    begin
      S := S + _('ER-Nummer (Belegnummer) ist leer') + #13#10;
      Prob := True;
    end;

    // Seriennummern (Anzahl zu Pos.-Menge) prüfen

    dm1.UniQuery.close;
    dm1.uniquery.sql.clear;
    {
    dm1.uniquery.sql.add('select JP.REC_ID, JP.QUELLE, JP.JOURNAL_ID, JP.ARTIKEL_ID, JP.POSITION, JP.MENGE ,');
    dm1.uniquery.sql.add('COUNT(*) as SN0, SUM(SN.SNUM_ID)as SN1 from JOURNALPOS as JP');
    dm1.uniquery.sql.add('left outer join ARTIKEL_SERNUM as SN on JP.ARTIKEL_ID=SN.ARTIKEL_ID');
    dm1.uniquery.sql.add('and JP.JOURNAL_ID=SN.EK_JOURNAL_ID and SN.EK_JOURNALPOS_ID=JP.REC_ID');
    dm1.uniquery.sql.add('where JP.JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
    dm1.uniquery.sql.add('and JP.SN_FLAG="Y" group by JP.REC_ID');
    dm1.uniquery.sql.add('having MENGE<>SN0 or SN1=0');
    
    dm1.uniquery.sql.add('select JP.REC_ID, JP.QUELLE, JP.JOURNAL_ID, JP.ARTIKEL_ID, JP.POSITION, JP.MENGE ,');
    dm1.uniquery.sql.add('COUNT(SN.SNUM_ID)as ANZ_SN from JOURNALPOS as JP');
    dm1.uniquery.sql.add('left outer join ARTIKEL_SERNUM as SN on JP.ARTIKEL_ID=SN.ARTIKEL_ID');
    dm1.uniquery.sql.add('and JP.JOURNAL_ID=SN.EK_JOURNAL_ID and SN.EK_JOURNALPOS_ID=JP.REC_ID');
    dm1.uniquery.sql.add('where JP.JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
    dm1.uniquery.sql.add('and JP.SN_FLAG="Y" group by JP.REC_ID');
    dm1.uniquery.sql.add('having MENGE<>ANZ_SN');
    }

    dm1.uniquery.sql.text :=
    'select JP.REC_ID,JP.QUELLE,JP.JOURNAL_ID,JP.REC_ID as ' +
    'JOURNALPOS_ID,JP.ARTIKEL_ID,JP.POSITION,JP.MENGE,' +
    'COUNT(JPS.SNUM_ID)as ANZ_SN from JOURNALPOS as JP ' +
    'left outer join JOURNALPOS_SERNUM as JPS on ' +
    'JP.ARTIKEL_ID=JPS.ARTIKEL_ID and JP.REC_ID=JPS.JOURNALPOS_ID and ' +
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
      S := S + Format(_('Bei der Artikelposition %s stimmt die Anz. der ' +
        'Seriennummern nicht mit der Artikelmenge überein'), [S1]) + #13#10;
    end else
    if dm1.uniquery.RecordCount>1 then
    begin
      S := S + Format(_('Bei den Artikelpositionen %s stimmt die Anz. der ' +
        'Seriennummern nicht mit der Artikelmenge überein'), [S1]) + #13#10;
    end;

    dm1.uniquery.close;


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
    SpeichernundBuchen1.Enabled := not Prob;
  end else
  if PC1.ActivePage = EdiListTS then
  begin
    AuswahlBtn.Font.Style := [fsBold];
    Auswahl1.Checked := True;
  end else
  if PC1.ActivePage = AdressTS then
  begin
    AllgemeinBtn.Font.Style := [fsBold];
    Allgemein1.Checked := True;
  end else
  if PC1.ActivePage = PosTS then
  begin
    PositionenBtn.Font.Style := [fsBold];
    Positionen1.Checked := True;
    if PosGrid.Columns.Count > 0 then
    begin
      for i := 0 to PosGrid.Columns.Count-1 do
      begin
        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
          PosTabEPREIS.DisplayLabel := _('E-Preis (B)');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'EPREIS') then
        begin
          PosTabEPREIS.DisplayLabel := _('E-Preis');
        end;
        
        if (ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis (B)');
        end else
        if (not ReEdiTabBRUTTO_FLAG.AsBoolean) and (uppercase(PosGrid.Columns[i].FieldName) = 'GPREIS') then
        begin
          PosTabGPREIS.DisplayLabel := _('G-Preis');
        end;
      end;
    end;
    PosGrid.Invalidate;

    //Offene-Best-Tab aktualisieren
    if OffBestTab.ParamByName ('AID').AsInteger<>ReEdiTabAddr_ID.AsInteger then
    begin
      OffBestTab.Close;
      OffBestTab.ParamByName ('AID').AsInteger := ReEdiTabAddr_ID.AsInteger;
      OffBestTab.Open;
    end else
    if not OffBestTab.Active then 
      OffBestTab.Open;
  end;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_INSERT then
  begin
    key := 0;
    PosMatchButtonClick(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.RechInfoMemoEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor; //$009FFF9;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.RechInfoMemoExit(Sender: TObject);
begin
  tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabAfterDelete(DataSet: TDataSet);
var 
  bm: tBookmark;
  p : Integer;
begin
  if PosTab.ControlsDisabled then // Beleg wird gelöscht,
    exit; 
  // jetzt abbrechen da die Positionen somit
  // auch nicht aktualisiert werden müssen

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
procedure TMakeEKReForm.PosTabBeforeInsert(DataSet: TDataSet);
begin
  if not AppendOK then
  begin
    MessageBeep(0);
    Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.EditSNBtnClick(Sender: TObject);
begin
  SNTab.Close;
  {
  SNTab.Sql.Clear;
  SNTab.Sql.Add ('SELECT * FROM ARTIKEL_SERNUM');
  SNTab.Sql.Add ('WHERE ARTIKEL_ID='+Inttostr(PosTabArtikel_ID.AsInteger));
  SNTab.Sql.Add ('AND EK_JOURNAL_ID='+Inttostr(ReEdiTabRec_ID.AsInteger));
  SNTab.Sql.Add ('AND EK_JOURNALPOS_ID='+Inttostr(PosTabRec_ID.AsInteger));
  }
  SNTab.Sql.Text :=
    'select SN.SERNUMMER,SN.SNUM_ID,SN.ARTIKEL_ID ' +
    'from JOURNALPOS_SERNUM JPS, ARTIKEL_SERNUM SN ' +
    'where JPS.ARTIKEL_ID=SN.ARTIKEL_ID and JPS.SNUM_ID=SN.SNUM_ID and ' +
    'JPS.JOURNAL_ID=' + Inttostr(ReEdiTabRec_ID.AsInteger) +
    ' and JPS.JOURNALPOS_ID=' + Inttostr(PosTabRec_ID.AsInteger);


  SNTab.Open;
  SNErfassenForm.ErfasseSN (PosTabMenge.AsInteger);
  SNTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosTabBeforeDelete(DataSet: TDataSet);
var 
  Sql: String;
begin
  // Seriennummern löschen ....
  {
  dm1.UniQuery.close;
  dm1.UniQuery.sql.text :='DELETE from ARTIKEL_SERNUM where EK_JOURNALPOS_ID='+
  IntToStr(PosTabRec_ID.AsInteger);
  dm1.UniQuery.ExecSql;
  dm1.UniQuery.close;
  }

  if PosTabSN_Flag.AsBoolean then
  begin
    try
      DM1.UniQuery.close;
      DM1.UniQuery.sql.text :=
        'SELECT SNUM_ID from JOURNALPOS_SERNUM ' +
        'WHERE ' +
        'JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
        'JOURNALPOS_ID=' + IntToStr(PosTabRec_ID.AsInteger);

      Sql := '';
      DM1.UniQuery.open;
      while not DM1.UniQuery.Eof do
      begin
        SQL := SQL + 'DELETE FROM ARTIKEL_SERNUM ' +
          'WHERE ' +
          'ARTIKEL_ID=' + IntToStr(PosTabArtikel_ID.AsInteger) +
          ' and ' +
          'SNUM_ID=' + IntToStr(DM1.UniQuery.FieldByName('SNUM_ID').AsInteger) +
          ' and STATUS="EK_EDI";';

        DM1.UniQuery.Next;
      end;
      DM1.UniQuery.Close;

      SQL := SQL +
        'DELETE from JOURNALPOS_SERNUM ' +
        'WHERE ' +
        'JOURNAL_ID=' + IntToStr(ReEdiTabRec_ID.AsInteger) + ' and ' +
        'JOURNALPOS_ID=' + IntToStr(PosTabRec_ID.AsInteger) + ';';

      DM1.ZBatchSql1.Script.Text := Sql;
      ProgressForm.Init(_('Seriennummern aktualisieren'));
      try
        DM1.ZBatchSql1.Execute;
      finally
        ProgressForm.Stop;
      end;
    except
      MessageDlg(_('Fehler beim aktualisieren der Seriennummern. (1)'), mterror, [mbok], 0);
    end;
  end;

  // im Artkikel die MENGE_EKRE_EDI aktualisieren
  if not PosTab.ControlsDisabled then
    DM1.UpdateArtikelEdiMenge(
      EK_RECH_EDI,
      PosTabArtikel_ID.AsInteger,
      PosTabMenge.AsFloat
    );
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.OffBestGridDblClick(Sender: TObject);
begin
  OnAddArtikel (OffBestTab.FieldByName('ARTIKEL_ID').AsInteger,
  OffBestTab.FieldByName('MENGE_OFFEN').AsFloat,
  OffBestTab.FieldByName('EPREIS').AsFloat,
  OffBestTab.FieldByName('RABATT').AsFloat);

  try
    PosTab.DisableControls;
    if not (PosTab.State in [dsEdit, dsInsert]) then 
      PosTab.Edit;
    PosTabQuelle_Src.AsInteger := OffBestTab.FieldByName('POSREC_ID').AsInteger;
    PosTab.Post;
  except
    PosTab.Cancel;
  end;
  PosTab.EnableControls;

  // Offene Bestellungen aktualisieren
  OffBestTab.Refresh;
  OffBestTabAfterOpen(nil);
end;  

//------------------------------------------------------------------------------
procedure TMakeEKReForm.OffBestTabAfterOpen(DataSet: TDataSet);
begin
  OffBestGB.Visible := (OffBestTab.Active) and (OffBestTab.RecordCount > 0);
  OffBestSplitter.Visible := OffBestGB.Visible;
end;                                                                   

//------------------------------------------------------------------------------
procedure TMakeEKReForm.ReEdiDSDataChange(Sender: TObject; Field: TField);
begin
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.UpdateStatus;
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
       (not ReEdiTabTermin.IsNull) and
       (ReEdiTabTermin.AsDateTime > 0) then 
      Geaendert := _('Termin : ') + FormatDateTime ('dd.mm.yyy', ReEdiTabTermin.AsDateTime)
    else 
      Geaendert := '';

    if (PosTab.Active) and (PC1.ActivePage = PosTS) then 
      Sortierung := _('Position : ') + inttostr (PosTab.RecNo) +
        ' ' + _('von') + ' ' + inttostr (PosTab.RecordCount)
    else 
      Sortierung := '-';

    OnUpdateStatusBar (SuchZeit, DatenSatz, Sortierung, Erstellt, Geaendert);
  end;

  if ReEdiTabBrutto_Flag.AsBoolean then 
    ReEdiTopLab.Caption := '  ' + _('Einkauf bearbeiten ...') + ' ' + _('(BRUTTO)')
  else 
    ReEdiTopLab.Caption := '  ' + _('Einkauf bearbeiten ...');
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                                

//------------------------------------------------------------------------------
procedure TMakeEKReForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.PosGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (PosTab.State in [dsEdit, dsInsert]) then 
    PosTab.Post;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.Aktualisieren1Click(Sender: TObject);
begin
  if PC1.ActivePage = EdiListTS then
  begin
    ReEdiTab.Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.Suchen1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TMakeEKReForm.FindDialog1Find(Sender: TObject);
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
      Found := Pos (uppercase(t), uppercase(ReEdiTab.FieldByName(f).AsString)) > 0;
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
procedure TMakeEKReForm.UmschaltungBruttoNetto1Click(Sender: TObject);
var 
  CurrPos: Integer;
  Brutto : Boolean;
  MwSt   : Double;
begin
  if ReEdiTabMwst_frei_Flag.AsBoolean then 
    exit;

  if PosTab.RecordCount>0 then
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
            PosTabEPREIS.Value := CAO_round( 
              (PosTabEPREIS.Value +
              PosTabEPREIS.Value / 100 *
              MwSt) * 100
              ) / 100
          else 
            PosTabEPREIS.Value := CAO_round( 
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

    if ReEdiTabBrutto_Flag.AsBoolean
    then ReEdiTopLab.Caption := '  ' + _('Einkauf bearbeiten ...') + ' ' + _('(BRUTTO)')
    else ReEdiTopLab.Caption := '  ' + _('Einkauf bearbeiten ...');

    PC1Change(Sender);
  end;
  {
  if ReEdiTabBrutto_Flag.AsBoolean
  then DetailGPreisB.DataField :='GPREIS'
  else DetailGPreisB.DataField :='CALC_BPREIS';
  }
end;

end.

