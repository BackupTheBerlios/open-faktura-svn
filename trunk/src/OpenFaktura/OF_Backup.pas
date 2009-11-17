{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zur Erstellung eines Backup-Scriptes (SQL)                 }
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
{ 13.01.2003 - Version 1.1.1.6 released Jan Pokrandt }
{ 14.09.2003 - Beim Einlesen der Tabellendaten werden jetzt jeweils max. 1.000 }
{              Datensätze zugleich angefordert (verringert Speichernutzung) }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 09.04.2005 - Tabellen, die mit "BACK_" beginnen werden nicht mitgesichert }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Backup;

interface

{$I OF.INC}
{$O-}

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, Buttons, ZipMstr;

type
  TBackupForm = class(TForm)
    StartBackupBtn: TBitBtn;
    pb1: TProgressBar;
    Label1: TLabel;
    TabNameLab: TLabel;
    PB3: TProgressBar;
    Label3: TLabel;
    ZipSizeLab: TLabel;
    CloseBtn: TBitBtn;
    Label4: TLabel;
    ZipFileName: TLabel;
    BackupPLZBLZ: TCheckBox;
    Label5: TLabel;
    ZipPfad: TLabel;
    procedure StartBackupBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ZipError: Boolean;
    ZIPTotalSize1,
    ZIPTotalProgress1,
    ZIPTotalSize2,
    ZIPTotalProgress2: Int64;
    Busy: Boolean;
    procedure ZipProgress(Sender: TObject; ProgrType: ProgressType; Filename: String; FileSize: TProgressSize);
    procedure ZipMessage(Sender: TObject; ErrCode: Integer;  Message: String);
  public
    Zip: TZipMaster; //???
  end;

//var
//  BackupForm: TBackupForm;

implementation

uses
  DB, FileCtrl, GNUGetText,
  OF_DM, OF_Function, OF_Logging;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TBackupForm.FormCreate(Sender: TObject);
begin
  Zip := TZipMaster.Create(self);

  try
    TranslateComponent (self);
  except
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.FormShow(Sender: TObject);
begin
  Zip.DLLDirectory       := ExtractFilePath(ParamStr(0));
  Busy                   := False;
  StartBackupBtn.Enabled := True;
  ZipSizeLab.Caption     := '';
  PB3.Position           := 0;
  ZipFileName.Caption    := '';

  Zip.OnProgress := ZipProgress;
  Zip.OnMessage := ZipMessage;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.FormCloseQuery(Sender: TObject;
var
  CanClose: Boolean);
begin
  CanClose := not Busy;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.FormDestroy(Sender: TObject);
begin
  Zip.Free;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.StartBackupBtnClick(Sender: TObject);
var
  s , tab, lastkey, ks, d: string;
  i, row, maxrow: integer;
  F: TextFile; fn: string;
begin
  Busy := True;
  screen.cursor := crSqlWait;
  try
    fn := dm1.BackupDir + dm1.AktMandant + '\';
    ForceDirectories(FN);

    fn := fn + application.name + '_backup_' +
    formatdatetime('yyyy_mm_dd_hh_mm', now) + '.sql';

    ZipFileName.Caption := extractfilename(fn);
    ZipPfad.Caption     := extractfilepath(fn);

    assignfile(F, fn);
    rewrite(F);
    closefile(F);
    append(F);

    pb3.Position := 0;
    StartBackupBtn.Enabled := False;
    CloseBtn.Enabled       := False;
    BackupPLZBLZ.Enabled   := False;

    try
      s :=
        '# ' + Application.Title + #13#10 +
        '# Datum :' + FormatDateTime ('dd.mm.yyyy hh:mm:ss "Uhr"', now) + #13#10 +
        '# Mandant :' + DM1.AktMandant + #13#10 +
        '#' + #13#10;

      dm1.uniquery.close;
      dm1.uniquery.sql.clear;
      dm1.uniquery.sql.text := 'SHOW TABLE STATUS';
      dm1.uniquery.open;

      //pb1.Max :=dm1.uniquery.recordcount+1;
      //pb1.Position :=0;

      pb1.Max := dm1.uniquery.recordcount * 100;
      pb1.Position := 0;

      while not dm1.uniquery.eof do
      begin
        if Pos('BACK_', uppercase(dm1.uniquery.fieldbyName('Name').AsString)) <> 1 then
        begin
          //pb1.position :=dm1.uniquery.RecNo;
          pb1.Position := (dm1.uniquery.RecNo-1) * 100;

          tab := uppercase(dm1.uniquery.fieldbyName('Name').AsString);

          TabNameLab.Caption := _('Tabelle:') + Tab;

          Application.ProcessMessages;

          s := s +
            '#' + #13#10 +
            '# TABLE [' + Tab + ']' + #13#10 +
            '#' + #13#10 +
            'drop table if exists ' + tab + ';'#13#10#13#10;

          s := s + 'create table ' + tab + ' (' + #13#10;

          // Feldnamen
          dm1.UniQuery2.close;
          dm1.UniQuery2.sql.text := 'show fields from ' + tab;
          dm1.UniQuery2.Open;

          while not dm1.UniQuery2.eof do
          begin
            s := s + '  ' +
            dm1.UniQuery2.FieldByName('Field').AsString + ' ' +
            dm1.UniQuery2.FieldByName('Type').AsString;

            if length(dm1.UniQuery2.FieldByName('Default').AsString) > 0 then
              s := s + ' default ''' + dm1.UniQuery2.FieldByName('Default').AsString + '''';

            if dm1.UniQuery2.FieldByName('Null').AsString <> 'YES' then
              s := s + ' not null';

            if length(dm1.UniQuery2.FieldByName('Extra').AsString) > 0 then
              s := s + ' ' + dm1.UniQuery2.FieldByName('Extra').AsString;

            if dm1.UniQuery2.RecNo < dm1.UniQuery2.RecordCount then
              s := s + ',' + #13#10;

            dm1.UniQuery2.next;
          end;
          dm1.UniQuery2.Close;

          // Keys
          dm1.UniQuery2.close;
          dm1.UniQuery2.sql.text := 'show keys from ' + tab;
          dm1.UniQuery2.Open;

          lastkey := ''; ks := '';
          while not dm1.UniQuery2.eof do
          begin
            if (lastkey<>dm1.UniQuery2.FieldByName('Key_name').AsString) then
            begin
              if length(ks) > 0 then
                s := s + ',' + #13#10 + '  ' + ks + ')';
              ks := '';
              lastkey := dm1.UniQuery2.FieldByName('Key_name').AsString;
            end;

            if (lastkey = 'PRIMARY') and (ks = '') then
            begin
              ks := 'PRIMARY KEY (' + dm1.UniQuery2.FieldByName('Column_name').AsString;
            end else
            if (dm1.UniQuery2.FieldByName('Non_unique').AsString = '0') and (ks = '') then
            begin
              ks := 'UNIQUE KEY ' + lastkey + ' (' + dm1.UniQuery2.FieldByName('Column_name').AsString;
            end else
            if ks = '' then
            begin
              ks := 'KEY ' + lastkey + ' (' + dm1.UniQuery2.FieldByName('Column_name').AsString;
            end else
            begin
              ks := ks + ', ' + dm1.UniQuery2.FieldByName('Column_name').AsString;
            end;

            dm1.UniQuery2.next;
          end;
          dm1.UniQuery2.Close;

          // evt. letzten Key hinzufügen
          if length(ks) > 0 then
            s := s + ','#13#10 + '  ' + ks + ')' + #13#10;

          s := s + ');' + #13#10#13#10;

          writeln(F, s);
          s := '';

          //Daten
          MaxRow  := dm1.UniQuery.FieldByName ('Rows').AsInteger + 1;

          //pb2.Max :=MaxRow;
          //pb2.Position :=0;

          if (dm1.UniQuery.FieldByName('Rows').AsInteger > 0) and
             (
             (BackupPLZBLZ.Checked) or
             (
             (not BackupPLZBLZ.Checked) and
             (Tab <> 'PLZ') and (Tab <> 'BLZ') and (Tab <> 'LAND')
             )
             ) then
          begin
            s := s + '#' + #13#10 + '# TABLE [' + Tab + '] DATA' + #13#10 + '#' + #13#10;
            write(F, s); s := '';
            row := -1;
            repeat
              inc(row);
              dm1.UniQuery2.close;
              dm1.UniQuery2.sql.text := 'select * from ' + tab + ' limit ' + IntToStr(Row * 1000) + ',1000';
              dm1.UniQuery2.Open;

              while not dm1.UniQuery2.eof do
              begin
                //pb2.Position :=dm1.UniQuery2.RecNo+Row*1000;

                pb1.Position := (dm1.uniquery.RecNo-1) * 100 +
                                round((dm1.UniQuery2.RecNo + Row * 1000 * 100) / MaxRow);

                Application.ProcessMessages;

                d := 'INSERT INTO ' + Tab + ' VALUES (';

                for i := 0 to dm1.UniQuery2.FieldCount-1 do
                begin
                  if i > 0 then
                    d := d + ',';
                  if (dm1.UniQuery2.Fields[i].IsNull) and (not dm1.UniQuery2.Fields[i].Required) then
                    d := d + 'NULL'
                  else
                  begin
                    if dm1.UniQuery2.Fields[i].DataType in [ftSmallint, ftInteger, ftWord,
                                                            ftBoolean, ftBCD, ftBytes,
                                                            ftVarBytes, ftAutoInc, ftLargeint] then
                    begin
                      d := d + '''' + dm1.UniQuery2.Fields[i].AsString + '''';
                    end else
                    begin
                      if dm1.UniQuery2.Fields[i].DataType in [ftDate, ftTime, ftDateTime, ftFloat, ftCurrency] then
                      begin
                        case dm1.UniQuery2.Fields[i].DataType of
                          ftDate:     d := d + '''' + sqlFormatDate(dm1.UniQuery2.Fields[i].AsDateTime) + '''';
                          ftTime:     d := d + '''' + sqlFormatTime(dm1.UniQuery2.Fields[i].AsDateTime) + '''';
                          ftDateTime: d := d + '''' + sqlDateTimeToSqlDate(dm1.UniQuery2.Fields[i].AsDateTime) + '''';
                          ftFloat:    d := d + '''' + sqlFloatToStr(dm1.UniQuery2.Fields[i].AsFloat) + '''';
                          ftCurrency: d := d + '''' + sqlFloatToStr(dm1.UniQuery2.Fields[i].AsFloat) + '''';
                        end;
                      end else
                      begin
                        d := d + '''' + sqlStringToSQL(dm1.UniQuery2.Fields[i].AsString) + '''';
                      end;
                    end;
                  end;
                end;

                dm1.UniQuery2.next;

                d := d + ');';
                writeln(F, d);
              end;
            until DM1.UniQuery2.RecordCount = 0;

            d := #13#10#13#10;  writeln (f, d);
          end;

          dm1.UniQuery2.Close;
        end;
        dm1.uniquery.next;

        pb1.position := 0;
        Application.ProcessMessages;
      end;

      pb1.Position := dm1.uniquery.RecNo + 1;
      Application.ProcessMessages;
      dm1.uniquery.close;
    finally
        closefile (f);
    end;

    // Script packen (ZIP erstellen)
    pb1.position       := 0;
    TabNameLab.Caption := '';
    ZipError           := False;

    try
      Zip.TempDir := DM1.TmpDir;
      Zip.FSpecArgs.Clear;
      Zip.FSpecArgs.Add (FN);
      Zip.ZipFileName := ChangeFileExt (FN, '.zip');
      Zip.Add;

      ZipSizeLab.Caption := FormatFloat(',#0.0', Zip.ZipFileSize / 1024) + ' kB';

      if not ZipError then
      begin
        AssignFile(F, ChangeFileExt (FN, '.sql'));
        Erase(F); // SQL-Datei löschen
      end else
      begin
        MessageDlg(Format(
          _('Während der Komprimierung ist ein Fehler aufgetreten,' + #13#10 +
            'deshalb wurde die Sicherungsdatei :' + #13#10 + '%s' + #13#10 +
            'nicht gelöscht, Sie müssen dies ggf. selbst tun.' + #13#10 +
            'Nähere Informationen zum Fehler finden Sie im Log.'),
            [ChangeFileExt (FN, '.sql')]), mterror, [mbok], 0
        );
      end;

    finally
      screen.cursor := crDefault;
      StartBackupBtn.Enabled := True;
      CloseBtn.Enabled := True;
      BackupPLZBLZ.Enabled := True;
    end;

    // Datum der le. Sicherung merken
    DM1.WriteString ('MAIN\SICHERUNG', 'LAST_BACKUP',
    FormatDateTime ('dd.mm.yyyy', now));
  finally
    Busy := False;
    screen.cursor := crDefault;
    StartBackupBtn.Enabled := True;
    CloseBtn.Enabled := True;
  end;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.ZipMessage(Sender: TObject; ErrCode: Integer; Message: String);
var
  p: integer;
begin
  try
    P := Pos('ADDING:', Uppercase(Message));
    if P > 0 then
      delete(Message, P, 8); Insert(_('zu ZIP hinzufügen:'), Message, P);

    if assigned(LogForm) then
      logform.addlog ('ZIP:ERR-CODE:' + Inttostr(ErrCode) + #13#10 + 'MLD:' + Message + #13#10);

    if ErrCode <> 0 then
      ZipError := True;
  except
  end;
end;

//------------------------------------------------------------------------------
procedure TBackupForm.ZipProgress(Sender: TObject; ProgrType: ProgressType; Filename: String; FileSize: TProgressSize);
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
        Step := Integer( Int64(ZIPTotalProgress1) * Int64(10000) div Int64(ZipTotalSize1));

        PB3.Position := 1 + Step;
      end else
        PB3.Position := 10001;
    end;
  end; // EOF Case
end;

//------------------------------------------------------------------------------
procedure TBackupForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

end.

//------------------------------------------------------------------------------

