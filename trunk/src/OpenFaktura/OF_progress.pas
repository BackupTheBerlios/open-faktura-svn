{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Fortschrittsbalken (für Programm-Start ??)                        }
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
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TProgressForm = class(TForm)
    PB1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private-Deklarationen }
    Step  : Integer;
    Step2 : Integer;
    LStep : Integer;
    Run   : Boolean;
  public
    { Public-Deklarationen }
    procedure Init (Caption : String);
    procedure Start;
    procedure Stop;
    procedure UpdateScreen;
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

uses 
	GNUGetText;

procedure TProgressForm.FormCreate(Sender: TObject);
begin
  try 
		TranslateComponent (self);  
	except
	end;

  Run   := False;
  Step  := 0;
  Step2 := 0;

  Left := 200;
  Top := 200;
  Position := poDesigned;
end;

procedure TProgressForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not Run;
end;

procedure TProgressForm.Init(Caption : String);
begin
  Run := False;
  Step := 0;
  Step := 0;;
  PB1.Position := 0;
  Self.Caption := Caption;
end;

procedure TProgressForm.Start;
begin
  Step  := 0;
  Step2 := 0;
  LStep := 0;
  Run   := True;
  PB1.Position := 0;
  Show;
end;

procedure TProgressForm.Stop;
begin
  Run   := False;
  Step  := 0;
  Step2 := 0;
  Hide;
end;

procedure TProgressForm.UpdateScreen;
begin
  inc(Step);
  inc(Step2);
  if Step > PB1.Max then
	  Step := PB1.Min;
  PB1.Position := Step;

  if (Step2 > 10) and (not Visible) then
	  Show;

  if Step2 > LStep+100 then
  begin
    LStep := LStep+100;
    Label1.Caption := IntToStr(Step2);
  end;

  Application.ProcessMessages;
end;

end.

