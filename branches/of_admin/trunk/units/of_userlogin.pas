{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Programm Login Dialog (Authentifizierung username:password)       }
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
{ OLDTODO:                                                                     }
{ - "Administrator" ändern in "Admin" admin:sysdba                             }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit of_userlogin;

{$mode objfpc}{$H+}

interface

uses
  Windows,Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, rxctrls, JvXPButtons;

type

  { TFormUserLogin }

  TFormUserLogin = class(TForm)
    Bevel1: TBevel;
    btnAnmelden: TBitBtn;
    cbDatenSpeichern: TCheckBox;
    btnCancel: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbMandant: TComboBox;
    btnNewMandant: TBitBtn;
    edPassword: TEdit;
    edUsername: TEdit;
    laMeldung: TLabel;
    procedure btnAnmeldenClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewMandantClick(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edUsernameKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FormUserLogin: TFormUserLogin;

implementation

uses
  //of_dm,
  of_admin_newmandant;

{$R *.lfm}

{ TFormUserLogin }

procedure TFormUserLogin.FormCreate(Sender: TObject);
begin
  laMeldung.Caption := '';
end;

procedure TFormUserLogin.FormShow(Sender: TObject);
begin
  if length(edUsername.Text) > 0 then
    edPassword.SetFocus
  else
    edUsername.SetFocus;
end;

procedure TFormUserLogin.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormUserLogin.btnAnmeldenClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormUserLogin.btnNewMandantClick(Sender: TObject);
var
  NewMandantDlg: TNewMandantDlg;
begin
  NewMandantDlg := TNewMandantDlg.Create(Self);
  try
    if NewMandantDlg.AddMandant then
    begin
      { TODO -oUD : DM1 ??? }
      (*
      if (DM1.AktMandant <> '') and (DM1.MandantOK) then
      begin
        DM1.InitMandantAfterOpen;
      end;
      *)
    end;
  finally
    NewMandantDlg.Free;
  end;
end;

procedure TFormUserLogin.edUsernameChange(Sender: TObject);
begin
  btnAnmelden.Enabled := (length(edUsername.Text) > 0) and (length(edPassword.Text) > 0);
end;

procedure TFormUserLogin.edUsernameKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if Sender = btnCancel then
    begin
      cbMandant.SetFocus;
    end else
    begin
      //PerformTab(true);   // <- geht nicht...
      SelectNext(self.ActiveControl, true, true);
    end;
  end;
end;

end.

