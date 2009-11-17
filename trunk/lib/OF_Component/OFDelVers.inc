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


//------------------------------------------------------------------------------

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

