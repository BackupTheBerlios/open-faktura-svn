{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog manuelle Kassenbuchung                                     }
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
{ 09.05.2003 - Unit zum GNU-Source hinzugefügt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_ManKassBuchungDlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Buttons, JvExMask, JvToolEdit,
  JvDBControls, Mask;
{
uses
  JvDBCtrl, JvDBComb
}

type
  TManKasBuchForm = class(TForm)
    Label1: TLabel;
    ArtBuchCB: TComboBox;
    Label2: TLabel;
    DataSource1: TDataSource;
    Betrag: TDBEdit;
    GKonto: TDBEdit;
    BuDatum: TJvDBDateEdit;
    BuchenBtn: TBitBtn;
    AbortBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    BelNumEdi: TDBEdit;
    Label6: TLabel;
    procedure BuchenBtnClick(Sender: TObject);
    procedure ArtBuchCBChange(Sender: TObject);
    procedure GKontoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure ShowDlg;
  end;
    
    //var ManKasBuchForm: TManKasBuchForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM, OF_Main, OF_Var_Const;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.FormCreate(Sender: TObject);
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
end;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.ShowDlg;
begin
  Datasource1.DataSet := DM1.KasBuch;
  if not dm1.kasbuch.active then 
    dm1.kasbuch.open;
  DM1.KasBuch.Append;
  DM1.KasBuchBDATUM.Value := now;
  ShowModal;
  if DM1.KasBuch.State in [dsEdit, dsInsert] then 
    DM1.KasBuch.Cancel;
  Datasource1.DataSet := nil;
end;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.BuchenBtnClick(Sender: TObject);
begin
  DM1.KasBuchJOURNAL_ID.Value := -1;
  DM1.KasBuchSKONTO.Value := 0;
  DM1.KasBuchQUELLE.Value := 99;

  DM1.KasBuchERSTELLT.AsDateTime := now;
  DM1.KasBuchERST_NAME.AsString  := DM1.view_user;
  DM1.KasBuchMA_ID.AsInteger     := DM1.UserID;


  if (ArtBuchCB.ItemIndex in [0, 2]) and (DM1.KasBuchZU_ABGANG.Value > 0) then 
    DM1.KasBuchZU_ABGANG.Value := DM1.KasBuchZU_ABGANG.Value * -1;

  if (ArtBuchCB.ItemIndex in [1, 3]) and (DM1.KasBuchZU_ABGANG.Value < 0) then 
    DM1.KasBuchZU_ABGANG.Value := DM1.KasBuchZU_ABGANG.Value * -1;

  DM1.KasBuch.Post;
  Close;
end;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.ArtBuchCBChange(Sender: TObject);
begin
  case ArtBuchCB.ItemIndex of
    0: begin // Privatentnahme
      DM1.KasBuchGKONTO.Value := -1;
      DM1.KasBuchBTXT.AsString := _('Privatentnahme BAR');
    end;
    1: begin // Privateinlage
      DM1.KasBuchGKONTO.Value := -1;
      DM1.KasBuchBTXT.AsString := _('Privateinlage BAR');
    end;
    2: begin // Kasse->Bank
      DM1.KasBuchGKONTO.Value := Kasse1;
      DM1.KasBuchBTXT.AsString := _('Transfer Kasse -> Bank');
    end;
    3: begin // Bank->Kasse
      DM1.KasBuchGKONTO.Value := Kasse1;
      DM1.KasBuchBTXT.AsString := _('Transfer Bank -> Kasse');
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TManKasBuchForm.GKontoChange(Sender: TObject);
begin
  BuchenBtn.Enabled := 
    (ArtBuchCB.ItemIndex > -1) and 
    (DM1.KasBuchGKONTO.Value <> 0) and
    (DM1.KasBuchBTXT.AsString <> '') and
    (DM1.KasBuchZU_ABGANG.Value <> 0);
end;                                 

//------------------------------------------------------------------------------

end.

