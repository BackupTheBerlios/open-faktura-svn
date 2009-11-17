{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Grundmodul, welches alle anderen Module in die Oberfläche einbindet }
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
{ 18.05.2003 - Unit erstellt }
{ 26.06.2003 - Rabatte werden jetzt mit einer Nachkommastelle angezeigt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_RabGrp;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, DBCtrls, ExtCtrls,
  ComCtrls;
{
uses
  JvDBCtrl,
  JvComponent
}
type
  TRabGrpForm = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    LiefRGDS: TDataSource;
    LiefRGGrid: TOFDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    KunRGGrid: TOFDBGrid;
    KunRGDS: TDataSource;
    LiefRabGrp: TZQuery;
    LiefRabGrpRABGRP_ID: TStringField;
    LiefRabGrpRABGRP_TYP: TIntegerField;
    LiefRabGrpMIN_MENGE: TIntegerField;
    LiefRabGrpLIEF_RABGRP: TIntegerField;
    LiefRabGrpRABATT1: TFloatField;
    LiefRabGrpRABATT2: TFloatField;
    LiefRabGrpRABATT3: TFloatField;
    LiefRabGrpADDR_ID: TIntegerField;
    LiefRabGrpBESCHREIBUNG: TStringField;
    KunRabGrp: TZQuery;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    KunRabGrpRABGRP_ID: TStringField;
    KunRabGrpRABGRP_TYP: TIntegerField;
    KunRabGrpMIN_MENGE: TIntegerField;
    KunRabGrpLIEF_RABGRP: TIntegerField;
    KunRabGrpRABATT1: TFloatField;
    KunRabGrpRABATT2: TFloatField;
    KunRabGrpRABATT3: TFloatField;
    KunRabGrpADDR_ID: TIntegerField;
    KunRabGrpBESCHREIBUNG: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LiefRabGrpBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure LiefRabGrpAfterScroll(DataSet: TDataSet);
    procedure KunRabGrpNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
    
    //var RabGrpForm: TRabGrpForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM; 

  //------------------------------------------------------------------------------
procedure TRabGrpForm.FormCreate(Sender: TObject);
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
procedure TRabGrpForm.FormShow(Sender: TObject);
var 
  i: integer;
begin
  LiefRabGrp.Open;
  KunRabGrp.Open;
  KunRGGrid.RowColor1  := DM1.C2Color;
  LiefRGGrid.RowColor1 := DM1.C2Color;
  KunRGGrid.EditColor  := DM1.EditColor;
  LiefRGGrid.EditColor := DM1.EditColor;

  KunRabGrpLIEF_RABGRP.MaxValue := DM1.AnzPreis-1;

  KunRGGrid.Columns[2].PickList.Clear;
  for i := 1 to DM1.AnzPreis-1 do
  begin
    KunRGGrid.Columns[2].PickList.Add (IntToStr(I));
  end;
end;

//------------------------------------------------------------------------------
procedure TRabGrpForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  LiefRabGrp.Close;
  KunRabGrp.Close;
end;

//------------------------------------------------------------------------------
procedure TRabGrpForm.LiefRabGrpBeforePost(DataSet: TDataSet);
begin
  LiefRabGrpRABGRP_TYP.AsInteger := 5;
end;

//------------------------------------------------------------------------------
procedure TRabGrpForm.LiefRabGrpAfterScroll(DataSet: TDataSet);
//------------------------------------------------------------------------------
begin
  KunRabGrp.Close;
  KunRabGrp.ParamByName('RABGRP_ID').AsString := LiefRabGrpRABGRP_ID.AsString;
  KunRabGrp.Open;
  KunRabGrp.ReadOnly := LiefRabGrp.RecordCount = 0;
  //KunRabGrpLIEF_RABGRP.AsInteger :=1;
end;

//------------------------------------------------------------------------------
procedure TRabGrpForm.KunRabGrpNewRecord(DataSet: TDataSet);
begin
  KunRabGrpRABGRP_TYP.AsInteger := 3;
  KunRabGrpRABGRP_ID.AsString := LiefRabGrpRABGRP_ID.AsString;
  KunRabGrpBESCHREIBUNG.AsString := LiefRabGrpBESCHREIBUNG.AsString;
  KunRabGrpLIEF_RABGRP.AsInteger := 1;
end;

//------------------------------------------------------------------------------

end.

