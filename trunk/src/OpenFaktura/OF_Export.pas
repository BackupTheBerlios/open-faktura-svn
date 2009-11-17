{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Export f. SQL Query Resultate (siehe Tools)                       }
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
{ - Formulareditor integrieren                                                 }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 21.08.2004 - Tabellen werden in ListBox angezeigt                            }
{            - Jedi-Editor durch SynEdit ausgetauscht                          }
{            - Code Vervollständigung hinzugefügt                              }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Export;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, ImgList, SynEditHighlighter,
  SynHighlighterSQL, SynCompletionProposal, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Menus, SynEdit, StdCtrls, JvExExtCtrls,
  JvComponent, JvSplit, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  ComCtrls, DBCtrls, ToolWin, JvExComCtrls, JvComCtrls, JvExControls,
  JvSpeedButton, ExtCtrls, OF_VAR_CONST, JvMenus;

{
uses
  JvDBCtrl,
  JvEditor, JvHLEditor,
}

type
  TExportForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    ReEdiTopLab: TLabel;
    ButtonPan: TPanel;
    AuswahlBtn: TJvSpeedButton;
    AllgemeinBtn: TJvSpeedButton;
    SQLBtn: TJvSpeedButton;
    FelderBtn: TJvSpeedButton;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    ExportTab: TZQuery;
    PC1: TJvPageControl;
    AuswahlTS: TTabSheet;
    SQLExecTS: TTabSheet;
    FelderTS: TTabSheet;
    AllgTS: TTabSheet;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ExportDS: TDataSource;
    ToolButton1: TToolButton;
    ExportListGrid: TOFDBGrid;
    ExportTabID: TIntegerField;
    ExportTabKURZBEZ: TStringField;
    ExportTabINFO: TMemoField;
    ExportTabQUERY: TMemoField;
    ExportTabFELDER: TMemoField;
    ExportTabFORMULAR: TBlobField;
    ExportTabFORMAT: TStringField;
    ExportTabFILENAME: TStringField;
    ExportTabLAST_CHANGE: TDateTimeField;
    ExportTabCHANGE_NAME: TStringField;
    EQuery: TZQuery;
    EDS: TDataSource;
    JvxSplitter1: TJvxSplitter;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    SQLExecBtn: TToolButton;
    ExportBtn: TToolButton;
    Ausfhren1: TMenuItem;
    ToolButton5: TToolButton;
    DBNavigator2: TDBNavigator;
    SaveDialog1: TSaveDialog;
    AuswExportBtn: TToolButton;
    SqlGrid: TOFDBGrid;
    ToolButton3: TToolButton;
    EdiBtn: TToolButton;
    ToolButton4: TToolButton;
    Auswahl2Btn: TToolButton;
    Panel1: TPanel;
    WordList: TSynCompletionProposal;
    MySQLSyn: TSynSQLSyn;
    ImageList2: TImageList;
    Panel2: TPanel;
    TableList: TListBox;
    Panel3: TPanel;
    Panel4: TPanel;
    SQLEditor: TSynEdit;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    UndoBtn: TToolButton;
    RedoBtn: TToolButton;
    RunSQLBtn: TToolButton;
    ToolButton10: TToolButton;
    JvxSplitter2: TJvxSplitter;
    ToolButton7: TToolButton;
    PrintBtn: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SQLExecBtnClick(Sender: TObject);
    procedure ExportTabBeforePost(DataSet: TDataSet);
    procedure PC1Change(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure EQueryAfterOpen(DataSet: TDataSet);
    procedure ExportTabAfterPost(DataSet: TDataSet);
    procedure AuswExportBtnClick(Sender: TObject);
    procedure EdiBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure AuswahlBtnClick(Sender: TObject);
    procedure SQLEditor1Change(Sender: TObject);
    procedure Ausfhren1Click(Sender: TObject);
    procedure SQLEditorChange(Sender: TObject);
    procedure TableListDrawItem(Control: TWinControl; Index: Integer;
    Rect: TRect; State: TOwnerDrawState);
    procedure WordListExecute(Kind: SynCompletionType; Sender: TObject;
var CurrentInput: String; var x, y: Integer;
  var CanExecute: Boolean);
  procedure UndoBtnClick(Sender: TObject);
  procedure RedoBtnClick(Sender: TObject);
  procedure PrintBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    First: Boolean;
    procedure CheckUndoRedo;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
  end;
    
var
  ExportForm: TExportForm;

implementation

uses
  GNUGetText, OF_DM, OF_Main;

  //{$IFDEF ALPHA} ???
  //CAO_Export_Print,
  //{$ENDIF}

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TExportForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except
  end;

  OnUpdateStatusBar  := nil;
  First              := True;

  FelderBtn.Align    := alRight;
  SQLBtn.Align       := alRight;
  AllgemeinBtn.Align := alRight;
  AuswahlBtn.Align   := alRight;

  {$IFDEF ALPHA}
  PrintBtn.Visible := True;
  {$ELSE}
  PrintBtn.Visible := False;
  {$ENDIF}
end;                  

//------------------------------------------------------------------------------
procedure TExportForm.FormActivate(Sender: TObject);
begin
  if First = True then
  begin
    First := False;
    ExportListGrid.RowColor1 := DM1.C2Color;
    SqlGrid.RowColor1        := DM1.C2Color;
    ExportListGrid.EditColor := DM1.EditColor;
    SqlGrid.EditColor        := DM1.EditColor;
  end;
  ExportTab.Open;
  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Self);
  ExportListGrid.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TExportForm.FormDeactivate(Sender: TObject);
begin
  ExportTab.Close;
  EQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TExportForm.PC1Change(Sender: TObject);
Var
  i: Integer;
begin
  AuswahlBtn.Font.Style   := [];
  AllgemeinBtn.Font.Style := [];
  SQLBtn.Font.Style       := [];
  FelderBtn.Font.Style    := [];

  case PC1.ActivePageIndex of
    0: begin 
      AuswahlBtn.Font.Style   := [fsBold]; 
    end;
    1: begin 
      AllgemeinBtn.Font.Style := [fsBold]; 
    end;
    2: begin 
      SQLBtn.Font.Style       := [fsBold]; 
    end;
    3: begin 
      FelderBtn.Font.Style    := [fsBold]; 
    end;
  end;

  if PC1.ActivePage = SQLExecTS then
  begin
    SQLEditor.Lines.Text := ExportTabQUERY.AsString;
    SQLEditor.Modified := False;
    //uwe
    { TODO : Funktion neu erstellen... }
    (*
    //17.10.09-ud.
    // die Funktion "GetTableNames" gibt es so nicht mehr.

    DM1.db1.GetTableNames('%', True, TableList.Items);
    //Grossschreibung ??
    for I := 0 to TableList.Items.Count-1 do
      TableList.Items[I] := UpperCase(TableList.Items[I]);
    *)
      //uwe ende
  end;

  if EQuery.Active then EQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TExportForm.SQLExecBtnClick(Sender: TObject);
var 
  S: String;
begin
  ExportBtn.Enabled := False;
  if (not ExportTab.Active) or (ExportTab.RecordCount = 0) then 
    exit;

  if SQLEditor.Modified then
  begin
    ExportTab.Edit;
    ExportTabQuery.AsString := SQLEditor.Lines.Text;
    SQLEditor.Modified := False;
    ExportTab.Post;
  end;

  if ExportTabQuery.AsString = '' then
  begin
    MessageDlg (_('Die SQL-Abfrage ist leer.'), mterror, [mbok], 0);
    exit;
  end;

  if pos('SELECT', uppercase(ExportTabQUERY.AsString)) = 0
  then EQuery.Sql.Text := 'select * ' + ExportTabQUERY.AsString
  else EQuery.Sql.Text := ExportTabQUERY.AsString;

  S := Uppercase(EQuery.Sql.Text);
  if (Pos(';', S) > 0) or
     (Pos('INSERT', S) > 0) or
     (Pos('UPDATE', S) > 0) or
     (Pos('DELETE', S) > 0) or
     (Pos('DROP', S) > 0) or
     (Pos('ALTER', S) > 0) or
     (Pos('CREATE', S) > 0) then
  begin
    MessageDlg (_('Verbotene(n) SQL-Befehl(e) gefunden !'), mterror, [mbok], 0);

  end else 
    EQuery.Open;
end;

//------------------------------------------------------------------------------
procedure TExportForm.ExportTabBeforePost(DataSet: TDataSet);
begin
  ExportTabLAST_CHANGE.AsDateTime := Now;
  ExportTabCHANGE_NAME.AsString   := DM1.View_User;
end;

//------------------------------------------------------------------------------
procedure TExportForm.ExportBtnClick(Sender: TObject);
begin
  if (not (equery.active))or(equery.recordcount = 0) then
  begin
    if (equery.active)and(equery.recordcount = 0) then 
      MessageDlg(_('Die SQL-Abfrage lieferte keine Daten zurück.' + #13#10 +
                   'Ein Export ist nicht möglich'), mtinformation, [mbok], 0);
    exit;
  end;

  SaveDialog1.InitialDir := DM1.ExportDir;
  SaveDialog1.DefaultExt := 'csv';
  SaveDialog1.Title      := _('Daten exportieren');
  SaveDialog1.Filter     := _('CSV-Dateien') + '|*.csv' + '|' + _('Excel-Dateien') + '|*.xls';
  if SaveDialog1.Execute then
  begin
    try
      EQuery.DisableControls;

      if Uppercase(ExtractFileExt(SaveDialog1.FileName)) = '.XLS' then 
        DM1.ExportDatasetToExcel (SaveDialog1.FileName, EQuery, True)
      else 
        DM1.ExportDatasetToFile  (SaveDialog1.FileName, EQuery, ListSeparator, False);
    finally
      EQuery.EnableControls;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TExportForm.EQueryAfterOpen(DataSet: TDataSet);
begin
  ExportBtn.Enabled := (equery.active)and(equery.recordcount>0);
end;
//------------------------------------------------------------------------------

procedure TExportForm.ExportTabAfterPost(DataSet: TDataSet);
begin
  AuswExportBtn.Enabled := (ExportTab.Active) and (ExportTab.RecordCount>0);
  EdiBtn.Enabled := (ExportTab.Active) and (ExportTab.RecordCount>0);
end;                                       

//------------------------------------------------------------------------------
procedure TExportForm.AuswExportBtnClick(Sender: TObject);
begin
  if ExportTabQuery.AsString = '' then
  begin
    MessageDlg (_('Die SQL-Abfrage ist leer.'), mterror, [mbok], 0);
    exit;
  end;
  SQLExecBtnClick(Self);
  ExportBtnClick (Self);
end;

//------------------------------------------------------------------------------
procedure TExportForm.EdiBtnClick(Sender: TObject);
begin
  PC1.ActivePage := SQLExecTS;
  PC1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TExportForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                               

//------------------------------------------------------------------------------
procedure TExportForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TExportForm.AuswahlBtnClick(Sender: TObject);
begin
  if (Sender is tMenuItem) then 
    PC1.ActivePage := PC1.Pages[tMenuitem(sender).Tag-1]
  else 
    PC1.ActivePage := PC1.Pages[TJvSpeedButton(sender).Tag-1];
  PC1Change (Sender);
end;

//------------------------------------------------------------------------------
procedure TExportForm.SQLEditor1Change(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TExportForm.Ausfhren1Click(Sender: TObject);
begin
  if PC1.ActivePage <> SQLExecTS then 
    EdiBtnClick(Self);
  SQLExecBtnClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TExportForm.SQLEditorChange(Sender: TObject);
begin
  EQuery.Close;
  ExportBtn.Enabled := False;
  CheckUndoRedo; //Undo Redo Funktion für SQLEditor
end;

//------------------------------------------------------------------------------
procedure TExportForm.TableListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with Control as TListBox do
  begin
    Canvas.FillRect(Rect);
    ImageList2.Draw(Canvas, Rect.Left + 4, Rect.Top, 0, True);
    Canvas.TextOut(Rect.Left + 25, Rect.Top, (Control as TListBox).Items[Index]);
  end
end;

//------------------------------------------------------------------------------
procedure TExportForm.WordListExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: String; var x, y: Integer;
                      var CanExecute: Boolean);
var
  TabName: String;
  i: integer;
begin
  for i := SQLEditor.CaretX-1 downto 0 do
  begin
    if SQLEditor.LineText[i] = ' ' then break;
    if SQLEditor.LineText[i] = ',' then break;
    if SQLEditor.LineText[i] = '(' then break;
  end;

  WordList.InsertList.Clear;
  WordList.ItemList.Clear;

  if i = -1 then //zeilenanfang
    TabName := Copy(SQLEditor.LineText, 0, SQLEditor.CaretX - 2)
  else //Leerzeichen o. ähnliches
    TabName := Copy(SQLEditor.LineText, i + 1, SQLEditor.CaretX - i - 2);

  { TODO : Funktion neu erstellen... }
  (*
  //17.10.09-ud.
  // die Funktion "GetFieldNames" gibt es so nicht mehr.

  DM1.DB1.GetFieldNames(TabName, WordList.InsertList);
  WordList.ItemList := WordList.InsertList;
  *)
end;

//------------------------------------------------------------------------------
procedure TExportForm.CheckUndoRedo;
begin
  if SQLEditor.UndoList.ItemCount > 0 then
    UndoBtn.Enabled := True
  else 
    UndoBtn.Enabled := False;

  if SQLEditor.RedoList.ItemCount > 0 then
    RedoBtn.Enabled := True
  else 
    RedoBtn.Enabled := False;
end;

//------------------------------------------------------------------------------
procedure TExportForm.UndoBtnClick(Sender: TObject);
begin
  SQLEditor.Undo;
  CheckUndoRedo;
end;

//------------------------------------------------------------------------------
procedure TExportForm.RedoBtnClick(Sender: TObject);
begin
  SQLEditor.Redo;
  CheckUndoRedo;
end;

//------------------------------------------------------------------------------
procedure TExportForm.PrintBtnClick(Sender: TObject);
{$IFDEF ALPHA}
var ExportPrintForm: TExportPrintForm;
  {$ENDIF}
begin
  {$IFDEF ALPHA}
  ExportPrintForm := TExportPrintForm.Create(Self);
  try
    ExportPrintForm.RepPipeline.DataSource := ExportDS;
    ExportPrintForm.DataPipeline.DataSource := EDS;
    ExportPrintForm.ShowDlg;
  finally
    ExportPrintForm.Free;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------

end.

