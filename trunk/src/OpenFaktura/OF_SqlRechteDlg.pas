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

unit OF_SqlRechteDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, JvExControls, JvComponent, JvInstallLabel, ExtCtrls,
  StdCtrls, Buttons,
  OF_Var_Const;

type
  TSqlRechteDlg = class(TForm)
    CloseBtn: TBitBtn;
    ImageList1: TImageList;
    Panel1: TPanel;
    Bevel1: TBevel;
    JvInstallLabel1: TJvInstallLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure ShowDlg(Txt: String; Rechte: TSDBUserRechte);
  end;


implementation

uses
  GNUGetText,
  OF_DM;

{$R *.DFM}

procedure TSqlRechteDlg.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent(self);  
  except 
  end;

  JvInstallLabel1.SetImage(2, 1);
  JvInstallLabel1.SetImage(5, 1);
end;

procedure TSqlRechteDlg.ShowDlg(Txt: String; Rechte: TSDBUserRechte);
begin
  JvInstallLabel1.SetImage(0, Ord(urSelect in Rechte));
  JvInstallLabel1.SetImage(1, Ord(urInsert in Rechte));
  JvInstallLabel1.SetImage(2, Ord(urUpdate in Rechte));
  JvInstallLabel1.SetImage(3, Ord(urDelete in Rechte));
  JvInstallLabel1.SetImage(4, Ord(urIndex in Rechte));
  JvInstallLabel1.SetImage(5, Ord(urAlter in Rechte));
  JvInstallLabel1.SetImage(6, Ord(urCreate in Rechte));
  JvInstallLabel1.SetImage(7, Ord(urDrop in Rechte));

  Label2.Caption := Txt;

  ShowModal;
end;

end.

