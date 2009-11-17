{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Plugin-Einbindung                                                 }
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
{ - bindet externe DLLs ein, z.B. die Such-DLL. Wird in Open-Faktura komplett  }
{   ersetzt!                                                                   }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Plugin_Def;

interface

uses
  Windows;
  
Const
  // dient vor allem als Information in welches Menue die Funktion
  // eingefügt wird.
  ARTIKEL_PLUGIN   : Integer = 100;
  ADRESS_PLUGIN    : Integer = 200;
  
  // dient als Info von welchem Programmteil das Plugin
  // aufgerufen wurde
  ARTIKEL_SUCHE_CMD: Integer = 110;
  ADRESS_SUCHE_CMD : Integer = 210;
  
  
// diese Daten ruft das Hauptprogramm mit GetInfo ab
type
  TPlugInfo = record
    Name   : PChar;    // Plugin-Name (freie Bezeichnung)
    APP    : PChar;    // hier muss "CAO" stehen
    Id     : Integer;  // ID der DLL bzw. des Plugins
    Autor  : PChar;    // Name des Entwicklers
    About  : PChar;    // Info
  end;
  
  TPlunginFunktionInfo = record
    Typ    : integer;  // ARTIKEL_PLUGIN oder ADRESS_PLUGIN
    Cmd    : integer;
    Caption: PChar;    // Menuetext
  end;
    
  // Diese Daten werden vom Programm an das Plugin beim
  // Aufruf der ExecuteCmd-Funktion übergebén
    
  TDBInfo = record
    Host: PChar;
    Database : PChar;
    Login: PChar;
    Password: PChar;
    Fkt : Integer;  //ARTIKEL_CMD oder ADRESS_CMD
    Rec_Id: Integer;  // Datensatznummer
  end;
    
  // Diese Funktionen müssen im Plugin implementiert sein
  // GetInfo wird beim Start des Main aufgerufen
  TCaoPluginInfo = function (var Info: Array of TPlunginFunktionInfo): TPluginfo; StdCall;
    
  // ExecuteCmd wird beim Aktivieren des Menues aufgerufen
  // Wenn der Result-String nicht leer ist wird eine select
  // Anweisung ausgeführt un der Result-Teil als where-Clausel
  // angehängt
  TOFPluginExecCmd = function(Typ, Cmd, Rechte: Integer; var Res: PChar): Boolean; StdCall;
  
  //Hilfsfunktionen um aus der DLL auf die SQL-Registry von CAO zuzugreifen
  tSqlRegWriteString       = procedure (Key, Name, Value: PChar); stdcall;
  tSqlRegReadString        = function  (Key, Name, Default: PChar): PCHar; stdcall;
  tSqlRegWriteBoolean      = procedure (Key, Name: PChar; Value: Boolean); stdcall;
  tSqlRegReadBoolean       = function  (Key, Name: PChar; Default: Boolean): Boolean; stdcall;
  tSqlRegWriteInteger      = procedure (Key, Name: PChar; Value: Integer); stdcall;
  tSqlRegReadInteger       = function  (Key, Name: PChar; Default: Integer): Integer; stdcall;
  tSqlRegWriteDouble       = procedure (Key, Name: PChar; Value: Double); stdcall;
  tSqlRegReadDouble        = function  (Key, Name: PChar; Default: Double): Double; stdcall;
  tSqlRegWriteLongString   = procedure (Key, Name, Value: PChar); stdcall;
  tSqlRegReadLongString    = function  (Key, Name, Default: PChar): PCHar; stdcall;
  
  tSqlRegWriteStringU      = procedure (Key, Name, Value: PChar); stdcall;
  tSqlRegReadStringU       = function  (Key, Name, Default: PChar): PCHar; stdcall;
  tSqlRegWriteBooleanU     = procedure (Key, Name: PChar; Value: Boolean); stdcall;
  tSqlRegReadBooleanU      = function  (Key, Name: PChar; Default: Boolean): Boolean; stdcall;
  tSqlRegWriteIntegerU     = procedure (Key, Name: PChar; Value: Integer); stdcall;
  tSqlRegReadIntegerU      = function  (Key, Name: PChar; Default: Integer): Integer; stdcall;
  tSqlRegWriteDoubleU      = procedure (Key, Name: PChar; Value: Double); stdcall;
  tSqlRegReadDoubleU       = function  (Key, Name: PChar; Default: Double): Double; stdcall;
  tSqlRegWriteLongStringU  = procedure (Key, Name, Value: PChar); stdcall;
  tSqlRegReadLongStringU   = function  (Key, Name, Default: PChar): PCHar; stdcall;
  
  tCaoRegistry = Record
    WriteString        : tSqlRegWriteString;
    ReadString         : tSqlRegReadString;
    WriteBoolean       : tSqlRegWriteBoolean;
    ReadBoolean        : tSqlRegReadBoolean;
    WriteInteger       : tSqlRegWriteInteger;
    ReadInteger        : tSqlRegReadInteger;
    WriteDouble        : tSqlRegWriteDouble;
    ReadDouble         : tSqlRegReadDouble;
    WriteLongString    : tSqlRegWriteLongString;
    ReadLongString     : tSqlRegReadLongString;
    
    WriteStringU       : tSqlRegWriteStringU;
    ReadStringU        : tSqlRegReadStringU;
    WriteBooleanU      : tSqlRegWriteBooleanU;
    ReadBooleanU       : tSqlRegReadBooleanU;
    WriteIntegerU      : tSqlRegWriteIntegerU;
    ReadIntegerU       : tSqlRegReadIntegerU;
    WriteDoubleU       : tSqlRegWriteDoubleU;
    ReadDoubleU        : tSqlRegReadDoubleU;
    WriteLongStringU   : tSqlRegWriteLongStringU;
    ReadLongStringU    : tSqlRegReadLongStringU;
  end;
    
  // Diese Funktion wird von CAO aus aufgerufen um der DLL zu initialisieren
  // und einen Record mit allesn Funktionen der CAO-Registry zu übergeben
  TOFPluginInit = procedure (Mandant: PChar; CaoRegistry: tCaoRegistry); stdcall;
    
implementation

end.
