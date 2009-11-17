{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : [[ add description here! ]]                                       }
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

unit OF_MakeVKAuftrag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Menus, ExtCtrls,
   OF_Var_Const;
  
type
  TMakeVKAuftragForm = class(TForm)
    MainMenu1: TJvMainMenu;
    Dummy1: TMenuItem;
    RePanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    
    procedure F9Change (Ein: Boolean);
  end;
    
var
  MakeVKAuftragForm: TMakeVKAuftragForm;
  
implementation

{$R *.DFM}

procedure TMakeVKAuftragForm.FormCreate(Sender: TObject);
begin
  //
end;

procedure TMakeVKAuftragForm.FormActivate(Sender: TObject);
begin
  //
end;

procedure TMakeVKAuftragForm.FormDeactivate(Sender: TObject);
begin
  //
end;

procedure TMakeVKAuftragForm.F9Change (Ein: Boolean);
begin
  //
end;

end.
