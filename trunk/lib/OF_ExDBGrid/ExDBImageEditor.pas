{
ExDBGrid Component Suite Version 3.9 - ExDBImageEditor

Copyright (©) 2001 by Frederic Leneuf-magaud
Changes are copyright (©) 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExDBImageEditor;

interface

uses
   Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, ExtDlgs, Buttons, ComCtrls,
   ToolWin, DB, DBCtrls, {$IFDEF JEDI}JvJclUtils{$ELSE}FileUtil{$ENDIF};

type
   TImageEditButtons = (ibImport, ibEdit, ibEditWith, ibExport);
   TIEButtonsSet = set of TImageEditButtons;

   
   {$IFDEF EX_COMPILER_5_UP}
   TExDBImageEditor = class(TFrame)
      {$ELSE}
   TExDBImageEditor = class(TForm)
      {$ENDIF}
   //TExDBImageEditor = class(TFrame)
      DBImage: TDBImage;
      ToolBar: TToolBar;
      SB_Import: TSpeedButton;
      SB_Edit: TSpeedButton;
      SB_EditWith: TSpeedButton;
      SB_Export: TSpeedButton;
      procedure DBImageClick(Sender: TObject);
      procedure ToolBarClick(Sender: TObject);
      procedure SB_ImportClick(Sender: TObject);
      procedure SB_EditClick(Sender: TObject);
      procedure SB_EditWithClick(Sender: TObject);
      procedure SB_ExportClick(Sender: TObject);
   private
      FImageLink: TFieldDataLink;
      FButtons: TIEButtonsSet;
      FPaintProgram: string;
      FWaitBeforeUpdate: Boolean;
      FCanRevert: Boolean;
      FPicSaved: Boolean;
      FOriginalPic: string;
      function GetDataSource: TDataSource;
      procedure SetDataSource(Value: TDataSource);
      function GetDataField: string;
      procedure SetDataField(Value: string);
      procedure SetButtons(Value: TIEButtonsSet);
      procedure ActiveChange(Sender: TObject);
      procedure SetPaintProgram(Value: string);
      procedure SetWaitBeforeUpdate(Value: Boolean);
      procedure SetCanRevert(Value: Boolean);
      procedure DataChange(Sender: TObject);
      procedure SaveOriginalPic;
      procedure WMChar(var Msg: TWMChar); message WM_CHAR;
   protected
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function Execute(const Command, Path: string): Boolean;
      function GetUniqueFileName(const Prefix, Extension: string): string;
   published
      property DataSource: TDataSource read GetDataSource write SetDataSource;
      property DataField: string read GetDataField write SetDataField;
      property Buttons: TIEButtonsSet read FButtons write SetButtons;
      property PaintProgram: string read FPaintProgram write SetPaintProgram;
      property WaitBeforeUpdate: Boolean read FWaitBeforeUpdate write SetWaitBeforeUpdate default True;
      property CanRevert: Boolean read FCanRevert write SetCanRevert default True;
   end;

const
   {$IFDEF ENGLISH}
   lsError = 'Error';
   lsChooseBefore = 'Please Choose A Paint Program Before Editing.';
   lsChoosePaintProgram = 'Select A Paint Program...';
   lsChooseImage = 'Select A Picture...';
   lsDefaultFilter = 'All Files (*.*)|*.*';
   lsBMPFilter = 'Bitmap Images (*.bmp)|*.bmp';
   lsEXEFilter = 'Executable Files (*.exe)|*.exe';
   lsWaitBeforeUpdate = 'Do you want to display a waiting message before every update?';
   lsWaiting = 'Waiting...';
   {$ENDIF}

   {$IFDEF GERMAN}
   lsError = 'Fehler';
   lsChooseBefore = 'Please Choose A Paint Program Before Editing.';
   lsChoosePaintProgram = 'Select A Paint Program...';
   lsChooseImage = 'Bitte wählen Sie ein Bild aus ...';
   lsDefaultFilter = 'Alle Dateien (*.*)|*.*';
   lsBMPFilter = 'Bitmap Dateien (*.bmp)|*.bmp';
   lsEXEFilter = 'ausführbare Dateien (*.exe)|*.exe';
   lsWaitBeforeUpdate = 'Do you want to display a waiting message before every update?';
   lsWaiting = 'Warte...';
   {$ENDIF}

   {$IFDEF FRENCH}
   lsError = 'Erreur';
   lsChooseBefore = 'Veuillez choisir un programme de dessin avant d''éditer l''image.';
   lsChoosePaintProgram = 'Sélectionnez un programme de dessin...';
   lsChooseImage = 'Sélectionnez une image bitmap...';
   lsDefaultFilter = 'Tous les fichiers (*.*)|*.*';
   lsBMPFilter = 'Images bitmap (*.bmp)|*.bmp';
   lsEXEFilter = 'Programmes exécutables (*.exe)|*.exe';
   lsWaitBeforeUpdate = 'Voulez-vous afficher un message d''attente avant chaque mise à jour?';
   lsWaiting = 'En attente...';
   {$ENDIF}

implementation

{$R *.DFM}

constructor TExDBImageEditor.Create(AOwner: TComponent);
begin
   inherited;
   FImageLink := TFieldDataLink.Create;
   FImageLink.Control := Self;
   FImageLink.OnActiveChange := ActiveChange;
   FImageLink.OnDataChange := DataChange;
   FButtons := [ibImport, ibEdit, ibEditWith, ibExport];
   FPaintProgram := '';
   FWaitBeforeUpdate := True;
   FCanRevert := True;
   FPicSaved := False;
   FOriginalPic := '';
end;

destructor TExDBImageEditor.Destroy;
begin
   FImageLink.Control := nil;
   FImageLink.Free;
   FImageLink := nil;
   inherited;
end;

function TExDBImageEditor.GetDataSource: TDataSource;
begin
   if DBImage <> nil then
      Result := DBImage.DataSource
   else
      Result := nil;
end;

procedure TExDBImageEditor.SetDataSource(Value: TDataSource);
begin
   if DBImage <> nil then
      DBImage.DataSource := Value;
   if FImageLink <> nil then
      FImageLink.DataSource := Value;
end;

function TExDBImageEditor.GetDataField: string;
begin
   if DBImage <> nil then
      Result := DBImage.DataField
   else
      Result := '';
end;

procedure TExDBImageEditor.SetDataField(Value: string);
begin
   if DBImage <> nil then
      DBImage.DataField := Value;
   if FImageLink <> nil then
      begin
         FImageLink.FieldName := Value;
         ActiveChange(Self);
      end;
end;

procedure TExDBImageEditor.SetButtons(Value: TIEButtonsSet);
begin
   FButtons := Value;
   if not SB_Edit.Visible and (ibEditWith in FButtons) then
      FButtons := FButtons + [ibEdit];
   if not (ibEdit in FButtons) then
      FButtons := FButtons - [ibEditWith];
   SB_Import.Visible := (ibImport in FButtons);
   SB_Edit.Visible := (ibEdit in FButtons);
   SB_EditWith.Visible := (ibEditWith in FButtons);
   SB_Export.Visible := (ibExport in FButtons);
end;

procedure TExDBImageEditor.ActiveChange(Sender: TObject);
begin
   if FImageLink.Active then
      begin
         SB_Import.Enabled := FImageLink.CanModify;
         SB_Edit.Enabled := FImageLink.CanModify;
         SB_EditWith.Enabled := SB_Edit.Enabled;
         SB_Export.Enabled := FImageLink.Field <> nil;
      end
   else
      begin
         SB_Import.Enabled := False;
         SB_Edit.Enabled := False;
         SB_EditWith.Enabled := False;
         SB_Export.Enabled := False;
      end;
end;

procedure TExDBImageEditor.SetPaintProgram(Value: string);
begin
   if FPaintProgram <> Value then
      FPaintProgram := Value;
end;

procedure TExDBImageEditor.SetWaitBeforeUpdate(Value: Boolean);
begin
   if FWaitBeforeUpdate <> Value then
      FWaitBeforeUpdate := Value;
end;

procedure TExDBImageEditor.SetCanRevert(Value: Boolean);
begin
   if FCanRevert <> Value then
      FCanRevert := Value;
end;

procedure TExDBImageEditor.DataChange(Sender: TObject);
begin
   if Assigned(DBImage.DataSource) and (DBImage.DataSource.State = dsBrowse) then
      FPicSaved := False;
end;

procedure TExDBImageEditor.SaveOriginalPic;
begin
   if FCanRevert then
      begin
         if (DBImage.Field <> nil) and (DBImage.Field is TBlobField) then
            FOriginalPic := DBImage.Field.AsString
         else
            FOriginalPic := '';
         FPicSaved := True;
      end;
end;

procedure TExDBImageEditor.WMChar(var Msg: TWMChar);
begin
   if (Char(Msg.CharCode) = #27) and FCanRevert and FPicSaved then
      begin
         if (DBImage.Field <> nil) and (DBImage.Field is TBlobField) then
            begin
               DBImage.Field.AsString := FOriginalPic;
               FPicSaved := False;
            end;
      end;
   inherited;
end;

procedure TExDBImageEditor.DBImageClick(Sender: TObject);
begin
   if Visible then
      SetFocus;
end;

procedure TExDBImageEditor.ToolBarClick(Sender: TObject);
begin
   if Visible then
      SetFocus;
end;

procedure TExDBImageEditor.SB_ImportClick(Sender: TObject);
var
   FileOpen: TOpenPictureDialog;
begin
   if Visible then
      SetFocus;
   if (DBImage.DataSource.DataSet = nil) or not DBImage.DataSource.DataSet.Active then
      Exit;
   FileOpen := TOpenPictureDialog.Create(Self);
   try
      with FileOpen do
         begin
            Title := lsChooseImage;
            Filename := '';
            InitialDir := '';
            Filter := lsBMPFilter + '|' + lsDefaultFilter;
            Options := Options + [ofHideReadOnly, ofPathMustExist, ofFileMustExist];
         end;
      if FileOpen.Execute then
         begin
            SaveOriginalPic;
            DBImage.DataSource.Edit;
            DBImage.Picture.LoadFromFile(FileOpen.FileName);
            DBImage.Field.Assign(DBImage.Picture);
         end;
   finally
      FileOpen.Free;
   end;
end;

function TExDBImageEditor.Execute(const Command, Path: string): Boolean;
var
   StartupInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
   Result := False;
   FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
   with StartupInfo do
      begin
         cb := SizeOf(TStartupInfo);
         dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
         wShowWindow := SW_SHOWNORMAL;
      end;
   if not CreateProcess(nil, PChar(Command), nil, nil, False, NORMAL_PRIORITY_CLASS,
      nil, PChar(Path), StartupInfo, ProcessInfo) then
      Exit;
   with ProcessInfo do
      begin
         WaitForInputIdle(hProcess, INFINITE);
         WaitForSingleObject(hProcess, INFINITE);
         CloseHandle(hThread);
         CloseHandle(hProcess);
      end;
   Result := True;
end;

function TExDBImageEditor.GetUniqueFileName(const Prefix, Extension: string): string;
var
   CalcSuffix: string;
begin
   repeat
      CalcSuffix := IntToHex(GetTickCount, 4);
      Result := Prefix + CalcSuffix + Extension;
   until not FileExists(Result);
end;

procedure TExDBImageEditor.SB_EditClick(Sender: TObject);
var
   TempImg: string;
begin
   if Visible then
      SetFocus;
   if (DBImage.DataSource.DataSet = nil) or not DBImage.DataSource.DataSet.Active then
      Exit;
   FPaintProgram := Trim(FPaintProgram);
   if FPaintProgram = '' then
      begin
         Application.MessageBox(lsChooseBefore, lsError, MB_ICONWARNING);
         Exit;
      end;
   TempImg := GetUniqueFileName('~T', '.BMP');
   TempImg := GetTempDir + TempImg;
   Screen.Cursor := crHourGlass;
   try
      DBImage.Picture.SaveToFile(TempImg);
      if Execute('"' + FPaintProgram + '" "' + TempImg + '"', ExtractFilePath(FPaintProgram)) then
         begin
            if FWaitBeforeUpdate then
               Application.MessageBox(lsWaiting, PChar(ExtractFileName(TempImg)), MB_OK);
            SaveOriginalPic;
            DBImage.DataSource.Edit;
            DBImage.Picture.LoadFromFile(TempImg);
            DBImage.Field.Assign(DBImage.Picture);
         end;
   finally
      DeleteFile(TempImg);
      Screen.Cursor := crDefault;
   end;
   Application.BringToFront;
   if Visible then
      SetFocus;
end;

procedure TExDBImageEditor.SB_EditWithClick(Sender: TObject);
var
   FileOpen: TOpenDialog;
begin
   if Visible then
      SetFocus;
   FileOpen := TOpenDialog.Create(Self);
   try
      with FileOpen do
         begin
            Title := lsChoosePaintProgram;
            Filename := FPaintProgram;
            InitialDir := ExtractFilePath(FPaintProgram);
            Filter := lsEXEFilter + '|' + lsDefaultFilter;
            Options := Options + [ofHideReadOnly, ofPathMustExist, ofFileMustExist];
         end;
      if FileOpen.Execute then
         begin
            SetPaintProgram(FileOpen.FileName);
            SetWaitBeforeUpdate(Application.MessageBox(lsWaitBeforeUpdate,
               PChar(ExtractFileName(FileOpen.FileName)), MB_ICONQUESTION + MB_YESNO) = ID_YES);
         end;
   finally
      FileOpen.Free;
   end;
end;

procedure TExDBImageEditor.SB_ExportClick(Sender: TObject);
var
   FileSave: TSavePictureDialog;
begin
   if Visible then
      SetFocus;
   if (DBImage.DataSource.DataSet = nil) or not DBImage.DataSource.DataSet.Active then
      Exit;
   FileSave := TSavePictureDialog.Create(Self);
   try
      with FileSave do
         begin
            Title := '';
            Filename := '';
            InitialDir := '';
            DefaultExt := 'BMP';
            Filter := lsBMPFilter + '|' + lsDefaultFilter;
            Options := Options + [ofHideReadOnly, ofNoReadOnlyReturn, ofOverwritePrompt];
         end;
      if FileSave.Execute then
         begin
            DBImage.Picture.SaveToFile(FileSave.FileName);
         end;
   finally
      FileSave.Free;
   end;
end;

end.

