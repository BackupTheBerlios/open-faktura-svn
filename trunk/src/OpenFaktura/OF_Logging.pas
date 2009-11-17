{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : MySQL Logging                                                     }
{            - Loggt alle SQL-Queries und Status-Result zwecks Debugging       }
{            - FIFO-Ringpuffer: einstellbare Anzahl Zeilen wird vorgehalten    }
{            - Darstellung des MySQl-Serverstatus                              }
{            - Darstellung des MySQl-Server-Prozessliste                       }
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
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt }
{ 25.02.2004 - Log kann jetzt ein- und ausgeschaltet werden (default=aus) }
{            - Anzahl der Logeinträge kann geändert werden }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Logging;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, StdCtrls, Mask, JvExMask,
  JvSpin, ExtCtrls, ComCtrls;

{
uses
  JvDBCtrl, JvMaskEdit,
}

type
  TLogForm = class(TForm)
    StatusBar1: TStatusBar;
    PC1: TPageControl;
    LogTS: TTabSheet;
    SrvStatusTS: TTabSheet;
    SrvProzListTS: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    SrvStatus: TZQuery;
    SrvStatusDS: TDataSource;
    SrvStatusGrid: TOFDBGrid;
    SrvProzessGrid: TOFDBGrid;
    SrvProzList: TZQuery;
    SrvProzDS: TDataSource;
    LogAktivCB: TCheckBox;
    LogMaxEntryEdit: TJvSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SrvVarTS: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PC1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LogMaxEntryEditChange(Sender: TObject);
    procedure LogAktivCBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }

    LogEnabled : Boolean;
    LogMaxEntry : Integer;

    procedure AddLog(t : string);
  end;

var
  LogForm: TLogForm;

implementation

uses
  GNUGetText,
  OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TLogForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except
  end;

  LogEnabled  := True;
  LogMaxEntry := 300;
end;

//------------------------------------------------------------------------------
procedure TLogForm.Button1Click(Sender: TObject);
begin
	memo1.lines.clear;
end;

//------------------------------------------------------------------------------
procedure TLogForm.AddLog(t : string);
begin
  if (not Assigned(Memo1)) or (not LogEnabled) then
		exit;
  try
    Memo1.text := Memo1.text + #13#10 +
                  formatdatetime('dd.mm.yy hh:mm:ss', now)+ #13#10 + t;
    while memo1.lines.count > LogMaxEntry do
			memo1.lines.Delete(0);
  except
	end;
end;

//------------------------------------------------------------------------------
procedure TLogForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	SrvStatus.Close;
  SrvProzList.Close;

  DM1.WriteBooleanU('', 'SQL_LOG_AKTIV', LogEnabled);
  DM1.WriteIntegerU('', 'SQL_LOG_MAX', LogMaxEntry);
end;

//------------------------------------------------------------------------------
procedure TLogForm.PC1Change(Sender: TObject);
begin
  SrvStatus.Active := False;
  if PC1.ActivePage=SrvStatusTS then
  begin
    SrvStatus.Sql.Text := 'SHOW STATUS';
    SrvStatusGrid.Parent := SrvStatusTS;
  end else
	begin
    if PC1.ActivePage = SrvVarTS then
    begin
      SrvStatus.Sql.Text := 'SHOW VARIABLES';
      SrvStatusGrid.Parent := SrvVarTS;
    end;
	end;
  SrvStatus.Active := (PC1.ActivePage = SrvStatusTS) or (PC1.ActivePage = SrvVarTS);
  SrvProzList.Active := PC1.ActivePage = SrvProzListTS;
end;

//------------------------------------------------------------------------------
procedure TLogForm.FormShow(Sender: TObject);
begin
  SrvStatusGrid.RowColor2  := DM1.C2Color;
  SrvProzessGrid.RowColor2 := DM1.C2Color;
  LogMaxEntryEdit.Value    := LogMaxEntry;
  LogAktivCB.Checked       := LogEnabled;

  PC1.ActivePage := LogTS;
end;

//------------------------------------------------------------------------------
procedure TLogForm.LogMaxEntryEditChange(Sender: TObject);
begin
  LogMaxEntry := Round(LogMaxEntryEdit.Value);
end;

//------------------------------------------------------------------------------
procedure TLogForm.LogAktivCBClick(Sender: TObject);
begin
  LogEnabled := LogAktivCB.Checked;
end;

//------------------------------------------------------------------------------

end.

