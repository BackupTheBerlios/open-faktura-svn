{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Benutzer Password-Changer                                         }
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

unit OF_User_PW_Change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TUserPWChangeForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OldPWEdi: TEdit;
    ChangeBtn: TBitBtn;
    CloseBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    NewPWEdi: TEdit;
    NewPWEdi2: TEdit;
    UserNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure UserEdiKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
    
//var
//  UserChangeForm: TUserChangeForm;
    
implementation

uses
  GNUGetText,
  OF_DM, OF_Function;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TUserPWChangeForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent (self);
  except
  end;

  UserNameLabel.Caption := DM1.CaoSecurity.CurrUser;
end;

//------------------------------------------------------------------------------
procedure TUserPWChangeForm.ChangeBtnClick(Sender: TObject);
var 
  OldPWOK: Boolean;
  NewPWOK: Boolean;
  T      : String;
begin
  //ModalResult :=mrOK;

  DM1.SqlLog := False; // nicht loggen
  try
    with dm1.UniQuery do
    begin
      close;
      sql.text := 'select MD5("' + sqlStringToSql(OldPWEdi.Text) +
        '")=USER_PASSWORD as OLD_PW_OK from MITARBEITER ' +
        'where MA_ID=' + IntToStr(DM1.CaoSecurity.CurrUserID);
      open;
      OldPWOK := FieldByName('OLD_PW_OK').AsInteger = 1;
      close;
    end;

    NewPWOK := (NewPWEdi.Text = NewPWEdi2.Text)and(length(NewPWEdi.Text)>= 4);

    if OldPWOK and NewPWOK then
    begin
      with dm1.UniQuery do
      begin
        close;
        sql.text := 'UPDATE MITARBEITER SET USER_PASSWORD=MD5("' +
          sqlStringToSQL(NewPWEdi.Text) +
          '") where MA_ID=' +
        IntToStr(DM1.CaoSecurity.CurrUserID);
        execsql;
      end;
      MessageDlg (_('Ihr Kennwort wurde erfolgreich geändert.'),
        mtinformation, [mbok], 0);
      ModalResult := MrOK;
    end else
    begin
      if not OldPWOK then
        T := _('Das alte Kennwort stimmt nicht überein.' + #13#10 +
          'Bei Kennwörtern wird die Groß-/Kleinschreibung beachtet.' + #13#10 +
          'Stellen Sie sicher, das die FESTSTELLTASTE nicht versehentlich ' +
          'aktiviert ist.')
      else
      if length(NewPWEdi.Text) < 4 then
        T := _('Das Kennwort muß eine Länge von mind. 4 Zeichen haben.')
      else
      if not NewPWOK then
        T := _('Die eingegebenen Kennwörter stimmen nicht überein.' + #13#10 +
          'Bitte geben Sie ihr neue Kennwort in beide Textfelder ein.');
          
      MessageDlg (T, mtError, [mbok], 0);
    end;
  finally
    DM1.SqlLog := True;
  end;
end;

//------------------------------------------------------------------------------
procedure TUserPWChangeForm.CloseBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

//------------------------------------------------------------------------------
procedure TUserPWChangeForm.UserEdiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SendMessage (Self.Handle, WM_NEXTDLGCTL, 0, 0)
  end;
end;

//------------------------------------------------------------------------------
procedure TUserPWChangeForm.FormShow(Sender: TObject);
begin
  OldPWEdi.SetFocus;
end;

//------------------------------------------------------------------------------

end.

