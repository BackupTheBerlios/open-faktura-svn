{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zur Daten-Rücksicherung (SQL)                              }
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
{ - Dialog und Funktion fertigstellen                                          }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 03.05.2003 - Unit erstellt Jan Pokrandt                                      }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Restore;

interface

{$I OF.INC}
{$O-}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, JvExMask,
  JvToolEdit, JvExComCtrls, JvComCtrls, ZipMstr;

type
  TRestoreForm = class(TForm)
    TabNameLab: TLabel;
    ZipSizeLab: TLabel;
    Panel1: TPanel;
    PC1: TJvPageControl;
    BottomPan: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    SchrittULab: TLabel;
    SchrittTLab: TLabel;
    ZurueckBtn: TBitBtn;
    WeiterBtn: TBitBtn;
    CloseBtn: TBitBtn;
    JvFilenameEdit1: TJvFilenameEdit;
    EntpackLab: TLabel;
    PB3: TProgressBar;
    Label6: TLabel;
    Label1: TLabel;
    pb1: TProgressBar;
    AnalyseLab: TLabel;
    StartRestoreBtn: TBitBtn;
    HeaderMemo: TMemo;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RestoreTimeLab: TLabel;
    RestoreRemainLab: TLabel;
    RestoreFehlerLab: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure StartRestoreBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvFilenameEdit1AfterDialog(Sender: TObject; var Name: String; var Action: Boolean);
    procedure WeiterBtnClick(Sender: TObject);
    procedure ZurueckBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Zip: TZipMaster;
    ZipError: Boolean;
    ZIPTotalSize1,
    ZIPTotalProgress1,
    ZIPTotalSize2,
    ZIPTotalProgress2: Int64;
    Busy             : Boolean;
    RestoreFile      : String;
    RestoreFileZip   : String;
    SQLCount         : Integer;
    LogFileName      : String;
    procedure ZipProgress(Sender: TObject; ProgrType: ProgressType; Filename: String; FileSize: TProgressSize);
    procedure ZipMessage(Sender: TObject; ErrCode: Integer; Message: String);
    function UnpackRestoreFile (ZipFileName: String): Boolean;
    function AnalyzeRestoreFile: Boolean;
  public
    { Public-Deklarationen }
  end;

implementation

uses
  DB, ZExtra, FileCtrl, GNUGetText,
  OF_DM, OF_Logging, OF_Register;

{$R *.DFM}

resourcestring
  Schritt1U = 'Schritt 1 von 5 : Datei auswählen';
  Schritt1T = 'Bitte wählen Sie zunächst die zu verwendende ' +
  'Sicherungsdatei aus.' + #13#10 +
  'Nach erfolgreicher Auswahl klicken Sie auf den ' +
  'Button "Weiter".' + #13#10 +
  'Wenn es sich um eine koprimierte Sicherung handet, ' +
  'so wird diese im nächsten Schritt zunächst entpackt.';

  Schritt2U = 'Schritt 2 von 5 : Sicherungsdatei wird entpackt';
  Schritt2T = 'Dieser Vorgang kann je nach Leistungsfähigkeit ' +
  'Ihres PC''s eine Weile dauern...';

  Schritt3U = 'Schritt 3 von 5 : Analyse';
  Schritt3T = 'Sie sehen nun die Kopfzeilen der Sicherungsdatei, ' + #13#10 +
  'entscheiden Sie jetzt ob Sie diese Datei ' +
  'zurücksichern wollen.' + #13#10 +
  'Wenn Sie sicher sind klicken Sie auf "Weiter".';

  Schritt4U = 'Schritt 4 von 5 : Sicherungsdatei wird analysiert';
  Schritt4T = '';

  Schritt5U = 'Schritt 5 von 5 : Rücksicherung';
  Schritt5T = 'Wenn Sie auf den Button "Rücksicherung starten" ' +
  'klicken beginnt die eigentliche Rücksicherung.' + #13#10 +
  'Dieser Vorgang kann nicht abgebrochen werden !';

//------------------------------------------------------------------------------
procedure TRestoreForm.FormCreate(Sender: TObject);
begin
  Zip := TZipMaster.Create(self);

  try 
    TranslateComponent (self);  
  except 
  end;

  {
  if Screen.PixelsPerInch <> 96 then
  begin
  Self.ScaleBy (96, Screen.PixelsPerInch);
  Refresh;
  end;
  }
  ClientHeight := 280;
  BottomPan.Top := ClientHeight - BottomPan.Height;
  SchrittULab.Caption := Schritt1U;
  SchrittTLab.Caption := Schritt1T;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.FormShow(Sender: TObject);
var 
  D: String;
begin
  SchrittULab.Caption     := Schritt1U;
  SchrittTLab.Caption     := Schritt1T;
  PC1.ActivePageIndex     := 0;
  StartRestoreBtn.Visible := False;
  ZurueckBtn.Visible      := False;
  WeiterBtn.Visible       := True;
  WeiterBtn.Enabled       := False;
  WeiterBtn.Left          := 8;

  Zip.DLLDirectory        := ExtractFilePath(ParamStr(0));
  Busy                    := False;
  StartRestoreBtn.Enabled := False;
  ZipSizeLab.Caption      := '';
  PB3.Position            := 0;
  //ZipFileName.Caption     :='';

  d := dm1.BackupDir + dm1.AktMandant + '\';
  if not DirectoryExists (D) then
    D := ExtractFilePath(ParamStr(0));

  JvFilenameEdit1.FileName   := D;

  RestoreFile       := '';
  RestoreFileZip    := '';
  JvFilenameEdit1.Enabled := True;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not Busy;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.FormDestroy(Sender: TObject);
begin
  Zip.Free;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.ZipMessage(Sender: TObject; ErrCode: Integer; Message: String);
var 
  p: integer;
begin
  try
    P := Pos('ADDING:', Uppercase(Message));
    if P > 0 then 
      delete (Message, P, 8); Insert(_('zu ZIP hinzufügen:'), Message, P);

    if assigned(LogForm) then
      logform.addlog ('ZIP:ERR-CODE:' + Inttostr(ErrCode) + #13#10 + 'MLD:' + Message + #13#10);

    if ErrCode <> 0 then
      ZipError := True;
  except
  end;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.ZipProgress(Sender: TObject; ProgrType: ProgressType; Filename: String; FileSize: TProgressSize);
var
  Step: Integer;
begin
  case ProgrType of
    TotalSize2Process:
    begin
      ZIPTotalSize2     := FileSize;
      ZIPTotalProgress2 := 0;
    end;
    NewFile:
    begin
      PB3.Position      := 1;  // Current position of bar.
      ZIPTotalSize1     := FileSize;
      ZIPTotalProgress1 := 0;
    end;
    ProgressUpdate:
    begin
      // FileSize gives now the bytes processed since the last call.
      ZIPTotalProgress1 := ZIPTotalProgress1 + FileSize;
      ZIPTotalProgress2 := ZIPTotalProgress2 + FileSize;
      if ZIPTotalSize1 <> 0 then
      begin
        Step := Integer(Int64(ZIPTotalProgress1) *
                        Int64(10000) div Int64(ZipTotalSize1)
        );

        PB3.Position := 1 + Step;
      end else
        PB3.Position := 10001;
    end;
  end; // EOF Case
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.JvFilenameEdit1AfterDialog(Sender: TObject;
var
  Name: String;
  var Action: Boolean);
begin
  if FileExists (Name) then
  begin
    WeiterBtn.Enabled := True;
    RestoreFileZip    := Name;
  end
  else
    WeiterBtn.Enabled := False;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.WeiterBtnClick(Sender: TObject);
var
  OK : Boolean;
  TF : TextFile;
  I  : Integer;
  S, H: String;
  LF : TextFile;
  St : String;
begin
  WeiterBtn.Enabled := False;
  case PC1.ActivePage.PageIndex of
    0: begin
      LogFileName := DM1.LogDir + 'cao_restore_' +
        formatdatetime ('yyyy_mm_dd_hh_mm', Now) + '.log';
      if not Fileexists (LogFileName) then 
        FileClose(FileCreate (LogFileName));

      AssignFile(LF, LogFileName);
      Append (LF);
      try
        St := _('CAO-Datenrücksicherung') + ' ' + FormatDateTime ('dddd, dd.mm.yyyy hh.mm "' + _('Uhr') + '"', Now);
        Writeln (LF, St);
        Writeln (LF);
        St := _('ausgewählte Datei') + ' : ' + RestoreFileZip;
        Writeln (LF, St);
      finally
        CloseFile (LF);
      end;

      OK := False;
      WeiterBtn.Enabled   := False;

      JvFilenameEdit1.Enabled := False;
      if uppercase(ExtractFileExt (RestoreFileZip)) = '.ZIP' then
      begin
        SchrittULab.Caption := Schritt2U;
        SchrittTLab.Caption := Schritt2T;

        OK := UnpackRestoreFile (RestoreFileZip);
      end else
      if uppercase(ExtractFileExt (RestoreFileZip)) = '.SQL' then
      begin
        OK := True;
        RestoreFile := RestoreFileZip;
      end;

      if OK then
      begin
        // 5 zeilen einlesen
        AssignFile (TF, RestoreFile);
        try
          Reset (TF); 
          I := 0; 
          H := '';
          try
            while not Eof(TF) do
            begin
              Readln (TF, S); 
              h := h + S + #13#10;
              Inc(I);
              if I >= 10 then 
                Break;
            end;
          finally
            CloseFile (TF);
            if I < 10 then 
              OK := False; // weniger als 10 Zeilen
          end;

          HeaderMemo.Text := H;

        except
          //Fehler beim Öffnen
          OK := False;
        end;
      end;

      if OK then
      begin
        ZurueckBtn.Visible  := True;
        ZurueckBtn.Left     := 8;
        ZurueckBtn.Enabled  := True;
        WeiterBtn.Left      := 104;
        WeiterBtn.Visible   := True;
        WeiterBtn.Enabled   := True;
        PC1.ActivePageIndex := 1;
        AnalyseLab.Visible  := False;

        SchrittULab.Caption := Schritt3U;
        SchrittTLab.Caption := Schritt3T;
      end;

    end;
    1: begin
      SchrittULab.Caption := Schritt4U;
      SchrittTLab.Caption := Schritt4T;
      WeiterBtn.Enabled   := False;
      ZurueckBtn.Enabled  := False;

      OK := AnalyzeRestoreFile;

      ZurueckBtn.Enabled  := True;

      if OK then
      begin
        ZurueckBtn.Visible  := True;
        ZurueckBtn.Left     := 8;
        ZurueckBtn.Enabled  := True;
        WeiterBtn.Visible   := False;
        WeiterBtn.Enabled   := True;

        StartRestoreBtn.Visible := True;
        StartRestoreBtn.Enabled := True;

        PC1.ActivePageIndex := 2;

        SchrittULab.Caption := Schritt5U;
        SchrittTLab.Caption := Schritt5T;
      end;
    end;
  end;

  CloseBtn.Kind := bkCancel;
  CloseBtn.ModalResult := mrNone;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.ZurueckBtnClick(Sender: TObject);
begin
  if PC1.ActivePageIndex > 0 then 
    PC1.ActivePageIndex := PC1.ActivePageIndex-1;

  case PC1.ActivePageIndex of
    0: FormShow (Self);
    1: begin
      AnalyseLab.Visible := False;
      ZurueckBtn.Visible := True;
      ZurueckBtn.Left    := 8;
      ZurueckBtn.Enabled := True;

      WeiterBtn.Left     := 104;
      WeiterBtn.Visible  := True;
      WeiterBtn.Enabled  := True;

      StartRestoreBtn.Visible := False;
      StartRestoreBtn.Enabled := False;
    end;
  end;

  CloseBtn.Kind := bkCancel;
  CloseBtn.ModalResult := mrNone;
end;

//------------------------------------------------------------------------------
function TRestoreForm.UnpackRestoreFile(ZipFileName: String): Boolean;
var
  RPfad, RP, DN, E, St: String;
  NoSQLFile           : Boolean;
  ZDE                 : pZipDirEntry; //???
  LF                  : TextFile;
begin
  PB3.Visible := True;
  EntpackLab.Visible := True;

  Screen.Cursor := crHourGlass;

  AssignFile(LF, LogFileName);
  Append (LF);

  try
    Result := False;
    rpfad := dm1.maindir + 'Restore\';

    rp := DM1.Readstring ('MAIN\SICHERUNG', 'RESTORE_PFAD', '@@@');
    if rp = '@@@' then
      DM1.Writestring ('MAIN\SICHERUNG', 'RESTORE_PFAD', '')
    else
    if rp <> '' then
      rpfad := rp;

    ForceDirectories (RPfad);

    ZipError := False;

    zip.ZipFilename := JvFilenameEdit1.FileName;

    // Prüfen ob im Zip eine CAO-Datensicherung ist

    NoSqlFile := False;

    if (Zip.Count = 1) then
    begin
      ZDE := ZIP.DirEntry[0];
      DN  := uppercase(ZDE.FileName);

      if (Pos('CAO_BACKUP_', DN) <> 1) or
         (ExtractFileExt(DN) <> '.SQL') then
        NoSqlFile := True;

    end else
      NoSqlFile := True;

    if NoSqlFile then
    begin
      MessageDlg (_('Die angegebene Datei enthält keine CAO-Datensicherung.'),
      mterror, [mbok], 0);
      exit;
    end;

    // Pfad hinzufügen
    DN := RPfad + DN;

    if fileexists (DN) then
    begin
      if MessageDlg (Format(_('Die Datei "%s" existiert bereits, ' + #13#10 +
         'soll sie überschrieben werden ?'), [DN]),
         mtconfirmation, [mbyes, mbcancel], 0) <> mryes then
        exit;

      if not DeleteFile (DN) then  // Abbruch, wenn Datei nicht gelöscht werden kann
        exit;
    end;

    St := _('entpacke Datei') + '    : ' + DN;
    Writeln (LF, St);
    St := _('Start Entpacken') + '   : ' + FormatDateTime ('hh:mm "Uhr"', Now);
    Writeln (LF, St);

    Zip.ExtrBaseDir := RPfad;
    zip.ExtrOptions := [ExtrOverWrite];
    zip.FSpecArgs.Clear;
    zip.FSpecArgs.Add ('CAO_backup_*.sql');

    if rpfad[length(rpfad)]<>'\' then
      rpfad := rpfad + '\';

    try
      Zip.Extract;
    except
      ZipError := True;
    end;

    St := _('Ende') + '  ' + _('Entpacken') + '   : ' + FormatDateTime ('hh:mm "' + _('Uhr') + '"', Now);
    Writeln (LF, St);

    if ZipError then
    begin
      E := _('Beim Entpacken der Datensicherung ist ein ' +
        'Fehler aufgetreten.' + #13#10 +
        'Aus Sicherheitsgründen wurde die Rücksicherung abgebrochen !');

      Writeln (LF, E);

      MessageDlg (E, mterror, [mbok], 0);
      Exit;
    end;

    RestoreFile := DN;
    Result := True;
  finally
    Screen.Cursor := crDefault;
    CloseFile (LF);
  end;
end;

//------------------------------------------------------------------------------
function TRestoreForm.AnalyzeRestoreFile: Boolean;
var
  TF   : TextFile;
  SQL, S: String;
  I    : Integer;
begin
  Result := False;
  Screen.Cursor := crHourGlass;
  AnalyseLab.Visible := True;
  I := 0;
  try
    AssignFile (TF, RestoreFile);
    try
      Reset (TF);

      SQLCount   := 0;
      SQL := '';
      try
        while not Eof(TF) do
        begin
          Readln (TF, S);

          SQL := SQL + S;
          if (length(SQL) > 0) and (S[length(S)] = ';') then
          begin
            // SQL ausführen

            inc(SQLCount);

            inc(i);
            if (I > 500) or (length(SQL) > 100000) then
            begin
              AnalyseLab.Caption := _('Analysiere Zeile') + ' : ' + IntToStr(SQLCount) + '.';
              I := 0;
              Application.ProcessMessages;
            end;
            SQL := '';
          end;
        end;

        if length(SQL) > 0 then
        begin
          // le. SQL ausführen
          inc(SQLCount);
          AnalyseLab.Caption := _('Analysiere Zeile') + ' : ' + IntToStr(SQLCount) + '.';
        end;
      finally
        CloseFile (TF);
        Result := True;
      end;
    except
      //Fehler beim Öffnen
      Result := False;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

//------------------------------------------------------------------------------
procedure TRestoreForm.StartRestoreBtnClick(Sender: TObject);
var
  DSTab       : Array of Boolean;
  I, J, Error   : Integer;
  SQL, SQL2, S: String;
  TF          : TextFile;

  Start       : tDateTime;
  TC          : DWord;
  LF          : TextFile;
  St, Mi, Se, Ms : Word;
  Str         : String;

begin
  DM1.RestoreRun := True;

  Screen.Cursor := crSqlWait;
  ZurueckBtn.Enabled := False;
  StartRestoreBtn.Enabled := False;
  Start := Now;
  AssignFile(LF, LogFileName);
  Append (LF);
  try
    // offene Datasets merken
    { TODO : Funktion neu aufbauen... }
    (*
    //17.10.09-ud.
    // DatasetCount gibt es so nicht mehr.

    setlength(DSTab, DM1.DB1.DatasetCount);
    for i := 0 to DM1.DB1.DatasetCount-1 do
    begin
      DSTab[i] := tDataset(DM1.DB1.Datasets[i]).Active;
      tDataset(DM1.DB1.Datasets[i]).Close;
    end;
    *)

    // Tabellen umbenennen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Clear;
    DM1.UniQuery.SQL.Add ('FLUSH TABLES');
    DM1.UniQuery.ExecSql;

    //evt. alte Backups löschen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Text := 'show Tables from `' + DM1.DB1.Database + '`';
    DM1.UniQuery.Open;

    while not DM1.UniQuery.Eof do
    begin
      S := DM1.UniQuery.FieldByName ('Tables_In_' + DM1.DB1.Database).AsString;
      if Pos('BACK_', UpperCase(S)) = 1 then
      begin
        if length(SQL) > 0 then
          SQL := SQL + ',';
        SQL := SQL + S;
      end;
      DM1.UniQuery.Next;
    end;

    // alte Backups löschen
    if length(SQL) > 0 then
    begin
      SQL := 'DROP TABLE IF EXISTS ' + SQL;
      DM1.UniQuery.Close;
      DM1.UniQuery.Sql.Text := SQL;
      DM1.UniQuery.ExecSql;
    end;

    // alle Tabellen in BACK_.... unbenennen
    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Text := 'show Tables from `' + DM1.DB1.Database + '`';
    DM1.UniQuery.Open;

    Sql := ''; SQL2 := '';


    S := _('Folgede existierende Tabellen wurden umbenannt') + ' : ' + SQL;
    Writeln (LF, S);

    while not DM1.UniQuery.Eof do
    begin
      S := DM1.UniQuery.FieldByName ('Tables_In_' + DM1.DB1.Database).AsString;

      if length(SQL) > 0 then
        SQL := SQL + ',';
      SQL := SQL + S + ' TO `BACK_' + S + '`';

      if length(SQL2)>0 then SQL2 := SQL2 + ',';
      SQL2 := SQL2 + S;

      DM1.UniQuery.Next;

      Writeln (LF, '- ' + S + ' -> ' + 'BACK_' + S);
    end;

    if length(SQL) > 0 then
    begin
      SQL := 'RENAME TABLE ' + SQL;
      DM1.UniQuery.Close;
      DM1.UniQuery.Sql.Text := SQL;
      DM1.UniQuery.ExecSql;
    end;

    Writeln (LF);
    S := _('Start Rücksicherung') + ' : ' + FormatDateTime ('hh:mm "Uhr"', Now);
    Writeln (LF, S);


    pb1.Max      := SQLCount;
    pb1.Position := 0;
    Error        := 0;
    J            := 0;

    DM1.SQLLog   := False;
    AssignFile (TF, RestoreFile);
    try
      Reset (TF); I := 0;
      SQL := '';
      try
        while not Eof(TF) do
        begin
          Readln (TF, S);
          if length(SQL) > 0 then
            SQL := SQL + #13;
          SQL := SQL + S;
          if (length(SQL) > 0) and (S[length(S)] = ';') then
          begin
            inc(I);

            // SQL ausführen
            DM1.ZBatchSql1.Script.Text := SQL;
            try
              DM1.ZBatchSql1.Execute;
            except
              on E: Exception do
              begin
                inc(Error);
                writeln (LF);

                Str := _('Fehler') + '  : ' + IntTostr(Error) + #13#10 +
                  _('SQL') + '     : ' + SQL + #13#10 +
                  _('Meldung') + ' : ' + E.Message + #13#10;

                writeln (LF, Str);
              end;
            end;

            SQL := '';

            inc(J);
            if (J > 50) or (GetTickCount < TC) or (GetTickCount > TC + 1000) then
            begin
              PB1.Position := I;
              TC := GetTickCount;
              J := 0;

              RestoreTimeLab.Caption := FormatDateTime ('h "Stunden," m "Minuten und "s "Sekunden"', Now - Start);

              if I > 500 then
              begin
                DecodeTime(((Now - Start) / I) * (SQLCount - I), St, Mi, Se, Ms);

                Mi := St * 60 + Mi;

                if Mi > 1 then
                  RestoreRemainLab.Caption := 'ca. ' + IntToStr(Mi + 1) + ' ' + _('Minuten')
                else
                  RestoreRemainLab.Caption := _('weniger als eine Minute');

                RestoreFehlerLab.Caption := FormatFloat ('0;0;"keine"', Error);
              end;

              Application.ProcessMessages;
            end;
          end;
        end;

        if length(SQL) > 0 then
        begin
          // le. SQL ausführen
          DM1.ZBatchSql1.Script.Text := SQL;
          try
            DM1.ZBatchSql1.Execute;
          except
            on E: Exception do
            begin
              inc(Error);
              writeln (LF);

              Str := _('Fehler') + '  : ' + IntTostr(Error) + #13#10 +
                _('SQL') + '     : ' + SQL + #13#10 +
                _('Meldung') + ' : ' + E.Message + #13#10;

              writeln (LF, Str);
              writeln (LF);
            end;
          end;
          inc(I);  PB1.Position := I;
        end;

      finally
        CloseFile (TF);
      end;
    except
      //Fehler beim Öffnen
    end;

    RestoreRemainLab.Caption := '-';

    Str := _('Ende Rücksicherung') + '  : ' + FormatDateTime ('hh:mm "' + _('Uhr') + '"', Now);
    Writeln (LF, Str);

    DM1.OpenMandant (DM1.AktMandant, Application.Name, True);

    // offene Datasets erneut öffnen
    { TODO : Funktion neu aufbauen... }
    (*
    //17.10.09-ud.
    // DatasetCount gibt es so nicht mehr.

    for i := 0 to DM1.DB1.DatasetCount-1 do
    begin
      if DSTab[i] then tDataset(DM1.DB1.Datasets[i]).Open;
    end;
    *)

  finally
    CheckRegister2;

    DM1.RestoreRun := False;
    Screen.Cursor := crDefault;
    CloseBtn.Kind := bkClose;
    CloseBtn.ModalResult := mrNone;
    DM1.SQLLog := True;
    CloseFile (LF);
  end;
  MessageDlg (_('Rücksicherung abgeschlossen !!!'), mtinformation, [mbok], 0);
end;

//------------------------------------------------------------------------------

end.

//------------------------------------------------------------------------------

