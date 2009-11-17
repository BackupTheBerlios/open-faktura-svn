{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Kassenbuch / Dialog zum Erfassen des Anfangsbestandes             }
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
{ 22.01.2003 - Version 1.0.0.49 released Jan Pokrandt }
{ 06.05.2003 - Version zum GNU-Source hinzugefügt }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_FibuKassenbuch_AB_Dlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Mask, JvExMask, JvToolEdit, JvBaseEdits, StdCtrls, Buttons;

type
  TKasBuchAB = class(TForm)
    Label1: TLabel;
    BuchText: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BuchenBtn: TBitBtn;
    AbortBtn: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    StartValEdit: TJvCalcEdit;  //TJvxCurrencyEdi;
    Label7: TLabel;
    Label8: TLabel;
    KasseTab: TZQuery;
    KasseTabBDATUM: TDateField;
    KasseTabBELEGNUM: TStringField;
    KasseTabQUELLE: TIntegerField;
    KasseTabGKONTO: TIntegerField;
    KasseTabSKONTO: TFloatField;
    KasseTabZU_ABGANG: TFloatField;
    KasseTabBTXT: TMemoField;
    KasseTabJOURNAL_ID: TIntegerField;
    KasseTabMA_ID: TIntegerField;
    KasseTabERSTELLT: TDateField;
    KasseTabERST_NAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BuchenBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    LastSaldo: Double;
    LastJahr : Integer;
  end;

    //var KasBuchAB: TKasBuchAB;
    
implementation

uses
  GNUGetText,
  OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TKasBuchAB.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TKasBuchAB.FormShow(Sender: TObject);
begin
  Label3.Caption := '31.12.' + Inttostr(LastJahr);
  Label6.Caption := '01.01.' + Inttostr(LastJahr + 1);
  Label4.Caption := FormatFloat (',#0.00', LastSaldo);

  Label7.Caption := DM1.LeitWaehrung;
  Label8.Caption := DM1.LeitWaehrung;

  BuchText.Text := _('Anfangsbestand') + ' ' + Inttostr(LastJahr + 1);

  StartValEdit.Value := LastSaldo;
end;

//------------------------------------------------------------------------------
procedure TKasBuchAB.BuchenBtnClick(Sender: TObject);
begin
  KasseTab.Open;
  try
    KasseTab.Append;
    KasseTabBDATUM.AsDateTime     := EncodeDate (LastJahr + 1, 1, 1);
    KasseTabBELEGNUM.AsString     := '-';
    KasseTabQUELLE.AsInteger      := 0;
    KasseTabJOURNAL_ID.AsInteger  := -1;
    KasseTabGKONTO.AsInteger      := -1; //????
    KasseTabSKONTO.AsFloat        := 0;
    KasseTabZU_ABGANG.AsFloat     := StartValEdit.Value;
    KasseTabBTXT.AsString         := BuchText.Text;

    KasseTabERSTELLT.AsDateTime   := now;
    KasseTabERST_NAME.AsString    := DM1.view_user;
    KasseTabMA_ID.AsInteger       := DM1.UserID;

    KasseTab.Post;
  except
    KasseTab.Cancel;
  end;
  KasseTab.Close;
  Close;
end;

//------------------------------------------------------------------------------

end.

