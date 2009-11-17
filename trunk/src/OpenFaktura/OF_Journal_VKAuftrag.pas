{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Journal: Verkauf Aufträge                                         }
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
{ 24.06.2005 - Initiale Version released (Team6)                               }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Journal_VKAuftrag;

{$I OF.INC}
      
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, JvMenus, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Buttons, StdCtrls, DBCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, OFDBGrid, ComCtrls, ExtCtrls, ToolWin, VolPeriod{???},
  OF_Var_Const, OFSecurity;

{
uses
  ImgList,
  SortGrid, Mask,
  JvDBCtrl,
}
type
  TJournalVKAuftragForm = class(TForm)
    JourDS: TDataSource;
    JournalPanel: TPanel;
    JQuery: TOFZQuery;
    JQueryREC_ID: TIntegerField;
    JQueryADDR_ID: TIntegerField;
    JQueryVRENUM: TStringField;
    JQueryRDATUM: TDateField;
    JQueryNSUMME: TFloatField;
    JQueryMSUMME: TFloatField;
    JQueryBSUMME: TFloatField;
    JQueryKUN_NUM: TStringField;
    JQueryKUN_NAME1: TStringField;
    JQueryORGNUM: TStringField;
    JQueryWAEHRUNG: TStringField;
    JQueryKondit: TStringField;
    JQueryADATUM: TDateField;
    JQueryPROJEKT: TStringField;
    JQuerySOLL_SKONTO: TFloatField;
    JQueryMWST_1: TFloatField;
    JQueryMWST_2: TFloatField;
    JQueryMWST_3: TFloatField;
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
    JoArtTabPR_EINHEIT: TFloatField;
    JoArtTabEPREIS: TFloatField;
    JoArtTabRABATT: TFloatField;
    JoArtTabSTEUER_CODE: TIntegerField;
    JoArtDS: TDataSource;
    JoArtTabBEZEICHNUNG: TMemoField;
    JoArtTabSteuer: TStringField;
    JoArtTabG_PREIS: TFloatField;
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
    Angebotdrucken1: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    N5: TMenuItem;
    ArtPan: TPanel;
    Label35: TLabel;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    JQueryMSUMME_0: TFloatField;
    JQueryMSUMME_1: TFloatField;
    JQueryMSUMME_2: TFloatField;
    JQueryMSUMME_3: TFloatField;
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
    JourPosGrid: TOFDBGrid;
    Splitter1: TSplitter;
    JourGrid: TOFDBGrid;
    InRechnungwandeln1: TMenuItem;
    ToolButton1: TToolButton;
    inEKBestellungumwandeln1: TMenuItem;
    JQueryERST_NAME: TStringField;
    JourInfoTS: TTabSheet;
    JQuerySTADIUM: TIntegerField;
    JQueryINFO: TMemoField;
    JourInfoMemo: TDBMemo;
    Panel2: TPanel;
    InfoSaveBtn: TSpeedButton;
    InfoCancelBtn: TSpeedButton;
    SpeedButton3: TSpeedButton;
    JQueryCALC_NAME: TStringField;
    JQueryKUN_ANREDE: TStringField;
    JQueryKUN_NAME2: TStringField;
    JQueryKUN_NAME3: TStringField;
    PopupMenu1: TPopupMenu;
    Stadiumndern1: TMenuItem;
    MnuStadiumOffen: TMenuItem;
    MnuStadiumUmgewandelt: TMenuItem;
    MnuStadiumAbgelehnt: TMenuItem;
    MnuStadiumPruefen: TMenuItem;
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
    procedure JourGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure AgbPrintBtn1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure InRechnungwandeln1Click(Sender: TObject);
    procedure inEKBestellungumwandeln1Click(Sender: TObject);
    procedure InfoSaveBtnClick(Sender: TObject);
    procedure InfoCancelBtnClick(Sender: TObject);
    procedure MnuStadiumChange(Sender: TObject);
    procedure JourGridContextPopup(Sender: TObject; MousePos: TPoint;
    var Handled: Boolean);
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
    
    procedure UpdateReView;
    procedure SetSort (Index: Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;
    
var
  JournalVKAuftragForm: TJournalVKAuftragForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Tool1, OF_MAIN,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Link, OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.FormCreate(Sender: TObject);
var 
  ja, mo, ta: word;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  RePrintBtn.Caption := 'Auftrag';

  Scaled := TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  OnUpdateStatusBar := nil;
  First     := True;
  LastID    := -1;
  LastSDate := -1;
  decodedate (now, ja, mo, ta);

  DatumAW.KindRange := ksMonth;
  DatumAW.StartDate := now;
  LastRange         := ord(ksMonth);

  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;

  SortName  := _('Belegnummer');
  SortField := 'VRENUM, RDATUM';
  JahrCBChange(Sender);

  Allgemein.Tabvisible := False;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.FormActivate(Sender: TObject);
var 
  ID: Integer;
begin
  if First then
  begin
    LastID := -1;

    JourGrid.RowColor1    := DM1.C2Color;
    JourPosGrid.RowColor1 := DM1.C2Color;
    JourGrid.EditColor    := DM1.EditColor;
    JourPosGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_AuftrBest', 102);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_AuftrBest', 101);

    ID := DM1.ReadIntegerU ('Journale\AuftrBest', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    LastSDate := DM1.ReadIntegerU ('Journale\AuftrBest', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate <> DatumAW.StartDate) then 
      DatumAW.StartDate := LastSDate;

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
procedure TJournalVKAuftragForm.FormDeactivate(Sender: TObject);
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
procedure TJournalVKAuftragForm.JahrCBChange(Sender: TObject);
begin
  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;
  LastID   := -1;

  if First then 
    exit;

  UpdateQuery;

  if ord(DatumAW.KindRange)<>LastRange then
  begin
    DM1.WriteStringU ('Journale', 'Default', 'Benutzer-Journaleinstellungen');
    DM1.WriteIntegerU ('Journale\AuftrBest', 'RANGE', Ord(DatumAW.KindRange));
  end;
  DM1.WriteIntegerU ('Journale\AuftrBest', 'START-DATE', Trunc(DatumAW.StartDate));
end; 

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.SetSort (Index: Integer);
begin
  case Index of
    {RDATUM} 
    2: begin 
      Datum1.Checked :=True;
      sortfield := 'RDATUM,length(VRENUM),VRENUM';
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
      sortfield := 'STADIUM,RDATUM,length(VRENUM),VRENUM';
      SortName  := _('Stadium');
    end;
    {PREIS}  
    5: begin 
      Preis1.Checked :=True;
      sortfield := 'BSUMME,RDATUM,length(VRENUM),VRENUM';
      SortName  := _('Summe');
    end;
    {RNUM}else begin 
      Belegnummer1.Checked :=True;
      sortfield := 'length(VRENUM),VRENUM,RDATUM';
      SortName  := _('Belegnummer');
    end;
  end;
  if Not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JourGridDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var 
  num: integer;
begin
  with sender as Tdbgrid do
  begin
    if (column.fieldname = 'STADIUM') then
    begin
      canvas.fillrect (rect);
      Case column.field.asinteger of
        //0   :num :=3; // gelb, in Bearbeitung
        //10  :num :=4; // violett, warte auf Freigabe
        //20  :num :=0; // cyan, Fertig
        //30..69   :num :=1; // rot
        //30  :num :=2; // grün, in Rechnung gewandelt

        100: num := 2; // grün, in Rechnung gewandelt
        101: num := 1; // rot, vom Kunden abgelehnt
        102: num := 3; // bitte prüfen
        else num := 0;
      end;
      mainform.imagelist1.Draw (Canvas, rect.left, rect.top, num, true);
    end;
  end;
end;              

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  fn: string; 
  i: integer;
begin
  fn := uppercase (Field.FieldName);

  if fn = 'VRENUM'    then I := 1 else
  if fn = 'RDATUM'    then I := 2 else
  if fn = 'KUN_NAME1' then I := 3 else
  if fn = 'CALC_NAME' then I := 3 else
  if fn = 'STADIUM'   then I := 4 else
  if fn = 'CALCSTAD'  then I := 4 else
  if fn = 'NSUMME'    then I := 5 else
  if fn = 'MSUMME'    then I := 5 else
  if fn = 'BSUMME'    then I := 5
  else I := 0;

  SetSort (I);
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.UpdateReView;
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
procedure TJournalVKAuftragForm.PrintJournalBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg(VK_AUF, trunc(vonDatum), trunc(bisDatum), DatumAW.Text, 0);
  MainForm.FormActivate (Self);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Auftragsjournales' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.UpdateQuery;
var 
  OldTime: DWord; 
  I: Integer; 
  SF: String;
begin
  Application.ProcessMessages;
  OldTime := 0;
  try
    OldTime := GetTickCount;
    Screen.Cursor := crSQLWait;
    JQuery.Close;
    JQuery.SQL.Clear;
    JQuery.SQL.Add ('SELECT');
    JQuery.SQL.Add ('REC_ID,ADDR_ID,VRENUM,RDATUM,LDATUM,ADATUM,ATRNUM,VLSNUM,');
    JQuery.SQL.Add ('NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,STADIUM,KUN_NUM,SOLL_STAGE,SOLL_NTAGE,');
    JQuery.SQL.Add ('KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,MWST_1,MWST_2,MWST_3,');
    JQuery.SQL.Add ('LDATUM AS LDATUM_ORG,ADATUM,ATRNUM,VLSNUM,KM_STAND,IST_SKONTO,');
    JQuery.SQL.Add ('IST_BETRAG,IST_ZAHLDAT AS IST_ZAHLDAT_ORG,MAHNKOSTEN,SOLL_SKONTO,');
    JQuery.SQL.Add ('ERST_NAME,INFO FROM JOURNAL');
    JQuery.SQL.Add ('WHERE RDATUM >=:VON AND RDATUM<=:BIS');
    JQuery.SQL.Add ('AND QUELLE=' + inttostr (VK_AUF));
    JQuery.SQL.Add ('ORDER BY ' + sortfield);
    JQuery.ParamByName ('VON').AsDate := VonDatum;
    JQuery.ParamByName ('BIS').AsDate := BisDatum;
    JQuery.Open;
  finally
    Screen.Cursor := crDefault;
    QueryTime := gettickcount - oldtime;

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
      if Pos(uppercase(JourGrid.Columns[i].Field.FieldName), SF) = 1
      then JourGrid.Columns[i].Title.Font.Style := [fsBold];
    end;
  end;
end;                                     

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JQueryCalcFields(DataSet: TDataSet);
begin
  if (JQuerySOLL_SKONTO.Value > 0) and (JQuerySOLL_STAGE.Value > 0) then 
    JQueryKondit.Value := JQuerySOLL_STAGE.AsString + ' ' + _('T.') + ' ' +
      formatfloat ('0.0"%"', JQuerySOLL_SKONTO.Value) + ' ' +
      JQuerySOLL_NTAGE.AsString + ' ' + _('T.Netto')
  else 
  if JQuerySOLL_NTAGE.Value < 2 then 
    JQueryKondit.Value := _('sofort')
  else 
    JQueryKondit.Value := JQuerySOLL_NTAGE.AsString + ' ' + _('Tage Netto');

  {
  S:=JqueryKUN_Anrede.AsString;
  
  if length(JQueryKUN_NAME1.AsString)>0 then
  begin
  if Length(S)>0 then S :=S+' ';
  S :=S+JQueryKUN_NAME1.AsString;
  end;
  if length(JQueryKUN_NAME2.AsString)>0 then
  begin
  if Length(S)>0 then S :=S+' ';
  S :=S+JQueryKUN_NAME2.AsString;
  end;
  if length(JQueryKUN_NAME3.AsString)>0 then
  begin
  if Length(S)>0 then S :=S+' ';
  S :=S+JQueryKUN_NAME3.AsString;
  end;
  JQueryCalc_Name.AsString :=S;
  }
  JQueryCalc_Name.AsString := Trim(JqueryKUN_Anrede.AsString + ' ' +
  JQueryKUN_NAME1.AsString + ' ' +
  JQueryKUN_NAME2.AsString + ' ' +
  JQueryKUN_NAME3.AsString);
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
  Case JoArtTabSteuer_Code.Value of
    0: JoArtTabSteuer.Value := '-';
    1: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_1.Value);
    2: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_2.Value);
    3: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', JQueryMWST_3.Value);
    else JoArtTabSteuer.Value := '???';
  end;

  if JoArtTabArtikelTyp.Value = 'T' then 
    JoArtTabSteuer.Value := '';
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then 
  begin 
    key := 0; 
    JQuery.Refresh; 
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then 
    exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then 
    UpdateReView;

  Journaldrucken1.Enabled    := JQuery.RecordCount>0;
  angebotdrucken1.Enabled    := JQuery.RecordCount>0;
  Kopieren1.Enabled          := JQuery.RecordCount>0;
  InRechnungwandeln1.Enabled := JQuery.RecordCount>0;
  Storno1.Enabled            := JQuery.RecordCount>0;
  Suchen1.Enabled            := JQuery.RecordCount>0;

  LastID := JQueryRec_ID.Value;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_AuftrBest', 102);
  dm1.GridSaveLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_AuftrBest', 101);
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.Kopieren1Click(Sender: TObject);
begin
  DM1.CopyRechnung (JQueryRec_ID.Value, VK_AUF_EDI);
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.InRechnungwandeln1Click(Sender: TObject);
var 
  ID: Integer;
begin
  ID := DM1.CopyRechnung (JQueryRec_ID.Value, VK_RECH_EDI);

  try
    JQuery.Edit;
    JQuerySTADIUM.AsInteger := 100; // Stadium für "in Rechnung gewandelt"
    JQuery.Post;
  except
    JQuery.Cancel;
  end;

  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
       mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (VK_RECH_EDI, ID, 0, False);
  end;
end;  

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.AgbPrintBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (VK_AUF, JQueryRec_ID.AsInteger, False);
  MainForm.FormActivate (Self);
  {$ELSE}
  {$IFDEF TERMINMANAGER}//Kommputer
  MainForm.CAO_To_TMObj.OpenPrintBelegDialog (VK_AUF, JQueryRec_ID.AsInteger);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Auftrags' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.Aktualisieren1Click(Sender: TObject);
begin
  JQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.Positionen1Click(Sender: TObject);
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
procedure TJournalVKAuftragForm.Preis1Click(Sender: TObject);
begin
  SetSort(tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung: String;
begin
  SuchZeit   := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');
  Datensatz  := Inttostr(JQuery.RecNo) + ' ' + _('von') + ' ' + inttostr (JQuery.RecordCount);
  Sortierung := _('Sortierung : ') + SortName;

  if assigned (OnUpdateStatusBar) then 
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.StornoBtn1Click(Sender: TObject);
begin
  if MessageDlg (Format(_('Wollen Sie den Auftrag Nr.:%s ' +
    'wirklich stornieren ?'), [JQueryVRenum.Value]),
    mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if DM1.Storno_Angebot (JQueryRec_ID.Value) then
    begin
      JQuery.Refresh;
      JQueryAfterScroll(nil);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JourDSDataChange(Sender: TObject; Field: TField);
begin
  if JQueryRec_ID.Value <> LastID then 
    JQueryAfterScroll (nil);
  InfoSaveBtn.Enabled := (JQuery.RecordCount > 0) and (JQuery.State in [dsEdit, dsInsert]);
  InfoCancelBtn.Enabled := InfoSaveBtn.Enabled;
end;                                                 

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.SuchenBtn1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := JourGrid.Col;
  f := JourGrid.Columns[i-1].FieldName;
  t := MainForm.FindDialog1.FindText;

  if frDown in MainForm.FindDialog1.Options then 
    JQuery.Next
  else 
    JQuery.Prior;
  repeat
    if frMatchCase in MainForm.FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, JQuery.FieldByName(f).AsString) > 0;
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
procedure TJournalVKAuftragForm.ArtPanResize(Sender: TObject);
begin
  DatumAW.Left := ArtPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.inEKBestellungumwandeln1Click(Sender: TObject);
var 
  ID: Integer;
begin
  ID := DM1.CopyRechnung (JQueryRec_ID.Value, EK_BEST_EDI);
  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
    mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (EK_BEST_EDI, ID, 0, False);
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.InfoSaveBtnClick(Sender: TObject);
begin
  JQuery.Post;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.InfoCancelBtnClick(Sender: TObject);
begin
  JQuery.CAncel;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.MnuStadiumChange(Sender: TObject);
begin
  if JQuery.RecordCount = 0 then 
    exit;
  if Sender is tMenuItem then
  begin
    JQuery.Edit;
    JQueryStadium.AsInteger := tMenuItem(Sender).Tag;
    JQuery.Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.JourGridContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  // Popup unterdrücken wenn keine Daten vorhanden
  Handled := JQuery.RecordCount = 0;
end;                                                                  

//------------------------------------------------------------------------------
procedure TJournalVKAuftragForm.ReInfoPCChange(Sender: TObject);
begin
  if (ReInfoPC.Visible) and (ReInfoPC.ActivePage = DateiTS) then
  begin
    if LinkForm.MainPanel.Parent <> DateiPan then 
      LinkForm.MainPanel.Parent := DateiPan;

    LinkForm.SetModul (VK_AUF, JQueryRec_ID.AsInteger, DateiPan);
  end;
end;

//------------------------------------------------------------------------------

end.

