{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Fahrzeug-Stamm                                                    }
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
{ 06.05.2003 - zum GNU-Source hinzugefügt }
{ 15.09.2003 - 2 neue Felder (nä. Sicherheitsprüfung, nä. Tachoprüfung) hinzugef. }
{ 09.11.2003 - Bug bei Suche ohne Ergebnis mit anschliessendem Enter gefixt }
{ 13.12.2003 - Umrechnung KW/PS eingebaut }
{ 26.02.2004 - Schlüssel-Nr. zu 2 und 3 in die Liste eingebaut }
{ 23.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 27.11.2004 - Druckfunktionen implementiert }
{ 22.12.2204 - KFZ-Gruppen erweitert }
{ 04.05.2005 - Karl Langmann: KFZ-Gruppen auf Tabelle umgestellt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_KFZ1;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSqlUpdate, DB, ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, StdCtrls, DBCtrls, ComCtrls, JvExExtCtrls, JvComponent,
  JvSplit, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, Buttons,
  ToolWin, JvToolEdit, JvDBControls, JvExMask, Mask, OFGroupBox,
  JvExComCtrls, JvComCtrls, JvExControls, JvSpeedButton,
  OF_Var_Const, JvMenus, OFSecurity;

{
uses
  SortGrid,
}

type
  TKFZForm = class(TForm)
    MainMenu1: TJvMainMenu;
    Sortierung1: TMenuItem;
    Match1: TMenuItem;
    Name11: TMenuItem;
    PLZOrt1: TMenuItem;
    KFZPanel: TPanel;
    KFZPan: TPanel;
    KFZ_PC: TJvPageControl;
    Allg_TS: TTabSheet;
    Notiz_TS: TTabSheet;
    Hist_TS: TTabSheet;
    List_TS: TTabSheet;
    KFZ_GRD: TOFDBGrid;
    KFZ_DS: TDataSource;
    Bearbeiten1: TMenuItem;
    Neu1: TMenuItem;
    Lschen1: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    KFZToolBar: TToolBar;
    DBNavigator2: TDBNavigator;
    Label31: TLabel;
    Suchbeg: TEdit;
    ToolButton6: TToolButton;
    KFZTab: TOFZQuery;
    KFZTabKFZ_ID: TIntegerField;
    KFZTabADDR_ID: TIntegerField;
    KFZTabFGST_NUM: TStringField;
    KFZTabKFZ_GRUPPE: TIntegerField;
    KFZTabPOL_KENNZ: TStringField;
    KFZTabTYP_ID: TIntegerField;
    KFZTabTYP: TStringField;
    KFZTabAUSFUER: TStringField;
    KFZTabART_ID: TIntegerField;
    KFZTabFABRIKAT_ID: TIntegerField;
    KFZTabKRAFTSTOFF_ID: TIntegerField;
    KFZTabGRUPPE: TIntegerField;
    KFZTabSCHLUES_NR: TStringField;
    KFZTabZSCHL_NR: TStringField;
    KFZTabMOTOR_NR: TStringField;
    KFZTabKFZBRI_NR: TStringField;
    KFZTabMOTOR: TStringField;
    KFZTabGETRIEBE: TStringField;
    KFZTabKW: TIntegerField;
    KFZTabPS: TIntegerField;
    KFZTabKM_STAND: TIntegerField;
    KFZTabHUBRAUM: TIntegerField;
    KFZTabREIFEN: TStringField;
    KFZTabREIF_GR: TStringField;
    KFZTabFARBE: TStringField;
    KFZTabPOLSTER: TStringField;
    KFZTabZULASSUNG: TDateField;
    KFZTabHERSTELLUNG: TDateField;
    KFZTabKAUFDATUM: TDateField;
    KFZTabLE_BESUCH: TDateField;
    KFZTabNAE_TUEV: TDateField;
    KFZTabNAE_AU: TDateField;
    KFZTabEK_PREIS: TFloatField;
    KFZTabRUESTK: TFloatField;
    KFZTabVK_NETTO: TFloatField;
    KFZTabMWST_PROZ: TFloatField;
    KFZTabUMSATZ_GES: TFloatField;
    KFZTabUMSATZ_GAR: TFloatField;
    KFZTabINFO: TBlobField;
    KFZTabWKST_INFO: TBlobField;
    SearchTimer: TTimer;
    N2: TMenuItem;
    Layoutspeichern1: TMenuItem;
    KFZTabSCHL_ZU_2: TStringField;
    KFZTabSCHL_ZU_3: TStringField;
    Ansicht1: TMenuItem;
    ListeTabBtn: TJvSpeedButton;
    HistTabBtn: TJvSpeedButton;
    AlgTabBtn: TJvSpeedButton;
    InfoTabBtn: TJvSpeedButton;
    Label10: TLabel;
    CaoGroupBox1: TOFGroupBox;
    CaoGroupBox2: TOFGroupBox;
    CaoGroupBox3: TOFGroupBox;
    AddrNotiz: TDBMemo;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    Label24: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label29: TLabel;
    Panel1: TPanel;
    SuchGB: TOFGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    kennz: TDBEdit;
    fgstnum: TDBEdit;
    AlgGB: TOFGroupBox;
    Label23: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label26: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label25: TLabel;
    polster: TDBEdit;
    farbe: TDBEdit;
    getriebe: TDBEdit;
    MotorNr: TDBEdit;
    motor: TDBEdit;
    ausfuehr: TDBEdit;
    Typ: TDBEdit;
    kw: TDBEdit;
    ps: TDBEdit;
    Hubraum: TDBEdit;
    KundeGB: TOFGroupBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    KundeEdit: TJvDBComboEdit;
    Panel2: TPanel;
    SchluesselGB: TOFGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    schl2Edi: TDBEdit;
    schl3Edi: TDBEdit;
    scl_nr: TDBEdit;
    kfzbr_nr: TDBEdit;
    zschl_nr: TDBEdit;
    ReifenGB: TOFGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Reifen: TDBEdit;
    ReifenGr: TDBEdit;
    BewDatGb: TOFGroupBox;
    Label19: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    NextAUEdi: TJvDBDateEdit;
    NextTUVEdi: TJvDBDateEdit;
    kmstand: TDBEdit;
    LeBesuchEdi: TJvDBDateEdit;
    UebernahmeBtn: TToolButton;
    CaoGroupBox5: TOFGroupBox;
    Label52: TLabel;
    SuchFeldCB: TComboBox;
    Info1: TMenuItem;
    Historie1: TMenuItem;
    Liste1: TMenuItem;
    Allgemein1: TMenuItem;
    N101: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N5001: TMenuItem;
    alle1: TMenuItem;
    Label30: TLabel;
    baujahr: TDBEdit;
    Zulassungsdatum: TJvDBDateEdit;
    Label32: TLabel;
    SichtbareSpalten1: TMenuItem;
    Label33: TLabel;
    Label34: TLabel;
    JourTabDS: TDataSource;
    JPosTabDS: TDataSource;
    JourTab: TZQuery;
    JourTabCalcEKVK: TStringField;
    JourTabREC_ID: TIntegerField;
    JourTabQUELLE: TIntegerField;
    JourTabVRENUM: TStringField;
    JourTabRDATUM: TDateField;
    JourTabKUN_NAME1: TStringField;
    JourTabADDR_ID: TIntegerField;
    JourTabKFZ_ID: TIntegerField;
    JourTabKM_STAND: TIntegerField;
    JourTabNSUMME: TFloatField;
    JourTabMSUMME: TFloatField;
    JourTabBSUMME: TFloatField;
    JourTabIST_BETRAG: TFloatField;
    JourTabSTADIUM: TIntegerField;
    JourTabPROJEKT: TStringField;
    JourTabORGNUM: TStringField;
    JourTabWAEHRUNG: TStringField;
    JourTabCalcStadium: TStringField;
    JourTabMWST_0: TFloatField;
    JourTabMWST_1: TFloatField;
    JourTabMWST_2: TFloatField;
    JourTabMWST_3: TFloatField;
    JPosTab: TZQuery;
    JPosTabJOURNAL_ID: TIntegerField;
    JPosTabQUELLE: TIntegerField;
    JPosTabARTIKEL_ID: TIntegerField;
    JPosTabADDR_ID: TIntegerField;
    JPosTabVRENUM: TStringField;
    JPosTabMATCHCODE: TStringField;
    JPosTabBARCODE: TStringField;
    JPosTabARTNUM: TStringField;
    JPosTabMENGE: TFloatField;
    JPosTabEPREIS: TFloatField;
    JPosTabRABATT: TFloatField;
    JPosTabSTEUER_PROZ: TFloatField;
    JPosTabBEZEICHNUNG: TMemoField;
    JPosTabSTEUER_CODE: TIntegerField;
    Panel8: TPanel;
    ToolBar99: TToolBar;
    Label60: TLabel;
    JahrCB: TComboBox;
    ToolButton5: TToolButton;
    OPOSViewBtn: TSpeedButton;
    ToolButton1: TToolButton;
    ArtikelViewBtn: TSpeedButton;
    CaoGroupBox6: TOFGroupBox;
    JourPosGrid: TOFDBGrid;
    RxSplitter1: TJvxSplitter;
    JournalGrid: TOFDBGrid;
    SumQuery: TZQuery;
    HistSumBar: TStatusBar;
    HistArtikelSB: TStatusBar;
    Label35: TLabel;
    NextSP: TJvDBDateEdit;
    Label36: TLabel;
    NextTP: TJvDBDateEdit;
    KFZTabNAE_SP: TDateField;
    KFZTabNAE_TP: TDateField;
    SB1: TStatusBar;
    KFZTabANREDE: TStringField;
    KFZTabNAME1: TStringField;
    KFZTabNAME3: TStringField;
    KFZTabSTRASSE: TStringField;
    KFZTabPLZ: TStringField;
    KFZTabORT: TStringField;
    KFZTabLAND: TStringField;
    KFZUpdateSql: TZUpdateSql;
    KFZTabNAME2: TStringField;
    MnuPrint: TMenuItem;
    MnuPrintKFZ: TMenuItem;
    MnuPrintKFZListe: TMenuItem;
    KFZGruppe: TLabel;
    Kfzgr_CB: TDBLookupComboBox;
    Kfzgr: TDBEdit;
    procedure KFZ_PCChange(Sender: TObject);
    procedure LiefNummer1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KFZTabAfterScroll(DataSet: TDataSet);
    procedure SuchbegChange(Sender: TObject);
    procedure KFZ_GRDTitleClick(Column: TColumn);
    procedure SearchTimerTimer(Sender: TObject);
    procedure kennzKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure kennzKeyPress(Sender: TObject; var Key: Char);
    procedure AlgTabBtnClick(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure KundeEditButtonClick(Sender: TObject);
    procedure LeBesuchEdiEnter(Sender: TObject);
    procedure LeBesuchEdiExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure alle1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure SuchbegKeyPress(Sender: TObject; var Key: Char);
    procedure KFZ_DSDataChange(Sender: TObject; Field: TField);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure UebernahmeBtnClick(Sender: TObject);
    procedure JourTabAfterOpen(DataSet: TDataSet);
    procedure JourTabCalcFields(DataSet: TDataSet);
    procedure JPosTabCalcFields(DataSet: TDataSet);
    procedure JahrCBChange(Sender: TObject);
    procedure AlgTabBtnMouseEnter(Sender: TObject);
    procedure AlgTabBtnMouseLeave(Sender: TObject);
    procedure KFZTabBeforeDelete(DataSet: TDataSet);
    procedure kwChange(Sender: TObject);
    procedure psChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KFZTabUpdateRecord(DataSet: TDataSet;
    UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure MnuPrintKFZClick(Sender: TObject);
    procedure MnuPrintKFZListeClick(Sender: TObject);
  private
    { Private-Deklarationen }
    jour_mwst_tab: array[0..3] of double;
    searchtime : Integer;
    Limit      : Integer;
    sortname   : string;
    SortField  : String;
    SuchBegr   : String;
    aktsort    : Integer;
    QueryTime  : DWord;
    LastID     : Integer;
    InChange   : Boolean;
    
    procedure SetSort(Sort: Integer);
    procedure UpdateQuery;
    procedure UpdateStatus;
    procedure Update_JournalArtikel (JOUR_ID: Integer);
    procedure UpdateHistory;
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    First     : Boolean;
    Uebern    : Boolean;
    
    OnUpdateStatusBar: TOnUpdateStatusBar;
  end;

var
  KFZForm: TKFZForm;

implementation

uses
  GNUGetText,
  OF_DM, OF_Tool1, OF_Function, OF_Progress,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Main, OF_KUNDE, OF_DBGrid_Layout;

{$R *.DFM}

Const
  ModulID: Integer = 1030;

//------------------------------------------------------------------------------
procedure TKFZForm.FormCreate(Sender: TObject);
var 
  i: integer; ja, mo, ta: word;
begin
  try
    TranslateComponent (self);
  except 
  end;

  OnUpdateStatusBar := nil;
  Uebern  := False;
  Scaled  := TRUE;
  First   := True;
  SetSort(2);
  Limit   := 50;
  LastID  := -1;
  InChange := False;
  KFZToolBar.Images := MainForm.ImageList1;
  SuchBeg.Height := 21;

  JahrCB.Items.Clear;
  JahrCB.Items.Add(_('alles'));
  decodedate (now, ja, mo, ta);
  for i := 1993 to ja do 
    JahrCB.Items.Add(inttostr(i));
  JahrCB.Itemindex := Ja - 1993 + 1; // aktuelles Jahr

  SuchFeldCB.ItemIndex := 0;

  ListeTabBtn.Align      := alRight;
  HistTabBtn.Align       := alRight;
  InfoTabBtn.Align       := alRight;
  AlgTabBtn.Align        := alRight;

  ListeTabBtn.Font.Color := clwhite;
  HistTabBtn.Font.Color  := clwhite;
  InfoTabBtn.Font.Color  := clwhite;
  AlgTabBtn.Font.Color   := clwhite;

  AlgTabBtn.Font.Style   := [fsBold];

  if kfz_pc.PageCount > 0 then
    for i := 0 to kfz_pc.PageCount-1 do
      kfz_pc.Pages[i].TabVisible := False;

end;

//------------------------------------------------------------------------------
procedure TKFZForm.FormActivate(Sender: TObject);
var 
  ID: Integer;
begin
  ID := LastID;
  if First then
  begin
    LastID := -1;
    ID := -1;
    KFZ_PC.ActivePage   := KFZ_PC.Pages[0];
    KFZ_PCChange (Sender);

    KFZ_GRD.RowColor1      := DM1.C2Color;
    JournalGrid.RowColor1  := DM1.C2Color;
    JourPosGrid.RowColor1  := DM1.C2Color;

    KFZ_GRD.EditColor      := DM1.EditColor;
    JournalGrid.EditColor  := DM1.EditColor;
    JourPosGrid.EditColor  := DM1.EditColor;

    KFZ_PC.HintColor := Application.HintColor;

    First := False;
    SB1.SimplePanel := True;
    SB1.SimpleText := _('Lade Benutzereinstellungen ...');

    Limit := DM1.ReadIntegerU ('', 'KFZ_TREFFER', 50);
    case Limit of
      10: N101.Checked := True;
      50: N501.Checked := True;
      100: N1001.Checked := True;
      200: N2001.Checked := True;
      500: N5001.Checked := True;
      999999999: alle1.Checked := True;
    end;

    dm1.GridLoadLayout (tDBGrid(KFZ_GRD), 'KFZ_LISTE', 102);
    dm1.GridLoadLayout (tDBGrid(JournalGrid), 'KFZ_HISTORY_KOPF', 101);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'KFZ_HISTORY_POS', 101);
    SetSort (aktsort);

    SB1.SimplePanel := False;
    SB1.SimpleText := '';
    SB1.Invalidate;
  end;
  Uebern := False;
  DM1.KFZGrTab.Open;
  UpdateQuery;

  if ID > 0 then 
    KFZTab.Locate ('KFZ_ID', ID, []);

  try
    {
    case KFZ_PC.ActivePage.Tag of
    1: kennz.setfocus;
    2: AddrNotiz.setfocus;
    3: JournalGrid.SetFocus;
    4: KFZ_GRD.SetFocus;
    end;
    }
    Suchbeg.SetFocus;
  except 
  end;

  KFZ_PCChange(Sender);

  if Suchbeg.CanFocus then 
    Suchbeg.SetFocus;

  //Funktionen je nach Berechtigung aktivieren
  MnuPrint.Enabled := DM1.CaoSecurity.CanPrint  (ModulID, 0);
end;              

//------------------------------------------------------------------------------
procedure TKFZForm.FormDeactivate(Sender: TObject);
begin
  if (not (KFZPanel.Parent is tForm)) and 
     (KFZPanel.Parent.Parent is tForm) and
     (assigned(tForm(KFZPanel.Parent.Parent).ActiveControl)) then 
  begin
    tDBEdit(tForm(KFZPanel.Parent.Parent).ActiveControl).Color := clWindow;
  end;

  if Uebern then 
    exit;

  KFZTab.Close;
  DM1.KFZGrTab.Close;
  JourTab.Close;
  JPosTab.Close;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 680;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 560;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.KFZ_PCChange(Sender: TObject);
begin
  SichtbareSpalten1.Enabled := KFZ_PC.ActivePage = List_TS;

  ListeTabBtn.Font.Style := [];
  HistTabBtn.Font.Style  := [];
  InfoTabBtn.Font.Style  := [];
  AlgTabBtn.Font.Style   := [];

  case KFZ_PC.ActivePageIndex of
    0: begin 
      AlgTabBtn.Font.Style   := [fsBold]; 
      Allgemein1.Checked := True; 
    end;
    1: begin 
      InfoTabBtn.Font.Style  := [fsBold]; 
      Info1.Checked := True;      
    end;
    2: begin 
      HistTabBtn.Font.Style  := [fsBold]; 
      Historie1.Checked := True;  
    end;
    3: begin 
      ListeTabBtn.Font.Style := [fsBold]; 
      Liste1.Checked := True;     
    end;
  end;

  if KFZ_PC.ActivePage = Hist_TS then
  begin
    Screen.Cursor := crSqlWait;
    try
      UpdateHistory;
    finally
      Screen.Cursor := crDefault;
    end;
  end else
  begin
    if JPosTab.Active then 
      JPosTab.Close;
    if JourTab.Active then 
      JourTab.Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.SetSort (Sort: Integer);
begin
  if sort = aktsort then
    exit;
  if sort < 0 then
    sort := aktsort;

  case sort of
    1: begin
      sortfield := 'POL_KENNZ';
      sortname := _('Kennzeichen');
    end;
    2: begin
      sortfield := 'FGST_NUM';
      sortname := _('FGST-Nr.');
    end;
    3: begin
      sortfield := 'ADDR_ID';
      sortname := _('Kundennummer');
    end;
  end;
  UpdateStatus;
  AktSort := Sort;

  if not first then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.UpdateQuery;
var 
  LastTime: DWord;
begin
  LastTime := GetTickCount;

  if kfztab.active then 
    kfztab.close;
  kfztab.sql.clear;
  kfztab.SQL.Add ('select KFZ.*, AD.ANREDE, AD.NAME1, AD.NAME2, AD.NAME3, ' +
    'AD.STRASSE, AD.PLZ, AD.ORT, AD.LAND ' +
    'from KFZ ' +
    'left outer join ADRESSEN as AD on KFZ.ADDR_ID=AD.REC_ID');

  if SuchBegr <> '' then
  begin
    kfztab.SQL.Add (' where ');
    Suchbegr := sqlStringToSql(SuchBegr);
    case SuchFeldCB.ItemIndex of
      0: begin
        kfztab.SQL.Add ('(' + DM1.GetSearchSQL (['KFZ.POL_KENNZ'], SuchBegr) + ')');
      end;
      1: begin
        kfztab.SQL.Add ('(' + DM1.GetSearchSQL (['KFZ.FGST_NUM'], SuchBegr) + ')');
      end;
      2: begin
        kfztab.SQL.Add ('(' + DM1.GetSearchSQL (['AD.KUNNUM1', 'AD.KUNNUM2'], SuchBegr) + ')');
      end;
      3: begin
        kfztab.SQL.Add ('(' + DM1.GetSearchSQL (['AD.NAME1', 'AD.NAME2', 'AD.NAME3'], SuchBegr) + ')');
      end;
    end;
  end;
  kfztab.SQL.Add ('order by ' + SortField);
  kfztab.SQL.Add ('LIMIT 0,' + Inttostr(limit));
  Screen.Cursor := crSQLWait;
  try
    kfztab.Open;
  finally
    Screen.Cursor := crDefault;
  end;
  QueryTime := GetTickCount - LastTime;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.LiefNummer1Click(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 6) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;                                                            

//------------------------------------------------------------------------------
procedure TKFZForm.KFZTabAfterScroll(DataSet: TDataSet);
begin
  ProgressForm.Stop;

  if LastID = KFZTabKFZ_ID.Value then 
    exit;

  UpdateStatus;
  LastID := KFZTabKFZ_ID.Value;

  if KFZ_PC.ActivePage = Hist_TS then
  begin
    Screen.Cursor := crSQLWait;
    try
      UpdateHistory;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.SuchbegChange(Sender: TObject);
begin
  searchtime := 15;
  searchtimer.enabled := true;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.KFZ_GRDTitleClick(Column: TColumn);
begin
  case Column.Index of
    {kennz}   0: SetSort (1);
    {fgst}    1: SetSort (2);
  end;
end;
//------------------------------------------------------------------------------
procedure TKFZForm.SearchTimerTimer(Sender: TObject);
begin
  if searchtime > 0 then 
    dec (searchtime) 
  else
  begin
    searchtimer.enabled := false;
    SuchBegr := Suchbeg.Text;

    // führende Leerzeichen entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[1] = ' ') do 
      delete (Suchbegr, 1, 1);
    // Leerzeichen am ende Entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[length(Suchbegr)] = ' ') do 
      delete (Suchbegr, length(SuchBegr), 1);

    UpdateQuery;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKFZForm.kennzKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    KFZTab.Prior;
    key := 0;
  end else
  if (Shift = []) and (key = 34) then // PGDOWN
  begin
    KFZTab.Next;
    key := 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.kennzKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if uppercase(tControl(Sender).Name) = 'LEBESUCHEDI' then 
      kennz.SetFocus
    else
      if KFZPanel.Parent is tForm then 
        SendMessage (KFZPanel.Parent.Handle, WM_NEXTDLGCTL, 0, 0)
      else 
        SendMessage (KFZPanel.Parent.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.AlgTabBtnClick(Sender: TObject);
begin
  if Sender is TMenuItem then
    KFZ_PC.ActivePage := KFZ_PC.Pages[TMenuItem(Sender).Tag-1]
  else
    KFZ_PC.ActivePage := KFZ_PC.Pages[TSpeedButton(Sender).Tag-1];

  KFZ_PCChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TKFZForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout(TDBGrid(KFZ_GRD), 'KFZ_LISTE', 102);
  dm1.GridLoadLayout(TDBGrid(JournalGrid), 'KFZ_HISTORY_KOPF', 101);
  dm1.GridLoadLayout(TDBGrid(JourPosGrid), 'KFZ_HISTORY_POS', 101);
end;

//------------------------------------------------------------------------------
procedure TKFZForm.KundeEditButtonClick(Sender: TObject);
var 
  AdressForm: TAdressForm;
begin
  AdressForm := TAdressForm.Create (self);
  try
    AdressForm.BorderStyle := bsSizeable;
    AdressForm.Height := 555;
    AdressForm.Width := 660;
    AdressForm.UebernahmeBtn.Visible := True;
    AdressForm.uebernehmen1.Visible := True;
    AdressForm.Button1.Cancel := True;
    AdressForm.Invalidate;
    AdressForm.ShowModal;
    if AdressForm.Uebern then
    begin // Adresse in Rechnung überbnehmen
      if not (KFZTab.State in [dsEdit, dsInsert]) then 
        KFZTab.Edit;
      KFZTabADDR_ID.Value := AdressForm.KSQueryRec_ID.Value;

      try
        KFZTab.Post;
        KFZTab.Refresh;
      except
        KFZTab.Cancel;
      end;
    end;
  finally
    AdressForm.Free;
    //AdressForm :=nil;
  end;
end;    

//------------------------------------------------------------------------------
procedure TKFZForm.LeBesuchEdiEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor; //$009FFF9;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.LeBesuchEdiExit(Sender: TObject);
begin
  tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure tKFZForm.UpdateStatus;
var
  SuchZeit,
  Datensatz,
  Sortierung,
  Erstellt,
  Geaendert: String;
begin
  if not KFZTab.Active then  //18.10.09-ud.
    exit;

  Sortierung := _('Sortierung : ') + sortname;
  SuchZeit   := FormatFloat ('0.00', (QueryTime) / 1000) + ' ' + _('Sek.');
  Erstellt   := '';
  Geaendert  := '';

  if KFZTab.RecordCount = 0 then
    Datensatz := _('keine')
  else
    if KFZTab.RecordCount = Limit then
      Datensatz := inttostr(KFZTab.RecNo) + ' ' + _('von') + ' >=' + inttostr (KFZTab.RecordCount)
    else
      Datensatz := inttostr(KFZTab.RecNo) + ' ' + _('von') + ' ' + inttostr (KFZTab.RecordCount);

  if assigned(OnUpdateStatusBar) then
  begin
    SB1.Visible := False;
    OnUpdateStatusBar(
      SuchZeit,
      Datensatz,
      Sortierung,
      Erstellt,
      Geaendert
    );
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
procedure TKFZForm.Aktualisieren1Click(Sender: TObject);
begin
  KFZTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.alle1Click(Sender: TObject);
begin
  Limit := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
  DM1.WriteIntegerU ('', 'KFZ_TREFFER', Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.Suchen1Click(Sender: TObject);
begin
  try
    Suchbeg.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.SuchbegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    try
      if KFZ_PC.ActivePage = Allg_TS  then kennz.SetFocus        else
      if KFZ_PC.ActivePage = Notiz_TS then AddrNotiz.SetFocus    else
      if KFZ_PC.ActivePage = Hist_TS  then JournalGrid.SetFocus  else
      if KFZ_PC.ActivePage = List_TS  then KFZ_GRD.SetFocus;
    except 
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.KFZ_DSDataChange(Sender: TObject; Field: TField);
begin
  if KFZTabKFZ_ID.Value <> LastID then 
    KFZTabAfterScroll (nil);
end;

//------------------------------------------------------------------------------
procedure TKFZForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(KFZ_GRD));
end;

//------------------------------------------------------------------------------
procedure TKFZForm.UebernahmeBtnClick(Sender: TObject);
begin
  if KFZTab.State in [dsEdit, dsInsert] then 
    KFZTab.Post;
  Uebern := True;
  Close;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.JourTabAfterOpen(DataSet: TDataSet);
var 
  w: string;
begin
  Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

  jour_mwst_tab[0] := JourTabMwst_0.Value;
  jour_mwst_tab[1] := JourTabMwst_1.Value;
  jour_mwst_tab[2] := JourTabMwst_2.Value;
  jour_mwst_tab[3] := JourTabMwst_3.Value;

  w := JourTabWAEHRUNG.Value;
  JPosTabEPREIS.DisplayFormat := ',###,##0.00 "' + w + '";-,###,##0.00 "' + w + '"; ';
end;

//------------------------------------------------------------------------------
procedure TKFZForm.JourTabCalcFields(DataSet: TDataSet);
var 
  Quelle: String;
begin
  JourTabCalcStadium.Value := GetRechStatus (JourTabStadium.AsInteger, JourTabquelle.Value);

  case JourTabquelle.Value of
    1: Quelle := _('Angebot');
    3: Quelle := _('Verkauf');
    5: Quelle := _('Einkauf');

    else  Quelle := '??? [' + inttostr(JourTabQuelle.Value) + ']';
  end;

  JourTabCalcEKVK.Value    := Quelle;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.JPosTabCalcFields(DataSet: TDataSet);
begin
  if (JPosTabSteuer_Code.Value >= 0) and (JPosTabSteuer_Code.Value <= 3) then 
    JPosTabSteuer_Proz.Value := Jour_MwSt_Tab[JPosTabSteuer_Code.Value]
  else 
    JPosTabSteuer_Proz.Value := 0;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.Update_JournalArtikel (JOUR_ID: Integer);
begin
  if ArtikelViewBtn.Down then
  begin
    if JPosTab.Active then 
      JPosTab.Close;

    JPosTab.Sql.Clear;
    JPosTab.SQL.Add ('select JOURNAL_ID,QUELLE,ARTIKEL_ID,ADDR_ID,VRENUM,');
    JPosTab.SQL.Add ('BEZEICHNUNG,MATCHCODE,ARTNUM,BARCODE,MENGE,');
    JPosTab.SQL.Add ('EPREIS,RABATT,STEUER_CODE from JOURNALPOS');
    JPosTab.SQL.Add ('where JOURNAL_ID = ' + inttostr(JOUR_ID));
    JPosTab.SQL.Add ('order by POSITION');

    if not JPosTab.Active then 
      JPosTab.Open;
  end else 
  if JPosTab.Active then 
    JPosTab.Close;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.UpdateHistory;
var 
  VJahr : Integer;
  BJahr : Integer;
  OPOS  : Boolean;
  OPSUM, BEZSUM: Double;
begin
  screen.cursor := crsqlwait;

  JourPosGrid.Visible := ArtikelViewBtn.Down;
  RxSplitter1.Visible := ArtikelViewBtn.Down;
  if ArtikelViewBtn.Down then 
    RxSplitter1.Top := JourPosGrid.Top-1;
  try
    HistSumBar.Visible    := False;
    HistArtikelSB.Visible := False;

    if JPosTab.Active then 
      JPosTab.Close;
    if JourTab.Active then 
      JourTab.Close;


    if JahrCB.ItemIndex = 0 then 
    begin 
      vjahr := 1900; 
      bjahr := 2300; 
    end else 
    begin 
      vjahr := 1992 + JahrCB.ItemIndex;
      bjahr := 1992 + JahrCB.Itemindex;
    end;

    OPOS := OPOSViewBtn.Down;

    JourTab.Sql.Clear;
    JourTab.SQL.Add ('select KFZ_ID,REC_ID,QUELLE,VRENUM,RDATUM,KUN_NAME1,');
    JourTab.SQL.Add ('ADDR_ID,KFZ_ID,KM_STAND,NSUMME,MSUMME,BSUMME,');
    JourTab.SQL.Add ('IST_BETRAG,STADIUM,PROJEKT,ORGNUM,WAEHRUNG,');
    JourTab.SQL.Add ('MWST_0,MWST_1,MWST_2,MWST_3');
    JourTab.SQL.Add ('from JOURNAL');
    JourTab.SQL.Add ('where KFZ_ID=' + inttostr(KFZTabKFZ_ID.Value) +
      ' and YEAR(VRENUM) BETWEEN ' + inttostr(vjahr) +
      ' and ' + inttostr(bjahr));
    JourTab.SQL.Add (' and QUELLE in (3,5)');
    if OPOS  then 
      JourTab.SQL.Add ('and STADIUM BETWEEN 19 and 80');

    if not JourTab.Active then 
      JourTab.Open;

    if SumQuery.Active then 
      SumQuery.Close;
    SumQuery.Sql.Clear;
    SumQuery.SQL.Add ('select STADIUM,SUM(NSUMME) AS NSUM,SUM(MSUMME) AS MSUM,');
    SumQuery.SQL.Add ('SUM(BSUMME) AS BSUM,WAEHRUNG');
    SumQuery.SQL.Add ('from JOURNAL');
    SumQuery.SQL.Add ('where KFZ_ID=' + inttostr (KFZTabKFZ_ID.Value));
    SumQuery.SQL.Add ('and YEAR(VRENUM) BETWEEN ' + inttostr (vjahr) +
    ' and ' + inttostr (bjahr));
    SumQuery.SQL.Add ('and QUELLE in (3,5)');
    SumQuery.SQL.Add ('group by STADIUM');

    SumQuery.Open;

    OPSUM  := 0;
    BEZSUM := 0;

    while not SumQuery.eof do
    begin
      case SumQuery.FieldByName ('STADIUM').AsInteger of
        80..99: if SumQuery.FieldByName('WAEHRUNG').Value<>dm1.LeitWaehrung then 
                  BEZSUM := BEZSUM + DM1.CalcLeitWaehrung(SumQuery.FieldByName('BSUM').AsFloat, SumQuery.FieldByName('WAEHRUNG').Value)
                else 
                  BEZSUM := BEZSUM + SumQuery.FieldByName('BSUM').AsFloat;
        20..79: if SumQuery.FieldByName('WAEHRUNG').Value<>dm1.LeitWaehrung then 
                  OPSUM  := OPSUM  + SumQuery.FieldByName('BSUM').AsFloat
                else 
                  OPSUM  := OPSUM  + DM1.CalcLeitWaehrung(SumQuery.FieldByName('BSUM').AsFloat, SumQuery.FieldByName('WAEHRUNG').Value);
      end;
      sumquery.next;
    end;
    SumQuery.Close;

    if opos then
    begin
      HistArtikelSB.Panels[0].Text := _('Summe d. off. Posten : ');
      HistArtikelSB.Panels[1].Text := FormatFloat (',##0.00', OPSUM) + ' ' + dm1.Leitwaehrung;
      HistArtikelSB.Panels[2].Text := _('alle Preise BRUTTO !!!');
      HistArtikelSB.Visible := true;
      if JourPosGrid.Visible then 
        HistArtikelSB.Top := JourPosGrid.Top + JourPosGrid.Height + 1;
    end else
    begin
      HistSumBar.Panels[1].Text := FormatFloat (',##0.00', OPSUM)       + ' ' + dm1.Leitwaehrung;
      HistSumBar.Panels[3].Text := FormatFloat (',##0.00', BEZSUM)      + ' ' + dm1.Leitwaehrung;
      HistSumBar.Panels[5].Text := FormatFloat (',##0.00', OPSUM + BEZSUM) + ' ' + dm1.Leitwaehrung;
      HistSumBar.Panels[6].Text := _('alle Preise BRUTTO !!!');
      HistSumBar.Visible := True;

      if JourPosGrid.Visible then 
        HistSumBar.Top := JourPosGrid.Top + JourPosGrid.Height + 1;
    end;

    Update_JournalArtikel (JourTab.FieldByName ('REC_ID').AsInteger);

    //if DM1.JPosTab.Active then DM1.JPosTab.Close;
    //if DM1.JourTab.Active then DM1.JourTab.Close;

  finally
    screen.cursor := crdefault;
  end;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.JahrCBChange(Sender: TObject);
begin
  UpdateHistory;
end;

//------------------------------------------------------------------------------
procedure TKFZForm.AlgTabBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                               

//------------------------------------------------------------------------------
procedure TKFZForm.AlgTabBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;   

//------------------------------------------------------------------------------
procedure TKFZForm.KFZTabBeforeDelete(DataSet: TDataSet);
begin
  if messagedlg (_('Wollen Sie dieses Fahrzeug wirklich löschen ?'),
       mtconfirmation, [mbyes, mbno], 0) <> mryes then 
  begin
    Abort;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKFZForm.kwChange(Sender: TObject);
begin
  if InChange then 
    exit;
  InChange := True;
  try
    if length(kw.text) > 0 then 
      KFZTabPS.AsInteger := Round(StrToInt (kw.text) * 1.35962)
    else 
      KFZTabPS.AsInteger := 0;
  finally
    InChange := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKFZForm.psChange(Sender: TObject);
begin
  if InChange then 
    exit;
  InChange := True;
  try
    if length(ps.text) > 0 then 
      KFZTabKW.AsInteger := Round(StrToInt (ps.text) * 0.735499)
    else 
      KFZTabKW.AsInteger := 0;
  finally
    InChange := False;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKFZForm.FormShow(Sender: TObject);
begin
  MainForm.XPMenu1.InitComponent (Self);
end;

//------------------------------------------------------------------------------
procedure TKFZForm.KFZTabUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var 
  i: integer; 
  first: boolean; 
  SQL: tStrings;
begin
  if UpdateKind in [ukModify, ukInsert] then
  begin
    // SQL bestücken

    case UpdateKind of
      ukModify: SQL := KFZUpdateSQL.ModifySql;
      ukInsert: SQL := KFZUpdateSQL.InsertSql;
    end;

    First := True;

    SQL.Clear;

    if UpdateKind = ukModify
    then SQL.Add ('UPDATE KFZ SET')
    else SQL.Add ('INSERT INTO KFZ SET');

    for i := 0 to DataSet.FieldCount-1 do
    begin
      if (DataSet.Fields[i].CanModify) and (not DataSet.Fields[i].Calculated) and
      ((DataSet.Fields[i].CurValue<>DataSet.Fields[i].OldValue) or
      (
      (DataSet.Fields[i].IsBlob) and
      (tBlobField(DataSet.Fields[i]).Modified)
      ) or
      (
      (UpdateKind = ukInsert) and
      (DataSet.Fields[i].FieldName<>'REC_ID') //and
      //(DataSet.Fields[i].FieldName<>'MENGE_BESTELLT')
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
      SQL.Add ('where KFZ_ID=:KFZ_ID');
    if First then
    begin
      SQL.Clear;
      UpdateAction := uaAbort;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKFZForm.MnuPrintKFZClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //30.10.09-ud.
  //PrintRechForm.ShowKFZDlg(KFZTabKFZ_ID.AsInteger, KFZTabADDR_ID.AsInteger, False);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TKFZForm.MnuPrintKFZListeClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  //30.10.09-ud.
  //PrintRechForm.ShowKFZListeDlg(KFZTab.Sql.Text, False);
  {$ENDIF}
end;

//------------------------------------------------------------------------------

end.

// Umrechnung KW -> PS  1 KW = 1,35962, 1 PS = 0,735499 KW

