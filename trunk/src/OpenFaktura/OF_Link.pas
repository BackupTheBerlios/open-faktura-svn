{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Universelles Modul, um Dateien jeglicher Art zu Artikel, Adressen }
{            und Vorgängen zuzuordnen                                          }
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
{ 11.10.2003 - Unit erstellt                                                   }
{ 03.02.2004 - Unit Variants für >=Delphi 6 integriert                         }
{ 10.07.2004 - Bugfix beim Starten von Dateien mit Leerzeichen im Dateinamen   }
{ 19.04.2004 - Bugfix beim Hinzufügen von Dateien, die bereits gelinkt sind    }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Link;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, ToolWin, ExtCtrls, JvComponentBase, JvDragDrop, ShellAPI,
  JvTypes;


{
uses
  ShellApi, JvTypes;
}

type
  TCaoDragDrop = class(TJvComponent)
  private
    FAcceptDrag: Boolean;
    FFiles: TStringList;
    FOnDrop: TJvDropEvent;  //16.10.09-ud. TDropEvent -> TJvDropEvent
    FIsHooked: Boolean;
    procedure DropFiles(Handle: HDROP);

    function WndProc(var Msg: TMessage): Boolean;
  protected
    procedure HookControl (Owner : tWinControl);
    procedure UnHookControl (Owner : tWinControl);
    procedure Loaded; override;
  public
    procedure SetAcceptDrag(Value: Boolean; Owner : tWinControl);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { (rb) Should be changed to TStrings }
    property Files: TStringList read FFiles;
  published
    //property AcceptDrag: Boolean read FAcceptDrag write SetAcceptDrag default True;
    property OnDrop: TJvDropEvent read FOnDrop write FOnDrop;  //16.10.09-ud.
  end;

  TLinkForm = class(TForm)
    MainPanel: TPanel;
    StatusBar1: TStatusBar;
    LinkTab: TZQuery;
    LinkDS: TDataSource;
    ImageList: TImageList;
    OpenDialog1: TOpenDialog;
    LinkTabPFAD: TStringField;
    LinkTabDATEI: TStringField;
    LinkTabMODUL_ID: TIntegerField;
    LinkTabREC_ID: TIntegerField;
    ToolBar1: TToolBar;
    AddBtn: TToolButton;
    DelBtn: TToolButton;
    ToolButton7: TToolButton;
    GrSymBtn: TToolButton;
    KLSymBtn: TToolButton;
    ListeBtn: TToolButton;
    DetailsBtn: TToolButton;
    LV1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure LinkTabAfterOpen(DataSet: TDataSet);
    procedure GrSymBtnClick(Sender: TObject);
    procedure KLSymBtnClick(Sender: TObject);
    procedure ListeBtnClick(Sender: TObject);
    procedure DetailsBtnClick(Sender: TObject);
    procedure LV1DblClick(Sender: TObject);
    procedure JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);  //16.10.09-ud. TStringList -> TStrings...
    procedure DelBtnClick(Sender: TObject);
    procedure LV1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LinkTabBeforePost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First       : Boolean;
    CaoDragDrop : TCaoDragDrop;
    FileInfo    : tshFileInfo; { unit ShellAPI }
    CurrOwner   : tWinControl;
    FCurrModul  : Integer;
    FCurrRecID  : Integer;
  public
    { Public-Deklarationen }
    procedure SetModul(ModulID, RecID: Integer; Sender: TObject);
    function  AddLink(ModulID, RecID: Integer; Datei: String; ShowError: Boolean=True): Boolean;
    function  DelLinks(ModulID, RecID: Integer): Boolean;

    property CurrModul: Integer Read FCurrModul;
    property CurrRecID: Integer Read FCurrRecID;
  end;

var
  LinkForm: TLinkForm;

implementation

uses
  JclFileUtils, JclDateTime, JvWndProcHook, GNUGetText, OF_Function,
  OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
constructor tCaoDragDrop.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAcceptDrag := True;
  FFiles := TStringList.Create;
  FIsHooked := False;
end;

//------------------------------------------------------------------------------
destructor tCaoDragDrop.Destroy;
begin
  FFiles.Free;
  UnHookControl(nil);
  inherited Destroy;
end;

//------------------------------------------------------------------------------
procedure tCaoDragDrop.SetAcceptDrag(Value: Boolean; Owner: tWinControl);
begin
  FAcceptDrag := Value;
  if [csDesigning, csLoading] * ComponentState <> [] then
    exit;

  if Owner is TWinControl then
  begin
    DragAcceptFiles(TWinControl(Owner).Handle, FAcceptDrag);
    if FAcceptDrag then
      HookControl (TWinControl(Owner))
    else
      UnHookControl (TWinControl(Owner));
  end;
end;

//------------------------------------------------------------------------------
function tCaoDragDrop.WndProc(var Msg: TMessage): boolean;
begin
  Result := (Msg.Msg=WM_DROPFILES);  //or(Msg.Msg=45075{4321});
  if Result then
    DropFiles(HDrop(Msg.wParam))
end;

//------------------------------------------------------------------------------
procedure tCaoDragDrop.DropFiles(Handle: HDROP);
var
  pszFileWithPath, pszFile: PChar;
  iFile, iStrLen, iTempLen: Integer;
  MousePt: TPoint;
  Count: Integer;
begin
  FFiles.Clear;
  iStrLen := 128;
  pszFileWithPath := StrAlloc(iStrLen);
  pszFile := StrAlloc(iStrLen);
  Count := DragQueryFile(Handle, $FFFFFFFF, pszFile, iStrLen);
  iFile := 0;
  while iFile < Count do
  begin
    iTempLen := DragQueryFile(Handle, iFile, nil, 0) + 1;
    if iTempLen > iStrLen then
    begin
      iStrLen := iTempLen;
      StrDispose(pszFileWithPath);
      pszFileWithPath := StrAlloc(iStrLen);
    end;
    DragQueryFile(Handle, iFile, pszFileWithPath, iStrLen);
    FFiles.Add(StrPas(pszFileWithPath));
    Inc(iFile);
  end;
  StrDispose(pszFileWithPath);
  if Assigned(FOnDrop) then
  begin
    DragQueryPoint(Handle, MousePt);
    FOnDrop(Self, MousePt, FFiles);
  end;
  DragFinish(Handle);
end;

//------------------------------------------------------------------------------
procedure tCaoDragDrop.Loaded;
begin
  inherited Loaded;
  SetAcceptDrag(FAcceptDrag, nil);
end;

//------------------------------------------------------------------------------
procedure tCaoDragDrop.HookControl (Owner : tWinControl);
begin
  if FIsHooked then Exit;

  if (Owner is TWinControl) and not (csDesigning in ComponentState) then
    FIsHooked := RegisterWndProcHook(TWinControl(Owner), WndProc, hoBeforeMsg);
end;

//------------------------------------------------------------------------------
procedure tCaoDragDrop.UnHookControl (Owner : tWinControl);
begin
  if not FIsHooked then 
    Exit;

  FIsHooked := False;

  if (Owner is TWinControl) and not (csDesigning in ComponentState) then
    UnRegisterWndProcHook(TWinControl(Owner), WndProc, hoBeforeMsg);
end;

//------------------------------------------------------------------------------
//
//
//
//
//
//------------------------------------------------------------------------------
procedure TLinkForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent(self);  
  except 
  end;

  First       := True;
  CaoDragDrop := nil;
  CurrOwner   := nil;
  {Get/set system-imagelist for small icons:}
  lv1.SmallImages        := TImageList.Create(Self);
  lv1.SmallImages.Handle := SHGetFileInfo('', 0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  lv1.SmallImages.ShareImages := True;

  lv1.LargeImages := TImageList.Create(Self);
  lv1.LargeImages.Handle := SHGetFileInfo('', 0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  lv1.LargeImages.ShareImages := True;

  CaoDragDrop := tCaoDragDrop.Create(self);
  CaoDragDrop.OnDrop := JvDragDrop1Drop;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.SetModul(ModulID, RecID: Integer; Sender: TObject);
begin
  if (FCurrModul = ModulID) and (FCurrRecID=RecID) then 
    exit;

  FCurrModul := ModulID;
  FCurrRecID := RecID;
  FormActivate(Sender);
  MainPanel.Invalidate;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.FormActivate(Sender: TObject);
begin
  if First then
  begin
    First := False;
    LV1.ViewStyle := TViewStyle(DM1.ReadIntegerU('', 'DATEI_LINK_ANSICHT', ord(vsIcon)));
  end;

  LinkTab.Close;
  LinkTab.ParamByName('MID').AsInteger := FCurrModul;
  LinkTab.ParamByName('RID').AsInteger := FCurrRecID;
  LinkTab.Open;

  CurrOwner := tWinControl(Sender);
  CaoDragDrop.SetAcceptDrag(True, tWinControl(Sender));
end;

//------------------------------------------------------------------------------
procedure TLinkForm.FormDeactivate(Sender: TObject);
begin
  LinkTab.Close;
  CaoDragDrop.SetAcceptDrag(False, CurrOwner);
  CurrOwner := nil;
  LV1.Items.Clear;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.AddBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    LinkTab.Append;
    LinkTabPfad.AsString := ExtractFilePath(OpenDialog1.FileName);
    LinkTabDatei.AsString := ExtractFileName(OpenDialog1.FileName);
    try
      LinkTab.Post;
    except
      LinkTab.Cancel;
      MessageDlg(_('Diese Datei ist bereits verlinkt.'), mterror, [mbok], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.LinkTabAfterOpen(DataSet: TDataSet);
var 
  NewItem: TListItem;
  T: TDateTime;
  P, D, S1: String;
  S: Int64;
begin
  LV1.Items.BeginUpdate;
  try
    LV1.Items.Clear;
    if LinkTab.RecordCount > 0 then
    begin
      LinkTab.First;
      while not LinkTab.Eof do
      begin
        P := PathAddSeparator(LinkTabPfad.AsString);
        D := LinkTabDatei.AsString;
        if not FileExists (P+D) then 
        begin 
          LinkTab.Next; 
          continue; 
        end;

        shGetFileInfo(PChar(P+D), {FILE_ATTRIBUTE_NORMAL}0, FileInfo,
                      SizeOf(FileInfo),
                      {SHGFI_TYPENAME Or SHGFI_USEFILEATTRIBUTES Or
                       SHGFI_SYSICONINDEX Or SHGFI_ICON}
                       SHGFI_SYSIconIndex or SHGFI_TYPENAME
        );

        NewItem := LV1.Items.Add;
        NewItem.Caption := D;
        NewItem.SubItems.Add(P);
        NewItem.ImageIndex := FileInfo.iIcon;

        //Größe
        S := GetSizeOfFile(P+D);

        if S<1024 then 
          S1 := FormatFloat(',#0" Byte"', S) 
        else
        if S < 1024*1024 then 
          S1 := FormatFloat(',#0.0" kB"', S / 1024) 
        else
        if S < 1024*1024*1024 then 
          S1 := FormatFloat(',#0.0" MB"', S / (1024*1024)) 
        else
          S1 := FormatFloat(',#0.00" GB"', S / (1024*1024*1024));
        NewItem.SubItems.Add(S1);

        //Typ
        NewItem.SubItems.Add(FileInfo.szTypeName);

        //Geändert
        T := FileTimeToDateTime(GetFileLastWrite(P+D));
        NewItem.SubItems.Add(FormatDateTime('dd.mm.yyyy hh:mm:ss', T));

        LinkTab.Next;
      end;
    end;
  finally
    LV1.Items.EndUpdate;
    LV1.Invalidate;
    LV1.Repaint;
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.GrSymBtnClick(Sender: TObject);
begin
  LV1.ViewStyle := vsIcon;
  DM1.WriteIntegerU('', 'DATEI_LINK_ANSICHT', ord(LV1.ViewStyle));
end;

//------------------------------------------------------------------------------
procedure TLinkForm.KLSymBtnClick(Sender: TObject);
begin
  LV1.ViewStyle := vsSmallIcon;
  DM1.WriteIntegerU('', 'DATEI_LINK_ANSICHT', ord(LV1.ViewStyle));
end;

//------------------------------------------------------------------------------
procedure TLinkForm.ListeBtnClick(Sender: TObject);
begin
  LV1.ViewStyle := vsList;
  DM1.WriteIntegerU('', 'DATEI_LINK_ANSICHT', ord(LV1.ViewStyle));
end;

//------------------------------------------------------------------------------
procedure TLinkForm.DetailsBtnClick(Sender: TObject);
begin
  LV1.ViewStyle := vsReport;
  DM1.WriteIntegerU('', 'DATEI_LINK_ANSICHT', ord(LV1.ViewStyle));
end;

//------------------------------------------------------------------------------
procedure TLinkForm.LV1DblClick(Sender: TObject);
var 
  Ext, Cmd, Name, Dir: String;
  Executable: array [0..500] of Char;
begin
  //in_progstart :=true;
  if LV1.ItemFocused = Nil then 
    exit;

  Name := LV1.ItemFocused.Caption;
  Dir := LV1.ItemFocused.SubItems[0];

  Cmd := '';

  //ist es ein Directory ???
  if DirectoryExists(Dir+Name) then
  begin
    Name := 'EXPLORER.EXE';
    CMD := Dir;
    Dir := '';
  end else
    if not FileExists(Dir+Name) then
    begin
      MessageDlg((_('Konnte Datei nicht finden, '+
                    'evt. wurde die Datei gelöscht.'+#13#10+
                    'Öffnen nicht möglich !')), mterror, [mbok], 0
      );
      exit;
    end;

  try
    Ext := '';
    if (length(Name) > 0) then 
      Ext := uppercase(ExtractFileExt(name));
    if ((ext = '.EXE') or (ext = '.COM')) then
    begin
      // Programm wurde angegeben
      if Pos(' ', CMD) > 0 then 
        CMD := '"'+CMD+'"';
      if Pos(' ', DIR) > 0 then 
        DIR := '"'+DIR+'"';

      DM1.StarteNewProgramm(Name, Cmd, Dir);
    end else
    begin
      cmd := name;
      name := '';

      // zugeordnete Programdatei suchen
      fillchar(Executable, sizeof(Executable), #32);
      Executable[0] := #0;
      if findexecutable(pchar(cmd+#0), pchar(dir), @executable) > 32 then
      begin
        //if Pos(' ',CMD) > 0 then CMD :='"'+CMD+'"'; CMD :=CMD+#0;
        //if Pos(' ',DIR)>0 then DIR :='"'+DIR+'"'; //DIR :=DIR+#0;

        //DM1.StarteNewProgramm (Executable, Cmd, Dir);
        DM1.StarteNewProgramm(Dir+CMD, '', '');
      end else 
        MessageDlg(_('Konnte kein Programm für diesen Dateityp finden.'), mterror, [mbok], 0);
    end;
  finally
    //in_progstart := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.JvDragDrop1Drop(Sender: TObject; Pos: TPoint; Value: TStrings);  //16.10.09-ud. TStringList -> TStrings...
var 
  i: Integer; 
  DN: String;
begin
  if Value.Count > 0 then
  begin
    for i := 0 to Value.Count-1 do
    begin
      DN := ExpandUNCFileName(Value[i]);

      LinkTab.Append;
      LinkTabPfad.AsString := ExtractFilePath(DN);
      LinkTabDatei.AsString := ExtractFileName(DN);
      try
        LinkTab.Post;
      except
        LinkTab.Cancel;
        MessageDlg(_('Diese Datei ist bereits verlinkt.'), mterror, [mbok], 0);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.DelBtnClick(Sender: TObject);
var 
  Name, Dir: String;
begin
  if LV1.ItemFocused = Nil then 
    exit;
  Name := LV1.ItemFocused.Caption;
  Dir := LV1.ItemFocused.SubItems[0];

  if LinkTab.Locate('PFAD;DATEI', VarArrayOf([Dir,Name]), []) then
  begin
    if MessageDlg(Format(_('Wollen Sie die Verknüpfung zu'+#13#10+
                           '%s wirklich löschen ?'),[Name]),mtconfirmation,
                           [mbyes, mbno], 0) = mryes then
    begin
      LinkTab.Delete;
      LV1.ItemFocused.Delete;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.LV1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then
  begin
    key := 0;
    DelBtnClick(Sender);
  end else
  if key = vk_insert then
  begin
    key := 0;
    AddBtnClick(Sender);
  end else
  if key = vk_return then
  begin
    key := 0;
    LV1DblClick(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TLinkForm.LinkTabBeforePost(DataSet: TDataSet);
begin
  LinkTabMODUL_ID.AsInteger := FCurrModul;
  LinkTabREC_ID.AsInteger := FCurrRecID;
end;

//------------------------------------------------------------------------------
function TLinkForm.AddLink (ModulID, RecID: Integer; Datei: String; ShowError: Boolean=True): Boolean;
var 
  DN: String;
begin
  Result := False;
  try
    DN := ExpandUNCFileName(Datei);

    with DM1.UniQuery do
    begin
      Sql.Text := 'INSERT INTO LINK SET ' +
                  'MODUL_ID=' + IntToStr(ModulID) + ',' +
                  'REC_ID=' + IntToStr(RecID) + ',' +
                  'PFAD=''' + sqlStringToSql(ExtractFilePath(DN)) + ''',' +
                  'DATEI=''' + sqlStringToSql(ExtractFileName(DN)) + '''';
      try
        ExecSql;
        Result := True;
      except
        //if ShowError
        // then MessageDlg (_('Diese Datei ist bereits verlinkt.'),
        //                  mterror,[mbok],0);
        Result := False;
      end;
    end;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function TLinkForm.DelLinks(ModulID, RecID: Integer): Boolean;
begin
  try
    with DM1.Uniquery do
    begin
      SQL.Text := 'DELETE FROM LINK '+
                  'WHERE MODUL_ID='+IntToStr(ModulID)+' '+
                  'AND REC_ID='+IntToStr(RecID);
      ExecSql;
      Close;
      SQL.Text := '';

      Result := True;
    end;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------

end.


SysUtils

{ QuotedStr returns the given string as a quoted string. A single quote
  character is inserted at the beginning and the end of the string, and
  for each single quote character in the string, another one is added. }

function QuotedStr(const S: string): string;

