{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Mahnungen erstellen / verwalten                                   }
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
{ - Mahngebühren                                                               }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 22.02.2004 JP - Mahnfristen werden jetzt korrekt verwendet                   }
{ 19.04.2004 JP - Bug bei Anzeige der zu druckenden Mahnungen gefixt           }
{ 22.12.2004 JP - Der Kundennname wird jetzt aus Anrede + Name1-3              }
{                 zusammengebaut und angezeigt                                 }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MahnlaufDlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ComCtrls, DBCtrls,
  ToolWin, JvExComCtrls, JvComCtrls, VolPeriod{???}, JvExControls, JvComponent,
  JvSpeedButton, StdCtrls, ExtCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

{
uses
  JvDBCtrl,
}

type
  TMahnForm = class(TForm)
    MahnTab: TOFZQuery;
    MahnDS: TDataSource;
    MahnTabquelle: TIntegerField;
    MahnTabvrenum: TStringField;
    MahnTabrdatum: TDateField;
    MahnTabkun_name1: TStringField;
    MahnTabbsumme: TFloatField;
    MahnTabstadium: TIntegerField;
    MahnTabmahnstufe: TIntegerField;
    MahnTabmahndatum: TDateField;
    MahnTabnew_mahnstufe: TLargeintField;
    MahnPrintDS: TDataSource;
    MahnPrintTab: TZQuery;
    MahnTabTAGE_OFFEN: TLargeintField;
    MainPanel: TPanel;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Suchen1: TMenuItem;
    N1: TMenuItem;
    Allesmarkieren1: TMenuItem;
    keineMarkieren1: TMenuItem;
    N2: TMenuItem;
    mahnen1: TMenuItem;
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
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    TopPan: TPanel;
    Label35: TLabel;
    MahnErfassenBtn: TJvSpeedButton;
    MahnDruckenBtn: TJvSpeedButton;
    DatumAW: TVolgaPeriod;
    PC1: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    MahnPrintGrid: TOFDBGrid;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    AlleFreigebenBtn: TToolButton;
    KeineFreigebenBtn: TToolButton;
    ToolButton3: TToolButton;
    MahnenBtn: TToolButton;
    MahnGrid: TOFDBGrid;
    MahnTabrec_id: TIntegerField;
    SumTab: TZQuery;
    ToolButton1: TToolButton;
    MahnTabmahnprint: TIntegerField;
    MahnPrintToolBar: TToolBar;
    DBNavigator2: TDBNavigator;
    ToolButton2: TToolButton;
    MahnPrintTabquelle: TIntegerField;
    MahnPrintTabvrenum: TStringField;
    MahnPrintTabrdatum: TDateField;
    MahnPrintTabaddr_id: TIntegerField;
    MahnPrintTabbsumme: TFloatField;
    MahnPrintTabwaehrung: TStringField;
    MahnPrintTabsoll_ntage: TIntegerField;
    MahnPrintTabmahnkosten: TFloatField;
    MahnPrintTabgegenkonto: TIntegerField;
    MahnPrintTabkun_num: TStringField;
    MahnPrintTabkun_name1: TStringField;
    MahnPrintTabsaldo: TFloatField;
    MahnPrintTabmahnstufe: TIntegerField;
    MahnPrintTabtage_offen: TLargeintField;
    MahnPrintTabrec_id: TIntegerField;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    AlsGedrucktMarkierenBtn: TToolButton;
    AlleAlsGedrucktMarkierenBtn: TToolButton;
    DruckenBtn: TToolButton;
    AlleDruckenBtn: TToolButton;
    MahnPrintTabmahnprint: TIntegerField;
    ToolButton9: TToolButton;
    MahnTabFREIGABE1_Flag: TBooleanField;
    MahnTabKUN_ANREDE: TStringField;
    MahnTabKUN_NAME2: TStringField;
    MahnTabKUN_NAME3: TStringField;
    MahnTabCALC_KUNDE: TStringField;
    MahnPrintTabCALC_KUNDE: TStringField;
    MahnPrintTabKUN_ANREDE: TStringField;
    MahnPrintTabKUN_NAME2: TStringField;
    MahnPrintTabKUN_NAME3: TStringField;
    MahnTabSOLL_NTAGE: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure MahnTabAfterOpen(DataSet: TDataSet);
    procedure Allesmarkieren1Click(Sender: TObject);
    procedure keineMarkieren1Click(Sender: TObject);
    procedure MahnGridDblClick(Sender: TObject);
    procedure MahnPrintTabBeforeDelete(DataSet: TDataSet);
    procedure MahnTabAfterScroll(DataSet: TDataSet);
    procedure SumTabAfterOpen(DataSet: TDataSet);
    procedure mahnen1Click(Sender: TObject);
    procedure MahnDruckenBtnClick(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure MahnErfassenBtnClick(Sender: TObject);
    procedure MahnPrintTabAfterOpen(DataSet: TDataSet);
    procedure AlsGedrucktMarkierenBtnClick(Sender: TObject);
    procedure AlleDruckenBtnClick(Sender: TObject);
    procedure DruckenBtnClick(Sender: TObject);
    procedure AlleAlsGedrucktMarkierenBtnClick(Sender: TObject);
    procedure MahnDruckenBtnMouseEnter(Sender: TObject);
    procedure MahnDruckenBtnMouseLeave(Sender: TObject);
    procedure MahnTabCalcFields(DataSet: TDataSet);
    procedure MahnPrintTabCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First: Boolean;
    Ausgewaehlt: Integer;
    QueryTime  : DWord;
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
  end;
    
    //var MahnForm: TMahnForm;
    
implementation

{$R *.DFM}

uses
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_DBGrid_Layout, OF_DM, OF_Main;

//------------------------------------------------------------------------------
procedure TMahnForm.FormCreate(Sender: TObject);
var 
  i: Integer;
begin
  OnUpdateStatusBar := nil;
  First := True;
  for i := 0 to PC1.PageCount-1 do 
    PC1.Pages[i].TabVisible := False;
  PC1.TabHeight := 1;

  MahnErfassenBtn.Align := alRight;
  MahnDruckenBtn.Align  := alRight;
  DatumAW.Align         := alRight;

  MahnErfassenBtn.Font.Style  := [fsBold];

  MainPanel.HelpContext := 8300;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.FormActivate(Sender: TObject);
var 
  i: integer;
begin
  if First then
  begin
    MainForm.SBar.SimpleText := 'Lade Benutzereinstellungen...';
    MainForm.SBar.SimplePanel := True;
    Application.ProcessMessages;

    MahnGrid.RowColor1 := DM1.C2Color;
    MahnPrintGrid.RowColor1 := DM1.C2Color;
    MahnGrid.EditColor := DM1.EditColor;
    MahnPrintGrid.EditColor := DM1.EditColor;


    if DM1.ReadString ('MAIN\MAHNUNG', 'DEFAULT', '') = '' then
      DM1.WriteString ('MAIN\MAHNUNG', 'DEFAULT', 'Einstellungen für Mahnlauf');

    for i := 1 to 5 do
    begin
      DM1.MahnFrist[i] := DM1.ReadInteger ('MAIN\MAHNUNG', 'FRIST_STUFE_' + Inttostr(I), -1);
      if DM1.MahnFrist[i]<0 then
      begin
        DM1.MahnFrist[i] := 14;
        DM1.WriteInteger ('MAIN\MAHNUNG', 'FRIST_STUFE_' + Inttostr(I), DM1.MahnFrist[i]);
      end;
    end;

    dm1.GridLoadLayout (tDBGrid(MahnGrid), 'MAHNUNGEN_AUSWAHL', 101);
    dm1.GridLoadLayout (tDBGrid(MahnPrintGrid), 'MAHNUNGEN_PRINT', 101);

    MahnTab.ParamByName ('STUFE1_TAGE').AsInteger := DM1.MahnFrist[1];
    MahnTab.ParamByName ('STUFE2_TAGE').AsInteger := DM1.MahnFrist[2];
    MahnTab.ParamByName ('STUFE3_TAGE').AsInteger := DM1.MahnFrist[3];
    MahnTab.ParamByName ('STUFE4_TAGE').AsInteger := DM1.MahnFrist[4];

    First := False;


    MainForm.SBar.SimpleText := '';
    MainForm.SBar.SimplePanel := False;
    Application.ProcessMessages;
  end;
  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);
  MahnGrid.SetFocus;

  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.FormDeactivate(Sender: TObject);
begin
  MahnTab.Close;
  MahnPrintTab.Close;
  SumTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(MahnGrid));
end;

//------------------------------------------------------------------------------
procedure TMahnForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(MahnGrid), 'MAHNUNGEN_AUSWAHL', 101);
  dm1.GridSaveLayout (tDBGrid(MahnPrintGrid), 'MAHNUNGEN_PRINT', 101);
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnTabAfterOpen(DataSet: TDataSet);
begin
  Allesmarkieren1.Enabled   := MahnTab.RecordCount > 0;
  keineMarkieren1.Enabled   := MahnTab.RecordCount > 0;

  KeineFreigebenBtn.Enabled := Allesmarkieren1.Enabled;
  AlleFreigebenBtn.Enabled  := keineMarkieren1.Enabled;

  SumTab.Open;
  SumTab.Close;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.Allesmarkieren1Click(Sender: TObject);
begin
  MahnTab.DisableControls;
  try
    MahnTab.First;
    while not MahnTab.Eof do
    begin
      MahnTab.Edit;
      MahnTabFreigabe1_Flag.AsBoolean := True;
      MahnTab.Post;
      MahnTab.Next;
    end;
  finally
    MahnTab.EnableControls;
  end;
  SumTab.Open;
  SumTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.keineMarkieren1Click(Sender: TObject);
begin
  MahnTab.DisableControls;
  try
    MahnTab.First;
    while not MahnTab.Eof do
    begin
      MahnTab.Edit;
      MahnTabFreigabe1_Flag.AsBoolean := False;
      MahnTab.Post;
      MahnTab.Next;
    end;
  finally
    MahnTab.EnableControls;
  end;
  SumTab.Open;
  SumTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnGridDblClick(Sender: TObject);
begin
  if MahnTab.RecordCount = 0 then exit;

  if (MahnTabFreigabe1_Flag.Value = False) then
  begin
    if MahnTab.State <> dsEdit then 
      MahnTab.Edit;
    MahnTabFreigabe1_Flag.Value := True;
    try 
      MahnTab.Post; 
    except 
      MahnTab.Cancel; 
    end;
  end else
  begin
    if MahnTab.State <> dsEdit then 
      MahnTab.Edit;
    MahnTabFreigabe1_Flag.Value := False;
    try 
      MahnTab.Post; 
    except 
      MahnTab.Cancel; 
    end;
  end;

  SumTab.Open;
  SumTab.Close;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnPrintTabBeforeDelete(DataSet: TDataSet);
begin
  Abort; // Löschen nicht erlaub;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnTabAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' Sek.';
    if PC1.ActivePage = TabSheet1 then
    begin
      if MahnTab.RecordCount = 0 then 
        Datensatz := 'keine'
      else 
        Datensatz := inttostr (MahnTab.RecNo) + ' von ' + inttostr (MahnTab.RecordCount);

      Sortierung := Inttostr(MahnTab.RecordCount) + ' mahnbare Rechnungen';
      Erstellt := IntToStr(Ausgewaehlt) + ' Mahnungen ausgewählt';
    end else
    begin
      Sortierung := Inttostr(MahnPrintTab.RecordCount) + ' druckbare Mahnungen';
      Erstellt := '';
      if MahnPrintTab.RecordCount = 0 then 
        Datensatz := 'keine'
      else 
        Datensatz := inttostr (MahnPrintTab.RecNo) + ' von ' + inttostr (MahnPrintTab.RecordCount);
    end;

    Geaendert := '';
    OnUpdateStatusBar (SuchZeit, DatenSatz, Sortierung, Erstellt, Geaendert);
  end;

  DruckenBtn.Enabled                  := (MahnPrintTab.Active) and (MahnPrintTab.RecordCount > 0);
  AlleDruckenBtn.Enabled              := (MahnPrintTab.Active) and (MahnPrintTab.RecordCount > 1);
  AlsGedrucktMarkierenBtn.Enabled     := (MahnPrintTab.Active) and (MahnPrintTab.RecordCount > 0);
  AlleAlsGedrucktMarkierenBtn.Enabled := (MahnPrintTab.Active) and (MahnPrintTab.RecordCount > 1);
end;

//------------------------------------------------------------------------------
procedure TMahnForm.SumTabAfterOpen(DataSet: TDataSet);
begin
  if SumTab.Locate ('FREIGABE1_FLAG', True, []) then 
    Ausgewaehlt := SumTab.FieldByName ('ANZAHL').AsInteger
  else 
    Ausgewaehlt := 0;
  SumTab.Close;

  mahnen1.enabled := Ausgewaehlt>0;
  MahnenBtn.enabled := Ausgewaehlt>0;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.mahnen1Click(Sender: TObject);
begin
  if MessageDlg ('Wollen Sie die ausgewählten Rechnung wirklich mahnen ?',
       mtconfirmation, mbyesnocancel, 0)<>mryes then 
    exit;

  MahnTab.DisableControls;
  try
    MahnTab.First;
    while not MahnTab.Eof do
    begin
      if MahnTabFreigabe1_Flag.Value = True then
      begin
        MahnTab.Edit;
        MahnTabFreigabe1_Flag.AsBoolean := False;
        MahnTabmahndatum.AsDateTime := Int(Now);
        if MahnTabstadium.AsInteger < 50 then 
          MahnTabstadium.AsInteger := MahnTabstadium.AsInteger + 10;
        MahnTabmahnstufe.AsInteger := MahnTabnew_mahnstufe.AsInteger;
        MahnTabmahnprint.AsInteger := MahnTabMahnPrint.AsInteger + 1;

        MahnTab.Post;
      end;
      MahnTab.Next;
    end;
  finally
    MahnTab.Close;
    MahnTab.Open;
    MahnTab.EnableControls;
  end;
  if MessageDlg ('Wollen Sie die neu erstellten Mahnungen drucken ?',
       mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    PC1.ActivePage := TabSheet3;
    PC1Change(Sender);
  end;
end;  

//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnClick(Sender: TObject);
begin
  PC1.ActivePage := TabSheet3;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnErfassenBtnClick(Sender: TObject);
begin
  PC1.ActivePage := TabSheet1;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TMahnForm.PC1Change(Sender: TObject);
begin
  if PC1.ActivePage = TabSheet1 then
  begin
    MahnErfassenBtn.Font.Style := [fsBold];
    MahnDruckenBtn.Font.Style := [];
    QueryTime  := GetTickCount;
    MahnTab.Open;
    QueryTime := GetTickCount - QueryTime;
    MahnPrintTab.Close;
    UpdateStatus;
  end else
  begin
    MahnErfassenBtn.Font.Style := [];
    MahnDruckenBtn.Font.Style := [fsBold];
    MahnTab.Close;
    QueryTime  := GetTickCount;
    MahnprintTab.Open;
    QueryTime := GetTickCount - QueryTime;
    Allesmarkieren1.enabled := False;
    keineMarkieren1.enabled := False;
    mahnen1.enabled := False;
    UpdateStatus;
  end;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnPrintTabAfterOpen(DataSet: TDataSet);
begin
  MahnPrintToolBar.Enabled := MahnPrintTab.RecordCount>0;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.AlsGedrucktMarkierenBtnClick(Sender: TObject);
begin
  MahnPrintTab.Edit;
  MahnPrintTabMahnPrint.Value := 0;
  MahnPrintTab.Post;
  MahnPrintTab.Refresh;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.AlleDruckenBtnClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowMahnungDlg(-1);
  FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TMahnForm.DruckenBtnClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowMahnungDlg (MahnPrintTabAddr_ID.Value);
  FormActivate (Self);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TMahnForm.AlleAlsGedrucktMarkierenBtnClick(Sender: TObject);
begin
  if messageDlg ('Wollen Sie wirklich alle Mahnungen als gedruckt markieren ?',
      mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    MahnPrintTab.DisableControls;
    try
      MahnPrintTab.First;
      while not MahnPrintTab.Eof do
      begin
        MahnPrintTab.Edit;
        MahnPrintTabMahnPrint.Value := 0;
        MahnPrintTab.Post;
        MahnPrintTab.Next;
      end;
    finally
      MahnPrintTab.EnableControls;
    end;
    MahnPrintTab.Refresh;
    UpdateStatus;
  end;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                                

//------------------------------------------------------------------------------
procedure TMahnForm.MahnDruckenBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnTabCalcFields(DataSet: TDataSet);
begin
  MahnTabCALC_KUNDE.AsString := Trim(
    MahnTabkun_Anrede.AsString + ' ' +
    MahnTabkun_name1.AsString  + ' ' +
    MahnTabkun_name2.AsString  + ' ' +
    MahnTabkun_name3.AsString
  );
end;

//------------------------------------------------------------------------------
procedure TMahnForm.MahnPrintTabCalcFields(DataSet: TDataSet);
begin
  MahnPrintTabCALC_KUNDE.AsString := Trim(
    MahnPrintTabkun_Anrede.AsString + ' ' +
    MahnPrintTabkun_name1.AsString  + ' ' +
    MahnPrintTabkun_name2.AsString  + ' ' +
    MahnPrintTabkun_name3.AsString
  );
end;

//------------------------------------------------------------------------------

end.

