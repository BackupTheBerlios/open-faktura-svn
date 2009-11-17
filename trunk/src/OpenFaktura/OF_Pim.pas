{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Personal Information Manager (Terminplanung, Aufgaben, ...)       }
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
{ - ziemlich buggy das ganze Teil, gründliche Überarbeitung und Tests nötig!   }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Pim;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, VpAlarmDlg, VpDlg, OF_VpEvntEditDlg, VpBaseDS, VpBase,
  VpDBDS, OF_VpDS, VpTaskList, VpMonthView, VpDayView, JvExExtCtrls,
  JvComponent, JvSplit, ExtCtrls,
  VpData, OF_Var_Const, JvMenus;

  //VpContactButtons, VpContactGrid, VpTaskEditDlg,

type
  TPimForm = class(TForm)
    MainPanel: TPanel;
    CAO_DS: TVpOFDataStore;
    PanelCalSplit1: TPanel;
    VpDayView1: TVpDayView;
    Splitter1: TJvxSplitter;
    PanelCalSplit2: TPanel;
    Splitter2: TJvxSplitter;
    VpMonthView1: TVpMonthView;
    VpTaskList1: TVpTaskList;
    VpControlLink1: TVpControlLink;
    VpCaoEventEditDialog1: TVpOFEventEditDialog;
    VpNotificationDialog1: TVpNotificationDialog;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    AuflsungTagesansicht1: TMenuItem;
    N15min1: TMenuItem;
    N30min1: TMenuItem;
    N60min1: TMenuItem;
    Wochenendeanzeigen1: TMenuItem;
    AnzahlTage1: TMenuItem;
    N1Tag1: TMenuItem;
    N2Tage1: TMenuItem;
    N3Tage1: TMenuItem;
    N4Tage1: TMenuItem;
    N5Tage1: TMenuItem;
    N6Tage1: TMenuItem;
    N7Tage1: TMenuItem;
    Drucken1: TMenuItem;
    MnuPrintAufgaben: TMenuItem;
    MnuPrintTerminTag: TMenuItem;
    MnuPrintTerminWoche: TMenuItem;
    MnuPrintTerminMonat: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CAO_DSLoadResources(Resource: TVpResource);
    procedure CAO_DSPostResources(Resource: TVpResource);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure VpDayView1OwnerEditEvent(Sender: TObject; Event: TVpEvent;
   Resource: TVpResource; var AllowIt: Boolean);
    procedure TagViewAufloesungClick(Sender: TObject);
    procedure Wochenendeanzeigen1Click(Sender: TObject);
    procedure TagViewAnzahlTageClick(Sender: TObject);
    procedure VpTaskList1OwnerEditTask(Sender: TObject; Task: TVpTask;
   Resource: TVpResource; var AllowIt: Boolean);
    procedure MnuPrintTermin(Sender: TObject);
    procedure MnuPrintAufgabenClick(Sender: TObject);
  private
    { Private-Deklarationen }
    LastDBName : String;
    UID     : Integer;
  public
    { Public-Deklarationen }
    TaskDlgHelpContext : Integer;

    First : Boolean;
    OnUpdateStatusBar : TOnUpdateStatusBar;
    procedure Init;
    procedure AddGeburtstag (D : tDateTime;
              Name : String;
              Modul, AddrID, AspID : Integer);
  end;

var
  PimForm: TPimForm;

implementation

uses
  GNUGetText, OF_VpTaskEditDlg,
  OF_DM, OF_FreePrintRech;

{$R *.DFM}
{$I VpSR.inc}

Const 
  ModulID : Integer = 1050;

procedure TPimForm.FormCreate(Sender: TObject);
begin
  OnUpdateStatusBar := nil;
  First := True;
  LastDBName := '';
end;

procedure TPimForm.Init;
begin
  // Tabellen öffnen, damit das Termin-Popup angezeigt werden kann

  UID := DM1.ReadInteger ('MAIN\PIM','GLOB_USERID',-1);
  if UID < 0 then 
    UID := DM1.UserID;

  LastDBName        := DM1.DB1.Database;
  CAO_DS.Connected  := False;
  CAO_DS.Database   := DM1.DB1;
  CAO_DS.Connected  := True;
  CAO_DS.ResourceID := UID;
end;

procedure TPimForm.AddGeburtstag (D : tDateTime; Name : String; Modul, AddrID, AspID : Integer);
var 
  Event : TVpEvent;
begin
  Event := CAO_DS.Resource.Schedule.AddEvent (0,Int(D), Int(D)+0.9999999);

  Event.AllDayEvent    := False;       // Ganztägig
  Event.Category       := 8;           // ist Geburtstag
  Event.Description    := Name;
  Event.RepeatCode     := rtYearlyByDate;
  Event.RepeatRangeEnd := EncodeDate (2099, 12, 31);

  // Alarm 5 Tage zuvor
  Event.AlarmSet     := True;
  Event.AlarmAdvType := atDays; // Tage
  Event.AlarmAdv     := 5;

  Event.UserField6 := IntToStr(Modul);    // Modul
  Event.UserField7 := IntToStr(0);        // Submodul
  Event.UserField8 := IntToStr(AddrID);   // RecID Modul
  Event.UserField9 := IntToStr(AspID);    // RecID Submodul

  CAO_DS.PostEvents; //Speichern

  VpCaoEventEditDialog1.Execute(Event, tf24Hour);
end;

procedure TPimForm.FormActivate(Sender: TObject);
var 
  I : Integer;
begin
  if (First) or (LastDBName <> DM1.DB1.Database) then
  begin
    First := False;

    if LastDBName <> DM1.DB1.Database then 
      Init;

    PanelCalSplit2.Width := 
      MainPanel.Width - Splitter1.Width -
      DM1.ReadIntegerU('','PIM_TAG_BREITE', Splitter1.Left);
    VpMonthView1.Height := 
      DM1.ReadIntegerU('','PIM_MON_HOEHE', VpMonthView1.Height);
    I := DM1.ReadIntegerU('','PIM_TAG_AUFLOESUNG',3);
    VpDayView1.Granularity := TVpGranularity(I);
    case I of
      3: N15min1.Checked := True;
      5: N30min1.Checked := True;
      6: N60min1.Checked := True;
    end;

    Wochenendeanzeigen1.Checked := DM1.ReadBooleanU('', 'PIM_TAG_ZEIGEWE', True);
    VpDayView1.IncludeWeekends := Wochenendeanzeigen1.Checked;

    I := DM1.ReadIntegerU('', 'PIM_TAG_ANZTAGE', 1);
    VpDayView1.NumDays := I;
    case I of
      1: N1Tag1.Checked  := True;
      2: N2Tage1.Checked := True;
      3: N3Tage1.Checked := True;
      4: N4Tage1.Checked := True;
      5: N5Tage1.Checked := True;
      6: N6Tage1.Checked := True;
      7: N7Tage1.Checked := True;
    end;
  end;
  VpDayView1.Setfocus;
end;

procedure TPimForm.FormDeactivate(Sender: TObject);
begin
  //
end;

procedure TPimForm.CAO_DSLoadResources(Resource: TVpResource);
begin
  Resource.Active := True;

  if UID = 9999 then
  begin
    Resource.Description := 'Alle';
    Resource.ResourceID  := UID;
  end else
  begin
    Resource.Description := DM1.view_user;
    Resource.ResourceID  := DM1.UserID;
  end;
end;

procedure TPimForm.CAO_DSPostResources(Resource: TVpResource);
begin
  //MessageBeep(0);
end;

procedure TPimForm.Layoutspeichern1Click(Sender: TObject);
begin
  DM1.WriteIntegerU('', 'PIM_TAG_BREITE', Splitter1.Left);
  DM1.WriteIntegerU('', 'PIM_MON_HOEHE', Splitter2.Top);
end;

procedure TPimForm.VpDayView1OwnerEditEvent(Sender: TObject;
  Event: TVpEvent; Resource: TVpResource; var AllowIt: Boolean);
begin
  VpCaoEventEditDialog1.DataStore := vpDayView1.DataStore;
  AllowIt := VpCaoEventEditDialog1.Execute(Event, vpDayView1.TimeFormat);
end;

procedure TPimForm.TagViewAufloesungClick(Sender: TObject);
begin
  if not (Sender is tMenuItem) then 
    exit;

  DM1.WriteIntegerU('', 'PIM_TAG_AUFLOESUNG', tMenuItem(Sender).Tag);
  VpDayView1.Granularity := TVpGranularity(tMenuItem(Sender).Tag);
  tMenuItem(Sender).Checked := True;
end;

procedure TPimForm.Wochenendeanzeigen1Click(Sender: TObject);
begin
  Wochenendeanzeigen1.Checked := not Wochenendeanzeigen1.Checked;
  DM1.WriteBooleanU ('', 'PIM_TAG_ZEIGEWE', Wochenendeanzeigen1.Checked);
  VpDayView1.IncludeWeekends := Wochenendeanzeigen1.Checked;
end;

procedure TPimForm.TagViewAnzahlTageClick(Sender: TObject);
begin
  if not (Sender is tMenuItem) then 
    exit;

  DM1.WriteIntegerU('', 'PIM_TAG_ANZTAGE', tMenuItem(Sender).Tag);
  VpDayView1.NumDays := tMenuItem(Sender).Tag;
  tMenuItem(Sender).Checked := True;
end;

procedure TPimForm.VpTaskList1OwnerEditTask(Sender: TObject; Task: TVpTask;
  Resource: TVpResource; var AllowIt: Boolean);
var 
  TaskDlg : TOFTaskEditForm;
begin
  TaskDlg := TOFTaskEditForm.Create(nil);
  try
    //TaskDlg.Options := TaskDlg.Options + [doSizeable];
    //TaskDlg.DataStore := Task.DataStore;

    TaskDlg.HelpContext := TaskDlgHelpContext;

    if Task.Description = '' then 
      TaskDlg.Caption := RSUntitled + ' - ' + RSDlgTaskEdit
    else 
      TaskDlg.Caption := Task.Description + ' - ' + RSDlgTaskEdit;

    TaskDlg.Task := Task;
    TaskDlg.Resource := Resource;
    TaskDlg.PopulateSelf;
    TaskDlg.ShowModal;
    AllowIt := (TaskDlg.ReturnCode = TVpEditorReturnCode(rtCommit));

    Task.Changed := AllowIt;
    if AllowIt then
    begin
      TaskDlg.DePopulateSelf;
      //DataStore.PostTasks;
      //DataStore.NotifyDependents;
    end;

  finally
    TaskDlg.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TPimForm.MnuPrintTermin(Sender: TObject);
var 
  Anz: Integer; 
  VD, BD: tDateTime; 
  Ja, Mo, Ta, DW: Word;  
  SQL: STring;
begin
  Anz := TMenuItem(Sender).Tag;
  if Anz = 1 then
  begin
    VD := VpDayView1.Date; 
    BD := VD;
  end else
  if Anz = 7 then
  begin
    DW := DayOfWeek(VpDayView1.Date);
    if DW > 1 then 
      dec(dw) 
    else 
      dw := 7;

    if DW > 1 then 
      VD := VpDayView1.Date+1-DW 
    else 
      VD := VpDayView1.Date;
    BD := VD+6;
  end else
  if Anz = 31 then
  begin
    DecodeDate(VpDayView1.Date, Ja, Mo, Ta);
    VD := EncodeDate(Ja, Mo, 1);
    inc(mo);
    if Mo = 13 then 
    begin 
      Mo := 1; 
      Inc(ja); 
    end;
    BD := EncodeDate(Ja, Mo, 1)-1;
  end else 
    Exit;

  SQL := 'SELECT * FROM PIM_TERMINE WHERE '+
         '(RESOURCEID='+IntToStr(DM1.UserID)+' or RESOURCEID=9999) and '+
         'STARTTIME>="'+FormatDateTime ('YYYY-MM-DD',VD)+' 00:00:00" and '+
         'STARTTIME<="'+FormatDateTime ('YYYY-MM-DD',BD)+' 23:59:59" '+
         'ORDER BY STARTTIME';

  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowUniDlg(
    ModulID,             //Modul
    Sql,              //SQL
    'MAIN\REPORT\PIM_TERMINE',    //Reg-Key
    _('Termine drucken'),      //Dialog Caption
    _('Layout Terminliste bearbeiten'), //Designer Überschrift
    _('Terminliste'),          //Druckjob-Text
    False             //Vorschau
  );
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TPimForm.MnuPrintAufgabenClick(Sender: TObject);
var 
 SQL: String;
begin
  SQL := 'SELECT * FROM PIM_AUFGABEN WHERE '+
         '(RESOURCEID='+IntToStr(DM1.UserID)+' or RESOURCEID=9999) '+
         'ORDER BY CREATEDON';
         
  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowUniDlg(
             ModulID,              //Modul
             Sql,               //SQL
             'MAIN\REPORT\PIM_AUFGABEN',    //Reg-Key
             _('Aufgaben drucken'),      //Dialog Caption
             _('Layout Aufgabenliste bearbeiten'),//Designer Überschrift
             _('Aufgabenliste'),         //Druckjob-Text
             False              //Vorschau
  );
  {$ENDIF}
end;

//------------------------------------------------------------------------------

end.

