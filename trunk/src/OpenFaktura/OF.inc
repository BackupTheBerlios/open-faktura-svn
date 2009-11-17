{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Include-Datei zur bedingten Compilierung                          }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  geh�rt zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung f�r irgendeinen Zweck ver�ffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code ( based on the sources of CAO-Faktura, see above ) is part }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id:$ }
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


{_$DEFINE FREEREPORT}      // Code f�r FreeReport einbinden.

{_$DEFINE AVE}

{_$DEFINE WITHHELP}         // Integration des Hilfesystems einschalten


//------------------------------------------------------------------------------
// Nachfolgende Einstellungen wurden noch nicht bearbeitet !!!
{_$DEFINE PRO}             // Pro-Version
{_$DEFINE ALPHA}           // APLHA-Code mitcompilieren
{_$DEFINE MULTILANG}       // Code f�r Mehrsprachigkeit verwenden
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// AB HIER NICHTS VER�NDERN !!!
//------------------------------------------------------------------------------

{$IFDEF REPORTBUILDER}
  {$DEFINE WITH_REPORT}
{$ELSE}
  {$IFDEF FREEREPORT}
    {$DEFINE WITH_REPORT}
  {$ENDIF}
{$ENDIF}


{$IFDEF VER150}
  {$DEFINE COMPILER_D7}
  {$DEFINE COMPILER_D7_UP}
{$ENDIF}                           

{$IFDEF VER140}
  {$DEFINE COMPILER_D6}
  {$DEFINE COMPILER_D6_UP}                    
{$ENDIF}

{$IFDEF VER130}
  {$DEFINE COMPILER_D5}
  {$DEFINE COMPILER_D5_UP}
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

//------------------------------------------------------------------------------

{$IFDEF AVE}
  {$DEFINE PRO}
{$ENDIF}


{$O-} // keine Optimierung
{$R-} // keine Bereichspr�fung
{$Q-} // keine �berlaufpr�fung
{$B-} // Boolsche Ausdr�cke nicht vollst�ndig

