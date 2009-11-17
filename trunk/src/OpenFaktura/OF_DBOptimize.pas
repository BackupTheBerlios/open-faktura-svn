{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zum Prüfen, Optimieren und Reparieren der MySQL-Datenbank  }
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
{ 13.07.2003 - Bug in Tabellenauflistung (SQL) entfernt                        }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_DBOptimize;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons, ExtCtrls,
  ComCtrls;

type
  TDBForm = class(TForm)
    StatusBar1: TStatusBar;
    StatusDS: TDataSource;
    Status: TZQuery;
    SrvStatusGrid: TJvDBGrid;
    PruefBtn: TBitBtn;
    OptBtn: TBitBtn;
    RepBtn: TBitBtn;
    StatusTable: TStringField;
    StatusOp: TStringField;
    StatusMsg_type: TStringField;
    StatusMsg_text: TStringField;
    Panel1: TPanel;
    procedure PruefBtnClick(Sender: TObject);
    procedure OptBtnClick(Sender: TObject);
    procedure RepBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    SQL: String; // Namen der Tabellen in der DB
  public
    { Public-Deklarationen }
  end;
    
    //var
    //  DBForm: TDBForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM;
  
//------------------------------------------------------------------------------
procedure TDBForm.FormCreate(Sender: TObject);
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
procedure TDBForm.FormShow(Sender: TObject);
var 
  FN: string;
begin
  FN := 'TABLES_IN_' + DM1.DB1.DataBase;
  DM1.UniQuery.Close;
  DM1.UniQuery.Sql.Clear;
  DM1.UniQuery.SQL.Add ('SHOW TABLES');
  DM1.UniQuery.Open;
  SQL := '';
  while not DM1.UniQuery.Eof do
  begin
    if Length(SQL)>0 then 
      SQL := SQL + ', ';
    SQL := SQL + DM1.UniQuery.FieldByName(FN).AsString;
    DM1.UniQuery.Next;
  end;
  DM1.UniQuery.Close;

  PruefBtnClick(Sender);
end;

//------------------------------------------------------------------------------
procedure TDBForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Status.Active then 
    Status.Close;
end;

//------------------------------------------------------------------------------
procedure TDBForm.PruefBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.SQL.Add ('CHECK TABLE');
  Status.SQL.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------
procedure TDBForm.OptBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.SQL.Add ('FLUSH TABLES');
  Status.ExecSql;

  Status.Close;
  Status.Sql.Clear;
  Status.SQL.Add ('OPTIMIZE TABLE');
  Status.SQL.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------
procedure TDBForm.RepBtnClick(Sender: TObject);
begin
  Status.Close;
  Status.Sql.Clear;
  Status.SQL.Add ('FLUSH TABLES');
  Status.ExecSql;

  Status.Close;
  Status.Sql.Clear;
  Status.SQL.Add ('REPAIR TABLE');
  Status.SQL.Add (SQL);
  Status.Open;
end;
//------------------------------------------------------------------------------

end.

