{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : EK-Erstellung / Fertigmeldungsdialog                              }
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

unit OF_MakeEKRech_FertigDlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEKRechFertigDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Image1: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    VKFlag: Boolean;
  public
    { Public-Deklarationen }
    function ExecDialog (BelegNr: String; var MakeVKRech: Boolean): Boolean;
  end;
    
var
  EKRechFertigDlg: TEKRechFertigDlg;
  
implementation

{$R *.DFM}

uses
  GNUGetText;

//------------------------------------------------------------------------------
procedure TEKRechFertigDlg.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;
end;

//------------------------------------------------------------------------------
function TEKRechFertigDlg.ExecDialog (BelegNr: String; var MakeVKRech: Boolean): Boolean;
begin
  VKFlag := False;
  Label1.Caption := Format(_('Der Beleg wurde unter der internen' + #13#10 +
    'Nummer :%s gespeichert.'), [BelegNr]);
  ShowModal;
  MakeVKRech := VKFlag;
  Result := True;
end;

//------------------------------------------------------------------------------
procedure TEKRechFertigDlg.BitBtn2Click(Sender: TObject);
begin
  VKFlag := True;
  Close;
end;

//------------------------------------------------------------------------------
procedure TEKRechFertigDlg.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

end.

