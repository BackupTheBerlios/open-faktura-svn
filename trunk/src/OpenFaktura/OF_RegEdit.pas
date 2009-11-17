{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog für SQL-Registry-Editor                                    }
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
{ - Funktion zum erstellen von neuen FREEREPORT Einträgen                      }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt                          }
{ 09.05.2003 - Unit zum GNU-Source hinzugefügt                                 }
{ 07.02.2004 - Tab-Reihenfolge verbessert                                      }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{ 30.10.2009 - UD: Neuen Registertyp (8) für Reports.                          }
{ 07.11.2009 - UD: Funktion zum exportieren von Reportvorlagen                 }
{                                                                              }
{******************************************************************************}

unit OF_RegEdit;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, ToolWin, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  StdCtrls, Mask, DBCtrls, JvExStdCtrls, JvDBCombobox, Buttons,
  JvExComCtrls, JvComCtrls, JvExExtCtrls, JvComponent, JvSplit, ExtCtrls;

type
  TRegEdiForm = class(TForm)
    StatusBar1: TStatusBar;
    ValQuery: TZQuery;
    DataSource1: TDataSource;
    ValQueryNAME: TStringField;
    ValQueryVAL_TYP: TIntegerField;
    ValQueryTyp_Str: TStringField;
    ValQueryValue_Str: TStringField;
    ValQueryMAINKEY: TStringField;
    ValQueryVAL_CHAR: TStringField;
    ValQueryVAL_DATE: TDateTimeField;
    ValQueryVAL_INT: TIntegerField;
    ValQueryVAL_DOUBLE: TFloatField;
    ValQueryVAL_BLOB: TMemoField;
    ValQueryVAL_BIN: TBlobField;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    MainPanel: TPanel;
    RxSplitter1: TJvxSplitter;
    TV: TTreeView;
    PC1: TJvPageControl;
    DefaultTS: TTabSheet;
    NaviPanel: TPanel;
    DBNavigator1: TDBNavigator;
    EdiPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnFormSave: TSpeedButton;
    TypAWCB: TJvDBComboBox;
    WertEdi: TDBEdit;
    KeyEdit: TDBEdit;
    DBGrid1: TOFDBGrid;
    DruckerTreiberTS: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    DrDrvSaveBtn: TToolButton;
    DrDrvAbortBtn: TToolButton;
    DrDrvCopyBtn: TToolButton;
    DrDrvImportBtn: TToolButton;
    DrDrvExportBtn: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    DrDrvDelBtn: TToolButton;
    DrDrvNewBtn: TToolButton;
    ToolButton11: TToolButton;
    OpenDialog1: TOpenDialog;
    DRTreiberQuery: TZQuery;
    StringField1: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    DrTreiberDS: TDataSource;
    DrTreiberGrid: TOFDBGrid;
    btnReportImport: TSpeedButton;
    btnReportExport: TSpeedButton;
    procedure ValQueryCalcFields(DataSet: TDataSet);
    procedure ValQueryAfterScroll(DataSet: TDataSet);
    procedure ValQueryBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure TypAWCBChange(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure btnFormSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DrDrvNewBtnClick(Sender: TObject);
    procedure DrDrvCopyBtnClick(Sender: TObject);
    procedure DrDrvDelBtnClick(Sender: TObject);
    procedure DrDrvExportBtnClick(Sender: TObject);
    procedure DrDrvImportBtnClick(Sender: TObject);
    procedure DRTreiberQueryNewRecord(DataSet: TDataSet);
    procedure DrTreiberDSStateChange(Sender: TObject);
    procedure DrDrvSaveBtnClick(Sender: TObject);
    procedure DrDrvAbortBtnClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnReportImportClick(Sender: TObject);
    procedure btnReportExportClick(Sender: TObject);
  private
    { Private-Deklarationen }
    MainSqlKey: String;
    MainKey   : String;
    DruckerTreiberRootNode   : tTreeNode;
    DruckerTreiberNode       : tTreeNode;
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
  end;

var
  RegEdiForm: TRegEdiForm;

implementation

uses
  IniFiles, GNUGetText,
  OF_DM, OF_Function;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TRegEdiForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent (self);
  except
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy(96, Screen.PixelsPerInch);
    Refresh;
  end;
  PC1.ActivePage := DefaultTS;
  DruckerTreiberRootNode := nil;
  DruckerTreiberNode     := nil;

  //30.10.09-ud -BEGIN-
  TypAWCB.Items.Clear;
  TypAWCB.Values.Clear;
  TypAWCB.Values.Add('1');
  TypAWCB.Items.Add(_('Char'));
  TypAWCB.Values.Add('2');
  TypAWCB.Items.Add(_('DateTime'));
  TypAWCB.Values.Add('3');
  TypAWCB.Items.Add(_('Integer'));
  TypAWCB.Values.Add('4');
  TypAWCB.Items.Add(_('Double'));
  TypAWCB.Values.Add('5');
  TypAWCB.Items.Add(_('Blob'));
  TypAWCB.Values.Add('6');
  TypAWCB.Items.Add(_('Binär'));
  TypAWCB.Values.Add('7');
  TypAWCB.Items.Add(_('Formular'));
  TypAWCB.Values.Add('8');
  TypAWCB.Items.Add(_('Report'));
  //30.10.09-ud -ENDE-
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 680;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 400;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.FormDeactivate(Sender: TObject);
begin
  if DRTreiberQuery.Active then
    DRTreiberQuery.Close;
  if ValQuery.Active then
    ValQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.FormShow(Sender: TObject);
var
  Key, K: String;
  //Item : tTreeNode;
  LastItem, N: tTreeNode;
  I: Integer;
begin
  SaveDialog1.InitialDir := ExtractFileDir(Paramstr(0));

  btnFormSave.Visible := False;
  btnFormSave.Top  := 8;
  btnFormSave.Left := 448;

  btnReportImport.Visible := False;  //30.10.09-ud.
  btnReportImport.Top  := 8;
  btnReportImport.Left := 448;

  btnReportExport.Visible := False;  //07.11.09-ud.
  btnReportExport.Top  := 35;
  btnReportExport.Left := 448;

  DBGrid1.RowColor1 := DM1.C2Color;
  DBGrid1.EditColor := DM1.EditColor;
  DrTreiberGrid.RowColor2 := DM1.C2Color;

  tv.items.clear;

  DM1.uniQuery.Close;
  DM1.uniQuery.Sql.Text :=
    'select MAINKEY from REGISTRY ' +
    'where' +
    ' length(MAINKEY)>3 and (' +
    ' MAINKEY LIKE "KASSE%" or' +
    ' MAINKEY LIKE "MAIN%" or' +
    ' MAINKEY LIKE "SHOP%" or' +
    ' MAINKEY LIKE "TREIBER%" or' +
    ' MAINKEY LIKE "USERSETTINGS%"' +
    ')' +
    ' GROUP BY MAINKEY ORDER BY MAINKEY';

  DM1.UNIQUERY.Open;
  while not DM1.UNIQUERY.eof do
  begin
    Key := DM1.UNIQUERY.FieldByName('MAINKEY').Value;
    LastItem := Nil;
    repeat
      k := key;
      delete (key, 1, pos('\', key));
      k := copy (k, 1, pos('\', k)-1);

      if not assigned(LastItem) then
      begin
        for i := 0 to tv.items.Count-1 do
        begin
          if uppercase(tv.Items[i].Text) = uppercase(k) then
          begin
            LastItem := tv.Items[i];
            Break;
          end;
        end;
      end else
      begin
        for i := 0 to LastItem.Count-1 do
        begin
          if uppercase(LastItem[i].Text) = uppercase(k) then
          begin
            LastItem := LastItem[i];
            Break;
          end;
        end;
      end;
    until pos('\', key) = 0;
    if not assigned(lastitem) then
      n := tv.items.add(LastItem, Key)
    else
      n := tv.items.AddChild (LastItem, Key);
    n.ImageIndex := 0;
    n.SelectedIndex := 1;
    DM1.UNIQUERY.Next;
  end;
  DM1.UNIQUERY.Close;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.ValQueryCalcFields(DataSet: TDataSet);
var
  s: string;
begin
  case ValQueryVAL_TYP.Value of
    1: s := ValQueryVAL_Char.AsString;
    2: s := FormatDateTime('dddd, dd.mm.yyyy hh:mm:ss "Uhr"', ValQueryVAL_Date.AsDateTime);
    3: s := ValQueryVAL_Int.AsString;
    4: s := ValQueryVAL_Double.AsString;
    5: s := ValQueryVAL_Blob.AsString;
    6: s := ValQueryVAL_Bin.AsString;
    7: s := ValQueryVAL_Blob.AsString;
    8: s := ValQueryVAL_Bin.AsString;  //30.10.09-ud.
  end;
  ValQueryValue_Str.Value := s;

  case ValQueryVAL_TYP.Value of
    1: s := _('Char');
    2: s := _('DateTime');
    3: s := _('Integer');
    4: s := _('Double');
    5: s := _('Blob');
    6: s := _('Binär');
    7: s := _('Formular');
    8: s := _('Report'); //30.10.09-ud.
  end;
  ValQueryTyp_Str.Value := s;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.ValQueryAfterScroll(DataSet: TDataSet);
begin
  case ValQueryVAL_TYP.Value of
    1: WertEdi.DataField := 'VAL_CHAR';
    2: WertEdi.DataField := 'VAL_DATE';
    3: WertEdi.DataField := 'VAL_INT';
    4: WertEdi.DataField := 'VAL_DOUBLE';
    5: WertEdi.DataField := 'VAL_BLOB';
    6: WertEdi.DataField := 'VAL_BIN';
    7: WertEdi.DataField := 'VAL_BLOB';
    8: WertEdi.DataField := 'VAL_BIN';
  end;
  WertEdi.Enabled := ValQueryVAL_TYP.Value < 5; // Binary nich bearbeitbar !
  btnFormSave.Visible := ValQueryVAL_TYP.Value = 7;
  btnReportImport.Visible := ValQueryVAL_TYP.Value = 8; //30.10.09-ud.
  btnReportExport.Visible := ValQueryVAL_TYP.Value = 8; //07.11.09-ud.  
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.ValQueryBeforePost(DataSet: TDataSet);
begin
  ValQueryMAINKEY.Value := MainKey;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.TypAWCBChange(Sender: TObject);
var
  NS: String;
  N: Integer;
begin
  NS := TypAWCB.Values[TypAWCB.ItemIndex];
  N := StrToInt(NS);
  case N of
    1: WertEdi.DataField := 'VAL_CHAR';
    2: WertEdi.DataField := 'VAL_DATE';
    3: WertEdi.DataField := 'VAL_INT';
    4: WertEdi.DataField := 'VAL_DOUBLE';
    5: WertEdi.DataField := 'VAL_BLOB';
    6: WertEdi.DataField := 'VAL_BIN';
    7: WertEdi.DataField := 'VAL_BLOB';
    8: WertEdi.DataField := 'VAL_BIN';  //30.10.09-ud.
  end;
  WertEdi.Enabled     := N < 5; // Binary nich bearbeitbar !
  btnFormSave.Visible := N = 7;
  btnReportImport.Visible := N = 8; //30.10.09-ud.
  btnReportExport.Visible := N = 8; //07.11.09-ud.
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.TVChange(Sender: TObject; Node: TTreeNode);
var
  AktNode: TTreeNode;
begin
  AktNode := Node;
  MainSqlKey := '';
  repeat
    if length(MainSqlKey) = 0 then
      MainSqlKey := AktNode.Text
    else
      MainSqlKey := AktNode.Text + '\\' + MainSqlKey;

    if assigned(AktNode.Parent) then
      AktNode := AktNode.Parent
    else
      AktNode := nil;

  until not assigned(AktNode);

  MainKey := MainSqlKey;
  while pos ('\\', MainKey) > 0 do
    delete (MainKey, pos('\\', MainKey), 1);
  StatusBar1.SimpleText := MainKey;

  DruckerTreiberRootNode := nil;
  DruckerTreiberNode     := nil;

  if Pos('TREIBER\BONDRUCKER', Uppercase(MainKey)) = 1 then
  begin
    PC1.ActivePage := DruckerTreiberTS;

    DruckerTreiberRootNode := Node;
    DruckerTreiberNode     := Node;

    if Pos ('TREIBER\BONDRUCKER\', Uppercase(MainKey)) = 1 then
      DruckerTreiberRootNode := Node.Parent;


    if Pos ('TREIBER\BONDRUCKER\', Uppercase(MainKey)) = 1 then
    begin
      DrDrvCopyBtn.Enabled   := True;
      DrTreiberGrid.Visible  := True;
      DRTreiberQuery.Close;
      DRTreiberQuery.ParamByName('MAINKEY').AsString := MainKey;
      DRTreiberQuery.Open;
    end else
    begin
      DrDrvCopyBtn.Enabled   := False;
      DrTreiberGrid.Visible  := False;
      DRTreiberQuery.Close;
    end;

    DrDrvDelBtn.Enabled    := DrDrvCopyBtn.Enabled;
    DrDrvExportBtn.Enabled := DrDrvCopyBtn.Enabled;
  end else
  begin
    PC1.ActivePage := DefaultTS;

    ValQuery.Close;
    ValQuery.Sql.Clear;
    ValQuery.SQL.Add('select * from REGISTRY');
    ValQuery.SQL.Add('where MAINKEY=''' + MainSqlKey + '''');
    ValQuery.SQL.Add('order by MAINKEY, NAME');
    ValQuery.Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.btnFormSaveClick(Sender: TObject);
var
  F: TextFile;
begin
  SaveDialog1.Filter := 'SQL-Script|*.sql';
  if SaveDialog1.Execute then
  begin
    AssignFile(F, SaveDialog1.Filename);
    if FileExists(SaveDialog1.Filename) then
    begin
      if FileExists(SaveDialog1.Filename + '.BAK') then
        DeleteFile(SaveDialog1.Filename + '.BAK');
      RenameFile(SaveDialog1.Filename, SaveDialog1.Filename + '.BAK');
    end;

    Rewrite(F);
    CloseFile(F);
    Append(F);
    try
      write(F, 'Insert into REGISTRY (MAINKEY, NAME, VAL_BLOB, VAL_TYP) Values (' +
        '''' + sqlStringToSQL(MainKey) + ''',' +
        '''' + sqlStringToSQL(ValQueryNAME.AsString) + ''',' +
        '''' + sqlStringToSQL(ValQueryVAL_BLOB.AsString) + ''',8)'
      );
    finally
      CloseFile (F);
    end;
  end;
end;

//------------------------------------------------------------------------------
//30.10.09-ud.
procedure TRegEdiForm.btnReportImportClick(Sender: TObject);
var
  Stream: TStream;
begin
  OpenDialog1.Filter :=
    _('Reportdateien')+' (*.frf)'+'|*.frf'+'|'+
    _('Alle Dateien')+' (*.*)'+'|*.*';
  OpenDialog1.DefaultExt := 'frf';
  OpenDialog1.InitialDir := DM1.FormularDir;

  if OpenDialog1.Execute then
  begin

    if ValQuery.FieldByName('VAL_BIN').IsBlob then
    begin
      Stream := TFileStream.Create(OpenDialog1.FileName, fmOpenRead or fmShareDenyWrite);
      try
        Stream.Position := 0;
        ValQuery.Edit;
        (ValQuery.FieldByName('VAL_BIN') as TBLOBField).LoadfromStream(Stream);
        //TBlobField(ValQuery.FieldByName('VAL_BIN')).LoadFromStream(Stream);
        ValQuery.Post;
      finally
        Stream.Free;
      end;
    end;

  end;
end;

//------------------------------------------------------------------------------
//07.11.09-ud.
procedure TRegEdiForm.btnReportExportClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
  SaveDialog1.Filter :=
    _('Reportdateien')+' (*.frf)'+'|*.frf'+'|'+
    _('Alle Dateien')+' (*.*)'+'|*.*';
  SaveDialog1.DefaultExt := 'frf';
  SaveDialog1.InitialDir := DM1.FormularDir;

  SaveDialog1.FileName := ValQuery.FieldByName('NAME').AsString;
  if SaveDialog1.Execute then
  begin
    Stream := TMemoryStream.Create;
    try
      (ValQuery.FieldByName('VAL_BIN') as TBlobField).SaveToStream(Stream);
      Stream.SaveToFile(SaveDialog1.FileName);
    finally
      Stream.Free;
    end;
  end;
  SaveDialog1.FileName := '';
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvNewBtnClick(Sender: TObject);
var
  TName: String;
  Node: TTreeNode;
begin
  TName := InputBox (_('Treiber neu'), _('Name'), '');
  if length(TName) = 0 then
    exit;

  with DM1.Uniquery do
  begin
    Close;
    SQL.Text := 'select MAINKEY, NAME from REGISTRY ' +
      'where MAINKEY LIKE "TREIBER\\\\BONDRUCKER\\\\%" ' +
      'group by MAINKEY order by MAINKEY';
    Open;
    if Locate ('MAINKEY', TName, [loCaseInsensitive]) then
    begin
      MessageDlg (_('Ein Treiber mit diesem Namen existiert bereits.'), mterror, [mbok], 0);
      TName := '';
    end;
    Close;
  end;

  if length(TName) = 0 then
    exit;

  // Name OK, jetzt Treiber anlegen
  MainKey := 'TREIBER\BONDRUCKER\' + TName;

  DM1.WriteString (MainKey, 'DEFAULT', TNAME);

  DM1.WriteString (MainKey, 'SCHUBLADE_AUF', '');
  DM1.WriteString (MainKey, 'BREIT_EIN', '');
  DM1.WriteString (MainKey, 'BREIT_AUS', '');
  DM1.WriteString (MainKey, 'UNTER_EIN', '');
  DM1.WriteString (MainKey, 'UNTER_AUS', '');
  DM1.WriteString (MainKey, 'ROT_EIN', '');
  DM1.WriteString (MainKey, 'ROT_AUS', '');
  DM1.WriteString (MainKey, 'INIT', '');
  DM1.WriteString (MainKey, 'ABSCHNEIDEN', '');
  DM1.WriteString (MainKey, 'HTAB', '');
  DM1.WriteString (MainKey, 'RLFEED', '');
  DM1.WriteString (MainKey, 'UMLAUT_GR_AE', 'Ä');
  DM1.WriteString (MainKey, 'UMLAUT_KL_AE', 'ä');
  DM1.WriteString (MainKey, 'UMLAUT_GR_OE', 'Ö');
  DM1.WriteString (MainKey, 'UMLAUT_KL_OE', 'ö');
  DM1.WriteString (MainKey, 'UMLAUT_GR_UE', 'Ü');
  DM1.WriteString (MainKey, 'UMLAUT_KL_UE', 'ü');
  DM1.WriteString (MainKey, 'UMLAUT_SS'   , 'ß');


  Node := TV.Items.AddChild(DruckerTreiberRootNode, TName);
  Node.Selected := True;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvCopyBtnClick(Sender: TObject);
var
  TName, OldMainKey: String;
  Node: TTreeNode;
  Count: Integer;
begin
  TName := DM1.ReadString (MainKey, 'DEFAULT', '');

  with DM1.Uniquery do
  begin
    Close;
    SQL.Text := 'select MAINKEY, NAME from REGISTRY ' +
      'where MAINKEY LIKE "TREIBER\\\\BONDRUCKER\\\\%" ' +
      'group by MAINKEY order by MAINKEY';
    Open;
    Count := 0;
    repeat
      inc(Count);
    until (Count > 100) or
          (Locate('MAINKEY', 'TREIBER\BONDRUCKER\' + TName + ' (' + IntToStr(Count) + ')', [loCaseInsensitive]) = False);
    Close;
  end;

  if Count > 100 then
    exit;

  TName := InputBox (_('Treiber kopieren'), _('Name'), TName + ' (' + IntToStr(Count) + ')');
  if length(TName) = 0 then
    exit;

  with DM1.Uniquery do
  begin
    Close;
    SQL.Text := 'select MAINKEY, NAME from REGISTRY ' +
      'where MAINKEY LIKE "TREIBER\\\\BONDRUCKER\\\\%" ' +
      'group by MAINKEY order by MAINKEY';
    Open;
    if Locate('MAINKEY', TName, [loCaseInsensitive]) then
    begin
      MessageDlg (_('Ein Treiber mit diesem Namen existiert bereits.'), mterror, [mbok], 0);
      TName := '';
    end;
    Close;
  end;

  if length(TName) = 0 then
    exit;

  // Name OK, jetzt Treiber anlegen

  OldMainKey := MainKey;

  MainKey := 'TREIBER\BONDRUCKER\' + TName;

  DM1.WriteString (MainKey, 'DEFAULT', TName);

  DM1.WriteString (MainKey, 'SCHUBLADE_AUF', '');
  DM1.WriteString (MainKey, 'BREIT_EIN', '');
  DM1.WriteString (MainKey, 'BREIT_AUS', '');
  DM1.WriteString (MainKey, 'UNTER_EIN', '');
  DM1.WriteString (MainKey, 'UNTER_AUS', '');
  DM1.WriteString (MainKey, 'ROT_EIN', '');
  DM1.WriteString (MainKey, 'ROT_AUS', '');
  DM1.WriteString (MainKey, 'INIT', '');
  DM1.WriteString (MainKey, 'ABSCHNEIDEN', '');

  DM1.WriteString (MainKey, 'HTAB', '');
  DM1.WriteString (MainKey, 'RLFEED', '');

  DM1.WriteString (MainKey, 'UMLAUT_GR_AE', 'Ä');
  DM1.WriteString (MainKey, 'UMLAUT_KL_AE', 'ä');
  DM1.WriteString (MainKey, 'UMLAUT_GR_OE', 'Ö');
  DM1.WriteString (MainKey, 'UMLAUT_KL_OE', 'ö');
  DM1.WriteString (MainKey, 'UMLAUT_GR_UE', 'Ü');
  DM1.WriteString (MainKey, 'UMLAUT_KL_UE', 'ü');
  DM1.WriteString (MainKey, 'UMLAUT_SS'   , 'ß');


  Node := TV.Items.AddChild(DruckerTreiberRootNode, TName);
  Node.Selected := True;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvDelBtnClick(Sender: TObject);
var
  TName: String;
begin
  TName := DM1.ReadString (MainKey, 'DEFAULT', '');

  if TName = '' then
    TName := Copy (MainKey, Length('TREIBER\BONDRUCKER\') + 1, $FFFF);

  if length(TName) = 0 then
    exit;

  if MessageDlg (Format(_('Wollen Sie den Druckertreiber' + #13#10 + '%s' + #13#10 +
      'wirklich löschen ?'), [TName]), mtwarning, [mbno, mbyes], 0) <> mrYes then
    exit;

  with DM1.Uniquery do
  begin
    Close;
    SQL.Text := 'DELETE from REGISTRY ' +
      'where MAINKEY LIKE "TREIBER\\\\BONDRUCKER\\\\' + TName + '" ';
    ExecSQL;
  end;

  DruckerTreiberNode.Free;
  DruckerTreiberRootNode.Parent.Selected := True;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvExportBtnClick(Sender: TObject);
var
  TName: String;
  Ini: TIniFile;
begin
  SaveDialog1.Filter := _('CAO-Druckertreiber') + '|*.drv.cao';
  SaveDialog1.DefaultExt := 'drv.cao';
  SaveDialog1.InitialDir := DM1.ExportDir;

  if SaveDialog1.Execute then
  begin
    TName := SaveDialog1.FileName;

    Ini := TIniFile.Create(TName);
    try
      Ini.WriteString ('HEADER', 'DESCRIPTION', 'CAO-PRINTER-DRIVER');
      Ini.WriteString ('HEADER', 'MODELL', DM1.ReadString (MainKey, 'DEFAULT', ''));
      Ini.WriteDate   ('HEADER', 'DATE', Now);

      Ini.WriteString ('DATA', 'SCHUBLADE_AUF', DM1.ReadString (MainKey, 'SCHUBLADE_AUF', ''));
      Ini.WriteString ('DATA', 'BREIT_EIN',     DM1.ReadString (MainKey, 'BREIT_EIN', ''));
      Ini.WriteString ('DATA', 'BREIT_AUS',     DM1.ReadString (MainKey, 'BREIT_AUS', ''));
      Ini.WriteString ('DATA', 'UNTER_EIN',     DM1.ReadString (MainKey, 'UNTER_EIN', ''));
      Ini.WriteString ('DATA', 'UNTER_AUS',     DM1.ReadString (MainKey, 'UNTER_AUS', ''));
      Ini.WriteString ('DATA', 'ROT_EIN',       DM1.ReadString (MainKey, 'ROT_EIN', ''));
      Ini.WriteString ('DATA', 'ROT_AUS',       DM1.ReadString (MainKey, 'ROT_AUS', ''));
      Ini.WriteString ('DATA', 'INIT',          DM1.ReadString (MainKey, 'INIT', ''));
      Ini.WriteString ('DATA', 'ABSCHNEIDEN',   DM1.ReadString (MainKey, 'ABSCHNEIDEN', ''));
      Ini.WriteString ('DATA', 'HTAB',          DM1.ReadString (MainKey, 'HTAB', ''));
      Ini.WriteString ('DATA', 'RLFEED',        DM1.ReadString (MainKey, 'RLFEED', ''));
      Ini.WriteString ('DATA', 'UMLAUT_GR_AE',  DM1.ReadString (MainKey, 'UMLAUT_GR_AE', 'Ä'));
      Ini.WriteString ('DATA', 'UMLAUT_KL_AE',  DM1.ReadString (MainKey, 'UMLAUT_KL_AE', 'ä'));
      Ini.WriteString ('DATA', 'UMLAUT_GR_OE',  DM1.ReadString (MainKey, 'UMLAUT_GR_OE', 'Ö'));
      Ini.WriteString ('DATA', 'UMLAUT_KL_OE',  DM1.ReadString (MainKey, 'UMLAUT_KL_OE', 'ö'));
      Ini.WriteString ('DATA', 'UMLAUT_GR_UE',  DM1.ReadString (MainKey, 'UMLAUT_GR_UE', 'Ü'));
      Ini.WriteString ('DATA', 'UMLAUT_KL_UE',  DM1.ReadString (MainKey, 'UMLAUT_KL_UE', 'ü'));
      Ini.WriteString ('DATA', 'UMLAUT_SS',     DM1.ReadString (MainKey, 'UMLAUT_SS'   , 'ß'));
    finally
      Ini.Free;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvImportBtnClick(Sender: TObject);
var
  Res: Boolean;
  TName,
  Desc,
  OldMainKey: String;
  Ini: TIniFile;
  Count: Integer;
  Node: TTreeNode;
begin
  Res := False;

  OpenDialog1.Filter := _('CAO-Druckertreiber') + '|*.drv.cao';
  OpenDialog1.DefaultExt := 'drv.cao';
  OpenDialog1.InitialDir := DM1.ImportDir;

  Res := OpenDialog1.Execute;

  TName := OpenDialog1.FileName;
  if (not Res) or (not Fileexists(TName)) then
    exit;


  Ini := tIniFile.Create(TName);
  try
    DESC := Ini.ReadString ('HEADER', 'DESCRIPTION', '@@@ERROR@@@');

    if Desc = 'CAO-PRINTER-DRIVER' then
    begin
      TName := Ini.ReadString ('HEADER', 'MODELL', 'neuer Treiber');

      with DM1.Uniquery do
      begin
        Close;
        SQL.Text := 'select MAINKEY, NAME from REGISTRY ' +
          'where MAINKEY LIKE "TREIBER\\\\BONDRUCKER\\\\%" ' +
          'group by MAINKEY order by MAINKEY';
        Open;
        Count := 0;

        if Locate ('MAINKEY', 'TREIBER\BONDRUCKER\' + TName, [loCaseInsensitive]) then
        begin
          repeat
            inc(Count);
          until (Count > 100) or
                (Locate ('MAINKEY', 'TREIBER\BONDRUCKER\' + TName + ' (' + IntToStr(Count) + ')',
                  [loCaseInsensitive]) = False);
          TName := TName + ' (' + IntToStr(Count) + ')'
        end;
        Close;
      end;

      if Count > 100 then
        exit;

      // Name OK, jetzt Treiber anlegen

      OldMainKey := MainKey;

      MainKey := 'TREIBER\BONDRUCKER\' + TName;

      DM1.WriteString (MainKey, 'DEFAULT', TName);

      DM1.WriteString (MainKey, 'SCHUBLADE_AUF', Ini.ReadString ('DATA', 'SCHUBLADE_AUF', ''));
      DM1.WriteString (MainKey, 'BREIT_EIN',    Ini.ReadString ('DATA', 'BREIT_EIN', ''));
      DM1.WriteString (MainKey, 'BREIT_AUS',    Ini.ReadString ('DATA', 'BREIT_AUS', ''));
      DM1.WriteString (MainKey, 'UNTER_EIN',    Ini.ReadString ('DATA', 'UNTER_EIN', ''));
      DM1.WriteString (MainKey, 'UNTER_AUS',    Ini.ReadString ('DATA', 'UNTER_AUS', ''));
      DM1.WriteString (MainKey, 'ROT_EIN',      Ini.ReadString ('DATA', 'ROT_EIN', ''));
      DM1.WriteString (MainKey, 'ROT_AUS',      Ini.ReadString ('DATA', 'ROT_AUS', ''));
      DM1.WriteString (MainKey, 'INIT',         Ini.ReadString ('DATA', 'INIT', ''));
      DM1.WriteString (MainKey, 'ABSCHNEIDEN',  Ini.ReadString ('DATA', 'ABSCHNEIDEN', ''));

      DM1.WriteString (MainKey, 'HTAB',         Ini.ReadString ('DATA', 'HTAB', ''));
      DM1.WriteString (MainKey, 'RLFEED',       Ini.ReadString ('DATA', 'RLFEED', ''));


      DM1.WriteString (MainKey, 'UMLAUT_GR_AE', Ini.ReadString ('DATA', 'UMLAUT_GR_AE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_KL_AE', Ini.ReadString ('DATA', 'UMLAUT_KL_AE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_GR_OE', Ini.ReadString ('DATA', 'UMLAUT_GR_OE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_KL_OE', Ini.ReadString ('DATA', 'UMLAUT_KL_OE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_GR_UE', Ini.ReadString ('DATA', 'UMLAUT_GR_UE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_KL_UE', Ini.ReadString ('DATA', 'UMLAUT_KL_UE', ''));
      DM1.WriteString (MainKey, 'UMLAUT_SS'   , Ini.ReadString ('DATA', 'UMLAUT_SS', ''));

      Node := TV.Items.AddChild(DruckerTreiberRootNode, TName);
      Node.Selected := True;
    end else
    begin
      MessageDlg (_('Diese Datei ist kein CAO-Druckertreiber.'),
      mterror, [mbok], 0);
    end;
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DRTreiberQueryNewRecord(DataSet: TDataSet);
begin
  DRTreiberQuery.Cancel;
  Abort;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrTreiberDSStateChange(Sender: TObject);
begin
  DrDrvSaveBtn.Enabled := DRTreiberQuery.State in [dsEdit, dsInsert];
  DrDrvAbortBtn.Enabled := DrDrvSaveBtn.Enabled;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvSaveBtnClick(Sender: TObject);
begin
  DRTreiberQuery.Post;
end;

//------------------------------------------------------------------------------
procedure TRegEdiForm.DrDrvAbortBtnClick(Sender: TObject);
begin
  DRTreiberQuery.Cancel;
end;

//------------------------------------------------------------------------------

end.

