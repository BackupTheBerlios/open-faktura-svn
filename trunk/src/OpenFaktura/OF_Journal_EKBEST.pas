{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Journal: Einkauf Bestellungen                                     }
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
{ 26.05.2003 - mit einem Rechtsklick im Journal kann jetzt der Bestellstatus }
{              manuell geändert werden }
{ 31.05.2003 - in Positionsdetails wird jetzt auch die bereits eingekaufte }
{              Menge angezeigt }
{            - offene und überfällige Bestellungen werden im Journal rot }
{              angezeigt }
{ 09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert }
{ 25.02.2004 - Filter für "nur offene Bestellungen" eingebaut }
{ 13.03.2004 - Dateilinks implementiert }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Journal_EKBest;

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
  ImgList,
  SortGrid,
  JvDBCtrl,
}

type
  TJournalEKBestForm = class(TForm)
    JourDS: TDataSource;
    JournalPanel: TPanel;
    JQuery: TOfZQuery;
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
    JQueryPROJEKT: TStringField;
    JQuerySOLL_SKONTO: TFloatField;
    JQuerySOLL_STAGE: TLargeintField;
    JQuerySOLL_NTAGE: TLargeintField;
    JQueryMWST_1: TFloatField;
    JQueryMWST_2: TFloatField;
    JQueryMWST_3: TFloatField;
    JoArtTab: TZQuery;
    JoArtTabREC_ID: TIntegerField;
    JoArtTabJOURNAL_ID: TIntegerField;
    JoArtTabARTIKELTYP: TStringField;
    JoArtTabARTIKEL_ID: TIntegerField;
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
    EKBestellungdrucken1: TMenuItem;
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
    EKBestPrintBtn: TToolButton;
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
    InEinkaufwandeln1: TMenuItem;
    ToolButton1: TToolButton;
    JQuerySTADIUM: TIntegerField;
    JQueryLTERMIN: TDateField;
    JQueryCalcStad: TStringField;
    PopupMenu1: TPopupMenu;
    Stadiumndern1: TMenuItem;
    offen1: TMenuItem;
    vollgeliefert1: TMenuItem;
    teillieferung1: TMenuItem;
    JoArtTabMENGE_EK: TFloatField;
    JQueryERST_NAME: TStringField;
    Filter1: TMenuItem;
    N1: TMenuItem;
    AlleBestellungen1: TMenuItem;
    nuroffeneBestellungen1: TMenuItem;
    FilterLab: TLabel;
    DateiTS: TTabSheet;
    DateiPan: TPanel;
    N6: TMenuItem;
    nichtlieferbar1: TMenuItem;
    JQueryCALC_NAME: TStringField;
    JQueryKUN_ANREDE: TStringField;
    JQueryKUN_NAME2: TStringField;
    JQueryKUN_NAME3: TStringField;
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
    procedure EKBestPrintBtn1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure InEinkaufwandeln1Click(Sender: TObject);
    procedure vollgeliefert1Click(Sender: TObject);
    procedure JourGridApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure FilterClick(Sender: TObject);
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
  JournalEKBestForm: TJournalEKBestForm;

implementation

uses
  GNUGetText,
  OF_Tool1, OF_DM, OF_MAIN,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Link, OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.FormCreate(Sender: TObject);
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
  Filter    := 0;
  decodedate (now, ja, mo, ta);

  {$IFDEF ALPHA}
  JoArtTab.Sql.Text :=
  'select ' +
  'JP1.REC_ID,JP1.EKBESTELL_ID as JOURNAL_ID,JP1.ARTIKELTYP,' +
  'JP1.ARTIKEL_ID,JP1.POSITION,JP1.BEZEICHNUNG,JP1.MATCHCODE,' +
  'JP1.ARTNUM,JP1.BARCODE,JP1.MENGE,JP1.ME_EINHEIT,JP1.PR_EINHEIT,' +
  'JP1.EPREIS,JP1.RABATT1 as RABATT,JP1.STEUER_CODE,' +
  'SUM(JP2.MENGE) as MENGE_EK,' +
  'JP1.MENGE*JP1.EPREIS*(100-JP1.RABATT1)/100 AS G_PREIS ' +
  'from EKBESTELL_POS JP1 ' +
  'left outer join JOURNALPOS JP2 on JP2.QUELLE_SRC=JP1.REC_ID and ' +
  '(JP2.QUELLE=5 or JP2.QUELLE=15) ' +
  'where JP1.EKBESTELL_ID=:ID ' +
  'group by JP1.REC_ID ' +
  'order by POSITION';

  {$ENDIF}

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
procedure TJournalEKBestForm.FormActivate(Sender: TObject);
var 
  ID: Integer;
begin
  if First then
  begin
    LastID := -1;

    JourGrid.RowColor1    := DM1.C2Color;
    JourPosGrid.RowColor1 := DM1.C2Color;
    JourGrid.EditColor := DM1.EditColor;
    JourPosGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_EKBEST', 101);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_EKBEST', 101);

    ID := DM1.ReadIntegerU ('Journale\EK-BEST', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    Filter := DM1.ReadIntegerU ('Journale\EK-BEST', 'FILTER', 0);

    LastSDate := DM1.ReadIntegerU ('Journale\EK-BEST', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate<>DatumAW.StartDate) then 
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
procedure TJournalEKBestForm.FormDeactivate(Sender: TObject);
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
procedure TJournalEKBestForm.JahrCBChange(Sender: TObject);
begin
  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;
  LastID   := -1;

  if First then 
    exit;

  UpdateQuery;

  if ord(DatumAW.KindRange) <> LastRange then
  begin
    DM1.WriteStringU ('Journale', 'Default', 'Benutzer-Journaleinstellungen');
    DM1.WriteIntegerU ('Journale\EK-BEST', 'RANGE', Ord(DatumAW.KindRange));
  end;
  DM1.WriteIntegerU ('Journale\EK-BEST', 'START-DATE', Trunc(DatumAW.StartDate));
end;                           

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.SetSort (Index: Integer);
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
    {RNUM}
    else begin 
      Belegnummer1.Checked :=True;
      sortfield := 'length(VRENUM),VRENUM, RDATUM';
      SortName  := _('Belegnummer');
    end;
  end;
  if Not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridDrawColumnCell(Sender: TObject; 
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
        20..29  : num := 0;
        30..69  : num := 1;
        100     : num := 2;
        101     : num := 4;
        else num := 0;
      end;
      mainform.imagelist1.Draw (Canvas, rect.left, rect.top, num, true);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
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
procedure TJournalEKBestForm.UpdateReView;
var 
  mwst1, mwst2, mwst3: string;
begin
  mwst1 := formatfloat('0.0', JQueryMWST_1.Value) + '%';
  mwst2 := formatfloat('0.0', JQueryMWST_2.Value) + '%';
  mwst3 := formatfloat('0.0', JQueryMWST_3.Value) + '%';

  JoArtTab.Close;
  JoArtTab.ParamByName('ID').AsInteger := JQueryREC_ID.AsInteger;
  JoArtTab.Open;

  ReInfoPCChange(Self);
end;                  

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.PrintJournalBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg (
    EK_BEST,
    trunc(vonDatum),
    trunc(bisDatum),
    DatumAW.Text,
    0
  );
  MainForm.FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.UpdateQuery;
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
    {$IFDEF ALPHA}
    JQuery.Sql.Text :=
    'SELECT ' +
    'REC_ID,ADDR_ID,BELEGNUM as VRENUM,BELEGDATUM as RDATUM,' +
    'NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,' +
    'STADIUM,KUN_NUM,SOLL_STAGE,SOLL_NTAGE,KUN_ANREDE,KUN_NAME1,' +
    'KUN_NAME2,KUN_NAME3,PROJEKT,"" as ORGNUM,GEGENKONTO,WAEHRUNG,MWST_1,' +
    'MWST_2,MWST_3,TERMIN AS LTERMIN,SOLL_SKONTO,ERST_NAME ' +
    'FROM EKBESTELL WHERE PREISANFRAGE="N" and ' +
    'BELEGDATUM >=:VON AND BELEGDATUM<=:BIS';
    {$ELSE}
    JQuery.SQL.Text :=
    'SELECT ' +
    'REC_ID,ADDR_ID,VRENUM,RDATUM,' +
    'NSUMME,MSUMME_0,MSUMME_1,MSUMME_2,MSUMME_3,MSUMME,BSUMME,' +
    'STADIUM,KUN_NUM,SOLL_STAGE,SOLL_NTAGE,KUN_ANREDE,KUN_NAME1,' +
    'KUN_NAME2,KUN_NAME3,PROJEKT,ORGNUM,GEGENKONTO,WAEHRUNG,MWST_1,' +
    'MWST_2,MWST_3,LDATUM AS LTERMIN,SOLL_SKONTO,ERST_NAME ' +
    'FROM JOURNAL WHERE RDATUM >=:VON AND RDATUM<=:BIS ' +
    'AND QUELLE=' + inttostr (EK_BEST);
    {$ENDIF}
    if Filter = 1
    then JQuery.SQL.Add ('AND STADIUM<100');

    JQuery.SQL.Add ('ORDER BY ' + sortfield);
    JQuery.ParamByName ('VON').AsDate := VonDatum;
    JQuery.ParamByName ('BIS').AsDate := BisDatum;
    JQuery.Open;

    if Filter = 1 then
    begin
      FilterLab.Caption := ' ' + _('gefiltert (nur offene Bestellungen)');
      nuroffeneBestellungen1.Checked := True;
    end else
    begin
      FilterLab.Caption := '';
      AlleBestellungen1.Checked := True;
    end;

    SF := Uppercase(SortField);
    if Pos('LENGTH(', SF) = 1 then 
      delete (SF, 1, length('LENGTH('));
    if Pos('KUN_NAME1', SF) = 1 then 
      SF := 'CALC_NAME';
    if Pos('STADIUM', SF) = 1 then 
      SF := 'CALCSTAD';
    for I := 0 to JourGrid.Columns.Count -1 do
    begin
      JourGrid.Columns[i].Title.Font.Style := [];
      if Pos(uppercase(JourGrid.Columns[i].Field.FieldName), SF) = 1
      then JourGrid.Columns[i].Title.Font.Style := [fsBold];
    end;

  finally
    Screen.Cursor := crDefault;
    QueryTime := gettickcount - oldtime;
  end;
end;  

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JQueryCalcFields(DataSet: TDataSet);
begin
  if (JQuerySOLL_SKONTO.Value > 0)and(JQuerySOLL_STAGE.Value > 0) then 
    JQueryKondit.Value := JQuerySOLL_STAGE.AsString + ' T. ' +
      formatfloat ('0.0"%"', JQuerySOLL_SKONTO.Value) + ' ' +
      JQuerySOLL_NTAGE.AsString + ' ' + _('T.Netto')
  else 
  if JQuerySOLL_NTAGE.Value < 2 then 
    JQueryKondit.Value := _('sofort')
  else 
    JQueryKondit.Value := JQuerySOLL_NTAGE.AsString + ' ' + _('Tage Netto');

  JQueryCalcStad.Value := GetEKBestStatus(JQueryStadium.Value);

  JQueryCalc_Name.AsString :=
    Trim (JqueryKUN_Anrede.AsString + ' ' +
    JQueryKUN_NAME1.AsString + ' ' +
    JQueryKUN_NAME2.AsString + ' ' +
    JQueryKUN_NAME3.AsString);
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JoArtTabCalcFields(DataSet: TDataSet);
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
procedure TJournalEKBestForm.JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then 
  begin 
    key := 0; 
    JQuery.Refresh; 
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then 
    exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then 
    UpdateReView;

  Journaldrucken1.Enabled      := JQuery.RecordCount > 0;
  ekbestellungdrucken1.Enabled := JQuery.RecordCount > 0;
  Kopieren1.Enabled            := JQuery.RecordCount > 0;
  Storno1.Enabled              := JQuery.RecordCount > 0;
  Suchen1.Enabled              := JQuery.RecordCount > 0;
  PopupMenu1.AutoPopup         := JQuery.RecordCount > 0;

  LastID := JQueryRec_ID.Value;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_EKBEST', 101);
  dm1.GridSaveLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_EKBEST', 101);
end;                                                   

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Kopieren1Click(Sender: TObject);
var ID: Integer;
begin
  ID := DM1.CopyRechnung (JQueryRec_ID.Value, EK_BEST_EDI);
  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
     mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (EK_BEST_EDI, ID, 0, False);
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.InEinkaufwandeln1Click(Sender: TObject);
var 
  ID: INteger;
begin
  DM1.CopyRechnung (JQueryRec_ID.Value, EK_RECH_EDI);
  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
     mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (EK_RECH_EDI, ID, 0, False);
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.EKBestPrintBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (EK_BEST, JQueryRec_ID.AsInteger, False);
  MainForm.FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Aktualisieren1Click(Sender: TObject);
begin
  JQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.Positionen1Click(Sender: TObject);
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
procedure TJournalEKBestForm.Preis1Click(Sender: TObject);
begin
  SetSort(tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.UpdateStatus;
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
procedure TJournalEKBestForm.StornoBtn1Click(Sender: TObject);
begin
  if MessageDlg (Format(_('Wollen Sie die EK-Bestellung Nr.:%s ' +
      'wirklich stornieren ?'), [JQueryVRenum.Value]),
      mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if DM1.Storno_EKBestellung (JQueryRec_ID.Value) then
    begin
      JQuery.Refresh;
      JQueryAfterScroll(nil);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourDSDataChange(Sender: TObject; Field: TField);
begin
  if JQueryRec_ID.Value <> LastID then 
    JQueryAfterScroll (nil);
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.SuchenBtn1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.FindDialog1Find(Sender: TObject);
var f, t: string;
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
procedure TJournalEKBestForm.ArtPanResize(Sender: TObject);
begin
  DatumAW.Left := ArtPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.vollgeliefert1Click(Sender: TObject);
var ST: Integer;
begin
  if Sender is tMenuItem then
  begin
    case tMenuItem(Sender).Tag of
      1: st := 20;
      2: st := 30;
      3: st := 100;
      4: st := 101;
      else st := -1;
    end;
    if (jquery.recordcount > 0) and (st > 0) and (jquerystadium.asinteger <> st) then
    begin
      if not (jquery.state in [dsEdit, dsInsert]) then 
        JQuery.Edit;
      JQueryStadium.AsInteger := ST;
      JQuery.Post;

      DM1.UpdateEKBestMenge; // Bestellmengen aktualisieren
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.JourGridApplyCellAttribute(Sender: TObject;
Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (Int(JQueryLTERMIN.AsDateTime) <= Int(Now)) and
     (JQuerySTADIUM.AsInteger >= 20) and
     (JQuerySTADIUM.AsInteger < 100) then 
  begin
    Canvas.Font.Color := clRed;
  end;
end;  

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.FilterClick(Sender: TObject);
begin
  if (Sender is TMenuItem)and(tMenuItem(Sender).Tag in [0, 1]) then
  begin
    Filter := tMenuItem(Sender).Tag;
    DM1.WriteIntegerU ('Journale\EK-BEST', 'FILTER', Filter);
    UpdateQuery;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKBestForm.ReInfoPCChange(Sender: TObject);
begin
  if (ReInfoPC.Visible) and (ReInfoPC.ActivePage = DateiTS) then
  begin
    if LinkForm.MainPanel.Parent <> DateiPan then 
      LinkForm.MainPanel.Parent := DateiPan;

    LinkForm.SetModul (EK_BEST, JQueryRec_ID.AsInteger, DateiPan);
  end;
end;  

//------------------------------------------------------------------------------

end.

