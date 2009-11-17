{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Zahlungseingang u. -ausgang                                }
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
{ 06.05.2003 - zum GNU-Source hinzugefügt }
{            - EuroDMEdit - entfernt }
{ 27.02.2005 - ausgewählte Bank wird bei erneutem Aufruf wieder vorgeschlagen  }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_ZahlungsEingangDlg;

interface

{$I OF.INC}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, JvExControls, JvComponent, JvDBLookup, JvToolEdit,
  JvDBControls, StdCtrls, Buttons, Mask, JvExMask, JvSpin, OFGroupBox,
  ExtCtrls;
{
uses
  JvCurrEdit, JvDBCtrl, JvLookup,
  JvEdit, JvMaskEdit,
}

type
  TZEForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    KunDatGB: TOFGroupBox;
    InfoGB: TOFGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    JoDS: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    CaoGroupBox1: TOFGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SkontoProz: TJvSpinEdit;
    RBetrag: TLabel;
    SKBetrag: TLabel;
    IST_BETRAG: TDBEdit;
    SkontoCB: TCheckBox;
    DiffLab: TLabel;
    DiffBetrag: TLabel;
    BuchenBtn: TBitBtn;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    DBDateEdit1: TJvDBDateEdit;
    Label12: TLabel;
    ZahlartCB: TJvDBLookupCombo;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    SkontoDatLab: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    NettoDatLab: TLabel;
    FaelligTage: TLabel;
    Label17: TLabel;
    SkontoBetLab: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    AnzahlungLab: TLabel;
    RestLab: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    KontoLab: TLabel;
    FirKtoDS: TDataSource;
    FibuKtoLookupCB: TDBLookupComboBox;
    procedure JoDSDataChange(Sender: TObject; Field: TField);
    procedure SkontoProzChange(Sender: TObject);
    procedure IST_BETRAGChange(Sender: TObject);
    procedure SkontoCBClick(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SkontoProzKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  private
    { Private-Deklarationen }
    From_Edi  : Boolean;
    BerGez    : Double;
    Quelle    : Integer;
    
    FibuKasseKto: Integer;
    
    LastDatum : tDateTime;
    LastBankID: Integer;
  public
    { Public-Deklarationen }
    
    procedure Run (Von, REC_ID: Integer);
  end;
    
var
  ZEForm: TZEForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Main, OF_Var_Const, OF_Tool1;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TZEForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;

  JoDS.Dataset     := nil;
  FirKtoDS.Dataset := nil;
  LastDatum        := Now;
  LastBankID       := -1;
end;

//------------------------------------------------------------------------------
procedure tZEForm.Run (Von, REC_ID: Integer);
var 
  f: string;
  b: double;
begin
  FibuKasseKto := DM1.ReadInteger ('MAIN\FIBU', 'KASSE_KTO'  , 1000);

  Quelle := Von;

  if not (Quelle in [VK_RECH, EK_RECH]) then 
    exit;

  if Quelle = VK_RECH then
  begin
    Caption := _('Zahlungseingang');
    KunDatGB.Caption := _('Kundendaten');
  end else
  begin
    if Quelle = EK_RECH then
    begin
      Caption := _('Zahlungsausgang');
      KunDatGB.Caption := _('Lieferantendaten');
    end;
  end;

  if not DM1.FirBankTab.Active then 
    DM1.FirBankTab.Open;

  JoDS.Dataset     := DM1.JourTab;
  FirKtoDS.DataSet := DM1.FirBankTab;


  from_edi := False;
  f := ',0.00 "' + DM1.LeitWaehrung + '";-,0.00 "' + DM1.LeitWaehrung + '"';

  DM1.JourTabIST_ANZAHLUNG.DisplayFormat := F;

  DM1.JourTab.Close;
  DM1.JourTab.ParamByName('ID').Value := REC_ID;
  DM1.JourTab.Open;

  BerGez := DM1.JourTabIST_Betrag.Value;

  if DM1.JourTab.RecordCount = 0 then 
  begin 
    DM1.JourTab.Close; 
    exit; 
  end;
  {  if DM1.JourTabWAEHRUNG.Value='DM' then IST_BETRAG.SaveWaehrung :=DM
  else IST_BETRAG.SaveWaehrung :=EURO;
  
  if DM1.LeitWaehrung='DM' then IST_BETRAG.ViewWaehrung :=DM
  else IST_BETRAG.ViewWaehrung :=EURO; }

  DM1.JourTabIst_Betrag.DisplayFormat := f;
  DM1.JourTabIst_Betrag.EditFormat := '0.00';

  RBetrag.Caption  := FormatFloat (',#0.00', DM1.CalcLeitWaehrung(DM1.JourTabBSumme.Value, DM1.JourTabWaehrung.Value)) + ' ' + DM1.LeitWaehrung + ' ';
  SKBetrag.Caption := '0.00' + ' ' + dm1.Leitwaehrung + ' ';

  SkontoCB.Enabled := DM1.JourTabIST_BETRAG.Value = 0; // Bei Teilzahlung kein Skonto

  AnzahlungLab.Caption := FormatFloat (',#0.00 ' + DM1.JourTabWAEHRUNG.Value, DM1.JourTabIST_ANZAHLUNG.Value + BerGez);
  RestLab.Caption      := FormatFloat (',#0.00 ' + DM1.JourTabWAEHRUNG.Value, DM1.JourTabBSumme.Value - DM1.JourTabIST_ANZAHLUNG.Value - BerGez);

  if DM1.JourTabSOLL_STAGE.Value > 0 then
  begin
    SkontoDatLab.Caption := FormatDateTime ('dd.mm.yyyy', DM1.JourTabRDatum.Value + DM1.JourTabSOLL_STAGE.Value);
    if DM1.JourTabRDatum.Value + DM1.JourTabSOLL_STAGE.Value < LastDatum then 
      SkontoDatLab.Font.Color := clRed
    else 
      SkontoDatLab.Font.Color := clBlack;

    b := DM1.JourTabBSumme.Value;
    if B <> 0 then 
      B := B / 100 * DM1.JourTabSOLL_SKONTO.Value
    else 
      B := 0;

    SkontoBetLab.Caption := FormatFloat (',#0.00', B) + ' ' + DM1.JourTabWAEHRUNG.Value;
  end else
  begin
    SkontoDatLab.Caption := _('kein Skonto gewährt');
    SkontoDatLab.Font.Color := clRed;
    SkontoBetLab.Caption := '0,00 ' + DM1.JourTabWAEHRUNG.Value;
  end;

  NettoDatLab.Caption := FormatDateTime ('dd.mm.yyyy', DM1.JourTabRDatum.Value + DM1.JourTabSOLL_NTAGE.Value);
  if DM1.JourTabRDatum.Value + DM1.JourTabSOLL_NTAGE.Value < LastDatum then 
    NettoDatLab.Font.Color := clRed
  else 
    NettoDatLab.Font.Color := clBlack;

  FaelligTage.Caption := Inttostr(Round(Trunc(Now) - DM1.JourTabRDatum.Value)) + ' ' + _('Tage');

  DM1.JourTab.Edit;
  DM1.JourTabIST_Betrag.Value := 
    DM1.JourTabBSumme.Value -
    DM1.JourTabIST_Betrag.Value -
    DM1.JourTabIST_Anzahlung.Value;

  DM1.JourTabIST_ZAHLDAT.Value := LastDatum;


  if LastBankID > -1 then  
    DM1.JourTabBANK_ID.AsInteger := LastBankID;

  //Skonto
  if (SkontoCB.Enabled) and
     (DM1.JourTabSOLL_SKONTO.Value > 0) and
     (DM1.JourTabIST_Anzahlung.Value = 0) and
     (int(LastDatum) <= DM1.JourTabRDatum.Value + DM1.JourTabSOLL_STAGE.Value) then
  begin
    SkontoCB.Checked := True;
    SkontoProz.Value := DM1.JourTabSOLL_SKONTO.Value;
    SkontoProzChange(Self);
  end else
  begin
    IST_BETRAGChange(Self);
    SkontoCB.Checked := False;
  end;

  ShowModal;

  if DM1.JourTab.State in [dsEdit, dsInsert] then 
    DM1.JourTab.Cancel;

  JoDS.Dataset     := nil;
  FirKtoDS.DataSet := nil;
end;

//------------------------------------------------------------------------------
procedure TZEForm.JoDSDataChange(Sender: TObject; Field: TField);
var 
  sb, proz, b: double;
begin
  //.................

  if DM1.JourTabSOLL_STAGE.Value > 0 then
  begin
    SkontoDatLab.Caption := FormatDateTime ('dd.mm.yyyy', DM1.JourTabRDatum.Value + DM1.JourTabSOLL_STAGE.Value);
    if DM1.JourTabRDatum.Value + DM1.JourTabSOLL_STAGE.Value<DM1.JourTabIST_Zahldat.Value then 
      SkontoDatLab.Font.Color := clRed
    else 
      SkontoDatLab.Font.Color := clBlack;


    b := DM1.JourTabBSumme.Value;
    if B <> 0 then 
      B := B / 100 * DM1.JourTabSOLL_SKONTO.Value
    else 
      B := 0;

    SkontoBetLab.Caption := FormatFloat (',#0.00', B) + ' ' + DM1.JourTabWAEHRUNG.Value;
  end else
  begin
    SkontoDatLab.Caption := _('kein Skonto gewährt');
    SkontoDatLab.Font.Color := clRed;
    SkontoBetLab.Caption := '0,00 ' + DM1.JourTabWAEHRUNG.Value;
  end;

  NettoDatLab.Caption := FormatDateTime ('dd.mm.yyyy', DM1.JourTabRDatum.Value + DM1.JourTabSOLL_NTAGE.Value);
  if DM1.JourTabRDatum.Value + DM1.JourTabSOLL_NTAGE.Value<DM1.JourTabIST_Zahldat.Value then 
    NettoDatLab.Font.Color := clRed
  else 
    NettoDatLab.Font.Color := clBlack;

  FaelligTage.Caption := Inttostr(Round(Trunc(DM1.JourTabIST_Zahldat.Value) - DM1.JourTabRDatum.Value)) + ' Tage';

  //.................

  if From_Edi then 
    exit;

  try
    From_Edi := True;
    sb := dm1.JourTabBSUMME.value;
    sb := sb - DM1.JourTabIST_BETRAG.Value;
    if dm1.JourTabBSUMME.value <> 0 then 
      proz := sb * 100 / dm1.JourTabBSUMME.value
    else 
      proz := 0;
    if SkontoCB.Checked then
    begin
      SkontoProz.Value := proz;

      IST_BETRAGChange(Sender);

      DiffBetrag.Visible := False;
      DiffLab.Visible := DiffBetrag.Visible;
    end else
    begin
      DiffBetrag.Visible := DM1.JourTabBSUMME.Value <>
        CAO_Round(
          (DM1.JourTabIst_Betrag.Value +
          DM1.JourTabIST_ANZAHLUNG.Value +
          BerGez) * 100) / 100;

      DiffLab.Visible := DiffBetrag.Visible;
      IST_BETRAGChange(Sender);
    end;
  finally
    From_Edi := False;
  end;

  if DM1.JourTabZAHLART.AsInteger in [0, 2, 3, 4, 5, 6, 7, 8, 9] then
  begin
    FibuKtoLookupCB.Enabled := True;
    KontoLab.Enabled        := True;

    if (DM1.JourTabBank_ID.AsInteger<0) then
    begin
      DM1.FirBankTab.First;
      if DM1.FirBankTabFIBU_KTO.AsInteger > 0 then 
        DM1.JourTabBank_ID.AsInteger := DM1.FirBankTabFIBU_KTO.AsInteger;
    end;
  end else
  begin
    FibuKtoLookupCB.Enabled := False;
    KontoLab.Enabled        := False;

    if (DM1.JourTabZAHLART.AsInteger = 1) and // BAR
       (DM1.JourTabBank_ID.AsInteger<>FibuKasseKto) then 
      DM1.JourTabBank_ID.AsInteger := FibuKasseKto;
  end;

  BuchenBtn.Enabled := DM1.JourTabZahlArt.Value > -1;
end;  

//------------------------------------------------------------------------------
procedure TZEForm.SkontoProzChange(Sender: TObject);
begin
  if From_Edi then  
    exit;
  From_Edi := True;
  try
    if not (DM1.Jourtab.State in [dsEdit, DsInsert]) then 
      DM1.Jourtab.Edit;
    if SkontoProz.Value <> 100 then 
      DM1.JourTabIST_BETRAG.Value := DM1.JourTabBSumme.Value - ((DM1.JourTabBSumme.Value / 100) * SkontoProz.Value)
    else 
      DM1.JourTabIST_BETRAG.Value := 0;
  finally
    From_Edi := False;
    JoDSDataChange(Sender, Nil);
  end;
end;                                   

//------------------------------------------------------------------------------
procedure TZEForm.SkontoProzKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SkontoProzChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TZEForm.IST_BETRAGChange(Sender: TObject);
var 
  D: Double;
begin
  {  if (IST_Betrag.ViewWaehrung=DM)and(DM1.JourTabWaehrung.Value='DM') then
  begin
  RBetrag.Caption :=FormatFloat (',###,##0.00',DM1.JourTabBSumme.Value)+' DM ';
  
  d :=DM1.JourTabBSUMME.Value-
  CAO_Round(
  (DM1.JourTabIst_Betrag.Value+
  DM1.JourTabIST_ANZAHLUNG.Value+
  BerGez)*100)/100;
  
  if SkontoCB.Checked then
  begin
  SKBetrag.Caption :=FormatFloat (',###,##0.00',D)+' DM ';
  DiffBetrag.Caption :='0.00 DM ';
  end
  else
  begin
  SKBetrag.Caption :='0.00 DM ';
  DiffBetrag.Caption :=FormatFloat (',###,##0.00',D)+' DM ';
  end;
  
  
  end else
  if (IST_Betrag.ViewWaehrung=EURO)and(DM1.JourTabWaehrung.Value='DM') then
  begin
  RBetrag.Caption :=FormatFloat (',###,##0.00',DM1.CalcLeitWaehrung(DM1.JourTabBSumme.Value,DM1.JourTabWaehrung.Value))+' '+dm1.Leitwaehrung+' ';
  
  d :=DM1.JourTabBSUMME.Value-
  CAO_Round(
  (DM1.JourTabIst_Betrag.Value+
  DM1.JourTabIST_ANZAHLUNG.Value+
  BerGez)*100)/100;
  
  if SkontoCB.Checked then
  begin
  SKBetrag.Caption :=FormatFloat (',###,##0.00',DM1.CalcLeitWaehrung(D,DM1.JourTabWaehrung.Value))+' '+dm1.Leitwaehrung+' ';
  DiffBetrag.Caption :='0.00 '+dm1.Leitwaehrung+' ';
  end
  else
  begin
  SKBetrag.Caption :='0.00 '+dm1.Leitwaehrung+' ';
  DiffBetrag.Caption :=FormatFloat (',###,##0.00',DM1.CalcLeitWaehrung(D,DM1.JourTabWaehrung.Value))+' '+dm1.Leitwaehrung+' ';
  end;
  
  DiffBetrag.Caption :=FormatFloat (',###,##0.00',DM1.CalcLeitWaehrung(D,DM1.JourtabWaehrung.Value))+' '+dm1.Leitwaehrung+' ';
  end else
  if (IST_Betrag.ViewWaehrung=EURO)and(DM1.JourTabWaehrung.Value='€') then
  begin  }
  
  RBetrag.Caption := FormatFloat (',#0.00', DM1.JourTabBSumme.Value) + ' ' + dm1.Leitwaehrung + ' ';

  d := DM1.JourTabBSUMME.Value - CAO_Round(
        (DM1.JourTabIst_Betrag.Value +
        DM1.JourTabIST_ANZAHLUNG.Value +
        BerGez) * 100) / 100;

  if SkontoCB.Checked then
  begin
    SKBetrag.Caption := FormatFloat (',#0.00', D) + ' ' + dm1.Leitwaehrung + ' ';
    DiffBetrag.Caption := '0.00 ' + dm1.Leitwaehrung + ' ';
  end else
  begin
    SKBetrag.Caption := '0.00 ' + dm1.Leitwaehrung + ' ';
    DiffBetrag.Caption := FormatFloat (',#0.00', D) + ' ' + dm1.Leitwaehrung + ' ';
  end;

  DiffBetrag.Caption := FormatFloat (',#0.00', D) + ' ' + dm1.Leitwaehrung + ' ';
  // end;
end;  

//------------------------------------------------------------------------------
procedure TZEForm.SkontoCBClick(Sender: TObject);
begin
  SkontoProz.Enabled := SkontoCB.Checked;
  if not SkontoCB.Checked then 
    SkontoProz.Value := 0;
  SkontoProzChange (Sender);
end;

//------------------------------------------------------------------------------
procedure TZEForm.BuchenBtnClick(Sender: TObject);
var 
  S: Integer;
begin
  // Buchung ausführen
  DM1.JourTabIST_Skonto.Value := SkontoProz.Value;


  if (SkontoCB.Enabled) and (SkontoCB.Checked) and
     (CAO_round(SkontoProz.Value * 100) > 0) then
  begin
    //Zahlung mit Skonto
    S := 80 + DM1.JourTabZahlart.Value;
    DM1.JourTabIST_Betrag.Value := DM1.JourTabIST_Betrag.Value + Bergez;
  end else
  if //(SkontoCB.Enabled)and
     //(not SkontoCB.Checked)and
     (CAO_round(SkontoProz.Value * 100) = 0) and
     (DM1.JourTabBSumme.Value = DM1.JourTabIST_Betrag.Value + BerGez + DM1.JourTabIST_Anzahlung.Value) then
  begin
    //Zahlung Netto (ohne Skonto)
    S := 90 + DM1.JourTabZahlart.Value;
    DM1.JourTabIST_Betrag.Value := DM1.JourTabIST_Betrag.Value + Bergez;
  end else
  begin
    // Teilzahlung
    S := 70 + DM1.JourTabZahlart.Value;
    DM1.JourTabIST_Betrag.Value := DM1.JourTabIST_Betrag.Value + BerGez;
  end;
  DM1.JourTabStadium.Value := S;

  if DM1.JourTabZahlart.Value = 1 then // Barzahlung
  begin
    if Quelle = VK_RECH then
    begin
      DM1.BucheKasse(
        DM1.JourTabIST_Zahldat.Value,      
        Quelle,
        DM1.JourTabRec_ID.Value,
        DM1.JourTabVReNum.Value,
        DM1.JourTabGegenKonto.Value,
        DM1.JourTabIST_Skonto.Value,
        DM1.JourTabIST_Betrag.Value - Bergez,
        'ZE VK-RE ' + DM1.JourTabKun_Name1.Value
      );
    end else
    if Quelle = EK_RECH then
    begin
      DM1.BucheKasse(
        DM1.JourTabIST_Zahldat.Value,
        Quelle,
        DM1.JourTabRec_ID.Value,
        DM1.JourTabVReNum.Value,
        DM1.JourTabGegenKonto.Value,
        DM1.JourTabIST_Skonto.Value,
        (DM1.JourTabIST_Betrag.Value - Bergez) * -1, // negativ, weil einkauf !!!
        'ZA EK-RE ' + DM1.JourTabKun_Name1.Value
      );
    end;
  end;

  DM1.JourTab.Post;

  LastDatum  := DM1.JourTabIST_Zahldat.Value;
  if DM1.JourTabBANK_ID.AsInteger > -1 then 
    LastBankID := DM1.JourTabBANK_ID.AsInteger;

  Close;
end;

//------------------------------------------------------------------------------

end.

