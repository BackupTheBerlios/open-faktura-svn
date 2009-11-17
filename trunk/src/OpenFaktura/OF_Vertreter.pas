{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Vertreter erstellen, löschen u. bearbeiten                        }
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
{ 20.08.2003 - KL: Unit erstellt }
{ 16.11.2003 - JP: Unit überarbeitet, Farben, Enter statt TAB, Menüs etc. }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Vertreter;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, ExRxDBGrid{???}, JvExMask, JvToolEdit,
  JvDBControls, StdCtrls, DBCtrls, Mask, OFGroupBox, ComCtrls,
  JvExComCtrls, JvComCtrls, ToolWin, JvExControls, JvComponent,
  JvSpeedButton, ExtCtrls,
  OF_Var_Const, JvMenus;

{
uses
  JvDBCtrl,
}

type
  TVertreterForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    MainTopLab: TLabel;
    ButtonPan: TPanel;
    AllgBtn: TJvSpeedButton;
    ProBtn: TJvSpeedButton;
    Liste_Btn: TJvSpeedButton;
    ListeBtn: TJvSpeedButton;
    Vert_Tab: TZQuery;
    KunToolbar: TToolBar;
    DBNavigator3: TDBNavigator;
    Label35: TLabel;
    SuchBeg: TEdit;
    ToolButton6: TToolButton;
    UebernahmeBtn: TToolButton;
    Vert_DS: TDataSource;
    Main_PC: TJvPageControl;
    Allg_TS: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    KommunikationGB: TOFGroupBox;
    AllgemeinGB: TOFGroupBox;
    BemerkungGB: TOFGroupBox;
    MaBemerkung: TDBMemo;
    VeNumEdi: TDBEdit;
    VeNameEdi: TDBEdit;
    VeVNameEdi: TDBEdit;
    VeStrasseEdi: TDBEdit;
    VeOrtEdi: TDBEdit;
    Label56: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    VePLZEdi: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    VeFunkEdi: TDBEdit;
    VeFaxEdi: TDBEdit;
    VeTelEdi: TDBEdit;
    Label10: TLabel;
    VeEmailEdi: TDBEdit;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    CaoGroupBox1: TOFGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ProvArtEdi: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    BankGB: TOFGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label78: TLabel;
    KontoEdi: TDBEdit;
    BlZEdi: TJvDBComboEdit;
    BankNameEdi: TDBEdit;
    KontoInhEdi: TDBEdit;
    Such_TS: TTabSheet;
    SuchGrid: TExRxDBGrid;
    Vert_TabVERTRETER_ID: TIntegerField;
    Vert_TabVERTR_NUMMER: TStringField;
    Vert_TabNAME: TStringField;
    Vert_TabVNAME: TStringField;
    Vert_TabANREDE: TStringField;
    Vert_TabTITEL: TStringField;
    Vert_TabZUSATZ: TStringField;
    Vert_TabZUSATZ2: TStringField;
    Vert_TabZUHAENDEN: TStringField;
    Vert_TabSTRASSE: TStringField;
    Vert_TabLAND: TStringField;
    Vert_TabPLZ: TStringField;
    Vert_TabORT: TStringField;
    Vert_TabTELEFON: TStringField;
    Vert_TabFAX: TStringField;
    Vert_TabFUNK: TStringField;
    Vert_TabEMAIL: TStringField;
    Vert_TabINTERNET: TStringField;
    Vert_TabSPRACH_ID: TIntegerField;
    Vert_TabPROVISIONSART: TStringField;
    Vert_TabABRECHNUNGSZEITPUNKT: TStringField;
    Vert_TabPROVISIONSATZ: TFloatField;
    Vert_TabLETZTEABRECHNUNG: TDateField;
    Vert_TabUMSATZ: TFloatField;
    Vert_TabPROVISION: TFloatField;
    Vert_TabBESCHAEFTIGUNGSART: TIntegerField;
    Vert_TabBESCHAEFTIGUNGSGRAD: TIntegerField;
    Vert_TabGUELTIG_VON: TDateTimeField;
    Vert_TabGUELTIG_BIS: TDateTimeField;
    Vert_TabGEBDATUM: TDateTimeField;
    Vert_TabGESCHLECHT: TStringField;
    Vert_TabFAMSTAND: TIntegerField;
    Vert_TabBANK: TStringField;
    Vert_TabBLZ: TStringField;
    Vert_TabKTO: TStringField;
    Vert_TabBEMERKUNG: TMemoField;
    Vert_TabERSTELLT: TDateTimeField;
    Vert_TabERSTELLT_NAME: TStringField;
    Vert_TabGEAEND: TDateTimeField;
    Vert_TabGEAEND_NAME: TStringField;
    MainMenu1: TJvMainMenu;
    Adresse1: TMenuItem;
    Neu1: TMenuItem;
    Loeschen1: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    N2: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Name: TMenuItem;
    Ort: TMenuItem;
    Nummer: TMenuItem;
    MenuItem2: TMenuItem;
    Allgemein1: TMenuItem;
    Provision1: TMenuItem;
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
    Extras1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    CaoGroupBox2: TOFGroupBox;
    Vert_TabPROVISIONMITTRANSPORT: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Vert_TabAfterPost(DataSet: TDataSet);
    procedure Vert_TabAfterScroll(DataSet: TDataSet);
    procedure Vert_TabBeforePost(DataSet: TDataSet);
    procedure SuchGridDblClick(Sender: TObject);
    procedure ListeBtnClick(Sender: TObject);
    procedure Main_PCChange(Sender: TObject);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchBegKeyPress(Sender: TObject; var Key: Char);
    procedure SuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure Neu1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure BlZEdiButtonClick(Sender: TObject);
    procedure BlZEdiExit(Sender: TObject);
    procedure Vert_TabBeforeInsert(DataSet: TDataSet);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure TrefferClick(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure VeNumEdiEnter(Sender: TObject);
    procedure VeNumEdiExit(Sender: TObject);
    procedure VeNumEdiKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure VeNumEdiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
    
    searchtime : Integer;
    querytime  : Integer;
    Limit      : Integer;
    Sortfield  : String;
    SearchField: String;
    Sortname   : string;
    SuchBegr   : String;
    aktsort    : integer;
    
    procedure SetSort (Sort: Integer);
    procedure UpdateQuery;
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    First: Boolean;
    OnUpdateStatusBar: TOnUpdateStatusBar;
  end;
    
var
  VertreterForm: TVertreterForm;
  
implementation

uses
  OF_Main, OF_DM, OF_DBGrid_Layout, OF_BLZ, OF_Progress;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TVertreterForm.FormCreate(Sender: TObject);
var 
  i: Integer;
begin
  First := True;
  Limit := 50;
  SortName    := 'Name';
  SortField   := 'NAME';
  SearchField := 'NAME';

  ListeBtn.Align := alRight;
  AllgBtn.Align  := alRight;
  ProBtn.Align   := alRight;

  OnUpdateStatusBar      := nil;
  for i := 0 to Main_PC.PageCount-1 do 
    Main_PC.Pages[i].TabVisible := False;
  Main_PC.ActivePage := Main_PC.Pages[0];
  SetSort (1);
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.FormActivate(Sender: TObject);
var 
  me, i: Integer;
begin
  if First then
  begin
    First := False;
    {kl        SichtbareSpalten1.Visible := False;
    Layoutspeichern1.Visible := False;
    }
    SuchGrid.RowColor1 := DM1.C2Color;
    SuchGrid.EditColor := DM1.EditColor;
    dm1.GridLoadLayout(tDBGrid(SuchGrid), 'VERTRETER_LISTE');
    // letztes Tabsheet wiederherstellen
    me := DM1.ReadIntegerU('', 'VERTRETER_TABSHEET', -1);
    if (me >= 0) and (me < Main_PC.PageCount) then
      Main_PC.ActivePage := Main_PC.Pages[me]
    else 
      Main_PC.ActivePage := Allg_TS;

    Limit := DM1.ReadIntegerU('', 'VERTRETER_TREFFER', 50);
    case Limit of
      10: N101.Checked := True;
      50: N501.Checked := True;
      100: N1001.Checked := True;
      200: N2001.Checked := True;
      500: N5001.Checked := True;
      999999999: alle1.Checked := True;
    end;

    SortField := DM1.ReadStringU  ('', 'VERTRETER_SORTFELD', 'NAME');
    SortName  := DM1.ReadStringU  ('', 'VERTRETER_SORTNAME', 'Name');

    Vert_TabUMSATZ.DisplayFormat    := ',#0.00" ' + DM1.LeitWaehrung + '"';
    Vert_TabPROVISION.DisplayFormat := ',#0.00" ' + DM1.LeitWaehrung + '"';

    for i := 0 to SuchGrid.Columns.Count-1 do
    begin
      if SuchGrid.Columns[i].Field.DisplayLabel = SortName then 
        SuchGrid.Columns[i].Title.Font.Style := [fsBold]
      else 
        SuchGrid.Columns[i].Title.Font.Style := [];
    end;
  end;
  Main_PCChange (Self);
  UpdateQuery;
end;    

//------------------------------------------------------------------------------
procedure TVertreterForm.FormDeactivate(Sender: TObject);
begin
  if (Vert_Tab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg ('Der aktuelle Vertreter wurde verändert,' + #13#10 +
         'wollen Sie die Änderung speichern ?',
         mtconfirmation, [mbYes, mbNo], 0) = mryes then 
      Vert_Tab.Post
    else 
      Vert_Tab.Cancel;
  end;

  DM1.WriteIntegerU ('', 'VERTRETER_TABSHEET', Main_PC.ActivePageIndex);
  DM1.WriteStringU  ('', 'VERTRETER_SORTFELD', SortField);
  DM1.WriteStringU  ('', 'VERTRETER_SORTNAME', SortName);

  if (not (MainPanel.Parent is tForm)) and
     (MainPanel.Parent.Parent is tForm) and
     (assigned(tForm(MainPanel.Parent.Parent).ActiveControl)) then 
    tDBEdit(tForm(MainPanel.Parent.Parent).ActiveControl).Color := clWindow;

  Vert_Tab.Close;
  // globale Vertretertabelle aktualisieren
  if DM1.VertreterTab.Active then 
    DM1.VertreterTab.Close;
  DM1.VertreterTab.Open;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    if Vert_Tab.RecordCount = 0 then 
      Datensatz := 'keine'
    else
    if Vert_Tab.RecordCount = Limit then 
      Datensatz := inttostr (Vert_Tab.RecNo) + ' von >=' + inttostr (Vert_Tab.RecordCount)
    else 
      Datensatz := inttostr (Vert_Tab.RecNo) + ' von ' + inttostr (Vert_Tab.RecordCount);

    Sortierung := 'Sortierung : ' + sortname;

    if (Vert_Tab.active) and (Vert_Tab.recordcount > 0) then
    begin
      Erstellt  := 'Erstellt:' + formatdatetime ('dd.mm.yyyy', Vert_TabErstellt.Value);
      if Vert_TabGeaend.Value > 1 then 
        Geaendert := 'Geändert:' + formatdatetime ('dd.mm.yyyy', Vert_TabGeaend.Value)
      else 
        Geaendert := '-';
    end else
    begin
      Erstellt  := '';
      Geaendert := '';
    end;

    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' Sek.';
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end;
end;    

//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabAfterPost(DataSet: TDataSet);
begin
  Vert_TabAfterScroll(DataSet);
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabBeforePost(DataSet: TDataSet);
begin
  if Vert_TabERSTELLT.AsDateTime = 0 then
  begin
    Vert_TabERSTELLT.AsDateTime    := Now;
    Vert_TabERSTELLT_NAME.AsString := DM1.View_User;
  end else
  begin
    Vert_TabGEAEND.AsDateTime    := Now;
    Vert_TabGEAEND_NAME.AsString := DM1.View_User;
  end;

  if length(Vert_TabLand.AsString) = 0 then 
    Vert_TabLand.AsString := DM1.LandK2;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.SuchGridDblClick(Sender: TObject);
begin
  Main_PC.ActivePage := Allg_TS;
  Main_PCChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnClick(Sender: TObject);
begin
  if (Sender is tMenuItem) then 
    Main_PC.ActivePage := Main_PC.Pages[TMenuitem(sender).Tag-1]
  else
    Main_PC.ActivePage := Main_PC.Pages[TJvSpeedButton(sender).Tag-1];
  Main_PCChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.UpdateQuery;
var 
  LastTime: DWord;
begin
  LastTime := GetTickCount;

  if vert_tab.active then 
    vert_tab.close;
  vert_tab.sql.clear;
  vert_tab.SQL.Add ('select * from VERTRETER');
  vert_tab.SQL.Add ('order by ' + SortField);
  vert_tab.SQL.Add ('LIMIT 0,' + Inttostr(limit));
  Screen.Cursor := crSQLWait;
  try
    vert_tab.Open;
  finally
    Screen.Cursor := crDefault;
  end;
  QueryTime := GetTickCount - LastTime;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.SuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  i: Integer;
begin
  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if SuchGrid.Columns[i].Field.DisplayLabel = Field.DisplayLabel then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];
  end;

  if SearchField <> Field.FieldName then
  begin
    SearchField := uppercase(Field.FieldName);
    SortField   := Searchfield;
    SortName    := Field.DisplayLabel;
    UpdateQuery;
  end else
  begin
    SearchField := SearchField + ' DESC';
    SortField   := Searchfield;
    SortName    := Field.DisplayLabel;
    UpdateQuery;
  end;
end;  

//------------------------------------------------------------------------------
procedure TVertreterForm.SortierungClick(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 4) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;                              

//------------------------------------------------------------------------------
procedure TVertreterForm.SetSort (Sort: Integer);
var 
  I: Integer;
begin
  if sort = aktsort then 
    exit;
  if sort < 0 then 
    sort := aktsort;
  case sort of
    {Name}     
    1: begin 
      sortname :='Name';    
      SortField :='NAME,VNAME';   
    end;
    {Ort}      
    2: begin 
      sortname :='Ort';     
      SortField :='ORT,NAME'; 
    end;
    {Nummer}   
    3: begin 
      sortname :='Nummer';  
      SortField :='VERTR_NUMMER'; 
    end;
  end;
  UpdateStatus;
  AktSort := Sort;

  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if SuchGrid.Columns[i].Field.DisplayLabel = SortName
    then SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else SuchGrid.Columns[i].Title.Font.Style := [];
  end;

  if not first then UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Aktualisieren1Click(Sender: TObject);
begin
  Vert_Tab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Main_PCChange(Sender: TObject);
begin
  try
    if (VERT_DS.State = dsEdit) or (VERT_DS.State = dsInsert) then 
      VERT_tab.Post;
  except 
  end;

  SichtbareSpalten1.Enabled := Main_PC.ActivePage = Such_TS;

  AllgBtn.Font.Style := [];
  ProBtn.Font.Style := [];
  Liste_Btn.Font.Style := [];
  ListeBtn.Font.Style := [];

  case Main_PC.ActivePageIndex of
    0: begin
      AllgBtn.Font.Style  := [fsBold];
      Allgemein1.Checked := True;
      VeNumEdi.SetFocus;
    end;
    1: begin
      ProBtn.Font.Style   := [fsBold];
      Provision1.Checked := True;
      ProvArtEdi.SetFocus;
    end;
    //kl       2: begin Liste_Btn.Font.Style   :=[fsBold];  Ansprechpartner1.Checked :=True; end;
    3: begin
      ListeBtn.Font.Style := [fsBold];
      Liste1.Checked := True;
      SuchGrid.SetFocus;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TVertreterForm.TrefferClick(Sender: TObject);
begin
  Limit := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
  DM1.WriteIntegerU ('', 'VERTRETER_TREFFER', Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(SuchGrid), 'VERTRETER_LISTE');
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Loeschen1Click(Sender: TObject);
begin
  if MessageDlg ('Wollen Sie diesen Vertreter wirklich löschen ?',
       mtconfirmation, mbyesnocancel, 0) = mryes then 
    Vert_Tab.Delete;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Neu1Click(Sender: TObject);
begin
  Vert_Tab.Append;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(SuchGrid));
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Vert_TabBeforeInsert(DataSet: TDataSet);
begin
  try
    if not Main_PC.Enabled then 
      Main_PC.Enabled := True;
    Main_PC.ActivePage := Allg_TS;
    Main_PCChange (Self);
    VeNumEdi.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.SuchBegChange(Sender: TObject);
var 
  v: variant;
begin
  if (Vert_Tab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg ('Der aktuelle Vertreter wurde verändert,' + #13#10 +
         'wollen Sie die Änderung speichern ?',
         mtconfirmation, [mbYes, mbNo], 0) = mryes then 
      Vert_Tab.Post
    else 
      Vert_Tab.Cancel;
  end;
  v := suchbeg.text;
  //kl     UpdateQuery (copy(suchbegr.text,1,4));
  Vert_tab.Locate (SearchField, V, [loCaseInsensitive, loPartialKey]);

  //kl     searchtime :=15;
  //kl     searchtimer.enabled :=true;
end;  

//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and
     (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.ListeBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.Suchen1Click(Sender: TObject);
begin
  try
    //kl    Main_PC.ActivePage :=Main_PC.Pages[3];
    SuchBeg.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.BlZEdiButtonClick(Sender: TObject);
var 
  sblz, sbank: string;
begin
  if not Vert_Tab.Active then 
    exit;
  SBLZ  := BLZEdi.Text;
  SBank := BankNameEdi.Text;
  if BLZForm.Get(tControl(Sender).Tag, SBLZ, SBank) then
  begin
    if not (Vert_Tab.State in [dsEdit, dsInsert]) then 
      Vert_Tab.Edit;

    Vert_TabBLZ.Value   := SBLZ;
    Vert_TabBank.Value  := SBank;
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.BlZEdiExit(Sender: TObject);
var 
  sblz, sbank: string;
begin
  tDBEdit(sender).Color := clWindow;
  SBLZ  := Vert_TabBLZ.Value;
  SBank := Vert_TabBank.Value;
  if BLZForm.GetDataIfUniqueBLZ (SBLZ, SBank) then
  begin
    Vert_TabBLZ.Value   := SBLZ;
    Vert_TabBank.Value  := SBank;
  end;
  VeNumEdiExit(Sender);
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.SuchBegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if Main_PC.ActivePage = Allg_TS then 
      VeNameEdi.SetFocus 
    else
    if Main_PC.ActivePage = Such_TS then 
      SuchGrid.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiEnter(Sender: TObject);
begin
  tDBEdit(sender).Color := DM1.EditColor;;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiExit(Sender: TObject);
begin
  tDBEdit(sender).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    Vert_Tab.Prior;
    key := 0;
  end else
  if (Shift = []) and (key = 34) then // PGDOWN
  begin
    Vert_Tab.Next;
    key := 0;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'MABEMERKUNG') and
     (Shift = [ssCtrl]) then
  begin
    MaBemerkung.SelText := #9;
    key := 0;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'MABEMERKUNG') and
     (Shift = [ssShift]) then
  begin
    VeEmailEdi.setfocus;
    key := 0;
  end else
  if (key = 9) and
     (uppercase(tControl(Sender).Name) = 'MABEMERKUNG') and
     (Shift = []) then
  begin
    VeNumEdi.setfocus;
    key := 0;
  end;
end;                                                    

//------------------------------------------------------------------------------
procedure TVertreterForm.VeNumEdiKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    try
      if (uppercase(tControl(Sender).Name) = 'MABEMERKUNG') then 
        VeNumEdi.SetFocus
      else
      if (uppercase(tControl(Sender).Name) = 'BANKNAMEEDI') then 
        ProvArtEdi.SetFocus
      else    
      begin
        if MainPanel.Parent is tForm then 
          SendMessage (MainPanel.Parent.Handle, WM_NEXTDLGCTL, 0, 0)
        else 
          SendMessage (MainPanel.Parent.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    except 
    end;
  end;
end;

//------------------------------------------------------------------------------

end.

{ SQL-Auswertungen :

select
JOURNAL.REC_ID, JOURNAL.VRENUM,JOURNAL.RDATUM, JOURNAL.STADIUM, JOURNAL.WARE, JOURNAL.LOHN, JOURNAL.TKOST, JOURNAL.NSUMME, JOURNAL.VERTRETER_ID, JOURNAL.PROVIS_BERECHNET, JOURNAL.PROVIS_WERT, JOURNAL.BRUTTO_FLAG,
SUM(JOURNALPOS.E_RGEWINN * JOURNALPOS.MENGE) as ROHGEWINN
from JOURNAL
left outer join JOURNALPOS on JOURNALPOS.JOURNAL_ID=JOURNAL.REC_ID
where JOURNAL.QUELLE=3 and JOURNAL.VERTRETER_ID>0
group BY JOURNALPOS.JOURNAL_ID

select VRENUM, ARTIKELTYP, MENGE, EPREIS, E_RGEWINN, PROVIS_PROZ, PROVIS_WERT, GEBUCHT, BRUTTO_FLAG
from JOURNALPOS
where QUELLE=3
order by VRENUM, POSITION

}

