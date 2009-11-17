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
{ TODO:                                                                        }
{ - "Administrator" ändern in "Admin" admin:sysdba                             }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUserChangeForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    UserEdi: TEdit;
    Label2: TLabel;
    PasswordEdi: TEdit;
    AnmeldeBtn: TBitBtn;
    CloseBtn: TBitBtn;
    Label3: TLabel;
    MandantCB: TComboBox;
    NewMandantBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure AnmeldeBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure UserEdiChange(Sender: TObject);
    procedure UserEdiKeyPress(Sender: TObject; var Key: Char);
    procedure NewMandantBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
    function CheckUser (User, PW: String; Admin: Boolean): Integer;
  public
    { Public-Deklarationen }
    function UserChange (var User: String; NextMandant: String = ''): Integer;
  end;
    
//var
//  UserChangeForm: TUserChangeForm;

implementation

uses
  GNUGetText,
  OF_DM, OF_Admin_NewMandant;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TUserChangeForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  UserEdi.Text := DM1.CaoSecurity.CurrUser;
end;

//------------------------------------------------------------------------------
function TUserChangeForm.UserChange (var User: String; NextMandant: String = ''): Integer;
var 
  OldSQLLog      : Boolean;
  Error          : Boolean;
  ErrorCnt, I    : Integer;
  NeedAdminRights: Boolean;
  P              : PChar;
  Size           : DWord;
begin
  Error := False;
  ErrorCnt := 0;
  Result := -1;

  NeedAdminRights := Uppercase(Application.Name) = 'CAO_ADMIN';

  NewMandantBtn.Visible := (NeedAdminRights);

  MandantCB.Items.Clear;

  if length(dm1.mandanttab) = 0 then 
    NewMandantBtnClick(Self);

  if length(dm1.mandanttab) = 0 then
  begin
    Result := -1;
    exit;
  end else
  begin
    for i := 0 to length(dm1.mandanttab)-1 do
    begin
      MandantCB.Items.Add (dm1.mandanttab[i].Name);
    end;

    if length(NextMandant) > 0 then 
      MandantCB.ItemIndex := MandantCB.Items.IndexOf(NextMandant)
    else 
      MandantCB.ItemIndex := MandantCB.Items.IndexOf(DM1.AktMandant);
  end;

  if (DM1.DefaultUserName <> '') and (DM1.DefaultPassword <> '') then
  begin
    UserEdi.Text := DM1.DefaultUserName;
    PasswordEdi.Text := DM1.DefaultPassword;
  end else
  if (DM1.UseNTUserName) then
  begin
    // Usernamen ermitteln
    size := 1024;
    P := StrAlloc(size);
    windows.getusername (p, Size);
    UserEdi.Text := p;
    strdispose (p);
  end;

  repeat
    if ((DM1.DefaultUserName <> '') and (DM1.DefaultPassword <> '')) or (ShowModal = mrOK) then
    begin
      if (DM1.AktMandant <> MandantCB.Items[MandantCB.ItemIndex]) or (not DM1.MandantOK) then
      begin
        DM1.OpenMandant (MandantCB.Items[MandantCB.ItemIndex], Application.Name, True);

        if (DM1.AktMandant <> '') and (DM1.MandantOK) then
        begin
          //Caption :=Application.Title + ' - Mandant :'+DM1.AktMandant;
          DM1.InitMandantAfterOpen;
        end;
      end;

      if CheckUser (UserEdi.Text, PasswordEdi.Text, NeedAdminRights) <> 1 then
      begin
        Result := -1;
        Error := True;
        inc(ErrorCnt);
        PasswordEdi.Text := '';

        DM1.DefaultUserName := '';
        DM1.DefaultPassword := '';
      end else
      begin
        User     := UserEdi.Text;
        Result   := 0;
        ErrorCnt := 0;
        Error    := False;

        PasswordEdi.Text := '';
        DM1.DefaultPassword := '';
      end;
    end else
    begin
      // Benutzer hat Dialog abgebrochen
      Result := -1;
      User := '';
      ErrorCnt := 10;
      PasswordEdi.Text := '';
    end;
  until (not Error) or (ErrorCnt >= 5);
end;

//------------------------------------------------------------------------------
procedure TUserChangeForm.AnmeldeBtnClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;
//------------------------------------------------------------------------------
procedure TUserChangeForm.CloseBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
procedure TUserChangeForm.UserEdiChange(Sender: TObject);
begin
  AnmeldeBtn.Enabled := (length(UserEdi.Text) > 0) and (length(PasswordEdi.Text) > 0);
end;                                                                             

//------------------------------------------------------------------------------
procedure TUserChangeForm.UserEdiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if Sender = MandantCB then 
      AnmeldeBtn.SetFocus
    else 
      SendMessage (Self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;  

//------------------------------------------------------------------------------
Function TUserChangeForm.CheckUser (User, PW: String; Admin: Boolean): Integer;
// RESULT :
//    1 = User und PW OK
//   -1 = Kennwort falsch
//   -2 = PW in der DB ist leer
//   -3 = Es existiert kein Benutzerkonto mit diesem Usernamen
//   -4 = kein Admin
var 
  OldSQLLog: Boolean; 
  MA_ID: Integer;
begin
  // User und Paßwort prüfen

  // Loging aus !!!
  OldSQLLog := DM1.SQLLog;

  DM1.SQLLog := False;

  with DM1.UniQuery do
  begin
    // Test ob mind. 1 Mitarbeiter existiert
    try
      SQL.Text := 'SELECT COUNT(*) as ANZ , ' +
        'SUM(LOGIN_NAME="Administrator") as ANZ_ADMIN ' +
        'FROM MITARBEITER';
      Open;
      if (FieldByName('ANZ').AsInteger = 0) or (FieldByName('ANZ_ADMIN').AsInteger = 0) then
      begin
        Close;

        SQL.Text := 'INSERT INTO MITARBEITER SET MA_NUMMER="---",GRUPPE_ID=1,' +
          'LOGIN_NAME="Administrator",ANZEIGE_NAME="Administrator",' +
          'USER_PASSWORD=MD5("sysdba");';
        ExecSql;
      end;
    except
    end;
    Close;

    SQL.Text := 'SELECT MA_ID,LOGIN_NAME,' +
      'LENGTH(USER_PASSWORD)=32 as PW_VALID,' +
      'MD5(:PW)=USER_PASSWORD as PW_OK ' +
      'FROM MITARBEITER ' +
      'WHERE LOGIN_NAME=:USER';

    ParamByName ('USER').AsString := User;
    ParamByName ('PW').AsString := PW;

    Open;
    if RecordCount = 1 then
    begin
      if FieldByName ('PW_VALID').AsInteger = 1 then
      begin
        if FieldByName ('PW_OK').AsInteger = 1 then
        begin
          //Error :=False;
          //User  :=UserEdi.Text;

          if Admin then
          begin
            // Prüfen ob User Admin-Rechte hat

            MA_ID := FieldByName ('MA_ID').AsInteger;
            Close;
            SQL.Text := 'SELECT GRUPPEN_ID, USER_ID from BENUTZERRECHTE ' +
              'WHERE USER_ID=' + IntToStr(MA_ID) + ' AND ' +
              'GRUPPEN_ID=1';
            Open;
            if (RecordCount = 1) and (FieldByName ('USER_ID').AsInteger = MA_ID) then
            begin
              // User hat Admin-Rechte
              Result := 1;
            end else
            begin
              MessageDlg(_('Sie verfügen über keine Admin-Rechte.' + #13#10 +
                'Der Zugang wurde verweigert !'), mterror, [mbok], 0);
              Result := - 4;
            end;
          end else 
            Result := 1;
        end else
        begin
          // PW ist falsch !!!
          MessageDlg (_('Kennwort falsch !'), mterror, [mbok], 0);

          //Error :=True;
          //inc (ErrorCnt);
          Result := -1;
        end;
      end else
      begin
        // PW in der DB ist leer !
        MessageDlg (_('Das Benutzerpaßwort in der DB ist leer.' + #13#10 +
          'Bitten Sie einen Administrator Ihr' + #13#10 +
          'initiales Paßwort einzurichten.'),
          mterror, [mbok], 0);

        //Error :=True;
        //inc (ErrorCnt);
        Result := - 2;
      end;
    end else
    begin
      // User existiert nicht

      MessageDlg (_('Es existiert kein Benutzerkonto ' +
        'mit diesem Namen.' + #13#10 +
        'Bitten Sie einen Administrator Ihnen' + #13#10 +
        'ein Benutzerkonto einzurichten.'),
        mterror, [mbok], 0);

      //Error :=True;
      //Inc(ErrorCnt);
      Result := - 3;
    end;
    Close;
  end;
  DM1.SQLLog := OldSQLLog;
end;    

//------------------------------------------------------------------------------
procedure TUserChangeForm.NewMandantBtnClick(Sender: TObject);
var 
  NewMandantDlg: TNewMandantDlg;
begin
  NewMandantDlg := TNewMandantDlg.Create(Self);
  try
    if NewMandantDlg.AddMandant then
    begin
      if (DM1.AktMandant <> '') and (DM1.MandantOK) then
      begin
        DM1.InitMandantAfterOpen;
      end;
    end;
  finally
    NewMandantDlg.Free;
  end;
end;                                

//------------------------------------------------------------------------------
procedure TUserChangeForm.FormShow(Sender: TObject);
begin
  if length(UserEdi.Text) > 0 then 
    PasswordEdi.SetFocus
  else 
    UserEdi.SetFocus;
end;

//------------------------------------------------------------------------------

end.

