{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : neuen Mandanten erstellen                                         }
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
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Admin_NewMandant;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Mask, JvExMask, JvToolEdit, JvBaseEdits, StdCtrls,
  Buttons;
{
uses ???
  ComCtrls, JvEdit, JvTypedEdit;
}

type
  TNewMandantDlg = class(TForm)
    TestTab: TZQuery;
    TestDB: TZConnection;
    NewManAbortBtn: TBitBtn;
    SaveBtn: TBitBtn;
    btnServerTest: TBitBtn;
    Hinweis: TLabel;
    Label15: TLabel;
    NewPWEdi: TEdit;
    Label11: TLabel;
    Label10: TLabel;
    NewUserEdi: TEdit;
    NewDBEdi: TEdit;
    Label9: TLabel;
    Label8: TLabel;
    NewServerEdi: TEdit;
    Label13: TLabel;
    NewPortEdi: TJvCalcEdit;
    edNewMandantName: TEdit;
    Label14: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewManAbortBtnClick(Sender: TObject);
    procedure NewServerEdiChange(Sender: TObject);
    procedure btnServerTestClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure edNewMandantNameExit(Sender: TObject);
    procedure NewDBEdiExit(Sender: TObject);
  private
    { Private-Deklarationen }
    ServerOK: Boolean;
  public
    { Public-Deklarationen }
    Function AddMandant: Boolean; // True wenn neuer Mandant angelegt wurde
  end;

//var
//  NewMandantDlg: TNewMandantDlg;

implementation

uses
  GNUGetText,
  OF_DM, OF_Var_Const;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TNewMandantDlg.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  try
    TranslateComponent(self);
  except
  end;

  ServerOK := False;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
Function TNewMandantDlg.AddMandant: Boolean; // True wenn neuer Mandant angelegt wurde
begin
  Result := ShowModal = mrOK;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.FormShow(Sender: TObject);
var
  i: integer;
begin
  ServerOK               := False;
  NewPortEdi.Text        := '3306';
  NewServerEdi.Text      := '';
  NewDBEdi.Text          := '';
  NewUserEdi.Text        := '';
  NewPWEdi.Text          := '';
  edNewMandantName.Text := '';
  SaveBtn.Enabled        := False;
  Hinweis.Caption        := '';
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.NewManAbortBtnClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.NewServerEdiChange(Sender: TObject);
begin
  if not assigned(TestDB) then
    exit;

  if TestDB.Connected  then
    TestDB.Disconnect;

  TestDB.Protocol := 'mysql';
  TestDB.HostName := NewServerEdi.Text;
  TestDB.Port     := StrToIntDef(NewPortEdi.Text, 0);
  TestDB.Database := NewDBEdi.Text;
  TestDB.User     := NewUserEdi.Text;
  TestDB.Password := NewPWEdi.Text;

  Hinweis.Caption := _('Bitte zunächst "Einstellungen testen" ausführen ...');
  SaveBtn.Enabled := False;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.btnServerTestClick(Sender: TObject);
var
  V: String;
  s: string;
  DBFound: Boolean;
begin
  if (Length(edNewMandantName.Text) > 0) and
     (Length(NewServerEdi.Text) > 0) and
     (Length(NewDBEdi.Text) > 0) and
     (Length(NewUserEdi.Text) > 0) then
  begin
    V := '';

    try
      s := TestDB.Database;
      TestDB.Database := '';

      TestDB.Connect;

      V := TestDB.ServerVersionStr;
      if TestDB.PingServer then
      begin
        ServerOK := True;
        MessageDlg(_('Der Server ist erreichbar !' + #13#10 +
                     'Server-Version') + ' : ' + V,
                     mtinformation, [mbok], 0);
      end else
      begin
        ServerOK := False;
        MessageDlg(_('Der Server ist nicht erreichbar !!!') + #13#10 + V,
                     mterror, [mbok], 0);
      end;

      // Prüfen ob die neue Datenbank schon vorhanden ist...
      TestTab.SQL.Text := 'show databases';
      TestTab.Open;
      DBFound := False;
      while not TestTab.Eof do
      begin
        if Lowercase(TestTab.FieldByName('DATABASE').AsString) = Lowercase(s) then
        begin
          DBFound := True;
          break;
        end;
        TestTab.Next;
      end;
      TestTab.Close;

    except
      on E: Exception do
      begin
        V := E.Message;

        if (Pos('UNBEKANNTE DATENBANK', Uppercase(V)) = 1) or
           (Pos('UNKNOWN DATABASE', Uppercase(V)) = 1) then
        begin
          MessageDlg(_('Der Server ist erreichbar,' + #13#10 +
                       'jedoch existiert die ausgewählte ' +
                       'Datenbank noch nicht !'),
                        mtinformation, [mbok], 0);

          ServerOK := True;
        end else
        if (Pos('ACCESS DENIED', Uppercase(V)) > 0) or
           (Pos('KEINE ZUGRIFFSBERECHTIGUNG', Uppercase(V)) > 0) then
        begin
          MessageDlg(_('Der Server ist erreichbar,' + #13#10 +
                       'jedoch wurde der Zugriff verweigert !'),
                       mtwarning, [mbok], 0);

          ServerOK := False;
        end else
        begin
          ServerOK := False;
          MessageDlg(_('Der Server ist nicht erreichbar !!!') + #13#10 + V,
                        mterror, [mbok], 0);
        end;
      end;
    end;
    TestDB.Disconnect;

    //Zugriff auf dem Server=OK, Datenbank nicht vorhanden...
    if ServerOK and (not DBFound) then
    begin
      Hinweis.Caption := _('Die Einstellungen sind in Ordnung,' + #13#10 +
                           'Sie können die neuen Daten jetzt speichern.');
      SaveBtn.Enabled := True;
    end else
    //Zugriff auf dem Server=OK, aber Datenbank vorhanden...
    if ServerOK and DBFound then
    begin
      Hinweis.Caption := _('Die Einstellungen sind nicht in Ordnung,' + #13#10 +
                           'Die Datenbank ist bereits vorhanden!');
      SaveBtn.Enabled := False;
    end else
    //Zugriff auf dem Server fehlerhaft...
    begin
      Hinweis.Caption := _('Die Einstellungen sind nicht in Ordnung.' + #13#10 +
                           'Speichern nicht möglich.' + #13#10 +
                           'Bitte überprüfen Sie Ihre Einstellungen!');
      SaveBtn.Enabled := False;
    end;
  end else
  begin
    if Length(edNewMandantName.Text) = 0 then
    begin
      Hinweis.Caption := _('Der Name des Mandanten kann nicht leer sein !');
      SaveBtn.Enabled := False;
    end else
    if Length(NewServerEdi.Text) = 0 then
    begin
      Hinweis.Caption := _('Der Name des Servers kann nicht leer sein !');
      SaveBtn.Enabled := False;
    end else
    if Length(NewDBEdi.Text) = 0 then
    begin
      Hinweis.Caption := _('Der Name der Datenbank kann nicht leer sein !');
      SaveBtn.Enabled := False;
    end else
    if Length(NewUserEdi.Text) = 0 then
    begin
      Hinweis.Caption := _('Der Datenbank-Benutzername kann nicht leer sein !');
      SaveBtn.Enabled := False;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.SaveBtnClick(Sender: TObject);
var
  M: TMandantRec;
begin
  M.DB     := NewDBEdi.Text;
  M.Name   := edNewMandantName.Text;
  M.Pass   := NewPWEdi.Text;
  M.Port   := StrToInt(NewPortEdi.Text);
  M.Server := NewServerEdi.Text;
  M.User   := NewUserEdi.Text;

  DM1.NewMandant(M);

  //DM1.OpenMandant (M.Name,Application.Name,True);

  ModalResult := mrOK;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.edNewMandantNameExit(Sender: TObject);
var
  i: Integer;
  Error: Boolean;
begin
  Error := False;

  if Length(edNewMandantName.Text) > 0 then
  begin
    for i := 1 to Length(edNewMandantName.Text) do
    begin
      if not (edNewMandantName.Text[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_']) then
      begin
        error := True;
        Break;
      end;
    end;
  end;

  if Error then
  begin
    MessageDlg(_('Hier sind nur die Zeichen' + #13#10 +
                 '"A-Z", "a-z", "0-9", "-" und "_" zulässig'),
                 mterror, [mbok], 0);
    edNewMandantName.SetFocus;
  end;

  btnServerTest.Enabled := not Error;
end;

//------------------------------------------------------------------------------
procedure TNewMandantDlg.NewDBEdiExit(Sender: TObject);
var 
  i: Integer; 
  Error: Boolean;
begin
  Error := False;

  if Length(NewDBEdi.Text) > 0 then
  begin
    for i := 1 to Length(NewDBEdi.Text) do
    begin
      if not (NewDBEdi.Text[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_']) then
      begin
        error := True;
        Break;
      end;
    end;
  end;

  if Error then
  begin
    MessageDlg(_('Hier sind nur die Zeichen' + #13#10 +
                 '"A-Z", "a-z", "0-9", "-" und "_" zulässig'),
                 mterror, [mbok], 0);
    NewDBEdi.SetFocus;
  end else
    if (Uppercase(NewDBEdi.Text) = 'MYSQL') or
       (Uppercase(NewDBEdi.Text) = 'TEST') then
  begin
    MessageDlg(_('Die Worte "MySQL" und "Test" sind als ' +
                 'DB-Namen nicht zulässig !'), mterror, [mbok], 0);
    NewDBEdi.SetFocus;
  end;

  btnServerTest.Enabled := not Error;
end;

//------------------------------------------------------------------------------

end.

