{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Zahlungsausgang u. Offene Posten (OPOS) -Kreditoren               }
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
{ 07.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_ZahlungsAusgangList;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  VolPeriod{???}, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, JvMenus;
{
uses
  JvDBCtrl,
  ImgList,
}

type
  TZahlAusForm = class(TForm)
    ZahlungPanel: TPanel;
    OPosQuery: TZQuery;
    OPosQueryaddr_id: TIntegerField;
    OPosQuerygegenkonto: TIntegerField;
    OPosQuerykun_num: TStringField;
    OPosQuerykun_anrede: TStringField;
    OPosQuerykun_name1: TStringField;
    OPosQuerykun_name2: TStringField;
    OPosQuerykun_name3: TStringField;
    OPosQuerykun_abteilung: TStringField;
    OPosQuerykun_strasse: TStringField;
    OPosQuerykun_plz: TStringField;
    OPosQuerykun_land: TStringField;
    OPosQuerykun_ort: TStringField;
    OPosQuerysaldo: TFloatField;
    OPosDS: TDataSource;
    ToolBar2: TToolBar;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    OPOSdrucken1: TMenuItem;
    Zahlungseingang1: TMenuItem;
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
    DBNavigator1: TDBNavigator;
    OPosDetailQuery: TZQuery;
    IntegerField1: TIntegerField;
    OPosDetailQueryrdatum: TDateField;
    IntegerField2: TStringField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    OPosDetailQueryBSumme: TFloatField;
    IntegerField4: TIntegerField;
    OposDetailQueryStadium: TIntegerField;
    StringField1: TStringField;
    IntegerField6: TLargeintField;
    FloatField8: TFloatField;
    OPosDetailQuerySoll_NTage: TLargeintField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DateField2: TDateField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    IntegerField8: TIntegerField;
    FloatField13: TFloatField;
    LargeintField1: TLargeintField;
    OPosDetailDS: TDataSource;
    OposKunGrid: TOFDBGrid;
    OPosRechGrid: TOFDBGrid;
    N1: TMenuItem;
    OPosDetailQueryrec_id: TIntegerField;
    OPosDetailQuerymahnstufe: TIntegerField;
    OPosDetailQuerymahndatum: TDateField;
    ZahleingangBtn: TToolButton;
    OPosQueryanzahl: TStringField;
    OPosQuerywaehrung: TStringField;
    TopPan: TPanel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    Drucken1: TMenuItem;
    Suchen1: TMenuItem;
    SumQuery: TZQuery;
    SumQueryanzahl: TStringField;
    SumQuerybsumme: TFloatField;
    SumQuerysaldo: TFloatField;
    SumQuerywaehrung: TStringField;
    SumQueryueberfaellig: TLargeintField;
    Panel1: TPanel;
    SumUeberfaelligPan: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SummePan: TPanel;
    SumUeberfaelligLab: TLabel;
    SummeLab: TLabel;
    SumCntLab: TLabel;
    SumUECntLab: TLabel;
    ToolButton1: TToolButton;
    OPosDetailQueryORGNUM: TStringField;
    ToolBar3: TToolBar;
    DBNavigator2: TDBNavigator;
    ToolButton2: TToolButton;
    OposPrintBtn: TToolButton;
    OPosQueryCALC_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure OposKunGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Zahlungseingang1Click(Sender: TObject);
    procedure OPOSdrucken1Click(Sender: TObject);
    procedure OPosDetailQueryAfterOpen(DataSet: TDataSet);
    procedure OPosRechGridDblClick(Sender: TObject);
    procedure TopPanResize(Sender: TObject);
    procedure OPosRechGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure OPosQueryAfterOpen(DataSet: TDataSet);
    procedure OPosQueryCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First: Boolean;
    
    ModulID: Integer;
  public
    { Public-Deklarationen }
  end;
    
    // var ZahlAusForm: TZahlAusForm;
    
implementation

uses
  GNUGetText,
  OF_Tool1, OF_DM, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_Var_Const, OF_ZahlungsEingangDlg;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TZahlAusForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  Scaled := True;
  First := True;
  ZahlungPanel.HelpContext    := 7300;

  ModulID := 4030;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.FormActivate(Sender: TObject);
begin
  if First then
  begin
    First := False;
    OPosKunGrid.RowColor1  := DM1.C2Color;
    OPosRechGrid.RowColor1 := DM1.C2Color;
    OPosKunGrid.EditColor  := DM1.EditColor;
    OPosRechGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(OPosKunGrid), 'OPOS_KRD_LIEF');
    dm1.GridLoadLayout (tDBGrid(OPosRechGrid), 'OPOS_KRD_RECH');
  end;
  OPosQuery.Open;
  OPosDetailQuery.Open;
  OposKunGrid.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.FormDeactivate(Sender: TObject);
begin
  OPosDetailQuery.Close;
  OPosQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.OposKunGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f5 then
  begin
    key := 0;
    Aktualisieren1Click(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.Aktualisieren1Click(Sender: TObject);
begin
  OPosQuery.Refresh;
  OPosQueryAfterOpen(nil);
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.Zahlungseingang1Click(Sender: TObject);
begin
  if OPosDetailQuery.RecordCount = 0 then 
    exit;
  ZEForm.Run (EK_RECH, OPosDetailQueryRec_ID.Value);
  OPosQuery.Refresh;
  OPosQueryAfterOpen(nil);
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPOSdrucken1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowOposDlg (KRD_OPOS, EncodeDate (2000, 01, 01), 0, '');
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPosDetailQueryAfterOpen(DataSet: TDataSet);
begin
  Zahlungseingang1.Enabled := 
    (OPosDetailQuery.Active) and
    (OPosDetailQuery.RecordCount > 0) and
    DM1.CaoSecurity.CanInsert(ModulID, 0);

  ZahleingangBtn.Enabled := (OPosDetailQuery.Active) and (OPosDetailQuery.RecordCount > 0);
end;                                                                                    

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPosRechGridDblClick(Sender: TObject);
begin
  if OPosDetailQuery.RecordCount > 0 then 
    Zahlungseingang1Click(Sender);
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.TopPanResize(Sender: TObject);
begin
  DatumAW.Left := TopPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPosRechGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if ((
     (OPosDetailQuerysoll_ntage.value + OPosDetailQueryrdatum.Value < trunc(now)) and
     (OposDetailQueryStadium.Value >= 20) and (OposDetailQueryStadium.Value < 30)
     ) or
     (
     (OPosDetailQuerymahndatum.Value + 14 < Trunc(Now)) and
     (OposDetailQueryStadium.Value >= 30)
     )) and (not (gdSelected in State)) then 
    Canvas.Font.Color := clRed;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(OPosKunGrid), 'OPOS_KRD_LIEF');
  dm1.GridSaveLayout (tDBGrid(OPosRechGrid), 'OPOS_KRD_RECH');
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.Suchen1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TZahlAusForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := OPosKunGrid.Col;
  f := OPosKunGrid.Columns[i-1].FieldName;
  t := MainForm.FindDialog1.FindText;
  Found := False;
  if frDown in MainForm.FindDialog1.Options then 
    OPosQuery.Next
  else 
    OPosQuery.Prior;
  repeat
    if frMatchCase in MainForm.FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, OPosQuery.FieldByName(f).AsString)>0;
    end else
    begin
      // Groß- und Kleinschreibung nicht beachten
      Found := Pos (uppercase(t), uppercase(OPosQuery.FieldByName(f).AsString))>0;
    end;

    if not Found then
    begin
      if frDown in MainForm.FindDialog1.Options then 
        OPosQuery.Next
      else 
        OPosQuery.Prior;
    end;
  until (OPosQuery.Eof) or (OPosQuery.Bof) or (Found);
end;                                          

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPosQueryAfterOpen(DataSet: TDataSet);
var sum, ue: double; sumcnt, uecnt, anz: integer; anzstr: string;
begin
  SumQuery.Open;
  sum := 0; sumcnt := 0;
  ue  := 0; uecnt := 0;

  while not SumQuery.Eof do
  begin
    AnzStr := SumQueryanzahl.AsString;
    while (length(AnzStr) > 0) and (Pos(',', AnzStr) > 0) do 
      delete (AnzStr, Pos(',', AnzStr), 1);
    while (length(AnzStr) > 0) and (Pos('.', AnzStr) > 0) do 
      delete (AnzStr, Pos('.', AnzStr), 1);
    Anz := StrToInt (AnzStr);

    if SumQueryUeberfaellig.Value>0 then
    begin
      ue := ue + dm1.CalcLeitWaehrung (SumQuerySaldo.Value, SumQueryWaehrung.Value);
      uecnt := uecnt + Anz; //SumQueryanzahl.asintege;
    end;

    sum := sum + dm1.CalcLeitWaehrung (SumQuerySaldo.Value, SumQueryWaehrung.Value);
    sumcnt := sumcnt + Anz; //SumQueryanzahl.asintege;

    SumQuery.Next;
  end;

  SumCntLab.Caption := ' ' + IntToStr(SumCnt);
  SumUECntLab.Caption := ' ' + IntToStr(uecnt);

  SummeLab.Caption := FormatFloat (',#0.00', sum) + ' ' + DM1.LeitWaehrung + ' ';
  SumUeberfaelligLab.Caption := FormatFloat (',#0.00', ue) + ' ' + DM1.LeitWaehrung + ' ';

  SumQuery.Close;
end;  

//------------------------------------------------------------------------------
procedure TZahlAusForm.OPosQueryCalcFields(DataSet: TDataSet);
begin
  OPosQueryCalc_Name.AsString := Trim(
    OPosqueryKUN_Anrede.AsString + ' ' +
    OPosQueryKUN_NAME1.AsString + ' ' +
    OPosQueryKUN_NAME2.AsString + ' ' +
    OPosQueryKUN_NAME3.AsString
  );
end;

//------------------------------------------------------------------------------

end.

