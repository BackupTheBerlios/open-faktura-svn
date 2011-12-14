{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    :                                                                   }
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
(*******************************************************************************
  TODO:
  -

  ISSUES, NOTES:
  -

  HISTORY:
  dd.mm.yyyy - nn:

*******************************************************************************)
unit uOF_Mandant;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Contnrs, DCPrc4, DCPsha1;

type

  TMandantItem = class;

  { TMandantLogin }

  TMandantLogin = class(TObject)
  private
    FActive: boolean;
    FItemIndex: integer;
    FAktMandantIndex: integer;

    FMandant: TMandantItem;
    FMandantList:  TObjectList;

    FLoginname: string;
    FUsername: string;
    FUserID: integer;
    FAdminRights: boolean;
    FNeedAdminRights: boolean;

    FErrText: string;
    FErrNr: integer;

    function ReadCfgIni(FileName: string): boolean;
    procedure ReadMandanten(Strings: TStrings);
    procedure ReadMandant(Index: integer);
    function CheckMandantUser(aMandantItem: integer; aUser, aPWD: string): boolean;
    procedure SetItemIndex(const AValue: integer);
  public
    constructor Create;
    destructor Destroy; override;

    function Login: boolean;

    property Active: boolean read FActive;
    property ItemIndex: integer read FItemIndex write SetItemIndex;
    property Mandant: TMandantItem read FMandant;
    property Username: string read FUsername;
    property UserID: integer read FUserID;
    property AdminRights: boolean read FAdminRights;
    property NeedAdminRights: boolean read FNeedAdminRights write FNeedAdminRights;
  end;

  { TMandantItem }

  TMandantItem = class(TObject)
  private
    FMandantID: string;
    FMandantName: string;

    FHostname: string;
    FPort: integer;
    FDatabase: string;
    FUsername: string;
    FPassword: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    property MandantID: string read FMandantID;
    property MandantName: string read FMandantName;
    property Hostname: string read FHostname;
    property Port: integer read FPort;
    property Database: string read FDatabase;
    property Username: string read FUsername;
    property Password: string read FPassword;
  end;



function OFMandantLogin: TMandantLogin;

implementation

uses
  IniFiles, rxFileUtils, ZDataset, ZConnection,
  of_userlogin, uOF_DBServer;

const
  CipherKey: String = 'wv435sdzHTDXFC';

var
  FOFMandantLogin: TMandantLogin = nil;

{ TMandantLogin }

function TMandantLogin.ReadCfgIni(FileName: string): boolean;
var
  Cipher: TDCP_rc4;
  ini: TIniFile;
  i: integer;
  s, m: string;
  pwd_c: string;
  ml: TMandantItem;
begin
  Cipher := TDCP_rc4.Create(nil);
  try
    Cipher.Id := 19;
    Cipher.MaxKeySize := 2048;
    Cipher.InitStr(CipherKey, TDCP_sha1);

    //
    ini := TIniFile.Create(FileName);

    FMandantList.Clear;
    for i := 1 to 999 do
    begin
      m := 'M'+Format('%.3d', [i]);
      s := ini.ReadString('MANDANTEN', m, '@ERR@');
      if s <> '@ERR@' then
      begin
        // Listeneintrag erstellen...
        ml := TMandantItem.Create;
        FMandantList.Add(ml);
        ml.FMandantID   := M;
        ml.FMandantName := s;
        ml.FHostname    := ini.ReadString('MANDANTEN', m+'_SERVER', '');
        ml.FUsername    := ini.ReadString('MANDANTEN', m+'_USER', '');
        ml.FPassword    := ini.ReadString('MANDANTEN', m+'_PASS', '');
        pwd_c           := ini.ReadString('MANDANTEN', m+'_PASS_C', '');
        ml.FDatabase    := ini.ReadString('MANDANTEN', m+'_DB', '');
        ml.FPort        := ini.ReadInteger('MANDANTEN', m+'_PORT', 0);

        // Passwort in Klartext vorhanden...
        if ml.FPassword <> '' then
        begin
          // Passwort verschlüsseln.
          pwd_c := Cipher.EncryptString(ml.FPassword);
          if pwd_c <> '' then
          begin
            try
              // verschlüsseltes Passwort zurückschreiben...
              ini.WriteString('MANDANTEN', m+'_PASS_C', pwd_c);
              ini.WriteString('MANDANTEN', m+'_PASS', '');
            except
              MessageDlg(Format('Fehler beim schreiben in die '+#13#10+
                                  'Konfigurationsdatei %s.',
                                  [FileName]), mterror, [mbok], 0);
            end;
          end;
        end else
        // verschlüsseltes Passwort ...
        begin
          if Length(pwd_c) >= 2 then
          begin
            try
              ml.FPassword := Cipher.DecryptString(pwd_c);
            except
              ml.FPassword := '';
            end;
          end;
        end;

      end;
    end;


    // Aktuellen Mandanten (=Vorgabe) einlesen.
    s := Ini.ReadString('OF', 'AKTMANDANT', '@ERR@');
    if s = '@ERR@' then
    begin
      // kein Aktueller Mandant gesetzt...
      FAktMandantIndex := -1;
    end else
    begin
      // Aktuellen Mandant suchen...
      FAktMandantIndex := -1;
      for i := 0 to FMandantList.Count-1 do
      begin
        if TMandantItem(FMandantList.Items[i]).FMandantName = s then
        begin
          FAktMandantIndex := i;
          break;
        end;
      end;
    end;

    // wurde schon ein Mandant eingelogt ?
    if FItemIndex < 0 then
    begin
      // ein AktMandant vorhanden ?
      if FAktMandantIndex < 0 then
      begin
        FItemIndex := 0;
      end else
      begin
        FItemIndex := FAktMandantIndex;
      end;
    end;


    //UseNTUserName   := false; // CM Ini.ReadBool(APP, 'USE_NTUSERNAME', True);

    ini.Free;
  finally
    Cipher.Free;
  end;
end;

function TMandantLogin.CheckMandantUser(aMandantItem: integer; aUser, aPWD: string): boolean;
var
  oDB: TDBServerConnecton;
  oTable: TZQuery;
  ml: TMandantItem;
begin
  result := false;

  if aMandantItem < 0 then
  begin
    exit;
  end;

  oDB := TDBServerConnecton.Create(nil);
  try
    ml := TMandantItem(FMandantList.Items[aMandantItem]);
    oDB.Protocol := 'mysql';
    oDB.HostName := ml.Hostname;
    oDB.Port     := ml.Port;
    oDB.User     := ml.Username;
    oDB.Password := ml.Password;
    oDB.Database := ml.Database;

    try
      oDB.Connect;
    except
      result := false;
      oDB.Disconnect;
      exit;
    end;

(*
SQL.Text := 'SELECT MA_ID,LOGIN_NAME,' +
  'LENGTH(USER_PASSWORD)=32 as PW_VALID,' +
  'MD5(:PW)=USER_PASSWORD as PW_OK ' +
  'FROM MITARBEITER ' +
  'WHERE LOGIN_NAME=:USER';

ParamByName ('USER').AsString := User;
ParamByName ('PW').AsString := PW;


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
  MessageDlg('Sie verfügen über keine Admin-Rechte.' + #13#10 +
    'Der Zugang wurde verweigert !', mterror, [mbok], 0);
  Result := - 4;
end;


*)

    oTable := TZQuery.Create(nil);
    try
      oTable.Connection := oDB;
      oTable.ReadOnly := true;
      oTable.SQL.Text :=
        'select '+
        '  M.MA_ID, M.LOGIN_NAME, M.USER_PASSWORD, M.ANZEIGE_NAME, ' +
        '  M.USER_PASSWORD = MD5('+QuotedStr(aPWD)+') as PW_OK, '+
        '  B.GRUPPEN_ID '+
        'from '+
        '  MITARBEITER M left join BENUTZERRECHTE B '+
        'on '+
        '  M.MA_ID = B.USER_ID '+
        'order by '+
        '  M.MA_ID';
      oTable.Open;


      if oTable.EOF then
      begin
        // kein User angelegt
        FErrText := 'Die Mitarbeitertabelle ist leer, kein User angelegt';
        FErrNr   := 3;
        exit;
      end;


      while not oTable.EOF do
      begin
        ShowMessage(oTable.FieldByName('PW_OK').AsString+' / '+oTable.FieldByName('LOGIN_NAME').AsString);

        if (oTable.FieldByName('PW_OK').AsBoolean) and
           (UpperCAse(oTable.FieldByName('LOGIN_NAME').AsString) = UpperCase(aUser)) then
        begin
          // User gefunden, setzte Propertys...
          ReadMandant(aMandantItem);
          FItemIndex    := aMandantItem;
          FLoginname    := oTable.FieldByName('LOGIN_NAME').AsString;
          FUsername     := oTable.FieldByName('ANZEIGE_NAME').AsString;
          FUserID       := oTable.FieldByName('MA_ID').AsInteger;
          FAdminRights  := oTable.FieldByName('GRUPPEN_ID').AsInteger = 1;

          result := true;
          break;
        end;
        oTable.Next;
      end;
      oTable.Close;


      if not result then
      begin
        FErrText := 'Es existiert kein Benutzerkonto mit diesem Usernamen.';
        FErrNr := 2;
      end;
    finally
      oTable.Free;
    end;

  finally
    oDB.Free;
  end;
end;

procedure TMandantLogin.SetItemIndex(const AValue: integer);
begin
  { TODO -oUD : noch überarbeiten }
  if FItemIndex = AValue then exit;
  FItemIndex := AValue;
end;

constructor TMandantLogin.Create;
begin
  inherited Create;

  FActive := false;
  FItemIndex   := -1;
  FAktMandantIndex := -1;

  FMandant     := TMandantItem.Create;
  FMandantList := TObjectList.Create;

  FLoginname := '';
  FUsername := '';
  FUserID := -1;
  FAdminRights := false;
  FNeedAdminRights := false;

  FErrText := '';
  FErrNr := 0;
end;

destructor TMandantLogin.Destroy;
begin
  FMandantList.Free;
  FMandant.Free;

  inherited Destroy;
end;

function TMandantLogin.Login: boolean;
var
  AppPath: string;
  i: integer;
  b: boolean;
  e: boolean;
begin
  result := false;
  AppPath := ExtractFilePath(ParamStr(0));  { TODO -oUD : AppPath muss in die Klasse TOFGlobal untergebracht werden }

  FErrText := '';
  FErrNr := 0;

  // prüfen ob die OF-Config-Datei existiert.
  if FileExists(AppPath+'of_cfg.ini') then
  begin
    // Konfig Datei vorhanden. Mandant auswählen...

    // OF-Config-Datei einlesen...
    ReadCfgIni(AppPath+'of_cfg.ini');

    // Loginname mit System-Username vorbelegen...
    if FLoginname = '' then
       FLoginname := GetUserName;


    FormUserLogin := TFormUserLogin.Create(Application);
    try
      // Eingabefelder vorbelegen...
      ReadMandanten(FormUserLogin.cbMandant.Items);
      FormUserLogin.cbMandant.ItemIndex := FItemIndex;
      FormUserLogin.edUsername.Text := FLoginname;
      FormUserLogin.edPassword.Text := '';
      FormUserLogin.laMeldung.Caption := '';

      i := 0;
      b := false;
      repeat
        // Login Form anzeigen...
        FormUserLogin.laMeldung.Caption := FErrText;
        if FormUserLogin.ShowModal = mrOK then
        begin
          // ist der User im Mantdant vorhanden ?
          e := CheckMandantUser(
            FormUserLogin.cbMandant.ItemIndex,
            FormUserLogin.edUsername.Text,
            FormUserLogin.edPassword.Text
          );

          if e then
          begin
            // User im Mandant vorhanden...

            // werden Adminrechte gebraucht ?
            if FNeedAdminRights then
            begin
              // es werden Adminrechte gebraucht.
              if FAdminRights then
              begin
                // Adminrechte vorhanden.
                FActive := true;

                b := true;
                result := true;
              end else
              begin
                FErrText := 'Sie verfügen über keine Admin-Rechte.';
                FErrNr := 4;
              end;
            end else
            begin
              // keine Adminrechte gebraucht.
              FActive := true;

              b := true;
              result := true;
            end;
          end;

        end else
        begin
          // Form = Abbruch...
          b := true;
          result := false;
        end;
        inc(i);

        // Meldung: nur noch ein Versuch.
        if i = 2 then
        begin
          FErrText := FErrText + ' ..noch ein Versuch';
        end;
        // nach 3 Login-Versuchen = Abbruch...
        if i >= 3 then
        begin
          b := true;
          result := false;
        end;

      until b;

    finally
      FormUserLogin.Free;
    end;
  end else
  begin
    // Konfig Datei nicht vorhanden. Neunen Mandant anlegen...

  end;

end;

procedure TMandantLogin.ReadMandanten(Strings: TStrings);
var
  i: integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    for i := 0 to FMandantList.Count-1 do
    begin
      if TMandantItem(FMandantList.Items[i]).FMandantName > '' then
      begin
        Strings.Add(TMandantItem(FMandantList.Items[i]).FMandantName);
      end;
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TMandantLogin.ReadMandant(Index: integer);
var
  ml: TMandantItem;
begin
  ml := TMandantItem(FMandantList.Items[Index]);
  FMandant.Clear;
  FMandant.FMandantID   := ml.FMandantID;
  FMandant.FMandantName := ml.FMandantName;
  FMandant.FHostname    := ml.FHostname;
  FMandant.FPort        := ml.FPort;
  FMandant.FDatabase    := ml.FDatabase;
  FMandant.FUsername    := ml.FUsername;
  FMandant.FPassword    := ml.FPassword;
end;

{ TMandantItem }

constructor TMandantItem.Create;
begin
  inherited Create;

  Clear;
end;

destructor TMandantItem.Destroy;
begin
  inherited Destroy;
end;

procedure TMandantItem.Clear;
begin
  FMandantID    := '';
  FMandantName  := '';

  FHostname     := '';
  FPort         := 0;
  FDatabase     := '';
  FUsername     := '';
  FPassword     := '';
end;

function OFMandantLogin: TMandantLogin;
begin
  if FOFMandantLogin = nil then
    FOFMandantLogin := TMandantLogin.Create;
  Result := FOFMandantLogin;
end;

initialization

finalization
  FreeAndNil(FOFMandantLogin);

end.

