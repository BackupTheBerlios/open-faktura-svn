{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Haupt-Modul, bindet alle anderen Module in die Oberfläche ein     }
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
  - Alpha-Code und ifdef AVE u. PRO entfernen
  - cao_menu usw. anpassen an OF
  - Windows Registry Keys (SBP) auf Funktion prüfen u. ggf. entfernen
  - Online Update und URLs prüfen, ändern oder entfernen

  ISSUES, NOTES:
  -

  HISTORY:
  13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
  17.01.2003 - Warnmeldung eingebaut, wenn Plattform nicht Windows NT, 2000 oder XP
  01.02.2003 - Outlook-Bar durch Komponente aus der Jedi-VCL ersetzt
  19.02.2003 - URL im Online-Update korrigiert
  26.04.2003 - Link zum Anwenderforum im Hilfemenü hinzugefügt
  15.05.2003 - Caption der Form geändert, wenn GNU - Version compiliert wird
  14.06.2003 - Einbindung des ShopTransfer - Modules
  06.07.2003 - Neue Buttons im Outlookbar hinzugefügt
  13.07.2003 - Menü für Mandanten geändert
  19.07.2003 - FiBu-Buchungen und -Konten entfernt
  22.07.2003 - neues Shopsetup eingebunden
  29.07.2003 - DP: HTML-Hilfe + Wartungsdaten eingebunden
  02.08.2003 - Online-Update deaktiviert
  29.08.2003 - Module werden jetzt über die Tag-Eigenschaft der Buttons ausgewählt
  23.10.2003 - PIM wird jetzt automatisch gestartet,
               damit das Termin-Popup bei fälligen Terminen kommt
  25.10.2003 - JumpTo um neue Vorgänge erweitert
  12.03.2004 - neuen Hotkey ALT+F12 für "Zurück" eingebaut
  23.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU - Gettext)
  29.09.2009 - UD:
               - Vorbereitungen für Open-Faktura.
               - Aufruf von "CAO_TextEdit.pas" und Direktive "WPTOOLS" entfernt.
               - Aufruf vom TERMINMANAGER von KommPuter entfernt.
  30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)
  28.11.2009 - UD:
               - Konstante für die Konfigurationsdatei hinzugefügt.
               - Funktionsaufruf "ExtractFilePath(ParamStr(0))" durch die
                 Globale Variaiable "APP_PATH" ersetzt.
*******************************************************************************)

unit OF_Main;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, Buttons, ImgList, ExtCtrls, Menus,
  ComCtrls, JvMenus, JvAppStorage, JvAppIniStorage, JvComponentBase,
  JvFormPlacement, ZSqlMonitor, JvExControls, JvComponent, JvOutlookBar,
  JvExExtCtrls, JvSplit, XPMenu, OF_Startup, OF_ShopTrans,

  {$IFDEF ALPHA}
  OF_EK_Bestellvorschlag, OF_Anrufe, OF_Journal_VKGS,
  {$ENDIF}

  OF_Kunde, OF_Artikel1, OF_KFZ1, OF_Inventur, OF_Export_Fibu,
  OF_MahnlaufDlg, OF_Wartung, OF_ZahlungsEingangList, OF_ZahlungsAusgangList,
  OF_Ueberweisungen, OF_Statistic, OF_Lastschriften,

  OF_Backup;

  // PITTI
  //CAO_journal_umsatz, CAO_Kunde_WG_Rabatt;

type
  TMainForm = class(TForm)
    MainMenu1: TJvMainMenu;
    SBar: TStatusBar;
    HilfeMnu: TMenuItem;
    ber1: TMenuItem;
    Timer1: TTimer;
    Mandant1: TMenuItem;
    Ansicht1: TMenuItem;
    RxSplitter1: TJvxSplitter;
    ZMonitor1: TZSQLMonitor;
    MnuLog: TMenuItem;
    MnuRegEdit: TMenuItem;
    MnuMandantChange: TMenuItem;
    N1: TMenuItem;
    Druckereinrichten1: TMenuItem;
    N2: TMenuItem;
    Beenden1: TMenuItem;
    MnuSetup: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N4: TMenuItem;
    EKPreiseanzeigen1: TMenuItem;
    MainPanel: TPanel;
    MnuBackup: TMenuItem;
    OnlineUpdate1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Fibu1: TMenuItem;
    Tools1: TMenuItem;
    Adressen1: TMenuItem;
    Artikel1: TMenuItem;
    Angebot1: TMenuItem;
    Rechnung1: TMenuItem;
    Einkauf1: TMenuItem;
    MnuAuftragEdi: TMenuItem;
    MnuVKLiefEdi: TMenuItem;
    Angebot2: TMenuItem;
    Lieferschein2: TMenuItem;
    Kasse1: TMenuItem;
    Rechnung2: TMenuItem;
    MnuAuftragJournal: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Einkaufsjournal1: TMenuItem;
    Fahrzeugstamm1: TMenuItem;
    ImageList1: TImageList;
    LeftPan: TPanel;
    Panel1: TPanel;
    ZurueckBtn: TSpeedButton;
    MnuRestore: TMenuItem;
    OpenDialog1: TOpenDialog;
    MnuDBOptimize: TMenuItem;
    Bestelljournal1: TMenuItem;
    EKBestellungbearbeiten1: TMenuItem;
    Mahnungenerstellen1: TMenuItem;
    N9: TMenuItem;
    eMailandenEntwickler1: TMenuItem;
    OlBarImgList: TImageList;
    OLBar: TJvOutlookBar;
    TextverarbeitungBriefe1: TMenuItem;
    Anwenderforum1: TMenuItem;
    Intro1: TMenuItem;
    Notizen1: TMenuItem;
    Shoptransfer1: TMenuItem;
    Vorgnge1: TMenuItem;
    Journale1: TMenuItem;
    N10: TMenuItem;
    Vertrgebearbeiten1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    MnuShopSetup: TMenuItem;
    Handbuch1: TMenuItem;
    Stammdaten1: TMenuItem;
    Kassenbuch1: TMenuItem;
    Zahlungseingang1: TMenuItem;
    Zahlungsausgang1: TMenuItem;
    berweisungen1: TMenuItem;
    ExportFibu1: TMenuItem;
    Mitarbeiter: TMenuItem;
    PIMTermine1: TMenuItem;
    Vertreter1: TMenuItem;
    VorgangImgList: TImageList;
    FindDialog1: TFindDialog;
    Statistik1: TMenuItem;
    Lastschriften1: TMenuItem;
    Zurck1: TMenuItem;
    N8: TMenuItem;
    MnuUserChange: TMenuItem;
    Kennwortndern1: TMenuItem;
    N15: TMenuItem;
    Browser1: TMenuItem;
    MnuVKGSJournal: TMenuItem;
    JvFormStorage1: TJvFormStorage;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvXPMenuItemPainter1: TJvXPMenuItemPainter;
    XPMenu1: TXPMenu;
    
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure MnuLogClick(Sender: TObject);
    procedure MnuRegEditClick(Sender: TObject);
    procedure Wechseln1Click(Sender: TObject);
    procedure ber1Click(Sender: TObject);
    procedure MnuSetupClick(Sender: TObject);
    procedure Druckereinrichten1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure EKPreiseanzeigen1Click(Sender: TObject);
    procedure MnuBackupClick(Sender: TObject);
    procedure OnlineUpdate1Click(Sender: TObject);
    procedure ModulAuswahlClick(Sender: TObject);
    procedure ZurueckBtnClick(Sender: TObject);
    procedure MnuRestoreClick(Sender: TObject);
    procedure MnuDBOptimizeClick(Sender: TObject);
    procedure JPSOFTHomepage1Click(Sender: TObject);
    procedure eMailandenEntwickler1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OLBarButtonClick(Sender: TObject; Index: Integer);
    procedure Anwenderforum1Click(Sender: TObject);
    procedure Intro1Click(Sender: TObject);
    procedure MnuShopSetupClick(Sender: TObject);
    procedure Handbuch1Click(Sender: TObject);
    procedure MnuUserChangeClick(Sender: TObject);
    procedure Kennwortndern1Click(Sender: TObject);
    procedure ZMonitor1LogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure ZMonitor1Trace(Sender: TObject; Event: TZLoggingEvent; var LogTrace: Boolean);
  private
    { Private-Deklarationen}
    
    LastDate   : tDateTime; // Merker für akt. Tag, wird zur erkennung eines
    // Tageswechsels verwendet
    LastMinute : Byte;      // Wird zur Erkennung des Minutenwechsels verwendet

    LastMenu   : TJvMainMenu;
    LastOEPage,
    LastOEButton,
    LastOEPage2,
    LastOEButton2: Integer;

    help_enabled : Boolean;
    InLogin      : Boolean;
    
    WinShutdown  : Boolean;
    
    procedure WMEndSession(var Msg: TWMEndSession); message WM_ENDSESSION;
    procedure OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String);
    procedure SetHelpContext;
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
  public
    { Public-Deklarationen}
    
    MainTVText      : String;
    F9              : Boolean;
    SScreenDelay    : Integer;
    
    AddrForm        : TAdressForm; // für Belegerstellung Adressdialog
    ArtForm         : TArtikelForm;
    KFZForm2        : TKFZForm;
    InventurForm    : TInventurForm;
    ExportFibuForm  : TExportFibuForm;
    MahnForm        : TMahnForm;
    
    {$IFDEF AVE}
    ShopMainForm    : TShopMainForm;
    AVEShopTransForm: TAVEShopTransForm;
    {$ENDIF}
    
    WartungsForm    : TWartungsForm;
    ZahlForm        : TZahlForm;
    ZahlAusForm     : TZahlAusForm;
    UeberweisungForm: TUeberweisungForm;
    StatisticForm   : TStatisticForm;
    LastschriftForm : TLastschriftForm;
    
    {$IFDEF ALPHA}
    EBBestVorForm   : TEBBestVorForm;
    {$ENDIF}

    ActiveModul     : Integer; // gerade ausgewähltes Modul, siehe
    // Tag-Eigenschaft der Menüpunkte unter [MODUL]

    procedure ShowHint(Sender: tObject);

    procedure JumpTo(Modul, ID, Jahr: Integer; BelegNeu: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

uses
  GNUGetText,
  {JvAppUtils,} JvJVCLUtils, IniFiles, ShellApi,

  OF_DM, OF_Var_Const, OF_Tool1,

  {$IFNDEF ALPHA}
  OF_Mandantaw,
  {$ENDIF}

  OF_Login, OF_User_PW_Change, OF_Browser,
  OF_Info, OF_Logging, OF_RegEdit, OF_Setup, OF_DBOptimize,
  OF_Register,

  OF_PLZ, OF_BLZ, OF_Pim, OF_Mitarbeiter,

  OF_MakeVKRech, OF_MakeEKRech, OF_MakeVertragRech,

  OF_Journal_VKRE, OF_Journal_VKLIEF, OF_Journal_EKRE,
  OF_Journal_VKAGB, OF_Journal_VKKASSE, OF_Journal_EKBEST,

  OF_Export, OF_Restore,

  OF_FibuKassenbuch,

  OF_ShopSetup,

  {$IFDEF ALPHA}
  CAO_MakeEKBest_13,
  CAO_MakeEKPreisAnfrage,
  CAO_Journal_VKAuftrag,
  CAO_MakeVKGS,
  //CAO_MakeVKAuftrag,
  {$ELSE}
  OF_MakeEKBest,
  {$ENDIF}

  VolPeriod, OF_About, OF_Vertreter;

  //OLD: FileCtrl,

(*
  //Pitti
  CAO_VertreterAbrechnung,
  CAO_MakeVKLief,
  CAO_journal_umsatz_vertreter;
*)

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TMainForm.WMEndSession(var Msg: TWMEndSession);
begin
  WinShutdown := True;
  Msg.Result  := 0;
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormCreate(Sender: TObject);
var
  chmFile : String;
  St, Mi,
  Se, Ms  : Word;
  ini     : tIniFile;
  sl1, sl2: tstringlist;
  Page    : TJvOutlookBarPage;
  Button  : TJvOutlookBarButton;
  P, I, II,
  Modul   : Integer;
  S, S1, S2 : String;

begin
  try TranslateComponent(self);
  except
  end;

  WinShutdown := False;

  InLogin := False;
  Timer1.Enabled := False;
  LastDate := Int(Now); // akt. Tag merken

  DecodeTime(Now, St, Mi, Se, Ms);
  LastMinute := Mi;


  InventurForm     := nil;
  ExportFibuForm   := nil;
  MahnForm         := nil;

  {$IFDEF AVE}
  ShopMainForm     := nil;
  AVEShopTransForm := nil;
  {$ELSE}

  // Eintrag für Shopartikel löschen
  OLBar.Pages[4].Buttons[3].Free;

  {$ENDIF}
  SScreenDelay := 0;
  //Scaled:=TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  //Outlook1.ItemDoubleLine := False;
  OLBar.ActivePageIndex   := 0;
  LastMenu            := nil;
  LastOEButton        := 0;
  LastOEPage          := 0;
  LastOEPage2         := 0;
  LastOEButton2       := 0;

  ActiveModul         := -1;

  //-----------------------------------------------------
  DefCompanyName      := 'Open-Faktura';
  RegUseAppTitle      := False;
  //-----------------------------------------------------


  AddrForm         := nil;
  ArtForm          := nil;
  KFZForm2         := nil;
  WartungsForm     := nil;
  ZahlForm         := nil;
  ZahlAusForm      := nil;
  UeberweisungForm := nil;
  StatisticForm    := nil;
  LastschriftForm  := nil;

  {$IFDEF ALPHA}
  MnuMandantChange.Visible := False;
  EBBestVorForm    := nil;
  {$ELSE}
  OLBar.Pages[1].Buttons[1].Free; //VK-Auftrag
  OLBar.Pages[1].Buttons[4].Free; //EK-Bestellvorschläge
  OLBar.Pages[1].Buttons[4].Free; //EK-Preisanfrage
  OLBar.Pages[1].Buttons[7].Free; //Anrufe

  OLBar.Pages[2].Buttons[1].Free; //VK-Auftrag-Journal
  OLBar.Pages[2].Buttons[4].Free; //VK-Gutschriften-Journal

  MnuMandantChange.Visible  := True;
  MnuVKGSJournal.Visible    := False;
  MnuAuftragJournal.Visible := False;
  MnuVKLiefEdi.Visible      := False;
  MnuAuftragEdi.Visible     := False;
  {$ENDIF}


  //-------------------------------------------------------------------------

  if fileexists(APP_PATH + 'cao_menu.txt') then
  begin
    while OLBar.Pages.Count > 0 do
    begin
      while OLBar.Pages[OLBar.Pages.Count-1].Buttons.Count > 0 do
      begin
        OLBar.Pages[OLBar.Pages.Count-1].Buttons[OLBar.Pages[OLBar.Pages.Count-1].Buttons.Count-1].Free;
      end;
      OLBar.Pages[OLBar.Pages.Count-1].Free;
    end;

    sl1 := tStringList.Create;
    sl2 := tStringList.Create;

    try
      ini := tIniFile.Create(APP_PATH + 'cao_menu.txt');
      try
        ini.ReadSections(sl1);

        if sl1.Count > 0 then
        begin
          for p := 0 to sl1.count-1 do
          begin
            Page := OLBar.Pages.Add;
            Page.Caption := sl1.Strings[p];

            sl2.Clear;

            Ini.ReadSection(Page.Caption, SL2);

            if sl2.Count > 0 then
            begin
              for i := 0 to sl2.count-1 do
              begin
                S  := sl2.Strings[i];
                S1 := Ini.ReadString(Page.Caption, S, '');
                S2 := Ini.ReadString(Page.Caption, S, '');

                while Pos('|', S1) > 0 do delete(S1, length(S1), 1);
                while Pos('|', S2) > 0 do delete(S2, 1, 1);

                II := StrToIntDef(S2, 0);
                if II > OlBarImgList.Count-1 then II := 0;
                Modul := StrToIntDef(S1, -1);

                if (length(S) > 0) and (Modul > -1) then
                begin
                  Button := OLBar.Pages[OLBar.Pages.Count-1].Buttons.Add;

                  Button.Caption     := S;
                  Button.Tag         := Modul;
                  Button.ImageIndex  := II;
                end;
              end;
            end;
          end;
        end;
      finally
        Ini.Free;
      end;
    finally
      SL1.Free;
      SL2.Free;
    end;
  end;

  //-------------------------------------------------------------------------

  F9 := True;

  Application.OnHint := ShowHint;
  Application.HintColor := $00DDFFFF;
  Application.HintHidePause := 10000; // 10 Sekunden


  OnlineUpdate1.Visible := False;
  N6.Visible := False;
  {$IFDEF PRO}
  {$IFNDEF ALPHA}
  OnlineUpdate1.Visible := True;
  N6.Visible := True;
  {$ENDIF}
  {$ENDIF}

  //ZMonitor1.FileName := DM1.LogDir + 'cao_sql_' + FormatDateTime('yyyy_mm_dd', now) + '.log';
  //ZMonitor1.Active := True;
end;

//------------------------------------------------------------------------------
function TMainForm.FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  ShowMessage(_('Das Hilfesystem befindet sich im Aufbau ' +
        'und ist im Moment deaktiviert.'));
end;

//------------------------------------------------------------------------------
procedure TMainForm.FormShow(Sender: TObject);
var
  B: TJvOutlookBarButton;
begin
  SetHelpContext;

  if not CheckRegister (Self, True) then
  begin 
    Close; 
    Exit; 
  end;
  DM1.OF_SN := GetSerialNum;

  {
  MessageDlg (
  'Aktuelle KW: '+IntToStr(Kalenderwoche(now))+#13#10+
  'Erster Tag der Woche :'+FormatDateTime ('dd.mm.yyyy',FirstDayOfWeek(Now))+#13#10+
  'Letzer Tag der Woche :'+FormatDateTime ('dd.mm.yyyy',LastDayOfWeek(Now))
  ,mtinformation,[mbok],0);
  }

  DM1.C2Color   := $00DDFFFF; // hellgelb
  DM1.EditColor := $00A0FFFF; //$009FFF9F; // Hellgrün
  // Statuszeile löschen
  OnUpdateStatusBar('', '', '', '', '');

  // auf Dateiupdate des Online-Updaters prüfen
  if fileexists(APP_PATH + 'cao_update.exe.dat') then
  begin
    if fileexists(APP_PATH + 'cao_update.exe.old') then
      deletefile(APP_PATH + 'cao_update.exe.old');

    renamefile(APP_PATH + 'cao_update.exe', APP_PATH + 'cao_update.exe.old');

    renamefile(APP_PATH + 'cao_update.exe.dat', APP_PATH + 'cao_update.exe');
  end;

  if Assigned(SScreen) then
  begin
    SScreen.PBar.Visible := False;
    SScreen.Height := SScreen.Height + SScreen.Height - SScreen.ClientHeight;
    SScreen.Invalidate;
    Application.ProcessMessages;
  end;

  if (DM1.CaoSecurity.CurrUserID < 0) and (not InLogin) then
  begin
    MnuUserChangeClick(Self);

    if DM1.CaoSecurity.CurrUserID > -1 then
      SBar.Panels[0].Text := DM1.view_user;
  end;

  if (DM1.CaoSecurity.CurrUserID > 0) then
  begin
    LogForm.LogEnabled  := DM1.ReadBooleanU('', 'SQL_LOG_AKTIV', False);
    LogForm.LogMaxEntry := DM1.ReadIntegerU('', 'SQL_LOG_MAX', LogForm.LogMaxEntry);

    if not DM1.USE_KFZ then
    begin
      if OLBar.Pages[0].Buttons[3].Caption = _('Fahrzeuge') then
      begin
        OLBar.Pages[0].Buttons[3].Free;
        Fahrzeugstamm1.Visible := False;
      end;
    end else
    begin
      if OLBar.Pages[0].Buttons[3].Caption<>_('Fahrzeuge') then
      begin
        B := OLBar.Pages[0].Buttons.Insert(3);
        B.Caption := _('Fahrzeuge');
        B.ImageIndex := 3;
        B.Tag := 1030;
        Fahrzeugstamm1.Visible := True;
      end;
    end;

    //SBar.Panels[0].Text :=DM1.view_user;

    CurrencyString   := DM1.LeitWaehrung;
    CurrencyDecimals := 2;

    // Modulinitalisierung nach Mandantenwechsel erzwingen !!!
    ArtikelForm.First       := True;
    AdressForm.First        := True;
    KFZForm.First           := True;

    MakeVKREForm.First      := True;
    MakeVKREForm.SetBelegArt(VK_RECH_EDI);

    MakeEKREForm.First      := True;

    MakeAGBForm.First       := True;
    MakeAGBForm.SetBelegArt(VK_AGB_EDI);

    {$IFDEF ALPHA}
    MakeVKAuftragForm.First := True;
    MakeVKAuftragForm.SetBelegArt(VK_AUF_EDI);
    {$ENDIF}

    MakeEKBestForm.First    := True;
    MakeVertragReForm.First := True;

    // neu, dynamisch erzeugte Fenster freigeben !!!
    if Assigned(AddrForm)         then FreeAndNil(AddrForm);
    if Assigned(ArtForm)          then FreeAndNil(ArtForm);
    if Assigned(KFZForm2)         then FreeAndNil(KFZForm2);
    if Assigned(ZahlForm)         then FreeAndNil(ZahlForm);
    if Assigned(ZahlAusForm)      then FreeAndNil(ZahlAusForm);
    if Assigned(InventurForm)     then FreeAndNil(InventurForm);
    if Assigned(MahnForm)         then FreeAndNil(MahnForm);
    if Assigned(UeberweisungForm) then FreeAndNil(UeberweisungForm);
    if Assigned(ExportFibuForm)   then FreeAndNil(ExportFibuForm);
    if Assigned(WartungsForm)     then FreeAndNil(WartungsForm);
    if Assigned(LastschriftForm)  then FreeAndNil(LastschriftForm);
    {$IFDEF ALPHA}
    if Assigned(EBBestVorForm)    then FreeAndNil(EBBestVorForm);
    {$ENDIF}

    if DM1.CaoSecurity.CurrUserID > -1 then
    begin
      PIMForm.Init;
      try
        // Letztes Modul wieder herstellen
        OLBar.ActivePageIndex := DM1.ReadIntegerU('', 'LastLeftMenuGrp', 0);
        OLBarButtonClick(self, DM1.ReadIntegerU('', 'LastLeftMenuBtn', -1));
      except
      end;

      // F9-Status wiederherstellen

      EKPreiseAnzeigen1.Enabled := DM1.CaoSecurity.CanEKView(1020, 0);

      F9 := (DM1.ReadBooleanU('', 'LastF9Status', True)) and (DM1.CaoSecurity.CanEKView(1020, 0));

      EKPreiseanzeigen1.Checked := F9;
      if ArtikelForm.ArtikelPanel.Parent  = MainPanel then ArtikelForm.F9Change(F9);
      if MakeVkReForm.RePanel.Parent      = MainPanel then MakeVkReForm.F9Change(F9);
      if MakeAGBForm.RePanel.Parent       = MainPanel then MakeAGBForm.F9Change(F9);
      {$IFDEF ALPHA}
      if MakeVKAuftragForm.RePanel.Parent = MainPanel then MakeVKAuftragForm.F9Change(F9);
      if MakeVKGSForm.RePanel.Parent      = MainPanel then MakeVKGSForm.F9Change(F9);
      {$ENDIF}
    end;


    if GNU then
    begin
      Caption := Application.Title + ' (' + GetProjectVersion + ')' +
        ' - Mandant : ' +
        DM1.AktMandant +
        '              GNU Compiled Version'
    end else
    begin
      Caption := 'gibt es nicht !!!';
    end;

    if not Assigned(SScreen) then
      SScreenDelay := 5;


    MainPanel.Color := clBtnFace;
    Timer1.Enabled := True;
    Timer1Timer(Sender);

    MainPanel.Width := MainPanel.Width-1;


    //Funktionen je nach Berechtigung aktivieren
    MnuMandantChange.Enabled := DM1.CaoSecurity.CanOpenModul(9010, 0);
    MnuSetup.Enabled         := DM1.CaoSecurity.CanOpenModul(9020, 0);
    MnuShopSetup.Enabled     := DM1.CaoSecurity.CanOpenModul(9030, 0);
    MnuBackup.Enabled        := DM1.CaoSecurity.CanOpenModul(9040, 0);
    MnuRestore.Enabled       := DM1.CaoSecurity.CanOpenModul(9050, 0);
    MnuRegEdit.Enabled       := DM1.CaoSecurity.CanOpenModul(9060, 0);
    MnuLog.Enabled           := DM1.CaoSecurity.CanOpenModul(9070, 0);
    MnuDBOptimize.Enabled    := DM1.CaoSecurity.CanOpenModul(9080, 0);
  end;

  CheckRegister2;

  if (DM1.CaoSecurity.CurrUserID <= 0) then
    Close;

  {$IFDEF ALPHA}
  if Now > EncodeDate(2005, 12, 31) then
  begin
    MessageDlg('Die ALPHA-Testphase ist abgelaufen' + #13#10 +
      'Open-Faktura wird beendet.', mtinformation, [mbok], 0);

    WinShutdown := True; // Damit wird die Ende-Frage unterdrückt
    Close;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Res: Integer;
  {$IFDEF AVE}
  ST: tDateTime;
  {$ENDIF}
begin
  if (not WinShutdown) and
     ((DM1.CaoSecurity.CurrUserID > 0) and
     (DM1.ReadBooleanU('', 'ENDE_FRAGE', True))) then
  begin
    Res := MessageDlg(_('Wollen Sie Open-Faktura wirklich beenden ?'),
    mtConfirmation, [mbyes, mbNo], 0);
    if Res = mrNo then
    begin
      CanClose := False;
      Exit;
    end;
  end;

  try
    Timer1.Enabled := False;

    if DM1.DB1.Connected then
    begin
      // aktuellen Zustand speichern
      DM1.WriteIntegerU('', 'LastLeftMenuGrp', OLBar.ActivePageIndex);
      DM1.WriteIntegerU('', 'LastLeftMenuBtn', LastOEButton);
      DM1.WriteBooleanU('', 'LastF9Status'   , F9);

      CheckRegister4;
    end;

    // alles aushängen
    OLBarButtonClick(self, -1);

    // SQL-Monitor aus
    ZMonitor1.Active := False;
    ZMonitor1.OnLogTrace := nil;
    ZMonitor1.OnTrace := nil;
    { TODO : Monitor anpassen }
    //ZMonitor1.Transaction := nil;  //17.10.09-ud. gibt es nicht mehr.
    //ZMonitor1.OnMonitorEvent := nil; //17.10.09-ud. Monitorevent testen.

    // DB schliessen
    if DM1.DB1.Connected then
      DM1.DB1.Disconnect;
    //DM1.Transact1.Database := nil; //17.10.09-ud. gibt es nicht mehr.


    {$IFDEF AVE}
    if (Assigned(SSHForm)) and (SSHForm.EndeBtn.Enabled) then
    begin
      SSHForm.Show;
      SSHForm.Logout;
      ST := Now();
      repeat
        Application.ProcessMessages;
      until (SSHForm.EndeBtn.Enabled = False)or
      (Now > ST + (1 / 24 / 60 / 60) * 30); // max. 30 Sek.
    end;
    {$ENDIF}
  except
  end;

  canclose := True;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Timer1Timer(Sender: TObject);
var
  St, Mi, Se, Ms: Word;
begin
  if DM1.RestoreRun then
    Exit;

  if SScreenDelay < 3 then
  begin
    inc(SScreenDelay);
    if Assigned(SScreen) then
      SScreen.Update;
  end else
  if SScreenDelay = 3 then
  begin
    inc(SScreenDelay);
    // SplashScreen abschalten
    if Assigned(SScreen) then
    begin
      //SScreen.Hide;
      SScreen.Free;
      SScreen := nil;
    end;

    // Prüfen, of Plattform NT ist, sonst Warnung ausgeben.
    if (not IsNT) and
       (DM1.ReadBoolean('MAIN', 'NOT_NT_WARNING', True)) and
       (not DM1.IsLinux) then
    begin
      MessageDlg(_('Open-Faktura unterstützt das von Ihnen eingesetzte ' +
        'Betriebssystem nicht.' + #13#10 +
        'Dies kann zu schweren Programmfehlern führen.' + #13#10 +
        'Bitte verwenden Sie Windows NT, ' +
        'Windows 2000 oder Windows XP !'), mterror, [mbok], 0);
    end;
  end else
  if (SScreenDelay > 3) and (SScreenDelay < 100) and (DM1.DB1.Connected) then
  begin
    inc(SScreenDelay);

    if (SScreenDelay = 6) and (DM1.CaoSecurity.CurrUserID < 0) then
    begin
      Close;
    end;

    if SScreenDelay = 10 then
    begin
      // Notizen prüfen
      if DM1.AktMandant <> '' then
        InfoForm.PruefeWiedervorlage;
    end;

    if SScreenDelay = 15 then
    begin
      // Verträge prüfen
      if DM1.AktMandant <> '' then
        MakeVertragReForm.PruefeVertraege;
    end;
  end else
  if SScreenDelay = 100 then
  begin
    if Int(Now) > LastDate then
    begin
      // Tageswechsel
      LastDate := Int(Now);
      SScreenDelay := 5;
    end;
  end;

  try
    SBar.Panels[1].Text := FormatFloat(',##0.00', AllocMemSize / 1024 / 1024) + ' MB';
    if (Assigned(AboutBox)) and (AboutBox.Visible) then
      AboutBox.Timer1Timer(Self);
  except
  end;

  DecodeTime(Now, St, Mi, Se, Ms);
  if (LastMinute <> Mi) and (Mi and 1 = 1) then
  begin
    LastMinute := Mi;
    
    // MySQL anpingen damit nicht disconnected wird
    try
      if DM1.DB1.Connected then
      begin
        DM1.DB1.Ping;
        CheckRegister3;
      end;
    except
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.ZMonitor1MonitorEvent(Sql, Result: String);
var
  d: string;
  F: TextFile;
begin
  if not DM1.SqlLog then
    Exit;

  try
    if Assigned(LogForm) then
      LogForm.AddLog('SQL:' + sql + #13#10 + 'RES:' + Result + #13#10);

    if (UpperCase(DM1.CAOSecurity.Curruser) = 'JAN') and (UpperCase(DM1.Comp) = 'JPC') then
    begin
      d := DM1.LogDir + 'cao_sql_' + FormatDateTime('yyyy_mm_dd', now) + '.log';
      if not FileExists(d) then
        FileClose(FileCreate(d));
      AssignFile(F, d);
      Append(F);
      try
        WriteLn(F, 'SQL:' + Sql + #13#10 + 'RES:' + Result);
      finally
        CloseFile(F);
      end;
    end;
  except
  end;
end;

procedure TMainForm.ZMonitor1LogTrace(Sender: TObject; Event: TZLoggingEvent);
var
  d: string;
  F: TextFile;
begin
  if not DM1.SqlLog then
    Exit;

  try
    if Assigned(LogForm) then
      LogForm.AddLog('SQL:' + Event.Message + #13#10);

    if (UpperCase(DM1.CAOSecurity.Curruser) = 'JAN') and (UpperCase(DM1.Comp) = 'JPC') then
    begin
      d := DM1.LogDir + 'cao_sql_' + FormatDateTime('yyyy_mm_dd', now) + '.log';
      if not FileExists(d) then
        FileClose(FileCreate(d));
      AssignFile(F, d);
      Append(F);
      try
        WriteLn(F, 'SQL:' + Event.Message);
      finally
        CloseFile(F);
      end;
    end;
  except
  end;
end;

procedure TMainForm.ZMonitor1Trace(Sender: TObject; Event: TZLoggingEvent; var LogTrace: Boolean);
begin
//
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuLogClick(Sender: TObject);
begin
  LogForm.Show;
  if Assigned(LastMenu) then
    MainMenu1.Merge(LastMenu);
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuRegEditClick(Sender: TObject);
var
  RegEdiForm: TRegEdiForm;
begin
  RegEdiForm := TRegEdiForm.Create(Self);
  try
    RegEdiForm.ShowModal;
  finally
    FreeAndNil(RegEdiForm);
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Wechseln1Click(Sender: TObject);
begin
  {$IFNDEF ALPHA}
  with TMandantAWForm.Create(Self) do
  begin
    try
      Left := Left + 200;
      Top  := Top + 150;
      ShowModal;
    finally
      Free;
    end;
  end;
  {$ENDIF}
end;  

//------------------------------------------------------------------------------
procedure TMainForm.ber1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuSetupClick(Sender: TObject);
var
  SetupForm: TSetupForm;
begin
  // aktuellen Zusatnd speichern
  DM1.WriteIntegerU('', 'LastLeftMenuGrp', OLBar.ActivePageIndex);
  DM1.WriteIntegerU('', 'LastLeftMenuBtn', LastOEButton);

  // alles ausblenden bzw. Module schließen
  LastOEPage            := -1;
  LastOEButton          := -1;
  OLBar.ActivePageIndex := 0;

  OLBarButtonClick(Sender, -1);

  MainPanel.Color := clBtnFace;

  SetupForm := TSetupForm.Create(Self);
  try
    SetupForm.ShowModal;
  finally
    FreeAndNil(SetupForm);
  end;

  // Initalisierung erzwingen !!!

  ArtikelForm.First   := True;
  AdressForm.First    := True;

  MakeVKREForm.First  := True;
  MakeEKREForm.First  := True;
  MakeAGBForm.First   := True;

  FormShow (Sender);
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuShopSetupClick(Sender: TObject);
var
  ShopSetupForm: TShopSetupForm;
begin
  LastOEPage            := -1;
  LastOEButton          := -1;
  OLBar.ActivePageIndex := 0;

  OLBarButtonClick(Sender, -1);

  MainPanel.Color := clBtnFace;

  ShopSetupForm := TShopSetupForm.Create(Self);
  try
    ShopSetupForm.ShowModal;
  finally
    ShopSetupForm.Free;
  end;

  // Italisierung erzwingen !!!

  ArtikelForm.First   := True;
  AdressForm.First    := True;

  MakeVKREForm.First  := True;
  MakeEKREForm.First  := True;
  MakeAGBForm.First   := True;

  MainPanel.Color := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Druckereinrichten1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Beenden1Click(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
procedure TMainForm.EKPreiseanzeigen1Click(Sender: TObject);
begin
  if not DM1.CaoSecurity.CanEKView(1020, 0) then 
    Exit;

  EKPreiseanzeigen1.Checked := not EKPreiseanzeigen1.Checked;
  F9 := EKPreiseanzeigen1.Checked;

  if ArtikelForm.ArtikelPanel.Parent = MainPanel then
    ArtikelForm.F9Change(F9);
  if MakeVkReForm.RePanel.Parent = MainPanel then
    MakeVkReForm.F9Change(F9);
  if MakeAGBForm.RePanel.Parent = MainPanel then
    MakeAGBForm.F9Change(F9);
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuBackupClick(Sender: TObject);
var
  BackupForm: TBackupForm;
begin
  BackupForm := tBackupForm.Create(Self);
  try
    BackupForm.ShowModal;
  finally
    FreeAndNil(BackupForm);
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.OnlineUpdate1Click(Sender: TObject);
{$IFDEF PRO}
var
  i            : integer;
  up           : boolean;
  ini, cfg      : tIniFile;
  d, v, v1,

  URL          : String;
  HTTP_USER    : String;
  HTTP_PASS    : String;

  Proxy_IP     : String;
  Proxy_Port   : Integer;
  Proxy_User   : String;
  Proxy_Pass   : String;


  HTTP1        : TIdHTTP;
  MyStream     : TMemoryStream;
  Error        : Boolean;
  {$ENDIF}
begin
  {$IFDEF PRO}
  try
    if fileexists(APP_PATH + 'cao_update.ini') then
      sysutils.deletefile(APP_PATH + 'cao_update.ini');

    Screen.Cursor := crHourGlass;
    try
      ini := TIniFile.create(APP_PATH + CFG_FILENAME);
      try
        URL          := ini.readstring('UPDATE', 'UPDATE_SERVER', 'http://www.ave-rassmann.de/cao/');
        HTTP_USER    := ini.readstring('UPDATE', 'UPDATE_USER'  , 'cao-faktura');
        HTTP_PASS    := ini.readstring('UPDATE', 'UPDATE_SECRET', 'kHfF4!9=');


        Proxy_port   := ini.readinteger('UPDATE', 'PROXY_PORT', -1);
        if Proxy_port = -1 then
        begin
          Proxy_port := 3128;
          ini.writeinteger ('UPDATE', 'PROXY_PORT', 3128);
        end;

        proxy_ip := ini.readstring('UPDATE', 'PROXY_IP', '@@@');
        if proxy_ip = '@@@' then
        begin
          proxy_ip := '';
          ini.writestring('UPDATE', 'PROXY_IP', '');
        end;

        proxy_user := ini.readstring('UPDATE', 'PROXY_USER', '@@@');
        if proxy_user = '@@@' then
        begin
          proxy_user := '';
          ini.writestring('UPDATE', 'PROXY_USER', '');
        end;

        proxy_pass := ini.readstring('UPDATE', 'PROXY_PASS', '@@@');
        if proxy_pass = '@@@' then
        begin
          proxy_pass := '';
          ini.writestring('UPDATE', 'PROXY_PASS', '');
        end;
      finally
        ini.free;
      end;

      Error := False;
      try
        HTTP1 := TIdHTTP.Create(Self);
        MyStream := tMemoryStream.Create;

        HTTP1.Request.Username := HTTP_USER;
        HTTP1.Request.Password := HTTP_PASS;
        HTTP1.Request.BasicAuthentication := True;
        HTTP1.HttpOptions := [hoInProcessAuth];

        HTTP1.ProxyParams.BasicAuthentication := length(Proxy_IP) > 0;
        HTTP1.ProxyParams.ProxyPassword       := Proxy_Pass;
        HTTP1.ProxyParams.ProxyPort           := Proxy_Port;
        HTTP1.ProxyParams.ProxyServer         := Proxy_IP;
        HTTP1.ProxyParams.ProxyUsername       := Proxy_User;
        try
          HTTP1.Get(URL + 'cao_update.ini', MyStream);
        except
          on e: exception do
          begin
            if e is EIdConnClosedGracefully then
            begin
              error := False;
            end else
            begin
              MessageDlg('Übertragungsfehler :' + #13#10 +
              e.message + #13#10 + #13#10 +
              'Überprüfen Sie die URL''s und Benutzername/Paßwort.',
              mterror, [mbok], 0);
              error := true;
            end;
          end;
        end;
      finally
        if not Error then
        begin
          MyStream.Position := 0;
          if MyStream.Size > 0 then
            MyStream.SaveToFile(APP_PATH + 'cao_update.ini');
        end;

        HTTP1.free;
        MyStream.Free;
      end;
    finally
      Screen.Cursor := crDefault;
    end;

    if fileexists(APP_PATH + 'cao_update.ini') then
    begin
      // Auf Update Prüfen ...

      up := False;

      ini := tinifile.create(APP_PATH + 'cao_update.ini');
      try
        cfg := tinifile.create(APP_PATH + CFG_FILENAME);
        try
          for i := 1 to 100 do
          begin
            d := ini.readstring('MAIN', 'FILE' + inttostr(i), '');
            if d <> '' then
            begin
              v := ini.readstring('FILE' + Inttostr(i), 'VERSION', '');
              if v <> '' then
              begin
                v1 := cfg.readstring('VERSION', d, '???');
                if v1 <> v then
                  up := true;
              end;
            end;
          end;
        finally
          cfg.free;
        end;
      finally
        ini.free;
      end;

      if up then
      begin
        if MessageDlg(_('Ein Update ist Verfügbar.' + #13#10 +
             'Wollen Sie das Update ausführen ?'),
             mtconfirmation, mbyesnocancel, 0) = mryes then
        begin
          //Update-Prg. starten
          DM1.StarteNewProgramm(APP_PATH + 'cao_update.exe', '', APP_PATH);

          //Beenden...
          DM1.CaoSecurity.CurrUser := '';
          Close;
        end;
      end else
      begin
        MessageDlg(_('Zur Zeit ist keine neuere Version verfügbar,' + #13#10 +
            'ihr Programm ist auf dem aktuellen Stand.'),
            mtinformation, [mbok], 0);

      end;
    end else
    begin
      MessageDlg(_('Entweder ist keine neuere Version verfügbar,' + #13#10 +
          'oder es ist bei der Update-Anfrage bei AVE-RASSMANN.DE' + #13#10 +
          'ein Fehler aufgetreten.' + #13#10 +
          'Versuchen Sie es zu einem späteren Zeitpunkt noch einmal.'),
          mtinformation, [mbok], 0);
    end;
  except
    MessageDlg(_('Entweder ist keine neuere Version verfügbar,' + #13#10 +
          'oder es ist bei der Update-Anfrage bei AVE-RASSMANN.DE' + #13#10 +
          'ein Fehler aufgetreten.' + #13#10 +
          'Versuchen Sie es zu einem späteren Zeitpunkt noch einmal.'),
          mtinformation, [mbok], 0);
  end;
  {$ELSE}
  MessageDlg(_('Das Online-Update steht in dieser Version nicht zur Verfügung !'), mtinformation, [mbok], 0);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TMainForm.ModulAuswahlClick(Sender: TObject);
begin
  if tMenuItem(Sender).Tag = 0 then
    Exit;

  OLBar.ActivePageIndex := trunc(tMenuItem(Sender).Tag div 10);
  OLBarButtonClick(Self, tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TMainForm.ShowHint (Sender: tObject);
begin
  if length(Application.Hint) > 0 then
  begin
    Application.HintColor := $00DDFFFF;
    SBar.SimpleText := Application.Hint;
    SBar.SimplePanel := True;
  end else
    SBar.SimplePanel := False;
end;

//------------------------------------------------------------------------------
procedure TMainForm.ZurueckBtnClick(Sender: TObject);
begin
  if LastOEButton2 < 0 then
    Exit;

  OLBar.ActivePageIndex := LastOEPage2;
  OLBarButtonClick(Sender, LastOEButton2);
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuRestoreClick(Sender: TObject);
var
  RestoreForm: TRestoreForm;
begin
  LastOEButton          := -1;
  LastOEPage            := -1;
  OLBar.ActivePageIndex := 0;

  OLBarButtonClick(Sender, -1);

  RestoreForm := TRestoreForm.Create(Self);
  try
    RestoreForm.ShowModal;
  finally
    RestoreForm.Free;
  end;

  FormShow(Sender);
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuDBOptimizeClick(Sender: TObject);
var
  DBForm: TDBForm;
begin
  DBForm := TDBForm.Create(Self);
  try
    DBForm.ShowModal;
  finally
    FreeAndNil(DBForm);
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String);
begin
  SBar.Panels[2].Text := SuchZeit;
  SBar.Panels[3].Text := Datensatz;
  SBar.Panels[4].Text := Sortierung;
  SBar.Panels[5].Text := Erstellt;
  SBar.Panels[6].Text := Geaendert;
end;

//------------------------------------------------------------------------------
procedure TMainForm.JPSOFTHomepage1Click(Sender: TObject);
begin
  DM1.StarteNewProgramm('http://www.cao-wawi.de/', '', '');
end;

//------------------------------------------------------------------------------
procedure TMainForm.Anwenderforum1Click(Sender: TObject);
begin
  DM1.StarteNewProgramm('http://forum.open-faktura.org/', '', '');
end;

//------------------------------------------------------------------------------
procedure TMainForm.eMailandenEntwickler1Click(Sender: TObject);
begin
  //DM1.StarteNewProgramm ('mailto:cao-develop@jp-soft.de?subject=Cao-Faktura','','');
end;

//------------------------------------------------------------------------------
procedure TMainForm.FormActivate(Sender: TObject);
begin
  if Assigned(LastMenu) then
    MainMenu1.Merge(LastMenu);
end;

//------------------------------------------------------------------------------
procedure TMainForm.FormResize(Sender: TObject);
begin
  SBar.Panels[7].Text := IntToStr(Width) + ' x ' + IntToStr(Height);
end;

//------------------------------------------------------------------------------
procedure TMainForm.OLBarButtonClick(Sender: TObject; Index: Integer);
var
  I, Modul: integer;
begin
  //ggf. Suchdialog ausblenden
  Finddialog1.CloseDialog;
  Finddialog1.OnFind := nil;

  if Sender is TJVOutlookBar then
    Modul := OLBar.Pages[OLBar.ActivePageIndex].Buttons[Index].Tag
  else
    Modul := Index; // Aufruf über das Menü


  if (LastOEPage = OLBar.ActivePageIndex) and (LastOEButton = Modul) then
    Exit;

  if Assigned(LastMenu) then
    MainMenu1.Unmerge(LastMenu);
  LastMenu := Nil;


  // alte Panels aushängen
  I := 0;
  while i <= MainPanel.ControlCount-1 do
  begin
    with MainPanel.Controls[i] do
      if owner <> self then
      begin
        if Owner = AdressForm then 
        begin
          AdressForm.FormDeactivate  (Sender);
          AdressForm.OnUpdateStatusBar := nil;
        end;
        if Owner = ArtikelForm then 
        begin
          ArtikelForm.FormDeactivate (Sender);
          ArtikelForm.OnUpdateStatusBar := nil;
        end;
        if Owner = KFZForm then 
        begin
          KFZForm.FormDeactivate (Sender);
          KFZForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MitarbeiterForm then 
        begin
          MitarbeiterForm.FormDeactivate (Sender);
          MitarbeiterForm.OnUpdateStatusBar := nil;
        end;
        if Owner = PIMForm then 
        begin
          PIMForm.FormDeactivate (Sender);
          PIMForm.OnUpdateStatusBar := nil;
        end;
        if Owner = VertreterForm then 
        begin
          VertreterForm.FormDeactivate (Sender);
          VertreterForm.OnUpdateStatusBar := nil;
        end;
        if Owner = PLZForm then 
        begin
          PLZForm.FormDeactivate (Sender);
          PLZForm.OnUpdateStatusBar := nil;
        end;
        if Owner = BLZForm then 
        begin
          BLZForm.FormDeactivate (Sender);
          BLZForm.OnUpdateStatusBar := nil;
        end;
        {$IFDEF ALPHA}
        if Owner = EBBestVorForm then 
        begin
          EBBestVorForm.FormDeactivate   (Sender);
          EBBestVorForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeEKPreisForm then 
        begin
          MakeEKPreisForm.FormDeactivate   (Sender);
          MakeEKPreisForm.OnUpdateStatusBar := nil;
        end;
        if Owner = AnrufeForm then 
        begin
          AnrufeForm.FormDeactivate   (Sender);
          AnrufeForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalVKAuftragForm then 
        begin
          JournalVKAuftragForm.FormDeactivate   (Sender);
          JournalVKAuftragForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeVKAuftragForm then 
        begin
          MakeVKAuftragForm.FormDeactivate   (Sender);
          MakeVKAuftragForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalVKGSForm then 
        begin
          JournalVKGSForm.FormDeactivate   (Sender);
          JournalVKGSForm.OnUpdateStatusBar := nil;
        end;
        {$ENDIF}
        if Owner = JournalVKREForm then 
        begin
          JournalVKREForm.FormDeactivate   (Sender);
          JournalVKREForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalEKREForm then 
        begin
          JournalEKREForm.FormDeactivate   (Sender);
          JournalEKREForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalVKAGBForm then 
        begin
          JournalVKAGBForm.FormDeactivate  (Sender);
          JournalVKAGBForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalVKLIEFForm then 
        begin
          JournalVKLIEFForm.FormDeactivate (Sender);
          JournalVKLIEFForm.OnUpdateStatusBar := nil;
        end;
        if Owner = JournalEKBESTForm then 
        begin
          JournalEKBESTForm.FormDeactivate (Sender);
          JournalEKBESTForm.OnUpdateStatusBar := nil;
          {
          try JournalEKBESTForm.Free; except end;
          JournalEKBESTForm :=nil;
          Continue;
          }
        end;
        if Owner = JournalVKKasseForm then 
        begin
          JournalVKKasseForm.FormDeactivate (Sender);
          JournalVKKasseForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeAGBForm then 
        begin
          MakeAGBForm.FormDeactivate       (Sender);
          MakeAGBForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeEKREForm then 
        begin
          MakeEKREForm.FormDeactivate      (Sender);
          MakeEKREForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeVKREForm then 
        begin
          MakeVKREForm.FormDeactivate      (Sender);
          MakeVKREForm.OnUpdateStatusBar := nil;
        end;
        {$IFDEF ALPHA}
        if Owner = MakeVKGSForm then 
        begin
          MakeVKGSForm.FormDeactivate      (Sender);
          MakeVKGSForm.OnUpdateStatusBar := nil;
        end;
        {$ENDIF}
        if Owner = MakeVertragReForm then 
        begin
          MakeVertragReForm.FormDeactivate (Sender);
          MakeVertragReForm.OnUpdateStatusBar := nil;
        end;
        if Owner = MakeEKBestForm    then 
        begin
          MakeEKBestForm.FormDeactivate    (Sender);
          MakeEKBestForm.OnUpdateStatusBar := nil;
        end;
        
        if Owner = ZahlForm          then ZahlForm.FormDeactivate         (Sender);
        if Owner = ZahlAusForm       then ZahlAusForm.FormDeactivate      (Sender);
        if Owner = KassenBuchForm    then KassenBuchForm.FormDeactivate   (Sender);
        if Owner = UeberweisungForm  then UeberweisungForm.FormDeactivate (Sender);
        if Owner = LastschriftForm   then LastschriftForm.FormDeactivate  (Sender);
        
        if Owner = InfoForm          then 
        begin
          InfoForm.FormDeactivate (Sender);
          InfoForm.OnUpdateStatusBar := nil;
        end;
        if Owner = ExportFibuForm    then 
        begin
          ExportFibuForm.Formdeactivate     (Sender);
          try 
            ExportFibuForm.Free; 
          except 
          end;
          ExportFibuForm := nil;
          Continue;
        end;
        if Owner = MahnForm          then 
        begin
          MahnForm.FormDeactivate (Sender);
          MahnForm.OnUpdateStatusBar := nil;
          try 
            MahnForm.Free; 
          except 
          end;
          MahnForm := nil;
          Continue;
        end;
        if Assigned(InventurForm) and (Owner = InventurForm) then 
        begin
          InventurForm.FormDeactivate   (Sender);
          InventurForm.OnUpdateStatusBar := nil;
          parent := Twincontrol(owner);
          try 
            InventurForm.Free; 
          except 
          end;
          InventurForm := nil;
          Continue;
        end;
        {$IFDEF AVE}
        if Assigned(ShopMainForm) and (Owner = ShopMainForm) then 
        begin
          ShopMainForm.FormDeactivate (Sender);
          ShopMainForm.OnUpdateStatusBar := nil;
          parent := Twincontrol(owner);
          try 
            ShopMainForm.Free; 
          except 
          end;
          ShopMainForm := nil;
          Continue;
        end;
        if Assigned(AVEShopTransForm) and (Owner = AVEShopTransForm) then
        begin
          AVEShopTransForm.FormDeactivate (Sender);
          AVEShopTransForm.OnUpdateStatusBar := nil;
          parent := Twincontrol(owner);
          try 
            AVEShopTransForm.Free; 
          except 
          end;
          AVEShopTransForm := nil;
          Continue;
        end;
        {$ELSE}
        if {Assigned(ShopTransForm) and} (Owner = ShopTransForm) then 
        begin
          ShopTransForm.FormDeactivate(Sender);
          ShopTransForm.OnUpdateStatusBar := nil;
          {  try parent :=Twincontrol(owner); except end;
          try ShopTransForm.Free; except end;
          ShopTransForm :=nil;
          Continue; }
        end;
        {$ENDIF}
        if Owner = ExportForm then 
        begin
          ExportForm.FormDeactivate      (Sender);
          ExportForm.OnUpdateStatusBar := nil;
        end;
        if Owner = WartungsForm then 
        begin
          WartungsForm.FormDeactivate (Sender);
          WartungsForm.OnUpdateStatusBar := nil;
          parent := Twincontrol(owner);
          try
            WartungsForm.Free; 
          except 
          end;
          WartungsForm := nil;
          Continue;
        end;
        if Owner = StatisticForm then 
        begin
          StatisticForm.FormDeactivate      (Sender);
          //StatisticForm.OnUpdateStatusBar :=nil;
          parent := Twincontrol(owner);
          try 
            StatisticForm.Free; 
          except 
          end;
          StatisticForm := nil;
          Continue;
        end;
        if Owner = frmBrowser then 
        begin
          frmBrowser.FormDeactivate(Sender);
          frmBrowser.OnUpdateStatusBar := nil;
        end;

        Application.ProcessMessages;

        try
          if (Assigned(owner))and(Assigned(parent)) then 
            parent := Twincontrol(owner);
        except 
        end;

        i := 0;

      end else
       Inc(i);
  end;

  // Statuszeile löschen
  OnUpdateStatusBar('', '', '', '', '');

  if Modul > 0 then
  begin
      if DM1.CaoSecurity.CanOpenModul(Modul, 0) then
      begin
        ActiveModul := Modul;

        case Modul of
          1010: // Adressen
          begin
            AdressForm.OnUpdateStatusBar := OnUpdateStatusBar;
            AdressForm.AddrPanel.Parent := MainPanel;
            AdressForm.FormActivate (Sender);
            LastMenu := AdressForm.Mainmenu1;
          end;
          1020: // Artikel
          begin
            ArtikelForm.OnUpdateStatusBar := OnUpdateStatusBar;
            ArtikelForm.ArtikelPanel.Parent := MainPanel;
            ArtikelForm.FormActivate(Sender);
            LastMenu := ArtikelForm.Mainmenu1;
            ArtikelForm.F9Change (F9);
          end;
          1030: // Fahrzeuge (KFZ)
          begin
            if DM1.USE_KFZ then
            begin
              KFZForm.OnUpdateStatusBar := OnUpdateStatusBar;
              KFZForm.KFZPanel.Parent := MainPanel;
              KFZForm.FormActivate (Sender);
              LastMenu := KFZForm.Mainmenu1;
            end;
          end;
          1040: // Mitarbeiter
          begin
            MitarbeiterForm.OnUpdateStatusBar := OnUpdateStatusBar;
            MitarbeiterForm.MainPanel.Parent := MainPanel;
            MitarbeiterForm.FormActivate (Sender);
            LastMenu := MitarbeiterForm.Mainmenu1;
          end;
          1050: // PIM
          begin
            PIMForm.OnUpdateStatusBar := OnUpdateStatusBar;
            PIMForm.MainPanel.Parent := MainPanel;
            PIMForm.FormActivate (Sender);
            LastMenu := PIMForm.Mainmenu1;
          end;
          1060: // Notizen
          begin
            InfoForm.OnUpdateStatusBar := OnUpdateStatusBar;
            InfoForm.InfoPanel.Parent := MainPanel;
            InfoForm.FormActivate (Sender);
            LastMenu := InfoForm.Mainmenu1;
          end;
          1070: // Vertreter
          begin
            VertreterForm.OnUpdateStatusBar := OnUpdateStatusBar;
            VertreterForm.MainPanel.Parent := MainPanel;
            VertreterForm.FormActivate (Sender);
            LastMenu := VertreterForm.Mainmenu1;
          end;
          1990: //Webbrowser
          begin
            frmBrowser.OnUpdateStatusBar := OnUpdateStatusBar;
            frmBrowser.pnlBrowse.Parent := MainPanel;
            frmBrowser.FormActivate (Sender);
            LastMenu := frmBrowser.Mainmenu1;
          end;
          2010: //Angebot
          begin
            MakeAGBForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeAGBForm.Mainmenu1;
            MakeAGBForm.RePanel.Parent := MainPanel;
            MakeAGBForm.FormActivate (Sender);;
            MakeAGBForm.F9Change (F9);
          end;
          {$IFDEF ALPHA}
          2020: //Auftrag
          begin
            MakeVKAuftragForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeVKAuftragForm.Mainmenu1;
            MakeVKAuftragForm.RePanel.Parent := MainPanel;
            MakeVKAuftragForm.FormActivate (Sender);;
            MakeVKAuftragForm.F9Change (F9);
          end;
          {$ENDIF}
          2040: //Rechnung
          begin
            MakeVkReForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeVkReForm.Mainmenu1;
            MakeVkReForm.RePanel.Parent := MainPanel;
            MakeVkReForm.FormActivate(Sender);
            MakeVkReForm.F9Change (F9);
          end;
          {$IFDEF ALPHA}
          2045: //Gutschrift
          begin
            MakeVkGSForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeVkGSForm.Mainmenu1;
            MakeVkGSForm.RePanel.Parent := MainPanel;
            MakeVkGSForm.FormActivate(Sender);
            MakeVkGSForm.F9Change (F9);
          end;
          {$ENDIF}
          2050: //Einkauf
          begin
            MakeEKReForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeEKReForm.Mainmenu1;
            MakeEKReForm.RePanel.Parent := MainPanel;
            MakeEKReForm.FormActivate (Sender);
          end;
          2060: //EK-Bestellung
          begin
            MakeEKBestForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeEkBestForm.Mainmenu1;
            MakeEKBestForm.RePanel.Parent := MainPanel;
            MakeEKBestForm.FormActivate(Sender);
            //MakeEKBestForm.F9Change (F9);
          end;
          2070: // Wiederkehrende Rechnungen / Verträge
          begin
            MakeVertragReForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeVertragReForm.Mainmenu1;
            MakeVertragReForm.RePanel.Parent := MainPanel;
            MakeVertragReForm.FormActivate (Self);
          end;
          2080: //Mahnungen
          begin
            if not Assigned(MahnForm)
            then MahnForm := tMahnForm.Create(Self);

            MahnForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MahnForm.Mainmenu1;
            MahnForm.MainPanel.Parent := MainPanel;
            MahnForm.FormActivate(Sender);
          end;

          {$IFDEF ALPHA}
          2100: // Bestellvorschläge
          begin
            if not Assigned(EBBestVorForm)
            then EBBestVorForm := TEBBestVorForm.Create (Self);

            EBBestVorForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := EBBestVorForm.Mainmenu1;
            EBBestVorForm.MainPanel.Parent := MainPanel;
            EBBestVorForm.FormActivate (Self);
          end;
          2110: //EK-Preisanfrage
          begin
            //if not Assigned(EBBestVorForm)
            //   then EBBestVorForm :=TEBBestVorForm.Create (Self);

            MakeEKPreisForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := MakeEKPreisForm.Mainmenu1;
            MakeEKPreisForm.RePanel.Parent := MainPanel;
            MakeEKPreisForm.FormActivate (Self);
          end;
          2200: //Anrufe
          begin
            AnrufeForm.OnUpdateStatusBar := OnUpdateStatusBar;
            LastMenu := AnrufeForm.Mainmenu1;
            AnrufeForm.MainPanel.Parent := MainPanel;
            AnrufeForm.FormActivate (Self);
          end;
          {$ENDIF}
          3010: //Angebot
          begin
            JournalVKAGBForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKAGBForm.JournalPanel.Parent := MainPanel;
            JournalVKAGBForm.FormActivate (Self);
            LastMenu := JournalVKAGBForm.Mainmenu1;
          end;
          {$IFDEF ALPHA}
          3020: //Auftragsjournal
          begin
            JournalVKAuftragForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKAuftragForm.JournalPanel.Parent := MainPanel;
            JournalVKAuftragForm.FormActivate (Self);
            LastMenu := JournalVKAuftragForm.Mainmenu1;
          end;
          {$ENDIF}
          3030: //Lieferschein
          begin
            JournalVKLIEFForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKLIEFForm.JournalPanel.Parent := MainPanel;
            JournalVKLIEFForm.FormActivate (Self);
            LastMenu := JournalVKLIEFForm.Mainmenu1;
          end;
          3050: //Kasse
          begin
            JournalVKKasseForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKKasseForm.JournalPanel.Parent := MainPanel;
            JournalVKKasseForm.FormActivate (Self);
            LastMenu := JournalVKKasseForm.Mainmenu1;
          end;
          3040: //Rechnung
          begin
            JournalVKREForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKREForm.JournalPanel.Parent := MainPanel;
            JournalVKREForm.FormActivate (Self);
            LastMenu := JournalVKREForm.Mainmenu1;
          end;
          {$IFDEF ALPHA}
          3060: //Rechnung
          begin
            JournalVKGSForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalVKGSForm.JournalPanel.Parent := MainPanel;
            JournalVKGSForm.FormActivate (Self);
            LastMenu := JournalVKGSForm.Mainmenu1;
          end;
          {$ENDIF}
          3100: //Einkauf
          begin
            JournalEKREForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalEKREForm.JournalPanel.Parent := MainPanel;
            JournalEKREForm.FormActivate (Self);
            LastMenu := JournalEKREForm.Mainmenu1;
          end;
          3110: //EK-Bestellung
          begin
            JournalEKBESTForm.OnUpdateStatusBar := OnUpdateStatusBar;
            JournalEKBESTForm.JournalPanel.Parent := MainPanel;
            JournalEKBESTForm.FormActivate (Self);
            LastMenu := JournalEKBESTForm.Mainmenu1;
          end;
          //Finanzen
          4010: //Kassenbuch
          begin
            KassenBuchForm.MainPanel.Parent := MainPanel;
            KassenBuchForm.Formactivate (Sender);
            LastMenu := KassenBuchForm.Mainmenu1;
          end;
          4020: //Zahlungseingang
          begin
            if not Assigned(ZahlForm)
            then ZahlForm := TZahlForm.Create (Self);

            ZahlForm.ZahlungPanel.Parent := MainPanel;
            ZahlForm.FormActivate (Sender);
            LastMenu := ZahlForm.Mainmenu1;
          end;
          4030: //Zahlungsausgang
          begin
            if not Assigned(ZahlAusForm)
            then ZahlAusForm := TZahlAusForm.Create (Self);

            ZahlAusForm.ZahlungPanel.Parent := MainPanel;
            ZahlAusForm.FormActivate (Sender);
            LastMenu := ZahlAusForm.Mainmenu1;
          end;
          4040: //Überweisungen
          begin
            if not Assigned(UeberweisungForm)
            then UeberweisungForm := TUeberweisungForm.Create (Self);

            UeberweisungForm.MainPanel.Parent := MainPanel;
            UeberweisungForm.FormActivate (Sender);
            LastMenu := UeberweisungForm.Mainmenu1;
          end;

          4050: //Lastschriften
          begin
            if not Assigned(LastschriftForm)
            then LastschriftForm := TLastschriftForm.Create (Self);

            LastschriftForm.MainPanel.Parent := MainPanel;
            LastschriftForm.FormActivate (Sender);
            LastMenu := LastschriftForm.Mainmenu1;
          end;
          4060: //Export Fibu
          begin
            if not Assigned(ExportFibuForm)
            then ExportFibuForm := tExportFibuForm.Create(Self);

            ExportFibuForm.MainPanel.Parent := MainPanel;
            ExportFibuForm.FormActivate (Sender);
            LastMenu := ExportFibuForm.Mainmenu1;
          end;
          // Tools
          5001: //PLZ
          begin
            PLZForm.OnUpdateStatusBar := OnUpdateStatusBar;
            PLZForm.Land := DM1.LandK2;
            PLZForm.PLZPanel.Parent := MainPanel;
            PLZForm.FormActivate (Self);
            LastMenu := PLZForm.Mainmenu1;
          end;
          5002: //BLZ
          begin
            BLZForm.OnUpdateStatusBar := OnUpdateStatusBar;
            BLZForm.BLZPanel.Parent := MainPanel;
            BLZForm.FormActivate (Self);
            LastMenu := BLZForm.Mainmenu1;
          end;
          {$IFDEF AVE}
          5021:
          begin
            if not Assigned(ShopMainForm)
            then ShopMainForm := TShopMainForm.Create(Self);

            ShopMainForm.OnUpdateStatusBar := OnUpdateStatusBar;
            ShopMainForm.MainPanel.Parent := MainPanel;
            ShopMainForm.FormActivate (Self);
            LastMenu := ShopMainForm.Mainmenu1;
          end;
          5020:
          begin
            if not Assigned(AVEShopTransForm)
            then AVEShopTransForm := TAVEShopTransForm.Create(Self);

            AVEShopTransForm.OnUpdateStatusBar := OnUpdateStatusBar;
            AVEShopTransForm.MainPanel.Parent := MainPanel;
            AVEShopTransForm.FormActivate (Self);
            LastMenu := AVEShopTransForm.Mainmenu1;
          end;
          {$ELSE}
          5020: //Shop-Transfer
          begin
            if (DM1.ReadBoolean ('SHOP', 'USE_SHOP', False) = True) then
            begin
              //if not Assigned(ShopTransForm)
              // then ShopTransForm :=TShopTransForm.Create (Self);

              ShopTransForm.OnUpdateStatusBar := OnUpdateStatusBar;
              ShopTransForm.MainPanel.Parent := MainPanel;
              ShopTransForm.FormActivate (Self);
              LastMenu := ShopTransForm.Mainmenu1;
            end else
            begin
              MessageDlg (_('Die Shopfunktionen sind derzeit deaktiviert !' + #13#10 +
              'Siehe Datei->Einstellungen (Shop)'), mterror, [mbok], 0);
            end;
          end;
          {$ENDIF}
          5030: //Inventur
          begin
            if not Assigned(InventurForm) then 
              InventurForm := TInventurForm.Create (Self);

            InventurForm.OnUpdateStatusBar := OnUpdateStatusBar;
            InventurForm.MainPanel.Parent := MainPanel;
            InventurForm.FormActivate (Self);
            LastMenu := InventurForm.Mainmenu1;
          end;
          5040: //Export
          begin
            ExportForm.OnUpdateStatusBar := OnUpdateStatusBar;
            ExportForm.MainPanel.Parent := MainPanel;
            ExportForm.FormActivate (Sender);
            LastMenu := ExportForm.Mainmenu1;
          end;
          5050: //Wartungsdaten
          begin
            if not Assigned(WartungsForm) then 
              WartungsForm := TWartungsForm.Create (Self);

            WartungsForm.OnUpdateStatusBar := OnUpdateStatusBar;
            WartungsForm.MainPanel.Parent := MainPanel;
            WartungsForm.FormActivate (Self);
            LastMenu := WartungsForm.Mainmenu1;
          end;
          5010: //Statistik
          begin
            if not Assigned(StatisticForm) then
              StatisticForm := TStatisticForm.Create (Self);
            //StatisticForm.OnUpdateStatusBar :=OnUpdateStatusBar;
            StatisticForm.MainPanel.Parent := MainPanel;
            StatisticForm.FormActivate (Self);
            //LastMenu :=StatisticForm.Mainmenu1;

          end;
        end; //case
      end else
      begin
        // Zugriff nicht erlaubt
        MessageDlg(_('Zugriff verweigert'), mterror, [mbok], 0);
        ActiveModul := -1;
      end;
  end;

  LastOEPage2   := LastOEPage;
  LastOEButton2 := LastOEButton;

  LastOEButton := Modul; //Inde;
  LastOEPage   := OLBar.ActivePageIndex;


  if Assigned(LastMenu) then
  begin
    if LastMenu.Items.Count > 0 then
    begin
      for i := 0 to LastMenu.Items.Count-1 do
      begin
        LastMenu.Items[i].OnDrawItem    := MainMenu1.Items[0].OnDrawItem;
        LastMenu.Items[i].OnMeasureItem := MainMenu1.Items[0].OnMeasureItem;
      end;
    end;
    MainMenu1.Merge(LastMenu);
  end;

  XPMenu1.Active := False;
  XPMenu1.Active := True;

  if DM1.IsLinux then
  begin
    Menu := nil;
    Application.ProcessMessages;
    Menu := MainMenu1;
  end;

  I := 0;
  while i <= MainPanel.ControlCount-1 do
  begin
    with MainPanel.Controls[i] do
      if owner <> self then
      begin
        XPMenu1.InitComponent(Owner);
      end;
      inc(i);
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Intro1Click(Sender: TObject);
begin
  if not Assigned(SScreen) then
    SScreen := tStartBox.Create(Application);
  if Assigned(SScreen) then
  begin
    SScreen.PBar.Visible := False;
    SScreen.Height := SScreen.Height + SScreen.Height - SScreen.ClientHeight;
    SScreen.Modal := True;
    SScreen.Position := poMainFormCenter;
    SScreen.FormStyle := fsNormal;
    SScreen.ShowModal;
    SScreen.Free;
    SScreen := nil;
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Handbuch1Click(Sender: TObject);
begin
  ShowMessage(_('Das Hilfesystem befindet sich im Aufbau ' +
      'und ist im Moment deaktiviert.'));
end;

//------------------------------------------------------------------------------
procedure TMainForm.JumpTo (Modul, ID, Jahr: Integer; BelegNeu: Boolean);
var
  Found, MakeNeu: Boolean;
begin
  // Journalaufrufe
  if Modul = VK_AGB then
  begin
    OLBar.ActivePageIndex := 2;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 3010);
    Application.ProcessMessages;
    JournalVKAGBForm.DatumAW.Year := Jahr;
    JournalVKAGBForm.DatumAW.KindRange := ksYear;
    Application.ProcessMessages;
    JournalVKAGBForm.JQuery.Locate ('REC_ID', Id, []);
  end else
  if Modul = VK_RECH then
  begin
    OLBar.ActivePageIndex := 2;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 3040);
    Application.ProcessMessages;
    JournalVKREForm.DatumAW.Year := Jahr;
    JournalVKREForm.DatumAW.KindRange := ksYear;
    Application.ProcessMessages;
    JournalVKREForm.JQuery.Locate ('REC_ID', Id, []);
  end else
  if Modul = EK_RECH then
  begin
    OLBar.ActivePageIndex := 2;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 3100);
    Application.ProcessMessages;
    JournalEKREForm.DatumAW.Year := Jahr;
    JournalEKREForm.DatumAW.KindRange := ksYear;
    Application.ProcessMessages;
    JournalEKREForm.JQuery.Locate ('REC_ID', Id, []);
  end else
  if Modul = EK_BEST then
  begin
    OLBar.ActivePageIndex := 2;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 3110);
    Application.ProcessMessages;
    JournalEKBestForm.DatumAW.Year := Jahr;
    JournalEKBestForm.DatumAW.KindRange := ksYear;
    Application.ProcessMessages;
    JournalEKBestForm.JQuery.Locate ('REC_ID', Id, []);
  end else
  // Belege im Edit
  if Modul = VK_AGB_EDI then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2010);
    Application.ProcessMessages;
    if not BelegNeu then
    begin
      MakeAgbForm.ReEdiTab.Locate ('REC_ID', Id, []);
    end else
    begin
      MakeNeu := True;
      Found := MakeAGBForm.ReEdiTab.Locate ('ADDR_ID', Id, []);
      if Found then
      begin
        if MessageDlg (_('Dieser Kunde hat bereits mind. ein ' +
              'unfertiges Angebot.' + #13#10 +
              'Wollen Sie trotzdem ein neues erstellen ?'),
              mtconfirmation, [mbyes, mbno], 0) <> mryes then 
        begin
          MakeNeu := False;
        end;
      end;
      if MakeNeu then
      begin
        MakeAGBForm.New1BtnClick (Self);
        MakeAGBForm.SetAdresse (ID);
      end;
    end;
  end
  {$IFDEF ALPHA}
  else
  if Modul = VK_AUF_EDI then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2020);
    Application.ProcessMessages;
    if not BelegNeu then
    begin
      MakeVKAuftragForm.ReEdiTab.Locate ('REC_ID', Id, []);
    end else
    begin
      MakeNeu := True;
      Found := MakeVKAuftragForm.ReEdiTab.Locate ('ADDR_ID', Id, []);
      if Found then
      begin
        if MessageDlg (_('Dieser Kunde hat bereits mind. einen ' +
                'unfertigen Auftrag.' + #13#10 +
                'Wollen Sie trotzdem einen neuen erstellen ?'),
                mtconfirmation, [mbyes, mbno], 0) <> mryes then
        begin
          MakeNeu := False;
        end;
      end;
      if MakeNeu then
      begin
        MakeVKAuftragForm.New1BtnClick (Self);
        MakeVKAuftragForm.SetAdresse (ID);
      end;
    end;
  end
  {$ENDIF}
  else
  if Modul = VK_RECH_EDI then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2040);
    Application.ProcessMessages;
    if not BelegNeu then
    begin
      MakeVKReForm.ReEdiTab.Locate ('REC_ID', Id, []);
    end else
    begin
      MakeNeu := True;
      Found := MakeVKReForm.ReEdiTab.Locate ('ADDR_ID', Id, []);
      if Found then
      begin
        if MessageDlg (_('Dieser Kunde hat bereits mind. eine ' +
                    'unfertige Rechnung.' + #13#10 +
                    'Wollen Sie trotzdem eine neue erstellen ?'),
                    mtconfirmation, [mbyes, mbno], 0) <> mryes then 
        begin
          MakeNeu := False;
        end;
      end;
      if MakeNeu then
      begin
        MakeVKReForm.New1BtnClick (Self);
        MakeVKReForm.SetAdresse (ID);
      end;
    end;
  end else
  if Modul = EK_RECH_EDI then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2050);
    Application.ProcessMessages;
    if not BelegNeu then
    begin
      MakeEKReForm.ReEdiTab.Locate ('REC_ID', Id, []);
    end else
    begin
      MakeNeu := True;
      Found := MakeEKReForm.ReEdiTab.Locate ('ADDR_ID', Id, []);
      if Found then
      begin
        if MessageDlg (_('Dieser Kunde hat bereits mind. eine ' +
                        'unfertige EK-Rechnung.' + #13#10 +
                        'Wollen Sie trotzdem eine neue erstellen ?'),
                        mtconfirmation, [mbyes, mbno], 0)<>mryes then 
        begin
          MakeNeu := False;
        end;
      end;
      if MakeNeu then
      begin
        MakeEKReForm.New1BtnClick (Self);
        MakeEKReForm.SetAdresse (ID);
      end;
    end;
  end else
  if Modul = EK_BEST_EDI then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2060);
    Application.ProcessMessages;
    if not BelegNeu then
    begin
      MakeEKBestForm.ReEdiTab.Locate ('REC_ID', Id, []);
    end else
    begin
      MakeNeu := True;
      Found := MakeEKBestForm.ReEdiTab.Locate ('ADDR_ID', Id, []);
      if Found then
      begin
        if MessageDlg (_('Dieser Kunde hat bereits mind. eine ' +
                         'unfertige EK-Bestellung.' + #13#10 +
                         'Wollen Sie trotzdem eine neue erstellen ?'),
                          mtconfirmation, [mbyes, mbno], 0) <> mryes then 
        begin
          MakeNeu := False;
        end;
      end;
      if MakeNeu then
      begin
        MakeEKBestForm.New1BtnClick (Self);
        MakeEKBestForm.SetAdresse (ID);
      end;
    end;
  end else
  // Notizen
  if Modul = MOD_NOTIZ then
  begin
    OLBar.ActivePageIndex := 1;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 1060);
    Application.ProcessMessages;
  end else
  //Verträge
  if Modul = VK_WKRE_EDI then
  begin
    OLBar.ActivePageIndex := 2;
    Application.ProcessMessages;
    OLBarButtonClick (Self, 2070);
    Application.ProcessMessages;
  end;
end;

//------------------------------------------------------------------------------
                  // c.) MSTUEBNER
procedure TMainForm.SetHelpContext;
begin
  // Stammdaten -- KFZ
  with KFZForm do
  begin
    KFZPanel.HelpContext        := 8050;
    Allg_TS.HelpContext         := 8050;
    Notiz_TS.HelpContext        := 8100;
    Hist_TS.HelpContext         := 8150;
    List_TS.HelpContext         := 8200;
  end;

  // Stammdaten -- Mitarbeiter
  with MitarbeiterForm do
  begin
    MainPanel.HelpContext              := 3600;
    Allg_TS.HelpContext                := 3600;
    Such_TS.HelpContext                := 3650;
    TabSheet1.HelpContext              := 3700;
    TabSheet2.HelpContext              := 3750;
  end;

  // Stammdaten -- PIM
  with PimForm do
  begin
    MainPanel.HelpContext              := 3800;
    VpMonthView1.HelpContext           := 3810;
    VpTaskList1.HelpContext            := 3815;

    VpCaoEventEditDialog1.HelpContext  := 3820; // Termin  neu/bearbeiten
    TaskDlgHelpContext                 := 3825; // Aufgabe neu/bearbeiten
  end;

  // Stammdaten -- Notizen
  with InfoForm do
  begin
    InfoPanel.HelpContext       := 3850;
  end;

  // Stammdaten -- Vertreter
  with VertreterForm do
  begin
    MainPanel.HelpContext       := 3900;
    Allg_TS.HelpContext         := 3900;
    TabSheet2.HelpContext       := 3950;
    TabSheet3.HelpContext       := 4000;
    Such_TS.HelpContext         := 4050;
  end;

  // Vorgänge -- Angebot
  with MakeAGBForm do
  begin
    EdiListTS.HelpContext       := 4100;
    AdressTS.HelpContext        := 4150;
    PosTS.HelpContext           := 4200;
    Fertig.HelpContext          := 4250;
    PosDetailTS.HelpContext     := 4300;
    PreisAlgTS.HelpContext      := 4350;
    PreisVKHisTS.HelpContext    := 4400;
    LiefPreisTS.HelpContext     := 4450;
    PreisEKHisTS.HelpContext    := 4500;
    EKBestTS.HelpContext        := 4550;
    TabSheet6.HelpContext       := 4600;
    StueckListTS.HelpContext    := 4650;
    LiefTS.HelpContext          := 4700;
  end;

  // Vorgänge -- Rechnung
  with MakeVKReForm do
  begin
    EdiListTS.HelpContext       := 4750;
    AdressTS.HelpContext        := 4800;
    PosTS.HelpContext           := 4850;
    Fertig.HelpContext          := 4900;
    PosDetailTS.HelpContext     := 4950;
    PreisAlgTS.HelpContext      := 5000;
    PreisVKHisTS.HelpContext    := 5050;
    LiefPreisTS.HelpContext     := 5600;
    PreisEKHisTS.HelpContext    := 5650;
    EKBestTS.HelpContext        := 5700;
    TabSheet6.HelpContext       := 5750;
    StueckListTS.HelpContext    := 5800;
    LiefTS.HelpContext          := 5850;
  end;

  // Vorgänge -- Einkauf
  with MakeEKReForm do
  begin
    EdiListTS.HelpContext       := 5900;
    AdressTS.HelpContext        := 5950;
    PosTS.HelpContext           := 6000;
    Fertig.HelpContext          := 6050;
  end;

  // Vorgänge -- EK-Bestellung
  with MakeEKBestForm do
  begin
    EdiListTS.HelpContext       := 6100;
    AdressTS.HelpContext        := 6150;
    PosTS.HelpContext           := 6200;
    Fertig.HelpContext          := 6250;
  end;

  // Vorgänge -- Verträge
  with MakeVertragReForm do
  begin
    EdiListTS.HelpContext       := 6300;
    AdressTS.HelpContext        := 6350;
    PosTS.HelpContext           := 6400;
    Fertig.HelpContext          := 6450;
  end;

  // Journale -- Angebot
  with JournalVKAGBForm do
  begin
    MainPanel.HelpContext       := 6500;
    JourGrid.HelpContext        := 6500;
    Allgemein.HelpContext       := 6525;
    TabSheet1.HelpContext       := 6550;
    JourInfoTS.HelpContext      := 6600;
  end;

  // Journale -- Lieferschein
  with JournalVKLiefForm do
  begin
    MainPanel.HelpContext       := 6650;
    Jourgrid.HelpContext        := 6650;
    Allgemein.HelpContext       := 6675;
    TabSheet1.HelpContext       := 6700;
  end;

  // Journale -- Kasse
  with JournalVKKasseForm do
  begin
    MainPanel.HelpContext       := 6750;
    TabSheet1.HelpContext       := 6750;
    TabSheet2.HelpContext       := 6800;
  end;

  // Journale -- Rechnung
  with JournalVKREForm do
  begin
    MainPanel.HelpContext       := 6850;
    JourGrid.HelpContext        := 6850;
    Allgemein.HelpContext       := 6875;
    TabSheet1.HelpContext       := 6900;
    ReInfoTS.HelpContext        := 6950;
  end;

  // Journale -- Einkauf
  with JournalEKREForm do
  begin
    MainPanel.HelpContext       := 7000;
    JourGrid.HelpContext        := 7000;
    Allgemein.HelpContext       := 7025;
    TabSheet1.HelpContext       := 7050;
  end;

  // Journale -- EK-Bestellung
  with JournalEKBestForm do
  begin
    MainPanel.HelpContext       := 7100;
    JourGrid.HelpContext        := 7100;
    Allgemein.HelpContext       := 7125;
    TabSheet1.HelpContext       := 7150;
  end;

  // Finanzen -- Kassenbuch
  with KassenBuchForm do
  begin
    MainPanel.HelpContext       := 7200;
  end;


  // Tools -- PLZ
  with PLZForm do
  begin
    PLZPanel.HelpContext        := 7500;
  end;

  // Tools -- BLZ
  with BLZForm do
  begin
    BLZPanel.HelpContext        := 7550;
  end;

  // Tools -- Shop-Transfer
  {$IFNDEF AVE}
  with ShopTransForm do
  begin
    ArtikelTS.HelpContext       := 7600;
    BestellTS.HelpContext       := 7650;
    UpdateTS.HelpContext        := 7700;
    KatTS.HelpContext           := 7750;
    HerstellerTS.HelpContext    := 7800;
  end;
  {$ENDIF}

  // Tools -- Export
  with ExportForm do
  begin
    AuswahlTS.HelpContext       := 7850;
    AllgTS.HelpContext          := 7900;
    SQLExecTS.HelpContext       := 7950;
    FelderTS.HelpContext        := 8000;
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.MnuUserChangeClick(Sender: TObject);
var
  UserChangeForm: TUserChangeForm;
  Res: Integer;
  User: String;
begin
  if InLogin then
    Exit;

  InLogin := True;
  try
    // alles ausblenden bzw. Module schließen
    LastOEPage            := -1;
    LastOEButton          := -1;
    // aktuellen Zusatnd speichern
    DM1.WriteIntegerU('', 'LastLeftMenuGrp', OLBar.ActivePageIndex);
    DM1.WriteIntegerU('', 'LastLeftMenuBtn', LastOEButton);

    OLBar.ActivePageIndex := 0;

    OLBarButtonClick(Sender, -1);

    MainPanel.Color := clBtnFace;

    UserChangeForm := TUserChangeForm.Create(Self);
    try
      CheckRegister4;

      Res := UserChangeForm.UserChange (User);
      if Res = 0 then
      begin
        DM1.CaoSecurity.CurrUser := User;
        DM1.UniQuery.Close;

        if DM1.CaoSecurity.CurrUserID > -1 then
        begin
          DM1.UniQuery.Sql.Text := 'select MA_ID,ANZEIGE_NAME FROM MITARBEITER ' +
          'where MA_ID=' +
          IntToStr(DM1.CaoSecurity.CurrUserID);

          DM1.UniQuery.Open;

          if (DM1.UniQuery.RecordCount = 1) then
          begin
            // Benutzer existiert
            DM1.View_User := DM1.UniQuery.FieldByName('ANZEIGE_NAME').AsString;
            DM1.UserID    := DM1.UniQuery.FieldByName('MA_ID').AsInteger;
          end else
          begin
            DM1.View_User := '???';
            DM1.UserID    := -1;
          end;

          DM1.UniQuery.Close;
        end else
        begin
          DM1.View_User := '???';
          DM1.UserID    := -1;
        end;
      end else
      begin
        DM1.CaoSecurity.CurrUser := '';
        DM1.View_User := '???';
        DM1.UserID    := -1;
      end;

      SBar.Panels[0].Text := DM1.view_user;
    finally
      UserChangeForm.Free;
    end;

    if Sender <> Self then
    begin
      // Initalisierung erzwingen !!!
      ArtikelForm.First   := True;
      AdressForm.First    := True;

      MakeVKREForm.First  := True;
      MakeEKREForm.First  := True;
      MakeAGBForm.First   := True;

      FormShow (Sender);
    end;

  finally
    InLogin := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TMainForm.Kennwortndern1Click(Sender: TObject);
begin
  with TUserPWChangeForm.Create(Self) do
    try
      ShowModal;
  finally
    Free;
  end;
end;

//------------------------------------------------------------------------------
end.

{

Falls eine laufende Instanz eines Programms eine verknüpfte Datei öffnen soll,
muß das Programm auf eine Message reagieren:
type
TMainForm = class(TForm)
Private
procedure NeedFileOpen(var Msg: tMessage); Message wmMainInstanceOpenFile;

[..]

procedure TMainForm.NeedFileOpen(var Msg: tMessage);
var Path : string;
PC   : array[0..MAX_PATH] of Char;
begin
GlobalGetAtomName(Msg.wParam, PC, MAX_PATH);
Path := Trim(StrPas(PC));
Datei_laden(Path); // Den Code zum Laden der Daten ausführen
end;


}

object JvFormPlacement1: TJvFormPlacement
IniFileName = '\SOFTWARE\SBP\CAO-Faktura'
IniSection = 'MAIN'
MinMaxInfo.MinTrackHeight = 660
MinMaxInfo.MinTrackWidth = 850
UseRegistry = True
Version = 1004
Left = 287
Top = 144
end


