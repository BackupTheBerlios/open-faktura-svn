{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog um die Summen Netto_1 etc. nachzuberechnen                 }
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
{ 07.03.2004 - JP: Unit erstellt }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Recalc_Summen_Dlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls;

type
  TSumRecalcForm = class(TForm)
    PB: TProgressBar;
    JTab: TZQuery;
    JPOSTab: TZQuery;
    JPOSTabJOURNAL_ID: TIntegerField;
    JPOSTabREC_ID: TIntegerField;
    JPOSTabEPREIS: TFloatField;
    JPOSTabRABATT: TFloatField;
    JPOSTabSTEUER_CODE: TIntegerField;
    JPOSTabBRUTTO_FLAG: TBooleanField;
    JTabREC_ID: TIntegerField;
    JTabMWST_0: TFloatField;
    JTabMWST_1: TFloatField;
    JTabMWST_2: TFloatField;
    JTabMWST_3: TFloatField;
    JTabNSUMME_0: TFloatField;
    JTabNSUMME_1: TFloatField;
    JTabNSUMME_2: TFloatField;
    JTabNSUMME_3: TFloatField;
    JTabNSUMME: TFloatField;
    JTabMSUMME_0: TFloatField;
    JTabMSUMME_1: TFloatField;
    JTabMSUMME_2: TFloatField;
    JTabMSUMME_3: TFloatField;
    JTabMSUMME: TFloatField;
    JTabBSUMME_0: TFloatField;
    JTabBSUMME_1: TFloatField;
    JTabBSUMME_2: TFloatField;
    JTabBSUMME_3: TFloatField;
    JTabBSUMME: TFloatField;
    JTabBRUTTO_FLAG: TBooleanField;
    JTabMWST_FREI_FLAG: TBooleanField;
    JPOSTabSUMME: TFloatField;
    JPOSTabMENGE: TFloatField;
    Timer1: TTimer;
    ProzLab: TLabel;
    JTabQUELLE: TIntegerField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure JPOSTabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
    InUpdate: Boolean;
    LastP: Integer;
    procedure UpdateSummen;
  public
    { Public-Deklarationen }
  end;
    
    //var
    //  SumReclacForm: TSumReclacForm;
    
implementation

uses
  OF_DM, OF_Tool1;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TSumRecalcForm.FormCreate(Sender: TObject);
begin
  InUpdate := False;
end;

//------------------------------------------------------------------------------
procedure TSumRecalcForm.FormShow(Sender: TObject);
begin
  PB.Max := 1;
  PB.Position := 0;
  ProzLab.Caption := '0% abgeschlossen';
  LastP := -1;
  Timer1.Enabled := True;
end;

//------------------------------------------------------------------------------
procedure TSumRecalcForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not InUpdate;
end;

//------------------------------------------------------------------------------
procedure TSumRecalcForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not InUpdate then UpdateSummen;
end;

//------------------------------------------------------------------------------
procedure TSumRecalcForm.JPOSTabCalcFields(DataSet: TDataSet);
var 
  SU: Double;
begin
  SU := JPosTabEPreis.Value * JPosTabMenge.Value;
  if JPosTabRabatt.Value <> 0 then 
    SU := SU - SU * JPosTabRabatt.Value / 100;

  JPosTabSumme.Value := CAO_round(SU * 100) / 100;  // Auf ganze Pfennige Runden
end;

//------------------------------------------------------------------------------
procedure TSumRecalcForm.UpdateSummen;
var 
  N, n0, n1, n2, n3,
  M, m0, m1, m2, m3,
  B, b0, b1, b2, b3: Double;
  P: Integer;
begin
  InUpdate := True;
  try
    DM1.SQLLog := False;
    Screen.Cursor := crSqlWait;

    JTab.Open;
    PB.Max := JTab.RecordCount;
    while not JTab.Eof do
    begin
      PB.Position := JTab.RecNo;

      P := round(JTab.RecNo * 100 / JTab.RecordCount);
      if P <> LastP then
      begin
        LastP := P;
        ProzLab.Caption := IntToStr(P) + '% abgeschlossen';
      end;
      Application.ProcessMessages;

      JPosTab.Close;
      JPosTab.ParamByName('JID').AsInteger := JTabRec_ID.AsInteger;
      JPosTab.Open;

      // alles auf 0 stellen
      N := 0; N0 := 0; N1 := 0; N2 := 0; N3 := 0;
      M := 0; M0 := 0; M1 := 0; M2 := 0; M3 := 0;
      B := 0; B0 := 0; B1 := 0; B2 := 0; B3 := 0;

      while not JPosTab.Eof do
      begin
        N := N + JPosTabSumme.Value;
        B := B + JPosTabSumme.Value;

        case JPosTabSteuer_code.Value of
          0: begin
            N0 := N0 + JPosTabSumme.Value;
            B0 := B0 + JPosTabSumme.Value;
          end;
          1: begin
            N1 := N1 + JPosTabSumme.Value;
            B1 := B1 + JPosTabSumme.Value;
          end;
          2: begin
            N2 := N2 + JPosTabSumme.Value;
            B2 := B2 + JPosTabSumme.Value;
          end;
          3: begin
            N3 := N3 + JPosTabSumme.Value;
            B3 := B3 + JPosTabSumme.Value;
          end;
        end;

        JPosTab.Next;
      end;
      JPosTab.Close;


      if not JTabMWST_FREI_Flag.AsBoolean then
      begin
        if JTabBrutto_Flag.ASBoolean then
        begin
          //Bruttofakturierung
          M1 := CAO_round(B1 / (100 + JTabMwSt_1.AsFloat) * JTabMwSt_1.AsFloat * 100) / 100;
          M2 := CAO_round(B2 / (100 + JTabMwSt_2.AsFloat) * JTabMwSt_2.AsFloat * 100) / 100;
          M3 := CAO_round(B3 / (100 + JTabMwSt_3.AsFloat) * JTabMwSt_3.AsFloat * 100) / 100;

          M  := M0 + M1 + M2 + M3;
          N  := B - M;
          N0 := B0;
          N1 := B1 - M1;
          N2 := B2 - M2;
          N3 := B3 - M3;
        end else
        begin
          // Nettofakturierung
          M1 := CAO_round(N1 * JTabMwSt_1.AsFloat) / 100;
          M2 := CAO_round(N2 * JTabMwSt_2.AsFloat) / 100;
          M3 := CAO_round(N3 * JTabMwSt_3.AsFloat) / 100;

          M  := M0 + M1 + M2 + M3;
          B  := N + M;
          B0 := N0;
          B1 := N1 + M1;
          B2 := N2 + M2;
          B3 := N3 + M3;
        end;
      end else
      begin  // MwSt-Frei ...
        M  := 0;
        B  := N;
        N0 := N; N1 := 0; N2 := 0; N3 := 0;
        B0 := B; B1 := 0; B2 := 0; B3 := 0;
      end;

      if (N0 <> 0) and (N1 = 0) and (N2 = 0) and (N3 = 0) then N0 := JTabNSumme.AsFloat;
      if (N0 = 0) and (N1 <> 0) and (N2 = 0) and (N3 = 0) then N1 := JTabNSumme.AsFloat;
      if (N0 = 0) and (N1 = 0) and (N2 <> 0) and (N3 = 0) then N2 := JTabNSumme.AsFloat;
      if (N0 = 0) and (N1 = 0) and (N2 = 0) and (N3 <> 0) then N3 := JTabNSumme.AsFloat;

      if (B0 <> 0) and (B1 = 0) and (B2 = 0) and (B3 = 0) then B0 := JTabBSumme.AsFloat;
      if (B0 = 0) and (B1 <> 0) and (B2 = 0) and (B3 = 0) then B1 := JTabBSumme.AsFloat;
      if (B0 = 0) and (B1 = 0) and (B2 <> 0) and (B3 = 0) then B2 := JTabBSumme.AsFloat;
      if (B0 = 0) and (B1 = 0) and (B2 = 0) and (B3 <> 0) then B3 := JTabBSumme.AsFloat;

      // Jetzt Summen im Journal aktualisieren
      JTab.Edit;
      try
        JTabNSumme_0.AsFloat := N0;
        JTabNSumme_1.AsFloat := N1;
        JTabNSumme_2.AsFloat := N2;
        JTabNSumme_3.AsFloat := N3;

        JTabBSumme_0.AsFloat := B0;
        JTabBSumme_1.AsFloat := B1;
        JTabBSumme_2.AsFloat := B2;
        JTabBSumme_3.AsFloat := B3;

        if JTabQuelle.AsInteger in [2, 12] then // nur bei Lieferscheinen
        begin
          JTabMSumme.AsFloat := M;
          JTabMSumme_0.AsFloat := M0;
          JTabMSumme_1.AsFloat := M1;
          JTabMSumme_2.AsFloat := M2;
          JTabMSumme_3.AsFloat := M3;

          JTabNSumme.AsFloat := N;
          JTabBSumme.AsFloat := B;
        end;
        JTab.Post;
      except
        JTab.Cancel;
      end;
      JTab.Next;
    end;
    JTab.Close;
  finally
    InUpdate := False;
    DM1.SQLLog := True;
    Screen.Cursor := crDefault;
  end;
end;        

//------------------------------------------------------------------------------

end.

