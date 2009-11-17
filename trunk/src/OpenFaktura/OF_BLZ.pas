{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Bankleitzahlen (BLZ)                                       }
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
{ 13.08.2003 - KL Unit zum GNU-Source hinzugefügt }
{ 05.11.2003 - JP Tabelle und SQL um Feld Land erweitert }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 27.10.2004 - KL Suchen SQL geändert }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_BLZ;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, Menus, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  StdCtrls, ComCtrls, DBCtrls, ToolWin, OF_Var_Const, JvMenus;

type
  TBLZForm = class(TForm)
    BLZ_DS: TDataSource;
    BLZPanel: TPanel;
    SB: TStatusBar;
    ToolBar1: TToolBar;
    SuchGrid: TOFDBGrid;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label25: TLabel;
    BLZQuery: TZQuery;
    UebernBtn: TToolButton;
    BLZQueryBLZ: TIntegerField;
    BLZQueryBANK_NAME: TStringField;
    BLZQueryLAND: TStringField;
    Suchbeg: TEdit;
    SearchTimer: TTimer;
    MainMenu1: TJvMainMenu;
    Neu1: TMenuItem;
    Neu2: TMenuItem;
    Loeschen1: TMenuItem;
    N1: TMenuItem;
    Suchen1: TMenuItem;
    Sortierung1: TMenuItem;
    BLZ1: TMenuItem;
    Name1: TMenuItem;
    procedure SuchGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure BLZ_DSDataChange(Sender: TObject; Field: TField);
    procedure SuchGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SuchbegChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SuchGridCheckButton(Sender: TObject; ACol: Integer;
    Field: TField; var Enabled: Boolean);
    procedure BLZQueryNewRecord(DataSet: TDataSet);
    procedure SearchTimerTimer(Sender: TObject);
    procedure Suchen1Click(Sender: TObject);
    procedure Neu2Click(Sender: TObject);
    procedure SortierungClick(Sender: TObject);
    procedure Loeschen1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    searchtime : Integer;
    SortField,
    SearchField,
    SortName  : String;
    SuchBegr  : String;
    aktsort    : integer;
    
    QueryTime : DWord;
    Limit      : Integer;
    InClose   : Boolean;
    exitcode  : Byte;
    
    ResBLZ    : String;
    ResBank   : String;
    
    SearchData: String;
    
    procedure SetSort (Sort: Integer);
    procedure UpdateQuery (SuchStr: String);
    procedure UpdateStatus;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    First: Boolean;
    OnUpdateStatusBar: TOnUpdateStatusBar;
    
    function Get (Index: Integer; var BLZ, BANK_NAME: string): boolean;
    function GetDataIfUniqueBLZ (var BLZ, BANK_NAME: string): Boolean;
  end;
    
var
  BLZForm: TBLZForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Main;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TBLZForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  OnUpdateStatusBar := nil;
  //Scaled :=True;
  SearchData := '';
  //ScaleBy (Screen.Width,800);

  SortName    := _('Blz');
  SortField   := 'BLZ';
  SearchField := 'BLZ';

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.FormActivate(Sender: TObject);
var 
  i: Integer;
begin
  SB.Visible := not assigned(OnUpdateStatusBar);
  if SB.Visible then 
    SB.Top := Height;

  SuchGrid.RowColor1 := DM1.C2Color;
  SuchGrid.EditColor := DM1.EditColor;
  InClose := False;
  UpdateQuery (SearchData);
  SearchData := '';
  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if uppercase(SuchGrid.Columns[i].FieldName) = uppercase(SearchField) then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];
  end;
end;  

//------------------------------------------------------------------------------
procedure TBLZForm.FormDeactivate(Sender: TObject);
begin
  UebernBtn.Visible := False;
  InClose := True;
  SuchBeg.Text := '';
  InClose := False;
  BLZQuery.Close;
  SearchData := '';
end;  

//------------------------------------------------------------------------------
procedure TBLZForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
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
function TBLZForm.GetDataIfUniqueBLZ (var BLZ, BANK_NAME: string): Boolean;
begin
  Result := False;
  if length(BLZ) = 0 then 
    exit;

  BLZQuery.Close;
  BLZQuery.SQL.Clear;
  BLZQuery.SQL.Add('SELECT LAND, BLZ, BANK_NAME');
  BLZQuery.SQL.Add('FROM BLZ');
  BLZQuery.SQL.Add('where BLZ="' + BLZ + '" and LAND="' + DM1.LandK2 + '"');
  BLZQuery.SQL.Add('LIMIT 0,2');
  BLZQuery.Open;
  if BLZQuery.RecordCount = 1 then
  begin
    Bank_Name := BLZQueryBANK_NAME.AsString;
    Result    := True;
  end;
  BLZQuery.Close;
end;              

//------------------------------------------------------------------------------
function TBLZForm.Get(Index: Integer; var BLZ, BANK_NAME: string): Boolean; 
var 
  V: Variant; NewSortField, NewSearchField: String;
begin
  exitcode := 0;
  //BLZQuery.Refresh;
  //SuchGrid.Invalidate;

  ResBLZ     := '';
  ResBank     := '';

  Result := False;
  case index of
    1: begin
      SortName := _('Blz');
      NewSortField := 'BLZ,BANK_NAME';
      NewSearchField := 'BLZ';
      v := copy (BLZ, 1, 6);
    end;
    2: begin
      SortName := _('Bank');
      NewSortField := 'BANK_NAME';
      NewSearchField := 'BANK_NAME';
      v := copy (BANK_NAME, 1, 5);
    end;
  end;

  SearchData := V;
  SortField := NewSortField;
  SearchField := NewSearchField;
  UebernBtn.Visible := True;
  ShowModal;
  if exitcode = 1 then
  begin
    result    := true;
    BLZ       := ResBLZ;
    Bank_Name := ResBank;
  end;
  BLZQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.UpdateQuery (SuchStr: String);
var 
  LastTime: DWord;
begin
  LastTime := GetTickCount;

  BLZQuery.Close;
  BLZQuery.SQL.Clear;
  BLZQuery.SQL.Add ('SELECT LAND, BLZ, BANK_NAME');
  BLZQuery.SQL.Add ('FROM BLZ');
  BLZQuery.SQL.Add (' WHERE LAND="' + DM1.LandK2 + '"');
  if length(SuchStr) > 0  then
  begin
    BLZQuery.SQL.Add ('AND ');
    BLZQuery.SQL.Add ('(' + DM1.GetSearchSQL ([SEARCHFIELD], SuchStr) + ')');
  end;
  BLZQuery.SQL.Add (' ORDER BY ' + sortfield + ' LIMIT 0,100');
  try
    BLZQuery.Open;
  finally
    Screen.Cursor := crDefault;
  end;
  QueryTime := GetTickCount - LastTime;
end;                   

//------------------------------------------------------------------------------
procedure TBLZForm.SuchGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  i: Integer;
begin
  for i := 0 to SuchGrid.Columns.Count-1 do
  begin
    if SuchGrid.Columns[i].FieldName = Field.FieldName then 
      SuchGrid.Columns[i].Title.Font.Style := [fsBold]
    else 
      SuchGrid.Columns[i].Title.Font.Style := [];
  end;

  if uppercase(SearchField) <> uppercase(Field.FieldName) then
  begin
    SearchField := uppercase(Field.FieldName);
    SortField   := Searchfield;
    SortName    := Field.DisplayLabel;
    UpdateQuery ('');
  end;
end;  

//------------------------------------------------------------------------------
procedure TBLZForm.BLZ_DSDataChange(Sender: TObject; Field: TField);
var 
  SuchZeit, Datensatz: String;
begin
  if SB.Visible then
  begin
    SB.Panels[1].Text := inttostr(BLZQuery.RecNo) + ' : ' +
    inttostr(BLZQuery.RecordCount);
  end else
  begin
    Datensatz  := inttostr(BLZQuery.RecNo) + ' : ' +
    inttostr(BLZQuery.RecordCount);

    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');

    if assigned (OnUpdateStatusBar) then 
      OnUpdateStatusBar (Suchzeit, Datensatz, _('Sortierung : ') + SortName, '', '');
  end;
end;                              

//------------------------------------------------------------------------------
procedure TBLZForm.SuchGridDblClick(Sender: TObject);
begin
  exitcode := 1;
  ResBLZ     := BLZQueryBLZ.AsString;
  ResBank    := BLZQueryBANK_Name.AsString;
  Close;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.SuchbegChange(Sender: TObject);
begin
  if InClose then 
    exit;
  searchtime := 15;
  searchtimer.enabled := true;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.SuchGridCheckButton(Sender: TObject; ACol: Integer; Field: TField; var Enabled: Boolean);
var 
 s: String;
begin
  S := Uppercase(Field.FieldName);
  Enabled := (S = 'BLZ') or (S = 'BANK_NAME');
end;                        

//------------------------------------------------------------------------------
procedure TBLZForm.BLZQueryNewRecord(DataSet: TDataSet);
begin
  BLZQueryLAND.AsString := DM1.LandK2;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then 
    exit;
  if searchtime > 0 then 
    dec(searchtime) 
  else 
  begin
    searchtimer.enabled := false;
    SuchBegr := Suchbeg.Text;

    // führende Leerzeichen entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[1] = ' ') do 
      delete(Suchbegr, 1, 1);
    // Leerzeichen am ende Entfernen
    while (length(Suchbegr) > 0) and (Suchbegr[length(Suchbegr)] = ' ') do 
      delete(Suchbegr, length(SuchBegr), 1);

    UpdateQuery (SuchBegr);
  end;
end;        

//------------------------------------------------------------------------------
procedure TBLZForm.Suchen1Click(Sender: TObject);
begin
  try
    SuchBeg.SetFocus;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.Neu2Click(Sender: TObject);
begin
  BLZQuery.Append;
end;

//------------------------------------------------------------------------------
procedure TBLZForm.Loeschen1Click(Sender: TObject);
begin
  if MessageDlg ('Wollen Sie diese Bankleitzahl wirklich löschen ?', 
                 mtconfirmation, mbyesnocancel, 0) = mryes then 
  begin
    BLZQuery.Delete;
  end;
end;  

//------------------------------------------------------------------------------
procedure TBLZForm.SortierungClick(Sender: TObject);
begin
  if (tmenuitem(sender).tag > 0) and (tmenuitem(sender).tag < 3) then
  begin
    tmenuitem(sender).checked := not tmenuitem(sender).checked;
    SetSort(tmenuitem(sender).tag);
  end;
end;                 

//------------------------------------------------------------------------------
procedure TBLZForm.SetSort (Sort: Integer);
var 
  i: Integer;
begin
  if sort = aktsort then 
    exit;
  if sort < 0 then 
    sort := aktsort;
  case sort of
    {BLZ}      
    1: begin 
      sortname :='BLZ';       
      SortField :='BLZ';   
    end;
    {Ort}      
    2: begin 
      sortname :='Name'; 
      SortField :='BANK_NAME,BLZ'; 
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
procedure TBLZForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if assigned(OnUpdateStatusBar) then
  begin
    if BLZQuery.RecordCount = 0 then 
      Datensatz := 'keine'
    else
    if BLZQuery.RecordCount = Limit then 
      Datensatz := inttostr (BLZQuery.RecNo) + ' von >=' + inttostr (BLZQuery.RecordCount)
    else 
      Datensatz := inttostr (BLZQuery.RecNo) + ' von ' + inttostr (BLZQuery.RecordCount);

    Sortierung := 'Sortierung : ' + sortname;

    {        if (BLZQuery.active)and(BLZQuery.recordcount>0) then
    begin
    Erstellt  :='Erstellt:'+formatdatetime ('dd.mm.yyyy',BLZQueryErstellt.Value);
    if BLZQueryGeaend.Value>1
    then Geaendert :='Geändert:'+
    formatdatetime ('dd.mm.yyyy',BLZQueryGeaend.Value)
    else Geaendert :='-';
    end
    else
    begin
    Erstellt  :='';
    Geaendert :='';
    end;
    }
    SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' Sek.';
    OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end;
end;

end.

