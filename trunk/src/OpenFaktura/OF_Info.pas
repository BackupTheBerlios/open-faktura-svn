{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Infosystem / Notizen                                              }
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
{ 23.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 23.10.2004 - Format-Menü per Rechtsklick hinzugefügt }
{ 31.10.2004 - Private Infos implementiert, Tabelle INFO umstrukturiert }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Info;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, btJvxRichPopup, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, StdCtrls, ComCtrls, DBCtrls,
  ToolWin, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, JvExExtCtrls,
  JvComponent, JvSplit, JvExStdCtrls, JvRichEdit, JvDBRichEdit, Mask,
  JvExMask, JvToolEdit, JvDBControls,
  OF_Var_Const, JvMenus, OFSecurity;

type
  TInfoForm = class(TForm)
    InfoDS: TDataSource;
    InfoPanel: TPanel;
    InfoTab: TOFZQuery;
    InfoTabLFD_NR: TIntegerField;
    InfoTabQUELLE: TIntegerField;
    InfoTabDATUM: TDateField;
    InfoTabWV_DATUM: TDateField;
    InfoTabERST_VON: TStringField;
    InfoTabKURZTEXT: TStringField;
    InfoTabMEMO: TMemoField;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    neuenBelegerstellen1: TMenuItem;
    N3: TMenuItem;
    Storno1: TMenuItem;
    N1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    CenterPan: TPanel;
    MsgPan: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    WVCB: TDBCheckBox;
    KurzInfoEdi: TDBEdit;
    DBRichEdit1: TJvDBRichEdit;
    JvxSplitter1: TJvxSplitter;
    InfoGrid: TOFDBGrid;
    nurUnerledigt1: TMenuItem;
    N2: TMenuItem;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    Label25: TLabel;
    Suchbeg: TEdit;
    ToolButton2: TToolButton;
    ErledBtn: TToolButton;
    ToolButton3: TToolButton;
    PrintBtn: TToolButton;
    WVDate: TJvDBDateEdit;
    Datum1: TMenuItem;
    Info1: TMenuItem;
    Erstellt1: TMenuItem;
    TopStatusPan: TPanel;
    MainLabelMid: TLabel;
    MainLabLeft: TLabel;
    Label2: TLabel;
    MainLabMid: TLabel;
    MainPanRight: TPanel;
    Image1: TImage;
    Aktualisieren1: TMenuItem;
    BTJvxRichPopUpMenu1: TBTJvxRichPopUpMenu;
    ImageList1: TImageList;
    FontDialog1: TFontDialog;
    InfoTabMA_ID: TIntegerField;
    InfoTabPRIVAT: TBooleanField;
    InfoTabQUELL_ID: TIntegerField;
    InfoTabWV_FLAG: TBooleanField;
    InfoTabERLEDIGT_FLAG: TBooleanField;
    PrivatCB: TDBCheckBox;
    Drucken1: TMenuItem;
    MnuPrintListe: TMenuItem;
    MnuPrintAktNotiz: TMenuItem;
    procedure InfoTabAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure InfoGridApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure InfoTabNewRecord(DataSet: TDataSet);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure nurUnerledigt1Click(Sender: TObject);
    procedure ErledBtnClick(Sender: TObject);
    procedure Erstellt1Click(Sender: TObject);
    procedure InfoDSDataChange(Sender: TObject; Field: TField);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure InfoTabAfterPost(DataSet: TDataSet);
    procedure neuenBelegerstellen1Click(Sender: TObject);
    procedure Storno1Click(Sender: TObject);
    procedure InfoTabAfterInsert(DataSet: TDataSet);
    procedure InfoGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure MnuPrintListeClick(Sender: TObject);
    procedure MnuPrintAktNotizClick(Sender: TObject);
  private
    { Private-Deklarationen }
    ViewAll  : Boolean;
    First    : Boolean;
    SortField: String;
    SortName : String;
    Limit    : Integer;
    
    procedure UpdateQuery;
    procedure UpdateSum;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure PruefeWiedervorlage;
  end;

var
  InfoForm: TInfoForm;

implementation

uses
  GNUGetText,
  OF_Main, OF_DM,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TInfoForm.PruefeWiedervorlage;
var 
  Anz: Integer;
  Txt: String;
  UniQuery: TZQuery;
begin
  // Wenn user bereits im Modul ist, dann nicht prüfen
  if MainForm.ActiveModul = 1060 then
    exit;

  UniQuery := TZQuery.Create(Self);
  try
    UniQuery.Connection := DM1.DB1;
    UniQuery.sql.text := 'select count(*) as ANZ from INFO ' +
      'where ((MA_ID=' + IntToStr(DM1.UserID) + ' ' +
      'and PRIVAT="Y") or (PRIVAT="N")) and ' +
      'ERLEDIGT_FLAG="N" and ' +
      'WV_FLAG="Y" and WV_DATUM <=NOW()';
    UniQuery.Open;
    if (UniQuery.RecordCount > 0) and (UniQuery.FieldByName ('ANZ').AsInteger > 0) then
    begin
      ANZ := UniQuery.FieldByName ('ANZ').AsInteger;
      if Anz = 1 then 
        txt := _('Eine Notiz sollte Ihnen heute wieder vorgelegt werden.' +
          #13#10 +
          'Möchen Sie jetzt zu den Notizen wechseln ?')
      else 
        txt := Inttostr(Anz) +
          _(' Notizen sollten Ihnen heute wieder vorgelegt werden.' +
          #13#10 +
          'Möchen Sie jetzt zu den Notizen wechseln ?');
      if MessageDlg (Txt, mtConfirmation, [mbYes, mbNo], 0) = mryes then
      begin
        MainForm.JumpTo (MOD_NOTIZ, 0, 0, False);
      end;
    end;
    UniQuery.Close;
  finally
    UniQuery.free;
  end;
end; 

//------------------------------------------------------------------------------
procedure TInfoForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  OnUpdateStatusBar := nil;
  First             := True;
  ViewAll           := True;
  SortField         := 'DATUM';
  SortName          := _('Datum');
  Limit             := High(Integer);

  with BTJvxRichPopupMenu1 do
  begin
    miUndo.ImageIndex       := 13;
    miCut.ImageIndex        := 0;
    miCopy.ImageIndex       := 1;
    miPaste.ImageIndex      := 2;
    miClear.ImageIndex      := -1;
    miSelectAll.ImageIndex  := -1;
    miFont.ImageIndex       := 4;
    miLeft.ImageIndex       := 9;
    miCenter.ImageIndex     := 10;
    miRight.ImageIndex      := 11;
    miBold.ImageIndex       := 5;
    miUnderlined.ImageIndex := 7;
    miItalic.ImageIndex     := 6;
    miBullet.ImageIndex     := 12;
  end;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.FormActivate(Sender: TObject);
begin
  if First then
  begin
    First := False;
    InfoGrid.RowColor1 := DM1.C2Color;
    InfoGrid.EditColor := DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(InfoGrid), 'INFO_LIST', 103);
    SortField := DM1.ReadStringU ('INFO', 'SORT', 'DATUM');
    ViewAll   := DM1.ReadBooleanU ('INFO', 'VIEW_ALL', True);

    if ViewAll then 
      MainLabMid.Caption := ''
    else 
      MainLabMid.Caption := _('(nur unerledigte Notizen)');

    if SortField = 'KURZTEXT' then
    begin
      Info1.Checked := True;
      SortName := _('Kurztext');
    end else
    if SortField = 'ERST_VON' then
    begin
      Erstellt1.Checked := True;
      SortName := _('Erstellt von');
    end else
    begin
      Datum1.Checked := True;
      SortName := _('Datum');
    end;

    nurUnerledigt1.Checked := not ViewAll;

  end;
  UpdateQuery;
  InfoGrid.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.FormDeactivate(Sender: TObject);
begin
  if (InfoTab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg (_('Die aktuelle Notiz wurde verändert,' + #13#10 +
      'wollen Sie die Änderung speichern ?'),
      mtconfirmation, [mbYes, mbNo], 0) = mryes then 
    begin
      InfoTab.Post
    end else 
      InfoTab.Cancel;
  end;
  InfoTab.Close;
end;  

//------------------------------------------------------------------------------
procedure TInfoForm.UpdateQuery;
begin
  InfoTab.Close;
  InfoTab.Sql.Clear;
  InfoTab.SQL.Add ('select * from INFO where ' +
    '((MA_ID=' + IntToStr(DM1.UserID) +
    ' and PRIVAT="Y") or (PRIVAT="N"))');
  if not ViewAll then 
    InfoTab.SQL.Add (' and ERLEDIGT_FLAG="N"');
  if length(SortField) > 0 then 
    InfoTab.SQL.Add ('order by ' + SortField);
  InfoTab.Open;
  UpdateSum;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterScroll(DataSet: TDataSet);
begin
  if InfoTabErledigt_Flag.AsBoolean = True then
  begin
    ErledBtn.ImageIndex := 22;
    ErledBtn.Caption    := _('Unerledigt');
    WVCB.Enabled        := False;
    WVDate.Enabled      := False;
  end else
  begin
    ErledBtn.ImageIndex := 12;
    ErledBtn.Caption    := _('Erledigt');
    WVCB.Enabled        := True;
    WVDate.Enabled      := True;
  end;
  PrivatCB.Enabled := InfoTabMA_ID.AsInteger = DM1.UserID;

  MnuPrintAktNotiz.Enabled := (InfoTab.Active) and (InfoTab.RecordCount > 0);
  MnuPrintListe.Enabled := (InfoTab.Active) and (InfoTab.RecordCount > 0);
  PrintBtn.Enabled := (InfoTab.Active)and(InfoTab.RecordCount>0);
end;                                            

//------------------------------------------------------------------------------
procedure TInfoForm.InfoGridApplyCellAttribute(Sender: TObject;
Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if InfoTabERLEDIGT_FLAG.AsBoolean = True then
  begin
    canvas.font.style := [fsStrikeOut];
    canvas.font.color := clgray;
  end else
  begin
    if (InfoTabWV_FLAG.AsBoolean = True) and (InfoTabWV_DATUM.AsDateTime <= Now) then
    begin
      canvas.font.style := [fsBold];
      canvas.font.color := clRed;
    end;
  end;
end;

  //------------------------------------------------------------------------------
procedure TInfoForm.InfoTabNewRecord(DataSet: TDataSet);
begin
  InfoTabMA_ID.AsInteger         := DM1.UserID;
  InfoTabErst_VON.AsString       := DM1.View_User;
  InfoTabWV_FLAG.AsBoolean       := False;
  InfoTabERLEDIGT_FLAG.AsBoolean := False;
  InfoTabQuelle.Value            := 99;
  InfoTabDatum.Value             := now;

  KurzInfoEdi.SetFocus;
end;  

//------------------------------------------------------------------------------
procedure TInfoForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(InfoGrid));
end;

//------------------------------------------------------------------------------
procedure TInfoForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout (tDBGrid(InfoGrid), 'INFO_LIST', 103);
end;

//------------------------------------------------------------------------------
procedure TInfoForm.nurUnerledigt1Click(Sender: TObject);
begin
  nurUnerledigt1.Checked := not nurUnerledigt1.Checked;
  ViewAll := not nurUnerledigt1.Checked;
  UpdateQuery;
  DM1.WriteBooleanU ('INFO', 'VIEW_ALL', ViewAll);
  if ViewAll then 
    MainLabMid.Caption := ''
  else 
    MainLabMid.Caption := _('(nur unerledigte Notizen)');
end;

//------------------------------------------------------------------------------
procedure TInfoForm.ErledBtnClick(Sender: TObject);
begin
  if not (Infotab.State in [dsEdit, dsInsert]) then 
    InfoTab.Edit;
  if InfoTabErledigt_Flag.AsBoolean = True then
  begin
    InfoTabErledigt_Flag.AsBoolean := False;
  end else
  begin
    InfoTabErledigt_Flag.AsBoolean := True;
    InfoTabWV_FLAG.AsBoolean       := False;
  end;

  InfoTab.Post;
  InfoTabAfterScroll (nil);
  UpdateSum;
end; 

//------------------------------------------------------------------------------
procedure TInfoForm.Erstellt1Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  case TMenuItem(Sender).Tag of
    2: begin 
      SortField := 'KURZTEXT'; 
      SortName := _('Kurztext'); 
    end;
    3: begin 
      SortField := 'ERST_VON'; 
      SortName := _('Erstellt von'); 
    end;
    else begin 
      SortField := 'DATUM';    
      SortName := _('Datum'); 
    end;
  end;
  UpdateQuery;
  DM1.WriteStringU ('INFO', 'SORT', SortField);
end;  

//------------------------------------------------------------------------------
procedure TInfoForm.InfoGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  LastSortField: String;
begin
  LastSortField := SortField;

  if InfoGrid.Columns[ACol].FieldName = 'KURZTEXT' then
  begin
    SortField := 'KURZTEXT'; SortName := _('Kurztext');
    Info1.Checked := True;
  end else
  begin
    if InfoGrid.Columns[ACol].FieldName = 'ERST_VON' then
    begin
      SortField := 'ERST_VON'; SortName := _('Erstellt von');
      Erstellt1.Checked := True;
    end else
    if InfoGrid.Columns[ACol].FieldName = 'DATUM' then
    begin
      SortField := 'DATUM'; SortName := _('Datum');
      Datum1.Checked := True;
    end;

    if SortField <> LastSortField then
    begin
      UpdateQuery;
      DM1.WriteStringU ('INFO', 'SORT', SortField);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.InfoDSDataChange(Sender: TObject; Field: TField);
var 
  Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if InfoTab.RecordCount = 0 then 
    Datensatz := _('keine')
  else 
  if InfoTab.RecordCount = Limit then 
    Datensatz := inttostr (InfoTab.RecNo) + ' ' + _('von') + ' >=' + inttostr (InfoTab.RecordCount)
  else 
    Datensatz := inttostr (InfoTab.RecNo) + ' ' + _('von') + ' ' + inttostr (InfoTab.RecordCount);

  Sortierung := _('Sortierung : ') + sortname;

  Erstellt := '';
  Geaendert := '';

  if assigned (OnUpdateStatusBar) then 
    OnUpdateStatusBar ('-', Datensatz, Sortierung, Erstellt, Geaendert);
end;

//------------------------------------------------------------------------------
procedure TInfoForm.Aktualisieren1Click(Sender: TObject);
begin
  if InfoTab.Active then
  begin
    InfoTab.Refresh;
    UpdateSum;
  end;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.UpdateSum;
var SUM: Integer;
begin
  dm1.uniquery.close;
  dm1.uniquery.sql.text := 'select count(*) as ANZ from INFO where' +
    ' WV_FLAG="Y" and WV_DATUM<=CURDATE()';
  dm1.uniquery.open;

  if dm1.uniquery.Recordcount = 1 then 
    SUM := dm1.uniquery.FieldByName ('ANZ').AsInteger
  else 
    SUM := 0;
  dm1.uniquery.close;

  if SUM = 0 then 
    MainLabelMid.Caption := _('keine überfällig')
  else 
    MainLabelMid.Caption := IntToStr(Sum) + ' ' + _('fällig');
end;                                                          

//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterPost(DataSet: TDataSet);
begin
  UpdateSum;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.neuenBelegerstellen1Click(Sender: TObject);
begin
  InfoTab.Append;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.Storno1Click(Sender: TObject);
begin
  if MessageDlg (_('Wollen Sie diese Notiz wirklich löschen ?'),
    mtConfirmation, mbyesnocancel, 0) = mryes then InfoTab.Delete;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.InfoTabAfterInsert(DataSet: TDataSet);
begin
  KurzInfoEdi.Setfocus;
end;

//------------------------------------------------------------------------------
procedure TInfoForm.MnuPrintListeClick(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowUniDlg(
    InfoTab.OFModulID,            //Modul
    InfoTab.Sql.Text,              //SQL
    'MAIN\REPORT\NOTIZ_LISTE',     //Reg-Key
    _('Notizen drucken'),          //Dialog Caption
    _('Layout Notizen bearbeiten'), //Designer Überschrift
    _('Liste Notizen'),            //Druckjob-Text
    False                          // Vorschau
  );
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TInfoForm.MnuPrintAktNotizClick(Sender: TObject);
var 
  SQL: String;
begin
  SQL := 'SELECT * FROM INFO WHERE LFD_NR=' + IntToStr(InfoTabLfd_nr.AsInteger);
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowUniDlg (
    InfoTab.OFModulID,           //Modul
    Sql,                          //SQL
    'MAIN\REPORT\NOTIZ',          //Reg-Key
    _('Notiz drucken'),           //Dialog Caption
    _('Layout Notiz bearbeiten'), //Designer Überschrift
    _('Notiz'),                   //Druckjob-Text
    False                         //Vorschau
  );
  {$ENDIF}
end;

//------------------------------------------------------------------------------

end.

