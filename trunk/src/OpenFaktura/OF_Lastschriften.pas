{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Modul zur Erstellung und Verwaltung von Lastschriften aus         }
{            VK-Rechnungen                                                     }
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
{ 09.05.2004 JP - Unit zum CVS hinzugefügt                                     }
{ 07.11.2004 JP - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)          }
{ 22.12.2004 JP - Der Kundennname wird jetzt aus Anrede + Name1-3              }
{                 zusammengebaut und angezeigt                                 }
{ 01.04.2005 JP - Bugfix bei alphanumerischen Belegnummern JP01042005          }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Lastschriften;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mpsDTAUS, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Menus, DBCtrls, StdCtrls, OFGroupBox, ComCtrls, ToolWin, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, OFDBGrid, VolPeriod{???}, JvExControls, JvComponent,
  JvSpeedButton, ExtCtrls, JvMenus, OFSecurity;

{
uses
  JvDBCtrl,
  JvToolEdit,
}

type
  TLastschriftForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Suchen1: TMenuItem;
    N1: TMenuItem;
    lastschrift1: TMenuItem;
    N5: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    Drucken1: TMenuItem;
    OPOSdrucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    OPosQuery: TOFZQuery;
    OPosDS: TDataSource;
    OPosQueryQUELLE: TIntegerField;
    OPosQueryREC_ID: TIntegerField;
    OPosQueryADDR_ID: TIntegerField;
    OPosQueryVRENUM: TStringField;
    OPosQueryRDATUM: TDateField;
    OPosQueryZAHLART: TIntegerField;
    OPosQueryMWST_0: TFloatField;
    OPosQueryMWST_1: TFloatField;
    OPosQueryMWST_2: TFloatField;
    OPosQueryMWST_3: TFloatField;
    OPosQueryNSUMME: TFloatField;
    OPosQueryMSUMME_0: TFloatField;
    OPosQueryMSUMME_1: TFloatField;
    OPosQueryMSUMME_2: TFloatField;
    OPosQueryMSUMME_3: TFloatField;
    OPosQueryMSUMME: TFloatField;
    OPosQueryBSUMME: TFloatField;
    OPosQueryWAEHRUNG: TStringField;
    OPosQueryGEGENKONTO: TIntegerField;
    OPosQuerySOLL_STAGE: TLargeintField;
    OPosQuerySOLL_SKONTO: TFloatField;
    OPosQuerySOLL_NTAGE: TLargeintField;
    OPosQuerySOLL_RATEN: TIntegerField;
    OPosQuerySOLL_RATBETR: TFloatField;
    OPosQuerySOLL_RATINTERVALL: TIntegerField;
    OPosQueryIST_ANZAHLUNG: TFloatField;
    OPosQueryIST_SKONTO: TFloatField;
    OPosQueryIST_ZAHLDAT: TDateField;
    OPosQueryIST_BETRAG: TFloatField;
    OPosQueryMAHNKOSTEN: TFloatField;
    OPosQueryKONTOAUSZUG: TIntegerField;
    OPosQueryBANK_ID: TIntegerField;
    OPosQuerySTADIUM: TIntegerField;
    OPosQueryKUN_NUM: TStringField;
    OPosQueryKUN_ANREDE: TStringField;
    OPosQueryKUN_NAME1: TStringField;
    OPosQueryKUN_NAME2: TStringField;
    OPosQueryKUN_NAME3: TStringField;
    OPosQueryKUN_ABTEILUNG: TStringField;
    OPosQueryKUN_STRASSE: TStringField;
    OPosQueryKUN_LAND: TStringField;
    OPosQueryKUN_PLZ: TStringField;
    OPosQueryKUN_ORT: TStringField;
    OPosQueryORGNUM: TStringField;
    OPosQueryUW_NUM: TIntegerField;
    OPosQueryMAHNSTUFE: TIntegerField;
    OPosQueryMAHNDATUM: TDateField;
    OPosQueryZIEL_SKONTO: TStringField;
    OPosQueryZIEL_NETTO: TStringField;
    SumTab: TZQuery;
    Allesmarkieren1: TMenuItem;
    keineMarkieren1: TMenuItem;
    N2: TMenuItem;
    PC1: TPageControl;
    FreigabeTab: TTabSheet;
    OposGrid: TOFDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    SummePan: TPanel;
    SummeLab: TLabel;
    SumCntLab: TLabel;
    FreiPan: TPanel;
    FreiLab: TLabel;
    FreiCntLab: TLabel;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    LastschriftBtn: TToolButton;
    UeberweisungTab: TTabSheet;
    CaoGroupBox1: TOFGroupBox;
    ToolBar1: TToolBar;
    DBNavigator2: TDBNavigator;
    AbbruchBtn: TToolButton;
    ToolButton6: TToolButton;
    MakeLSBtn: TToolButton;
    ToolButton4: TToolButton;
    UWTab: TZQuery;
    IntegerField1: TIntegerField;
    UWTabRec_ID: TIntegerField;
    UWTabADDR_ID: TIntegerField;
    UWTabVRENUM: TStringField;
    UWTabRDatum: TDateField;
    IntegerField6: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    UWTABBSUMME: TFloatField;
    UWTabWaehrung: TStringField;
    IntegerField7: TIntegerField;
    UWTabSOLL_STAGE: TLargeintField;
    UWTabSoll_SKONTO: TFloatField;
    UWTabSOLL_NTAGE: TLargeintField;
    IntegerField10: TIntegerField;
    FloatField13: TFloatField;
    IntegerField11: TIntegerField;
    FloatField14: TFloatField;
    UWTABIST_SKONTO: TFloatField;
    UWTABIST_ZAHLDAT: TDateField;
    UWTabIST_BETRAG: TFloatField;
    UWTabMahnKosten: TFloatField;
    UWTabBank_ID: TIntegerField;
    UWTabStadium: TIntegerField;
    UWTabKUN_NUM: TStringField;
    UWTabKun_Anrede: TStringField;
    UWTabKUN_NAME1: TStringField;
    UWTabKUN_NAME2: TStringField;
    UWTabKUN_NAME3: TStringField;
    UWTabKUN_Abteilung: TStringField;
    UWTabKUN_STRASSE: TStringField;
    UWTabKUN_LAND: TStringField;
    UWTabKUN_PLZ: TStringField;
    UWTabKUN_ORT: TStringField;
    UWTABOrgNum: TStringField;
    UWTabUWNum: TIntegerField;
    UWTabMAHNSTUFE: TIntegerField;
    UWTabMAHNDATUM: TDateField;
    UWTabZIEL_SKONTO: TStringField;
    UWTabZIEL_NETTO: TStringField;
    UWDS: TDataSource;
    Panel2: TPanel;
    DTAUS1: TmpsDTAUS;
    UeberweisungGrid: TOFDBGrid;
    CaoGroupBox3: TOFGroupBox;
    Panel3: TPanel;
    Label3: TLabel;
    FirBankDS: TDataSource;
    DBNavigator3: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText4: TDBText;
    UWTabUSR1: TStringField;
    UWTabUSR2: TStringField;
    InfoGB: TOFGroupBox;
    UWTabZAHLBETRAG: TCurrencyField;
    FreiLab2: TLabel;
    FreiCntLab2: TLabel;
    UeberweisTab: TZQuery;
    UeberweisTabID: TIntegerField;
    UeberweisTabUWNUM: TIntegerField;
    UeberweisTabFERTIG: TIntegerField;
    UeberweisTabJOURNAL_ID: TIntegerField;
    UeberweisTabUW_DATUM: TDateField;
    UeberweisTabBETRAG: TFloatField;
    UeberweisTabKTO: TStringField;
    UeberweisTabBLZ: TStringField;
    UeberweisTabUW_TEXT: TStringField;
    UeberweisTabBINHABER: TStringField;
    UbwErfassenBtn: TJvSpeedButton;
    UbwVerbuchenBtn: TJvSpeedButton;
    VerbuchenTab: TTabSheet;
    CaoGroupBox2: TOFGroupBox;
    CaoGroupBox4: TOFGroupBox;
    CaoGroupBox5: TOFGroupBox;
    ToolBar3: TToolBar;
    DBNavigator4: TDBNavigator;
    ToolButton7: TToolButton;
    LSUndoBtn: TToolButton;
    ToolButton9: TToolButton;
    LSVerbuchenBtn: TToolButton;
    VerbuchGrid: TOFDBGrid;
    VerbuchTab: TZQuery;
    VerbuchDS: TDataSource;
    VerbuchDetailDS: TDataSource;
    VerbuchDetailGrid: TOFDBGrid;
    VerbuchTabID: TIntegerField;
    VerbuchTabUWNUM: TIntegerField;
    VerbuchTabFERTIG: TIntegerField;
    VerbuchTabJOURNAL_ID: TIntegerField;
    VerbuchTabUW_DATUM: TDateField;
    VerbuchTabBETRAG: TFloatField;
    VerbuchTabKTO: TStringField;
    VerbuchTabBLZ: TStringField;
    VerbuchTabBINHABER: TStringField;
    VerbuchTabUW_TEXT: TStringField;
    VerbuchDetailTab: TZQuery;
    IntegerField4: TIntegerField;
    IntegerField8: TIntegerField;
    DateField1: TDateField;
    FloatField11: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField4: TStringField;
    StringField12: TStringField;
    VerbuchDetailTabVRENUM: TStringField;
    VerbuchDetailTabRDATUM: TDateField;
    ToolButton8: TToolButton;
    OPosQueryFREIGABE1: TBooleanField;
    UWTabFREIGABE1: TBooleanField;
    UeberweisTabART: TStringField;
    OPosQueryCALC_KUNDE: TStringField;
    UWTabCALC_KUNDE: TStringField;
    procedure TopPanResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure OPosQueryCalcFields(DataSet: TDataSet);
    procedure OposGridApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure OposGridDblClick(Sender: TObject);
    procedure OPosQueryAfterOpen(DataSet: TDataSet);
    procedure OposGridKeyPress(Sender: TObject; var Key: Char);
    procedure Allesmarkieren1Click(Sender: TObject);
    procedure keineMarkieren1Click(Sender: TObject);
    procedure lastschrift1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure AbbruchBtnClick(Sender: TObject);
    procedure UeberweisungGridApplyCellAttribute(Sender: TObject;
    Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure UWTabCalcFields(DataSet: TDataSet);
    procedure UWTabBeforeDelete(DataSet: TDataSet);
    procedure MakeLSBtnClick(Sender: TObject);
    procedure FirBankDSStateChange(Sender: TObject);
    procedure UWTabAfterOpen(DataSet: TDataSet);
    procedure UbwErfassenBtnClick(Sender: TObject);
    procedure UbwVerbuchenBtnClick(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure VerbuchTabAfterOpen(DataSet: TDataSet);
    procedure LSUndoBtnClick(Sender: TObject);
    procedure LSVerbuchenBtnClick(Sender: TObject);
    procedure UbwErfassenBtnMouseEnter(Sender: TObject);
    procedure UbwErfassenBtnMouseLeave(Sender: TObject);
  private
    { Private-Deklarationen }
    First: Boolean;
    InUeberweisung: Boolean;
    
    frei_cnt, nfrei_cnt: integer;
  public
    { Public-Deklarationen }
  end;
    
//var UeberweisungForm: TUeberweisungForm;
    
implementation

{$R *.DFM}

//------------------------------------------------------------------------------
uses
  GNUGetText,
  OF_DM, OF_Main, OF_DBGrid_Layout, OF_Var_Const;

const 
  ModulID: Integer = 4050;              

//------------------------------------------------------------------------------
procedure TLastschriftForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  First := True;
  InUeberweisung := False;

  UbwErfassenBtn.Align  := alRight;
  UbwVerbuchenBtn.Align := alRight;
  DatumAW.Align         := alRight;

  UbwErfassenBtn.Font.Style  := [fsBold];

  MainPanel.HelpContext       := 0;
  FreigabeTab.HelpContext     := 0;
  UeberweisungTab.HelpContext := 0;
  VerbuchenTab.HelpContext    := 0;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.FormActivate(Sender: TObject);
begin
  if First then
  begin
    // Laschen der Tabsheets ausschalten
    FreigabeTab.TabVisible := False;
    UeberweisungTab.TabVisible := False;
    VerbuchenTab.TabVisible := False;

    First := False;
    dm1.GridLoadLayout (tDBGrid(OposGrid), 'FIBU_LASTSCHRIFTEN', 101);
    dm1.GridLoadLayout (tDBGrid(UeberweisungGrid), 'FIBU_LASTSCHRIFTEN_2', 101);

    UeberweisungGrid.RowColor1  := DM1.C2Color;
    OposGrid.RowColor1          := DM1.C2Color;
    VerbuchGrid.RowColor1       := DM1.C2Color;
    VerbuchDetailGrid.RowColor1 := DM1.C2Color;


    UeberweisungGrid.EditColor  := DM1.EditColor;
    OposGrid.EditColor          := DM1.EditColor;
    VerbuchGrid.EditColor       := DM1.EditColor;
    VerbuchDetailGrid.EditColor := DM1.EditColor;

  end;
  frei_cnt := 0;

  // immer Freigabe-Tabsheet als erstes zeigen !!!
  PC1.ActivePage := FreigabeTab;
  UbwErfassenBtn.Font.Style  := [fsBold];
  UbwVerbuchenBtn.Font.Style  := [];
  OPosQuery.Open;
  PC1Change(Sender);
  OposGrid.SetFocus;

  UbwVerbuchenBtn.Enabled := DM1.CaoSecurity.CanFinish (ModulID, 0);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.FormDeactivate(Sender: TObject);
begin
  OPosQuery.Close;
  UWTab.Close;
  VerbuchDetailTab.Close;
  VerbuchTab.Close;
  DM1.FirBankTab.Close;
  FirBankDS.Dataset := nil;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.TopPanResize(Sender: TObject);
begin
  //DatumAW.Left :=TopPan.Width - DatumAW.Width-4;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.OPosQueryCalcFields(DataSet: TDataSet);
var d: tdatetime;
begin
  d := OPosQueryRDATUM.Value + OPosQuerySOLL_NTAGE.Value;
  OPosQueryZIEL_NETTO.Value := FormatDatetime ('dd.mm.yyyy', d);

  if (OPosQuerySOLL_sTAGE.Value > 0) and (OPosQuerySoll_SKONTO.Value > 0) then
  begin
    d := OPosQueryRDATUM.Value + OPosQuerySOLL_sTAGE.Value;
    OPosQueryZIEL_SKONTO.Value := FormatDatetime ('dd.mm.yyyy', d);
  end else 
    OPosQueryZIEL_SKONTO.Value := '';

  OPosQueryCalc_Kunde.AsString :=
  Trim (OPosQueryKUN_ANREDE.AsString + ' ' +
  OPosQueryKUN_NAME1.AsString + ' ' +
  OPosQueryKUN_NAME2.AsString + ' ' +
  OPosQueryKUN_NAME3.AsString);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.OposGridApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if (assigned(field)) and
     (uppercase(field.FieldName) = 'ZIEL_NETTO') and
     (OPosQueryRDATUM.Value + OPosQuerySOLL_NTAGE.Value < int(Now)) then  
    Canvas.Font.Color := clRed;

  if (assigned(field)) and
     (uppercase(field.FieldName) = 'ZIEL_SKONTO') and
     (OPosQueryRDATUM.Value + OPosQuerySOLL_STAGE.Value < int(Now)) then 
    Canvas.Font.Color := clRed;

  if OPosQueryFREIGABE1.Value = True then 
    Canvas.Font.Style := [fsBold];
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.OposGridDblClick(Sender: TObject);
begin
  if OPOsQuery.RecordCount = 0 then 
    exit;
  if (OPosQueryFreigabe1.Value <> True) and (DM1.CheckBankverbindung (OPosQueryAddr_ID.AsInteger)) then
  begin
    if OPosQuery.State <> dsEdit then 
      OPosQuery.Edit;
    OPosQueryFreigabe1.Value := True;
    try 
      OPOsQuery.Post; 
    except 
      OPOsQuery.Cancel; 
    end;

    OPosQueryAfterOpen (nil);
  end else
  if OPosQueryFreigabe1.Value<>True then
  begin
    MessageDlg (_('Die Bankverbindung des Kunden scheint nicht' + #13#10 +
      'in Ordnung zu sein. Bitte weisen Sie dem Kunden' + #13#10 +
      'eine gültige Bankverbindung zu.'), mterror, [mbok], 0);

  end else
  begin
    if OPosQuery.State <> dsEdit then 
      OPosQuery.Edit;
    OPosQueryFreigabe1.Value := False;
    try 
      OPOsQuery.Post; 
    except 
      OPOsQuery.Cancel; 
    end;

    OPosQueryAfterOpen (nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.OPosQueryAfterOpen(DataSet: TDataSet);
var 
  ges, frei, nfrei, b: double;
  ges_cnt: integer;
begin
  SumTab.Open;
  try
    ges       := 0;
    frei      := 0;
    ges_cnt   := 0;
    frei_cnt  := 0;
    nfrei_cnt := 0;
    while not sumtab.eof do
    begin
      ges := ges +
        dm1.CalcLeitWaehrung(sumtab.fieldbyname ('bsumme').asfloat,
        sumtab.fieldbyname ('waehrung').AsString);
      ges_cnt := ges_cnt + sumtab.fieldbyname ('anzahl').asInteger;

      if sumtab.fieldbyname ('freigabe').asBoolean = True then
      begin
        b := sumtab.fieldbyname ('bsumme').asfloat;
        frei_cnt := frei_cnt + sumtab.fieldbyname ('anzahl').asInteger;
        frei := frei + dm1.CalcLeitWaehrung(b, sumtab.fieldbyname ('waehrung').AsString);
      end;
      sumtab.next;
    end;

    SumCntLab.Caption := ' ' + IntToStr(ges_cnt);
    SummeLab.Caption  := FormatFloat (',#0.00', ges) + ' ' + DM1.LeitWaehrung + ' ';

    FreiCntLab.Caption := ' ' + IntToStr (Frei_Cnt);
    FreiLab.Caption := FormatFloat (',#0.00', frei) + ' ' + DM1.LeitWaehrung + ' ';

    lastschrift1.Enabled   := (Frei_Cnt > 0) and (DM1.CaoSecurity.CanInsert(ModulID, 0));
    LastschriftBtn.Enabled := lastschrift1.Enabled;
  finally
    SumTab.Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.OposGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #32)  then
  begin
    Key := #0;
    OposGridDblClick (Sender);
  end;
end;                

//------------------------------------------------------------------------------
procedure TLastschriftForm.Allesmarkieren1Click(Sender: TObject);
begin
  OPosQuery.DisableControls;
  try
    OPosQuery.First;
    while not OPosQuery.Eof do
    begin
      if (OPosQueryFreigabe1.Value <> True) and
      (DM1.CheckBankverbindung (OPosQueryAddr_ID.AsInteger)) then
      begin
        OPosQuery.Edit;
        OPosQueryFreigabe1.Value := True;
        OPosQuery.Post;
      end;
      OPosQuery.Next;
    end;
  finally
    OPosQuery.EnableControls;
    OPosQueryAfterOpen (nil);
  end;
end;                                        

//------------------------------------------------------------------------------
procedure TLastschriftForm.keineMarkieren1Click(Sender: TObject);
begin
  OPosQuery.DisableControls;
  try
    OPosQuery.First;
    while not OPosQuery.Eof do
    begin
      if OPosQueryFreigabe1.Value <> False then
      begin
        OPosQuery.Edit;
        OPosQueryFreigabe1.Value := False;
        OPosQuery.Post;
      end;
      OPosQuery.Next;
    end;
  finally
    OPosQuery.EnableControls;
    OPosQueryAfterOpen (nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.lastschrift1Click(Sender: TObject);
begin
  UWTab.Close;
  UWTab.Open;
  PC1.ActivePage := UeberweisungTab;
  FirBankDS.Dataset := DM1.FirBankTab;
  DM1.FirBankTab.Open;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(OposGrid));
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(OposGrid), 'FIBU_LASTSCHRIFTEN', 101);
  dm1.GridSaveLayout (tDBGrid(UeberweisungGrid), 'FIBU_LASTSCHRIFTEN_2', 101);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.AbbruchBtnClick(Sender: TObject);
begin
  UWTab.Close;
  PC1.ActivePage := FreigabeTab;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.UeberweisungGridApplyCellAttribute(Sender: TObject; Field: TField; 
          Canvas: TCanvas; State: TGridDrawState);
begin
  if (assigned(field)) and
     (uppercase(field.FieldName) = 'ZIEL_NETTO') and
     (UWTabRDATUM.Value + UWTabSOLL_NTAGE.Value<int(Now)) then  
    Canvas.Font.Color := clRed;

  if (assigned(field)) and
     (uppercase(field.FieldName) = 'ZIEL_SKONTO') and
     (UWTabRDATUM.Value + UWTabSOLL_STAGE.Value<int(Now)) then  
    Canvas.Font.Color := clRed;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.UWTabCalcFields(DataSet: TDataSet);
var 
  d: tdatetime;
begin
  d := UWTabRDATUM.Value + UWTabSOLL_NTAGE.Value;
  UWTabZIEL_NETTO.Value := FormatDatetime ('dd.mm.yyyy', d);

  if (UWTabSOLL_sTAGE.Value > 0) and (UWTabSoll_SKONTO.Value > 0) then
  begin
    d := UWTabRDATUM.Value + UWTabSOLL_sTAGE.Value;
    UWTabZIEL_SKONTO.Value := FormatDatetime ('dd.mm.yyyy', d);

    if UWTabBSumme.Value <> 0 then
    begin
      UWTabZahlBetrag.Value := 
        UWTabBSumme.Value -
        ((UWTabBSumme.Value / 100) * UWTabSoll_Skonto.Value) +
        UWTabMahnKosten.Value;
    end else 
      UWTabZahlBetrag.AsFloat := 0;
  end else
  begin
    UWTabZIEL_SKONTO.Value := '';
    UWTabZahlBetrag.Value := UWTabBSumme.Value + UWTabMahnKosten.Value;
  end;

  UWTabCALC_KUNDE.AsString := Trim(
    UWTabKUN_ANREDE.AsString + ' ' +
    UWTabKUN_NAME1.AsString + ' ' +
    UWTabKUN_NAME2.AsString + ' ' +
    UWTabKUN_NAME3.AsString
  );
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.UWTabBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.MakeLSBtnClick(Sender: TObject);
var 
  _KTO    : String;
  _BLZ    : Integer;
  _Inhaber: String;
  sb      : double;
  RefNum  : String;
  VW, VW1  : String;
  UWNum   : Integer;
begin
  if MessageDlg (_('Wollen Sie die Lastschrift(en) wirklich ausführen ?'),
       mtconfirmation, mbyesnocancel, 0) <> mrYes then 
    exit;

  InUeberweisung := True;

  UWNum := DM1.IncNummer (UEBERWEISUNG);

  UeberweisTab.Open;

  RefNum := IntToStr(UWNum);
  with DTAUS1 do
  begin
    Clear;

    KundenName       := dm1.FirBankTabinhaber.AsString;
    BLZ              := dm1.FirBankTabblz.AsInteger;
    ErstellungsDatum := now;
    Kontonummer      := dm1.FirBankTabktonr.AsString;
    Kundendiskette   := true;
    Lastschriften    := True;
    Referenznummer   := RefNum;
    Waehrung         := Euro;

    Dateiname := DM1.DTADir + dm1.AktMandant + '__' +
    formatdatetime ('yyyy_mm_dd_hh_mm', now) +
    '__' + Refnum + '.dta';

    UWTab.DisableControls;
    try
      UWTab.First;
      while not UWTab.EOF do
      begin
        if DM1.GetBankverbindung (UWTabAddr_ID.AsInteger, _BLZ, _KTO, _Inhaber) then
        begin
          Append;
          AktuellerDatensatz.NAME             := _Inhaber;
          AktuellerDatensatz.BLZ              := _BLZ;
          AktuellerDatensatz.KontoNummer      := _KTO;
          AktuellerDatensatz.Betrag           := dm1.CalcLeitWaehrung
          (UWTabZahlBetrag.AsFloat,
          UWTabwaehrung.AsString);
          AktuellerDatensatz.Zahlungsart      := LS_Einzug;
          AktuellerDatensatz.InterneNummer    := StrToIntDef(UWTabVRENUM.AsString, 0); //JP01042005

          // 1. Zeile Verwendungszweck aus der Registry laden
          VW1 := DM1.ReadString ('MAIN\FIBU', 'LASTSCHRIFT_Z1', '');
          if length(VW1) > 0 then
          begin
            if length(VW1) > 26 then 
              VW1 := Copy (VW1, 1, 26);
            while length(VW1) < 26 do 
              VW1 := VW1 + ' ';
          end;

          VW := 'RE ' + UWTabVRENUM.AsString + ' / KU ' + UWTabKUN_NUM.AsString;
          if UWTABSOLL_SKONTO.AsFloat > 0 then
          begin
            while length(VW) < 26 do 
              VW := VW + ' ';
            VW := VW +
            ' ABZUEGL. ' +
            FormatFloat ('0.0#', UWTABSOLL_SKONTO.AsFloat) +
            '% SKONTO = ' +
            FormatFloat (',#0.00',
            dm1.CalcLeitWaehrung(UWTABBSUMME.AsFloat,
            UWTabwaehrung.AsString) -
            dm1.CalcLeitWaehrung(UWTabZahlBetrag.AsFloat,
            UWTabwaehrung.AsString)
            );
          end;

          AktuellerDatensatz.Verwendungszweck := VW1 + VW;
          Post;

          UWTab.Edit;

          //UWTabBank_ID.AsInteger  :=dm1.FirBankTab.RecNo;
          UWTabUWNum.AsInteger    := UWNum;
          UWTabStadium.AsInteger  := 110;
          UWTabIST_Betrag.AsFloat := UWTabZahlBetrag.Value;

          if UWTabRDATUM.Value + UWTabSOLL_sTAGE.Value >= int(now) then 
            UWTabIST_SKONTO.Value := UWTabSOLL_SKONTO.Value
          else 
            UWTabIST_SKONTO.Value := 0;

          UWTabIST_ZAHLDAT.AsDateTime := now;
          UWTab.Post;

          UeberweisTab.Append;

          UeberweisTabUWNUM.Value      := UWNum;
          UeberweisTabFERTIG.Value     := 0;
          UeberweisTabJOURNAL_ID.Value := UWTabRec_ID.Value;
          UeberweisTabUW_DATUM.Value   := int(now);
          UeberweisTabBETRAG.Value     := dm1.CalcLeitWaehrung(UWTabZahlBetrag.AsFloat,
          UWTabwaehrung.AsString);
          UeberweisTabKTO.Value        := _KTO;
          UeberweisTabBLZ.Value        := IntToStr(_BLZ);
          UeberweisTabBINHABER.Value   := //UWTabKUN_Name1.Valu;
          Trim (UWTabKUN_ANREDE.AsString + ' ' +
          UWTabKUN_NAME1.AsString + ' ' +
          UWTabKUN_NAME2.AsString + ' ' +
          UWTabKUN_NAME3.AsString);

          UeberweisTabUW_TEXT.Value    := VW;
          UeberweisTabART.AsString     := 'L';

          UeberweisTab.Post;
        end;

        UWTab.Next;
      end;

      UeberweisTab.Append;

      UeberweisTabUWNUM.Value      := UWNum;
      UeberweisTabFERTIG.Value     := 0;
      UeberweisTabJOURNAL_ID.Value := -1;
      UeberweisTabUW_DATUM.Value   := int(now);
      UeberweisTabBETRAG.Value     := DTAUS1.SummeEuro;
      UeberweisTabKTO.Value        := dm1.FirBankTabktonr.AsString;
      UeberweisTabBLZ.Value        := dm1.FirBankTabblz.AsString;
      UeberweisTabBINHABER.Value   := dm1.FirBankTabinhaber.AsString;
      UeberweisTabUW_TEXT.Value    := dm1.FirBankTabkurzbez.AsString;
      UeberweisTabART.AsString     := 'L';

      UeberweisTab.Post;
    finally
      UWTab.EnableControls;
      UeberweisTab.Close;
    end;
  end;
  DTAUS1.SaveToDisk;

  InUeberweisung := False;

  MessageDlg (Format(
    _('Die Lastschrift(en) wurden mit der Nr. %s' + #10#10 +
    'in der Datei: %s gespeichert.'),
    [RefNum, DTAUS1.Dateiname]),
    mtinformation, [mbok], 0);

  OPosQuery.Close;
  UWTab.Close;
  FormActivate (Sender);
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.FirBankDSStateChange(Sender: TObject);
begin
  MakeLSBtn.Enabled := DM1.FirBankTab.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.UWTabAfterOpen(DataSet: TDataSet);
var 
  LastRecID, Cnt: Integer; 
    Sum: Double;
begin
  if InUeberweisung then 
    exit;

  UWTab.DisableControls;
  LastRecID := UWTabRec_ID.Value;
  UWTab.First;
  SUM := 0; CNT := 0;
  while not UWTab.Eof do
  begin
    Sum := SUM + dm1.CalcLeitWaehrung(UWTabZahlBetrag.AsFloat,
    UWTabwaehrung.AsString);

    UWTab.Next;
    inc(cnt);
  end;
  UWTab.Locate ('REC_ID', LastRecID, []);
  UWTab.EnableControls;
  FreiCntLab2.Caption := IntToStr (Cnt) + ' ' + _('Positionen') + ' = ';
  FreiLab2.Caption := FormatFloat (',#0.00', sum) + ' ' + DM1.LeitWaehrung + ' ';
end;                                                                             

//------------------------------------------------------------------------------
procedure TLastschriftForm.UbwErfassenBtnClick(Sender: TObject);
begin
  if PC1.ActivePage = VerbuchenTab then
  begin
    OPosQuery.Close;
    FormActivate (Sender);
    PC1Change(Sender);
    VerbuchTab.Close;
    VerbuchDetailTab.Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.UbwVerbuchenBtnClick(Sender: TObject);
begin
  if PC1.ActivePage<>VerbuchenTab then
  begin
    UbwErfassenBtn.Font.Style  := [];
    UbwVerbuchenBtn.Font.Style := [fsBold];
    PC1.ActivePage := VerbuchenTab;
    PC1Change(Sender);
    VerbuchTab.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.PC1Change(Sender: TObject);
begin
  Allesmarkieren1.Enabled := PC1.ActivePage = FreigabeTab;
  keineMarkieren1.Enabled := PC1.ActivePage = FreigabeTab;
  lastschrift1.Enabled    := (PC1.ActivePage = FreigabeTab) and (frei_cnt>0) and
                             (DM1.CaoSecurity.CanInsert(ModulID, 0));
  LastschriftBtn.Enabled := lastschrift1.Enabled;
end;                       

//------------------------------------------------------------------------------
procedure TLastschriftForm.VerbuchTabAfterOpen(DataSet: TDataSet);
begin
  VerbuchDetailTab.Close;
  if VerbuchTab.RecordCount > 0 then
  begin
    VerbuchDetailTab.ParamByName ('UWNUM').AsInteger := VerbuchTabUWNUM.AsInteger;
    VerbuchDetailTab.Open;

    LSVerbuchenBtn.Enabled := VerbuchTabFERTIG.Value = 0;
    LSUndoBtn.Enabled      := VerbuchTabFERTIG.Value = 0;
  end else
  begin
    LSVerbuchenBtn.Enabled := False;
    LSUndoBtn.Enabled      := False;
  end;
end; 

//------------------------------------------------------------------------------
procedure TLastschriftForm.LSUndoBtnClick(Sender: TObject);
var 
  LastID: Integer;
begin
  if MessageDlg (_('Wollen Sie die Lastschrift(en) wirklich ' +
    'rückgängig machen ???'),
    mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    dm1.uniquery.close;
    dm1.uniquery.sql.clear;
    dm1.uniquery.sql.Text :=
      'update JOURNAL ' +
      'set STADIUM=29,IST_BETRAG=0,IST_SKONTO=NULL,IST_ZAHLDAT=NULL,' +
      'FREIGABE1_FLAG="N" ' +
      'where UW_NUM=' + Inttostr(VerbuchTabUWNUM.AsInteger) + ' and QUELLE=3';
    dm1.uniquery.ExecSql;
    dm1.uniquery.close;

    VerbuchTab.Edit;
    VerbuchTabFertig.AsInteger := -1; // Storno-Kennzeichen
    VerbuchTab.Post;

    LastID := VerbuchTabID.Value;
    VerbuchTab.Close;
    VerbuchTab.Open;
    VerbuchTab.Locate ('ID', LastID, []);
    VerbuchTabAfterOpen(nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TLastschriftForm.LSVerbuchenBtnClick(Sender: TObject);
var 
  LastID: Integer;
begin
  if MessageDlg (_('Wollen Sie die Lastschrift(en) wirklich verbuchen ???'),
     mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    dm1.uniquery.Close;
    dm1.uniquery.sql.clear;
    dm1.uniquery.sql.text :=
      'select * from JOURNAL ' +
      'where UW_NUM=' + Inttostr(VerbuchTabUWNUM.AsInteger) + ' and QUELLE=3';

    dm1.uniquery.ReadOnly := False;
    try
      dm1.uniquery.Open;
      while not dm1.uniquery.eof do
      begin
        dm1.UniQuery.edit;
        if dm1.uniquery.fieldbyname ('IST_SKONTO').asFloat > 0 then 
          dm1.uniquery.fieldbyname ('STADIUM').asInteger := 89
        else 
          dm1.uniquery.fieldbyname ('STADIUM').asInteger := 99;
        dm1.uniquery.post;
        dm1.uniquery.next;
      end;
      dm1.uniquery.close;
    finally
      dm1.uniquery.ReadOnly := True;
    end;

    VerbuchTab.Edit;
    VerbuchTabFertig.AsInteger := 1; // Verbucht-Kennzeichen
    VerbuchTab.Post;

    LastID := VerbuchTabID.Value;
    VerbuchTab.Close;
    VerbuchTab.Open;
    VerbuchTab.Locate ('ID', LastID, []);
    VerbuchTabAfterOpen(nil);
  end;
end;      

//------------------------------------------------------------------------------
procedure TLastschriftForm.UbwErfassenBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                                

//------------------------------------------------------------------------------
procedure TLastschriftForm.UbwErfassenBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------

end.

