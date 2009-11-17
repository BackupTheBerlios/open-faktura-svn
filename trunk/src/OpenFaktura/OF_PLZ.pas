{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Postleitzahlen (PLZ)                                       }
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
{ 09.05.2003 - Unit zum GNU-Source hinzugefügt }
{ 15.06.2003 - Umwandlung in Grußbuchstaben bei der Suche entfernt, dadurch }
{              großer Geschwindigkeitsgewinn }
{ 09.11.2003 - Default-Vorgabe für Land bei neuen Datensetzen erstellt }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 27.10.2004 - KL Suchen SQL geändert Timer hinzugefügt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_PLZ;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, StdCtrls,
  ComCtrls, DBCtrls, ToolWin,
  OF_Var_Const, JvMenus;

type
  TPLZForm = class(TForm)
    PLZ_DS: TDataSource;
    PLZPanel: TPanel;
    SB: TStatusBar;
    ToolBar1: TToolBar;
    SuchGrid: TOFDBGrid;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Suchbeg: TEdit;
    Label25: TLabel;
    PLZQuery: TZQuery;
    PLZQueryPLZ: TStringField;
    PLZQueryNAME: TStringField;
    PLZQueryVORWAHL: TStringField;
    PLZQueryLAND: TStringField;
    PLZQueryBUNDESLAND: TStringField;
    UebernBtn: TToolButton;
    SearchTimer: TTimer;
    MainMenu1: TJvMainMenu;
    Neu1: TMenuItem;
    MnuNew: TMenuItem;
    MnuDele: TMenuItem;
    N1: TMenuItem;
    MnuSearch: TMenuItem;
    Sortierung1: TMenuItem;
    MnuSortPLZ: TMenuItem;
    MnuSortName: TMenuItem;
    MnuSortVorwahl: TMenuItem;
    N2: TMenuItem;
    MnuUebernehmen: TMenuItem;
    procedure SuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure PLZ_DSDataChange(Sender: TObject; Field: TField);
    procedure SuchGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SuchbegChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SuchGridCheckButton(Sender: TObject; ACol: Integer;
    Field: TField; var Enabled: Boolean);
    procedure PLZQueryNewRecord(DataSet: TDataSet);
    procedure SearchTimerTimer(Sender: TObject);
    procedure MnuSearchClick(Sender: TObject);
    procedure MnuNewClick(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure MnuDeleClick(Sender: TObject);
    procedure SuchGridKeyPress(Sender: TObject; var Key: Char);
    procedure SuchbegKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
    searchtime : Integer;
    SortField,
    SearchField,
    SortName  : String;
    SuchBegr  : String;
    aktsort    : integer;
    
    QueryTime : Integer;
    Limit      : Integer;
    InClose   : Boolean;
    exitcode  : Byte;
    
    ResPLZ    : String;
    ResOrt    : String;
    ResVorwahl: String;
    
    SearchData: String;
    
    procedure SetSort (Sort: Integer);
    procedure UpdateQuery (SuchStr: String);
    procedure UpdateStatus;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    Land      : string;
    First: Boolean;
    OnUpdateStatusBar: TOnUpdateStatusBar;
    
    function Get (Index: Integer; var Land, PLZ, Ort, Vorwahl: string): boolean;
    function GetDataIfUniquePLZ (var Land, PLZ, Ort, Vorwahl: string): Boolean;
  end;
    
var
  PLZForm: TPLZForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Main;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TPLZForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent (self);
  except
  end;

  OnUpdateStatusBar := nil;
  //Scaled :=True;
  SearchData := '';
  //ScaleBy (Screen.Width,800);

  SortName    := _('Plz');

  SortField   := 'PLZ';
  SearchField := 'PLZ';

  Land        := 'DE';

  MnuUebernehmen.Visible := False;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.FormActivate(Sender: TObject);
var 
  i: Integer;
begin
  SB.Visible := not assigned (OnUpdateStatusBar);
  if SB.Visible then 
    SB.Top := Height;

  SuchGrid.RowColor1 := DM1.C2Color;
  SuchGrid.EditColor := DM1.EditColor;
  InClose := False;
  UpdateQuery (SearchData);
  SearchData := '';
  for i := 0 to SuchGrid.Columns.Count-1 do
    if uppercase(SuchGrid.Columns[i].FieldName) = uppercase(SearchField) then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];

  if SearchField = 'PLZ' then 
    MnuSortPLZ.Checked := True
  else
  if SearchField = 'NAME' then 
    MnuSortName.Checked := True
  else 
    MnuSortVorwahl.Checked := True;

  Suchbeg.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.FormDeactivate(Sender: TObject);
begin
  UebernBtn.Visible := False;
  InClose := True;
  SuchBeg.Text := '';
  InClose := False;
  PLZQuery.Close;
  SearchData := '';
end;

//------------------------------------------------------------------------------
procedure TPLZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 460;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 300;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
function TPLZForm.GetDataIfUniquePLZ (var Land, PLZ, Ort, Vorwahl: string): Boolean;
begin
  Result := False;
  if (length(Land) = 0) or (length(PLZ) = 0) then 
    exit;

  PLZQuery.Close;
  PLZQuery.SQL.Clear;
  PLZQuery.SQL.Add ('SELECT LAND, PLZ, NAME, VORWAHL, BUNDESLAND');
  PLZQuery.SQL.Add ('FROM PLZ WHERE LAND="' + Land + '"');
  PLZQuery.SQL.Add (' and PLZ="' + PLZ + '"');
  PLZQuery.SQL.Add ('LIMIT 0,2');
  PLZQuery.Open;
  if PLZQuery.RecordCount = 1 then
  begin
    Ort     := PLZQueryNAME.AsString;
    Vorwahl := PLZQueryVORWAHL.AsString;
    Result  := True;
  end;
  PLZQuery.Close;
end;                       

//------------------------------------------------------------------------------
function TPLZForm.Get (Index: Integer; var Land, PLZ, Ort, Vorwahl: string): Boolean;
var 
  V: Variant; 
  NewSortField, NewSearchField: String;
begin
  exitcode := 0;
  //PLZQuery.Refresh;
  //SuchGrid.Invalidate;

  ResPLZ     := '';
  ResOrt     := '';
  ResVorwahl := '';

  Self.Land := Land;

  Result := False;
  case index of
    0: begin 
      SortName := _('Plz');     
      NewSortField := 'LAND,PLZ,NAME'; 
      NewSearchField := 'PLZ'; 
      v := copy (PLZ, 1, 5);     
    end;
    2: begin 
      SortName := _('Ort');     
      NewSortField := 'LAND,NAME';     
      NewSearchField := 'NAME'; 
      v := copy (Ort, 1, 20);     
    end;
    3: begin 
      SortName := _('Vorwahl'); 
      NewSortField := 'LAND,VORWAHL';  
      NewSearchField := 'VORWAHL'; 
      v := copy (Vorwahl, 1, 6); 
    end;
  end;

  SearchData := V;
  SortField := NewSortField;
  SearchField := NewSearchField;

  UebernBtn.Visible       := True;
  MnuUebernehmen.Visible  := True;
  MnuUebernehmen.ShortCut := TextToShortCut('F12');

  ShowModal;

  MnuUebernehmen.ShortCut := TextToShortCut('');
  MnuUebernehmen.Visible  := False;
  UebernBtn.Visible       := False;

  if exitcode = 1 then
  begin
    result  := true;
    PLZ     := ResPLZ;
    Ort     := ResOrt;
    Vorwahl := ResVorwahl;
  end;
  PLZQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.UpdateQuery (SuchStr: String);
var 
  LastTime: DWord;
begin
  LastTime := GetTickCount;

  PLZQuery.Close;
  PLZQuery.SQL.Clear;
  PLZQuery.SQL.Add ('SELECT LAND, PLZ, NAME, VORWAHL, BUNDESLAND');
  PLZQuery.SQL.Add ('FROM PLZ WHERE LAND="' + Land + '"');
  if length(SuchStr) > 0 then
  begin
    PLZQuery.SQL.Add ('AND ');
    PLZQuery.SQL.Add ('(' + DM1.GetSearchSQL ([SEARCHFIELD], SuchStr) + ')');
  end;
  PLZQuery.SQL.Add ('ORDER BY ' + sortfield + ' LIMIT 0,100');
  try
    PLZQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
  QueryTime := GetTickCount - LastTime;
end;                   

//------------------------------------------------------------------------------
procedure TPLZForm.SuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  i: Integer;
begin
  for i := 0 to SuchGrid.Columns.Count-1 do
    if SuchGrid.Columns[i].FieldName = Field.FieldName then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];

  if uppercase(SearchField) <> uppercase(Field.FieldName) then
  begin
    SearchField := uppercase(Field.FieldName);
    SortField := 'LAND, ' + Searchfield;
    SortName  := Field.DisplayLabel;
    UpdateQuery ('');
  end;
end;  

//------------------------------------------------------------------------------
procedure TPLZForm.PLZ_DSDataChange(Sender: TObject; Field: TField);
var 
  SuchZeit, Datensatz: String;
begin
  if SB.Visible then
  begin
    SB.Panels[1].Text := inttostr(PLZQuery.RecNo) + ' : ' +
    inttostr(PLZQuery.RecordCount);
  end else
  begin
    Datensatz  := inttostr(PLZQuery.RecNo) + ' : ' +
    inttostr(PLZQuery.RecordCount);

    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');

    if assigned (OnUpdateStatusBar) then 
      OnUpdateStatusBar (Suchzeit, Datensatz, _('Sortierung : ') + SortName, '', '');
  end;
end;                              

//------------------------------------------------------------------------------
procedure TPLZForm.SuchGridDblClick(Sender: TObject);
begin
  exitcode := 1;
  ResPLZ     := PLZQueryPLZ.AsString;
  ResOrt     := PLZQueryName.AsString;
  ResVorwahl := PLZQueryVorwahl.AsString;
  Close;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.SuchbegChange(Sender: TObject);
begin
  if InClose then 
    exit;
  searchtime := 15;
  searchtimer.enabled := true;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.SuchGridCheckButton(Sender: TObject; ACol: Integer; Field: TField; var Enabled: Boolean);
var 
  S: String;
begin
  S := Uppercase (Field.FieldName);
  Enabled := (S = 'PLZ') or (S = 'NAME') or (S = 'VORWAHL');
end;                                        

//------------------------------------------------------------------------------
procedure TPLZForm.PLZQueryNewRecord(DataSet: TDataSet);
begin
  PLZQueryLAND.AsString := DM1.LandK2;
end;
//------------------------------------------------------------------------------
procedure TPLZForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then 
    exit;
  if searchtime > 0 then 
    dec (searchtime) 
  else
  begin
    searchtimer.enabled := false;
    SuchBegr := Suchbeg.Text;

    // führende Leerzeichen entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[1] = ' ') do 
      delete (Suchbegr, 1, 1);
    // Leerzeichen am ende Entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[length(Suchbegr)] = ' ') do 
      delete (Suchbegr, length(SuchBegr), 1);

    UpdateQuery (SuchBegr);
  end;
end;  

//------------------------------------------------------------------------------
procedure TPLZForm.MnuSearchClick(Sender: TObject);
begin
  try
    SuchBeg.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.MnuNewClick(Sender: TObject);
begin
  PLZQuery.Append;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.MnuDeleClick(Sender: TObject);
begin
  if MessageDlg ('Wollen Sie diese Postleitzahl wirklich löschen ?', 
       mtconfirmation, mbyesnocancel, 0) = mryes then 
    PLZQuery.Delete;
end;                

//------------------------------------------------------------------------------
procedure TPLZForm.SortierungClick(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 4) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;                                                             

//------------------------------------------------------------------------------
procedure TPLZForm.SetSort (Sort: Integer);
var 
  i: Integer;
begin
  if sort = aktsort then 
    exit;
  if sort < 0 then 
    sort := aktsort;
  case sort of
    {PLZ}  
    1: begin 
      sortname :='PLZ';     
      SortField :='PLZ';      
    end;
    {Ort}  
    2: begin 
      sortname :='Ort';     
      SortField :='NAME,PLZ'; 
    end;
    3: begin 
      sortname := 'Vorwahl'; 
      SortField := 'VORWAHL';  
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
    UpdateQuery('');
end;

//------------------------------------------------------------------------------
procedure TPLZForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    if PLZQuery.RecordCount = 0 then 
      Datensatz := 'keine'
    else
    if PLZQuery.RecordCount = Limit then 
      Datensatz := inttostr (PLZQuery.RecNo) + ' von >=' + inttostr (PLZQuery.RecordCount)
    else 
      Datensatz := inttostr (PLZQuery.RecNo) + ' von ' + inttostr (PLZQuery.RecordCount);

    Sortierung := 'Sortierung : ' + sortname;

    {        if (PLZQuery.active)and(PLZQuery.recordcount>0) then
    begin
    Erstellt  :='Erstellt:'+formatdatetime ('dd.mm.yyyy',PLZQueryErstellt.Value);
    if PLZQueryGeaend.Value>1
    then Geaendert :='Geändert:'+
    formatdatetime ('dd.mm.yyyy',PLZQueryGeaend.Value)
    else Geaendert :='-';
    end
    else
    begin
    Erstellt  :='';
    Geaendert :='';
    end;
    }
    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' Sek.';
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end;
end;                                                    

//------------------------------------------------------------------------------
procedure TPLZForm.SuchGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    Key := #0;
    exitcode := 1;
    Close;
  end else
  if Key = #13 then
  begin
    Key := #0;
    if PLZQuery.State in [dSBrowse] then 
      SuchGridDblClick (Self);
  end;
end;

//------------------------------------------------------------------------------
procedure TPLZForm.SuchbegKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    Key := #0;
    exitcode := 1;
    Close;
  end else
  if Key = #13 then
  begin
    Key := #0;
    SuchGrid.SetFocus;
  end;
end;

//------------------------------------------------------------------------------

end.

