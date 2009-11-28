{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : allgemeiner Setup-Dialog (Setup für was??)                        }
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
  - Backup-Hinweisdialog
  -

  ISSUES, NOTES:
  -

  HISTORY:
  13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
  10.05.2003 - allg. Firmendaten hinzugefügt (werden in allen Formularen verw.)
  25.06.2003 - neues Tabsheet für die Shopeinstellungen hinzugefügt
  29.06.2003 - neues Tabsheet für Allg. Einstellungen hinzugefügt, Kosmetik ...
  25.07.2003 - Shop-Einstellungen entfernt und in einem sep. Dialog untergebracht
  20.09.2003 - Adresse und Kundenmerkmale eingebaut
             - Pfade für Backup, DTA, Im- und Export eingebaut
             - Benutzerfelder für Artikel und Adressen eingebaut
  22.09.2003 - Warengruppen ausgebaut, jetzt sind auch die Kalkulationsfaktoren
               und die Default-MwSt editierbar
  07.12.2003 - neue Seite FiBu hinzugefügt
  11.12.2003 - Update des Shop_Change_Flag nach neuberechnen der Preise
               (über Kalkulationsfaktor) implementiert
  13.03.2004 - Liste bei den Firmenkonten eingefügt
  06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)
  30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)
  28.11.2009 - UD: "MainDir" entfällt, durch "APP_PATH" ersetzt.
*******************************************************************************)

unit OF_Setup;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls,
  JvToolEdit, StdCtrls, JvSpin, Buttons, JvExStdCtrls, JvDBCombobox,
  DBCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ComCtrls,
  VolDBEdit{???}, Mask, JvExMask, JvBaseEdits;

{
uses
  ToolWin, JvCurrEdit, JvMaskEdit,
  JvDBCtrl, JvDBComb, JvEdit, JvTypedEdit,
}

type
  TSetupForm = class(TForm)
    StatusBar1: TStatusBar;
    NavPan: TPanel;
    PC1: TPageControl;
    NumTab: TTabSheet;
    ZahlartTab: TTabSheet;
    LiefArtTab: TTabSheet;
    KunGrTab: TTabSheet;
    ArtGrTab: TTabSheet;
    NumDS: TDataSource;
    ZahlArtDS: TDataSource;
    LiefArtDS: TDataSource;
    KunGrDS: TDataSource;
    ArtGrDS: TDataSource;
    Nav1: TDBNavigator;
    NumGrid: TOFDBGrid;
    DBGrid1: TOFDBGrid;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBMemo2: TDBMemo;
    Label2: TLabel;
    DBGrid2: TOFDBGrid;
    DBGrid3: TOFDBGrid;
    Label3: TLabel;
    DBMemo3: TDBMemo;
    DBGrid4: TOFDBGrid;
    FirKontenTab: TTabSheet;
    FirKontenDS: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    FirmDat1Tab: TTabSheet;
    FirAnrede: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    FirName1: TDBEdit;
    Label11: TLabel;
    FirName2: TDBEdit;
    Label12: TLabel;
    FirName3: TDBEdit;
    Label13: TLabel;
    FirStrasse: TDBEdit;
    Label14: TLabel;
    FirLand: TDBEdit;
    Label15: TLabel;
    FirPLZ: TDBEdit;
    FirOrt: TDBEdit;
    Label16: TLabel;
    FirAbsender: TDBEdit;
    Label17: TLabel;
    Label19: TLabel;
    FirTele1: TDBEdit;
    Label20: TLabel;
    FirTele2: TDBEdit;
    Label21: TLabel;
    FirFax: TDBEdit;
    Label22: TLabel;
    FirMobil: TDBEdit;
    Label23: TLabel;
    FirEMail: TDBEdit;
    Label24: TLabel;
    FirWebsite: TDBEdit;
    Label25: TLabel;
    FirBank1: TDBEdit;
    Label26: TLabel;
    FirKto1: TDBEdit;
    Label27: TLabel;
    FirBLZ1: TDBEdit;
    Label28: TLabel;
    FirBank2: TDBEdit;
    Label29: TLabel;
    FirKto2: TDBEdit;
    Label30: TLabel;
    FirBLZ2: TDBEdit;
    Label31: TLabel;
    FirmDat2Tab: TTabSheet;
    DBRichEdit1: TDBRichEdit;
    DBRichEdit2: TDBRichEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    FirSteuerNo: TDBEdit;
    FirUSRID: TDBEdit;
    Label35: TLabel;
    AllgTS: TTabSheet;
    Label41: TLabel;
    LeitwaehrungEdit: TEdit;
    ShopSaveBtn: TSpeedButton;
    Edit1: TEdit;
    Label4: TLabel;
    GlobMwstGB: TGroupBox;
    Label42: TLabel;
    MWST0_EDIT: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label43: TLabel;
    MWST1_EDIT: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label44: TLabel;
    MWST2_EDIT: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label45: TLabel;
    MWST3_EDIT: TJvCalcEdit;  //TJvxCurrencyEdi;
    GlobCalcGB: TGroupBox;
    Label40: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    VK1_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    VK2_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    VK3_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    VK4_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label49: TLabel;
    VK5_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label50: TLabel;
    SVK_CALC: TJvCalcEdit;  //TJvxCurrencyEdi;
    AdressenTab: TTabSheet;
    ArtikelTab: TTabSheet;
    EMailTab: TTabSheet;
    PfadTS: TTabSheet;
    Label51: TLabel;
    BackupDirEdi: TJvDirectoryEdit;
    Label52: TLabel;
    TempDirEdi: TJvDirectoryEdit;
    Label53: TLabel;
    DTADirEdi: TJvDirectoryEdit;
    Label54: TLabel;
    ExportDirEdi: TJvDirectoryEdit;
    ImportDirEdi: TJvDirectoryEdit;
    Label55: TLabel;
    AddrMerkmalGB: TGroupBox;
    AddrUserFeldGB: TGroupBox;
    AddrUserFeld1: TEdit;
    AddrUserFeld2: TEdit;
    AddrUserFeld3: TEdit;
    AddrUserFeld4: TEdit;
    AddrUserFeld5: TEdit;
    AddrUserFeld6: TEdit;
    AddrUserFeld7: TEdit;
    AddrUserFeld8: TEdit;
    AddrUserFeld9: TEdit;
    AddrUserFeld10: TEdit;
    Label56: TLabel;
    ADUF1: TCheckBox;
    ADUF2: TCheckBox;
    ADUF3: TCheckBox;
    ADUF4: TCheckBox;
    ADUF5: TCheckBox;
    ADUF6: TCheckBox;
    ADUF7: TCheckBox;
    ADUF8: TCheckBox;
    ADUF9: TCheckBox;
    ADUF10: TCheckBox;
    
    
    ArtUserFeld1: TEdit;
    ArtUserFeld2: TEdit;
    ArtUserFeld3: TEdit;
    ArtUserFeld4: TEdit;
    ArtUserFeld5: TEdit;
    ArtUserFeld6: TEdit;
    ArtUserFeld7: TEdit;
    ArtUserFeld8: TEdit;
    ArtUserFeld9: TEdit;
    ArtUserFeld10: TEdit;
    
    ARUF1: TCheckBox;
    ARUF2: TCheckBox;
    ARUF3: TCheckBox;
    ARUF4: TCheckBox;
    ARUF5: TCheckBox;
    ARUF6: TCheckBox;
    ARUF7: TCheckBox;
    ARUF8: TCheckBox;
    ARUF9: TCheckBox;
    ARUF10: TCheckBox;
    AddrMerkmalGrid: TOFDBGrid;
    MerkmalTab: TZQuery;
    MerkmalDS: TDataSource;
    MerkmalTabMERKMAL_ID: TIntegerField;
    MerkmalTabNAME: TStringField;
    ArtMerkmalGB: TGroupBox;
    Label57: TLabel;
    WGNumEdi: TDBEdit;
    Label58: TLabel;
    WGDescEdi: TDBEdit;
    Label59: TLabel;
    WgrDefEKtoEdi: TDBEdit;
    WGTopGRCB: TDBLookupComboBox;
    WgrLoTab: TZQuery;
    WgrLo: TDataSource;
    Label60: TLabel;
    WgrDefAKtoEdi: TDBEdit;
    Label62: TLabel;
    Label63: TLabel;
    WgrDefSteuer: TJvDBComboBox;
    NoTopWgrBtn: TBitBtn;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    WgrClac1Edi: TDBEdit;
    WgrClac2Edi: TDBEdit;
    WgrClac3Edi: TDBEdit;
    WgrClac4Edi: TDBEdit;
    WgrClac5Edi: TDBEdit;
    AddrAlgGB: TGroupBox;
    Kunnum1Edi_CB: TCheckBox;
    Label61: TLabel;
    Label69: TLabel;
    DefMwstCB: TComboBox;
    UseKFZCB: TCheckBox;
    GroupBox7: TGroupBox;
    ArtnumAutoCB: TCheckBox;
    Label70: TLabel;
    AnzPreisCB: TComboBox;
    BRRundWert: TJvSpinEdit;
    BN_CalcSchranke: TJvSpinEdit;
    Label71: TLabel;
    Label72: TLabel;
    PreisCalcBtn: TSpeedButton;
    ArtUserFeldGB: TGroupBox;
    LandEdi: TVolgaDBEdit;
    Label73: TLabel;
    LandLangEdi: TEdit;
    BelegLB: TListBox;
    Label74: TLabel;
    EMailBetreff: TEdit;
    Label75: TLabel;
    Label76: TLabel;
    eMailBodyMemo: TMemo;
    TabSheet1: TTabSheet;
    FibuErloesKtoTab: TZQuery;
    FibuErloesKtoDS: TDataSource;
    ErloesGrGrid: TOFDBGrid;
    TabSheet2: TTabSheet;
    AufwGrGrid: TOFDBGrid;
    FibuAufwKtoTab: TZQuery;
    FibuAufwKtoDS: TDataSource;
    TabSheet3: TTabSheet;
    AufwKtoIN: TJvCalcEdit;  //TJvIntegerEdi;
    Label18: TLabel;
    AufwKtoEU: TJvCalcEdit;  //TJvIntegerEdi;
    Label36: TLabel;
    AufwKtoAU: TJvCalcEdit;  //TJvIntegerEdi;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    ErloesKtoIN: TJvCalcEdit;  //TJvIntegerEdi;
    ErloesKtoEU: TJvCalcEdit;  //TJvIntegerEdi;
    ErloesKtoAU: TJvCalcEdit;  //TJvIntegerEdi;
    FibuModeGB: TRadioGroup;
    KasseKto: TJvCalcEdit;  //TJvIntegerEdi;
    ScheckKto: TJvCalcEdit;  //TJvIntegerEdi;
    Label77: TLabel;
    Label78: TLabel;
    FordLLKto: TJvCalcEdit;  //TJvIntegerEdi;
    FordLLLab: TLabel;
    VerbLLLab: TLabel;
    VerbLLKto: TJvCalcEdit;  //TJvIntegerEdi;
    Label81: TLabel;
    BankKto: TJvCalcEdit;  //TJvIntegerEdi;
    ExportSetupBtn: TSpeedButton;
    GroupBox1: TGroupBox;
    FibuTypCB: TComboBox;
    FibuDosCB: TCheckBox;
    Label79: TLabel;
    DBEdit5: TDBEdit;
    FirKtoGrid: TOFDBGrid;
    Bevel1: TBevel;
    Label80: TLabel;
    FibuExportFNCB: TCheckBox;
    FibuExportHKCB: TCheckBox;
    TrennzeichenCB: TComboBox;
    TrennzeichenLab: TLabel;
    KFZGruppenTS: TTabSheet;
    DBGrid5: TOFDBGrid;
    KFZGrDS: TDataSource;
    UseBrowserCB: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ShopSaveBtnClick(Sender: TObject);
    procedure MerkmalTabBeforeDelete(DataSet: TDataSet);
    procedure ArtGrDSDataChange(Sender: TObject; Field: TField);
    procedure NoTopWgrBtnClick(Sender: TObject);
    procedure MWST0_EDITExit(Sender: TObject);
    procedure PreisCalcBtnClick(Sender: TObject);
    procedure LandEdiChange(Sender: TObject);
    procedure BelegLBClick(Sender: TObject);
    procedure PC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure FibuErloesKtoTabBeforePost(DataSet: TDataSet);
    procedure FibuAufwKtoTabBeforePost(DataSet: TDataSet);
    procedure FibuModeGBClick(Sender: TObject);
    procedure LiefArtDSDataChange(Sender: TObject; Field: TField);
    procedure ExportSetupBtnClick(Sender: TObject);
    procedure FibuTypCBChange(Sender: TObject);
  private
    { Private-Deklarationen }
    First: Boolean;
    LastBelegID: Integer;
  public
    { Public-Deklarationen }
  end;


implementation

uses
  GNUGetText,
  OF_Var_Const, OF_Function, OF_DM, OF_LiefExport_Dlg, OF_Progress, OF_Tool1;

  //FileCtrl,

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TSetupForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent (self);
  except
  end;

  First := True;
  NumDS.Dataset       := nil;
  ZahlArtDS.Dataset   := nil;
  LiefArtDS.Dataset   := nil;
  KunGrDS.Dataset     := nil;
  ArtGrDS.Dataset     := nil;
  FirKontenDS.Dataset := nil;
  KFZGrDS.Dataset     := nil;
  Nav1.DataSource     := nil;

  ShopSaveBtn.Left    := 3;
  LastBelegID         := -1;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;

  if DM1.USE_KFZ then 
  begin
    KFZGruppenTS.TabVisible := true;
  end else 
  begin
    KFZGruppenTS.TabVisible := false;
  end;

  Tabsheet1.TabVisible := False;
  Tabsheet2.TabVisible := False;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.PC1Change(Sender: TObject);
var 
  i: Integer; S: String;
begin
  ExportSetupBtn.Visible    := False;

  MerkmalTab.Close;

  NumGrid.RowColor1         := DM1.C2Color;
  DBGrid1.RowColor1         := DM1.C2Color;
  DBGrid2.RowColor1         := DM1.C2Color;
  DBGrid3.RowColor1         := DM1.C2Color;
  DBGrid4.RowColor1         := DM1.C2Color;
  DBGrid5.RowColor1         := DM1.C2Color;
  AddrMerkmalGrid.RowColor1 := DM1.C2Color;
  ErloesGrGrid.RowColor1    := DM1.C2Color;
  AufwGrGrid.RowColor1      := DM1.C2Color;
  FirKtoGrid.RowColor1      := DM1.C2Color;

  NumGrid.EditColor         := DM1.EditColor;
  DBGrid1.EditColor         := DM1.EditColor;
  DBGrid2.EditColor         := DM1.EditColor;
  DBGrid3.EditColor         := DM1.EditColor;
  DBGrid4.EditColor         := DM1.EditColor;
  DBGrid5.EditColor         := DM1.EditColor;
  AddrmerkmalGrid.EditColor := DM1.EditColor;
  ErloesGrGrid.EditColor    := DM1.EditColor;
  AufwGrGrid.EditColor      := DM1.EditColor;

  PreisCalcBtn.Visible := False;

  Case PC1.ActivePage.Tag of
  1: begin Nav1.DataSource := NumDS;        end;
  2: begin Nav1.DataSource := ZahlArtDS;    end;
  3: begin Nav1.DataSource := LiefArtDS;    end;
  4: begin Nav1.DataSource := KunGrDS;      end;
  5: begin Nav1.DataSource := ArtGrDS;      end;
  6: begin Nav1.Datasource := FirKontenDS;  end;
  7, 8: begin Nav1.Datasource := DM1.FirmaDS;
         DM1.FirmaTab.Open;              end;
  11: begin Nav1.Datasource := MerkmalDS;    end;
  12: begin Nav1.Datasource := MerkmalDS;    end;
  15: begin Nav1.Datasource := FibuErloesKtoDS; end;
  16: begin Nav1.Datasource := FibuAufwKtoDS; end;
  18: begin Nav1.Datasource := KFZGrDS;      end;
  end;

  ShopSaveBtn.Visible := PC1.ActivePage.Tag in [10, 11, 12, 13, 14, 17];

  Nav1.Visible := PC1.ActivePage.Tag in [1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 15, 16, 18];

  if (PC1.ActivePage.Tag in [7, 8]) then 
    Nav1.VisibleButtons := [nbEdit, nbPost, nbCancel, nbRefresh]
  else
  if (PC1.ActivePage.Tag in [4, 5, 6, 15, 16, 18]) then
  begin
    Nav1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit,
    nbPost, nbCancel, nbRefresh, nbInsert];
    if not DM1.FirBankTab.Active then 
      DM1.FirBankTab.Open;
  end else
  if (PC1.ActivePage.Tag in [11, 12]) then
  begin
    Nav1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit,
        nbPost, nbCancel, nbRefresh, nbInsert, nbDelete];
    if not DM1.FirBankTab.Active then 
      DM1.FirBankTab.Open;
  end else 
    Nav1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
        nbEdit, nbPost, nbCancel, nbRefresh];


  if PC1.ActivePage.Tag = 3 then // Lieferarten
  begin
    ExportSetupBtn.Left := NavPan.Width - ExportSetupBtn.Width - 5;
    ExportSetupBtn.Visible := DM1.LiefArtTab.FieldByName('LIEF_ID').AsInteger in [1, 3, 4, 5, 6];
  end else
  if PC1.ActivePage.Tag = 5 then //Warengruppen
  begin
    WgrDefSteuer.Items.Clear;
    WgrDefSteuer.Items.Add ('keine');
    WgrDefSteuer.Items.Add ('1=' + FormatFloat('0.0"%"', DM1.MwstTab[1]));
    WgrDefSteuer.Items.Add ('2=' + FormatFloat('0.0"%"', DM1.MwstTab[2]));
    WgrDefSteuer.Items.Add ('3=' + FormatFloat('0.0"%"', DM1.MwstTab[3]));

          // Glob. Kalulationsfaktoren laden
          {
          for i:=1 to 5 do
          begin
          GlobCalcTab[i] :=DM1.ReadDouble ('MAIN\ARTIKEL','VK'+IntToStr(I)+
          '_CALC_FAKTOR',0);
          end;
          }
    DM1.WgrTab.First;
    PreisCalcBtn.Visible := True;
  end else
  if PC1.ActivePage.Tag = 10 then //Allgemein
  begin
    LeitwaehrungEdit.Text  := DM1.ReadString  ('MAIN', 'LEITWAEHRUNG', '€');
    MWST0_EDIT.Value       := DM1.ReadDouble  ('MAIN\MWST', '0', 0);
    MWST1_EDIT.Value       := DM1.ReadDouble  ('MAIN\MWST', '1', 16);
    MWST2_EDIT.Value       := DM1.ReadDouble  ('MAIN\MWST', '2', 7);
    MWST3_EDIT.Value       := DM1.ReadDouble  ('MAIN\MWST', '3', 0);
    UseKFZCB.Checked       := DM1.ReadBoolean ('MAIN', 'USE_KFZ', False);
    UseBrowserCB.Checked   := DM1.ReadBoolean ('MAIN', 'USE_BROWSER', False);
  
    Edit1.Text             := DM1.ReadString  ('MAIN\REPORT', 'ZAHLUNGSZIEL_SOFORT_TEXT', 'Sofort');
  
    vk1_calc.Value         := DM1.GCalcFaktorTab[1];
    vk2_calc.Value         := DM1.GCalcFaktorTab[2];
    vk3_calc.Value         := DM1.GCalcFaktorTab[3];
    vk4_calc.Value         := DM1.GCalcFaktorTab[4];
    vk5_calc.Value         := DM1.GCalcFaktorTab[5];
    svk_calc.Value         := DM1.GCalcFaktorTab[6];
  
    DefMwStCB.Items.Clear;
    DefMwStCB.Items.Add ('keine');
    DefMwStCB.Items.Add ('1=' + FormatFloat('0.0"%"', DM1.MwstTab[1]));
    DefMwStCB.Items.Add ('2=' + FormatFloat('0.0"%"', DM1.MwstTab[2]));
    DefMwStCB.Items.Add ('3=' + FormatFloat('0.0"%"', DM1.MwstTab[3]));
  
    DefMwStCB.ItemIndex := DM1.ReadInteger ('MAIN\MWST', 'DEFAULT', 2);
  
    if not DM1.LandTab.Active then DM1.LandTab.Open;
    LandEdi.Text := DM1.LandK2;
    LandEdiChange(Sender);
  end else
  if PC1.ActivePage.Tag = 11 then //Adressen
  begin
    MerkmalTab.Sql.Text := 'select * from ADRESSEN_MERK ' +
    'order by MERKMAL_ID ASC';
    MerkmalTab.Open;

    AddrMerkmalGrid.Parent := AddrMerkmalGB;

    AddrUserFeld1.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD01', 'Feld 01:');
    AddrUserFeld2.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD02', 'Feld 02:');
    AddrUserFeld3.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD03', 'Feld 03:');
    AddrUserFeld4.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD04', 'Feld 04:');
    AddrUserFeld5.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD05', 'Feld 05:');
    AddrUserFeld6.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD06', 'Feld 06:');
    AddrUserFeld7.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD07', 'Feld 07:');
    AddrUserFeld8.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD08', 'Feld 08:');
    AddrUserFeld9.Text  := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD09', 'Feld 09:');
    AddrUserFeld10.Text := DM1.ReadString ('MAIN\ADRESSEN\USERFELDER', 'FELD10', 'Feld 10:');

    ADUF1.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD01_AKTIV', False);
    ADUF2.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD02_AKTIV', False);
    ADUF3.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD03_AKTIV', False);
    ADUF4.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD04_AKTIV', False);
    ADUF5.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD05_AKTIV', False);
    ADUF6.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD06_AKTIV', False);
    ADUF7.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD07_AKTIV', False);
    ADUF8.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD08_AKTIV', False);
    ADUF9.Checked       := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD09_AKTIV', False);
    ADUF10.Checked      := DM1.ReadBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD10_AKTIV', False);

    Kunnum1Edi_CB.Checked  := DM1.ReadBoolean ('MAIN\ADRESSEN', 'KUNNUM1_EDI', False);
  end else
  if PC1.ActivePage.Tag = 12 then //Artikel
  begin
    MerkmalTab.Sql.Text := 'select * from ARTIKEL_MERK ' +
    'order by MERKMAL_ID ASC';
    MerkmalTab.Open;

    AddrMerkmalGrid.Parent := ArtMerkmalGB;

    I := DM1.ReadInteger('MAIN\ARTIKEL', 'ANZPREIS', 5);
    if i < 2 then 
		  i := 2 
		else 
		if i > 5 then 
		  i := 5;
    AnzPreisCB.ItemIndex := i - 2;

    ArtnumAutoCB.Checked  := DM1.ReadBoolean ('MAIN\ARTIKEL', 'ARTNUM_AUTO', False);
    BRRundWert.Value      := DM1.ReadInteger ('MAIN\ARTIKEL', 'BRUTTO_RUNDUNG_WERT', 1) / 100;
    BN_CalcSchranke.Value := DM1.ReadDouble ('MAIN\ARTIKEL', 'BN_CALC_SCHRANKE', 0.01);

    ArtUserFeld1.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD01', 'Feld 01:');
    ArtUserFeld2.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD02', 'Feld 02:');
    ArtUserFeld3.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD03', 'Feld 03:');
    ArtUserFeld4.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD04', 'Feld 04:');
    ArtUserFeld5.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD05', 'Feld 05:');
    ArtUserFeld6.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD06', 'Feld 06:');
    ArtUserFeld7.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD07', 'Feld 07:');
    ArtUserFeld8.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD08', 'Feld 08:');
    ArtUserFeld9.Text  := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD09', 'Feld 09:');
    ArtUserFeld10.Text := DM1.ReadString ('MAIN\ARTIKEL\USERFELDER', 'FELD10', 'Feld 10:');

    ARUF1.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD01_AKTIV', False);
    ARUF2.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD02_AKTIV', False);
    ARUF3.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD03_AKTIV', False);
    ARUF4.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD04_AKTIV', False);
    ARUF5.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD05_AKTIV', False);
    ARUF6.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD06_AKTIV', False);
    ARUF7.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD07_AKTIV', False);
    ARUF8.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD08_AKTIV', False);
    ARUF9.Checked       := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD09_AKTIV', False);
    ARUF10.Checked      := DM1.ReadBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD10_AKTIV', False);
  end else
  if PC1.ActivePage.Tag = 13 then //EMail
  begin
    BelegLB.ItemIndex := 0;
    BelegLBClick (Sender);
  end else
  if PC1.ActivePage.Tag = 14 then //Pfade
  begin
    BackupDirEdi.Text := DM1.ReadString ('MAIN\PFADE', 'BACKUP_DIR', APP_PATH + 'Backup\');
    TempDirEdi.Text   := DM1.ReadString ('MAIN\PFADE', 'TMP_DIR', APP_PATH + 'Tmp\');
    DTADirEdi.Text    := DM1.ReadString ('MAIN\PFADE', 'DTA_DIR', APP_PATH + 'DTA\');
    ExportDirEdi.Text := DM1.ReadString ('MAIN\PFADE', 'EXPORT_DIR', APP_PATH + 'EXPORT\');
    ImportDirEdi.Text := DM1.ReadString ('MAIN\PFADE', 'IMPORT_DIR', APP_PATH + 'IMPORT\');
  end else
  if PC1.ActivePage.Tag = 17 then //Fibu
  begin
    FibuModeGB.ItemIndex := DM1.ReadInteger ('MAIN\FIBU', 'FIBU_GUV', 0);
    AufwKtoIN.Value      := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_IN', 3400);
    AufwKtoEU.Value      := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_EU', 3400);
    AufwKtoAU.Value      := DM1.ReadInteger ('MAIN\FIBU', 'DEF_AKTO_AU', 3400);

    ErloesKtoIN.Value    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_IN', 8400);
    ErloesKtoEU.Value    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_EU', 8400);
    ErloesKtoAU.Value    := DM1.ReadInteger ('MAIN\FIBU', 'DEF_EKTO_AU', 8400);

    KasseKto.Value       := DM1.ReadInteger ('MAIN\FIBU', 'KASSE_KTO'  , 1000);
    ScheckKto.Value      := DM1.ReadInteger ('MAIN\FIBU', 'SCHECK_KTO' , 1330);
    BankKto.Value        := DM1.ReadInteger ('MAIN\FIBU', 'BANK_KTO'   , 1200);

    FordLLKto.Value      := DM1.ReadInteger ('MAIN\FIBU', 'FORD_LL_KTO', 1400);
    VerbLLKto.Value      := DM1.ReadInteger ('MAIN\FIBU', 'VERB_LL_KTO', 1600);

    FibuTypCB.ItemIndex  := DM1.ReadInteger ('MAIN\FIBU', 'TYP', 0);
    FibuDosCB.Checked    := DM1.ReadBoolean ('MAIN\FIBU', 'DOS', False);

    FibuExportHKCB.Checked := DM1.ReadBoolean ('MAIN\FIBU', 'TEXT_IN_HOCHKOMMAS', False);
    FibuExportFNCB.Checked := DM1.ReadBoolean ('MAIN\FIBU', 'INCL_FELDNAMEN'    , True);
    S                      := DM1.ReadString  ('MAIN\FIBU', 'TRENNZEICHEN'      , #9);

    if S = #9 then S := 'TAB';
    TrennzeichenCB.ItemIndex := TrennzeichenCB.Items.IndexOf(S);

    FibuModeGBClick(Self);
    FibuTypCBChange(Self);
  end;

  //Fibu Eröskonten
  FibuErloesKtoTab.Active := PC1.ActivePage.Tag = 15;

  //Fibu Eröskonten
  FibuAufwKtoTab.Active := PC1.ActivePage.Tag = 16;

  if Nav1.Visible and ShopSavebtn.Visible then 
    ShopSaveBtn.Left := Nav1.Left + Nav1.Width + 3
  else 
    ShopSaveBtn.Left := Nav1.Left;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FormShow(Sender: TObject);
begin
  LastBelegID := -1;
  DM1.NummerTab.Close;
  DM1.NummerTab.Sql.Text := 'select VAL_INT as QUELLE, VAL_CHAR as FORMAT, ' +
    'VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, ' +
    'MAINKEY, NAME from REGISTRY' +
    ' where MAINKEY="MAIN\\NUMBERS"' +
    ' order by Quelle';

  DM1.NummerTab.Open;

  NumDS.Dataset       := DM1.NummerTab;          DM1.NummerTab.Open;
  ZahlArtDS.Dataset   := DM1.ZahlartTab;         DM1.ZahlartTab.Open;
  LiefArtDS.Dataset   := DM1.LiefArtTab;         DM1.LiefArtTab.Open;
  KunGrDS.Dataset     := DM1.KGRTab;             DM1.KGRTab.Open;
  ArtGrDS.Dataset     := DM1.WgrTab;             DM1.WgrTab.Open;
  KFZGrDS.Dataset     := DM1.KFZGRTab;           DM1.KFZGRTab.Open;
  FirKontenDS.Dataset := DM1.FirBankTab;         DM1.FirBankTab.Open;

  PC1.ActivePage := AllgTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  MerkmalTab.Close;

  NumDS.Dataset       := nil;
  ZahlArtDS.Dataset   := nil;
  LiefArtDS.Dataset   := nil;
  KunGrDS.Dataset     := nil;
  ArtGrDS.Dataset     := nil;
  FirKontenDS.Dataset := nil;
  KFZGrDS.Dataset     := nil;
  Nav1.DataSource     := nil;
  if dm1.FirBankTab.active then dm1.FirBankTab.close;
  if dm1.FirmaTab.active then dm1.FirmaTab.close;
  WgrLoTab.Close;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.ShopSaveBtnClick(Sender: TObject);
var 
  i: integer; 
  s: String;
begin
  if PC1.ActivePage.Tag = 10 then // Allgemein
  begin
    DM1.WriteString  ('MAIN', 'LEITWAEHRUNG', LeitwaehrungEdit.Text);
    DM1.WriteDouble  ('MAIN\MWST', '0', MWST0_EDIT.Value);
    DM1.WriteDouble  ('MAIN\MWST', '1', MWST1_EDIT.Value);
    DM1.WriteDouble  ('MAIN\MWST', '2', MWST2_EDIT.Value);
    DM1.WriteDouble  ('MAIN\MWST', '3', MWST3_EDIT.Value);
    DM1.WriteBoolean ('MAIN', 'USE_BROWSER', UseBrowserCB.Checked);
    //DM1.USE_BROWSER := UseBrowserCB.Checked;  //16.10.09-ud.
    DM1.WriteBoolean ('MAIN', 'USE_KFZ', UseKfzCB.Checked);
    DM1.USE_KFZ := UseKFZCB.Checked;

    DM1.WriteInteger ('MAIN\MWST', 'DEFAULT', DefMwStCB.ItemIndex);

    DM1.MwStTab[0] := MWST0_EDIT.Value;
    DM1.MwStTab[1] := MWST1_EDIT.Value;
    DM1.MwStTab[2] := MWST2_EDIT.Value;
    DM1.MwStTab[3] := MWST3_EDIT.Value;

    DM1.Leitwaehrung := LeitwaehrungEdit.Text;

    I := DefMwStCB.ItemIndex;  if (I<0)or(I>3) then I := 2;
    DM1.DefMwSt := DM1.MWSTTab[I];
    DM1.DefMwStCD := I;

    DM1.WgrFaktorCache.Wgr := -1; // Cache ungültig machen

    DM1.WriteString  ('MAIN\REPORT', 'ZAHLUNGSZIEL_SOFORT_TEXT', Edit1.Text);

    DM1.GCalcFaktorTab[1] := vk1_calc.Value;
    DM1.GCalcFaktorTab[2] := vk2_calc.Value;
    DM1.GCalcFaktorTab[3] := vk3_calc.Value;
    DM1.GCalcFaktorTab[4] := vk4_calc.Value;
    DM1.GCalcFaktorTab[5] := vk5_calc.Value;
    DM1.GCalcFaktorTab[6] := svk_calc.Value;

    DM1.WriteDouble ('MAIN\ARTIKEL', 'VK1_CALC_FAKTOR', vk1_calc.Value);
    DM1.WriteDouble ('MAIN\ARTIKEL', 'VK2_CALC_FAKTOR', vk2_calc.Value);
    DM1.WriteDouble ('MAIN\ARTIKEL', 'VK3_CALC_FAKTOR', vk3_calc.Value);
    DM1.WriteDouble ('MAIN\ARTIKEL', 'VK4_CALC_FAKTOR', vk4_calc.Value);
    DM1.WriteDouble ('MAIN\ARTIKEL', 'VK5_CALC_FAKTOR', vk5_calc.Value);
    DM1.WriteDouble ('MAIN\ARTIKEL', 'SHOP_CALC_FAKTOR', svk_calc.Value);

    DM1.LandK2 := LandEdi.Text;
    DM1.WriteString  ('MAIN', 'LAND', LandEdi.Text);
  end else
  if PC1.ActivePage.Tag = 11 then // Adressen
  begin
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD01', AddrUserFeld1.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD02', AddrUserFeld2.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD03', AddrUserFeld3.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD04', AddrUserFeld4.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD05', AddrUserFeld5.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD06', AddrUserFeld6.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD07', AddrUserFeld7.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD08', AddrUserFeld8.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD09', AddrUserFeld9.Text );
    DM1.WriteString ('MAIN\ADRESSEN\USERFELDER', 'FELD10', AddrUserFeld10.Text);

    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD01_AKTIV', ADUF1.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD02_AKTIV', ADUF2.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD03_AKTIV', ADUF3.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD04_AKTIV', ADUF4.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD05_AKTIV', ADUF5.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD06_AKTIV', ADUF6.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD07_AKTIV', ADUF7.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD08_AKTIV', ADUF8.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD09_AKTIV', ADUF9.Checked );
    DM1.WriteBoolean ('MAIN\ADRESSEN\USERFELDER', 'FELD10_AKTIV', ADUF10.Checked);

    DM1.WriteBoolean ('MAIN\ADRESSEN', 'KUNNUM1_EDI', Kunnum1Edi_CB.Checked);
  end else
  if PC1.ActivePage.Tag = 12 then // Artikel
  begin
    DM1.AnzPreis := StrToInt(AnzPreisCB.Text);
    DM1.WriteInteger('MAIN\ARTIKEL', 'ANZPREIS', DM1.AnzPreis);

    DM1.WriteBoolean ('MAIN\ARTIKEL', 'ARTNUM_AUTO', ArtnumAutoCB.Checked);

    i := CAO_Round(BRRundWert.Value * 100); if i<1 then i := 1;
    DM1.BR_RUND_WERT := I;
    DM1.WriteInteger ('MAIN\ARTIKEL', 'BRUTTO_RUNDUNG_WERT', DM1.BR_RUND_WERT);

    DM1.WriteDouble ('MAIN\ARTIKEL', 'BN_CALC_SCHRANKE', BN_CalcSchranke.Value);

    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD01', ArtUserFeld1.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD02', ArtUserFeld2.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD03', ArtUserFeld3.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD04', ArtUserFeld4.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD05', ArtUserFeld5.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD06', ArtUserFeld6.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD07', ArtUserFeld7.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD08', ArtUserFeld8.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD09', ArtUserFeld9.Text );
    DM1.WriteString ('MAIN\ARTIKEL\USERFELDER', 'FELD10', ArtUserFeld10.Text);

    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD01_AKTIV', ARUF1.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD02_AKTIV', ARUF2.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD03_AKTIV', ARUF3.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD04_AKTIV', ARUF4.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD05_AKTIV', ARUF5.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD06_AKTIV', ARUF6.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD07_AKTIV', ARUF7.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD08_AKTIV', ARUF8.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD09_AKTIV', ARUF9.Checked );
    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'FELD10_AKTIV', ARUF10.Checked);

    DM1.WriteBoolean ('MAIN\ARTIKEL\USERFELDER', 'AKTIV', ARUF1.Checked or
    ARUF2.Checked or
    ARUF3.Checked or
    ARUF4.Checked or
    ARUF5.Checked or
    ARUF6.Checked or
    ARUF7.Checked or
    ARUF8.Checked or
    ARUF9.Checked or
    ARUF10.Checked);
  end else
  if PC1.ActivePage.Tag = 13 then //EMail
  begin
    if (LastBelegID > -1) and ((eMailBodyMemo.Modified) or (EMailBetreff.Modified)) then
    begin
      case LastBelegID of
        0: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_AGB_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_AGB_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        1: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_RECH_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_RECH_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        2: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_LIEF_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_LIEF_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        3: begin
          DM1.WriteString     ('MAIN\REPORT', 'EK_BEST_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'EK_BEST_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        4: begin
          DM1.WriteString     ('MAIN\REPORT', 'MAHNUNG_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'MAHNUNG_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        5: begin
          DM1.WriteString     ('MAIN\REPORT', 'TEXTVERARB_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'TEXTVERARB_MAIL_TEXT', eMailBodyMemo.Text);
        end;
      end;
      EMailBetreff.Modified  := False;
      eMailBodyMemo.Modified := False;
    end;
  end else
  if PC1.ActivePage.Tag = 14 then //Pfade
  begin
    // Pfade laden
    DM1.BackupDir := BackupDirEdi.Text;
    DM1.TmpDir    := TempDirEdi.Text;
    DM1.DTADir    := DTADirEdi.Text;
    DM1.ExportDir := ExportDirEdi.Text;
    DM1.ImportDir := ImportDirEdi.Text;

    if (Length(DM1.BackupDir)>0) and (DM1.Backupdir[length(DM1.BackupDir)]<>'\')
    then DM1.BackupDir := DM1.BackupDir + '\';
    if (Length(DM1.TmpDir)>0) and (DM1.TmpDir[length(DM1.TmpDir)]<>'\')
    then DM1.TmpDir := DM1.TmpDir + '\';
    if (Length(DM1.DTADir)>0) and (DM1.DTADir[length(DM1.DTADir)]<>'\')
    then DM1.DTADir := DM1.DTADir + '\';
    if (Length(DM1.ExportDir)>0) and (DM1.ExportDir[length(DM1.ExportDir)]<>'\')
    then DM1.ExportDir := DM1.ExportDir + '\';
    if (Length(DM1.ImportDir)>0) and (DM1.ImportDir[length(DM1.ImportDir)]<>'\')
    then DM1.ImportDir := DM1.ImportDir + '\';

    // wenn Pfad nicht existiert dann anlegen
    try ForceDirectories (DM1.BackupDir); except end;
    try ForceDirectories (DM1.TmpDir);    except end;
    try ForceDirectories (DM1.DTADir);    except end;
    try ForceDirectories (DM1.ExportDir); except end;
    try ForceDirectories (DM1.ImportDir); except end;

    DM1.WriteString ('MAIN\PFADE', 'BACKUP_DIR', DM1.BackupDir);
    DM1.WriteString ('MAIN\PFADE', 'TMP_DIR', DM1.TmpDir   );
    DM1.WriteString ('MAIN\PFADE', 'DTA_DIR', DM1.DTADir   );
    DM1.WriteString ('MAIN\PFADE', 'EXPORT_DIR', DM1.ExportDir);
    DM1.WriteString ('MAIN\PFADE', 'IMPORT_DIR', DM1.ImportDir);
  end else
  if PC1.ActivePage.Tag = 17 then // Fibu
  begin
    S := TrennzeichenCB.Items[TrennzeichenCB.ItemIndex];
    if S = 'TAB' then 
      S := #9;

    DM1.WriteInteger ('MAIN\FIBU', 'FIBU_GUV'   , FibuModeGB.ItemIndex);
    DM1.WriteInteger ('MAIN\FIBU', 'DEF_AKTO_IN', AufwKtoIN.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'DEF_AKTO_EU', AufwKtoEU.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'DEF_AKTO_AU', AufwKtoAU.AsInteger);

    DM1.WriteInteger ('MAIN\FIBU', 'DEF_EKTO_IN', ErloesKtoIN.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'DEF_EKTO_EU', ErloesKtoEU.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'DEF_EKTO_AU', ErloesKtoAU.AsInteger);

    DM1.WriteInteger ('MAIN\FIBU', 'KASSE_KTO'  , KasseKto.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'SCHECK_KTO' , ScheckKto.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'BANK_KTO'   , BankKto.AsInteger);

    DM1.WriteInteger ('MAIN\FIBU', 'FORD_LL_KTO', FordLLKto.AsInteger);
    DM1.WriteInteger ('MAIN\FIBU', 'VERB_LL_KTO', VerbLLKto.AsInteger);

    DM1.WriteInteger ('MAIN\FIBU', 'TYP'        , FibuTypCB.ItemIndex);
    DM1.WriteBoolean ('MAIN\FIBU', 'DOS'        , FibuDosCB.Checked);

    DM1.WriteBoolean ('MAIN\FIBU', 'TEXT_IN_HOCHKOMMAS', FibuExportHKCB.Checked);
    DM1.WriteBoolean ('MAIN\FIBU', 'INCL_FELDNAMEN'    , FibuExportFNCB.Checked);
    DM1.WriteString  ('MAIN\FIBU', 'TRENNZEICHEN'      , S);
  end;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.MerkmalTabBeforeDelete(DataSet: TDataSet);
var 
  Tab : String;
  TabN: String;
  Anz : Integer;
begin
  if PC1.ActivePage = ArtikelTab then
  begin
    Tab := 'ARTIKEL_TO_MERK';
    TabN := _('Artikeln');
  end else
  begin
    Tab  := 'ADRESSEN_TO_MERK';
    TabN := _('Adressen');
  end;

  DM1.Uniquery.Close;
  DM1.Uniquery.Sql.Text := 'select count(*) as ANZ from ' + Tab +
    ' where MERKMAL_ID=' + MerkmalTabMERKMAL_ID.AsString;
  DM1.Uniquery.Open;
  Anz := DM1.Uniquery.FieldByName ('ANZ').AsInteger;
  DM1.Uniquery.Close;

  if Anz > 0 then
  begin
    if MessageDlg (Format(_('Dieses Merkmal wird von %d %s' +
      ' benutzt.' + #13#10 + 'Wollen Sie das Merkmal wirklich' +
      ' löschen ?'), [Anz, TabN]), mtconfirmation, mbyesnocancel, 0) = mryes then
    begin
      DM1.Uniquery.Close;
      DM1.Uniquery.Sql.TEXT := 'delete from ' + Tab + ' where MERKMAL_ID=' +
      MerkmalTabMERKMAL_ID.AsString;
      DM1.Uniquery.ExecSql;
    end
    else Abort;
  end;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.ArtGrDSDataChange(Sender: TObject; Field: TField);
begin
  if (not WgrLoTab.Active) or
     (WgrLoTab.ParamByName ('ID').AsInteger <> DM1.WgrTabID.AsInteger) then
  begin
    WgrLoTab.Close;
    WgrLoTab.ParamByName ('ID').AsInteger := DM1.WgrTabID.AsInteger;
    WgrLoTab.Open;
  end;
  NoTopWgrBtn.Visible := DM1.WgrTabTOP_ID.AsInteger > 0;
  PreisCalcBtn.Enabled := (DM1.WgrTab.RecordCount > 0) and
                          (not (DM1.WgrTab.State in [dsEdit, dsInsert]));
end;                    

//------------------------------------------------------------------------------
procedure TSetupForm.NoTopWgrBtnClick(Sender: TObject);
begin
  if not (DM1.WgrTab.State in [dsEdit, dsInsert]) then 
    DM1.WgrTab.Edit;
  DM1.WgrTabTOP_ID.AsInteger := -1;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.MWST0_EDITExit(Sender: TObject);
var 
  ID: Integer;
begin
  // MwSt für Drow-Down-Box (Default-MwSt) neu setzen

  ID := DefMwStCB.ItemIndex;
  DefMwStCB.Items.Clear;
  DefMwStCB.Items.Add ('keine');
  DefMwStCB.Items.Add ('1=' + FormatFloat('0.0"%"', StrToFloat(MWST1_EDIT.Text)));
  DefMwStCB.Items.Add ('2=' + FormatFloat('0.0"%"', StrToFloat(MWST2_EDIT.Text)));
  DefMwStCB.Items.Add ('3=' + FormatFloat('0.0"%"', StrToFloat(MWST3_EDIT.Text)));
  DefMwStCB.ItemIndex := ID;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.PreisCalcBtnClick(Sender: TObject);
var 
  s: String; 
  V, ST, I: Integer; 
  F: Double; 
  NKF: String;
begin
  NKF := '1';

  for i := 1 to DM1.VK_NACHKOMMA do 
    NKF := NKF + '0';

  S := '';
  for V := 1 to 5 do
  begin
    case V of
      1: F := DM1.WgrTabVK1_FAKTOR.AsFloat;
      2: F := DM1.WgrTabVK2_FAKTOR.AsFloat;
      3: F := DM1.WgrTabVK3_FAKTOR.AsFloat;
      4: F := DM1.WgrTabVK4_FAKTOR.AsFloat;
      5: F := DM1.WgrTabVK5_FAKTOR.AsFloat;
    end;

    if F = 0 then // Kein Kalkualtionsfaktor,
    // jetzt prüfen ob ein glob. Faktor vorliegt
    begin
      if DM1.GCalcFaktorTab[V]>0 then F := DM1.GCalcFaktorTab[V];
    end;

    For ST := 0 to 3 do // für alle Steuersätze durchlaufen
    begin
      if F <> 0 then
      begin
        S := S + 'update ARTIKEL set ' +
          'VK' + Inttostr(V) + ' = round( EK_PREIS * ' +
          sqlFloatToStr(F) +
          ' * ' + NKF + ' ) / ' + NKF + ',' +
          'VK' + Inttostr(V) + 'B = round( VK' + Inttostr(V) + ' * (100+' +
          sqlFloatToStr(DM1.MwstTab[ST]) + ') / ' +
          InttoStr(DM1.BR_RUND_WERT) +
          ' ) * ' + InttoStr(DM1.BR_RUND_WERT) + ' / 100' +
          ' where WARENGRUPPE=' + Inttostr(DM1.WgrTabID.AsInteger) +
          ' and STEUER_CODE=' + IntToStr(ST) + ';'#13#10;
      end;
    end;
  end;

  if Length(S) = 0 then
  begin
    exit;
  end else
  begin
    // SQL zum Setzen des Shop_Change_Flags
    S := S + 'update ARTIKEL set ' +
      'SHOP_CHANGE_FLAG=1' +
      ' where WARENGRUPPE=' + Inttostr(DM1.WgrTabID.AsInteger) +
      ' and SHOP_ID>0;' + #13#10;
  end;

  Dm1.ZBatchSql1.Script.Text := S;
  try
    Dm1.ZBatchSql1.Execute;
  finally
    ProgressForm.Stop;
  end;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.LandEdiChange(Sender: TObject);
begin
  if DM1.LandTab.Locate ('ID', LandEdi.Text, []) then 
    LandLangEdi.Text := DM1.LandTab.FieldByName('NAME').AsString
  else 
    LandLangEdi.Text := '???';
end;

//------------------------------------------------------------------------------
procedure TSetupForm.BelegLBClick(Sender: TObject);
begin
  if (LastBelegID > -1) and
     ((eMailBodyMemo.Modified) or (EMailBetreff.Modified)) then
  begin
    if MessageDlg (_('Der Text wurde verändert,' + #13#10 +
        'wollen Sie die änderungen speichern ?'),
        mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      case LastBelegID of
        0: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_AGB_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_AGB_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        1: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_RECH_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_RECH_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        2: begin
          DM1.WriteString     ('MAIN\REPORT', 'VK_LIEF_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'VK_LIEF_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        3: begin
          DM1.WriteString     ('MAIN\REPORT', 'EK_BEST_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'EK_BEST_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        4: begin
          DM1.WriteString     ('MAIN\REPORT', 'MAHNUNG_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'MAHNUNG_MAIL_TEXT', eMailBodyMemo.Text);
        end;
        5: begin
          DM1.WriteString     ('MAIN\REPORT', 'TEXTVERARB_MAIL_SUBJECT', EMailBetreff.text);
          DM1.WriteLongString ('MAIN\REPORT', 'TEXTVERARB_MAIL_TEXT', eMailBodyMemo.Text);
        end;
      end;
      EMailBetreff.Modified  := False;
      eMailBodyMemo.Modified := False;
    end;
  end;

  if LastBelegID <> BelegLB.ItemIndex then
  begin
    LastBelegID := BelegLB.ItemIndex;

    case BelegLB.ItemIndex of
      0: begin
        EMailBetreff.text  := DM1.ReadString     ('MAIN\REPORT', 'VK_AGB_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'VK_AGB_MAIL_TEXT', '');
      end;
      1: begin
        EMailBetreff.text  := DM1.ReadString  ('MAIN\REPORT', 'VK_RECH_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'VK_RECH_MAIL_TEXT', '');
      end;
      2: begin
        EMailBetreff.text  := DM1.ReadString  ('MAIN\REPORT', 'VK_LIEF_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'VK_LIEF_MAIL_TEXT', '');
      end;
      3: begin
        EMailBetreff.text  := DM1.ReadString  ('MAIN\REPORT', 'EK_BEST_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'EK_BEST_MAIL_TEXT', '');
      end;
      4: begin
        EMailBetreff.text  := DM1.ReadString  ('MAIN\REPORT', 'MAHNUNG_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'MAHNUNG_MAIL_TEXT', '');
      end;
      5: begin
        EMailBetreff.text  := DM1.ReadString  ('MAIN\REPORT', 'TEXTVERARB_MAIL_SUBJECT', '');
        eMailBodyMemo.Text := DM1.ReadLongString ('MAIN\REPORT', 'TEXTVERARB_MAIL_TEXT', '');
      end;
    end;
    eMailBodyMemo.Modified := False;
    EMailBetreff.Modified  := False;
  end;
end;    

//------------------------------------------------------------------------------
procedure TSetupForm.PC1Changing(Sender: TObject;
var 
  AllowChange: Boolean);
begin
  if PC1.ActivePage = EMailTab then 
    BelegLBClick(Self);
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FibuErloesKtoTabBeforePost(DataSet: TDataSet);
begin
  FibuErloesKtoTab.FieldByName ('MAINKEY').AsString := 'MAIN\FIBU\ERLOESGRUPPEN';
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FibuAufwKtoTabBeforePost(DataSet: TDataSet);
begin
  FibuAufwKtoTab.FieldByName ('MAINKEY').AsString := 'MAIN\FIBU\AUFWANDSGRUPPEN';
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FibuModeGBClick(Sender: TObject);
begin
  FordLLLab.Enabled := FibuModeGB.ItemIndex = 1;
  VerbLLLab.Enabled := FibuModeGB.ItemIndex = 1;
  FordLLKto.Enabled := FibuModeGB.ItemIndex = 1;
  VerbLLKto.Enabled := FibuModeGB.ItemIndex = 1;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.LiefArtDSDataChange(Sender: TObject; Field: TField);
begin
  ExportSetupBtn.Left := NavPan.Width - ExportSetupBtn.Width - 5;
  ExportSetupBtn.Visible :=
    DM1.LiefArtTab.FieldByName('LIEF_ID').AsInteger in [1, 3, 4, 5, 6];
end;

//------------------------------------------------------------------------------
procedure TSetupForm.ExportSetupBtnClick(Sender: TObject);
var 
  LiefExportDlg: TLiefExportDlg;
begin
  LiefExportDlg := TLiefExportDlg.Create(Self);
  try
    LiefExportDlg.ShowDlg (DM1.LiefArtTab.FieldByName('LIEF_ID').AsInteger);
  finally
    LiefExportDlg.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TSetupForm.FibuTypCBChange(Sender: TObject);
begin
  if FibuTypCB.ItemIndex = 1 then
  begin
    FibuExportHKCB.Checked   := False;
    FibuExportFNCB.Checked   := False;
    TrennzeichenCB.ItemIndex := -1;
  end;

  FibuExportFNCB.Enabled := FibuTypCB.ItemIndex = 0;
  FibuExportHKCB.Enabled := FibuTypCB.ItemIndex = 0;
  TrennzeichenLab.Enabled := FibuTypCB.ItemIndex = 0;
  TrennzeichenCB.Enabled := FibuTypCB.ItemIndex = 0;
end;

//------------------------------------------------------------------------------

end.

