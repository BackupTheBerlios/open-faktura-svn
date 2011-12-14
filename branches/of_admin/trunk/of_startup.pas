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
  - Start-Grafik ersetzen bzw. ersetzen
  - Logo Einbindung ermöglichen (png|jpg|bmp)
  - Splash-Screen abschaltbar bzw. nicht modal

  ISSUES, NOTES:
  -

  HISTORY:
  30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)
  28.11.2009 - UD: Funktionsaufruf "ExtractFilePath(ParamStr(0))" durch die
                   Globale Variaiable "APP_PATH" ersetzt.
  04.12.2011 - UD: Neue Klasse "SplashScreen" als Singleton. TStartbox nicht
                   mehr direkt verwenden.
*******************************************************************************)

unit OF_StartUp;

{$I OF.INC}

interface

uses
  Windows, DateUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, LazJPG, RxVersInfo;

type

  TStartBox = class;

  { TSplashScreen }

  TSplashScreen = class(TObject)
  private
    Intro: TStartBox;
    Timer1: TTimer;
    iTimer: DWORD;
    procedure Timer1Timer(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;

    procedure BeginShow(sec: DWORD = 0);
    procedure EndShow;
    procedure ShowModal;
  end;

  { TStartBox }

  TStartBox = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    laVersion: TLabel;
    Label3: TLabel;
    pbar: TProgressBar;
    RxVersionInfo1: TRxVersionInfo;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Modal: Boolean;
  end;

function SplashScreen: TSplashScreen;

implementation

uses
  OF_Var_Const;

{$R *.lfm}

{ TSplashScreen }

var
  FSplashScreen: TSplashScreen = nil;
  SScreen: TStartBox; // Splash-Screen für Programmstart !!

constructor TSplashScreen.Create;
begin
  if Assigned(FSplashScreen) then
  begin
    Abort;
  end else
  begin
    inherited Create;
    FSplashScreen := self;
  end;
  Intro := nil;

  Timer1 := TTimer.Create(nil);
  Timer1.Enabled := false;
  Timer1.Interval := 500;
  Timer1.OnTimer := @Timer1Timer;
end;

destructor TSplashScreen.Destroy;
begin
  if Assigned(Intro) then
    FreeAndNil(Intro);

  if FSplashScreen = self then
    FSplashScreen := nil;

  inherited Destroy;
end;

procedure TSplashScreen.BeginShow(sec: DWORD = 0);
begin
  if sec <= 0 then
  begin
    iTimer := GetTickCount + 5000; // min. 5 sec anzeigen
  end else
  begin
    iTimer := GetTickCount + (sec*1000);
  end;

  Intro := TStartBox.Create(Application);
  Intro.Show;
  Intro.Update;
end;

procedure TSplashScreen.EndShow;
begin
  Timer1.Enabled := true;
end;

procedure TSplashScreen.ShowModal;
var
  sb: TStartBox;
begin
  sb := TStartBox.Create(Application);
  try
    sb.PBar.Visible := False;
    sb.FormStyle := fsNormal;
    sb.Modal := true;
    sb.ShowModal;
  finally
    sb.Free;
  end;
end;

procedure TSplashScreen.Timer1Timer(Sender: TObject);
begin
  if GetTickCount > iTimer then
  begin
    FreeAndNil(Intro);
  end;
end;

procedure TStartBox.FormCreate(Sender: TObject);
var
  JPG: TJPegImage;
begin
  Modal := False;
  Label1.Caption := '© 2010-'+IntToStr(YearOf(now));
  laVersion.Caption := 'Version '+RxVersionInfo1.FileVersion;
end;

procedure TStartBox.Image1Click(Sender: TObject);
begin
  if Modal then
    Close;
end;

procedure TStartBox.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Modal then
    Close;
end;

function SplashScreen: TSplashScreen;
begin
  if FSplashScreen = nil then
    FSplashScreen := TSplashScreen.Create;
  Result := FSplashScreen;
end;

initialization

finalization
  FSplashScreen.Free;

end.

