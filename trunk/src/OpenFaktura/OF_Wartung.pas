{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Wartungsdatenverwaltung                                           }
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
{ - Erzeugen der WaDa Tabelle...                                               }
{ - Sortierung überarbeiten                                                    }
{ - Angezeigte Spalten einstellbar                                             }
{ - Tabellen überarbeiten                                                      }
{ - Infodialog                                                                 }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 29.07.2003 - Version 1.0.0.0 released Daniel Pust }
{ 30.07.2003 - JP: Druckdialog wird jetzt dynamisch erzeugt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Wartung;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvTimerList, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Menus, ComCtrls, AdvStatusBar, DBCtrls, JvExMask, JvToolEdit,
  JvDBControls, JvLabel, ExtCtrls, StdCtrls, Buttons, Mask, VolDBEdit{???},
  JvExStdCtrls, JvEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExRxDBGrid{???},
  OFGroupBox, JvExControls, JvComponent, JvSpeedButton,
  OF_Var_Const, JvMenus;

{
uses
  JvRichEd, JvDBRichEd, JvDBCtrl, jpeg, VolDBGrid,
  JvTranslator, JvFormPlace,
  ZTransact,
}

type
  TWartungsForm = class(TForm)
    MainMenu1: TJvMainMenu;
    Modul1: TMenuItem;
    Drucken1: TMenuItem;
    DS_Uebersicht: TDataSource;
    Uebersicht: TZQuery;
    Ansicht1: TMenuItem;
    Anlagendaten1: TMenuItem;
    Kundenliste1: TMenuItem;
    Kundendetails: TMenuItem;
    Wartungstermine1: TMenuItem;
    ZMySqlQuery1: TZQuery;
    DataSource1: TDataSource;
    Kundenliste2: TMenuItem;
    JvTimerList1: TJvTimerList;
    //JvFormPlace1: TJvFormPlace;  //15.10.09-ud.
    MainPanel: TPanel;
    Panel3: TPanel;
    SpeedButton2: TJvSpeedButton;
    SpeedButton4: TJvSpeedButton;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    JvSpeedButton3: TJvSpeedButton;
    JvSpeedButton4: TJvSpeedButton;
    WaDa_PC: TPageControl;
    TabSheet2: TTabSheet;
    CaoGroupBox4: TOFGroupBox;
    Panel4: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    SuchBeg: TJvEdit;
    SuchName: TJvEdit;
    TabSheet1: TTabSheet;
    CaoGroupBox5: TOFGroupBox;
    TabSheet3: TTabSheet;
    KunAlgRightPan: TPanel;
    KommunikationGB: TOFGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    JvLabel1: TJvLabel;
    Label42: TJvLabel;
    Label44: TLabel;
    Label1: TLabel;
    tele1: TDBEdit;
    tele2: TDBEdit;
    fax: TDBEdit;
    funk: TDBEdit;
    email: TDBEdit;
    internet: TDBEdit;
    divers1: TDBEdit;
    KunAlgLeftPan: TPanel;
    AnschriftGB: TOFGroupBox;
    Label43: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    AddAdressToOutlookLabel: TJvLabel;
    Label17: TLabel;
    name1: TDBEdit;
    name2: TDBEdit;
    name3: TDBEdit;
    abteilung: TDBEdit;
    strasse: TDBEdit;
    Ort: TJvDBComboEdit;
    Postfach: TJvDBComboEdit;
    PF_PLZ: TJvDBComboEdit;
    PLZ: TJvDBComboEdit;
    Land: TDBEdit;
    PF_Land: TDBEdit;
    Anrede: TVolgaDBEdit;
    SuchbegrGB: TOFGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label36: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    match: TDBEdit;
    ZuweisungenGB: TOFGroupBox;
    Label18: TLabel;
    Label71: TLabel;
    gruppe: TDBEdit;
    KunGR1: TDBLookupComboBox;
    InfoGB: TOFGroupBox;
    InfoMemo: TDBMemo;
    TabSheet4: TTabSheet;
    CaoGroupBox1: TOFGroupBox;
    Panel6: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    TabSheet5: TTabSheet;
    CaoGroupBox6: TOFGroupBox;
    Panel7: TPanel;
    Label2: TLabel;
    JvEdit2: TJvEdit;
    DS_KundenListe: TDataSource;
    DS_Ansprechpartner: TDataSource;
    DS_Anlagen: TDataSource;
    DS_Wartungsliste: TDataSource;
    Anlagen: TZQuery;
    Ansprechpartner: TZQuery;
    Wartungsliste: TZQuery;
    KundenListe: TZQuery;
    BitBtn2: TBitBtn;
    ExRxDBGrid3: TExRxDBGrid;
    N1: TMenuItem;
    Schnellbemerkung1: TMenuItem;
    ExRxDBGrid1: TExRxDBGrid;
    ExRxDBGrid5: TExRxDBGrid;
    SB1: TAdvStatusBar;
    AnlagenERSTELLT: TDateField;
    AnlagenERST_NAME: TStringField;
    AnlagenGEAENDERT: TDateField;
    AnlagenGEAEND_NAME: TStringField;
    AnlagenREC_ID: TIntegerField;
    AnlagenADDR_ID: TIntegerField;
    AnlagenBESCHREIBUNG: TStringField;
    AnlagenWARTUNG: TDateField;
    AnlagenINTERVALL: TIntegerField;
    AnlagenWVERTRAG: TStringField;
    AnlagenBEMERKUNG: TMemoField;
    AnlagenLEBENSLAUF: TMemoField;
    AnlagenLISTE: TMemoField;
    AnlagenWARTUNG_TYP: TStringField;
    AnlagenWVERTRAG_NR: TIntegerField;
    AnlagenBEM_OPT1: TIntegerField;
    AnlagenBEM_OPT2: TIntegerField;
    AnlagenBEM_OPT3: TIntegerField;
    AnlagenBEM_OPT4: TIntegerField;
    AnlagenBEM_OPT5: TIntegerField;
    AnlagenBEM_OPT6: TIntegerField;
    AnlagenBEM_OPT7: TIntegerField;
    AnlagenBEM_OPT8: TIntegerField;
    AnlagenBEM_OPT9: TIntegerField;
    Label4: TLabel;
    VolgaDBEdit1: TVolgaDBEdit;
    CaoGroupBox2: TOFGroupBox;
    CaoGroupBox3: TOFGroupBox;
    Splitter1: TSplitter;
    ExRxDBGrid2: TExRxDBGrid;
    Panel1: TPanel;
    Label28: TLabel;
    VolgaDBEdit2: TVolgaDBEdit;
    Anlagenliste1: TMenuItem;
    //StatusUpdateTimer: TJvTimerEvents;  //15.10.09-ud.
    //SearchTimer: TJvTimerEvents;  //15.10.09-ud.
    Label_Bemerkung: TLabel;
    PageControl1: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    DBMemo_Lebenslauf: TDBMemo;
    DBMemo1: TDBMemo;
    Panel9: TPanel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBMemo_Bemerkung: TDBMemo;
    ExRxDBGrid6: TExRxDBGrid;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Termin: TEdit;
    L_Wartung: TVolgaDBEdit;
    Intervall: TVolgaDBEdit;
    BitBtn3: TBitBtn;
    WVNummer: TVolgaDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBNavigator1: TDBNavigator;
    procedure CalcNextDate(Sender: TObject);
    procedure VolgaDBEdit11Change(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure VolgaDBEdit10Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
    Button: TNavigateBtn);
    procedure Drucken1Click(Sender: TObject);
    procedure SuchFeldChange(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure SpeedButtonMouseEnter(Sender: TObject);
    procedure SpeedButtonMouseLeave(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    //procedure StatusUpdateTimerTimer(Sender: TObject);  //15.10.09-ud.
    //procedure SearchTimerTimer(Sender: TObject);  //15.10.09-ud.
    procedure FormDeactivate(Sender: TObject);
    procedure AnlagenAfterInsert(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure ExRxDBGrid1ApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure ExRxDBGrid1DblClick(Sender: TObject);
    procedure ExRxDBGrid3DblClick(Sender: TObject);
    procedure ExRxDBGrid3ApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure ExRxDBGrid4CellClick(Column: TColumn);
    procedure Schnellbemerkung1Click(Sender: TObject);
    procedure ExRxDBGrid4ApplyCellAttribute(Sender: TObject; Field: TField;
    Canvas: TCanvas; State: TGridDrawState);
    procedure AnlagenBeforePost(DataSet: TDataSet);
    procedure ExRxDBGrid5DblClick(Sender: TObject);
    procedure Anlagenliste1Click(Sender: TObject);
    procedure ZMySqlQuery1AfterScroll(DataSet: TDataSet);
    procedure UebersichtAfterScroll(DataSet: TDataSet);
    procedure WartungslisteAfterScroll(DataSet: TDataSet);
    procedure KundenListeAfterScroll(DataSet: TDataSet);
    procedure AnsprechpartnerAfterScroll(DataSet: TDataSet);
    procedure AnlagenAfterScroll(DataSet: TDataSet);
    procedure AnlagenBeforeDelete(DataSet: TDataSet);
    procedure ExRxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ExRxDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure ExRxDBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure TabSheetExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private-Deklarationen }
    first: boolean;
    searchtime: Integer;
    querytime: Integer;
    sortname: string;
    Limit: Integer;
    Bemerkung_Loeschen: boolean;
    procedure SH_Kunden(hide: boolean);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure LadeKunde(KID, MID: integer);
    procedure UpdateQuery;
  end;
    
  TInfo = class(TObject)
  end;
    
var
  WartungsForm: TWartungsForm;
  KREC_ID: Integer;
  CustomerChanged: boolean;
  TW_ADRESSEN, TW_WARTUNG, TW_NOTIZEN: string;
  FO_Anlage: string;
  print_Ansprechpartner: boolean;
  print_Lebenslauf: boolean;
  print_Bemerkung: boolean;
  print_Beschreibung: boolean;
  searchtime: integer;
  
implementation

uses
  IniFiles, JCLDateTime,
  {$IFDEF WITH_REPORT}
  //CAO_Wartung_Druck,
  OF_FreePrintRech,
  {$ENDIF}
  OF_DM;

{$R *.dfm}

procedure TWartungsForm.FormCreate(Sender: TObject);
var
  i: integer;
  TOBJ: TMenuItem;
begin
  first := true;

  OnUpdateStatusBar := nil;

  if WaDa_PC.PageCount > 0 then
    for i := 0 to WaDa_PC.PageCount-1 do
      WaDa_PC.Pages[i].TabVisible := false;

    SpeedButton4.Align   := alRight;
    SpeedButton2.Align   := alRight;
    JvSpeedButton1.Align := alRight;
    JvSpeedButton2.Align := alRight;
    JvSpeedButton3.Align := alRight;
    JvSpeedButton4.Align := alRight;

    DateTimePicker1.Date := now;
    DateTimePicker2.Date := incMonth(DateTimePicker1.Date, 1);
    {
    try
    TOBJ := TMenuItem.Create(Self);
    TOBJ.Tag := 1;
    SpeedButtonClick(TOBJ);
    TOBJ.Free;
    except
    end;
    }
end;

//******************************************************************************
procedure TWartungsForm.FormActivate(Sender: TObject);
var
  i: integer;
  TOBJ: TMenuItem;
begin
  if First then First := False;

  try
    TOBJ := TMenuItem.Create(Self);
    TOBJ.Tag := 1;
    SpeedButtonClick(TOBJ);
    TOBJ.Free;
  except
  end;
  {kl20041123
  SB1.SimplePanel := True;
  SB1.SimpleText := 'Lade Benutzereinstellungen ...';
  
  Schnellbemerkung1.Checked := not DM1.ReadBoolean('USERSETTINGS\' + dm1.User,
  'WARTUNG_SCHNELLBEMERKUNG', false);
  Schnellbemerkung1Click(Self);
  Anlagenliste1.Checked := not DM1.ReadBoolean('USERSETTINGS\' + dm1.User,
  'WARTUNG_ANLAGENLISTE', false);
  Anlagenliste1Click(Self);
  Bemerkung_Loeschen := DM1.ReadBoolean('USERSETTINGS\' + dm1.User,
  'WARTUNG_BNWLOESCHEN', false);
  }
  SB1.SimplePanel := False;
  SB1.SimpleText := '';
  SB1.Invalidate;
end;           

//******************************************************************************
procedure TWartungsForm.FormDeactivate(Sender: TObject);
begin
  if Anlagen.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Die aktuelle Anlage wurde verändert,' + #13#10 +
         'wollen Sie die Änderung speichern ?', mtconfirmation, [mbYes, mbNo], 0) = mryes then
      Anlagen.Post
    else
      Anlagen.Cancel;
  end;

  if Anlagen.Active then Anlagen.Close;
  if Ansprechpartner.Active then Ansprechpartner.Close;
  if KundenListe.Active then KundenListe.Close;
  if WartungsListe.Active then WartungsListe.Close;
  if Uebersicht.Active then Uebersicht.Close;
  if ZMySQLQuery1.Active then ZMySQLQuery1.Close;
end;

//******************************************************************************
procedure TWartungsForm.SH_Kunden(hide: boolean);
begin
  if Hide then
    CaoGroupBox5.Visible := false
  else
    CaoGroupBox5.Visible := true;
end;

//******************************************************************************
procedure TWartungsForm.LadeKunde(KID, MID: integer);
begin
  if KID <> -1 then
  begin
    KREC_ID := KID;
    with KundenListe do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM ADRESSEN WHERE REC_ID = ' + IntToStr(KREC_ID));
      if not Active then 
        Active := true;
    end;
    with Anlagen do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM WARTUNG WHERE ADDR_ID = ' + IntToStr(KREC_ID) +
        ' ORDER BY REC_ID');
      ExecSQL;
      if not Active then 
        Active := true;
    end;
    with Ansprechpartner do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM APARTNER WHERE ADDR_ID = ' + IntToStr(KREC_ID) +
        ' ORDER BY NAME');
      ExecSQL;
      if not Active then 
        Active := true;
    end;
    if MID <> -1 then 
      Anlagen.Locate('REC_ID', MID, []);
    CalcNextDate(Self);
    //    CaoGroupBox2.Enabled := true;
    SH_Kunden(false);
  end;
end;

//******************************************************************************
procedure TWartungsForm.CalcNextDate(Sender: TObject);
begin
  if (L_Wartung.Text <> '') and (Intervall.Text <> '') and (Intervall.Text <> '0') then
    Termin.Text := DateToStr(incMonth(StrToDate(L_Wartung.Text), StrToInt(Intervall.Text)))
  else
    Termin.Text := '--.--.----'
end;

//******************************************************************************
procedure TWartungsForm.VolgaDBEdit11Change(Sender: TObject);
begin
  CalcNextDate(Self);
end;

//******************************************************************************
procedure TWartungsForm.EditEnter(Sender: TObject);
begin
  if Sender is tEdit then
    if tEdit(Sender).ReadOnly then
      tEdit(sender).Color := clRed
    else
      tEdit(sender).Color := $009FFF9F;
  if Sender is tJvEdit then tJvEdit(sender).Color := $009FFF9F;
  if Sender is tVolgaDBEdit then tVolgaDBEdit(sender).Color := $009FFF9F;
  if Sender is tDBEdit then tDBEdit(sender).Color := $009FFF9F;
  if Sender is tDBMemo then tDBMemo(sender).Color := $009FFF9F;
end;

//******************************************************************************
procedure TWartungsForm.EditExit(Sender: TObject);
begin
  if Sender is tEdit then tEdit(sender).Color := clWindow;
  if Sender is tJvEdit then tJvEdit(sender).Color := clWindow;
  if Sender is tVolgaDBEdit then tVolgaDBEdit(sender).Color := clWindow;
  if Sender is tDBEdit then tDBEdit(sender).Color := clWindow;
  if Sender is tDBMemo then tDBMemo(sender).Color := clWindow;
end;

//******************************************************************************
procedure TWartungsForm.VolgaDBEdit10Exit(Sender: TObject);
begin
  EditExit(Sender);
  CalcNextDate(Self);
end;

//******************************************************************************
procedure TWartungsForm.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button in [nbPrior, nbNext]) and Anlagen.Modified then 
    Anlagen.Post;
end;

//******************************************************************************
procedure TWartungsForm.Drucken1Click(Sender: TObject);
{$IFDEF WITH_REPORT}
var
  FWartung_Druck: TFWartung_Druck;
{$ENDIF}
begin
  {$IFDEF WITH_REPORT}
  FWartung_Druck := TFWartung_Druck.Create (Self);
  try
    FWartung_Druck.ShowModal;
  finally
    FWartung_Druck.Free;
  end;
  {$ENDIF}
end;

//******************************************************************************
procedure TWartungsForm.SuchFeldChange(Sender: TObject);
begin
  Searchtime := 15;
  //SearchTimer.Enabled := true;  //15.10.09-ud.
end;

//******************************************************************************
procedure TWartungsForm.UpdateQuery;
var
  LastTime: DWord;
begin
  if First then exit;

  Screen.Cursor := crSQLWait;
  LastTime := GetTickCount;
  Uebersicht.ParamByName('SuchBegr').Value := '%' + SuchBeg.Text + '%';
  Uebersicht.ParamByName('SuchName').Value := '%' + SuchName.Text + '%';
  ZMySqlQuery1.ParamByName('KUNA').Value := '%' + JvEdit2.Text + '%';
  try
    Uebersicht.Active := false;
    ZMySqlQuery1.Active := false;
    Uebersicht.ExecSql;
    ZMySqlQuery1.ExecSql;
    Uebersicht.Active := true;
    ZMySqlQuery1.Active := true;
  finally
    Screen.Cursor := crDefault;
  end;
  querytime := GetTickCount - LastTime;
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.TabSheet2Show(Sender: TObject);
begin
  if First Then 
    exit;

  if not Uebersicht.Active then 
    Uebersicht.Open;
  Uebersicht.Refresh;
  SuchName.SetFocus;
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.SpeedButtonClick(Sender: TObject);
var
  SelPage: integer;
begin

  if (Sender is tMenuItem) then
    SelPage := tMenuitem(sender).Tag-1
  else
    SelPage := tSpeedButton(sender).Tag-1;

  // Alle Buttons zurücksetzen
  SpeedButton2.Font.Style := [];
  SpeedButton4.Font.Style := [];
  JvSpeedButton2.Font.Style := [];
  JvSpeedButton3.Font.Style := [];
  JvSpeedButton4.Font.Style := [];

  // Entsprechenden Button hervorheben und die Vorbedingungen erfüllen
  case SelPage of
    0:
    begin
      SpeedButton4.Font.Style := [fsBold]; Kundenliste1.Checked := true;
      if not Uebersicht.Active then 
        Uebersicht.Open;
    end;
    1:
    begin
      SpeedButton2.Font.Style := [fsBold]; Anlagendaten1.Checked := true;
      if not Anlagen.Active then 
        Anlagen.Open;
    end;
    2:
    begin
      JvSpeedButton2.Font.Style := [fsBold]; Kundendetails.Checked := true;
      if not KundenListe.Active then 
        KundenListe.Open;
    end;
    3:
    begin
      JvSpeedButton3.Font.Style := [fsBold]; Wartungstermine1.Checked := true;
      if not WartungsListe.Active then 
        WartungsListe.Open;
    end;
    4:
    begin
      JvSpeedButton4.Font.Style := [fsBold]; Kundenliste2.Checked := true;
      if not ZMySqlQuery1.Active then 
        ZMySqlQuery1.Open;
    end;
  end;
  // Die entsprechende Seite einblenden
  WaDa_PC.ActivePage := WaDa_PC.Pages[SelPage];
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.JvSpeedButton1Click(Sender: TObject);
begin
  {
  ShowInfo('Copyright, Konzept && Programmierung'#13#10#13#10+
  'Daniel Pust'#13#10'Kommunikastionselektroniker FR '+
  'Informationstechnik'#13#10'Walkürenring 47'#13#10#13#10+
  '38106 Braunschweig'#13#10'E-Mail : daniel@pust.de        '+
  'Mobil : 0178 / 32 50 849'#13#10#13#10);
  }
end;

//******************************************************************************
procedure TWartungsForm.SpeedButtonMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;

//******************************************************************************
procedure TWartungsForm.SpeedButtonMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//******************************************************************************
procedure TWartungsForm.TabSheet5Show(Sender: TObject);
begin
  if First then 
    exit;

  if not ZMySQLQuery1.Active then 
    ZMySQLQuery1.Active := true;
  ZMySQLQuery1.Refresh;
  JvEdit2.SetFocus;
end;

//******************************************************************************
procedure TWartungsForm.TabSheet1Show(Sender: TObject);
begin
  if First then 
    exit;

  PageControl1.ActivePage := TabSheet1;
  //StatusUpdateTimerTimer(@Self);  //15.10.09-ud.
  WaDa_PC.Refresh;
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.TabSheet4Show(Sender: TObject);
begin
  if First then 
    exit;

  BitBtn2.OnClick(@Self);
end;

//******************************************************************************
procedure TWartungsForm.BitBtn1Click(Sender: TObject);
begin
  // Datum für letzte Wartung setzen
  Anlagen.Edit;
  Anlagen.FieldByName('WARTUNG').Value := DateToStr(now);

  // Datum in Lebenslauf einfügen
  PageControl1.ActivePage := TabSheet1;
  DBMemo_Lebenslauf.Text := DBMemo_Lebenslauf.Text + #13 + (DateToStr(now) +
  ': ');

  // Bemerkungen nach Wartung löschen
  if Bemerkung_Loeschen then
  begin
    Anlagen.FieldByName('BEM_OPT1').Value := 0;
    Anlagen.FieldByName('BEM_OPT2').Value := 0;
    Anlagen.FieldByName('BEM_OPT3').Value := 0;
    Anlagen.FieldByName('BEM_OPT4').Value := 0;
    Anlagen.FieldByName('BEM_OPT5').Value := 0;
    Anlagen.FieldByName('BEM_OPT6').Value := 0;
    Anlagen.FieldByName('BEM_OPT7').Value := 0;
    Anlagen.FieldByName('BEM_OPT8').Value := 0;
    Anlagen.FieldByName('BEM_OPT9').Value := 0;
    Anlagen.FieldByName('BEMERKUNG').Value := '';
  end;

  if Anlagen.State in [dsEdit] then 
    Anlagen.Post;

  CalcNextDate(@Self);
  DBMemo_Lebenslauf.SetFocus;
  DBMemo_Lebenslauf.SelLength := 1;
  DBMemo_Lebenslauf.SelStart := DBMemo_Lebenslauf.GetTextLen + 2;
end;

//******************************************************************************
//15.10.09-ud.
(*
procedure TWartungsForm.StatusUpdateTimerTimer(Sender: TObject);
begin
  // Feld "Bemerkung beachten!" blinken lassen wenn erforderlich
  if DBCheckBox1.Checked or 
     DBCheckBox2.Checked or 
     DBCheckBox3.Checked or
     DBCheckBox4.Checked or 
     DBCheckBox5.Checked or 
     DBCheckBox6.Checked or
     DBCheckBox7.Checked or 
     DBCheckBox8.Checked or 
     DBCheckBox9.Checked or
     (DBMemo_Bemerkung.Text <> '') and (KREC_ID <> -1) then
    Label_Bemerkung.Visible := not Label_Bemerkung.Visible
  else
    Label_Bemerkung.Visible := false;
end;
*)

//******************************************************************************
procedure TWartungsForm.UpdateStatus;
var
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: string;
  VRecCount, VRecNo: integer;
begin
  VRecNo := 0; VRecCount := 0; Erstellt := ''; Geaendert := '';
  case WaDa_PC.ActivePageIndex of
    0:
    begin
      VRecNo := Uebersicht.RecNo;
      VRecCount := Uebersicht.RecordCount;
    end;
    1:
    begin
      VRecNo := Anlagen.RecNo;
      VRecCount := Anlagen.RecordCount;
      if (Anlagen.active) and (Anlagen.recordcount > 0) then
      begin
        Erstellt := 'Erstellt:' + formatdatetime('dd.mm.yyyy',
        AnlagenErstellt.Value);
        if AnlagenGeaendert.Value > 1 then
          Geaendert := 'Geändert:' + formatdatetime('dd.mm.yyyy', AnlagenGeaendert.Value)
        else
          Geaendert := '-';
      end;
    end;
    3:
    begin
      VRecNo := WartungsListe.RecNo;
      VRecCount := WartungsListe.RecordCount;
    end;
    4:
    begin
      VRecNo := ZMySQLQuery1.RecNo;
      VRecCount := ZMySQLQuery1.RecordCount;
    end;
  end;

  if VRecCount = 0 then
    Datensatz := 'keine'
  else 
  if VRecCount = Limit then
    Datensatz := inttostr(VRecNo) + ' von >=' + inttostr(VRecCount)
  else
    Datensatz := inttostr(VRecNo) + ' von ' + inttostr(VRecCount);

  sortname := 'n.V.';
  Sortierung := 'Sortierung : ' + sortname;

  SuchZeit := FormatFloat('0.00', (querytime) / 1000) + ' Sek.';

  if assigned(OnUpdateStatusBar) then
  begin
    SB1.Visible := False;
    OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert);
  end else
  begin
    SB1.Visible := True;
    sb1.panels[0].Text := SuchZeit;
    sb1.panels[1].Text := Datensatz;
    SB1.Panels[2].Text := Sortierung;
    Sb1.Panels[3].Text := Erstellt;
    Sb1.Panels[4].Text := Geaendert;
  end;
end;

//******************************************************************************
//15.10.09-ud.
(*
procedure TWartungsForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then 
    exit;
    
  if searchtime > 0 then
    dec(searchtime)
  else
  begin
    searchtimer.enabled := false;
    UpdateQuery;
  end;
end;
*)

//******************************************************************************
procedure TWartungsForm.AnlagenAfterInsert(DataSet: TDataSet);
begin
  Anlagen.FieldByName('ADDR_ID').Value := KREC_ID;
end;

//******************************************************************************
procedure TWartungsForm.BitBtn2Click(Sender: TObject);
begin
  Wartungsliste.ParamByName('VON').Value := Format('%0.4d-%0.2d-%0.2d',
  [YearOfDate(DateTimePicker1.DateTime), MonthOfDate(DateTimePicker1.DateTime),
  DayOfDate(DateTimePicker1.DateTime)]);
  Wartungsliste.ParamByName('BIS').Value := Format('%0.4d-%0.2d-%0.2d',
  [YearOfDate(DateTimePicker2.DateTime), MonthOfDate(DateTimePicker2.DateTime),
  DayOfDate(DateTimePicker2.DateTime)]);
  WartungsListe.Active := false;
  WartungsListe.Active := true;
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid1ApplyCellAttribute(Sender: TObject;
Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  with Uebersicht do
  begin
    if (FieldByName('BEMERKUNG').Value <> '') or 
       (FieldByName('BEM_OPT1').Value  = 1) or 
       (FieldByName('BEM_OPT2').Value = 1) or
       (FieldByName('BEM_OPT3').Value = 1) or 
       (FieldByName('BEM_OPT4').Value = 1) or
       (FieldByName('BEM_OPT5').Value = 1) or 
       (FieldByName('BEM_OPT6').Value = 1) or
       (FieldByName('BEM_OPT7').Value = 1) or 
       (FieldByName('BEM_OPT8').Value = 1) then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [fsBold];
    end;
  end;
end;   

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid1DblClick(Sender: TObject);
begin
  LadeKunde(Uebersicht.FieldValues['KID'], Uebersicht.FieldValues['MID']);
  WaDa_PC.ActivePage := TabSheet1;
  SpeedButtonClick(Anlagendaten1);
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid3DblClick(Sender: TObject);
begin
  LadeKunde(Wartungsliste.FieldValues['KID'],
  Wartungsliste.FieldValues['MID']);
  WaDa_PC.ActivePage := TabSheet1;
  SpeedButtonClick(Anlagendaten1);
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid3ApplyCellAttribute(Sender: TObject;
Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  with Wartungsliste do
  begin
    if (FieldByName('BEMERKUNG').Value <> '') or 
       (FieldByName('BEM_OPT1').Value  = 1) or 
       (FieldByName('BEM_OPT2').Value = 1) or
       (FieldByName('BEM_OPT3').Value = 1) or 
       (FieldByName('BEM_OPT4').Value = 1) or
       (FieldByName('BEM_OPT5').Value = 1) or 
       (FieldByName('BEM_OPT6').Value = 1) or
       (FieldByName('BEM_OPT7').Value = 1) or 
       (FieldByName('BEM_OPT8').Value = 1) then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [fsBold];
    end;
  end;
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid4CellClick(Column: TColumn);
begin
  CalcNextDate(Self);
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.Schnellbemerkung1Click(Sender: TObject);
var
  BEMMODI: boolean;

  function GetBool(FieldName: string): boolean;
  begin
    if Anlagen.FieldByName(FieldName).Value = 1 then
      result := true
    else
      result := false;
  end;

begin
  if Schnellbemerkung1.Checked then
  begin
    BEMMODI := false;
    if DBCheckBox1.Checked <> GetBool('BEM_OPT1') then BEMMODI := true;
    if DBCheckBox2.Checked <> GetBool('BEM_OPT2') then BEMMODI := true;
    if DBCheckBox3.Checked <> GetBool('BEM_OPT3') then BEMMODI := true;
    if DBCheckBox4.Checked <> GetBool('BEM_OPT4') then BEMMODI := true;
    if DBCheckBox5.Checked <> GetBool('BEM_OPT5') then BEMMODI := true;
    if DBCheckBox6.Checked <> GetBool('BEM_OPT6') then BEMMODI := true;
    if DBCheckBox7.Checked <> GetBool('BEM_OPT7') then BEMMODI := true;
    if DBCheckBox8.Checked <> GetBool('BEM_OPT8') then BEMMODI := true;
    if DBCheckBox9.Checked <> GetBool('BEM_OPT9') then BEMMODI := true;

    if BEMMODI then
    begin
      if (MessageDlg('Wollen sie die Änderungen an ' + #13 + #10 +
         'den Schnellbemerkungen speichern?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        if Anlagen.State in [dsEdit] then 
          Anlagen.Post;
      end;
    end;
    Schnellbemerkung1.Checked := false;
    Panel9.Visible := false;
  end else
  begin
    Schnellbemerkung1.Checked := true;
    Panel9.Visible := true;
  end;
  DM1.WriteBoolean('USERSETTINGS\' + DM1.CAOSecurity.CurrUser, 'WARTUNG_SCHNELLBEMERKUNG', Schnellbemerkung1.Checked);
  if not Anlagen.Active then 
    Anlagen.Open;
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid4ApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  with Anlagen do
  begin
    if (FieldByName('BEMERKUNG').Value <> '') or 
       (FieldByName('BEM_OPT1').Value = 1) or 
       (FieldByName('BEM_OPT2').Value = 1) or
       (FieldByName('BEM_OPT3').Value = 1) or 
       (FieldByName('BEM_OPT4').Value = 1) or
       (FieldByName('BEM_OPT5').Value = 1) or 
       (FieldByName('BEM_OPT6').Value = 1) or
       (FieldByName('BEM_OPT7').Value = 1) or 
       (FieldByName('BEM_OPT8').Value = 1) then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [fsBold];
    end;
  end;
end;

//******************************************************************************
procedure TWartungsForm.AnlagenBeforePost(DataSet: TDataSet);
begin
  if Dataset.State = dsInsert then
  begin
    AnlagenERSTELLT.Value := now;
    AnlagenERST_NAME.Value := DM1.CAOSecurity.CurrUser;
  end;
  AnlagenGEAENDERT.Value := now;
  AnlagenGEAEND_NAME.Value := DM1.CAOSecurity.CurrUser;
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid5DblClick(Sender: TObject);
begin
  LadeKunde(ZMySQLQuery1.FieldValues['KID'], -1);
  WaDa_PC.ActivePage := TabSheet1;
  SpeedButtonClick(Anlagendaten1);
end;

//******************************************************************************

procedure TWartungsForm.Anlagenliste1Click(Sender: TObject);
begin
  if Anlagenliste1.Checked then
  begin
    CaoGroupBox2.Visible := false;
    Splitter1.Visible := false;
    Anlagenliste1.Checked := false;
  end else
  begin
    CaoGroupBox2.Visible := true;
    Splitter1.Visible := true;
    Anlagenliste1.Checked := true;
  end;
  DM1.WriteBoolean('USERSETTINGS\' + DM1.CAOSecurity.CurrUser, 'WARTUNG_ANLAGENLISTE',
  Anlagenliste1.Checked);
end;

//******************************************************************************
procedure TWartungsForm.ZMySqlQuery1AfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.UebersichtAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.WartungslisteAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.KundenListeAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.AnsprechpartnerAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.AnlagenAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus;
end;

//******************************************************************************
procedure TWartungsForm.AnlagenBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Wollen sie den aktuellen Datensatz wirklich löschen,' + #13 +
     #10 + 'dieser Vorgang kann nicht rückgängig gemacht werden!', mtWarning, [mbNo, mbYes], 0) = mrNo then
    Abort;
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(13) then 
    ExRxDBGrid1DblClick(Sender);
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid3KeyPress(Sender: TObject;
var Key: Char);
begin
  if key = chr(13) then 
    ExRxDBGrid3DblClick(Sender);
end;

//******************************************************************************
procedure TWartungsForm.ExRxDBGrid5KeyPress(Sender: TObject;
var Key: Char);
begin
  if key = chr(13) then 
    ExRxDBGrid5DblClick(Sender);
end;

//******************************************************************************
procedure TWartungsForm.TabSheetExit(Sender: TObject);
begin
  case TTabSheet(Sender).PageIndex of
    0: if Uebersicht.Active then Uebersicht.Close;
    1: begin
      if Anlagen.State in [dsEdit, dsInsert] then
      begin
        if MessageDlg('Die aktuelle Anlage wurde verändert,' + #13#10 +
           'wollen Sie die Änderung speichern ?', mtconfirmation, [mbYes, mbNo], 0) = mryes then
          Anlagen.Post
        else
          Anlagen.Cancel;
      end;
      if Anlagen.Active then 
        Anlagen.Close;
    end;
    2: if KundenListe.Active then KundenListe.Close;
    3: if WartungsListe.Active then WartungsListe.Close;
    4: if ZMySqlQuery1.Active then ZMySqlQuery1.Close;
  end;
end;    

//******************************************************************************

end.


  object JvTimerList1: TJvTimerList
    Active = True
    Left = 832
    Top = 224
    object StatusUpdateTimer: TJvTimerEvents
      Interval = 750
      OnTimer = StatusUpdateTimerTimer
    end
    object SearchTimer: TJvTimerEvents
      Interval = 100
      OnTimer = SearchTimerTimer
    end
  end




  object JvFormPlace1: TJvFormPlace
    Left = 864
    Top = 224
  end



