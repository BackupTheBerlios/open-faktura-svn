{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Include-Datei zur bedingten Compilierung                          }
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
{ 17.12.2009 - UD: Compiler Direktiven angepasst                               }
{                                                                              }
{******************************************************************************}


{_$DEFINE FREEREPORT}      // Code für FreeReport einbinden.

{_$DEFINE AVE}

{_$DEFINE WITHHELP}         // Integration des Hilfesystems einschalten


//------------------------------------------------------------------------------
// Nachfolgende Einstellungen wurden noch nicht bearbeitet !!!
{_$DEFINE PRO}             // Pro-Version
{_$DEFINE ALPHA}           // APLHA-Code mitcompilieren
{_$DEFINE MULTILANG}       // Code für Mehrsprachigkeit verwenden
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// AB HIER NICHTS VERÄNDERN !!!
//------------------------------------------------------------------------------

{$IFDEF REPORTBUILDER}
  {$DEFINE WITH_REPORT}
{$ELSE}
  {$IFDEF FREEREPORT}
    {$DEFINE WITH_REPORT}
  {$ENDIF}
{$ENDIF}


// VER100 - Delphi 3
// VER120 - Delphi 4

// VER130 - Delphi 5
{$IFDEF VER130}
  {$DEFINE COMPILER_D5}
  {$DEFINE COMPILER_D5_UP}
{$ENDIF}

// VER140 - Delphi 6
{$IFDEF VER140}
  {$DEFINE COMPILER_D6}
  {$DEFINE COMPILER_D6_UP}                    
{$ENDIF}

// VER150 - Delphi 7
{$IFDEF VER150}
  {$DEFINE COMPILER_D7}
  {$DEFINE COMPILER_D7_UP}
{$ENDIF}

// VER160 - Delphi 8
{$IFDEF VER160}
  {$DEFINE COMPILER_D8}
  {$DEFINE COMPILER_D8_UP}
{$ENDIF}

// VER170 - Delphi 2005
{$IFDEF VER170}
  {$DEFINE COMPILER_D2005}
  {$DEFINE COMPILER_D2005_UP}
{$ENDIF}

// VER180 - Delphi 2006
{$IFDEF VER180}
  {$DEFINE COMPILER_D2006}
  {$DEFINE COMPILER_D2006_UP}
{$ENDIF}


{$IFDEF COMPILER_D5}
  {$DEFINE COMPILER_D5_UP}
{$ENDIF}

{$IFDEF COMPILER_D6}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
{$ENDIF}

{$IFDEF COMPILER_D7}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
  {$DEFINE COMPILER_D7_UP}
{$ENDIF}

{$IFDEF COMPILER_D8}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
  {$DEFINE COMPILER_D7_UP}
  {$DEFINE COMPILER_D8_UP}
{$ENDIF}

{$IFDEF COMPILER_D2005}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
  {$DEFINE COMPILER_D7_UP}
  {$DEFINE COMPILER_D8_UP}
  {$DEFINE COMPILER_D2005_UP}
{$ENDIF}

{$IFDEF COMPILER_D2006}
  {$DEFINE COMPILER_D5_UP}
  {$DEFINE COMPILER_D6_UP}
  {$DEFINE COMPILER_D7_UP}
  {$DEFINE COMPILER_D8_UP}
  {$DEFINE COMPILER_D2005_UP}
  {$DEFINE COMPILER_D2006_UP}
{$ENDIF}

//------------------------------------------------------------------------------

{$IFDEF AVE}
  {$DEFINE PRO}
{$ENDIF}


{$O-} // keine Optimierung
{$R-} // keine Bereichsprüfung
{$Q-} // keine Überlaufprüfung
{$B-} // Boolsche Ausdrücke nicht vollständig

//------------------------------------------------------------------------------
