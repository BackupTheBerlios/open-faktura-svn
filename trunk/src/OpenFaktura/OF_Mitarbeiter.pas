{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Mitarbeiter erstellen, löschen u. bearbeiten                      }
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
{ 16.08.2003 - JP Unit erstellt }
{ 23.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 04.12.2004 - Initiales Mitarbeiterpaßwort bei Neuanlage wird jetzt gesetzt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Mitarbeiter;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, StdCtrls, DBCtrls,
  Mask, OFGroupBox, ComCtrls, JvExComCtrls, JvComCtrls, ToolWin,
  JvExControls, JvComponent, JvSpeedButton, ExtCtrls,
  OF_Var_Const, JvMenus, OFSecurity;

  //CaoSecurity,

type
  TMitarbeiterForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    MainTopLab: TLabel;
    ButtonPan: TPanel;
    AuswahlBtn: TJvSpeedButton;
    AllgBtn: TJvSpeedButton;
    PositionenBtn: TJvSpeedButton;
    ListeBtn: TJvSpeedButton;
    Mita_Tab: TOFZQuery;
    Mita_TabLOGIN_NAME: TStringField;
    Mita_TabANZEIGE_NAME: TStringField;
    KunToolbar: TToolBar;
    DBNavigator3: TDBNavigator;
    Label35: TLabel;
    SuchBeg: TEdit;
    ToolButton6: TToolButton;
    UebernahmeBtn: TToolButton;
    Mita_DS: TDataSource;
    Mita_TabMA_NUMMER: TStringField;
    Mita_TabNAME: TStringField;
    Mita_TabVNAME: TStringField;
    Mita_TabANREDE: TStringField;
    Mita_TabTITEL: TStringField;
    Mita_TabZUSATZ: TStringField;
    Mita_TabZUSATZ2: TStringField;
    Mita_TabZUHAENDEN: TStringField;
    Mita_TabSTRASSE: TStringField;
    Mita_TabLAND: TStringField;
    Mita_TabPLZ: TStringField;
    Mita_TabORT: TStringField;
    Mita_TabTELEFON: TStringField;
    Mita_TabFAX: TStringField;
    Mita_TabFUNK: TStringField;
    Mita_TabEMAIL: TStringField;
    Mita_TabINTERNET: TStringField;
    Mita_TabSPRACH_ID: TIntegerField;
    Mita_TabBESCHAEFTIGUNGSART: TIntegerField;
    Mita_TabBESCHAEFTIGUNGSGRAD: TIntegerField;
    Mita_TabJAHRESURLAUB: TFloatField;
    Mita_TabGUELTIG_VON: TDateTimeField;
    Mita_TabGUELTIG_BIS: TDateTimeField;
    Mita_TabGEBDATUM: TDateTimeField;
    Mita_TabGESCHLECHT: TStringField;
    Mita_TabFAMSTAND: TIntegerField;
    Mita_TabBANK: TStringField;
    Mita_TabBLZ: TStringField;
    Mita_TabKTO: TStringField;
    Mita_TabBEMERKUNG: TMemoField;
    Mita_TabERSTELLT: TDateTimeField;
    Mita_TabERSTELLT_NAME: TStringField;
    Mita_TabGEAEND: TDateTimeField;
    Mita_TabGEAEND_NAME: TStringField;
    Main_PC: TJvPageControl;
    Allg_TS: TTabSheet;
    Such_TS: TTabSheet;
    Panel1: TPanel;
    KommunikationGB: TOFGroupBox;
    AllgemeinGB: TOFGroupBox;
    BemerkungGB: TOFGroupBox;
    MaBemerkung: TDBMemo;
    MaNumEdi: TDBEdit;
    MaLoginEdi: TDBEdit;
    MaAnzeigeEdi: TDBEdit;
    MaNameEdi: TDBEdit;
    MaVNameEdi: TDBEdit;
    MaStrasseEdi: TDBEdit;
    MaOrtEdi: TDBEdit;
    Label56: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaPLZEdi: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MaFunkEdi: TDBEdit;
    MaFaxEdi: TDBEdit;
    MaTelEdi: TDBEdit;
    Label10: TLabel;
    MaEmailEdi: TDBEdit;
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
    MANummer: TMenuItem;
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
    SuchGrid: TOFDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Mita_TabUSER_PASSWORD: TStringField;
    Mita_TabMA_ID: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Mita_TabAfterPost(DataSet: TDataSet);
    procedure Mita_TabAfterScroll(DataSet: TDataSet);
    procedure Mita_TabBeforePost(DataSet: TDataSet);
    procedure AnsichtAuswahlClick(Sender: TObject);
    procedure SuchGridDblClick(Sender: TObject);
    procedure SuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure Main_PCChange(Sender: TObject);
    procedure TrefferClick(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
    procedure Neu1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure Mita_TabBeforeInsert(DataSet: TDataSet);
    procedure SuchBegChange(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure Mita_TabBeforeDelete(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    
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
  MitarbeiterForm: TMitarbeiterForm;
  
implementation

uses
  GNUGetText,
  OF_Main, OF_DM, OF_DBGrid_Layout, OF_Progress;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.FormCreate(Sender: TObject);
var 
  I: Integer;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  First := True;
  Limit := 50;
  SortName    := _('Name');
  SortField   := 'NAME';
  SearchField := 'NAME';

  ListeBtn.Align := alRight;
  AllgBtn.Align  := alRight;

  OnUpdateStatusBar := nil;
  for i := 0 to Main_PC.PageCount-1 do 
    Main_PC.Pages[i].TabVisible := False;
  Main_PC.ActivePage := Main_PC.Pages[0];
  SetSort (1);
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.FormActivate(Sender: TObject);
var 
  me, I: Integer;
begin
  if First then
  begin
    First := False;
    {kl        SichtbareSpalten1.Visible := False;
    Layoutspeichern1.Visible := False;
    }       
    SuchGrid.RowColor1 := DM1.C2Color;
    SuchGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout(tDBGrid(SuchGrid), 'MITARBEITER_LISTE');
    // letztes Tabsheet wiederherstellen
    me := DM1.ReadIntegerU('', 'MITARBEITER_TABSHEET', -1);
    if (me >= 0) and (me < Main_PC.PageCount) then 
      Main_PC.ActivePage := Main_PC.Pages[me]
    else 
      Main_PC.ActivePage := Allg_TS;

    Limit := DM1.ReadIntegerU('', 'MITARBEITER_TREFFER', 50);
    case Limit of
      10: N101.Checked := True;
      50: N501.Checked := True;
      100: N1001.Checked := True;
      200: N2001.Checked := True;
      500: N5001.Checked := True;
      999999999: alle1.Checked := True;
    end;

    SortField := DM1.ReadStringU('', 'MITARBEITER_SORTFELD', 'NAME');
    SortName  := DM1.ReadStringU('', 'MITARBEITER_SORTNAME', 'Name');

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
procedure TMitarbeiterForm.FormDeactivate(Sender: TObject);
begin
  if (Mita_Tab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg (_('Der aktuelle Mitarbeiter wurde verändert,' + #13#10 +
       'wollen Sie die Änderung speichern ?'),
       mtconfirmation, [mbYes, mbNo], 0) = mryes then 
      Mita_Tab.Post
    else 
      Mita_Tab.Cancel;
  end;

  DM1.WriteIntegerU('', 'MITARBEITER_TABSHEET', Main_PC.ActivePageIndex);
  DM1.WriteStringU  ('', 'MITARBEITER_SORTFELD', SortField);
  DM1.WriteStringU  ('', 'MITARBEITER_SORTNAME', SortName);

  if (not (MainPanel.Parent is tForm)) and (MainPanel.Parent.Parent is tForm) and
     (assigned(tForm(MainPanel.Parent.Parent).ActiveControl)) then 
    tDBEdit(tForm(MainPanel.Parent.Parent).ActiveControl).Color := clWindow;

  Mita_Tab.Close;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    if Mita_Tab.RecordCount = 0 then 
      Datensatz := _('keine')
    else
    if Mita_Tab.RecordCount = Limit then 
      Datensatz := inttostr (Mita_Tab.RecNo) + ' ' + _('von') + ' >=' + inttostr (Mita_Tab.RecordCount)
    else 
      Datensatz := inttostr (Mita_Tab.RecNo) + ' ' + _('von') + ' ' + inttostr (Mita_Tab.RecordCount);

    Sortierung := _('Sortierung : ') + sortname;

    if (Mita_Tab.active) and (Mita_Tab.recordcount > 0) then
    begin
      Erstellt  := _('Erstellt:') + formatdatetime ('dd.mm.yyyy', Mita_TabErstellt.Value);
      if Mita_TabGeaend.Value > 1 then 
        Geaendert := _('Geändert:') + formatdatetime ('dd.mm.yyyy', Mita_TabGeaend.Value)
      else 
        Geaendert := '-';
    end else
    begin
      Erstellt  := '';
      Geaendert := '';
    end;

    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end;
end;   

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabAfterPost(DataSet: TDataSet);
begin
  Mita_TabAfterScroll(DataSet);
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabBeforePost(DataSet: TDataSet);
begin
  if Mita_TabERSTELLT.AsDateTime = 0 then
  begin
    Mita_TabERSTELLT.AsDateTime    := Now;
    Mita_TabERSTELLT_NAME.AsString := DM1.View_User;
  end else
  begin
    Mita_TabGEAEND.AsDateTime    := Now;
    Mita_TabGEAEND_NAME.AsString := DM1.View_User;
  end;

  if Mita_Tab.State = dsInsert then
  begin
    Mita_TabUSER_PASSWORD.AsString := '7dde970410241b5241717ea841a82fc8'; // md5('sysdba';
    MessageDlg (_('Das Kennwort des neuen Mitarbeiters ist "sysdba".'), mtinformation, [mbok], 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SuchGridDblClick(Sender: TObject);
begin
  Main_PC.ActivePage := Allg_TS;
  Main_PCChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.AnsichtAuswahlClick(Sender: TObject);
begin
  if (Sender is tMenuItem) then 
    Main_PC.ActivePage := Main_PC.Pages[tMenuitem(sender).Tag-1]
  else 
    Main_PC.ActivePage := Main_PC.Pages[TJvSpeedButton(sender).Tag-1];
  Main_PCChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.UpdateQuery;
var 
  LastTime: DWord;
begin
  LastTime := GetTickCount;

  if Mita_Tab.active then 
    Mita_Tab.close;
  Mita_Tab.sql.clear;
  Mita_Tab.SQL.Add ('select * from MITARBEITER');
  Mita_Tab.SQL.Add ('order by ' + SortField);
  Mita_tab.SQL.Add ('LIMIT 0,' + Inttostr(limit));
  Screen.Cursor := crSQLWait;
  try
    Mita_Tab.Open;
  finally
    Screen.Cursor := crDefault;
  end;
  QueryTime := GetTickCount - LastTime;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  i: Integer;
begin
  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if SuchGrid.Columns[i].Field.DisplayLabel = Field.DisplayLabel
    then SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else SuchGrid.Columns[i].Title.Font.Style := [];
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
procedure TMitarbeiterForm.SortierungClick(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 4) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;                                                            

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SetSort (Sort: Integer);
var 
  I: Integer;
begin
  if sort = aktsort then 
    exit;
  if sort < 0 then 
    sort := aktsort;
  case sort of
    {name}
    1: begin 
      sortname :=_('Name');    
      SortField :='NAME,VNAME'; 
    end;
    {plz}      
    2: begin 
      sortname :=_('Ort');     
      SortField :='ORT,NAME';   
    end;
    3: begin 
      sortname := _('MA-Nr.');  
      SortField := 'MA_NUMMER';  
    end;
  end;
  UpdateStatus;
  AktSort := Sort;

  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if SuchGrid.Columns[i].Field.DisplayLabel = SortName then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];
  end;

  if not first then 
    UpdateQuery;
end;  

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Aktualisieren1Click(Sender: TObject);
begin
  Mita_Tab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Main_PCChange(Sender: TObject);
begin
  try
    if (MITA_DS.State = dsEdit)or(MITA_DS.State = dsInsert) then 
      MITA_Tab.Post;
  except 
  end;

  SichtbareSpalten1.Enabled := Main_PC.ActivePage = Such_TS;

  AllgBtn.Font.Style := [];
  //kl     ProBtn.Font.Style :=[];
  //kl     Liste_Btn.Font.Style :=[];
  ListeBtn.Font.Style := [];

  case Main_PC.ActivePageIndex of
    0: begin
      AllgBtn.Font.Style  := [fsBold];
      Allgemein1.Checked := True;
      MaNumEdi.SetFocus;
    end;
    //       1: begin ProBtn.Font.Style   :=[fsBold]; Provision1.Checked :=True; end;
    //kl     2: begin Liste_Btn.Font.Style   :=[fsBold];  Ansprechpartner1.Checked :=True; end;
    3: begin
      ListeBtn.Font.Style := [fsBold];
      Liste1.Checked := True;
      SuchGrid.SetFocus;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.TrefferClick(Sender: TObject);
begin
  Limit := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
  DM1.WriteIntegerU('', 'MITARBEITER_TREFFER', Limit);
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(SuchGrid), 'MITARBEITER_LISTE');
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Loeschen1Click(Sender: TObject);
begin
  if MessageDlg (_('Wollen Sie diesen Mitarbeiter wirklich löschen ?'),  
       mtconfirmation, mbyesnocancel, 0) = mryes then 
    Mita_Tab.Delete;
end;                

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Neu1Click(Sender: TObject);
begin
  Mita_Tab.Append;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(SuchGrid));
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabBeforeInsert(DataSet: TDataSet);
begin
  try
    if not Main_PC.Enabled then 
      Main_PC.Enabled := True;
    Main_PC.ActivePage := Allg_TS;
    Main_PCChange (Self);
    MaNumEdi.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.SuchBegChange(Sender: TObject);
begin
  if (Mita_Tab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg (_('Der aktuelle Mitarbeiter wurde verändert,' + #13#10 +
        'wollen Sie die Änderung speichern ?'),
        mtconfirmation, [mbYes, mbNo], 0) = mryes then 
      Mita_Tab.Post
    else 
      Mita_Tab.Cancel;
  end;
end;  

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.ListeBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                               

//------------------------------------------------------------------------------
procedure TMitarbeiterForm.ListeBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;
//------------------------------------------------------------------------------
procedure TMitarbeiterForm.Mita_TabBeforeDelete(DataSet: TDataSet);
begin
  if Mita_TabMA_ID.AsInteger <= 1 then 
    abort; 
  exit;

  // Benutzerrechte in der Berechtigungstabelle löschen
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Text := 'DELETE FROM BENUTZERRECHTE WHERE USER_ID=' +
  IntToStr(Mita_TabMA_ID.AsInteger);
  DM1.UniQuery.ExecSql;
end;

//------------------------------------------------------------------------------

end.

