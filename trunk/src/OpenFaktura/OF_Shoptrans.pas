{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Shop-Transfer                                                     }
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
{ - dies ist lediglich ein Modul-Entwurf!                                      }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_ShopTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls,
  OF_Var_Const, JvMenus;

type
  TShopTransForm = class(TForm)
    MainPanel: TPanel;
    MainMenu1: TJvMainMenu;
    Dummy1: TMenuItem;
    PageControl1: TPageControl;
    ArtikelTS: TTabSheet;
    BestellTS: TTabSheet;
    UpdateTS: TTabSheet;
    KatTS: TTabSheet;
    HerstellerTS: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;
    
var
  ShopTransForm: TShopTransForm;
  
implementation

{$R *.DFM}

procedure TShopTransForm.FormCreate(Sender: TObject);
begin
  //
end;

procedure TShopTransForm.FormActivate(Sender: TObject);
begin
  //
end;

procedure TShopTransForm.FormDeactivate(Sender: TObject);
begin
  //
end;

end.

