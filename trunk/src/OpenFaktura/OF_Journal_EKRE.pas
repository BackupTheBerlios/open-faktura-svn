{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Journal: Einkaufs-Rechungen                                       }
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
{ 13.07.2003 - Filter eingebaut }
{ 09.11.2003 - Positionsdetails wurden nach erneutem Öffnen nicht aktualisiert }
{ 13.03.2004 - Dateilinks implementiert }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Journal_EKRE;

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
  TJournalEKREForm = class(TForm)
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
    JQuerySTADIUM: TIntegerField;
    JQueryKUN_NUM: TStringField;
    JQueryKUN_NAME1: TStringField;
    JQueryORGNUM: TStringField;
    JQueryGEGENKONTO: TIntegerField;
    JQueryWAEHRUNG: TStringField;
    JQueryIST_ZAHLDAT: TDateField;
    JQueryLDATUM: TDateField;
    JQueryKondit: TStringField;
    JQueryCalcStad: TStringField;
    JQueryLDATUM_ORG: TDateField;
    JQueryKM_STAND: TIntegerField;
    JQueryADATUM: TDateField;
    JQueryATRNUM: TIntegerField;
    JQueryPROJEKT: TStringField;
    JQueryMAHNKOSTEN: TFloatField;
    JQueryIST_BETRAG: TFloatField;
    JQueryIST_SKONTO: TFloatField;
    JQueryIST_ZAHLDAT_ORG: TDateField;
    JQuerySOLL_SKONTO: TFloatField;
    JQueryVLSNUM: TStringField;
    SumQuery: TZQuery;
    SumQuerySTADIUM: TIntegerField;
    SumQueryNetto: TFloatField;
    SumQueryMwSt: TFloatField;
    SumQueryBrutto: TFloatField;
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
    Summen1: TMenuItem;
    N2: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Journaldrucken1: TMenuItem;
    N3: TMenuItem;
    SumQueryWAEHRUNG: TStringField;
    Kopieren1: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    Zahlungseingang1: TMenuItem;
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
    ViewSumBtn: TToolButton;
    StornoBtn: TToolButton;
    ZEBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    Suchen1: TMenuItem;
    Drucken1: TMenuItem;
    Panel1: TPanel;
    DetailPan: TPanel;
    ReInfoPC: TPageControl;
    Allgemein: TTabSheet;
    TabSheet1: TTabSheet;
    JourPosGrid: TOFDBGrid;
    SumPan: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    N_OFF_PAN: TPanel;
    N_BEZSKONTO_PAN: TPanel;
    N_BEZ_PAN: TPanel;
    M_BEZ_PAN: TPanel;
    M_BEZSKONTO_PAN: TPanel;
    M_OFF_PAN: TPanel;
    B_BEZ_PAN: TPanel;
    B_BEZSKONTO_PAN: TPanel;
    B_OFF_PAN: TPanel;
    N_SUM_PAN: TPanel;
    M_SUM_PAN: TPanel;
    B_SUM_PAN: TPanel;
    Splitter1: TSplitter;
    JourGrid: TOFDBGrid;
    JQueryMAHNSTUFE: TIntegerField;
    JQueryMAHNDATUM: TDateField;
    inRechnungumwandeln1: TMenuItem;
    N1: TMenuItem;
    nurbezahlteRechnungen1: TMenuItem;
    nurunbezahlteRechnungen1: TMenuItem;
    alleRechnungen1: TMenuItem;
    FilterLab: TLabel;
    JQueryERST_NAME: TStringField;
    Filter1: TMenuItem;
    JQueryKUN_ANREDE: TStringField;
    JQueryKUN_NAME2: TStringField;
    JQueryKUN_NAME3: TStringField;
    JQueryCALC_NAME: TStringField;
    DateiTS: TTabSheet;
    DateiPan: TPanel;
    JQueryBRUTTO_FLAG: TBooleanField;
    JQuerySOLL_STAGE: TLargeintField;
    JQuerySOLL_NTAGE: TLargeintField;
    procedure JahrCBChange(Sender: TObject);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ViewSumBtn1Click(Sender: TObject);
    procedure PrintJournalBtn1Click(Sender: TObject);
    procedure JQueryCalcFields(DataSet: TDataSet);
    procedure SumQueryAfterOpen(DataSet: TDataSet);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Kopieren1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Zahlungseingang1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure StornoBtn1Click(Sender: TObject);
    procedure JourDSDataChange(Sender: TObject; Field: TField);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure inRechnungumwandeln1Click(Sender: TObject);
    procedure MenuFilterClick(Sender: TObject);
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
  JournalEKREForm: TJournalEKREForm;

implementation

uses
  GNUGetText,
  OF_Tool1, OF_DM, OF_DBGrid_Layout, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Link, OF_ZahlungseingangDlg;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TJournalEKREForm.FormCreate(Sender: TObject);
//var ja,mo,ta:word;
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

  Filter    := 3;
  alleRechnungen1.Checked := True;

  //decodedate (now,ja,mo,ta);

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
procedure TJournalEKREForm.FormActivate(Sender: TObject);
var 
  ID: Integer;
begin
  if First then
  begin
    LastID := -1;

    JourGrid.RowColor1 := DM1.C2Color;
    JourPosGrid.RowColor1 := DM1.C2Color;

    JourGrid.EditColor := DM1.EditColor;
    JourPosGrid.EditColor := DM1.EditColor;


    dm1.GridLoadLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_EKRE', 101);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_EKRE', 101);

    ID := DM1.ReadIntegerU ('Journale\EK-RE', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    LastSDate := DM1.ReadIntegerU ('Journale\EK-RE', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate<>DatumAW.StartDate) then 
      DatumAW.StartDate := LastSDate;

    Filter := DM1.ReadIntegerU ('Journale\EK-RE', 'FILTER', 3);

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
procedure TJournalEKREForm.FormDeactivate(Sender: TObject);
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
procedure TJournalEKREForm.JahrCBChange(Sender: TObject);
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
    DM1.WriteIntegerU ('Journale\EK-RE', 'RANGE', Ord(DatumAW.KindRange));
  end;
  DM1.WriteIntegerU ('Journale\EK-RE', 'START-DATE', Trunc(DatumAW.StartDate));
end; 

//------------------------------------------------------------------------------
procedure TJournalEKREForm.SetSort (Index: Integer);
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
      sortfield := 'length(VRENUM),VRENUM,RDATUM';
      SortName  := _('Belegnummer');
    end;
  end;
  if Not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.JourGridDrawColumnCell(Sender: TObject; 
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
        70..79  : num := 3;
        80..99  : num := 2;
        100..255: num := 4;
        else num := 0;
      end;
      mainform.imagelist1.Draw (Canvas, rect.left, rect.top, num, true);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
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
procedure TJournalEKREForm.UpdateReView;
var 
  mwst1,
  mwst2,
  mwst3: string;
  I    : Integer;
begin
  mwst1 := formatfloat ('0.0', JQueryMWST_1.Value) + '%';
  mwst2 := formatfloat ('0.0', JQueryMWST_2.Value) + '%';
  mwst3 := formatfloat ('0.0', JQueryMWST_3.Value) + '%';

  JoArtTab.Close;
  JoArtTab.ParamByName('ID').AsInteger := JQueryREC_ID.AsInteger;
  JoArtTab.Open;


  if JourPosGrid.Columns.Count > 0 then
  begin
    for i := 0 to JourPosGrid.Columns.Count-1 do
    begin
      if (JQueryBRUTTO_FLAG.AsBoolean) and (uppercase(JourPosGrid.Columns[i].FieldName) = 'EPREIS') then
      begin
        JoArtTabEPREIS.DisplayLabel := _('E-Preis B');
      end else
      if (not JQueryBRUTTO_FLAG.AsBoolean) and (uppercase(JourPosGrid.Columns[i].FieldName) = 'EPREIS') then
      begin
        JoArtTabEPREIS.DisplayLabel := _('E-Preis');
      end;

      if (JQueryBRUTTO_FLAG.AsBoolean) and (uppercase(JourPosGrid.Columns[i].FieldName) = 'G_PREIS') then
      begin
        JoArtTabG_PREIS.DisplayLabel := _('G-Preis B');
      end else
      if (not JQueryBRUTTO_FLAG.AsBoolean) and (uppercase(JourPosGrid.Columns[i].FieldName) = 'G_PREIS') then
      begin
        JoArtTabG_PREIS.DisplayLabel := _('G-Preis');
      end;
    end;
  end;
  JourPosGrid.Invalidate;

  ReInfoPCChange(Self);
end;                                          

//------------------------------------------------------------------------------
procedure TJournalEKREForm.ViewSumBtn1Click(Sender: TObject);
begin
  Summen1.Checked := not Summen1.Checked;
  SumPan.Visible  := Summen1.Checked;
  ViewSumBtn.Down := Summen1.Checked;

  if SumPan.Visible then
  begin
    SumQuery.Close;
    SumQuery.ParamByName ('VDAT').AsDateTime  := VonDatum;
    SumQuery.ParamByName ('BDAT').AsDateTime  := BisDatum + 0.99999;
    SumQuery.ParamByName ('QUELLE').AsInteger := EK_RECH;
    SumQuery.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.PrintJournalBtn1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg (EK_RECH, trunc(vonDatum), trunc(bisDatum), DatumAW.Text, 0);
  MainForm.FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.UpdateQuery;
var OldTime: DWord; I: Integer; SF: String;
begin
  Application.ProcessMessages;
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
    JQuery.SQL.Add ('IST_BETRAG, IST_ZAHLDAT AS IST_ZAHLDAT_ORG, MAHNKOSTEN, SOLL_SKONTO');
    JQuery.SQL.Add (',MAHNSTUFE,MAHNDATUM,ERST_NAME,BRUTTO_FLAG');
    JQuery.SQL.Add ('FROM JOURNAL');
    JQuery.SQL.Add ('WHERE RDATUM >=:VON AND RDATUM<=:BIS');
    JQuery.SQL.Add ('AND QUELLE=' + inttostr (EK_RECH));

    case Filter of
      1:   begin
        JQuery.SQL.Add ('AND STADIUM>=80');
        FilterLab.Caption := ' ' + _('gefiltert (nur bezahlte Rechnungen)');
        nurbezahlteRechnungen1.checked := True;
      end;
      2:   begin
        JQuery.SQL.Add ('AND STADIUM<=80');
        FilterLab.Caption := ' ' + _('gefiltert (nur offene Rechnungen)');
        nurunbezahlteRechnungen1.checked := True;
      end;
      else begin
        FilterLab.Caption := '';
        alleRechnungen1.checked := True;
      end;
    end;

    JQuery.SQL.Add ('ORDER BY ' + sortfield);
    JQuery.ParamByName ('VON').AsDate := VonDatum;
    JQuery.ParamByName ('BIS').AsDate := BisDatum;
    JQuery.Open;
  finally
    Screen.Cursor := crDefault;
    QueryTime := gettickcount - oldtime;
    if SumPan.Visible then
    begin
      SumQuery.ParamByName ('VDAT').AsDateTime  := VonDatum;
      SumQuery.ParamByName ('BDAT').AsDateTime  := BisDatum;
      SumQuery.ParamByName ('QUELLE').AsInteger := EK_RECH;
      SumQuery.Open;
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
procedure TJournalEKREForm.JQueryCalcFields(DataSet: TDataSet);
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

  JQueryCalcStad.Value := GetRechStatus(JQueryStadium.Value, EK_RECH);

  if length(JQueryVLSNUm.Value) > 0 then 
    JQueryLDatum.Value := JQueryLDATUM_ORG.Value;

  if JQueryStadium.Value >= 80 then 
    JQueryIST_ZAHLDAT.Value := JQueryIST_Zahldat_Org.Value
  else 
    JQueryIST_ZAHLDAT.AsString := '';

  JQueryCalc_Name.AsString :=
    Trim (JqueryKUN_Anrede.AsString + ' ' +
    JQueryKUN_NAME1.AsString + ' ' +
    JQueryKUN_NAME2.AsString + ' ' +
    JQueryKUN_NAME3.AsString);
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.SumQueryAfterOpen(DataSet: TDataSet);
var 
  N_Offen,
  M_Offen,
  B_Offen,
  N_Bez,
  M_Bez,
  B_Bez,
  N_BezSkonto,
  M_BezSkonto,
  B_BezSkonto: Double;
begin
  SumQuery.First;
  N_Offen     := 0;
  M_Offen     := 0;
  B_Offen     := 0;
  N_Bez       := 0;
  M_Bez       := 0;
  B_Bez       := 0;
  N_BezSkonto := 0;
  M_BezSkonto := 0;
  B_BezSkonto := 0;

  while not SumQuery.Eof do
  begin
    case SumQueryStadium.Value of
      20..79: begin
        N_Offen := N_Offen + DM1.CalcLeitWaehrung(SumQueryNetto.Value, SumQueryWAEHRUNG.Value);
        M_Offen := M_Offen + DM1.CalcLeitWaehrung(SumQueryMwSt.Value, SumQueryWAEHRUNG.Value);
        B_Offen := B_Offen + DM1.CalcLeitWaehrung(SumQueryBrutto.Value, SumQueryWAEHRUNG.Value);
      end;
      80..89: begin
        N_BezSkonto := N_BezSkonto + DM1.CalcLeitWaehrung(SumQueryNetto.Value, SumQueryWAEHRUNG.Value);
        M_BezSkonto := M_BezSkonto + DM1.CalcLeitWaehrung(SumQueryMwSt.Value, SumQueryWAEHRUNG.Value);
        B_BezSkonto := B_BezSkonto + DM1.CalcLeitWaehrung(SumQueryBrutto.Value, SumQueryWAEHRUNG.Value);
      end;
      90..99: begin
        N_Bez := N_Bez + DM1.CalcLeitWaehrung(SumQueryNetto.Value, SumQueryWAEHRUNG.Value);
        M_Bez := M_Bez + DM1.CalcLeitWaehrung(SumQueryMwSt.Value, SumQueryWAEHRUNG.Value);
        B_Bez := B_Bez + DM1.CalcLeitWaehrung(SumQueryBrutto.Value, SumQueryWAEHRUNG.Value);
      end;
    end;
    SumQuery.Next;
  end;

  sumquery.close;

  N_OFF_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', n_offen);
  M_OFF_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', m_offen);
  B_OFF_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', b_offen);

  N_BEZSKONTO_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', n_BezSkonto);
  M_BEZSKONTO_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', m_BezSkonto);
  B_BEZSKONTO_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', b_BezSkonto);

  N_BEZ_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', n_bez);
  M_BEZ_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', m_bez);
  B_BEZ_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', b_bez);

  N_SUM_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', n_offen + n_bez + n_bezskonto);
  M_SUM_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', m_offen + m_bez + m_bezskonto);
  B_SUM_PAN.Caption       := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', b_offen + b_bez + b_bezskonto);
end;                  

//------------------------------------------------------------------------------
procedure TJournalEKREForm.JoArtTabCalcFields(DataSet: TDataSet);
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
procedure TJournalEKREForm.JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then 
  begin 
    key := 0; 
    JQuery.Refresh; 
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  if JQueryRec_ID.Value = LastID then 
    exit;

  // wenn das Infofenster aktiv ist, dann den Inhalt aktualisieren
  if Positionen1.Checked then 
    UpdateReView;

  Zahlungseingang1.Enabled := 
    (JQuery.RecordCount > 0) and
    (JQueryStadium.Value<80)and
    (DM1.CaoSecurity.CanInsert(4030, 0));

  ZEBtn.Enabled            := Zahlungseingang1.Enabled;
  Journaldrucken1.Enabled  := JQuery.RecordCount>0;
  Kopieren1.Enabled        := JQuery.RecordCount>0;
  Storno1.Enabled          := JQuery.RecordCount>0;
  Suchen1.Enabled          := JQuery.RecordCount>0;

  LastID := JQueryRec_ID.Value;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_EKRE', 101);
  dm1.GridSaveLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_EKRE', 101);
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.Kopieren1Click(Sender: TObject);
var 
  ID: Integer;
begin
  ID := DM1.CopyRechnung (JQueryRec_ID.Value, EK_RECH_EDI);
  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
       mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (EK_RECH_EDI, ID, 0, False);
  end;
end;  

//------------------------------------------------------------------------------
procedure TJournalEKREForm.Aktualisieren1Click(Sender: TObject);
begin
  JQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.Positionen1Click(Sender: TObject);
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
procedure TJournalEKREForm.Zahlungseingang1Click(Sender: TObject);
var 
  ID: Integer;
begin
  ID := JQueryRec_ID.Value;
  ZEForm.Run (EK_RECH, ID);
  JQuery.Refresh;
  JQuery.Locate ('REC_ID', Variant(ID), []);
  Zahlungseingang1.Enabled := (JQuery.RecordCount > 0) and (JQueryStadium.Value < 80);
  ZEBtn.Enabled            := (JQuery.RecordCount > 0) and (JQueryStadium.Value < 80);
end;                                                                              

//------------------------------------------------------------------------------
procedure TJournalEKREForm.Preis1Click(Sender: TObject);
begin
  SetSort(tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.UpdateStatus;
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
procedure TJournalEKREForm.StornoBtn1Click(Sender: TObject);
begin
  if MessageDlg (Format(_('Wollen Sie die Einkaufsrechnung ' + #13#10 + 'Nr.:%s ' +
      'wirklich stornieren ?'), [JQueryVRenum.Value]),
      mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if DM1.Storno_Einkauf (JQueryRec_ID.Value) then
    begin
      JQuery.Refresh;
      JQueryAfterScroll(nil);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.JourDSDataChange(Sender: TObject; Field: TField);
begin
  if JQueryRec_ID.Value <> LastID then 
    JQueryAfterScroll (nil);
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.SuchenBtn1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.FindDialog1Find(Sender: TObject);
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
procedure TJournalEKREForm.ArtPanResize(Sender: TObject);
begin
  DatumAW.Left := ArtPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.inRechnungumwandeln1Click(Sender: TObject);
var 
  ID: Integer;
begin
  DM1.CopyRechnung (JQueryRec_ID.Value, VK_RECH_EDI);
  if MessageDlg(_('Wollen Sie den neu erstellten Beleg jetzt bearbeiten ?'),
       mtconfirmation, [mbyes, mbno], 0) = mryes then 
  begin
    MainForm.JumpTo (VK_RECH_EDI, ID, 0, False);
  end;
end;  

//------------------------------------------------------------------------------
procedure TJournalEKREForm.MenuFilterClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and (tMenuItem(Sender).Tag > 0) then
  begin
    Filter := tMenuItem(Sender).Tag;
    DM1.WriteIntegerU ('Journale\EK-RE', 'FILTER', Filter);
    UpdateQuery;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalEKREForm.ReInfoPCChange(Sender: TObject);
begin
  if (ReInfoPC.Visible) and (ReInfoPC.ActivePage = DateiTS) then
  begin
    if LinkForm.MainPanel.Parent <> DateiPan then 
      LinkForm.MainPanel.Parent := DateiPan;

    LinkForm.SetModul (EK_RECH, JQueryRec_ID.AsInteger, DateiPan);
  end;
end;  

//------------------------------------------------------------------------------

end.

