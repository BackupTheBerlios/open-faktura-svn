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
  -

  ISSUES, NOTES:
  -

  HISTORY:
  dd.mm.yyyy - nn:

*******************************************************************************)
unit uOF_DBServer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

  //Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  //Dialogs, ZSqlProcessor, ZDataset, ,
  //OFSecurity, OF_Var_Const,
  //resource, versiontypes, versionresource, DB;

type

  { TDBServerConnecton }

  TDBServerConnecton = class(TZConnection)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CheckMandantUser: boolean;
  end;

function OFDBServer: TDBServerConnecton;

implementation

var
  FOFDBServer: TDBServerConnecton = nil;

function OFDBServer: TDBServerConnecton;
begin
  if FOFDBServer = nil then
    FOFDBServer := TDBServerConnecton.Create(nil);
  Result := FOFDBServer;
end;

{ TDBServerConnecton }

constructor TDBServerConnecton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDBServerConnecton.Destroy;
begin
  inherited Destroy;
end;

function TDBServerConnecton.CheckMandantUser: boolean;
begin

end;

initialization

finalization
  FreeAndNil(FOFDBServer);

end.

