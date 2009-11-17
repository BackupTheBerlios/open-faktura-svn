{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Shop Modul, Bilder-Upload                                         }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  geh�rt zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung f�r irgendeinen Zweck ver�ffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
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

unit OF_ShopImageUpload;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls,
  OF_Var_Const, JvMenus;
  
type
  TImageSize = (isDefault, isLarge, isMedium);
  
type
  TFileUpload = class(TForm)
    MainPanel: TPanel;
    MainMenu1: TJvMainMenu;
    Dummy1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Function ProduktImage    (var Name, LocalFile: String;
    Size: tImageSize): Boolean;
    Function KategorieImage  (var Name: String): Boolean;
    Function HerstellerImage (var Name: String): Boolean;
  end;
    
var
  FileUpload: TFileUpload;
  
implementation

{$R *.DFM}

procedure TFileUpload.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFileUpload.FormActivate(Sender: TObject);
begin
  //
end;

procedure TFileUpload.FormDeactivate(Sender: TObject);
begin
  //
end;

function TFileUpload.ProduktImage(var Name, LocalFile: String; Size: tImageSize): Boolean;
begin
  //
end;

Function TFileUpload.KategorieImage(var Name: String): Boolean;
begin
  //
end;

Function TFileUpload.HerstellerImage(var Name: String): Boolean;
begin
  //
end;

end.
