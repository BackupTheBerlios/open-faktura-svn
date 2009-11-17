{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Druckausgabe Artikel                                              }
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
{ - Hersteller löschen                                                         }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 09.02.2004 - Dialog überarbeitet, da nicht gespeichert wurde, wenn das Name-Feld }
{              nicht verlassen wurde }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_FreePrintArtikel;

interface

{$I OF.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FR_View, FR_Class, FR_Desgn, FR_DSet, FR_DBSet, Db,
  ZQuery, ZMySqlQuery, ZTransact, ZMySqlTr, ZConnect, ZMySqlCon, Grids,
  DBGrids, Buttons, Mask,Clipbrd, JvMaskEdit, JvSpin, JvHtControls,
  FR_Intrp, FR_Pars, JvLookup, Registry, JvComponent, JvBaseDlg, printers,
  CaoSecurity;

type
  TPrintArtikelForm = class(TForm)
    DBDataSet: TfrDBDataSet;
    Designer: TfrDesigner;
    Report1: TfrReport;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ZielCB: TJvHTComboBox;
    BinNamCB: TJvHTComboBox;
    KopienSpin: TJvSpinEdit;
    LayoutBtn: TBitBtn;
    DruEinrBtn: TBitBtn;
    CloseBtn: TBitBtn;
    VorschauBtn: TBitBtn;
    GroupBox1: TGroupBox;
    RButton1: TRadioButton;
    RButton2: TRadioButton;
    Edit1: TEdit;
    Label19: TLabel;
    ReportTab: TZMySqlQuery;
    ReportTabMAINKEY: TStringField;
    ReportTabNAME: TStringField;
    ReportTabVAL_BLOB: TMemoField;
    ReportTabVAL_CHAR: TStringField;
    ReportTabVAL_BIN: TBlobField;
    ReportDS: TDataSource;
    FormularCB: TJvDBLookupCombo;
    PrintBtn: TBitBtn;
    ArtDS: TDataSource;
    ArtStueckListDS: TDataSource;
    ArtHistDS: TDataSource;
    DataSource3: TDataSource;
    RepTab: TZMySqlTable;
    ASQuery: TZCaoMySqlQuery;
    STListTab: TZMySqlQuery;
    STListTabREC_ID: TIntegerField;
    STListTabART_ID: TIntegerField;
    STListTabMENGE: TFloatField;
    STListTabERSTELLT: TDateField;
    STListTabERST_NAME: TStringField;
    STListTabGEAEND: TDateField;
    STListTabGEAEND_NAME: TStringField;
    STListTabARTNUM: TStringField;
    STListTabMATCHCODE: TStringField;
    STListTabBARCODE: TStringField;
    STListTabKURZNAME: TStringField;
    STListTabEK_PREIS: TFloatField;
    STListTabMENGE_AKT: TFloatField;
    STListTabARTIKEL_ART: TStringField;
    JPosTab: TZMySqlQuery;
    JPosTabCalcQuelle: TStringField;
    JPosTabQUELLE: TIntegerField;
    JPosTabRDATUM: TDateField;
    JPosTabLDATUM: TDateField;
    JPosTabVRENUM: TIntegerField;
    JPosTabVLSNUM: TIntegerField;
    JPosTabKUN_NAME1: TStringField;
    JPosTabMENGE: TFloatField;
    JPosTabEPREIS: TFloatField;
    JPosTabEPREIS_STR: TStringField;
    JPosTabRABATT: TFloatField;
    JPosTabGPREIS_STR: TStringField;
    JPosTabWAEHRUNG: TStringField;
    JPosTabMWST_0: TFloatField;
    JPosTabMWST_1: TFloatField;
    JPosTabMWST_2: TFloatField;
    JPosTabMWST_3: TFloatField;
    JPosTabSTEUER_CODE: TIntegerField;
    JPosTabSTEUER_PROZ: TFloatField;
    JPosTabBRUTTO_FLAG: TBooleanField;
    JPosTabJOURNAL_ID: TIntegerField;
    ASQueryREC_ID: TIntegerField;
    ASQueryARTNUM: TStringField;
    ASQueryERSATZ_ARTNUM: TStringField;
    ASQueryMATCHCODE: TStringField;
    ASQueryWARENGRUPPE: TIntegerField;
    ASQueryRABGRP_ID: TStringField;
    ASQueryBARCODE: TStringField;
    ASQueryBARCODE2: TStringField;
    ASQueryBARCODE3: TStringField;
    ASQueryARTIKELTYP: TStringField;
    ASQueryKURZNAME: TStringField;
    ASQueryLANGNAME: TMemoField;
    ASQueryKAS_NAME: TStringField;
    ASQueryINFO: TMemoField;
    ASQueryME_EINHEIT: TStringField;
    ASQueryVPE: TIntegerField;
    ASQueryPR_EINHEIT: TFloatField;
    ASQueryLAENGE: TStringField;
    ASQueryBREITE: TStringField;
    ASQueryHOEHE: TStringField;
    ASQueryGROESSE: TStringField;
    ASQueryDIMENSION: TStringField;
    ASQueryGEWICHT: TFloatField;
    ASQueryINVENTUR_WERT: TFloatField;
    ASQueryEK_PREIS: TFloatField;
    ASQueryVK1: TFloatField;
    ASQueryVK1B: TFloatField;
    ASQueryVK2: TFloatField;
    ASQueryVK2B: TFloatField;
    ASQueryVK3: TFloatField;
    ASQueryVK3B: TFloatField;
    ASQueryVK4: TFloatField;
    ASQueryVK4B: TFloatField;
    ASQueryVK5: TFloatField;
    ASQueryVK5B: TFloatField;
    ASQueryMAXRABATT: TFloatField;
    ASQueryMINGEWINN: TFloatField;
    ASQueryPROVIS_PROZ: TFloatField;
    ASQuerySTEUER_CODE: TIntegerField;
    ASQueryALTTEIL_FLAG: TStringField;
    ASQueryNO_RABATT_FLAG: TStringField;
    ASQueryNO_PROVISION_FLAG: TStringField;
    ASQueryNO_BEZEDIT_FLAG: TStringField;
    ASQueryNO_EK_FLAG: TStringField;
    ASQueryNO_VK_FLAG: TStringField;
    ASQuerySN_FLAG: TStringField;
    ASQueryAUTODEL_FLAG: TStringField;
    ASQueryKOMMISION_FLAG: TStringField;
    ASQueryLIZENZ_FLAG: TStringField;
    ASQueryPRODUKTION_FLAG: TStringField;
    ASQueryPROD_DAUER: TIntegerField;
    ASQueryMENGE_START: TFloatField;
    ASQueryMENGE_AKT: TFloatField;
    ASQueryMENGE_MIN: TFloatField;
    ASQueryMENGE_BESTELLT: TFloatField;
    ASQueryMENGE_BVOR: TFloatField;
    ASQueryMENGE_EKBEST_EDI: TFloatField;
    ASQueryMENGE_VKRE_EDI: TFloatField;
    ASQueryMENGE_EKRE_EDI: TFloatField;
    ASQueryLAST_EK: TFloatField;
    ASQueryLAST_LIEF: TIntegerField;
    ASQueryLAST_LIEFDAT: TDateField;
    ASQueryLAST_VK: TFloatField;
    ASQueryLAST_KUNDE: TIntegerField;
    ASQueryLAST_VKDAT: TDateField;
    ASQueryDEFAULT_LIEF_ID: TIntegerField;
    ASQueryERLOES_KTO: TIntegerField;
    ASQueryAUFW_KTO: TIntegerField;
    ASQueryHERKUNFSLAND: TStringField;
    ASQueryHERSTELLER_ID: TIntegerField;
    ASQueryHERST_ARTNUM: TStringField;
    ASQueryLAGERORT: TStringField;
    ASQueryERSTELLT: TDateField;
    ASQueryERST_NAME: TStringField;
    ASQueryGEAEND: TDateField;
    ASQueryGEAEND_NAME: TStringField;
    ASQuerySHOP_ID: TIntegerField;
    ASQuerySHOP_ARTIKEL_ID: TIntegerField;
    ASQuerySHOP_KURZTEXT: TMemoField;
    ASQuerySHOP_LANGTEXT: TMemoField;
    ASQuerySHOP_IMAGE: TStringField;
    ASQuerySHOP_IMAGE_MED: TStringField;
    ASQuerySHOP_IMAGE_LARGE: TStringField;
    ASQuerySHOP_DATENBLATT: TStringField;
    ASQuerySHOP_KATALOG: TStringField;
    ASQuerySHOP_ZEICHNUNG: TStringField;
    ASQuerySHOP_HANDBUCH: TStringField;
    ASQueryAUSSCHREIBUNGSTEXT: TStringField;
    ASQuerySHOP_PREIS_LISTE: TFloatField;
    ASQuerySHOP_VISIBLE: TIntegerField;
    ASQuerySHOP_DATE_NEU: TDateField;
    ASQuerySHOP_FAELLT_WEG_AB: TDateField;
    ASQuerySHOP_CLICK_COUNT: TIntegerField;
    ASQuerySHOP_SYNC: TIntegerField;
    ASQuerySHOP_ZUB: TIntegerField;
    ASQuerySHOP_CHANGE_DATE: TDateTimeField;
    ASQuerySHOP_CHANGE_FLAG: TIntegerField;
    ASQuerySHOP_DEL_FLAG: TStringField;
    ASQuerySHOP_PASSWORD: TStringField;
    ASQuerySHOP_META_TITEL: TStringField;
    ASQuerySHOP_META_BESCHR: TMemoField;
    ASQuerySHOP_META_KEY: TStringField;
    ASQueryUSERFELD_01: TStringField;
    ASQueryUSERFELD_02: TStringField;
    ASQueryUSERFELD_03: TStringField;
    ASQueryUSERFELD_04: TStringField;
    ASQueryUSERFELD_05: TStringField;
    ASQueryUSERFELD_06: TStringField;
    ASQueryUSERFELD_07: TStringField;
    ASQueryUSERFELD_08: TStringField;
    ASQueryUSERFELD_09: TStringField;
    ASQueryUSERFELD_10: TStringField;
    ASQueryLN: TStringField;
    DBDataSet2: TfrDBDataSet;
    JPosTabARTNUM: TStringField;
    JPosTabARTIKEL_ID: TIntegerField;
    JPosTabBEZEICHNUNG: TMemoField;
    procedure LayoutBtnClick(Sender: TObject);
    procedure VorschauBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure DruEinrBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZielCBClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure RButton2Click(Sender: TObject);
    procedure RButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BinNamCBClick(Sender: TObject);
    procedure ReportTabBeforeOpen(DataSet: TDataSet);
    procedure ReportTabBeforePost(DataSet: TDataSet);
    procedure JPosTabCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    MainKey : string;
    jour_mwst_tab : array[0..3] of double;
    procedure Dialog_einstellen;
    function DB_Spalte_ermitteln : Integer;
    
  public
    { Public-Deklarationen }
    procedure ShowArtikelListDlg;
    procedure ShowArtStuecklistDlg;
    procedure ShowArtHistorieDlg;
  end;

var
  PrintArtikelForm : TPrintArtikelForm;



implementation

uses CAO_DM, CAO_MAIN, cao_var_const, CAO_Link, cao_tool1, CAO_ARTIKEL1;
{$R *.DFM}

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.ShowArtikelListDlg;
var Res : Boolean; i:integer;
begin
     MainKey             := 'MAIN\FREEREPORT\ARTIKEL';
     Caption             := 'Artikelliste drucken';
     Report1.Title       := 'CAO-Faktura Artikelliste';

     ArtDS.DataSet := ASQuery;
     DbDataset.DataSource := ArtDS;//für Report

     ASQuery.Database := DM1.db1;
     ASQuery.Open;

   try
      ReportTab.Close;
      ReportTab.Open;

      Res :=FormularCB.Locate (ReportTabVal_Char,'DEFAULT',True);
       if not Res then
       begin
         ReportTab.First;
         FormularCB.DisplayValue :=ReportTabName.Value;
       end
         else
       begin
         FormularCB.DisplayValue :=ReportTabName.Value;
       end;

      Dialog_einstellen;
      DM1.FirmaTab.Open;
      ShowModal;
     finally
       ASQuery.Close;

       ArtDS.DataSet :=nil;
       ASQuery.Database := nil;
     end;
     ReportTab.Close;
     DM1.FirmaTab.Close;
end;

//-------------------------------------------------------------------------------

procedure TPrintArtikelForm.ShowArtStuecklistDlg;
var Res : Boolean; i:integer;
begin
     MainKey          := 'MAIN\FREEREPORT\ARTIKEL_STUECKLISTE';
     Caption          := 'Artikel-Stückliste drucken';
     Report1.Title    := 'CAO-Faktura Artikel-Stückliste';

     ArtDS.DataSet           := ASQuery;
     ArtStueckListDS.Dataset := STListTab;
     DbDataset.DataSource    := ArtDS;//für Report

     ASQuery.Open;
   try
       ReportTab.Close;
       ReportTab.Open;

       Res :=FormularCB.Locate (ReportTabVal_Char,'DEFAULT',True);
       if not Res then
       begin
           ReportTab.First;
           FormularCB.DisplayValue :=ReportTabName.Value;
       end
         else
       begin
            FormularCB.DisplayValue :=ReportTabName.Value;
       end;


     Dialog_einstellen;

     DM1.FirmaTab.Open;

     ShowModal;

     finally
       ASQuery.Close;

       ArtDS.DataSet           :=nil;
       ArtStueckListDS.Dataset :=nil;
       DbDataset.DataSource    := nil;
     end;

     ReportTab.Close;
     DM1.FirmaTab.Close;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.ShowArtHistorieDlg;
var Res : Boolean; i:integer;
begin
     MainKey             :='MAIN\FREEREPORT\ARTIKEL_HISTORIE';
     Caption             :='Artikel-Historie drucken';
     Report1.Title       :='CAO-Faktura Artikel-Historie';

     ArtDS.DataSet         := ASQuery;
     ArtHistDS.Dataset     := JPosTab;
     DbDataset.DataSource  := ArtDS;//für Report
     DbDataset2.DataSource := ArtHistDS;

     ASQuery.Open;
     JPosTab.Open;

   try
       ReportTab.Close;
       ReportTab.Open;

       Res := FormularCB.Locate (ReportTabVal_Char,'DEFAULT',True);
       if not Res then
       begin
           ReportTab.First;
           FormularCB.DisplayValue :=ReportTabName.Value;
       end
         else
       begin
            FormularCB.DisplayValue :=ReportTabName.Value;
       end;

     Dialog_einstellen;

     DM1.FirmaTab.Open;

     ShowModal;

     finally
       ASQuery.Close;
       JPosTab.Close;
       
       ArtDS.DataSet         := nil;
       ArtHistDS.Dataset     := nil;
       DbDataset.DataSource  := nil;

       ArtikelForm.ASQuery.EnableControls;
       ArtikelForm.JPosTab.EnableControls;
     end;

     ReportTab.Close;
     DM1.FirmaTab.Close;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.Dialog_einstellen;
Var  Search : TSearchRec;
begin
     ReportTab.close;
     ReportTab.Open;

   if ReportTabName.Value > '' then
     begin
       FormularCB.DisplayValue := ReportTabName.Value;
       VorschauBtn.Enabled  := True;
       PrintBtn.Enabled     := True;
       LayoutBtn.Enabled    := True;
     end
     else
     begin
       VorschauBtn.Enabled  := False;
       PrintBtn.Enabled     := False;
       LayoutBtn.Enabled    := False;
     end;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.LayoutBtnClick(Sender: TObject);

begin
if FormularCB.Text > '' then
  begin
    RepTab.Open;
    Report1.LoadFromDB(RepTab,MainKey,FormularCB.Text,DB_Spalte_ermitteln);

    Report1.DesignReport;
    RepTab.close;
  end;
end;

//-----------------------------------------------------------------

procedure TPrintArtikelForm.VorschauBtnClick(Sender: TObject);
begin
     RepTab.Open;
     Report1.LoadFromDB(RepTab,MainKey,FormularCB.DisplayValue,DB_Spalte_ermitteln);
     RepTab.Close;
     Report1.ShowReport;
end;

//-------------------------------------------------------------

procedure TPrintArtikelForm.FormShow(Sender: TObject);
begin
  Printer.PrinterIndex := -1;
  ZielCB.Items.Assign(Printer.Printers);
  ZielCB.ItemIndex := Printer.PrinterIndex;

//  BinNamCB.Items.Assign(Printer.PaperSources);
 // BinNamCB.ItemIndex := Printer.PaperSourceIndex;  //aktueller Schacht

  RButton1.Checked := true;
  PrintBtn.SetFocus;
  if not RepTab.Active then RepTab.Open;
end;

//----------------------------------------------------------

procedure TPrintArtikelForm.CloseBtnClick(Sender: TObject);
begin
  close
end;

//--------------------------------------------------------

procedure TPrintArtikelForm.PrintBtnClick(Sender: TObject);
Var RepPrint : Boolean;
begin
   RepTab.Open;
   Report1.LoadFromDB(RepTab,MainKey,FormularCB.Text,DB_Spalte_ermitteln);
   ReportTab.close;

   Printer.PrinterIndex := ZielCB.ItemIndex;//welcher Drucker
   //BinNamCB.ItemIndex := Printer.PaperSourceIndex;//welcher Schacht
   RepPrint := Report1.PrepareReport;
   Report1.PrintPreparedReport(Edit1.Text,KopienSpin.AsInteger);
end;

//----------------------------------------------------------------------------

procedure TPrintArtikelForm.DruEinrBtnClick(Sender: TObject);
begin
 MainForm.PrinterSetupDialog1.Execute;
 ZielCB.ItemIndex := Printer.PrinterIndex;

 //////////////////////////////////////////////////////////////
//auf veränderung nach einrichtdialog reagieren
/////////////////////////////////////////////////
  //BinNamCB.Items.Assign(Printer.PaperSources);
  //BinNamCB.ItemIndex := Printer.PaperSourceIndex;
end;

//----------------------------------------------------------------------------


function TPrintArtikelForm.DB_Spalte_ermitteln : Integer;
Var a : Integer;
begin
     if not RepTab.Active then RepTab.Open;
     for a := 0 to RepTab.FieldCount-1 do
     if RepTab.Fields[a].FieldName = 'VAL_BLOB' then break;
     Result := a;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.FormCreate(Sender: TObject);
begin
     ClientHeight := 210;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.ZielCBClick(Sender: TObject);
begin
  Printer.PrinterIndex:=ZielCB.ItemIndex;
//  BinNamCB.Items.Assign(Printer.PaperSources);
 // BinNamCB.ItemIndex := Printer.PaperSourceIndex;  //aktueller Schacht
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.Edit1Click(Sender: TObject);
begin
  RButton2.checked := true;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.RButton2Click(Sender: TObject);
begin
  Edit1.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.RButton1Click(Sender: TObject);
begin
  Edit1.Text := '';
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key in ['0'..'9','-',',',#8,#46] then key := key
 else key := chr(0);
end;

//------------------------------------------------------------------------------


procedure TPrintArtikelForm.BinNamCBClick(Sender: TObject);
begin
// Printer.PaperSourceIndex := BinNamCB.ItemIndex;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.ReportTabBeforeOpen(DataSet: TDataSet);
begin
 ReportTab.ParamByName('KEY').Value := MainKey;
end;

//------------------------------------------------------------------------------

procedure TPrintArtikelForm.ReportTabBeforePost(DataSet: TDataSet);
begin
  ReportTabMAINKEY.AsString :=MainKey;
end;

procedure TPrintArtikelForm.JPosTabCalcFields(DataSet: TDataSet);
var sum, ep : double; w : string;
begin
     case JPosTabquelle.Value of
           1 : JPosTabCalcQuelle.Value :='Angebot';
           2 : JPosTabCalcQuelle.Value :='Lieferschein';
           3 : JPosTabCalcQuelle.Value :='Verkauf';
           5 : JPosTabCalcQuelle.Value :='Einkauf';
           6 : JPosTabCalcQuelle.Value :='EK-BEST';
          13 : JPosTabCalcQuelle.Value :='VK-EDI';
          15 : JPosTabCalcQuelle.Value :='EK-EDI';
          16 : JPosTabCalcQuelle.Value :='EK-BEST-EDI';

          else  JPosTabCalcQuelle.Value :='???';
     end;

     Sum :=JPosTabMenge.Value * JPosTabEPreis.Value;
     sum :=trunc((sum - (sum / 100 * JPosTabRabatt.Value)) *100) / 100;

     w :=JPosTabWaehrung.Value;

     jour_mwst_tab[0] :=JPosTabMwst_0.Value;
     jour_mwst_tab[1] :=JPosTabMwst_1.Value;
     jour_mwst_tab[2] :=JPosTabMwst_2.Value;
     jour_mwst_tab[3] :=JPosTabMwst_3.Value;

     if (JPosTabSteuer_Code.Value>=0) and
        (JPosTabSteuer_Code.Value<=3)
      then JPosTabSteuer_Proz.Value :=Jour_MwSt_Tab[JPosTabSteuer_Code.Value]
      else JPosTabSteuer_Proz.Value :=0;

     EP :=JPosTabEPreis.Value;
     if JPosTabBRUTTO_FLAG.AsBoolean then
     begin
        EP :=CAO_round(EP*100)/100;  // Auf ganze Pfennige Runden
        EP :=EP-CAO_round(EP /
                          (100 + JPosTabSteuer_Proz.Value) *
                          JPosTabSteuer_Proz.Value * 100
                         )/100; // Auf ganze Pfennige Runden

        SUM :=CAO_round(SUM*100)/100;  // Auf ganze Pfennige Runden
        SUM :=SUM-CAO_round(SUM /
                          (100 + JPosTabSteuer_Proz.Value) *
                          JPosTabSteuer_Proz.Value * 100
                         )/100; // Auf ganze Pfennige Runden

     end;

     JPosTabEPreis_Str.Value :=FormatFloat (',###,##0.00 "'+w+'"',EP);
     JPosTabGPreis_Str.Value :=FormatFloat (',###,##0.00 "'+w+'"',sum);

end;

end.





