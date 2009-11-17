{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Journal: Lieferscheine                                            }
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
{ 09.11.2003 - Fix: Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert }
{ 13.03.2004 - Dateilinks implementiert }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Journal_VKLIEF;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ComCtrls, ExtCtrls,
  DBCtrls, ToolWin, VolPeriod{???}, StdCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

{
uses
  Buttons, ImgList,
  SortGrid, ZQuery, Mask, Menus,
  JvDBCtrl,
}

type
  TJournalVKLiefForm = class(TForm)
    JourDS: TDataSource;
    JournalPanel: TPanel;
    JQuery: TOFZQuery;
    JoArtTab: TZQuery;
    JoArtTabREC_ID: TIntegerField;
    JoArtTabJOURNAL_ID: TIntegerField;
    JoArtTabARTIKELTYP: TStringField;
    JoArtTabARTIKEL_ID: TIntegerField;
    JoArtTabATRNUM: TIntegerField;
    JoArtTabVRENUM: TStringField;
    JoArtTabVLSNUM: TStringField;
    JoArtTabPOSITION: TIntegerField;
    JoArtTabMATCHCODE: TStringField;
    JoArtTabARTNUM: TStringField;
    JoArtTabBARCODE: TStringField;
    JoArtTabMENGE: TFloatField;
    JoArtTabME_EINHEIT: TStringField;
    JoArtDS: TDataSource;
    JoArtTabBEZEICHNUNG: TMemoField;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    Storno1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Positionen1: TMenuItem;
    N2: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Journaldrucken1: TMenuItem;
    N3: TMenuItem;
    Kopieren1: TMenuItem;
    Lieferscheindrucken1: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    ArtPan: TPanel;
    Label35: TLabel;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    DatumAW: TVolgaPeriod;
    ToolButton2: TToolButton;
    ViewPosBtn: TToolButton;
    StornoBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    RePrintBtn: TToolButton;
    Suchen1: TMenuItem;
    Drucken1: TMenuItem;
    Panel1: TPanel;
    DetailPan: TPanel;
    ReInfoPC: TPageControl;
    Allgemein: TTabSheet;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    JourGrid: TOFDBGrid;
    JQueryREC_ID: TIntegerField;
    JQueryADDR_ID: TIntegerField;
    JQueryVLSNUM: TStringField;
    JQueryLDATUM: TDateField;
    JQueryNSUMME: TFloatField;
    JQueryMSUMME: TFloatField;
    JQueryBSUMME: TFloatField;
    JQuerySTADIUM: TIntegerField;
    JQueryKUN_NUM: TStringField;
    JQueryKUN_NAME1: TStringField;
    JQueryWAEHRUNG: TStringField;
    JQueryKOST_NETTO: TFloatField;
    JQueryWERT_NETTO: TFloatField;
    JQueryRDATUM_ORG: TDateField;
    JQueryVRENUM: TStringField;
    JQuerySOLL_SKONTO: TFloatField;
    JQueryMWST_1: TFloatField;
    JQueryMWST_2: TFloatField;
    JQueryMWST_3: TFloatField;
    JQueryRDatum: TStringField;
    JQueryCalcStad: TStringField;
    JoArtTabPR_EINHEIT: TFloatField;
    JoArtTabEPREIS: TFloatField;
    JoArtTabRABATT: TFloatField;
    JoArtTabSTEUER_CODE: TIntegerField;
    JoArtTabG_PREIS: TFloatField;
    JoArtTabSteuer: TStringField;
    JourPosGrid: TOFDBGrid;
    JQueryProjekt: TStringField;
    JQueryOrgNum: TStringField;
    JQueryERST_NAME: TStringField;
    JQueryCALC_NAME: TStringField;
    JQueryKUN_ANREDE: TStringField;
    JQueryKUN_NAME2: TStringField;
    JQueryKUN_NAME3: TStringField;
    JQueryPRINT_FLAG: TBooleanField;
    N1: TMenuItem;
    Filter1: TMenuItem;
    alleLieferscheine1: TMenuItem;
    nurungedruckteLieferschein1: TMenuItem;
    FilterLab: TLabel;
    DateiTS: TTabSheet;
    DateiPan: TPanel;
    JQuerySOLL_STAGE: TLargeintField;
    JQuerySOLL_NTAGE: TLargeintField;
    procedure JahrCBChange(Sender: TObject);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure RePrintBtn1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure SetFilterClick(Sender: TObject);
    procedure ReInfoPCChange(Sender: TObject);
  private
    { Private-Deklarationen }
    SortField      : String;
    SortName       : String;
    First          : Boolean;
    QueryTime      : DWord;
    vonDatum,
    bisDatum       : tDateTime;
    LastID         : Integer;
    LastRange      : Integer;
    LastSDate      : Integer;

    Filter         : Integer;

    procedure UpdateReView;
    procedure SetSort (Index: Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

var
  JournalVKLiefForm: TJournalVKLiefForm;

implementation

uses
  GNUGetText,
  OF_Tool1, OF_DM, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Link, OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormCreate(Sender: TObject);
var 
  ja, mo, ta: word;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  Scaled := TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  OnUpdateStatusBar := nil;
  First     := True;
  LastID    := -1;
  LastSDate := -1;
  Filter    := 0;  // kein Filter

  decodedate (now, ja, mo, ta);

  DatumAW.KindRange := ksMonth;
  DatumAW.StartDate := now;
  LastRange         := ord(ksMonth);

  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;

  SortName  := _('Belegnummer');
  SortField := 'VLSNUM, RDATUM';
  JahrCBChange(Sender);

  Allgemein.Tabvisible := False;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormActivate(Sender: TObject);
var 
  ID: Integer;
begin
  if First then
  begin
    LastID := -1;

    JourGrid.RowColor1 := DM1.C2Color;
    JourPosGrid.RowColor1 := DM1.C2Color;

    //JourGrid.EditColor :=DM1.EditColor;
    //JourPosGrid.EditColor :=DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_VKLIEF', 101);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_VKLIEF', 101);

    ID := DM1.ReadIntegerU ('Journale\VK-LIEF', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    LastSDate := DM1.ReadIntegerU ('Journale\VK-LIEF', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate <> DatumAW.StartDate) then 
      DatumAW.StartDate := LastSDate;

    Filter := DM1.ReadIntegerU ('Journale\VK-LIEF', 'FILTER', 0);

    First := False;
    UpdateQuery;
  end;
  if not JQuery.Active then
  begin
    ID := LastID;
    JQuery.Open;
    if LastID > -1 then 
      JQuery.Locate ('REC_ID', ID, []);
    if Positionen1.Checked then 
      UpdateReView;
  end;
  UpdateStatus;
  JourGrid.SetFocus;
end;  

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FormDeactivate(Sender: TObject);
begin
  if JQuery.Active then 
    JQuery.Close;
  if JoArtTab.Active then 
    JoArtTab.Close;

  if LinkForm.MainPanel.Parent = DateiPan then
  begin
    LinkForm.MainPanel.Parent := Twincontrol(LinkForm.MainPanel.Owner);
    LinkForm.FormDeactivate (Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JahrCBChange(Sender: TObject);
begin
  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;
  LastID   := -1;

  if First then Exit;

  UpdateQuery;

  if ord(DatumAW.KindRange)<>LastRange then
  begin
    DM1.WriteStringU ('Journale', 'Default', 'Benutzer-Journaleinstellungen');
    DM1.WriteIntegerU ('Journale\VK-LIEF', 'RANGE', Ord(DatumAW.KindRange));
  end;
  DM1.WriteIntegerU ('Journale\VK-LIEF', 'START-DATE', Trunc(DatumAW.StartDate));
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SetSort (Index: Integer);
begin
  case Index of
    {RDATUM} 
    2: begin 
      Datum1.Checked :=True;
      sortfield := 'LDATUM,length(VLSNUM),VLSNUM';
      SortName  := _('Datum');
    end;
    {NAME}   
    3: begin 
      Name1.Checked :=True;
      sortfield := 'KUN_NAME1';
      SortName  := _('Name');
    end;
    {STADIUM}
    4: begin 
      Stadium1.Checked :=True;
      sortfield := 'STADIUM,LDATUM,length(VLSNUM),VLSNUM';
      SortName  := _('Stadium');
    end;
    {PREIS}  
    5: begin 
      Preis1.Checked :=True;
      sortfield := 'BSUMME,LDATUM,length(VLSNUM),VLSNUM';
      SortName  := _('Summe');
    end;
    {RNUM}
    else begin 
      Belegnummer1.Checked :=True;
      sortfield := 'length(VLSNUM),VLSNUM,LDATUM';
      SortName  := _('Belegnummer');
    end;
  end;
  if Not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JourGridDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var 
  num: integer;
begin
  with sender as tdbgrid do
  begin
    if (column.fieldname = 'STADIUM') then
    begin
      canvas.fillrect (rect);
      Case column.field.asinteger of
        20..79  : if JQueryPrint_Flag.AsBoolean = False
        then num := 3   // gelb für ungedruckt
        else num := 0;  // cyan für gedruckt
          80..99  : num := 2;
        else num := 0;
      end;
      mainform.imagelist1.Draw (Canvas, rect.left, rect.top, num, true);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  fn: string; 
  i: integer;
begin
  fn := uppercase (Field.FieldName);

  if fn = 'VLSNUM'    then I := 1 else
  if fn = 'LDATUM'    then I := 2 else
  if fn = 'KUN_NAME1' then I := 3 else
  if fn = 'CALC_NAME' then I := 3 else
  if fn = 'STADIUM'   then I := 4 else
  if fn = 'CALCSTAD'  then I := 4 else
  if fn = 'WARENWERT' then I := 5
  else I := 0;

  SetSort (I);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.UpdateReView;
var 
  mwst1, mwst2, mwst3: string;
begin
  mwst1 := formatfloat ('0.0', JQueryMWST_1.Value) + '%';
  mwst2 := formatfloat ('0.0', JQueryMWST_2.Value) + '%';
  mwst3 := formatfloat ('0.0', JQueryMWST_3.Value) + '%';

  JoArtTab.Close;
  JoArtTab.ParamByName('ID').AsInteger := JQueryREC_ID.AsInteger;
  JoArtTab.Open;

  ReInfoPCChange(Self);
end;                          

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.PrintJournalBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg (VK_LIEF, trunc(vonDatum), trunc(bisDatum), DatumAW.Text, 0);
  MainForm.FormActivate (Self);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Lieferscheinjournal' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.UpdateQuery;
var 
  OldTime: DWord; 
  i: Integer; 
  SF: String;
begin
  Application.ProcessMessages;
  try
    OldTime := GetTickCount;
    Screen.Cursor := crSQLWait;
    JQuery.Close;
    JQuery.SQL.Clear;
    JQuery.SQL.Add ('SELECT');
    JQuery.SQL.Add ('REC_ID,ADDR_ID,VLSNUM,LDATUM,');
    JQuery.SQL.Add ('NSUMME,MSUMME,BSUMME,STADIUM,KUN_NUM,');
    JQuery.SQL.Add ('KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,WAEHRUNG,');
    JQuery.SQL.Add ('KOST_NETTO, WERT_NETTO,');
    JQuery.SQL.Add ('RDATUM AS RDATUM_ORG,VRENUM,');
    JQuery.SQL.Add ('SOLL_SKONTO, SOLL_STAGE, SOLL_NTAGE,PRINT_FLAG,');
    JQuery.SQL.Add ('MWST_1, MWST_2, MWST_3, PROJEKT, ORGNUM, ERST_NAME');
    JQuery.SQL.Add ('FROM JOURNAL');
    JQuery.SQL.Add ('WHERE LDATUM >=:VON AND LDATUM<=:BIS');
    JQuery.SQL.Add ('AND QUELLE=' + inttostr (VK_LIEF));

    if Filter = 1 then 
      JQuery.SQL.Add ('AND PRINT_FLAG="N"');

    JQuery.SQL.Add ('ORDER BY ' + sortfield);
    JQuery.ParamByName ('VON').AsDate := VonDatum;
    JQuery.ParamByName ('BIS').AsDate := BisDatum + 0.99999;
    JQuery.Open;
  finally
    Screen.Cursor := crDefault;
    QueryTime := gettickcount - oldtime;

    if Filter = 1 then
    begin
      nurungedruckteLieferschein1.Checked := True;
      FilterLab.Caption := ' ' + _('gefiltert (nur ungedruckte Lieferscheine)');
    end else
    begin
      alleLieferscheine1.Checked := True;
      FilterLab.Caption := '';
    end;

    SF := Uppercase(SortField);
    if Pos('LENGTH(', SF) = 1 then 
      delete (SF, 1, length('LENGTH('));
    if Pos('KUN_NAME1', SF) = 1 then 
      SF := 'CALC_NAME';
    if Pos('STADIUM', SF) = 1 then 
      SF := 'CALCSTAD';
    for I := 0 to JourGrid.Columns.Count-1 do
    begin
      JourGrid.Columns[i].Title.Font.Style := [];
      if Pos(uppercase(JourGrid.Columns[i].Field.FieldName), SF) = 1 then 
        JourGrid.Columns[i].Title.Font.Style := [fsBold];
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JQueryCalcFields(DataSet: TDataSet);
var 
  S: String;
begin
  JQueryCalcStad.Value := GetLiefStatus(JQueryStadium.Value, JQueryPrint_Flag.AsBoolean);

  if (JQueryVRENUM.Value <> '') and (JQueryRDATUM_ORG.Value > 10) then 
    JQueryRDatum.Value := formatdatetime('dd.mm.yyyy', JQueryRDATUM_ORG.Value);

  S := JqueryKUN_Anrede.AsString;

  if length(JQueryKUN_NAME1.AsString) > 0 then
  begin
    if Length(S) > 0 then 
      S := S + ' ';
    S := S + JQueryKUN_NAME1.AsString;
  end;
  if length(JQueryKUN_NAME2.AsString) > 0 then
  begin
    if Length(S) > 0 then 
      S := S + ' ';
    S := S + JQueryKUN_NAME2.AsString;
  end;
  if length(JQueryKUN_NAME3.AsString) > 0 then
  begin
    if Length(S) > 0 then 
      S := S + ' ';
    S := S + JQueryKUN_NAME3.AsString;
  end;
  JQueryCalc_Name.AsString := S;
end;                

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
  Case JoArtTabSteuer_Code.Value of
    0: JoArtTabSteuer.Value := '-';
    1: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_1.Value);
    2: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_2.Value);
    3: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_3.Value);
    else JoArtTabSteuer.Value := '???';
  end;

  if JoArtTabArtikelTyp.Value = 'T' then
  begin
    JoArtTabSteuer.Value := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then 
    exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then 
    UpdateReView;

  Journaldrucken1.Enabled      := JQuery.RecordCount > 0;
  Lieferscheindrucken1.Enabled := JQuery.RecordCount > 0;
  Kopieren1.Enabled            := JQuery.RecordCount > 0;
  Storno1.Enabled              := JQuery.RecordCount > 0;
  Suchen1.Enabled              := JQuery.RecordCount > 0;

  LastID := JQueryRec_ID.Value;

  UpdateStatus;
end;                                                   

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_VKLIEF', 101);
  dm1.GridSaveLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_VKLIEF', 101);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Kopieren1Click(Sender: TObject);
begin
  DM1.CopyRechnung (JQueryRec_ID.Value, VK_LIEF_EDI);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.RePrintBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (VK_LIEF, JQueryRec_ID.AsInteger, False);
  MainForm.FormActivate (Self);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Lieferscheines' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
  Aktualisieren1Click(Sender);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Aktualisieren1Click(Sender: TObject);
begin
  JQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Positionen1Click(Sender: TObject);
begin
  Positionen1.Checked := not Positionen1.Checked;
  ReInfoPC.Visible    := Positionen1.Checked;
  Splitter1.Visible   := Positionen1.Checked;
  Splitter1.Top       := ReInfoPC.Top;

  if Positionen1.Checked then 
    UpdateReView;
  ViewPosBtn.Down := Positionen1.Checked;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.Preis1Click(Sender: TObject);
begin
  SetSort(tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung: String;
begin
  SuchZeit   := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');
  Datensatz  := Inttostr(JQuery.RecNo) + ' ' + _('von') + ' ' + inttostr (JQuery.RecordCount);
  Sortierung := _('Sortierung : ') + SortName;

  if assigned (OnUpdateStatusBar) then 
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.StornoBtn1Click(Sender: TObject);
begin
  if MessageDlg (Format(_('Wollen Sie den Lieferschein Nr.:%s ' +
    'wirklich stornieren ?'),
    [JQueryVLSnum.AsString]),
    mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if DM1.Storno_Lieferschein (JQueryRec_ID.Value) then
    begin
      JQuery.Refresh;
      JQueryAfterScroll(nil);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.JourDSDataChange(Sender: TObject; Field: TField);
begin
  if JQueryRec_ID.Value <> LastID then 
    JQueryAfterScroll (nil);
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SuchenBtn1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := JourGrid.Col;
  f := JourGrid.Columns[i-1].FieldName;
  t := MainForm.FindDialog1.FindText;
  Found := False;
  if frDown in MainForm.FindDialog1.Options then 
    JQuery.Next
  else 
   JQuery.Prior;
  repeat
    if frMatchCase in MainForm.FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, JQuery.FieldByName(f).AsString)>0;
    end else
    begin
      // Groß- und Kleinschreibung nicht beachten
      Found := Pos (uppercase(t), uppercase(JQuery.FieldByName(f).AsString)) > 0;
    end;

    if not Found then
    begin
      if frDown in MainForm.FindDialog1.Options then 
        JQuery.Next
      else 
        JQuery.Prior;
    end;
  until (JQuery.Eof) or (JQuery.Bof) or (Found);
end;                                    

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.ArtPanResize(Sender: TObject);
begin
  DatumAW.Left := ArtPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.SetFilterClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
  begin
    Filter := tMenuItem(Sender).Tag;
    DM1.WriteIntegerU ('Journale\VK-LIEF', 'FILTER', Filter);
    UpdateQuery;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKLiefForm.ReInfoPCChange(Sender: TObject);
begin
  if (ReInfoPC.Visible) and (ReInfoPC.ActivePage = DateiTS) then
  begin
    if LinkForm.MainPanel.Parent <> DateiPan then 
      LinkForm.MainPanel.Parent := DateiPan;

    LinkForm.SetModul (VK_LIEF, JQueryRec_ID.AsInteger, DateiPan);
  end;
end;  

//------------------------------------------------------------------------------

end.

