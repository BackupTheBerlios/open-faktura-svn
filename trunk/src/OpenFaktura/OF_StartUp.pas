{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    :                                                                   }
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
(*******************************************************************************
  TODO:
  - Start-Grafik ersetzen bzw. ersetzen
  - Logo Einbindung ermöglichen (png|jpg|bmp)
  - Splash-Screen abschaltbar bzw. nicht modal

  ISSUES, NOTES:
  -

  HISTORY:
  30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)
  28.11.2009 - UD: Funktionsaufruf "ExtractFilePath(ParamStr(0))" durch die
                   Globale Variaiable "APP_PATH" ersetzt.
*******************************************************************************)

unit OF_StartUp;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, jpeg, JvExExtCtrls, JvImage,
  JvExControls, JvComponent, JvSpecialProgress;

type
  TStartBox = class(TForm)
    JvImage1: TJvImage;
    Label1: TLabel;
    Label2: TLabel;
    pBar: TJvSpecialProgress;
    Panel1: TPanel;
    laVersion: TLabel;
    Label3: TLabel;
    procedure JvImage1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Modal: Boolean;
  end;

var
  SScreen: TStartBox; // Splash-Screen für Programmstart !!

implementation

uses
  OF_Var_Const;

{$R *.DFM}

procedure TStartBox.FormCreate(Sender: TObject);
var
  JPG: tJPegImage;
begin
  Modal := False;
  {$IFDEF ALPHA}
  try
    if FileExists(APP_PATH + 'logo.cao') then
    begin
      JVImage1.Visible := False;
      JPG := tJPegImage.Create;
      try
        Jpg.LoadFromFile(APP_PATH + 'logo.cao');
        JVImage1.Picture.Assign (JPG);
        JVImage1.State := stDefault;
      finally
        JPG.Free;
      end;
      JVImage1.Visible := True;
    end;
  except
  end;
  {$ENDIF}
end;

procedure TStartBox.JvImage1Click(Sender: TObject);
begin
  if Modal then
    Close;
end;

procedure TStartBox.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Modal then
    Close;
end;

end.

