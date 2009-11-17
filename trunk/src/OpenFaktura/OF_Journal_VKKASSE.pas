{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Journal: Kasse (Modul Kasse)                                      }
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
{ 22.01.2003 - Version 1.0.0.49 released Jan Pokrandt }
{ 23.06.2003 - Fix: Button Tagesabschluss war aktiv, wenn keine Daten im Journal }
{              angezeigt wurden }
{ 24.05.2003 - Version zum GNU-Source hinzugefügt }
{ 29.07.2003 - In den Tagessummen werden jetzt die Überschriften korrekt angezeigt }
{ 01.01.2004 - Tagesjournal/Druck hinzugefügt }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Journal_VKKasse;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  JvExExtCtrls, JvComponent, JvSplit, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, OFDBGrid, ComCtrls, VolPeriod{???}, StdCtrls, DBCtrls, ToolWin,
  ExtCtrls, OF_Var_Const, JvMenus, OFSecurity;

{
uses
  ImgList,
  JvDBCtrl,
  AdvStatusBar,
}

type
  TJournalVKKasseForm = class(TForm)
    JourDS: TDataSource;
    JournalPanel: TPanel;
    ToolBar1: TToolBar;
    JQuery: TOFZQuery;
    JQueryRDATUM: TDateField;
    JQueryNSUMME: TFloatField;
    JQueryMSUMME: TFloatField;
    JQueryBSUMME: TFloatField;
    JQueryWAEHRUNG: TStringField;
    SumQuery: TZQuery;
    SumQueryNetto: TFloatField;
    SumQueryMwSt: TFloatField;
    SumQueryBrutto: TFloatField;
    JoArtTab: TZQuery;
    JoArtTabREC_ID: TIntegerField;
    JoArtTabJOURNAL_ID: TIntegerField;
    JoArtTabARTIKELTYP: TStringField;
    JoArtTabARTIKEL_ID: TIntegerField;
    JoArtTabATRNUM: TIntegerField;
    JoArtTabVRENUM: TStringField;
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
    PrintJournalBtn: TToolButton;
    StornoBtn: TToolButton;
    ViewSumBtn: TToolButton;
    ViewPosBtn: TToolButton;
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
    Rechnungdrucken1: TMenuItem;
    N4: TMenuItem;
    Aktualisieren1: TMenuItem;
    JQueryMSUMME_0: TFloatField;
    JQueryMSUMME_1: TFloatField;
    JQueryMSUMME_2: TFloatField;
    JQueryMSUMME_3: TFloatField;
    ArtPan: TPanel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    Drucken1: TMenuItem;
    Suchen1: TMenuItem;
    DBNavigator1: TDBNavigator;
    SuchenBtn: TToolButton;
    JQueryRN_VON: TStringField;
    JQueryRN_BIS: TStringField;
    JQueryANZAHL: TFloatField;
    JQueryGEBUCHT: TLargeintField;
    TagSumDetail: TZQuery;
    TagSumDetailDS: TDataSource;
    TagSumDetailRDATUM: TDateField;
    TagSumDetailNSUMME: TFloatField;
    TagSumDetailMSUMME_0: TFloatField;
    TagSumDetailMSUMME_1: TFloatField;
    TagSumDetailMSUMME_2: TFloatField;
    TagSumDetailMSUMME_3: TFloatField;
    TagSumDetailMSUMME: TFloatField;
    TagSumDetailBSUMME: TFloatField;
    TagSumDetailWAEHRUNG: TStringField;
    TagSumDetailZahlart_Kurz: TStringField;
    TagBelege: TZQuery;
    TagBelegeDS: TDataSource;
    TagBelegeREC_ID: TIntegerField;
    TagBelegeVRENUM: TStringField;
    TagBelegeRDATUM: TDateField;
    TagBelegeNSUMME: TFloatField;
    TagBelegeMSUMME: TFloatField;
    TagBelegeMSUMME_0: TFloatField;
    TagBelegeMSUMME_1: TFloatField;
    TagBelegeMSUMME_2: TFloatField;
    TagBelegeMSUMME_3: TFloatField;
    TagBelegeBSUMME: TFloatField;
    TagBelegeSTADIUM: TIntegerField;
    TagBelegeGEGENKONTO: TIntegerField;
    TagBelegeWAEHRUNG: TStringField;
    TagBelegeMWST_1: TFloatField;
    TagBelegeMWST_2: TFloatField;
    TagBelegeMWST_3: TFloatField;
    TagBelegeZahlart_Kurz: TStringField;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    SumPanel: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    N_SUM_PAN: TPanel;
    M_SUM_PAN: TPanel;
    B_SUM_PAN: TPanel;
    Panel2: TPanel;
    JourGrid: TOFDBGrid;
    Panel3: TPanel;
    TagSumDetailGrid: TOFDBGrid;
    TagBelegeGrid: TOFDBGrid;
    Splitter1: TJvxSplitter;
    JourPosGrid: TOFDBGrid;
    TabAbschlussBtn: TToolButton;
    TagAbschlussQuery: TZQuery;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    TabAbschlussQueryBSumme: TFloatField;
    TagAbschlussQueryWaehrung: TStringField;
    TagAbschlussQueryVRENUM: TStringField;
    TagAbschlussQueryuw_num: TIntegerField;
    Tagesabschlu1: TMenuItem;
    TagAbschlussQueryzahlart: TIntegerField;
    TagAbschlussQueryREC_ID: TIntegerField;
    Tagesjournal1: TMenuItem;
    TagesJournalBtn: TToolButton;
    TagBelegeERST_NAME: TStringField;
    JoArtTabVLSNUM: TStringField;
    TagSumDetailRN_VON: TStringField;
    TagSumDetailRN_BIS: TStringField;
    TagSumDetailANZAHL: TIntegerField;
    procedure JahrCBChange(Sender: TObject);
    procedure SortCBChange(Sender: TObject);
    procedure JourGridDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure PrintJournalBtnClick(Sender: TObject);
    { procedure RePosGridGetCellFormat(Sender: TObject; Col, Row: Integer;
    State: TGridDrawState; var FormatOptions: TFormatOptions); }
    procedure SumQueryAfterOpen(DataSet: TDataSet);
    procedure JoArtTabCalcFields(DataSet: TDataSet);
    procedure JourGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure JQueryAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure RePrintBtnClick(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Positionen1Click(Sender: TObject);
    procedure Summen1Click(Sender: TObject);
    procedure StornoBtnClick(Sender: TObject);
    procedure ArtPanResize(Sender: TObject);
    procedure Tagesabschlu1Click(Sender: TObject);
    procedure TagBelegeAfterOpen(DataSet: TDataSet);
    procedure PC1Change(Sender: TObject);
    procedure Tagesjournal1Click(Sender: TObject);
    procedure TagBelegeGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
  private
    { Private-Deklarationen }
    SortField      : String;
    SortName       : String;
    First          : Boolean;
    QueryTime      : DWord;
    LastRange      : Integer;
    LastSDate      : Integer;

    procedure UpdateStatus;

  public
    { Public-Deklarationen }
    vonDatum,
    bisDatum : tDateTime;
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

var
  JournalVKKasseForm: TJournalVKKasseForm;

implementation

uses
  GNUGetText,
  OF_Tool1, OF_DM, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_DBGrid_Layout;

{$R *.DFM}

const
  ModulID: Integer = 3050;

  //------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormCreate(Sender: TObject);
var 
  ja, mo, ta: word;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  Scaled            := TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  OnUpdateStatusBar := nil;
  First             := True;
  QueryTime         := 0;
  decodedate (now, ja, mo, ta);


  DatumAW.KindRange := ksMonth;
  DatumAW.StartDate := now;
  LastRange         := ord(ksMonth);


  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;

  JahrCBChange(Sender);

  sortname  := _('Belegnr.');
  sortfield := 'VRENUM, RDATUM';

  PC1.ActivePage := TabSheet1;
  PC1Change(Sender);

  StornoBtn.Visible  := False;
  Storno1.Enabled    := False;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormActivate(Sender: TObject);
var 
  id, I, J: Integer; 
  FN: String;
begin
  if First then
  begin
    First := False;

    JourGrid.RowColor1         := DM1.C2Color;
    JourPosGrid.RowColor1      := DM1.C2Color;
    TagSumDetailGrid.RowColor1 := DM1.C2Color;
    TagBelegeGrid.RowColor1    := DM1.C2Color;

    JourGrid.EditColor         := DM1.EditColor;
    JourPosGrid.EditColor      := DM1.EditColor;
    TagSumDetailGrid.EditColor := DM1.EditColor;
    TagBelegeGrid.EditColor    := DM1.EditColor;

    UpdateQuery;
    dm1.GridLoadLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_VKKASSE', 101);
    dm1.GridLoadLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_VKKASSE', 101);
    dm1.GridLoadLayout (tDBGrid(TagSumDetailGrid), 'JOURNAL_TAGSUMDETAIL_VKKASSE', 101);
    dm1.GridLoadLayout (tDBGrid(TagBelegeGrid), 'JOURNAL_TAGBELEGE_VKKASSE', 101);

    ID := DM1.ReadIntegerU ('Journale\VK-KAS', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    for i := 0 to JourGrid.Columns.Count-1 do
    begin
      FN := uppercase (JourGrid.Columns[i].FieldName);
      for j := 0 to TagSumDetailGrid.Columns.Count-1 do
      begin
        if Uppercase (TagSumDetailGrid.Columns[j].FieldName) = FN then
        begin
          TagSumDetailGrid.Columns[j].Title.Caption := JourGrid.Columns[i].Title.Caption;
        end;
      end;
    end;

    LastSDate := DM1.ReadIntegerU ('Journale\VK-KAS', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate<>DatumAW.StartDate) then 
      DatumAW.StartDate := LastSDate;
  end;
  PC1Change(Sender);
  try
    if PC1.ActivePage = TabSheet1 then 
      JourGrid.SetFocus
    else 
      TagBelegeGrid.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.FormDeactivate(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JahrCBChange(Sender: TObject);
begin
  VonDatum := DatumAW.StartDate;
  BisDatum := DatumAW.EndDate;

  if First then 
    exit;

  UpdateQuery;
  PC1Change(Sender);

  if ord(DatumAW.KindRange) <> LastRange then
  begin
    DM1.WriteStringU ('Journale', 'Default', 'Benutzer-Journaleinstellungen');
    DM1.WriteIntegerU ('Journale\VK-KAS', 'RANGE', Ord(DatumAW.KindRange));
  end;
  DM1.WriteIntegerU ('Journale\VK-KAS', 'START-DATE', Trunc(DatumAW.StartDate));
end;                           

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.SortCBChange(Sender: TObject);
begin
  UpdateStatus;
  if not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JourGridDrawColumnCell(Sender: TObject;
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
procedure TJournalVKKasseForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  fn: string;
begin
  fn := uppercase (Field.FieldName);
  SortCBChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.PrintJournalBtnClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg (VK_KASSE, trunc(vonDatum), trunc(bisDatum), DatumAW.Text, 0);
  MainForm.FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Tagesjournal1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowJournalDlg (VK_KASSE,
    JQueryRDATUM.AsDateTime,
    JQueryRDATUM.AsDateTime,
    _('Tagesjournal') + ' ' + FormatDateTime ('dd.mm.yyyy', JQueryRDATUM.AsDateTime),
    0
  );
  MainForm.FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.UpdateQuery;
begin
  Application.ProcessMessages;
  try
    Screen.Cursor := crSQLWait;
    JQuery.Close;

    JQuery.ParamByName ('VON').AsDate := VonDatum;
    JQuery.ParamByName ('BIS').AsDate := BisDatum + 0.99999;
    try 
      JQuery.Open; 
    except 
    end;
  finally
    Screen.Cursor := crDefault;
    UpdateStatus;
    if SumPanel.Visible then
    begin
      SumQuery.ParamByName ('VDAT').AsDateTime  := VonDatum;
      SumQuery.ParamByName ('BDAT').AsDateTime  := BisDatum + 0.99999;
      SumQuery.ParamByName ('QUELLE').AsInteger := VK_RECH;
      SumQuery.Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.SumQueryAfterOpen(DataSet: TDataSet);
var 
  N, M, B: Double;
begin
  SumQuery.First;
  N := 0;
  M := 0;
  B := 0;

  while not SumQuery.Eof do
  begin
    N := N + DM1.CalcLeitWaehrung(SumQueryNetto.Value, SumQueryWAEHRUNG.Value);
    M := M + DM1.CalcLeitWaehrung(SumQueryMwSt.Value, SumQueryWAEHRUNG.Value);
    B := B + DM1.CalcLeitWaehrung(SumQueryBrutto.Value, SumQueryWAEHRUNG.Value);
    SumQuery.Next;
  end;
  SumQuery.Close;

  N_SUM_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', n);
  M_SUM_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', m);
  B_SUM_PAN.Caption := FormatFloat (',#0.00" ' + DM1.LeitWaehrung + '  "', b);
end;              

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JoArtTabCalcFields(DataSet: TDataSet);
begin
  Case JoArtTabSteuer_Code.Value of
    0: JoArtTabSteuer.Value := '-';
    1: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', TagBelegeMWST_1.Value);
    2: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', TagBelegeMWST_2.Value);
    3: JoArtTabSteuer.Value := FormatFloat ('0.0"%"', TagBelegeMWST_3.Value);
    else JoArtTabSteuer.Value := '???';
  end;

  if JoArtTabArtikelTyp.Value = 'T' then
  begin
    JoArtTabSteuer.Value := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JourGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then 
  begin 
    key := 0; 
    JQuery.Refresh; 
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.JQueryAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;

  Tagesabschlu1.Enabled := (JQuery.Active) and (JQuery.RecordCount > 0) and (JQueryGEBUCHT.Value <> 1);
  TabAbschlussBtn.Enabled := Tagesabschlu1.Enabled;
end;                                                                                                

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(JourGrid), 'JOURNAL_KOPF_VKKASSE', 101);
  dm1.GridSaveLayout (tDBGrid(TagSumDetailGrid), 'JOURNAL_TAGSUMDETAIL_VKKASSE', 101);
  dm1.GridSaveLayout (tDBGrid(JourPosGrid), 'JOURNAL_POS_VKKASSE', 101);
  dm1.GridSaveLayout (tDBGrid(TagBelegeGrid), 'JOURNAL_TAGBELEGE_VKKASSE', 101);
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.SichtbareSpalten1Click(Sender: TObject);
var 
  I, J: Integer; 
  FN: String;
begin
  if PC1.ActivePage = TabSheet2 then 
    VisibleSpaltenForm.UpdateTable (tDBGrid(TagBelegeGrid))
  else 
    VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));

  for i := 0 to JourGrid.Columns.Count-1 do
  begin
    FN := uppercase (JourGrid.Columns[i].FieldName);
    for j := 0 to TagSumDetailGrid.Columns.Count-1 do
    begin
      if Uppercase (TagSumDetailGrid.Columns[j].FieldName) = FN then
      begin
        TagSumDetailGrid.Columns[j].Title.Caption := JourGrid.Columns[i].Title.Caption;
      end;
    end;
  end;
end;                                                

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.RePrintBtnClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  // Bon drucken
  PrintRechForm.ShowBelegDlg (VK_KASSE, TagBelegeRec_ID.AsInteger, False);
  MainForm.FormActivate (Self);
  {$ELSE}
  {$IFDEF TERMINMANAGER}//Kommputer
  // Bon drucken
  MainForm.CAO_To_TMObj.OpenPrintBelegDialog (VK_KASSE, TagBelegeRec_ID.AsInteger);
  {$ENDIF}
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Aktualisieren1Click(Sender: TObject);
begin
  JQuery.Refresh;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Positionen1Click(Sender: TObject);
begin
  Positionen1.Checked  := not Positionen1.Checked;
  ViewPosBtn.Down      := Positionen1.Checked;
  Splitter1.Visible    := Positionen1.Checked;
  JourPosGrid.Visible    := Positionen1.Checked;
  Splitter1.Top        := JourPosGrid.Top;
  if Positionen1.Checked then 
    JoArtTab.Open;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Summen1Click(Sender: TObject);
begin
  Summen1.Checked := not Summen1.Checked;
  ViewSumBtn.Down := Summen1.Checked;
  SumPanel.Visible := Summen1.Checked;
  if SumPanel.Visible then
  begin
    SumQuery.ParamByName ('VDAT').AsDateTime  := VonDatum;
    SumQuery.ParamByName ('BDAT').AsDateTime  := BisDatum + 0.99999;
    SumQuery.ParamByName ('QUELLE').AsInteger := VK_RECH;
    SumQuery.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.StornoBtnClick(Sender: TObject);
begin
  if MessageDlg (Format(_('Wollen Sie den Kassenbelg Nr.:%s ' +
       'wirklich stornieren ?'), [TagBelegeVRenum.Value]),
       mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if DM1.Storno_Verkauf (TagBelegeREC_ID.Value) then
    begin
      TagBelege.Refresh;
      TagBelegeAfterOpen(nil);
    end;
  end;
end; 

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.ArtPanResize(Sender: TObject);
begin
  DatumAW.Left := ArtPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.Tagesabschlu1Click(Sender: TObject);
var 
  BarSum: Double;
  Error : Integer;
  BelVon,
  BelBis: String;
  Anz   : Integer;
begin
  if messageDlg (Format(_('Wollen Sie den aktuellen Tag (%s) abschließen ?'),
      [FormatDateTime('dd.mm.yyyy', JQueryRDATUM.AsDateTime)]),
      mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    BarSum := 0;
    Anz    := 0;
    Error  := 0;
    BelBis := '';

    TagAbschlussQuery.Open;

    while not TagAbschlussQuery.eof do
    begin
      if TagAbschlussQueryzahlart.Value = 1 then
      begin
        BarSum := BarSum +
        DM1.CalcLeitWaehrung (TabAbschlussQueryBSumme.AsFloat,
        TagAbschlussQueryWaehrung.Value);
        if Anz = 0 then 
          BelVon := TagAbschlussQueryVRENUM.Value;
        inc (Anz);
        if BelBis <> TagAbschlussQueryVRENUM.Value then 
          BelBis := TagAbschlussQueryVRENUM.Value;
      end;
      TagAbschlussQuery.Edit;
      try
        TagAbschlussQueryuw_num.Value := 0;
        TagAbschlussQuery.Post;
      except
        inc(Error);
        TagAbschlussQuery.Cancel;
      end;

      TagAbschlussQuery.Next;
    end;

    // Kassenbuch aktualisieren
    DM1.BucheKasse (JQueryRDATUM.Value, 13, -1, _('diverse'), -1, 0, BarSum,
      _('Tagesabschluß Kasse Bareinnahmen') + #13#10 +
      InttoStr(Anz) +
      ' ' + _('Belege') + ' : ' + BelVon +
      ' ' + _('bis') + ' ' + BelBis);

    JQuery.Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.TagBelegeAfterOpen(DataSet: TDataSet);
begin
  UpdateStatus;
  StornoBtn.Enabled := (TagBelege.Active) and (TagBelege.RecordCount > 0) and (TagBelegeStadium.AsInteger <> 127);
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.PC1Change(Sender: TObject);
begin
  if first then 
    exit;

  SuchenBtn.Visible        := PC1.ActivePage = TabSheet2;
  Suchen1.Enabled          := PC1.ActivePage = TabSheet2;
  TagBelege.Active         := PC1.ActivePage = TabSheet2;
  ViewSumBtn.Visible       := PC1.ActivePage = TabSheet1;
  TabAbschlussBtn.Visible  := PC1.ActivePage = TabSheet1;
  PrintJournalBtn.Visible  := PC1.ActivePage = TabSheet1;

  try 
    TagSumDetail.Active  := PC1.ActivePage = TabSheet1; 
  except 
  end;


  if PC1.ActivePage = TabSheet1 then
  begin
    DBNavigator1.DataSource  := JourDS;
    JoArtTab.Active          := False;
    Storno1.Enabled          := False;
    StornoBtn.Enabled        := False;
    Rechnungdrucken1.Enabled := False;
    ViewPosBtn.Visible       := False;
    Tagesjournal1.Enabled    := JQuery.RecordCount>0;
    PrintJournalBtn.Enabled  := JQuery.RecordCount>0;
    TagesJournalBtn.Enabled  := JQuery.RecordCount>0;
  end else
  begin
    DBNavigator1.DataSource  := TagBelegeDS;
    JoArtTab.Active          := Positionen1.Checked;
    Tagesabschlu1.Enabled    := False;
    Storno1.Enabled          := (TagBelege.Active) and (TagBelege.RecordCount > 0);
    StornoBtn.Enabled        := Storno1.Enabled;
    Rechnungdrucken1.Enabled := (TagBelege.Active) and (TagBelege.RecordCount > 0);
    ViewPosBtn.Visible       := (TagBelege.Active) and (TagBelege.RecordCount > 0);
    Tagesjournal1.Enabled    := (TagBelege.Active) and (TagBelege.RecordCount > 0);
    TagesJournalBtn.Enabled  := (TagBelege.Active) and (TagBelege.RecordCount > 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.UpdateStatus;
var SuchZeit, Datensatz, Sortierung: String;
begin
  SuchZeit   := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');

  if PC1.ActivePage = TabSheet1 then
  begin
    Datensatz  := Inttostr(JQuery.RecNo) + ' ' + _('von') + ' ' +
    Inttostr (JQuery.RecordCount);
  end else
  begin
    if PC1.ActivePage = TabSheet2 then
    begin
      Datensatz  := Inttostr(TagBelege.RecNo) + ' ' + _('von') + ' ' +
      Inttostr (TagBelege.RecordCount);
    end else 
      Datensatz := '';
  end;
  Sortierung := _('Sortierung : ') + SortName;

  if assigned (OnUpdateStatusBar) then 
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, '', '');
end;

//------------------------------------------------------------------------------
procedure TJournalVKKasseForm.TagBelegeGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if TagBelegeSTADIUM.AsInteger = 127 then
  begin
    Canvas.Font.Color := clSilver;
    Canvas.Font.Style := [fsStrikeout];
  end;
end;                                                          

//------------------------------------------------------------------------------

end.

