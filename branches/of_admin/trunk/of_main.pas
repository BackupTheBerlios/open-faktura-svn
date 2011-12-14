{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Haupt-Modul, bindet alle anderen Module in die Oberfläche ein     }

{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  gehört zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}

{ This program code ( based on the sources of CAO-Faktura, see above ) is part }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }

{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id: of_main.pas 34 2011-11-30 14:49:36Z chris $ }
(*******************************************************************************
  TODO:
  -

  ISSUES, NOTES:
  -

  HISTORY:
  dd.mm.yyyy -

*******************************************************************************)

unit of_main;

{$I OF.INC}


interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, StdCtrls, XMLPropStorage, ZSqlMonitor, rxlogin,
  folderlister, pagemngr, rxtoolbar, OFPanel, OFSecurity, JvXPBar, {SynEdit,}
  inifiles, of_startup;
  //of_backup, of_restore;

type

  { TMainForm }

  TMainForm = class(TForm)
    ApplicationProperties: TApplicationProperties;
    FindDialog1: TFindDialog;
    AllgemeinImgList: TImageList;
    MenuImgList: TImageList;
    MainPanel: TPanel;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem9: TMenuItem;
    N4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MnuSetup: TMenuItem;
    N15: TMenuItem;
    MnuRegEdit: TMenuItem;
    Stammdaten: TJvXPBar;
    Timer1: TTimer;
    Tools: TJvXPBar;

    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MnuLog: TMenuItem;
    OFPanel1: TOFPanel;
    SBar: TStatusBar;
    XMLPropStorage1: TXMLPropStorage;
    ZMonitor1: TZSQLMonitor;
    procedure FormActivate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ChangeUser(Sender: TObject);
    procedure ChangeModul(Sender: TObject);
    procedure Mandantenverwaltung(Sender: TObject);
  private
    { private declarations }

    LastDate: tDateTime; // Merker für akt. Tag, wird zur erkennung eines
    // Tageswechsels verwendet
    LastMinute: byte;      // Wird zur Erkennung des Minutenwechsels verwendet

    LastMenu: TMainMenu;
    LastOEPage, LastOEButton, LastOEPage2, LastOEButton2: integer;

    LastModule: TJvXPBarItem;
    LastXPBar: TJvXPBar;

    help_enabled: boolean;
    InLogin: boolean;

    WinShutdown: boolean;
    procedure OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: string);
  public
    { public declarations }
    MainTVText: string;

    ActiveModul: integer; // gerade ausgewähltes Modul, siehe
    // Tag-Eigenschaft der Menüpunkte unter [MODUL]

    procedure ShowHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses
  of_var_const,
  uOF_Mandant;

{$R *.lfm}

{ TMainForm }

//------------------------------------------------------------------------------
procedure TMainForm.Mandantenverwaltung(Sender: TObject);
begin
  { TODO -oUD : Mandantenverwaltung -> of_mandantaw.pas }
  (*
  with TMandantAWForm.Create(Self) do
  begin
    try
      Left := Left + 200;
      Top := Top + 150;
      ShowModal;
    finally
      Free;
    end;
  end;
  *)
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  if length(Application.Hint) > 0 then
  begin
    Application.HintColor := $00DDFFFF;
    SBar.SimpleText := Application.Hint;
    SBar.SimplePanel := True;
  end
  else
    SBar.SimplePanel := False;
end;

procedure TMainForm.ChangeModul(Sender: TObject);
begin
  ShowMessage(Sender.ClassName);
end;

procedure TMainForm.OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung,
  Erstellt, Geaendert: string);
begin
  SBar.Panels[2].Text := SuchZeit;
  SBar.Panels[3].Text := Datensatz;
  SBar.Panels[4].Text := Sortierung;
  SBar.Panels[5].Text := Erstellt;
  SBar.Panels[6].Text := Geaendert;
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MenuItem4Click(Sender: TObject);
begin
  ChangeUser(self);
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 //
end;

procedure TMainForm.MenuItem10Click(Sender: TObject);
begin
  OFMandantLogin.NeedAdminRights := true;
  if OFMandantLogin.Login then
  begin
      // Mandant neu laden...
  end else
  begin
    if OFMandantLogin.Active then
    begin
      // Mandant neu laden...
    end else
    begin
      Application.Terminate;
    end;
  end;
end;

procedure TMainForm.MenuItem13Click(Sender: TObject);
begin
  SplashScreen.ShowModal;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  //
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SBar.Panels[7].Text := IntToStr(Width) + ' x ' + IntToStr(Height);
  Application.ProcessMessages;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  // Statuszeile löschen
  OnUpdateStatusBar('', '', '', '', '');


  //OFMandantLogin.NeedAdminRights := true;
  if OFMandantLogin.Login then
  begin
      // Mandant neu laden...
  end else
  begin
    if OFMandantLogin.Active then
    begin
      // Mandant neu laden...
    end else
    begin
      Application.Terminate;
    end;
  end;

end;

procedure TMainForm.ChangeUser(Sender: TObject);
begin
  //
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  Res: integer;
begin
  { TODO -oUD : DM1.CaoSecurity.CurrUserID ? }
  (*
  if (not WinShutdown) and ((DM1.CaoSecurity.CurrUserID > 0) and
    (DM1.ReadBooleanU('', 'ENDE_FRAGE', True))) then
  begin
    Res := MessageDlg('Wollen Sie Open-Faktura wirklich beenden ?',
      mtConfirmation, [mbYes, mbNo], 0);
    if Res = mrNo then
    begin
      CanClose := False;
      Exit;
    end;
  end;
  *)

  CanClose := true
end;


procedure TMainForm.FormCreate(Sender: TObject);
var
  chmFile: string;
  St, Mi, Se, Ms: word;
  ini: tIniFile;
  sl1, sl2: TStringList;
  P, I, II, Modul: integer;
  S, S1, S2: string;
begin
  WinShutdown := False;

  InLogin := False;
  Timer1.Enabled := False;
  LastDate := Int(Now); // akt. Tag merken

  DecodeTime(Now, St, Mi, Se, Ms);
  LastMinute := Mi;


  //Scaled:=TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  //Outlook1.ItemDoubleLine := False;
  Stammdaten.Collapsed := False;
  LastMenu := nil;
  LastOEButton := 0;
  LastOEPage := 0;
  LastOEPage2 := 0;
  LastOEButton2 := 0;

  ActiveModul := -1;

  //-----------------------------------------------------
  //DefCompanyName      := 'Open-Faktura';
  //RegUseAppTitle      := False;
  //-----------------------------------------------------


  Application.OnHint := @ShowHint;
  Application.HintColor := $00DDFFFF;
  Application.HintHidePause := 10000; // 10 Sekunden

  Application.ProcessMessages;



  //ZMonitor1.FileName := DM1.LogDir + 'cao_sql_' + FormatDateTime('yyyy_mm_dd', now) + '.log';
  //ZMonitor1.Active := True;
end;

end.
