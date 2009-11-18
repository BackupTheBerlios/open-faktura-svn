{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : [[ add description here! ]]                                       }
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
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Adressbuch;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, ZDataset, ZSqlUpdate, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, OFSecurity, Menus, JvMenus, ImgList,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, JvToolEdit, JvDBControls,
  VolDBEdit, JvExMask, Mask, DBCtrls, JvLabel, StdCtrls, OFGroupBox, ComCtrls,
  JvExComCtrls, JvComCtrls, JvExControls, JvComponent, JvSpeedButton,
  ToolWin;
(*
  {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF}
  OF_Var_Const;
*)

//  {$IFDEF COMPILER_D6_UP}Variants, {$ENDIF}//JclDebug,
type
  TAdressBuchForm = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    MainMenu1: TJvMainMenu;
    Adresse1: TMenuItem;
    Neu1: TMenuItem;
    Loeschen1: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    N2: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    N7: TMenuItem;
    uebernehmen1: TMenuItem;
    Sortierung1: TMenuItem;
    Match1: TMenuItem;
    Name11: TMenuItem;
    PLZOrt1: TMenuItem;
    Kundennummer1: TMenuItem;
    LiefNummer1: TMenuItem;
    Ansicht1: TMenuItem;
    Allgemein1: TMenuItem;
    Ansprechpartner1: TMenuItem;
    Liste1: TMenuItem;
    N4: TMenuItem;
    Treffer1: TMenuItem;
    N101: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N5001: TMenuItem;
    alle1: TMenuItem;
    N3: TMenuItem;
    Aktualisieren1: TMenuItem;
    KSQuery: TOFZQuery;
    KSQueryREC_ID: TIntegerField;
    KSQueryKUNDENGRUPPE: TIntegerField;
    KSQueryMATCHCODE: TStringField;
    KSQueryANREDE: TStringField;
    KSQueryNAME1: TStringField;
    KSQueryNAME2: TStringField;
    KSQueryNAME3: TStringField;
    KSQueryABTEILUNG: TStringField;
    KSQuerySTRASSE: TStringField;
    KSQueryPLZ: TStringField;
    KSQueryORT: TStringField;
    KSQueryKUNNUM1: TStringField;
    KSQueryKUNNUM2: TStringField;
    KSQueryTELE1: TStringField;
    KSQueryTELE2: TStringField;
    KSQueryFAX: TStringField;
    KSQueryFUNK: TStringField;
    KSQueryLAND: TStringField;
    KSQueryPOSTFACH: TStringField;
    KSQueryPF_PLZ: TStringField;
    KSQueryEMAIL: TStringField;
    KSQueryEMAIL2: TStringField;
    KSQueryINTERNET: TStringField;
    KSQueryDIVERSES: TStringField;
    KSQueryINFO: TBlobField;
    KSQueryERSTELLT: TDateField;
    KSQueryERST_NAME: TStringField;
    KSQueryGEAEND: TDateField;
    KSQueryGEAEND_NAME: TStringField;
    KSQueryKUN_GEBDATUM: TDateField;
    KS_DS: TDataSource;
    KSQuerySHOP_ID: TIntegerField;
    SearchTimer: TTimer;
    KSQueryPR_EBENE: TIntegerField;
    KSQueryWAEHRUNG: TStringField;
    AddrUpdSQL: TZUpdateSql;
    KSQuerySHOP_CHANGE_FLAG: TIntegerField;
    APTab: TZQuery;
    APDS: TDataSource;
    Datei1: TMenuItem;
    Schlieen1: TMenuItem;
    MainPanel: TPanel;
    KunToolbar: TToolBar;
    DBNavigator3: TDBNavigator;
    Label29: TLabel;
    SuchFeldCB: TComboBox;
    Label35: TLabel;
    SuchBeg: TEdit;
    ToolButton6: TToolButton;
    UebernahmeBtn: TToolButton;
    SB1: TStatusBar;
    Panel3: TPanel;
    AllgBtn: TJvSpeedButton;
    ListeBtn: TJvSpeedButton;
    ASPBtn: TJvSpeedButton;
    ADDR_PC: TJvPageControl;
    Allg_TS: TTabSheet;
    InfoGB: TOFGroupBox;
    InfoMemo: TDBMemo;
    Panel1: TPanel;
    KunAlgLeftPan: TPanel;
    AnschriftGB: TOFGroupBox;
    LandPLZPostfLab: TLabel;
    LandPLZOrtLab: TLabel;
    StrasseLab: TLabel;
    AbteilungLab: TLabel;
    Name3Lab: TLabel;
    Name2Lab: TLabel;
    Name1Lab: TJvLabel;
    Label3: TLabel;
    name1: TDBEdit;
    name2: TDBEdit;
    name3: TDBEdit;
    abteilung: TDBEdit;
    strasse: TDBEdit;
    Ort: TJvDBComboEdit;
    Postfach: TJvDBComboEdit;
    PF_PLZ: TJvDBComboEdit;
    PLZ: TJvDBComboEdit;
    Land: TDBEdit;
    PF_Land: TDBEdit;
    Anrede: TVolgaDBEdit;
    SuchbegrGB: TOFGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label36: TLabel;
    KunNum1Edit: TDBEdit;
    DBEdit3: TDBEdit;
    match: TDBEdit;
    KunAlgRightPan: TPanel;
    KommunikationGB: TOFGroupBox;
    TelefonLab: TLabel;
    Telefon2Lab: TLabel;
    TelefaxLab: TLabel;
    MobilfunkLab: TLabel;
    EmailLab: TLabel;
    InternetLab: TLabel;
    DiversesLab: TLabel;
    EMail2Lab: TLabel;
    tele1: TJvDBComboEdit;
    tele2: TJvDBComboEdit;
    fax: TDBEdit;
    email: TJvDBComboEdit;
    internet: TJvDBComboEdit;
    divers1: TDBEdit;
    funk: TJvDBComboEdit;
    email2: TJvDBComboEdit;
    DatumGB: TOFGroupBox;
    GebdatToOutlookLabel: TJvLabel;
    GebDat: TJvDBDateEdit;
    ASP_TS: TTabSheet;
    Panel5: TPanel;
    AspAlgGB: TOFGroupBox;
    Label46: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label23: TLabel;
    Label48: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    APName: TDBEdit;
    APVorname: TDBEdit;
    APFunktion: TDBEdit;
    APInfo: TDBMemo;
    APStrasse: TDBEdit;
    APLand: TDBEdit;
    APPLZ: TJvDBComboEdit;
    APOrt: TJvDBComboEdit;
    APAnrede: TVolgaDBEdit;
    Panel10: TPanel;
    AspKommGB: TOFGroupBox;
    ASPTelefonLab: TLabel;
    ASPTelPrivLab: TLabel;
    ASPFaxLab: TLabel;
    ASPMobilLab: TLabel;
    ASPEmailLab: TLabel;
    ASPGebDatumLab: TJvLabel;
    ASPEmail2Lab: TLabel;
    APTelefax: TDBEdit;
    APemail: TJvDBComboEdit;
    APGebDatum: TJvDBDateEdit;
    APEmail2: TJvDBComboEdit;
    APTelefon: TJvDBComboEdit;
    APTelPriv: TJvDBComboEdit;
    APMobilfunk: TJvDBComboEdit;
    CaoGroupBox9: TOFGroupBox;
    DBNavigator1: TDBNavigator;
    CaoGroupBox3: TOFGroupBox;
    ASPGrid: TOFDBGrid;
    AddrTopGB: TOFGroupBox;
    Label55: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    Such_TS: TTabSheet;
    KunSuchGrid: TOFDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllgBtnMouseEnter(Sender: TObject);
    procedure AllgBtnMouseLeave(Sender: TObject);
    procedure ADDR_PCChange(Sender: TObject);
    procedure AllgBtnClick(Sender: TObject);
    procedure KunSuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchFeldCBChange(Sender: TObject);
    procedure MnuAnichtTrefferClick(Sender: TObject);
    procedure MnuSortierungClick(Sender: TObject);
    procedure SuchBegKeyPress(Sender: TObject; var Key: Char);
    procedure matchEnter(Sender: TObject);
    procedure matchExit(Sender: TObject);
    procedure KSQueryBeforeDelete(DataSet: TDataSet);
    procedure matchKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure matchKeyPress(Sender: TObject; var Key: Char);
    procedure SearchTimerTimer(Sender: TObject);
    procedure KSQueryAfterScroll(DataSet: TDataSet);
    procedure KSQueryBeforeInsert(DataSet: TDataSet);
    procedure KSQueryBeforePost(DataSet: TDataSet);
    procedure KSQueryNewRecord(DataSet: TDataSet);
    procedure KSQueryUpdateRecord(DataSet: TDataSet;
    UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure Neu1Click(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure APTabBeforeDelete(DataSet: TDataSet);
    procedure APTabBeforeEdit(DataSet: TDataSet);
    procedure APTabBeforePost(DataSet: TDataSet);
    procedure APTabNewRecord(DataSet: TDataSet);
    procedure UebernahmeBtnClick(Sender: TObject);
    procedure Schlieen1Click(Sender: TObject);
    //procedure KSQueryLockError(Error: Integer); //05.10.09-ud. raus...
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
    searchtime: Integer;
    querytime : Integer;
    Limit     : Integer;
    sortname  : string;
    sortfield : String;
    SuchBegr  : String;
    SuchFeldID: Integer;
    aktsort   : integer;
    InUpdate  : Boolean;
    LastID    : Integer;   
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);  message WM_GETMINMAXINFO;
    procedure SetSort (Sort: Integer);
    procedure UpdateQuery;
    procedure UpdateStatus;
    
  public
    { Public-Deklarationen }
    first     : boolean;
    Uebern    : Boolean;
    
    OnUpdateStatusBar: TOnUpdateStatusBar;
    
    procedure SearchKunnum (SearchNum: String; Modal: Boolean);
  end;
    
var
  AdressBuchForm: TAdressBuchForm;
  
implementation

uses 
  GNUGetText, OF_DM, OF_Progress,
  //JclDebug,
  OF_DBGrid_Layout;
  {, cao_mailclient_singlemail}

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except
  end;

  Addr_PC.ActivePage := Allg_TS;

  InUpdate          := False;
  SuchBeg.Height    := 21;
  LastID            := -1;
  Limit             := 50;
  Uebern            := False;
  First             := True;
  SuchFeldID        := -1;

  ListeBtn.Align    := alRight;
  ASPBtn.Align      := alRight;
  AllgBtn.Align     := alRight;

  OnUpdateStatusBar := nil;

  SetSOrt(1);
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.SearchKunnum(SearchNum: String; Modal: Boolean);
var 
  LastSuchFeldID: Integer;
begin
  if length(SearchNum) > 0 then
  begin
    LastSuchFeldID := SuchFeldCB.ItemIndex;
    SuchFeldID := 3;
    SuchFeldCB.ItemIndex := SuchFeldID; // Suche nach Kundennummer
    SuchBeg.Text := SearchNum;
    SuchbegChange (Self);
    searchtime := 1;
    searchtimer.enabled := true;
  end else 
    LastSuchFeldID := -1;
  if Modal then
  begin
    ShowModal;
    if LastSuchFeldID > -1 then
    begin
      SuchBeg.Text := '';
      SuchFeldCB.ItemIndex := LastSuchFeldID;
      DM1.WriteIntegerU ('', 'ADRESSEN_SUCHBEGRIFF', LastSuchFeldID);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 600;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 500;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormActivate(Sender: TObject);
var 
  i: Integer;
begin
  if first then
  begin
    First  := false;
    LastID := -1;

    ASPGrid.RowColor1          := DM1.C2Color;
    KunSuchGrid.RowColor1      := DM1.C2Color;

    ASPGrid.EditColor          := DM1.EditColor;
    KunSuchGrid.EditColor      := DM1.EditColor;

    Addr_PC.HintColor := Application.HintColor;

    SB1.SimplePanel := True;
    SB1.SimpleText := _('Lade Benutzereinstellungen ...');

    dm1.GridLoadLayout (tDBGrid(ASPGrid)    , 'MINI_ADRESSEN_ASP'  , 100);
    dm1.GridLoadLayout (tDBGrid(KunSuchGrid), 'MINI_ADRESSEN_LISTE', 100);


    Limit := DM1.ReadIntegerU ('', 'ADRESSEN_TREFFER', 50);
    case Limit of
      10: N101.Checked := True;
      50: N501.Checked := True;
      100: N1001.Checked := True;
      200: N2001.Checked := True;
      500: N5001.Checked := True;
      999999999: alle1.Checked := True;
    end;

    // letztes Tabsheet wiederherstellen
    {
    i :=DM1.ReadIntegerU ('','ADRESSEN_TABSHEET',-1);
    
    if (i>=0)and(i<ADDR_PC.PageCount)
    then ADDR_PC.ActivePage :=ADDR_PC.Pages[i]
    else ADDR_PC.ActivePage :=Allg_TS;
    }

    SortField := DM1.ReadStringU  ('', 'ADRESSEN_SORTFELD', 'MATCHCODE');
    SortName  := DM1.ReadStringU  ('', 'ADRESSEN_SORTNAME', 'MATCH');

    for i := 0 to KunSuchGrid.Columns.Count-1 do
    begin
      if KunSuchGrid.Columns[i].Field.DisplayLabel = SortName then 
        KunSuchGrid.Columns[i].Title.Font.Style := [fsBold]
      else 
        KunSuchGrid.Columns[i].Title.Font.Style := [];
    end;

    if SuchFeldID> -1 then 
       SuchFeldCB.ItemIndex := SuchFeldID
    else 
      SuchFeldCB.ItemIndex := DM1.ReadIntegerU ('', 'ADRESSEN_SUCHBEGRIFF', 0);

    Addr_PCChange (Self);

    SB1.SimplePanel := False;
    SB1.SimpleText := '';
    SB1.Invalidate;

    {
    KNUM1_EDI :=DM1.ReadBoolean ('MAIN\ADRESSEN','KUNNUM1_EDI',False);
    KunNum1Edit.ReadOnly :=not KNUM1_EDI;
    KunNum1Edit.Enabled  :=KNUM1_EDI;
    }
  end;

  SB1.Visible := not (assigned(OnUpdateStatusBar));

  if not(KSQuery.State in [dsEdit, dsInsert]) then 
    UpdateQuery;

  //if ID>0 then KSQuery.Locate ('REC_ID',ID,[]);

  try
    {
    case Addr_PC.ActivePage.Tag of
    1: match.setfocus;
    2: APFunktion.SetFocus;
    3: KunSuchGrid.SetFocus;
    end;
    }
    SuchBeg.SetFocus;
  except 
  end;

  UebernahmeBtn.Enabled := (KSQuery.RecordCount>0);
  UebernahmeBtn.Visible := True;

  Uebern := False;
  if not (KSquery.State in [dsInsert]) then 
    Addr_PCChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormShow(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormCloseQuery(Sender: TObject;
var CanClose: Boolean);
begin
  //  Do nothing
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  //  Do nothing
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.FormDeactivate(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.AllgBtnMouseEnter(Sender: TObject);
begin
  if (sender is TJvSpeedButton) and (TJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.AllgBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;   

//------------------------------------------------------------------------------
procedure TAdressBuchForm.ADDR_PCChange(Sender: TObject);
begin
  AllgBtn.Font.Style  := [];
  ListeBtn.Font.Style := [];
  AspBtn.Font.Style   := [];

  case Addr_PC.ActivePageIndex of
    0: begin 
      AllgBtn.Font.Style := [fsBold]; 
      Allgemein1.Checked := True;      
    end;
    1: begin 
      AspBtn.Font.Style := [fsBold]; 
      Ansprechpartner1.Checked := True; 
    end;
    2: begin 
      ListeBtn.Font.Style := [fsBold]; 
      Liste1.Checked := True;          
    end;
  end;

  if Addr_PC.ActivePage = ASP_TS then
  begin
    APTab.Close;
    APTab.ParamByName ('ID').AsInteger := KSQueryREC_ID.Value;
    APTab.Open;
  end else 
  if APTab.Active then
  begin
    if APTab.State in [dsEdit, dsInsert] then 
      APTab.Post;
    APTab.Close;
  end;

  SichtbareSpalten1.Enabled := Addr_PC.ActivePage <> Allg_TS;
  UebernahmeBtn.Enabled     := (KSQuery.RecordCount>0);
  UebernahmeBtn.Visible     := True;

end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.AllgBtnClick(Sender: TObject);
begin
  {
  if KSQuery.State in [dsInsert] then
  begin
  KSQuery.Post;
  if KSQuery.State in [dsEdit, dsInsert] then exit;
  end;
  }
  if (Sender is tMenuItem) then 
    Addr_PC.ActivePage := Addr_PC.Pages[tMenuitem(sender).Tag-1]
  else 
    Addr_PC.ActivePage := Addr_PC.Pages[tSpeedButton(sender).Tag-1];

  Addr_PCChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.KunSuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  i: Integer;
begin
  if SortField <>Field.FieldName then
  begin
    SortName  := Field.DisplayLabel;
    SortField := Field.FieldName;
    UpdateQuery;
  end else
  begin
    SortField := SortField + ' DESC';
    SortName  := Field.DisplayLabel;
    UpdateQuery;
  end;

  for i := 0 to KunSuchGrid.Columns.Count-1 do
  begin
    if KunSuchGrid.Columns[i].Field.DisplayLabel = SortName
    then KunSuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else KunSuchGrid.Columns[i].Title.Font.Style := [];
  end;
end; 

//------------------------------------------------------------------------------
procedure TAdressBuchForm.SuchBegChange(Sender: TObject);
begin
  searchtime := 15;
  searchtimer.enabled := true;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.SuchFeldCBChange(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.MnuAnichtTrefferClick(Sender: TObject);
begin
  Limit := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
  DM1.WriteIntegerU ('', 'ADRESSEN_TREFFER', Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.MnuSortierungClick(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 6) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.SetSort (Sort: Integer);
var 
  i: Integer;
begin
  if sort = aktsort then 
    exit;
  if sort < 0 then 
    sort := aktsort;

  case sort of
    {mach}     
    1: begin 
      sortname := _('Suchbegriff'); 
      SortField := 'MATCHCODE';     
    end;
    {name}     
    2: begin 
      sortname := _('Name');        
      SortField :='NAME1,NAME2';   
    end;
    {plz}      
    3: begin 
      sortname := _('Plz/Ort');     
      SortField := 'PLZ,ORT,NAME1'; 
    end;
    {KNUM1}    
    4: begin 
      sortname := _('Kundennr.');   
      SortField :='KUNNUM1';       
    end;
    {KNUM2}    
    5: begin 
      sortname := _('Lief.-Nr.');   
      SortField :='KUNNUM2';       
    end;
  end;

  AktSort := Sort;
  if first then 
    exit;

  UpdateQuery;
  UpdateStatus;

  for i := 0 to KunSuchGrid.Columns.Count-1 do
  begin
    if KunSuchGrid.Columns[i].Field.DisplayLabel = SortName then 
      KunSuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      KunSuchGrid.Columns[i].Title.Font.Style := [];
  end;
end;  

//------------------------------------------------------------------------------
procedure TAdressBuchForm.UpdateQuery;
var LastTime: DWord;
begin
  LastTime := GetTickCount;
  KSQuery.Close;
  KSQuery.SQL.Clear;

  KSQuery.SQL.Add(
    'SELECT A.REC_ID,A.KUNDENGRUPPE,A.MATCHCODE,A.ANREDE,A.NAME1,A.NAME2,A.NAME3,' +
    'A.ABTEILUNG,A.STRASSE,A.LAND,A.PLZ,A.ORT,A.PF_PLZ,A.POSTFACH,A.EMAIL,A.EMAIL2,' +
    'A.TELE1,A.TELE2,A.INTERNET,A.DIVERSES,A.INFO,A.ERSTELLT,A.ERST_NAME,' +
    'A.GEAEND,A.GEAEND_NAME,A.KUN_GEBDATUM,A.KUNNUM1,A.KUNNUM2,A.FAX,A.FUNK,' +
    'A.SHOP_ID,A.PR_EBENE,A.WAEHRUNG,A.SHOP_CHANGE_FLAG' +
    ' FROM ADRESSEN A'
  );

  if (SuchBegr <> '') and (SuchFeldCB.ItemIndex = 7) then 
    KSQuery.SQL.Add (', ADRESSEN_ASP');

  {
  if (Pos('INNER JOIN',uppercase(Kunden_SQL))>0)or
  (Pos('WHERE',uppercase(Kunden_SQL))>0)
  then KSQuery.SQL.Add (Kunden_SQL);
  }
  if (SuchBegr <> '') //or
  //(ExtSearchSQL <> '') or
  //((Kunden_SQL <> '')and
  // (Pos('INNER JOIN',uppercase(Kunden_SQL))=0))
  then
  begin
    {if Pos('WHERE',UpperCase(Kunden_SQL))=0
    then} KSQuery.SQL.Add ('WHERE')
    {else
    if (SuchBegr <> '')or(ExtSearchSQL <> '')
    then KSQuery.SQL.Add ('AND ');}
  end;
  {
  if Length(ExtSearchSQL)>0 then
  begin
  KSQuery.SQL.Add ('('+ExtSearchSQL+') ');
  SuchBegr :='';
  if (Kunden_SQL <> '')and
  (Pos('INNER JOIN',uppercase(Kunden_SQL))=0)and
  (Pos('WHERE',uppercase(Kunden_SQL))=0)
  then KSQuery.SQL.Add ('and ');
  end; }

  if SuchBegr <> '' then
  begin
    case SuchFeldCB.ItemIndex of
      1:   begin // Match
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['MATCHCODE'], SuchBegr) + ')');
      end;
      2:   begin // Info
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['INFO'], SuchBegr) + ')');
      end;
      3:   begin // Kundennr.
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['KUNNUM1', 'KUNNUM2'], SuchBegr) + ')');
      end;
      4:   begin // Ort
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['ORT'], SuchBegr) + ')');
      end;
      5:   begin // Straße
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['STRASSE'], SuchBegr) + ')');
      end;
      6:   begin // Selektion.
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['GRUPPE'], SuchBegr) + ')');
      end;
      7:   begin // Ansprechpartner
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['ADRESSEN_ASP.NAME', 'ADRESSEN_ASP.VORNAME'], SuchBegr) + ')');
        KSQuery.SQL.Add('and A.REC_ID = ADRESSEN_ASP.ADDR_ID');
      end;
      else begin
        KSQuery.SQL.Add('(' + DM1.GetSearchSQL (['ANREDE', 'NAME1', 'NAME2', 'NAME3', 'ABTEILUNG'], SuchBegr) + ')');
      end;
    end;
    {
    if (Kunden_SQL <> '') and
    (Pos('INNER JOIN',Uppercase(Kunden_SQL))=0) and
    (Pos('WHERE',Uppercase(Kunden_SQL))=0)
    then KSQuery.SQL.Add (' and ');}
  end;
  {
  if (Kunden_SQL <> '')  and
  (Pos('INNER JOIN',Uppercase(Kunden_SQL))=0) and
  (Pos('WHERE',Uppercase(Kunden_SQL))=0)
  then KSQuery.SQL.Add (Kunden_SQL);
  }
  KSQuery.SQL.Add('ORDER BY ' + SortField);
  KSQuery.SQL.Add('LIMIT 0,' + Inttostr(Limit));
  Screen.Cursor := crSQLWait;
  try
    KSQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;

  querytime := GetTickCount - LastTime;
  UpdateStatus;

  if (KSQuery.RecordCount = 0) and (Addr_PC.Enabled) then
    Addr_PC.Enabled := False
  else
    if (KSQuery.RecordCount>0) and (not Addr_PC.Enabled) then
      Addr_PC.Enabled := True;

  UebernahmeBtn.Enabled     := (KSQuery.RecordCount>0);
  UebernahmeBtn.Visible     := UebernahmeBtn.Enabled;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.UpdateStatus;
var 
  SuchZeit, 
  Datensatz, 
  Sortierung, 
  Erstellt, 
  Geaendert: String;
begin
  if KSQuery.RecordCount = 0 then 
    Datensatz := _('keine')
  else 
  if KSQuery.RecordCount = Limit then 
    Datensatz := inttostr (KSQuery.RecNo) + ' ' + _('von') + ' >=' +
                 inttostr (KSQuery.RecordCount)
  else 
    Datensatz := inttostr (KSQuery.RecNo) + ' von ' +
                 inttostr (KSQuery.RecordCount);

  Sortierung := _('Sortierung') + ' : ' + sortname;

  if (ksquery.active) and (ksquery.recordcount > 0) then
  begin
    Erstellt := _('Erstellt:') + formatdatetime ('dd.mm.yyyy', KSQueryErstellt.Value);
    if KSQueryGeaend.Value > 1 then
      Geaendert := _('Geändert:') + formatdatetime ('dd.mm.yyyy', KSQueryGeaend.Value)
    else
      Geaendert := '-';
  end else
  begin
    Erstellt  := '';
    Geaendert := '';
  end;

  SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');

  if assigned(OnUpdateStatusBar) then
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
procedure TAdressBuchForm.SuchBegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    try
      if Addr_PC.ActivePage = Allg_TS then 
        Match.SetFocus 
      else
      if Addr_PC.ActivePage = Such_TS then 
        KunSuchGrid.SetFocus;
    except 
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.matchEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.matchExit(Sender: TObject);
begin
  tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.matchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    KSQuery.Prior;
    key := 0;
  end else
  begin
    if (Shift = []) and (key = 34) then // PGDOWN
    begin
      KSQuery.Next;
      key := 0;
    end;
  end;
end;
  
//------------------------------------------------------------------------------
procedure TAdressBuchForm.matchKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if uppercase(tControl(Sender).Name) = 'GEBDAT' then 
      Match.SetFocus 
    else
    if uppercase(tControl(Sender).Name) = 'APINFO' then 
      APTelefon.SetFocus 
    else
    if uppercase(tControl(Sender).Name) = 'APGEBDATUM' then 
      APFunktion.SetFocus
    else 
      SendMessage (Self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;  

//------------------------------------------------------------------------------
procedure TAdressBuchForm.SearchTimerTimer(Sender: TObject);
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
procedure TAdressBuchForm.KSQueryBeforeDelete(DataSet: TDataSet);
begin
  if (KSQuerySHOP_ID.AsInteger > 0) then
  begin
    MessageDlg(_('Shopkunden können nicht gelöscht werden.' + #13#10 +
                 'Entfernen Sie zunächst den Kunden aus dem ' +
                 'Shop und' + #13#10 + 'führen Sie anschließend einen ' +
                 '"Shoptransfer" durch !'), mterror, [mbok], 0
    );
    Abort;
    exit;
  end;

  if MessageDlg(_('Wollen Sie diese Adresse wirklich löschen ?'), mtconfirmation, [mbyes, mbno], 0) <> mryes then
  begin
    Abort;
    exit;
  end;

  // 1. im Journal ADDR_ID löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('update JOURNAL');
    SQL.Add('set ADDR_ID="-1", LIEF_ADDR_ID="-1"');
    SQL.Add('Where ADDR_ID=' + IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 2. Ansprechpartner löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('delete from ADRESSEN_ASP');
    SQL.Add('Where ADDR_ID=' + IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 3. bei Kundenfahrzeugen die ADDR_ID löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('update KFZ');
    SQL.Add('set ADDR_ID="-1"');
    SQL.Add('Where ADDR_ID=' + IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 4. Lieferadressen löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('delete from ADRESSEN_LIEF');
    SQL.Add('Where ADDR_ID=' + IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;

  // 5. Merkmale löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('delete from ADRESSEN_TO_MERK');
    SQL.Add('Where ADDR_ID=' + IntToStr(KSQueryRec_ID.Value));
    execsql;
  end;
end;       

//------------------------------------------------------------------------------
procedure TAdressBuchForm.KSQueryAfterScroll(DataSet: TDataSet);
begin
  if (KSQuery.RecordCount = 0) and (Addr_PC.Enabled) and 
     (not (KSquery.State in [dsInsert])) then 
    Addr_PC.Enabled := False
  else
  if (KSQuery.RecordCount > 0) and (not Addr_PC.Enabled) then 
    Addr_PC.Enabled := True;

  if Addr_PC.ActivePage = ASP_TS then
  begin
    APTab.Close;
    APTab.ParamByName ('ID').AsInteger := KSQueryREC_ID.Value;
    APTab.Open;
  end;

  LastID := KSQueryRec_ID.Value;

  UpdateStatus;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.KSQueryBeforeInsert(DataSet: TDataSet);
begin
  try
    if not Addr_PC.Enabled then 
      Addr_PC.Enabled := True;

    ADDR_PC.ActivePage := Allg_TS;
    ADDR_PCChange (Self);
    Match.SetFocus;
  except 
  end;
end;

procedure TAdressBuchForm.KSQueryBeforePost(DataSet: TDataSet);
begin
  if Dataset.State = dsInsert then
  begin
    KSQueryERSTELLT.Value := now;
    KSQueryERST_NAME.Value := dm1.view_user;
  end;
  KSQueryGEAEND.Value := now;
  KSQueryGEAEND_NAME.Value := dm1.view_User;

  if KSQueryPR_Ebene.Value = 0 then 
    KSQueryPR_Ebene.Value := DM1.AnzPreis;
  if KSQueryWAEHRUNG.Value = '' then 
    KSQueryWAEHRUNG.Value := dm1.Leitwaehrung;
  If KSQueryKUNDENGRUPPE.AsInteger < 1 then 
    KSQueryKUNDENGRUPPE.AsInteger := 1;

  if (KSQueryName1.Value = '') and (KSQueryName2.Value <> '') then
  begin
    KSQueryName1.Value := KSQueryName2.Value;
    KSQueryName2.Value := '';
  end;

  if (KSQueryName2.Value = '') and (KSQueryName3.Value <> '') then
  begin
    KSQueryName2.Value := KSQueryName3.Value;
    KSQueryName3.Value := '';
  end;

  if (KSQueryName1.Value = '') and (KSQueryName2.Value <> '') then
  begin
    KSQueryName1.Value := KSQueryName2.Value;
    KSQueryName2.Value := '';
  end;

  if KSQuerySHOP_ID.AsInteger > 0 then
  begin
    KSQuerySHOP_Change_Flag.Value := 1;
  end;
end;

procedure TAdressBuchForm.KSQueryNewRecord(DataSet: TDataSet);
begin
  KSQueryLand.Value := DM1.LandK2;
end;

procedure TAdressBuchForm.KSQueryUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var 
  I: Integer; 
  First: Boolean; 
  SQL: TStrings;
begin
  if UpdateKind in [ukModify, ukInsert] then
  begin
    // UpdateSQL bestücken
    First := True;

    AddrUpdSQL.ModifySql.Clear;
    AddrUpdSQL.InsertSql.Clear;

    if UpdateKind = ukModify then
    begin
      SQL := AddrUpdSQL.ModifySql;
      SQL.Add ('UPDATE ADRESSEN SET');
    end else
    begin
      SQL := AddrUpdSQL.InsertSql;
      SQL.Add ('INSERT INTO ADRESSEN SET');
    end;

    for i := 0 to DataSet.FieldCount-1 do
    begin
      if (DataSet.Fields[i].CanModify) and (not DataSet.Fields[i].Calculated) and
         ((DataSet.Fields[i].CurValue <> DataSet.Fields[i].OldValue) or
         ((DataSet.Fields[i].IsBlob) and (tBlobField(DataSet.Fields[i]).Modified))or
         ((UpdateKind = ukInsert) and (DataSet.Fields[i].FieldName<>'REC_ID'))) then
      begin
        if First then 
          First := False 
        else 
          SQL.Add(', ');

        SQL.Add (DataSet.Fields[i].FieldName + ' =:' +
        DataSet.Fields[i].FieldName);
      end;
    end;
    if UpdateKind = ukModify then 
      SQL.Add('where REC_ID=:REC_ID');

    if First then
    begin
      Sql.Clear;
      UpdateAction := uaAbort;
    end;
  end;
end;         

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Neu1Click(Sender: TObject);
begin
  KSQuery.Append;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Loeschen1Click(Sender: TObject);
begin
  KSQuery.Delete;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Suchen1Click(Sender: TObject);
begin
try SuchBeg.SetFocus; except end;
end;
//------------------------------------------------------------------------------
procedure TAdressBuchForm.SichtbareSpalten1Click(Sender: TObject);
var 
  VisibleSpaltenForm: TVisibleSpaltenForm;
begin
  VisibleSpaltenForm := TVisibleSpaltenForm.Create(Self);
  try
    if Addr_PC.ActivePage = ASP_TS then 
      VisibleSpaltenForm.UpdateTable(tDBGrid(ASPGrid))
    else 
      VisibleSpaltenForm.UpdateTable(tDBGrid(KunSuchGrid));
  finally
    VisibleSpaltenForm.Free;
  end;
end;                                

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout(tDBGrid(ASPGrid), 'MINI_ADRESSEN_ASP' , 100);
  dm1.GridSaveLayout(tDBGrid(KunSuchGrid), 'MINI_ADRESSEN_LISTE', 100);
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Aktualisieren1Click(Sender: TObject);
begin
  if Addr_PC.ActivePage = ASP_TS then 
    APTab.Refresh
  else 
    KSQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.APTabBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg (_('Wollen Sie diesen Ansprechpartner wirklich löschen ?'),
                    mtconfirmation, [mbyes, mbno], 0) <> mryes then
  begin
    Abort;
    exit;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.APTabBeforeEdit(DataSet: TDataSet);
begin
  // Bearbeitung von Ansprechpartnern verweigern, wenn keine Adresse ausge-
  // wählt
  if KSQuery.RecordCount<1 then Abort;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.APTabBeforePost(DataSet: TDataSet);
begin
  APTab.FieldByName ('ADDR_ID').AsInteger := KSQueryRec_ID.AsInteger;
  if (APTab.FieldByName('NAME').AsString = '') then
  begin
    APName.SetFocus;
    Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.APTabNewRecord(DataSet: TDataSet);
begin
  APTab.FieldByName ('LAND').AsString := DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TAdressBuchForm.UebernahmeBtnClick(Sender: TObject);
begin
  UebernahmeBtn.Enabled := False;
  if KSQuery.State in [dsEdit, dsInsert] then KSQuery.Post;
  Uebern := True;
  Close;
end;

//------------------------------------------------------------------------------
procedure TAdressBuchForm.Schlieen1Click(Sender: TObject);
begin
  Uebern := False;
  Close;
end;

//------------------------------------------------------------------------------
(* //05.10.09-ud. raus...
procedure TAdressBuchForm.KSQueryLockError(Error: Integer);
begin
  DM1.LockError (Error);
end;
*)

//------------------------------------------------------------------------------

end.
