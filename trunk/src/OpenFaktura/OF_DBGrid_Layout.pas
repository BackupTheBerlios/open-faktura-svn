{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zum Modifizieren der sichtbaren Spalten in einem DbGrid    }
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
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt                          }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_DBGrid_Layout;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBGrids;

type
  TVisibleSpaltenForm = class(TForm)
    StatusBar1: TStatusBar;
    lv: TListView;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    g: TDBGrid;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    procedure UpdateTable (var grid: TDBGrid);
  end;

var
  VisibleSpaltenForm: TVisibleSpaltenForm;

implementation

uses
  GNUGetText;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TVisibleSpaltenForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent(self);  
  except 
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;                  

//------------------------------------------------------------------------------
procedure TVisibleSpaltenForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 245;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 340;
    ptMaxTrackSize.y := screen.height;
  end;
end;       

//------------------------------------------------------------------------------
procedure TVisibleSpaltenForm.UpdateTable (var grid: TDBGrid);
var 
  i: integer;
  item: TListItem;
begin
  g := grid;
  lv.items.clear;
  for i := 0 to g.columns.Count-1 do
  begin
    item := lv.items.add;
    item.caption := g.columns.Items[i].Title.Caption;
    item.checked := g.columns.Items[i].Visible;
    item.imageindex := i;
  end;
  ShowModal;
end;     

//------------------------------------------------------------------------------
procedure TVisibleSpaltenForm.BitBtn1Click(Sender: TObject);
var 
  i: integer;
  item: tListItem;
begin
  for i := 0 to lv.items.count-1 do
  begin
    item := lv.items[i];
    g.Columns.items[i].Visible       := item.checked;
    g.Columns.items[i].Title.Caption := item.caption;
  end;
  Close;
end;

//------------------------------------------------------------------------------

end.

