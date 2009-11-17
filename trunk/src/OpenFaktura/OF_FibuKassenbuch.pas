{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Kassenbuch                                                        }
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
{ 06.05.2003 - Version zum GNU-Source hinzugefügt }
{ 24.09.2003 - Bug#42 beseitigt, Spalte ist jetzt readonly :-) }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_FibuKassenbuch;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, VolPeriod, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  OFDBGrid, StdCtrls, ComCtrls, DBCtrls, ToolWin, ExtCtrls, JvMenus, OFSecurity;

type
  TKassenBuchForm = class(TForm)
    MainPanel: TPanel;
    ToolBar1: TToolBar;
    StornoBtn: TToolButton;
    PrintJournalBtn: TToolButton;
    SumPan: TPanel;
    KasBuchGrid: TOFDBGrid;
    KasBuch: TOFZQuery;
    KasBuchDS: TDataSource;
    KasBuchREC_ID: TIntegerField;
    KasBuchBDATUM: TDateField;
    KasBuchQUELLE: TIntegerField;
    KasBuchJOURNAL_ID: TIntegerField;
    KasBuchZU_ABGANG: TFloatField;
    KasBuchBTXT: TMemoField;
    StartSaldoTab: TZQuery;
    StartSaldoTabSALDO: TFloatField;
    EndSaldoTab: TZQuery;
    EndSaldoTabSaldo: TFloatField;
    EndSaldoTabDATUM: TDateField;
    StartSaldoTabDATUM: TDateField;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    WaehrungLab1: TLabel;
    EndDatum: TLabel;
    EndSaldo: TLabel;
    WaehrungLab2: TLabel;
    StartSaldo: TLabel;
    StartDatum: TLabel;
    KasBuchBELEGNUM: TStringField;
    KasBuchGKONTO: TIntegerField;
    KasBuchSKONTO: TFloatField;
    KasBuchQuelleStr: TStringField;
    ManBuchBtn: TToolButton;
    TopPan: TPanel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    DBNavigator1: TDBNavigator;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Kassenbuchdrucken1: TMenuItem;
    N1: TMenuItem;
    ManuelleBuchung1: TMenuItem;
    N5: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    N2: TMenuItem;
    Storno1: TMenuItem;
    Drucken1: TMenuItem;
    Suchen1: TMenuItem;
    FindDialog1: TFindDialog;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Anfangsbestand1: TMenuItem;
    KasBuchERSTELLT: TDateField;
    KasBuchERST_NAME: TStringField;
    KasBuchMA_ID: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DatumAWChange(Sender: TObject);
    procedure KasBuchCalcFields(DataSet: TDataSet);
    procedure ManBuchBtnClick(Sender: TObject);
    procedure KasBuchAfterOpen(DataSet: TDataSet);
    procedure TopPanResize(Sender: TObject);
    procedure Storno1Click(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Kassenbuchdrucken1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure KasBuchGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure Anfangsbestand1Click(Sender: TObject);
    procedure KasBuchBeforePost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First                : Boolean;
    KasBuchStartDatum    : tDateTime;
    KasBuchEndDatum      : tDateTime;
    KasBuchLeBuchungDatum: tDateTime;
    KasBuchStartSaldo    : Double;
    KasBuchEndSaldo      : Double;
    KasBuchZeitraum      : String;
    
    LastID               : Integer;
    LastRange            : Integer;
    LastSDate            : Integer;
    LastBDatum           : Integer;
  public
    { Public-Deklarationen }
  end;
    
var
  KassenBuchForm: TKassenBuchForm;

implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM, OF_DBGrid_Layout,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_ManKassBuchungDlg, OF_FibuKassenbuch_AB_Dlg;

procedure TKassenBuchForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  First             := True;
  DatumAW.KindRange := ksMonth;
  DatumAW.StartDate := now;
  LastRange         := ord(ksMonth);
  LastID            := -1;
  LastSDate         := -1;
  LastBDatum        := 0;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.FormActivate(Sender: TObject);
var 
  ID: Integer; 
  HasAB: Boolean; 
  Ja, Mo, Ta: Word;
begin
  if First then
  begin
    LastID := -1;

    KasBuchGrid.RowColor1 := DM1.C2Color;
    KasBuchGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(KasBuchGrid), 'KASSENBUCH', 101);

    WaehrungLab1.Caption := DM1.LeitWaehrung;
    WaehrungLab2.Caption := DM1.LeitWaehrung;

    KasBuchZU_ABGANG.DisplayFormat := ',###,##0.00" ' + DM1.LeitWaehrung + ' ";' +
    '-,###,##0.00" ' + DM1.LeitWaehrung + ' "';

    ID := DM1.ReadIntegerU ('JOURNALE\KASSENBUCH', 'RANGE', -1);
    if (ID > -1) and (LastRange <> ID) then
    begin
      LastRange := ID;
      DatumAW.KindRange := tKindRange(LastRange);
    end;

    LastSDate := DM1.ReadIntegerU ('JOURNALE\KASSENBUCH', 'START-DATE', -1);
    if (LastSDate <> -1) and (LastSDate<>DatumAW.StartDate) then 
      DatumAW.StartDate := LastSDate;

    DatumAWChange(Sender);
    First := False;


    HasAB := False;
    // Prüfen ob ein Anfangsbestand für dieses Jahr vorhanden ist
    DM1.Uniquery.Close;
    DM1.Uniquery.Sql.Text := 'select count(*) as ANZAHL from FIBU_KASSE ' +
    'where YEAR(BDATUM)=' + Inttostr(DatumAW.Year) +
    ' and QUELLE=0';
    DM1.Uniquery.Open;
    if (DM1.UniQuery.RecordCount = 1) and (DM1.Uniquery.FieldByName('ANZAHL').AsInteger > 0) then 
      HasAB := True;
    DM1.Uniquery.Close;

    DecodeDate (Now, Ja, Mo, Ta);

    Anfangsbestand1.Enabled := (not HasAB) and (DatumAW.Year <= JA) and (DM1.CaoSecurity.CanInsert(4010, 0));
  end;

  ManuelleBuchung1.Enabled := DM1.CaoSecurity.CanInsert (4010, 0);
  ManBuchBtn.Enabled := ManuelleBuchung1.Enabled;

  Kassenbuchdrucken1.Enabled := DM1.CaoSecurity.CanPrint (4010, 0);
  PrintJournalBtn.Enabled := Kassenbuchdrucken1.Enabled;

  ID := LastID;
  KasBuch.Open;

  if ID > 0 then 
    KasBuch.Locate('REC_ID;BDATUM', VarArrayOf([LastID, LastBDatum]), []);

  KasBuchGrid.SetFocus;
end;                               

//------------------------------------------------------------------------------
procedure TKassenBuchForm.FormDeactivate(Sender: TObject);
begin
  LastID     := KasBuchRec_ID.Value;
  LastBDatum := Round(Int(KasBuchBDATUM.AsDateTime));

  KasBuch.Close;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.DatumAWChange(Sender: TObject);
var 
  HasAB: Boolean; 
  Ja, Mo, Ta: Word;
begin
  KasBuch.Close;
  KasBuch.ParamByName ('VDAT').Value := DatumAW.StartDate;
  KasBuch.ParamByName ('BDAT').Value := DatumAW.EndDate;

  if not First then
  begin
    KasBuch.Open;

    HasAB := False;
    // Prüfen ob ein Anfangsbestand für dieses Jahr vorhanden ist
    DM1.Uniquery.Close;
    DM1.Uniquery.Sql.Text := 'select count(*) as ANZAHL from FIBU_KASSE ' +
    'where YEAR(BDATUM)=' + Inttostr(DatumAW.Year) +
    ' and QUELLE=0';
    DM1.Uniquery.Open;
    if (DM1.UniQuery.RecordCount = 1) and (DM1.Uniquery.FieldByName('ANZAHL').AsInteger > 0) then 
      HasAB := True;
    DM1.Uniquery.Close;

    DecodeDate (Now, Ja, Mo, Ta);
    Anfangsbestand1.Enabled := (not HasAB) and (DatumAW.Year <= JA) and (DM1.CaoSecurity.CanInsert(4010, 0));

    if ord(DatumAW.KindRange)<>LastRange then
    begin
      DM1.WriteStringU  ('JOURNALE', 'Default', 'Benutzer-Journaleinstellungen');
      DM1.WriteIntegerU ('JOURNALE\KASSENBUCH', 'RANGE', Ord(DatumAW.KindRange));
    end;
    DM1.WriteIntegerU ('JOURNALE\KASSENBUCH', 'START-DATE', Trunc(DatumAW.StartDate));
  end;
end;                                                                   

//------------------------------------------------------------------------------
procedure TKassenBuchForm.KasBuchCalcFields(DataSet: TDataSet);
begin
  Case KasBuchQuelle.Value of
    0: KasBuchQuelleStr.Value := _('Anfangsbestand');
    3: KasBuchQuelleStr.Value := _('Verkauf');
    13: KasBuchQuelleStr.Value := _('VK-Kasse');
    5: KasBuchQuelleStr.Value := _('Einkauf');
    99: KasBuchQuelleStr.Value := _('man. Buchung');
    else KasBuchQuelleStr.Value := '???';
  end;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.ManBuchBtnClick(Sender: TObject);
var ManKasBuchForm: TManKasBuchForm;
begin
  ManKasBuchForm := TManKasBuchForm.Create(Self);
  try
    ManKasBuchForm.ShowDlg;
  finally
    ManKasBuchForm.Free;
  end;
  Aktualisieren1Click(Sender);
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.KasBuchAfterOpen(DataSet: TDataSet);
var 
  d: tDateTime;
begin
  StartSaldoTab.Close;
  StartSaldoTab.ParamByName ('JAHR').Value := DatumAW.Year;
  StartSaldoTab.ParamByName ('VDAT').Value := DatumAW.StartDate;
  StartSaldoTab.Open;

  EndSaldoTab.Close;
  EndSaldoTab.ParamByName ('JAHR').Value := DatumAW.Year;
  EndSaldoTab.ParamByName ('BDAT').Value := DatumAW.EndDate;
  EndSaldoTab.Open;

  KasBuchZeitraum := DatumAW.Text;

  D := StartSaldoTabDatum.Value;
  if D < DatumAW.StartDate then 
    D := DatumAW.StartDate;
  StartDatum.Caption := FormatDateTime ('dd.mm.yyyy', D);
  KasBuchStartDatum  := D;
  StartSaldo.Caption := FormatFloat (',#0.00', StartSaldoTabSaldo.Value);
  KasBuchStartSaldo  := StartSaldoTabSaldo.AsFloat;
  StartSaldoTab.Close;

  D := EndSaldoTabDatum.Value;
  if D < DatumAW.StartDate then 
    D := DatumAW.Enddate;
  if D > Now then 
    d := Now;
  EndDatum.Caption := FormatDateTime ('dd.mm.yyyy', D);
  KasBuchEndDatum  := DatumAW.Enddate;
  KasBuchLeBuchungDatum := D;
  EndSaldo.Caption := FormatFloat (',#0.00', EndSaldoTabSaldo.Value);
  KasBuchEndSaldo  := EndSaldoTabSaldo.AsFloat;
  EndSaldoTab.Close;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.TopPanResize(Sender: TObject);
begin
  DatumAW.Left := TopPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Storno1Click(Sender: TObject);
begin
  if MessageDlg(_('Wollen Sie die Kassenbuchung wirklich löschen ?'),
                 mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    KasBuch.Delete;
    Aktualisieren1Click(Sender);
  end;
end;           

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Aktualisieren1Click(Sender: TObject);
begin
  KasBuch.Refresh;
  KasBuchAfterOpen(nil);
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.KasBuchGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then
  begin
    key := 0;
    Aktualisieren1Click(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Kassenbuchdrucken1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowKasBuchDlg (KasBuchStartDatum,
  KasBuchEndDatum,
  KasBuchLeBuchungDatum,
  KasBuchStartSaldo,
  KasBuchEndSaldo,
  KasBuchZeitraum);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(KasBuchGrid));
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(KasBuchGrid), 'KASSENBUCH', 101);
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Suchen1Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := KasBuchGrid.Col;
  f := KasBuchGrid.Columns[i-1].FieldName;
  t := FindDialog1.FindText;
  Found := False;
  if frDown in FindDialog1.Options then 
    KasBuch.Next
  else 
    KasBuch.Prior;
  repeat
    if frMatchCase in FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, KasBuch.FieldByName(f).AsString) > 0;
    end else
    begin
      // Groß- und Kleinschreibung nicht beachten
      Found := Pos (uppercase(t), uppercase(KasBuch.FieldByName(f).AsString)) > 0;
    end;

    if not Found then
    begin
      if frDown in FindDialog1.Options then 
        KasBuch.Next
      else 
        KasBuch.Prior;
    end;
  until (KasBuch.Eof) or (KasBuch.Bof) or (Found);
end;                                      

//------------------------------------------------------------------------------
procedure TKassenBuchForm.Anfangsbestand1Click(Sender: TObject);
var 
  LastSaldo: Double;
  KasBuchAB: TKasBuchAB;
begin
  DM1.Uniquery.Close;
  DM1.Uniquery.Sql.Text := 'select sum(ZU_ABGANG) as SALDO, max(BDATUM) as DATUM ' +
  'from FIBU_KASSE ' +
  'where BDATUM <= :BDAT';
  DM1.Uniquery.ParamByName ('BDAT').AsDateTime := EncodeDate (DatumAW.Year-1, 12, 31);
  DM1.Uniquery.Open;

  if (DM1.Uniquery.RecordCount = 1) then 
    LastSaldo := DM1.Uniquery.FieldByName ('SALDO').AsFloat
  else 
    LastSaldo := 0;

  DM1.Uniquery.Close;

  KasBuchAB := TKasBuchAB.Create (Self);
  try
    KasBuchAB.LastSaldo := LastSaldo;
    KasBuchAB.LastJahr  := DatumAW.Year-1;
    KasBuchAB.ShowModal;
  finally
    KasBuchAB.Free;
  end;
  DatumAWChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TKassenBuchForm.KasBuchBeforePost(DataSet: TDataSet);
begin
  KasBuchERSTELLT.AsDateTime := now;
  KasBuchERST_NAME.AsString := DM1.View_User;
  KasBuchMA_ID.AsInteger := DM1.UserID;
end;

//------------------------------------------------------------------------------

end.

