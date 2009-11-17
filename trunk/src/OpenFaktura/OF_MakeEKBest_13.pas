{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Einkauf-Bestellung erstellen                                      }
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
{ - dies sollte wohl ein Rewrite von "_MakeEKBest.pas" werden (JP f. CAO v1.3) }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MakeEKBest_13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OF_Var_Const, Menus, ExtCtrls, Db, ZQuery, ZMySqlQuery, CaoSecurity,
  ComCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, JvMenus,
  OFSecurity;
  
type
  TMakeEKBestForm = class(TForm)
    MainMenu1: TJVMainMenu;
    Dummy1: TMenuItem;
    RePanel: TPanel;
    ReEdiTab: TOFZQuery;
    ReEdiTabREC_ID: TIntegerField;
    ReEdiTabQUELLE: TIntegerField;
    ReEdiTabQUELLE_SUB: TIntegerField;
    ReEdiTabADDR_ID: TIntegerField;
    ReEdiTabVRENUM: TStringField;
    ReEdiTabRDATUM: TDateField;
    ReEdiTabGLOBRABATT: TFloatField;
    ReEdiTabLDATUM: TDateField;
    ReEdiTabLOHN: TFloatField;
    ReEdiTabWARE: TFloatField;
    ReEdiTabTKOST: TFloatField;
    ReEdiTabMWST_0: TFloatField;
    ReEdiTabMWST_1: TFloatField;
    ReEdiTabMWST_2: TFloatField;
    ReEdiTabMWST_3: TFloatField;
    ReEdiTabNSUMME: TFloatField;
    ReEdiTabNSUMME_0: TFloatField;
    ReEdiTabNSUMME_1: TFloatField;
    ReEdiTabNSUMME_2: TFloatField;
    ReEdiTabNSUMME_3: TFloatField;
    ReEdiTabMSUMME: TFloatField;
    ReEdiTabMSUMME_0: TFloatField;
    ReEdiTabMSUMME_1: TFloatField;
    ReEdiTabMSUMME_2: TFloatField;
    ReEdiTabMSUMME_3: TFloatField;
    ReEdiTabBSUMME: TFloatField;
    ReEdiTabBSUMME_0: TFloatField;
    ReEdiTabBSUMME_1: TFloatField;
    ReEdiTabBSUMME_2: TFloatField;
    ReEdiTabBSUMME_3: TFloatField;
    ReEdiTabATSUMME: TFloatField;
    ReEdiTabATMSUMME: TFloatField;
    ReEdiTabGEGENKONTO: TIntegerField;
    ReEdiTabSOLL_STAGE: TIntegerField;
    ReEdiTabSOLL_SKONTO: TFloatField;
    ReEdiTabSOLL_NTAGE: TIntegerField;
    ReEdiTabSTADIUM: TIntegerField;
    ReEdiTabERSTELLT: TDateField;
    ReEdiTabERST_NAME: TStringField;
    ReEdiTabKUN_NUM: TStringField;
    ReEdiTabKUN_ANREDE: TStringField;
    ReEdiTabKUN_NAME1: TStringField;
    ReEdiTabKUN_NAME2: TStringField;
    ReEdiTabKUN_NAME3: TStringField;
    ReEdiTabKUN_ABTEILUNG: TStringField;
    ReEdiTabKUN_STRASSE: TStringField;
    ReEdiTabKUN_LAND: TStringField;
    ReEdiTabKUN_PLZ: TStringField;
    ReEdiTabKUN_ORT: TStringField;
    ReEdiTabUSR1: TStringField;
    ReEdiTabUSR2: TStringField;
    ReEdiTabPROJEKT: TStringField;
    ReEdiTabORGNUM: TStringField;
    ReEdiTabBEST_NAME: TStringField;
    ReEdiTabBEST_CODE: TIntegerField;
    ReEdiTabINFO: TBlobField;
    ReEdiTabLIEFART: TIntegerField;
    ReEdiTabZAHLART: TIntegerField;
    ReEdiTabWAEHRUNG: TStringField;
    ReEdiTabWV_DatumStr: TStringField;
    ReEdiTabZahlart_Str: TStringField;
    ReEdiTabWaehrung_Str: TStringField;
    ReEdiTabLIEF_ADDR_ID: TIntegerField;
    ReEdiTabBRUTTO_FLAG: TBooleanField;
    ReEdiTabMWST_FREI_FLAG: TBooleanField;
    ReEdiTabGEWICHT: TFloatField;
    PageControl1: TPageControl;
    EdiListTS: TTabSheet;
    AdressTS: TTabSheet;
    PosTS: TTabSheet;
    Fertig: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    First: Boolean;
    
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure New1BtnClick(Sender: TObject);
    procedure SetAdresse (ID: Integer);
  end;
    
var
  MakeEKBestForm: TMakeEKBestForm;
  
implementation

{$R *.DFM}

procedure TMakeEKBestForm.FormCreate(Sender: TObject);
begin
  //
end;

procedure TMakeEKBestForm.FormActivate(Sender: TObject);
begin
  //
end;

procedure TMakeEKBestForm.FormDeactivate(Sender: TObject);
begin
  //
end;

procedure TMakeEKBestForm.New1BtnClick(Sender: TObject);
begin
  //
end;

procedure TMakeEKBestForm.SetAdresse (ID: Integer);
begin
  //
end;

end.
