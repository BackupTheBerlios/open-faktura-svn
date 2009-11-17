{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : allg. Funktionen für die Plugin-Einbindung.                       }
{            diese Unit wird nur vom Programm (nicht von der Plugin-DLL) verwendet }
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
{ 01.03.2004 - JP                                                              }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Plugin_Func;

interface

uses
  Windows, OF_Plugin_Def, OF_DM;
  
function GetCaoRegistryFunc: tCaoRegistry;
  
implementation

var 
  GlobalCaoRegistry: tCaoRegistry;
  S: String; // glob. String, wichtig, da Rückgabewerte vom Typ PChar
  // hier nur einen Pointer auf eine Variable übergeben
  

//------------------------------------------------------------------------------
// Die Folgenden Funktionen dienen als Wrapper-Funktionen um aus einer
// Plugin-DLL einen Zugriff auf die SQL-Registry von CAO u erhalten
//------------------------------------------------------------------------------
procedure SqlRegWriteString (Key, Name, Value: PChar); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteString (Key, Name, Value);
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteStringU (Key, Name, Value: PChar); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteStringU (Key, Name, Value);
end;

//------------------------------------------------------------------------------
function SqlRegReadString (Key, Name, Default: PChar): PChar; stdcall;
begin
  S := Default;
  if assigned(DM1) then 
    S := DM1.ReadString (Key, Name, Default);
  S := S + #0;
  Result := PChar(@S[1]);
end;

//------------------------------------------------------------------------------
function SqlRegReadStringU (Key, Name, Default: PChar): PChar; stdcall;
begin
  S := Default;
  if assigned(DM1) then 
    S := DM1.ReadStringU (Key, Name, Default);
  S := S + #0;
  Result := @S[1];
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteLongString (Key, Name, Value: PChar); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteLongString (Key, Name, Value);
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteLongStringU (Key, Name, Value: PChar); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteLongStringU (Key, Name, Value);
end;

//------------------------------------------------------------------------------
function SqlRegReadLongString (Key, Name, Default: PChar): PChar; stdcall;
begin
  S := Default;
  if assigned(DM1) then 
    S := DM1.ReadLongString (Key, Name, Default);
  S := S + #0;
  Result := @S[1];
end;

//------------------------------------------------------------------------------
function SqlRegReadLongStringU      (Key, Name, Default: PChar): PChar; stdcall;
begin
  S := Default;
  if assigned(DM1) then 
    S := DM1.ReadLongStringU (Key, Name, Default);
  S := S + #0;
  Result := @S[1];
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteBoolean (Key, Name: PChar; Value: Boolean); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteBoolean (Key, Name, Value);
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteBooleanU (Key, Name: PChar; Value: Boolean); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteBooleanU (Key, Name, Value);
end;

//------------------------------------------------------------------------------
function SqlRegReadBoolean (Key, Name: PChar; Default: Boolean): Boolean; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadBoolean (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
function SqlRegReadBooleanU (Key, Name: PChar; Default: Boolean): Boolean; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadBooleanU (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteInteger (Key, Name: PChar; Value: Integer); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteInteger (Key, Name, Value);
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteIntegerU (Key, Name: PChar; Value: Integer); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteIntegerU (Key, Name, Value);
end;
//------------------------------------------------------------------------------
function SqlRegReadInteger (Key, Name: PChar; Default: Integer): Integer; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadInteger (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
function SqlRegReadIntegerU (Key, Name: PChar; Default: Integer): Integer; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadIntegerU (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteDouble (Key, Name: PChar; Value: Double); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteDouble (Key, Name, Value);
end;

//------------------------------------------------------------------------------
procedure SqlRegWriteDoubleU (Key, Name: PChar; Value: Double); stdcall;
begin
  if assigned(DM1) then 
    DM1.WriteDoubleU (Key, Name, Value);
end;

//------------------------------------------------------------------------------
function SqlRegReadDouble (Key, Name: PChar; Default: Double): Double; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadDouble (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
function SqlRegReadDoubleU (Key, Name: PChar; Default: Double): Double; stdcall;
begin
  if assigned(DM1) then 
    Result := DM1.ReadDoubleU (Key, Name, Default)
  else 
    Result := Default;
end;

//------------------------------------------------------------------------------
// globales Array mit Funktionspointern erzeugen
//------------------------------------------------------------------------------
function GetCaoRegistryFunc: tCaoRegistry;
begin
  GlobalCaoRegistry.ReadBoolean       := SqlRegReadBoolean;
  GlobalCaoRegistry.ReadBooleanU      := SqlRegReadBooleanU;
  GlobalCaoRegistry.ReadDouble        := SqlRegReadDouble;
  GlobalCaoRegistry.ReadDoubleU       := SqlRegReadDoubleU;
  GlobalCaoRegistry.ReadInteger       := SqlRegReadInteger;
  GlobalCaoRegistry.ReadIntegerU      := SqlRegReadIntegerU;
  GlobalCaoRegistry.ReadLongString    := SqlRegReadLongString;
  GlobalCaoRegistry.ReadLongStringU   := SqlRegReadLongStringU;
  GlobalCaoRegistry.ReadString        := SqlRegReadString;
  GlobalCaoRegistry.ReadStringU       := SqlRegReadStringU;

  GlobalCaoRegistry.WriteBoolean      := SqlRegWriteBoolean;
  GlobalCaoRegistry.WriteBooleanU     := SqlRegWriteBooleanU;
  GlobalCaoRegistry.WriteDouble       := SqlRegWriteDouble;
  GlobalCaoRegistry.WriteDoubleU      := SqlRegWriteDoubleU;
  GlobalCaoRegistry.WriteInteger      := SqlRegWriteInteger;
  GlobalCaoRegistry.WriteIntegerU     := SqlRegWriteIntegerU;
  GlobalCaoRegistry.WriteLongString   := SqlRegWriteLongString;
  GlobalCaoRegistry.WriteLongStringU  := SqlRegWriteLongStringU;
  GlobalCaoRegistry.WriteString       := SqlRegWriteString;
  GlobalCaoRegistry.WriteStringU      := SqlRegWriteStringU;

  Result := GlobalCaoRegistry;
end;

//------------------------------------------------------------------------------
// INIT
//------------------------------------------------------------------------------
begin
  // glob. Variablen mit nil initialisieren

  GlobalCaoRegistry.ReadBoolean       := nil;
  GlobalCaoRegistry.ReadBooleanU      := nil;
  GlobalCaoRegistry.ReadDouble        := nil;
  GlobalCaoRegistry.ReadDoubleU       := nil;
  GlobalCaoRegistry.ReadInteger       := nil;
  GlobalCaoRegistry.ReadIntegerU      := nil;
  GlobalCaoRegistry.ReadLongString    := nil;
  GlobalCaoRegistry.ReadLongStringU   := nil;
  GlobalCaoRegistry.ReadString        := nil;
  GlobalCaoRegistry.ReadStringU       := nil;

  GlobalCaoRegistry.WriteBoolean      := nil;
  GlobalCaoRegistry.WriteBooleanU     := nil;
  GlobalCaoRegistry.WriteDouble       := nil;
  GlobalCaoRegistry.WriteDoubleU      := nil;
  GlobalCaoRegistry.WriteInteger      := nil;
  GlobalCaoRegistry.WriteIntegerU     := nil;
  GlobalCaoRegistry.WriteLongString   := nil;
  GlobalCaoRegistry.WriteLongStringU  := nil;
  GlobalCaoRegistry.WriteString       := nil;
  GlobalCaoRegistry.WriteStringU      := nil;
end.

//------------------------------------------------------------------------------
