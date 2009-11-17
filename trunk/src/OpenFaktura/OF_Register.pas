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
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Register;

interface

uses classes;
  
  function CheckRegister (Sender: tComponent; ShowDialog: Boolean): Boolean;
  function GetSerialNum : String;
  procedure CheckRegister2;
  procedure CheckRegister3;
  procedure CheckRegister4;
  
implementation

function CheckRegister (Sender: tComponent; ShowDialog: Boolean): Boolean;
begin
  Result := True;
end;

function GetSerialNum : String;
begin
  Result := '---';
end;

procedure CheckRegister2;
begin
  //
end;

procedure CheckRegister3;
begin
  //
end;

procedure CheckRegister4;
begin
  //
end;

end.
