{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Export Finzanzbuchhaltung                                         }
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
{ 02.12.2003 - Bei den Debitoren und Kreditoren wird jetzt auch die }
{              USt-ID exportiert }
{            - Beim Export von VK- und EK-Rechnungen wird nun das Aufwands- bzw. }
{              Erlöskonto nach dem Land und der USt-ID ermittelt }
{ 28.03.2004 - Die Berechnung der Aufwands- und Erlöskonten wird jetzt innerhalb }
{              der Tabellen erledigt und nicht mehr im Export }
{            - neue Exportfunktion im universellen Export verwendet, jetzt }
{              kann das Trennzeichen eingestellt werden }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Export_Fibu;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ComCtrls,
  DBCtrls, ToolWin, VolPeriod, StdCtrls, ExtCtrls, JvMenus;

type
  TExportFibuForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    Label35: TLabel;
    DatumAW: TVolgaPeriod;
    ToolBar1: TToolBar;
    PC1: TPageControl;
    DebiTS: TTabSheet;
    EinkaufTS: TTabSheet;
    ExportBtn: TToolButton;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    exportieren1: TMenuItem;
    N5: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    Drucken1: TMenuItem;
    Ansicht1: TMenuItem;
    Aktualisieren1: TMenuItem;
    DebiTab: TZQuery;
    DebiDS: TDataSource;
    KrediTS: TTabSheet;
    DebiGrid: TOFDBGrid;
    DebiTabanzahl: TStringField;
    DebiTabID: TIntegerField;
    DebiTabNAME1: TStringField;
    DebiTabNAME2: TStringField;
    DebiTabNAME3: TStringField;
    DebiTabANREDE: TStringField;
    DebiTabSTRASSE: TStringField;
    DebiTabLAND: TStringField;
    DebiTabPLZ: TStringField;
    DebiTabORT: TStringField;
    DebiTabTELE1: TStringField;
    DebiTabFUNK: TStringField;
    DebiTabDEB_NUM: TIntegerField;
    DebiTabSTATUS: TIntegerField;
    KrediDS: TDataSource;
    KrediTab: TZQuery;
    KrediTabAnzahl: TStringField;
    KrediTabID: TIntegerField;
    KrediTabName1: TStringField;
    KrediTabName2: TStringField;
    KrediTabName3: TStringField;
    KrediTabAnrede: TStringField;
    KrediTabStrasse: TStringField;
    KrediTabLand: TStringField;
    KrediTabPLZ: TStringField;
    KrediTabOrt: TStringField;
    KrediTabTele1: TStringField;
    KrediTabFunk: TStringField;
    KrediTabStatus: TIntegerField;
    KrediTabKUNNUM2: TStringField;
    KrediTabKRD_NUM: TIntegerField;
    KrediGrid: TOFDBGrid;
    VerkaufTS: TTabSheet;
    EKTab: TZQuery;
    EKDS: TDataSource;
    EKGrid: TOFDBGrid;
    EKTabrdatum: TDateField;
    EKTabnsumme: TFloatField;
    EKTabmsumme_1: TFloatField;
    EKTabmsumme_2: TFloatField;
    EKTabmsumme: TFloatField;
    EKTabbsumme: TFloatField;
    EKTabmwst_1: TFloatField;
    EKTabmwst_2: TFloatField;
    EKTabwaehrung: TStringField;
    EKTabgegenkonto: TStringField;
    EKTabkun_num: TStringField;
    EKTabkun_anrede: TStringField;
    EKTabkun_name1: TStringField;
    EKTabkun_name2: TStringField;
    EKTabkun_name3: TStringField;
    EKTabkun_strasse: TStringField;
    EKTabkun_land: TStringField;
    EKTabkun_plz: TStringField;
    EKTabkun_ort: TStringField;
    EKTaborgnum: TStringField;
    VKTab: TZQuery;
    VKTabRDATUM: TDateField;
    VKTabNSUMME: TFloatField;
    VKTabMwSt_1: TFloatField;
    VKTabMSUMME_1: TFloatField;
    VKTabMwSt_2: TFloatField;
    VKTabMSUMME_2: TFloatField;
    VKTabMSUMME: TFloatField;
    VKTabBSUMME: TFloatField;
    VKTabWaehrung: TStringField;
    VKTabGegenkonto: TStringField;
    VKTabKUN_NUM: TStringField;
    VKTabKUN_ANREDE: TStringField;
    VKTabKUN_NAME1: TStringField;
    VKTabKUN_NAME2: TStringField;
    VKTabKUN_NAME3: TStringField;
    VKTabKUN_STRASSE: TStringField;
    VKTabKUN_LAND: TStringField;
    VKTabKUN_PLZ: TStringField;
    VKTabKUN_ORT: TStringField;
    VKDS: TDataSource;
    VKGrid: TOFDBGrid;
    Nav1: TDBNavigator;
    Speichern1: TMenuItem;
    SpeichernBtn: TToolButton;
    ToolButton3: TToolButton;
    SichtbareSpalten1: TMenuItem;
    DebiTabKUNNUM1: TStringField;
    EKTabUST_NUM: TStringField;
    VKTabUST_NUM: TStringField;
    KasseVKTs: TTabSheet;
    KasseTab: TZQuery;
    KasseTabRDatum: TDateField;
    KasseTabNSumme: TFloatField;
    KasseTabMwst_1: TFloatField;
    KasseTabMSumme_1: TFloatField;
    KasseTabMwst_2: TFloatField;
    KasseTabMSumme_2: TFloatField;
    KasseTabMSumme: TFloatField;
    KasseTabBSumme: TFloatField;
    KasseTabWaehrung: TStringField;
    KasseTabGegenkonto: TIntegerField;
    KasseTabName1: TStringField;
    KasseDS: TDataSource;
    VKKasseGrid: TOfDBGrid;
    KasseTabZAHLART: TIntegerField;
    KasseTabZahlartStr: TStringField;
    VKTabSOLL_NTAGE: TLargeintField;
    VKTabSOLL_STAGE: TLargeintField;
    VKTabSOLL_SKONTO: TFloatField;
    VKTabPROJEKT: TStringField;
    EKTabSOLL_NTAGE: TLargeintField;
    EKTabSOLL_STAGE: TLargeintField;
    EKTabSOLL_SKONTO: TFloatField;
    EKTabPROJEKT: TStringField;
    EKTabAUFWANDSKONTO: TIntegerField;
    VKTabERLOESKONTO: TIntegerField;
    KasseTabErloeskonto: TIntegerField;
    EKTabVRENUM: TStringField;
    VKTabVRENUM: TStringField;
    KasseTabVRENUM: TStringField;
    KasseTabZahlart_Kurz: TStringField;
    procedure TopPanResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DatumAWChange(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure exportieren1Click(Sender: TObject);
    procedure Speichern1Click(Sender: TObject);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure KasseTabCalcFields(DataSet: TDataSet);
    procedure EKTabCalcFields(DataSet: TDataSet);
    procedure VKTabCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    First           : Boolean;
    
    Kasse_Kto,
    Scheck_Kto,
    Bank_Kto,
    DefErloesKto_IN,
    DefErloesKto_EU,
    DefErloesKto_AU,
    DefAufwKto_IN,
    DefAufwKto_EU,
    DefAufwKto_AU   : Integer;
    Use_GuV         : Boolean;
    FibuTyp         : Integer;
    FibuDos         : Boolean;
    
    procedure ExportIBM;
    procedure ExportLexWare;
  public
    { Public-Deklarationen }
  end;
    
//var
//  ExportFibuForm: TExportFibuForm;
    
implementation

uses
  FileCtrl,
  OF_DM, OF_Main, OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TExportFibuForm.FormCreate(Sender: TObject);
var 
  ja, mo, ta: word;
begin
  First   := True;
  FibuTyp := 0; // Lexware bzw. CSV
  FibuDOS := False; // Default=Windows

  decodedate (now, ja, mo, ta);
  dec(mo); 
  if mo = 0 then 
  begin 
    mo := 12; 
    dec(ja); 
  end;
  DatumAW.Year := ja;
  DatumAW.Month := mo;

  PC1.ActivePage := DebiTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.FormActivate(Sender: TObject);
var 
  Ford_LL_Kto,
  Verb_LL_Kto: String;
begin
  First                 := False;

  DebiGrid.RowColor2    := DM1.C2Color;
  KrediGrid.RowColor2   := DM1.C2Color;
  EKGrid.RowColor2      := DM1.C2Color;
  VKGrid.RowColor2      := DM1.C2Color;
  VKKasseGrid.RowColor2 := DM1.C2Color;

  dm1.GridLoadLayout (tDBGrid(DebiGrid)   , 'EXPORT_FIBU_DEB',  101);
  dm1.GridLoadLayout (tDBGrid(KrediGrid)  , 'EXPORT_FIBU_KRD',  101);
  dm1.GridLoadLayout (tDBGrid(EKGrid)     , 'EXPORT_FIBU_EK',   101);
  dm1.GridLoadLayout (tDBGrid(VKGrid)     , 'EXPORT_FIBU_VK',   101);
  dm1.GridLoadLayout (tDBGrid(VKKasseGrid), 'EXPORT_FIBU_KASSE', 101);

  FibuTyp := DM1.ReadInteger ('MAIN\FIBU', 'TYP', 0);
  FibuDos := DM1.ReadBoolean ('MAIN\FIBU', 'DOS', False);

  case FibuTyp of
    1:  if FibuDos then 
          Label35.Caption := ' Export -> IBM / DOS '
        else 
          Label35.Caption := ' Export -> IBM / Windows ';
    else 
      Label35.Caption := ' Export -> Fibu ';
  end;

  PC1.ActivePage := PC1.Pages[0];

  Kasse_Kto  := DM1.ReadInteger ('MAIN\FIBU', 'KASSE_KTO' , 1000);
  Scheck_Kto := DM1.ReadInteger ('MAIN\FIBU', 'SCHECK_KTO', 1330);
  Bank_Kto   := DM1.ReadInteger ('MAIN\FIBU', 'BANK_KTO'  , 1200);

  Use_GuV := DM1.ReadBoolean ('MAIN\FIBU', 'FIBU_GUV', False);
  if Use_GuV then
  begin
    Ford_LL_Kto := Inttostr(DM1.ReadInteger ('MAIN\FIBU', 'FORD_LL_KTO', 1500));
    Verb_LL_Kto := Inttostr(DM1.ReadInteger ('MAIN\FIBU', 'VERB_LL_KTO', 2300));

    EKTab.Sql.Text :=
    'select  VRENUM,RDATUM,NSUMME,MSUMME_1,MSUMME_2,MSUMME,BSUMME,' +
    'MWST_1,MWST_2,JOURNAL.WAEHRUNG,UPPER(' + Verb_LL_Kto + ') as GEGENKONTO,' +
    'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,KUN_STRASSE,' +
    'if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND,' +
    'KUN_PLZ,KUN_ORT,ORGNUM,UST_NUM,' +
    'SOLL_NTAGE,SOLL_STAGE,SOLL_SKONTO,PROJEKT ' +
    'from JOURNAL ' +
    'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID ' +
    'where QUELLE=5 and RDATUM>=:VON and RDATUM<=:BIS';

    VKTab.Sql.Text :=
    'select VRENUM,RDATUM,NSUMME,MSUMME_1,MSUMME_2,MSUMME,BSUMME,' +
    'MWST_1,MWST_2,JOURNAL.WAEHRUNG,UPPER(' + Ford_LL_Kto + ') as GEGENKONTO,' +
    'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,KUN_STRASSE,' +
    'if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND,' +
    'KUN_PLZ,KUN_ORT,UST_NUM,SOLL_NTAGE,SOLL_STAGE,SOLL_SKONTO,PROJEKT ' +
    'from JOURNAL ' +
    'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID ' +
    'where QUELLE=3 and RDATUM>=:VON and RDATUM<=:BIS and QUELLE_SUB <> 2';
  end else
  begin
    EKTab.Sql.Text :=
    'select  VRENUM,RDATUM,NSUMME,MSUMME_1,MSUMME_2,MSUMME,BSUMME,' +
    'MWST_1,MWST_2,JOURNAL.WAEHRUNG,UPPER(GEGENKONTO) as GEGENKONTO,' +
    'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,KUN_STRASSE,' +
    'if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND,' +
    'KUN_PLZ,KUN_ORT,ORGNUM,UST_NUM,' +
    'SOLL_NTAGE,SOLL_STAGE,SOLL_SKONTO,PROJEKT ' +
    'from JOURNAL ' +
    'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID ' +
    'where QUELLE=5 and RDATUM>=:VON and RDATUM<=:BIS';

    VKTab.Sql.Text :=
    'select VRENUM,RDATUM,NSUMME,MSUMME_1,MSUMME_2,MSUMME,BSUMME,' +
    'MWST_1,MWST_2,JOURNAL.WAEHRUNG,UPPER(GEGENKONTO) as GEGENKONTO,' +
    'KUN_NUM,KUN_ANREDE,KUN_NAME1,KUN_NAME2,KUN_NAME3,KUN_STRASSE,' +
    'if (KUN_LAND="D", "DE", KUN_LAND) as KUN_LAND,' +
    'KUN_PLZ,KUN_ORT,UST_NUM,SOLL_NTAGE,SOLL_STAGE,SOLL_SKONTO,PROJEKT ' +
    'from JOURNAL ' +
    'left outer JOIN ADRESSEN ON ADRESSEN.REC_ID=JOURNAL.ADDR_ID ' +
    'where QUELLE=3 and RDATUM>=:VON and RDATUM<=:BIS and QUELLE_SUB <> 2';
  end;

  DefAufwKto_IN    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_IN', 3400);
  DefAufwKto_EU    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_EU', 3400);
  DefAufwKto_AU    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_AU', 3400);

  DefErloesKto_IN  := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_IN', 8400);
  DefErloesKto_EU  := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_EU', 8400);
  DefErloesKto_AU  := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_AU', 8400);

  DatumAWChange(Sender);
  if DebiGrid.CanFocus then 
    DebiGrid.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.FormDeactivate(Sender: TObject);
begin
  DebiTab.Close;
  KrediTab.Close;
  EKTab.Close;
  VKTab.Close;
  KasseTab.Close;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.TopPanResize(Sender: TObject);
begin
  DatumAW.Left := TopPan.Width - DatumAW.Width - 4;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.DatumAWChange(Sender: TObject);
begin
  try
    EKTab.Close;
    EKTab.ParamByName ('von').AsDate    := DatumAW.StartDate;
    EKTab.ParamByName ('bis').AsDate    := DatumAW.EndDate;

    if not First then 
      EKTab.Open;
  except 
  end;
  try
    VKTab.Close;
    VKTab.ParamByName ('von').AsDate    := DatumAW.StartDate;
    VKTab.ParamByName ('bis').AsDate    := DatumAW.EndDate;

    if not First then 
      VKTab.Open;
  except 
  end;
  try
    DebiTab.Close;
    DebiTab.ParamByName ('von').AsDate  := DatumAW.StartDate;
    DebiTab.ParamByName ('bis').AsDate  := DatumAW.EndDate;

    if not First then 
      DebiTab.Open;
  except 
  end;
  try
    KrediTab.Close;
    KrediTab.ParamByName ('von').AsDate := DatumAW.StartDate;
    KrediTab.ParamByName ('bis').AsDate := DatumAW.EndDate;

    if not First then 
      KrediTab.Open;
  except 
  end;
  try
    KasseTab.Close;
    KasseTab.ParamByName ('von').AsDate := DatumAW.StartDate;
    KasseTab.ParamByName ('bis').AsDate := DatumAW.EndDate;

    if not First then 
      KasseTab.Open;
  except 
  end;

  exportieren1.Enabled := 
    ((KrediTab.Active) and (KrediTab.RecordCount > 0)) or
    ((DebiTab.Active)  and (DebiTab.RecordCount  > 0)) or
    ((EKTab.Active)    and (EKTab.RecordCount    > 0)) or
    ((VKTab.Active)    and (VKTab.RecordCount    > 0)) or
    ((KasseTab.Active) and (KasseTab.RecordCount > 0));

  Speichern1.Enabled := 
    ((KrediTab.Active) and (KrediTab.RecordCount > 0)) or
    ((DebiTab.Active) and (DebiTab.RecordCount  > 0));

  SpeichernBtn.Enabled := Speichern1.Enabled;
  ExportBtn.Enabled    := exportieren1.Enabled;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.PC1Change(Sender: TObject);
begin
  DatumAWChange(Sender);
  case PC1.ActivePage.Tag of
    1: Nav1.DataSource := DebiDS;
    2: Nav1.DataSource := KrediDS;
    3: Nav1.DataSource := EKDS;
    4: Nav1.DataSource := VKDS;
    5: Nav1.DataSource := KasseDS;
  end;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.Aktualisieren1Click(Sender: TObject);
begin
  DatumAWChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.exportieren1Click(Sender: TObject);
begin
  // Welcher Export soll´s den sein ?
  Case FibuTyp of
    1: ExportIBM;
    else 
      ExportLexware;
  end; //case
end;

//------------------------------------------------------------------------------
//  IBM Export
//------------------------------------------------------------------------------
procedure TExportFibuForm.ExportIBM;
{
26.01.2004   Es werden folgende Anwendungen unterstützt:
NLH          ---------------------+---------------------------+-------------
Anwendung              liest                       Übernahme im
Arbeitsgebiet
---------------------+---------------------------+-------------
IBM Fibu für Windows   Buchungen, Adressen         Datenimport                                                      Adressen
---------------------+---------------------------+-------------
IBM Fibu für DOS       Buchungen, Adressen         Stapelbuchen
---------------------+---------------------------+-------------
IBM Finanzwesen        Buchungen, Adressen         Datenimport
---------------------+---------------------------+-------------
IBM DATEV-Schnittst.   Buchungen, Adressen         Übernahme der
Eingabedatei
---------------------+---------------------------+-------------
IBM Auftragsbearb.     Adressen                    Datenimport
---------------------+---------------------------+-------------
IBM Fakturierung/1     Adressen                    Datenimport
---------------------+---------------------------+-------------

Der Satzaufbau der sogeannten FI?.DF Dateien ist abhängig von der
Version der Anwendung, es gibt:

a) die alte Version
b) die Version 2
c) die Version 3

Die Versionen 2 und 3 können nur von den neueren IBM Anwendungen
gelesen werden, während die alte Version von allen oben genannten
importiert werden kann, also auch von den DOS Anwendungen. Deshalb
wurden die Satzarten der "alten Version" für den universelleren
Einsatz gewählt.

OEM Konvertierung von Cao-Faktura Windows zu IBM-DOS-Anwendung
kann per Flag gesetzt werden.

IBM Konto für Ford_LL_Kto ist 1500
IBM Konto für Verb_LL_Kto ist 2300
}

var 
  I: Integer;
  S: String;
  DN: String;
  D: TextFile;
begin
  First := False;
  DatumAWChange (Self);

  if not Use_GuV then
  begin
    // ------------------
    // Debitoren (Kunden)
    // ------------------

    DN := DM1.ExportDir + 'EXPORT_FIBU_DEBI_' +
    FormatDateTime ('yyyy_mm', DatumAW.StartDate) + '.DF';
    AssignFile (D, DN);
    if not fileexists (DN) then 
      FileClose(FileCreate(DN));
    rewrite(D);
    Append (D);

    try
      DebiTab.First;
      while not Debitab.Eof do
      begin
        s := 'K01' +
        format('%7.7s',   [DebiTabDEB_NUM.AsString]) +  {Kontonummer}
        format('%-30.30s', [DebiTabNAME1.AsString]) +   {Name 1}
        format('%-30.30s', [DebiTabNAME2.AsString]) +   {Name 2}
        format('%-3.3s',  [DebiTabLAND.AsString]) +    {Land}
        format('%-22.22s', [DebiTabORT.AsString]) +      {Ort}
        format('%-30.30s', [DebiTabSTRASSE.AsString]) + {Strasse}
        format('%-15.15s', [DebiTabTELE1.AsString]) +    {Telefon}
        StringOfChar(' ', 8) +                          {Kurzname / Grossb.}
        format('%-5.5s',  [DebiTabPLZ.AsString]) +     {PLZ}
        StringOfChar(' ', 3);                          {Zahlungsbedingung}

        if FibuDos then CharToOEM(PChar(s), @s[1]);
        Writeln (D, S);
        DebiTab.Next;
      end;
    finally
      Write(D, #$1A);
      CloseFile (D);
    end;

    // ------------------------
    // Kreditoren = Lieferanten
    // ------------------------

    DN := DM1.ExportDir + 'EXPORT_FIBU_KREDI_' +
    FormatDateTime ('yyyy_mm', DatumAW.StartDate) + '.DF';
    AssignFile (D, DN);
    if not fileexists (DN) then 
      FileClose(FileCreate(DN));
    rewrite(D);
    Append (D);

    try
      KrediTab.First;
      while not KrediTab.Eof do
      begin
        s := 'L01' +
        format('%7.7s',   [KrediTabKRD_NUM.AsString]) + {Kontonummer}
        format('%-30.30s', [KrediTabName1.AsString]) +   {Name 1}
        format('%-30.30s', [KrediTabName2.AsString]) +   {Name 2}
        format('%-3.3s',  [KrediTabLand.AsString]) +    {Land}
        format('%-22.22s', [KrediTabOrt.AsString]) +      {Ort}
        format('%-30.30s', [KrediTabStrasse.AsString]) + {Strasse}
        format('%-15.15s', [KrediTabTele1.AsString]) +    {Telefon}
        StringOfChar(' ', 8) +                           {Kurzname / Grossb.}
        format('%-5.5s',  [KrediTabPLZ.AsString]) +      {PLZ}
        StringOfChar(' ', 3);                           {Zahlungsbedingung}

        if FibuDos then CharToOEM(PChar(s), @s[1]);
        Writeln (D, S);
        KrediTab.Next;
      end;
    finally
      Write(D, #$1A);
      CloseFile (D);
    end;

  end; //if not Use_GuV

  // ------------------------
  // EK - Einkauf
  // ------------------------
  DN := DM1.ExportDir + 'EXPORT_FIBU_EK_' +
  FormatDateTime ('yyyy_mm', DatumAW.StartDate) + '.DF';
  AssignFile (D, DN);
  if not fileexists (DN) then 
    FileClose(FileCreate(DN));
  rewrite(D);
  Append (D);

  try
    EKTab.First;
    while not EKTab.Eof do
    begin
      {
      Land :=EKTabkun_land.AsString;
      if Land='D' then Land :='DE';
      
      if Land=DM1.LandK2 then
      DefAufwKto := DefAufwKto_IN
      else
      if length(EKTabUST_NUM.AsString) > 0 then
      DefAufwKto := DefAufwKto_EU
      else
      DefAufwKto := DefAufwKto_AU;
      
      if   Use_GuV then
      GuV_Kto := Verb_LL_KTO
      else GuV_Kto := EKTab.Fields[10].AsString;          //Lieferantennr
      }

      s := 'A' +                                           { aktive Buchung }
      ' ' +                                           { kein Abstimmkreis }
      '01' +                                           { Firma }
      format('%-20.20s', [EKTabkun_name1.AsString]) +   { Buchungstext = Name1}
      format('%-10.10s', [EKTaborgnum.AsString]) +      { Fremdbelegnummer }
      StringOfChar(' ', 3) +                          { Steuerschlüssel }
      StringOfChar(' ', 3) +                          { Zahlungsbedingung }
      StringOfChar('0', 3) +                          { Tage der Nettofälligkeit }
      StringOfChar('0', 3) +                          { Tage der Skontofälligkeit }
      '00.00' +                                        { Skontoprozentsatz }
      StringOfChar('0', 7) +                          { Satznummer, autom. = 0 }
      formatdatetime('ddmmyy', EKTabrdatum.AsDateTime) +  { Buchungsdatum TTMMJJ }
      formatdatetime('ddmmyy', EKTabrdatum.AsDateTime) +  { Belegdatum TTMMJJ }
      formatdatetime('ddmmyy', EKTabrdatum.AsDateTime) +  { OP - Datum TTMMJJ }
      StringOfChar('0', 6) +                           { Skontofälligkeitsdatum TTMMJJ }
      StringOfChar('0', 7) +                           { Kostenstelle, wenn Sachkonto mit Kostenstelle verschlüsselt }
      format('%7.7s', [EKTabvrenum.AsString]) +        { Belegnummer }
      format('%7.7s', [EKTabgegenkonto.AsString]) +    { Kontonummer Haben = Lieferantennr (nicht bei GuV) }
      format('%7.7s', [EKTabAUFWANDSKONTO.AsString]) + { Kontonummer Soll = Kostenkonto 3xxx - 4xxx}
      StringOfChar('0', 7) +                           { Beleg Konto Haben }
      StringOfChar('0', 7) +                           { Beleg Konto Soll }
      format('%12.12s', [EKTabbsumme.AsString]) +       { Buchungsbetrag }
      ' ';                                            { Positiver ( + / - ) Betrag}

      if FibuDos then CharToOEM(PChar(s), @s[1]);
      Writeln (D, S);
      EKTab.Next;
    end;
  finally
    Write(D, #$1A);
    CloseFile (D);
  end;

  // ------------------------
  // VK - Verkauf
  // ------------------------
  DN := DM1.ExportDir + 'EXPORT_FIBU_VK_' +
  FormatDateTime ('yyyy_mm', DatumAW.StartDate) + '.DF';
  AssignFile (D, DN);
  if not fileexists (DN) then 
    FileClose(FileCreate(DN));
  rewrite(D);
  Append (D);

  try
    VKTab.First;
    while not VKTab.Eof do
    begin
      {
      Land :=VKTabkun_land.AsString;
      if Land='D' then Land :='DE';
      
      if Land=DM1.LandK2 then
      DefErloesKto := DefErloesKto_IN
      else if length(VKTabUST_NUM.AsString) > 0 then
      DefErloesKto := DefErloesKto_EU
      else
      DefErloesKto := DefErloesKto_AU;
      
      if   Use_GuV then
      GuV_Kto := Ford_LL_KTO
      else GuV_Kto := VKTab.Fields[10].AsString;          // Kundennr
      }


      s := 'A' +                                           { aktive Buchung }
      ' ' +                                           { kein Abstimmkreis }
      '01' +                                           { Firma }
      format('%-20.20s', [VKTabKUN_NAME1.AsString]) +   { Buchungstext = Name 1 }
      StringOfChar(' ', 10) +                          { Fremdbelegnummer / nicht belegt }
      StringOfChar(' ', 3) +                          { Steuerschlüssel / nicht belegt }
      StringOfChar(' ', 3) +                          { Zahlungsbedingung }
      StringOfChar('0', 3) +                          { Tage der Nettofälligkeit }
      StringOfChar('0', 3) +                          { Tage der Skontofälligkeit }
      '00.00' +                                        { Skontoprozentsatz }
      StringOfChar('0', 7) +                          { Satznummer, autom. = 0 }
      formatdatetime('ddmmyy', VKTabRDATUM.AsDateTime) +  { Buchungsdatum TTMMJJ }
      formatdatetime('ddmmyy', VKTabRDATUM.AsDateTime) +  { Belegdatum TTMMJJ }
      formatdatetime('ddmmyy', VKTabRDATUM.AsDateTime) +  { OP - Datum TTMMJJ }
      StringOfChar('0', 6) +                           { Skontofälligkeitsdatum TTMMJJ }
      StringOfChar('0', 7) +                           { Kostenstelle, wenn Sachkonto mit Kostenstelle verschlüsselt }
      format('%7.7s', [VKTabVRENUM.AsString]) +        { Belegnummer }
      format('%7.7s', [VKTabERLOESKONTO.AsString]) +   { Kontonummer Haben = Erlöskonto 8xxx}
      format('%7.7s', [VKTabGegenkonto.AsString]) +    { Kontonummer Soll = DebitorKto = Kundennr (nicht bei GuV)}
      StringOfChar('0', 7) +                           { Beleg Konto Haben }
      StringOfChar('0', 7) +                           { Beleg Konto Soll }
      format('%12.12s', [VKTabBSUMME.AsString]) +       { Buchungsbetrag }
      ' ';                                            { Positiver ( + / - ) Betrag}

      if FibuDos then 
        CharToOEM(PChar(s), @s[1]);
      Writeln(D, S);
      VKTab.Next;
    end;
  finally
    Write(D, #$1A);
    CloseFile (D);
  end;

  // ------------------------
  // VK - Kasse
  // ------------------------

  DN := DM1.ExportDir + 'EXPORT_FIBU_VK_KASSE_' +
  FormatDateTime ('yyyy_mm', DatumAW.StartDate) + '.DF';
  AssignFile (D, DN);
  if not fileexists (DN) then 
    FileClose(FileCreate(DN));
  rewrite(D);
  Append (D);

  try
    KasseTab.First;
    while not KasseTab.Eof do
    begin
      s := 'A' +                                           { aktive Buchung }
      ' ' +                                           { kein Abstimmkreis }
      '01' +                                           { Firma }
      format('%-20.20s', [KasseTabName1.AsString]) +    { Buchungstext }
      StringOfChar(' ', 10) +                          { Fremdbelegnummer / nicht belegt }
      StringOfChar(' ', 3) +                          { Steuerschlüssel / nicht belegt }
      StringOfChar(' ', 3) +                          { Zahlungsbedingung }
      StringOfChar('0', 3) +                          { Tage der Nettofälligkeit }
      StringOfChar('0', 3) +                          { Tage der Skontofälligkeit }
      '00.00' +                                        { Skontoprozentsatz }
      StringOfChar('0', 7) +                          { Satznummer, autom. = 0 }
      formatdatetime('ddmmyy', KasseTabRDatum.AsDateTime) + { Buchungsdatum TTMMJJ }
      formatdatetime('ddmmyy', KasseTabRDatum.AsDateTime) + { Belegdatum TTMMJJ }
      formatdatetime('ddmmyy', KasseTabRDatum.AsDateTime) + { OP - Datum TTMMJJ }
      StringOfChar('0', 6) +                           { Skontofälligkeitsdatum TTMMJJ }
      StringOfChar('0', 7) +                           { Kostenstelle, wenn Sachkonto mit Kostenstelle verschlüsselt }
      format('%7.7s', [KasseTabVReNum.AsString])    +  { Belegnummer }
      format('%7.7s', [KasseTabErloeskonto.AsString]) + { Kontonummer Haben = Erlöskonto 8xxx}
      format('%7.7s', [KasseTabGegenkonto.AsString]) +  { Kontonummer Soll = DebitorKto = Kundennr (Direkt auf Kasse)}
      StringOfChar('0', 7) +                           { Beleg Konto Haben }
      StringOfChar('0', 7) +                           { Beleg Konto Soll }
      format('%12.12s', [KasseTabBSumme.AsString])   + { Buchungsbetrag }
      ' ';                                            { Positiver ( + / - ) Betrag}

      if FibuDos then 
        CharToOEM(PChar(s), @s[1]);
      Writeln (D, S);
      KasseTab.Next;
    end;
  finally
    Write(D, #$1A);
    CloseFile(D);
  end;

  if Use_GuV then
    MessageDlg ('Dateien wurden unter "' + DM1.ExportDir + '" erstellt' +
      #13#10 + #13#10 +
      'Vorgehensweise in der IBM-Anwendung: ' + #13#10 + #13#10 +
      'Nur EK,VK und KASSE sind zu importieren. ' + #13#10 + #13#10 +
      'Dateiformat:  Altes DF-Format '
      , mtInformation, [mbOk], 0)
  else
    MessageDlg ('Dateien wurden unter "' + DM1.ExportDir + '" erstellt' +
      #13#10 + #13#10 +
      'Vorgehensweise in der IBM-Anwendung: ' + #13#10 + #13#10 +
      '1. Zuerst die DEBITOREN, KREDITOREN und ' + #13#10 +
      '2. danach EK,VK und KASSE importieren. ' + #13#10 + #13#10 +
      'Dateiformat:  Altes DF-Format '
      , mtInformation, [mbOk], 0);

end;

//------------------------------------------------------------------------------
//  Lexware Export bzw. universeller CVS-Export mit Trennzeichen TAB
//------------------------------------------------------------------------------
procedure TExportFibuForm.ExportLexware;
var 
  I           : Integer;
  S           : String;
  DN          : String;
  Trennzeichen: String;
  Key         : String;
  Modus       : Integer;
  MitFeldNamen: Boolean;
  TextInHK    : Boolean;
begin
  Key := 'MAIN\FIBU';

  MitFeldNamen := DM1.ReadBoolean(Key, 'INCL_FELDNAMEN', TRUE);
  TextInHK     := DM1.ReadBoolean(Key, 'TEXT_IN_HOCHKOMMAS', FALSE);
  Modus        := DM1.ReadInteger(Key, 'MODUS', 0);
  Trennzeichen := DM1.ReadString(Key, 'TRENNZEICHEN', #9);

  First        := False;

  DatumAWChange (Self);

  if not Use_GuV then
  begin
    // Debitoren
    DN := DM1.ExportDir + 'EXPORT_FIBU_DEBI_' +
     FormatDateTime('yyyy_mm', DatumAW.StartDate) + '.txt';

    DM1.ExportDatasetToFile(DN, DebiTab, Trennzeichen, Modus = 1, MitFeldNamen, TextInHK,
    FibuDos);

    // Kreditoren
    DN := DM1.ExportDir + 'EXPORT_FIBU_KREDI_' +
     FormatDateTime('yyyy_mm', DatumAW.StartDate) + '.txt';

    DM1.ExportDatasetToFile(DN, KrediTab, Trennzeichen, Modus = 1, MitFeldNamen, TextInHK, FibuDos);
  end;

  // EK-Rechnungen
  DN := DM1.ExportDir + 'EXPORT_FIBU_EK_' +
   FormatDateTime('yyyy_mm', DatumAW.StartDate) + '.txt';

  DM1.ExportDatasetToFile (DN,
  EKTab,
  Trennzeichen,
  Modus = 1,
  MitFeldNamen,
  TextInHK,
  FibuDos);

  // VK-Rechnungen
  DN := DM1.ExportDir + 'EXPORT_FIBU_VK_' +
   FormatDateTime('yyyy_mm', DatumAW.StartDate) + '.txt';

  DM1.ExportDatasetToFile (DN,
  VKTab,
  Trennzeichen,
  Modus = 1,
  MitFeldNamen,
  TextInHK,
  FibuDos);

  // VK-Kasse
  DN := DM1.ExportDir + 'EXPORT_FIBU_VK_KASSE_' +
   FormatDateTime('yyyy_mm', DatumAW.StartDate) + '.txt';

  DM1.ExportDatasetToFile(DN, KasseTab, Trennzeichen, Modus = 1, MitFeldNamen, TextInHK, FibuDos);
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.Speichern1Click(Sender: TObject);
begin
  if MessageDlg('Achtung :' + #13#10 +
      'Nach dem Speichern ist kein Export der Kreditoren' + #13#10 +
      'und Debitoren für den ausgewählten Monat mehr möglich !!!' + #13#10 +
      'Wollen Sie fortfahren ???',
      mtconfirmation, mbyesnocancel, 0) <> mrYes then 
  begin
    exit;
  end;

  DebiTab.First;
  while not DebiTab.Eof do
  begin
    DM1.UniQuery.Close;
    DM1.Uniquery.Sql.Text :=
      'update ADRESSEN SET STATUS=0 where REC_ID=' +
      Inttostr(DebiTabID.Value) + ' and (ISNULL(STATUS))';
    DM1.Uniquery.ExecSql;

    DM1.UniQuery.Close;
    DM1.Uniquery.Sql.Text :=
      'update ADRESSEN SET STATUS=STATUS | 2 WHERE REC_ID=' +
    Inttostr(DebiTabID.Value);
    DM1.Uniquery.ExecSql;

    DebiTab.Next;
  end;

  KrediTab.First;
  while not KrediTab.Eof do
  begin
    DM1.UniQuery.Close;
    DM1.Uniquery.Sql.Text :=
      'update ADRESSEN SET STATUS=0 where REC_ID=' +
      Inttostr(KrediTabID.Value) + ' and (ISNULL(STATUS))';
    DM1.Uniquery.ExecSql;

    DM1.UniQuery.Close;
    DM1.Uniquery.Sql.Text :=
      'update ADRESSEN SET STATUS=STATUS | 32 WHERE REC_ID=' +
      Inttostr(KrediTabID.Value);
    DM1.Uniquery.ExecSql;

    KrediTab.Next;
  end;

  DatumAWChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout(tDBGrid(DebiGrid),   'EXPORT_FIBU_DEB',  101);
  dm1.GridSaveLayout(tDBGrid(KrediGrid),  'EXPORT_FIBU_KRD',  101);
  dm1.GridSaveLayout(tDBGrid(EKGrid),     'EXPORT_FIBU_EK',   101);
  dm1.GridSaveLayout(tDBGrid(VKGrid),     'EXPORT_FIBU_VK',   101);
  dm1.GridSaveLayout(tDBGrid(VKKasseGrid), 'EXPORT_FIBU_KASSE', 101);
end;                

//------------------------------------------------------------------------------
procedure TExportFibuForm.SichtbareSpalten1Click(Sender: TObject);
begin
  case PC1.ActivePage.TabIndex of
    0: VisibleSpaltenForm.UpdateTable(tDBGrid(DebiGrid));
    1: VisibleSpaltenForm.UpdateTable(tDBGrid(KrediGrid));
    2: VisibleSpaltenForm.UpdateTable(tDBGrid(EKGrid));
    3: VisibleSpaltenForm.UpdateTable(tDBGrid(VKGrid));
    4: VisibleSpaltenForm.UpdateTable(tDBGrid(VKKasseGrid));
  end;
end;                                 

//------------------------------------------------------------------------------
procedure TExportFibuForm.KasseTabCalcFields(DataSet: TDataSet);
var S: String;
begin
  case KasseTabZahlart.AsInteger of
    1: begin 
      KasseTabGEGENKONTO.AsInteger := Kasse_Kto;  
      S := 'BAR';      end;
    6: begin 
      KasseTabGEGENKONTO.AsInteger := Bank_Kto;   
      S := 'Scheck';   
    end;
    5: begin 
      KasseTabGEGENKONTO.AsInteger := Scheck_Kto; 
      S := 'EC-Karte'; 
    end;
    else begin 
      KasseTabGEGENKONTO.AsInteger := 0;          
      S := '???';      
    end;
  end;
  KasseTabZahlartStr.AsString   := S;
  KasseTabErloeskonto.AsInteger := DefErloesKTO_IN; // Default-Konto Inland
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.EKTabCalcFields(DataSet: TDataSet);
begin
  if EKTabkun_land.AsString = DM1.LandK2 then
  begin
    // Inland
    EKTabAUFWANDSKONTO.AsInteger := DefAufwKto_IN;
  end else
  if length(EKTabUST_NUM.AsString)>0 then
  begin
    // Derzeit die einzige Möglichleit einen EU-Kunden zu ermitteln
    // Wir prüfen ob eine UST-ID eingetragen ist und das Land <> Innland
    EKTabAUFWANDSKONTO.AsInteger := DefAufwKto_EU;
  end else
  begin
    // Ausland
    EKTabAUFWANDSKONTO.AsInteger := DefAufwKto_AU;
  end;
end;

//------------------------------------------------------------------------------
procedure TExportFibuForm.VKTabCalcFields(DataSet: TDataSet);
begin
  if VKTabkun_land.AsString = DM1.LandK2 then
  begin
    // Inland
    VKTabERLOESKONTO.AsInteger := DefErloesKto_IN;
  end else
  if length(VKTabUST_NUM.AsString) > 0 then
  begin
    // Derzeit die einzige Möglichleit einen EU-Kunden zu ermitteln
    // Wir prüfen ob eine UST-ID eingetragen ist und das Land <> Innland
    VKTabERLOESKONTO.AsInteger := DefErloesKto_EU;
  end else
  begin
    // Ausland
    VKTabERLOESKONTO.AsInteger := DefErloesKto_AU;
  end;
end;

//------------------------------------------------------------------------------

end.

