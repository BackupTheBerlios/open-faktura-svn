{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : nichtvisuelles Datenmodul mit Grundfunktionen für das Programm:   }
{            - Öffnen eines Mandanten (Datenbank im MySQL-Server)              }
{            - Anlage einer neuen Datenbank mit allen Tabellen + Formularen    }
{            - Zugriff auf die SQL-Registry (ReadString, WriteString etc.)     }
{            - Lesen und Wiederherstellen von Tabellenlayouts (tDBGrid)        }
{            - Stornieren von Vorgängen                                        }
{            - CalcLeitWaehrung rechnet beliebige Währung in Leitwährung um    }
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
{ 13.01.2003 JP - Version 1.0.0.48 released Jan Pokrandt
{ 17.01.2003 JP - Code für Einbindung der Formulare bei anlage eines neuen Mandanten
{                 implementiert ( Formulare aus Datei formulare.cao )
{ 20.01.2003 JP - DB-SQL-Code für aktuelle Version der DB (1.03) angepaßt
{               - RX-Komponenten durch JEDI-VCL-Komponenten ersetzt
{ 12.02.2003 JP - Fehler beim Storno von Belegen gefixt
{ 14.03.2003 JP - Bug in Fkt. Buche_Einkauf entfernt
{                 (EK-Preis im Artikelstammm wurde nach Einführung der Rabattgruppen
{                 nicht mehr korrekt gesetzt)
{            JP - neue Funktion "CalcRabGrpPreis" erstellt, die den EK-Preis bei
{                 Übergabe des VK-Preises bei Artikeln mit Rabattgruppe errechnet
{ 10.05.2003 JP - neue Tabelle Firma hinzugefügt, in der sich nur 1 DS mit den
{                 aktuellen Firmendaten für die Formulare befindet
{               - Funktion Buche_Einkauf erweitert, damit der Status der Bestellungen
{                 korrekt aktualisiert wird.
{ 11.05.2003 JP - neue Routine zum ermitteln der SQL-Benutzerrechte
{                 Routinen zum öffnen, erzeugen und updaten eines Mandanten verbessert
{                 bei zu wenigen Benutzerrechten wird jetzt mit einer Fehlermeldung
{                 abgebrochen
{               - Registry-Funktionen brechen jetzt sofort ab, wenn die DB nicht
{                 connected ist
{ 26.05.2003 JP - Rabattgruppen um VK-Gruppen erweitert
{ 31.05.2003 JP - neue Funktion zur aktualisierung der Artikelfelder MENGE_xxx_EDI
{               - Funktionen Buche_xxxxx überarbeitet, damit die MENGE_xxx_EDI korrekt
{                 aktualisiert werden
{ 01.07.2003 JP - Fehler beim Storno VK mit Barzahlung beseitigt
{               - Bug #18 Default '0' aus allen Create anweisungen entfernt
{               - Port für MySQL-Server wird jetzt aus der .cfg gelesen
{ 13.07.2003 JP - Code für Speichern der Mandantentabelle hinzugefügt
{               - Code zum einfügen eines neuen Mandanten hinzugefügt
{               - Code für Backup + Restore entfernt (jetzt eigene Unit CAO_BACKUP.pas
{ 27.07.2003 JP - 2 neue Funktionen zum Export vonb Datasets hinzugefügt
{ 30.07.2003 JP - neue DB-Version 1.07 eingebaut
{               - Bug in Funktion CalcRabGrpPreis beseitigt
{               - 2 neue Routinen zum Laden und Speichern von Langtexten in die
{                 SQL-Registry hinzugefügt
{ 20.08.2003 JP - Beim Buchen von Rechnungen werden jetzt die Stücklisten-Artikel
{                 mit Artikeltyp "Z" in die Rechnung als Unterartikel eingefügt
{ 21.10.2003 JP - Automatisches Update für PLZ und BLZ eingebaut, dafür vird die
{                 Version aus der .CFG-Datei mit der internen Version verglichen und
{                 dann ggf. die PLZ/BLZ gelöscht und neu eingelesen
{ 16.11.2003 JP - Mandant-Löschen Funktion hinzugefügt
{ 02.12.2003 JP - neue Funktion IncNummerStr erstellt, welche eine Nummer aus einem
{                 best. Nummernkreis mit hilfe des Nummernformates erzeugt
{ 06.12.2003 JP - SQL-Paßwort wird jetzt verschlüsselt abgelegt
{ 13.02.2004 JP - beim Storno von VK-Rechnungen werden jetzt auch Stücklistenartikel
{                 korrekt zurückgebucht
{ 14.05.2004 JP - Beim Buchen von EK-Rechnungen werden jetzt die VK's berechnet,
{                 wenn Kalkulationsfaktoren mit im Spiel sind
{ 20.05.2004 JP - Flag LINUX hinzugefügt, das per Kommandozeile gesetzt werden kann
{ 23.10.2004 JP - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)
{ 07.11.2004 JP - Bugfix #130 / Routine "GetBankverbindung"
{ 04.12.2004 JP - beim Erstellen einer neuen DB werden die fehlerhaften SQL-Befehle
{                 mit Antwort in die Datei db_create_110_yyyy_mm_dd_hh_mm_ss.log
{                 geschrieben
{               - beim Update einer DB werden die fehlerhaften SQL-Befehle mit
{                 Antwort in die Datei db_update_110_yyyy_mm_dd_hh_mm_ss.log
{                 geschrieben
{ 11.03.2005 NH - Staffelpreise bei Artikelpreisberechnung für Nettoberechnung
{ 16.05.2005 KL - Stadium bei Vorauskasse war 22 falsch wird jetzt 20
{ 25.05.2005 KL - Kfz Gruppenwahl aus Registry
{ 15.07.2005 NH - Neue Funktion "GetLagerMenge" zum vereinfachten Lesen der
{                 aktuellen Artikelmenge erstellt.
{ 15.07.2005 NH - Neue Funktion "GetJournalPosMenge" zum vereinfachten Lesen der
{                 aktuellen Artikelmenge in der Tabelle JournalPos.
{ 10.10.2005 NH - Staffelpreisberechnung für Brutto und Netto eingeführt
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_DM;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, JvComponentBase, JvCipher, ZSqlProcessor,
  JvStringHolder, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, DBGrids, OF_Var_Const, OFSecurity;
  (*
  JvComponent,
  *)

type
  TEkUpdateTyp = (ekuNoUpdate, ekuNewPreis, ekuMittel);

type
  TWgrFaktorCache = Record
    Wgr:  integer;
    FTab: array [1..5] of Double;
  end;

type
  TDM1 = class(TDataModule)
    LandDS: TDataSource;
    WhrungDS: TDataSource;
    WgrDS: TDataSource;
    LiefArtDS: TDataSource;
    ZahlArtDS: TDataSource;
    VertreterDS: TDataSource;
    JourTab: TZQuery;
    JourTabQUELLE: TIntegerField;
    JourTabREC_ID: TIntegerField;
    JourTabVRENUM: TStringField;
    JourTabKM_STAND: TIntegerField;
    JourTabRDATUM: TDateField;
    JourTabNSUMME: TFloatField;
    JourTabMSUMME: TFloatField;
    JourTabBSUMME: TFloatField;
    JourTabWAEHRUNG: TStringField;
    JourTabSTADIUM: TIntegerField;
    JourTabKUN_NAME1: TStringField;
    JourTabPROJEKT: TStringField;
    JourTabORGNUM: TStringField;
    JourTabADDR_ID: TIntegerField;
    JourTabKFZ_ID: TIntegerField;
    JPosTab: TZQuery;
    ZahlartTab: TZQuery;
    VertreterTab: TZQuery;
    LandTab: TZQuery;
    WhrungTab: TZQuery;
    WgrTab: TZQuery;
    NummerTab: TZQuery;
    NummerTabQUELLE: TIntegerField;
    KGRTab: TZQuery;
    KGRTabLANGBEZ: TStringField;
    KgrDS: TDataSource;
    KGRTabSQL_STATEMENT: TMemoField;
    KGRTabGR: TIntegerField;
    WhrungTabWAEHRUNG: TStringField;
    WhrungTabLANGBEZ: TStringField;
    WhrungTabFAKTOR: TFloatField;
    ZahlartTabZAHL_ID: TFloatField;
    ZahlartTabSKONTO_PROZ: TFloatField;
    ZahlartTabSKONTO_TAGE: TIntegerField;
    ZahlartTabLANGBEZ: TStringField;
    LiefArtTab: TZQuery;
    NummerTabFORMAT: TStringField;
    NummerTabMAINKEY: TStringField;
    RegTab: TZQuery;
    RegTabMAINKEY: TStringField;
    RegTabNAME: TStringField;
    RegTabVAL_CHAR: TStringField;
    RegTabVAL_DATE: TDateTimeField;
    RegTabVAL_INT: TIntegerField;
    RegTabVAL_DOUBLE: TFloatField;
    RegTabVAL_BLOB: TBlobField;
    RegTabVAL_BIN: TBlobField;
    RegTabVAL_TYP: TIntegerField;
    ArtMengeTab: TZQuery;
    JPosTabREC_ID: TIntegerField;
    JPosTabQUELLE: TIntegerField;
    JPosTabQUELLE_SUB: TIntegerField;
    JPosTabJOURNAL_ID: TIntegerField;
    JPosTabARTIKELTYP: TStringField;
    JPosTabARTIKEL_ID: TIntegerField;
    JPosTabADDR_ID: TIntegerField;
    JPosTabATRNUM: TIntegerField;
    JPosTabVRENUM: TStringField;
    JPosTabVLSNUM: TStringField;
    JPosTabPOSITION: TIntegerField;
    JPosTabMATCHCODE: TStringField;
    JPosTabARTNUM: TStringField;
    JPosTabBARCODE: TStringField;
    JPosTabMENGE: TFloatField;
    JPosTabLAENGE: TStringField;
    JPosTabGROESSE: TStringField;
    JPosTabDIMENSION: TStringField;
    JPosTabGEWICHT: TFloatField;
    JPosTabME_EINHEIT: TStringField;
    JPosTabPR_EINHEIT: TFloatField;
    JPosTabEPREIS: TFloatField;
    JPosTabE_RGEWINN: TFloatField;
    JPosTabRABATT: TFloatField;
    JPosTabSTEUER_CODE: TIntegerField;
    JPosTabALTTEIL_PROZ: TFloatField;
    JPosTabALTTEIL_STCODE: TIntegerField;
    JPosTabGEGENKTO: TIntegerField;
    JPosTabBEZEICHNUNG: TMemoField;
    JourTabZAHLART: TIntegerField;
    JourTabSOLL_STAGE: TIntegerField;
    JourTabSOLL_SKONTO: TFloatField;
    JourTabIST_ANZAHLUNG: TFloatField;
    JourTabIST_SKONTO: TFloatField;
    JourTabIST_ZAHLDAT: TDateField;
    JourTabIST_BETRAG: TFloatField;
    JourTabKONTOAUSZUG: TIntegerField;
    JourTabBANK_ID: TIntegerField;
    JourTabUW_NUM: TIntegerField;
    CpySrcKopfTab: TZQuery;
    CpyDstKopfTab: TZQuery;
    CpySrcPosTab: TZQuery;
    CpyDstPosTab: TZQuery;
    CpySrcKopfTabQUELLE: TIntegerField;
    CpySrcKopfTabREC_ID: TIntegerField;
    CpySrcKopfTabQUELLE_SUB: TIntegerField;
    CpySrcKopfTabADDR_ID: TIntegerField;
    CpySrcKopfTabATRNUM: TIntegerField;
    CpySrcKopfTabVRENUM: TStringField;
    CpySrcKopfTabVLSNUM: TStringField;
    CpySrcKopfTabFOLGENR: TIntegerField;
    CpySrcKopfTabKM_STAND: TIntegerField;
    CpySrcKopfTabKFZ_ID: TIntegerField;
    CpySrcKopfTabVERTRETER_ID: TIntegerField;
    CpySrcKopfTabGLOBRABATT: TFloatField;
    CpySrcKopfTabADATUM: TDateField;
    CpySrcKopfTabRDATUM: TDateField;
    CpySrcKopfTabLDATUM: TDateField;
    CpySrcKopfTabTermin: TDateField;
    CpySrcKopfTabPR_EBENE: TIntegerField;
    CpySrcKopfTabLIEFART: TIntegerField;
    CpySrcKopfTabZAHLART: TIntegerField;
    CpySrcKopfTabKOST_NETTO: TFloatField;
    CpySrcKopfTabWERT_NETTO: TFloatField;
    CpySrcKopfTabLOHN: TFloatField;
    CpySrcKopfTabWARE: TFloatField;
    CpySrcKopfTabTKOST: TFloatField;
    CpySrcKopfTabMWST_0: TFloatField;
    CpySrcKopfTabMWST_1: TFloatField;
    CpySrcKopfTabMWST_2: TFloatField;
    CpySrcKopfTabMWST_3: TFloatField;
    CpySrcKopfTabNSUMME: TFloatField;
    CpySrcKopfTabMSUMME_0: TFloatField;
    CpySrcKopfTabMSUMME_1: TFloatField;
    CpySrcKopfTabMSUMME_2: TFloatField;
    CpySrcKopfTabMSUMME_3: TFloatField;
    CpySrcKopfTabMSUMME: TFloatField;
    CpySrcKopfTabBSUMME: TFloatField;
    CpySrcKopfTabATSUMME: TFloatField;
    CpySrcKopfTabATMSUMME: TFloatField;
    CpySrcKopfTabWAEHRUNG: TStringField;
    CpySrcKopfTabGEGENKONTO: TIntegerField;
    CpySrcKopfTabSOLL_STAGE: TIntegerField;
    CpySrcKopfTabSOLL_SKONTO: TFloatField;
    CpySrcKopfTabSOLL_NTAGE: TIntegerField;
    CpySrcKopfTabSOLL_RATEN: TIntegerField;
    CpySrcKopfTabSOLL_RATBETR: TFloatField;
    CpySrcKopfTabSOLL_RATINTERVALL: TIntegerField;
    CpySrcKopfTabIST_ANZAHLUNG: TFloatField;
    CpySrcKopfTabIST_SKONTO: TFloatField;
    CpySrcKopfTabIST_ZAHLDAT: TDateField;
    CpySrcKopfTabIST_BETRAG: TFloatField;
    CpySrcKopfTabMAHNKOSTEN: TFloatField;
    CpySrcKopfTabKONTOAUSZUG: TIntegerField;
    CpySrcKopfTabBANK_ID: TIntegerField;
    CpySrcKopfTabSTADIUM: TIntegerField;
    CpySrcKopfTabERSTELLT: TDateField;
    CpySrcKopfTabERST_NAME: TStringField;
    CpySrcKopfTabKUN_ANREDE: TStringField;
    CpySrcKopfTabKUN_NAME1: TStringField;
    CpySrcKopfTabKUN_NAME2: TStringField;
    CpySrcKopfTabKUN_NAME3: TStringField;
    CpySrcKopfTabKUN_ABTEILUNG: TStringField;
    CpySrcKopfTabKUN_STRASSE: TStringField;
    CpySrcKopfTabKUN_LAND: TStringField;
    CpySrcKopfTabKUN_PLZ: TStringField;
    CpySrcKopfTabKUN_ORT: TStringField;
    CpySrcKopfTabUSR1: TStringField;
    CpySrcKopfTabUSR2: TStringField;
    CpySrcKopfTabPROJEKT: TStringField;
    CpySrcKopfTabORGNUM: TStringField;
    CpySrcKopfTabBEST_NAME: TStringField;
    CpySrcKopfTabBEST_CODE: TIntegerField;
    CpySrcKopfTabINFO: TMemoField;
    CpySrcKopfTabUW_NUM: TIntegerField;
    CpyDstKopfTabQUELLE: TIntegerField;
    CpyDstKopfTabREC_ID: TIntegerField;
    CpyDstKopfTabQUELLE_SUB: TIntegerField;
    CpyDstKopfTabADDR_ID: TIntegerField;
    CpyDstKopfTabATRNUM: TIntegerField;
    CpyDstKopfTabVRENUM: TStringField;
    CpyDstKopfTabVLSNUM: TStringField;
    CpyDstKopfTabFOLGENR: TIntegerField;
    CpyDstKopfTabKM_STAND: TIntegerField;
    CpyDstKopfTabKFZ_ID: TIntegerField;
    CpyDstKopfTabVERTRETER_ID: TIntegerField;
    CpyDstKopfTabGLOBRABATT: TFloatField;
    CpyDstKopfTabADATUM: TDateField;
    CpyDstKopfTabRDATUM: TDateField;
    CpyDstKopfTabLDATUM: TDateField;
    CpyDstKopfTabTermin: TDateField;
    CpyDstKopfTabPR_EBENE: TIntegerField;
    CpyDstKopfTabLIEFART: TIntegerField;
    CpyDstKopfTabZAHLART: TIntegerField;
    CpyDstKopfTabKOST_NETTO: TFloatField;
    CpyDstKopfTabWERT_NETTO: TFloatField;
    CpyDstKopfTabLOHN: TFloatField;
    CpyDstKopfTabWARE: TFloatField;
    CpyDstKopfTabTKOST: TFloatField;
    CpyDstKopfTabMWST_0: TFloatField;
    CpyDstKopfTabMWST_1: TFloatField;
    CpyDstKopfTabMWST_2: TFloatField;
    CpyDstKopfTabMWST_3: TFloatField;
    CpyDstKopfTabNSUMME: TFloatField;
    CpyDstKopfTabMSUMME_0: TFloatField;
    CpyDstKopfTabMSUMME_1: TFloatField;
    CpyDstKopfTabMSUMME_2: TFloatField;
    CpyDstKopfTabMSUMME_3: TFloatField;
    CpyDstKopfTabMSUMME: TFloatField;
    CpyDstKopfTabBSUMME: TFloatField;
    CpyDstKopfTabATSUMME: TFloatField;
    CpyDstKopfTabATMSUMME: TFloatField;
    CpyDstKopfTabWAEHRUNG: TStringField;
    CpyDstKopfTabGEGENKONTO: TIntegerField;
    CpyDstKopfTabSOLL_STAGE: TIntegerField;
    CpyDstKopfTabSOLL_SKONTO: TFloatField;
    CpyDstKopfTabSOLL_NTAGE: TIntegerField;
    CpyDstKopfTabSOLL_RATEN: TIntegerField;
    CpyDstKopfTabSOLL_RATBETR: TFloatField;
    CpyDstKopfTabSOLL_RATINTERVALL: TIntegerField;
    CpyDstKopfTabIST_ANZAHLUNG: TFloatField;
    CpyDstKopfTabIST_SKONTO: TFloatField;
    CpyDstKopfTabIST_ZAHLDAT: TDateField;
    CpyDstKopfTabIST_BETRAG: TFloatField;
    CpyDstKopfTabMAHNKOSTEN: TFloatField;
    CpyDstKopfTabKONTOAUSZUG: TIntegerField;
    CpyDstKopfTabBANK_ID: TIntegerField;
    CpyDstKopfTabSTADIUM: TIntegerField;
    CpyDstKopfTabERSTELLT: TDateField;
    CpyDstKopfTabERST_NAME: TStringField;
    CpyDstKopfTabKUN_ANREDE: TStringField;
    CpyDstKopfTabKUN_NAME1: TStringField;
    CpyDstKopfTabKUN_NAME2: TStringField;
    CpyDstKopfTabKUN_NAME3: TStringField;
    CpyDstKopfTabKUN_ABTEILUNG: TStringField;
    CpyDstKopfTabKUN_STRASSE: TStringField;
    CpyDstKopfTabKUN_LAND: TStringField;
    CpyDstKopfTabKUN_PLZ: TStringField;
    CpyDstKopfTabKUN_ORT: TStringField;
    CpyDstKopfTabUSR1: TStringField;
    CpyDstKopfTabUSR2: TStringField;
    CpyDstKopfTabPROJEKT: TStringField;
    CpyDstKopfTabORGNUM: TStringField;
    CpyDstKopfTabBEST_NAME: TStringField;
    CpyDstKopfTabBEST_CODE: TIntegerField;
    CpyDstKopfTabINFO: TMemoField;
    CpyDstKopfTabUW_NUM: TIntegerField;
    CpySrcKopfTabKUN_NUM: TStringField;
    CpySrcKopfTabBEST_DATUM: TDateField;
    CpyDstKopfTabKUN_NUM: TStringField;
    CpyDstKopfTabBEST_DATUM: TDateField;
    KasBuch: TZQuery;
    KasBuchBDATUM: TDateField;
    KasBuchQUELLE: TIntegerField;
    KasBuchJOURNAL_ID: TIntegerField;
    KasBuchZU_ABGANG: TFloatField;
    KasBuchBTXT: TMemoField;
    KasBuchBELEGNUM: TStringField;
    KasBuchGKONTO: TIntegerField;
    KasBuchSKONTO: TFloatField;
    JourTabGEGENKONTO: TIntegerField;
    JourTabKUN_NUM: TStringField;
    JourTabKUN_ANREDE: TStringField;
    JourTabKUN_NAME2: TStringField;
    JourTabKUN_NAME3: TStringField;
    JourTabKUN_ABTEILUNG: TStringField;
    JourTabKUN_STRASSE: TStringField;
    JourTabKUN_LAND: TStringField;
    JourTabKUN_PLZ: TStringField;
    JourTabKUN_ORT: TStringField;
    JourTabSOLL_NTAGE: TIntegerField;
    JourTabSOLL_RATEN: TIntegerField;
    JourTabSOLL_RATBETR: TFloatField;
    JourTabSOLL_RATINTERVALL: TIntegerField;
    JourTabIST_SKONTO_BETR: TFloatField;
    STListTab: TZQuery;
    STListTabREC_ID: TIntegerField;
    STListTabART_ID: TIntegerField;
    STListTabMENGE: TFloatField;
    STListTabERSTELLT: TDateField;
    STListTabERST_NAME: TStringField;
    STListTabGEAEND: TDateField;
    STListTabGEAEND_NAME: TStringField;
    JPosTabVIEW_POS: TStringField;
    KunTab: TZQuery;
    KunTabREC_ID: TIntegerField;
    KunTabKUNNUM2: TStringField;
    KunTabDEB_NUM: TIntegerField;
    KunTabKRD_NUM: TIntegerField;
    KunTabSTATUS: TIntegerField;
    KunTabKUN_LIEFART: TIntegerField;
    KunTabKUN_ZAHLART: TIntegerField;
    KunTabLIEF_LIEFART: TIntegerField;
    KunTabLIEF_ZAHLART: TIntegerField;
    KunTabPR_EBENE: TIntegerField;
    JourTabVLSNUM: TStringField;
    JourTabLDATUM: TDateField;
    JourTabLIEFART: TIntegerField;
    JourTabKOST_NETTO: TFloatField;
    JourTabWERT_NETTO: TFloatField;
    ZahlartTabTEXT: TMemoField;
    NummerTabNAME: TStringField;
    CreateMandantStr: TJvStrHolder;
    JourTabQUELLE_SUB: TIntegerField;
    KGRTabMAINKEY: TStringField;
    KunTabLAND: TStringField;
    FirBankTab: TZQuery;
    FirBankTabkurzbez: TStringField;
    FirBankTabinhaber: TStringField;
    FirBankTabblz: TIntegerField;
    FirBankTabmainkey: TStringField;
    UpdateArtTab: TZQuery;
    ReKFZTab: TZQuery;
    ReKFZTabKFZ_ID: TIntegerField;
    ReKFZTabADDR_ID: TIntegerField;
    ReKFZTabFGST_NUM: TStringField;
    ReKFZTabPOL_KENNZ: TStringField;
    ReKFZTabSCHL_ZU_2: TStringField;
    ReKFZTabSCHL_ZU_3: TStringField;
    ReKFZTabKM_STAND: TIntegerField;
    ReKFZTabZULASSUNG: TDateField;
    ReKFZTabLE_BESUCH: TDateField;
    ReKFZTabNAE_TUEV: TDateField;
    ReKFZTabNAE_AU: TDateField;
    KunTabNAME1: TStringField;
    KunTabPLZ: TStringField;
    KunTabORT: TStringField;
    KunTabNAME2: TStringField;
    KunTabNAME3: TStringField;
    KunTabANREDE: TStringField;
    KunTabSTRASSE: TStringField;
    JourTabMAHNKOSTEN: TFloatField;
    KunTabBLZ: TStringField;
    KunTabKTO: TStringField;
    KunTabBANK: TStringField;
    CpySrcKopfTabLIEF_ADDR_ID: TIntegerField;
    CpySrcKopfTabMAHNSTUFE: TIntegerField;
    CpySrcKopfTabMAHNDATUM: TDateField;
    CpySrcKopfTabMAHNPRINT: TIntegerField;
    CpyDstKopfTabLIEF_ADDR_ID: TIntegerField;
    CpyDstKopfTabMAHNSTUFE: TIntegerField;
    CpyDstKopfTabMAHNDATUM: TDateField;
    CpyDstKopfTabMAHNPRINT: TIntegerField;
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
    RabGrpDS: TDataSource;
    ZBatchSql1: TZSQLProcessor;
    KunTabEMAIL: TStringField;
    FirmaTab: TZQuery;
    FirmaDS: TDataSource;
    JPosTabGEBUCHT: TBooleanField;
    JPosTabSN_FLAG: TBooleanField;
    JPosTabALTTEIL_FLAG: TBooleanField;
    JPosTabBEZ_FEST_FLAG: TBooleanField;
    JourTabFREIGABE1_FLAG: TBooleanField;
    CpySrcKopfTabFREIGABE1_FLAG: TBooleanField;
    CpyDstKopfTabFREIGABE1_FLAG: TBooleanField;
    JPosTabQUELLE_SRC: TIntegerField;
    JourTabBRUTTO_FLAG: TBooleanField;
    JourTabMWST_FREI_FLAG: TBooleanField;
    JPosTabBRUTTO_FLAG: TBooleanField;
    JPosTabRABATT2: TFloatField;
    JPosTabRABATT3: TFloatField;
    CpySrcKopfTabBRUTTO_FLAG: TBooleanField;
    CpySrcKopfTabMWST_FREI_FLAG: TBooleanField;
    CpyDstKopfTabBRUTTO_FLAG: TBooleanField;
    CpyDstKopfTabMWST_FREI_FLAG: TBooleanField;
    JourTabMWST_0: TFloatField;
    JourTabMWST_1: TFloatField;
    JourTabMWST_2: TFloatField;
    JourTabMWST_3: TFloatField;
    JourTabMSUMME_0: TFloatField;
    JourTabMSUMME_1: TFloatField;
    JourTabMSUMME_2: TFloatField;
    JourTabMSUMME_3: TFloatField;
    KunTabBRUTTO_FLAG: TBooleanField;
    KunTabMWST_FREI_FLAG: TBooleanField;
    KunRabGrp: TZQuery;
    KunRabGrpRABGRP_ID: TStringField;
    KunRabGrpRABGRP_TYP: TIntegerField;
    KunRabGrpMIN_MENGE: TIntegerField;
    KunRabGrpLIEF_RABGRP: TIntegerField;
    KunRabGrpRABATT1: TFloatField;
    KunRabGrpRABATT2: TFloatField;
    KunRabGrpRABATT3: TFloatField;
    KunRabGrpADDR_ID: TIntegerField;
    UniQuery: TZQuery;
    UniQuery2: TZQuery;
    ShopOrderStatusTab: TZQuery;
    ShopOrderStatusTabLANGBEZ: TStringField;
    ShopOrderStatusTabTEXT: TMemoField;
    ShopOrderStatusTabMAINKEY: TStringField;
    ShopOSDS: TDataSource;
    ShopOrderStatusTabORDERSTATUS_ID: TIntegerField;
    KunTabKUNNUM1: TStringField;
    HerstellerTab: TZQuery;
    HerstellerDS: TDataSource;
    WgrTabID: TIntegerField;
    WgrTabTOP_ID: TIntegerField;
    WgrTabNAME: TStringField;
    WgrTabBESCHREIBUNG: TMemoField;
    WgrTabDEF_EKTO: TIntegerField;
    WgrTabDEF_AKTO: TIntegerField;
    WgrTabVORGABEN: TMemoField;
    SprachTab: TZQuery;
    SprachDS: TDataSource;
    FirmaTabANREDE: TStringField;
    FirmaTabNAME1: TStringField;
    FirmaTabNAME2: TStringField;
    FirmaTabNAME3: TStringField;
    FirmaTabSTRASSE: TStringField;
    FirmaTabLAND: TStringField;
    FirmaTabPLZ: TStringField;
    FirmaTabORT: TStringField;
    FirmaTabVORWAHL: TStringField;
    FirmaTabTELEFON1: TStringField;
    FirmaTabTELEFON2: TStringField;
    FirmaTabMOBILFUNK: TStringField;
    FirmaTabFAX: TStringField;
    FirmaTabEMAIL: TStringField;
    FirmaTabWEBSEITE: TStringField;
    FirmaTabBANK1_BLZ: TStringField;
    FirmaTabBANK1_KONTONR: TStringField;
    FirmaTabBANK1_NAME: TStringField;
    FirmaTabBANK1_IBAN: TStringField;
    FirmaTabBANK1_SWIFT: TStringField;
    FirmaTabBANK2_BLZ: TStringField;
    FirmaTabBANK2_KONTONR: TStringField;
    FirmaTabBANK2_NAME: TStringField;
    FirmaTabBANK2_IBAN: TStringField;
    FirmaTabBANK2_SWIFT: TStringField;
    FirmaTabKOPFTEXT: TMemoField;
    FirmaTabFUSSTEXT: TMemoField;
    FirmaTabABSENDER: TStringField;
    FirmaTabSTEUERNUMMER: TStringField;
    FirmaTabUST_ID: TStringField;
    FirmaTabIMAGE1: TBlobField;
    FirmaTabIMAGE2: TBlobField;
    FirmaTabIMAGE3: TBlobField;
    FirmaTabUSER_AKT: TStringField;
    FirmaTabLEITWAEHRUNG: TStringField;
    FirmaTabMANDANT_NAME: TStringField;
    JourTabLIEF_ADDR_ID: TIntegerField;
    CpySrcKopfTabPROVIS_WERT: TFloatField;
    CpyDstKopfTabPROVIS_WERT: TFloatField;
    NummerTabNEXT_NUM: TLargeintField;
    RegTabVAL_INT2: TLargeintField;
    RegTabVAL_INT3: TLargeintField;
    FirBankTabKTONR: TLargeintField;
    ZahlartTabNETTO_TAGE: TLargeintField;
    ArtInfoTab: TZQuery;
    ArtInfoTabREC_ID: TIntegerField;
    ArtInfoTabEK_PREIS: TFloatField;
    ArtInfoTabVK1: TFloatField;
    ArtInfoTabVK2: TFloatField;
    ArtInfoTabVK3: TFloatField;
    ArtInfoTabVK4: TFloatField;
    ArtInfoTabVK5: TFloatField;
    ArtInfoTabVK1B: TFloatField;
    ArtInfoTabVK2B: TFloatField;
    ArtInfoTabVK3B: TFloatField;
    ArtInfoTabVK4B: TFloatField;
    ArtInfoTabVK5B: TFloatField;
    ArtInfoTabMENGE2: TLargeintField;
    ArtInfoTabPREIS2: TFloatField;
    ArtInfoTabMENGE3: TLargeintField;
    ArtInfoTabPREIS3: TFloatField;
    ArtInfoTabMENGE4: TLargeintField;
    ArtInfoTabPREIS4: TFloatField;
    ArtInfoTabMENGE5: TLargeintField;
    ArtInfoTabPREIS5: TFloatField;
    ArtInfoTabMENGE_AKT: TFloatField;
    ArtInfoTabRABGRP_ID: TStringField;
    ArtInfoTabMENGE_BESTELLT: TFloatField;
    ArtInfoTabMENGE_RESERVIERT: TFloatField;
    ArtInfoTabPROVIS_PROZ: TFloatField;
    ArtInfoTabSTEUER_CODE: TIntegerField;
    ArtInfoTabERLOES_KTO: TIntegerField;
    ArtInfoTabAUFW_KTO: TIntegerField;
    ArtInfoTabARTNUM: TStringField;
    ArtInfoTabERSATZ_ARTNUM: TStringField;
    ArtInfoTabMATCHCODE: TStringField;
    ArtInfoTabWARENGRUPPE: TIntegerField;
    ArtInfoTabBARCODE: TStringField;
    ArtInfoTabARTIKELTYP: TStringField;
    ArtInfoTabKAS_NAME: TStringField;
    ArtInfoTabME_EINHEIT: TStringField;
    ArtInfoTabPR_EINHEIT: TFloatField;
    ArtInfoTabLAENGE: TStringField;
    ArtInfoTabGROESSE: TStringField;
    ArtInfoTabDIMENSION: TStringField;
    ArtInfoTabGEWICHT: TFloatField;
    ArtInfoTabKURZNAME: TStringField;
    ArtInfoTabLANGNAME: TMemoField;
    ArtInfoTabALTTEIL_FLAG: TBooleanField;
    ArtInfoTabNO_RABATT_FLAG: TBooleanField;
    ArtInfoTabNO_PROVISION_FLAG: TBooleanField;
    ArtInfoTabNO_BEZEDIT_FLAG: TBooleanField;
    ArtInfoTabNO_VK_FLAG: TBooleanField;
    ArtInfoTabSN_FLAG: TBooleanField;
    ReKunTab: TZQuery;
    WgrTabSTEUER_CODE: TIntegerField;
    WgrTabVK1_FAKTOR: TFloatField;
    WgrTabVK2_FAKTOR: TFloatField;
    WgrTabVK3_FAKTOR: TFloatField;
    WgrTabVK4_FAKTOR: TFloatField;
    WgrTabVK5_FAKTOR: TFloatField;
    NummerTabMAXLEN: TLargeintField;
    KunTabDEFAULT_LIEFANSCHRIFT_ID: TIntegerField;
    KunTabUST_NUM: TStringField;
    ArtInfoTabPREIS: TFloatField;
    ArtInfoTabPREIS_TYP: TIntegerField;
    ArtInfoTabADRESS_ID: TIntegerField;
    ArtInfoTabVPE: TIntegerField;
    ArtInfoTabMENGE_LIEF: TFloatField;
    ArtInfoTabMENGE_SOLL: TFloatField;
    ArtInfoTabJID: TIntegerField;
    KunTabFAX: TStringField;
    KunTabBRIEFANREDE: TStringField;
    DB1: TZConnection;
    ArtInfoTabBESTNUM: TStringField;
    JourTabSHOP_ID: TIntegerField;
    JourTabSHOP_ORDERID: TIntegerField;
    CpyDstKopfTabGEWICHT: TFloatField;
    CpyDstKopfTabROHGEWINN: TFloatField;
    CpySrcKopfTabGEWICHT: TFloatField;
    CpySrcKopfTabROHGEWINN: TFloatField;
    DBUpDTo1_10: TJvStrHolder;
    Cipher: TJvVigenereCipher;
    LandTabID: TStringField;
    LandTabNAME: TStringField;
    LandTabISO_CODE_3: TStringField;
    LandTabFORMAT: TIntegerField;
    LandTabVORWAHL: TStringField;
    LandTabWAEHRUNG: TStringField;
    LandTabSPRACHE: TStringField;
    CaoSecurity: TOFSecurity;
    FirBankTabFIBU_KTO: TLargeintField;
    KasBuchMA_ID: TIntegerField;
    KasBuchERSTELLT: TDateField;
    KasBuchERST_NAME: TStringField;
    ArtInfoTabBREITE: TStringField;
    ArtInfoTabHOEHE: TStringField;
    CpySrcKopfTabNSUMME_0: TFloatField;
    CpySrcKopfTabNSUMME_1: TFloatField;
    CpySrcKopfTabNSUMME_2: TFloatField;
    CpySrcKopfTabNSUMME_3: TFloatField;
    CpySrcKopfTabBSUMME_0: TFloatField;
    CpySrcKopfTabBSUMME_1: TFloatField;
    CpySrcKopfTabBSUMME_2: TFloatField;
    CpySrcKopfTabBSUMME_3: TFloatField;
    CpyDstKopfTabNSUMME_0: TFloatField;
    CpyDstKopfTabNSUMME_1: TFloatField;
    CpyDstKopfTabNSUMME_2: TFloatField;
    CpyDstKopfTabNSUMME_3: TFloatField;
    CpyDstKopfTabBSUMME_0: TFloatField;
    CpyDstKopfTabBSUMME_1: TFloatField;
    CpyDstKopfTabBSUMME_2: TFloatField;
    CpyDstKopfTabBSUMME_3: TFloatField;
    LockQuery: TZQuery;
    KunTabKTO_INHABER: TStringField;
    LandTabPOST_CODE: TStringField;
    JourTabGEWICHT: TFloatField;
    JourTabLOHN: TFloatField;
    JourTabWARE: TFloatField;
    JourTabROHGEWINN: TFloatField;
    JourTabTKOST: TFloatField;
    JourTabNSUMME_0: TFloatField;
    JourTabNSUMME_1: TFloatField;
    JourTabNSUMME_2: TFloatField;
    JourTabNSUMME_3: TFloatField;
    JourTabBSUMME_0: TFloatField;
    JourTabBSUMME_1: TFloatField;
    JourTabBSUMME_2: TFloatField;
    JourTabBSUMME_3: TFloatField;
    JourTabPROVIS_WERT: TFloatField;
    ArtInfoTabNO_EK_FLAG: TBooleanField;

    KFZGrDS: TDataSource;
    KFZGrTab: TZQuery;
    KFZGrTabGR: TIntegerField;
    KFZGrTabLANGBEZ: TStringField;
    KFZGrTabSQL_STATEMENT: TMemoField;
    KFZGrTabMAINKEY: TStringField;
    JPosTabEK_PREIS: TFloatField;
    JPosTabCALC_FAKTOR: TFloatField;
    JPosTabGPREIS: TFloatField;
    JPosTabG_RGEWINN: TFloatField;
    JPosTabE_RABATT_BETRAG: TFloatField;
    JPosTabG_RABATT_BETRAG: TFloatField;
    JPosTabPROVIS_PROZ: TFloatField;
    JPosTabPROVIS_WERT: TFloatField;
    LandTabEU_LAND: TBooleanField;

    procedure DM1Create(Sender: TObject);
    procedure JourTabCalcFields(DataSet: TDataSet);
    procedure KGRTabBeforePost(DataSet: TDataSet);
    procedure FirBankTabBeforePost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure NummerTabNewRecord(DataSet: TDataSet);
    procedure ShopOrderStatusTabBeforePost(DataSet: TDataSet);
    procedure ZBatchSql1BeforeExecute(Processor: TZSQLProcessor; StatementIndex: Integer);
    procedure ZBatchSql1AfterExecute(Processor: TZSQLProcessor; StatementIndex: Integer);
    procedure FirmaTabCalcFields(DataSet: TDataSet);
    function CaoSecurityFindUser(UserName: String; var MA_ID, GRUPPE_ID: Integer): Boolean;
    procedure CaoSecurityLoadGruppeRechte(Sender: TObject);
    procedure CaoSecurityLoadUserRechte(Sender: TObject);
    //function CaoSecurityIsFreeLock(ModulID: String; SatzID: Integer): Boolean;
    function CaoSecurityReleaseLock(ModulID: String; SatzID: Integer): Boolean;
    function CaoSecuritySetLock(ModulID: String; SatzID: Integer): Boolean;
    procedure WgrTabNewRecord(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    InNewNummer: Boolean;
  public
    { Public-Deklarationen }
    OF_SN: String;

    //user : String;
    view_user,      // Username, der in Formularen und zur Anzeige verwendet
                    // wird, dieser wird aus der Tabelle MITARBEITER ermittelt
    //ntuser,
    comp,email      : String[100];
    UserID          : Integer; // Eindeutige Mitarbeiternummer (ID)
    LeitWaehrung    : String;
    LandK2          : String[2];

    MainDir         : String;
    BackupDir       : String;
    DTADir          : String;
    TmpDir          : String;
    LogDir          : String;
    ExportDir       : String;
    ImportDir       : String;
    FormularDir: string;

    C2Color         : TColor; // Farbe f. 2. Textzeile in Gittern
    EditColor       : TColor;

    // zum Cachen der Funktion Calcleitwaehrung
    // sonst muß bei jeder Berechnung in der Registry
    // der Umrechnungskurs geholt werden
    CacheLastWaehrung : String;
    CacheLastKurs     : Double;

    LastVertrID       : Integer;
    LastVertrProz     : Double;

    SQLLog            : Boolean;
    RestoreRun        : Boolean;

    TermID            : Integer; // Eindeutige ID der Arbeitsstation
    TermIDStr         : String;

    MwStTab           : array [0..3] of Double; // Globale MwSt-Tabelle
    DefMwSt           : Double;  // Default MehrWertSteuer in %
    DefMwStCD         : Integer; // Verweis auf einen der Einträge in MwStTab

    AnzPreis          : Integer; // max. Preis (VK1-VK5)

    GCalcFaktorTab    : array [1..6] of Double; // Globale Kalkulationsfaktoren

    MandantTab        : array of TMandantRec;
    AktMandant        : String;
    MandantOK         : Boolean;

    USE_KFZ           : Boolean;
    AtrisEnable       : Boolean; // True, wenn Atris-Pfad gesetzt ist
    AtrisPfad         : String;

    DefSpracheID      : Integer;
    DefSprachCode     : String;

    BR_RUND_WERT      : Integer; // ganze Cent !!!   z.B. 5 = immer auf ganz 5 Cent runden
    BR_SUM_RUND_WERT  : Integer; // dito, jedoch für die Belegerstellung

    EK_NACHKOMMA      : Integer;
    VK_NACHKOMMA      : Integer;

    BLZ_LEN           : Integer;

    EK_DFormat        : String;
    EK_EFormat        : String;
    VK_DFormat        : String;
    VK_EFormat        : String;

    WgrFaktorCache    : tWgrFaktorCache;

    MahnFrist         : array [1..5] of Integer; // Anz. Tage als frist pro Mahnstufe

    PLZ_VERSION,
    BLZ_VERSION       : Integer;

    DisplayDLL        : String;

    IsLinux           : Boolean;

    LogLevel          : Integer;

    UseNTUserName     : Boolean;
    DefaultUserName   : String;
    DefaultPassword   : String;

    Lang_2            : String; // Ländercode für Sprache z.B. de, fr, es, en

    procedure ReadMandanten(App: String);
    procedure SaveMandanten;
    function  GetMandant(Name: String; var Daten: TMandantRec): boolean;
    function  OpenMandant(NewMandant, App: String; save: boolean): boolean;
    procedure NewMandant(Daten: TMandantRec);
    procedure DeleteMandant(Name: String);
    procedure InitMandantAfterOpen;

    function UpdateDatabase(Data: TJvStrHolder; var Warnings, Errors: Integer; LogFileName: String): boolean;

    function GetDBUserRechte(AktUser: Boolean; User,Secret: String): TSDBUserRechte;

    function BucheKasse(Datum: tDateTime; Quelle: Integer; Journal_ID: Integer;
                        BelNum: String; GKonto: Integer; Skonto: Double;
                        Betrag: Double; Text: String): boolean;

    // Liefert True zurück, wenn die Bankverbindung ok ist
    Function  CheckBankverbindung(addr_id: integer): boolean;

    // Liefert die Bankverbindung zurück, wenn ok
    Function  GetBankverbindung(addr_id: integer; var BLZ: Integer;
                                var KTO: String; var Inhaber: String): boolean; // True wenn ok

    Function  GetLieferant(addr_id: integer; var Info: String): boolean; // True wenn ok

    function  IncNummer(Quelle: Integer): Int64;
    function  IncNummerStr(Quelle: Integer): String;
    function  GetNummerFormat(Quelle: Integer): String;

    // Funktionen für SQL-Registry
    procedure WriteString(Key, Name, Value: String);
    procedure WriteBoolean(Key, Name: String; Value: Boolean);
    procedure WriteInteger(Key, Name: String; Value: Integer);
    procedure WriteDouble(Key, Name: String; Value: Double);
    procedure WriteLongString(Key, Name, Value: String);
    function  ReadString(Key, Name, Default: String): String;
    function  ReadBoolean(Key, Name: String; Default: Boolean): Boolean;
    function  ReadInteger(Key, Name: String; Default: Integer): Integer;
    function  ReadDouble(Key, Name: String; Default: Double): Double;
    function  ReadLongString(Key, Name, Default: String): String;

    // USER-SETTINGS
    procedure WriteStringU(Key, Name, Value: String);
    procedure WriteBooleanU(Key, Name: String; Value: Boolean);
    procedure WriteIntegerU(Key, Name: String; Value: Integer);
    procedure WriteDoubleU(Key, Name: String; Value: Double);
    procedure WriteLongStringU(Key, Name, Value: String);
    function  ReadStringU(Key, Name, Default: String): String;
    function  ReadBooleanU(Key, Name: String; Default: Boolean): Boolean;
    function  ReadIntegerU(Key, Name: String; Default: Integer): Integer;
    function  ReadDoubleU(Key, Name: String; Default: Double): Double;
    function  ReadLongStringU(Key, Name, Default: String): String;

    // Funktionen zum lesen und wiederherstellen von Tabellenlayouts (tDBGrid)
    function  ReadLayout(Key, Name: String; var Data: tStream; Version: Integer = 0): Boolean;
    procedure WriteLayout(Key, Name: String; Data: tStream; Version: Integer = 0);
    procedure GridLoadLayout(var Grid: TDBGrid; Sec: String; Version: Integer = 0);
    procedure GridSaveLayout(Grid: tDBGrid; Sec: String; Version: Integer = 0);

    // Diverse funktionen zum verbuchen von Rechnungen etc.

    function InsertStuecklistenArtikel(JournalID, JournalposID, ArtikelID,
                                        AddrID, BelegArt : Integer;
                                        Menge    : Double;
                                        BelegNum : String) : Boolean;
    function UpdateStuecklistenArtikel(JournalID,
                                        JournalposID,
                                        ArtikelID : Integer;
                                        Menge     : Double) : Boolean;

    function Buche_Rechnung(Journal_ID: Integer): String; // liefert Rechnungnummer zurück
    function Buche_Gutschrift(Journal_ID: Integer): String; // liefert Gutschriftnummer zurück

    function Buche_Einkauf(Journal_ID: Integer): String; // liefert Belegnummer zurück
    function Buche_Lieferschein(Journal_ID: Integer; Teillief: Boolean; var LieferscheinID: Integer): String; // liefert Belegnummer zurück
    function Buche_Angebot(Journal_ID: Integer): string; // liefert AGB-Nummer zurück
    function Buche_Auftrag(Journal_ID: Integer): String; // liefert Auftragsnummer zurück
    function Buche_BCKasse(Journal_ID: Integer): String; // liefert BON-Nummer zurück
    function Buche_EKBest(Journal_ID : Integer):String; // liefert EK-BST-Nummer zurück

    // Diverse Funktionen zum Stornieren von Vorgängen
    function Storno_Einkauf(Journal_ID: Integer): Boolean; // True, Wenn OK
    function Storno_Verkauf(Journal_ID: Integer): Boolean; // True, Wenn OK
    function Storno_Angebot(Journal_ID: Integer): Boolean; // True, Wenn OK
    function Storno_Lieferschein(Journal_ID: Integer): Boolean; // True, Wenn OK
    function Storno_EKBestellung(Journal_ID: Integer): Boolean; // True, Wenn OK


    // Rechnet beliebige Währung in Leitwährung um
    function  CalcLeitWaehrung(Betrag: Double; Waehrung: String): Double;

    // Kopiert Belege
    function  CopyRechnung(Journal_ID, Dest: Integer): Integer;  // Liefert Rec-ID zurück

    function  GetWGRDefaultKonten(WGR: Integer; var EKTO, AKTO: Integer): Boolean;
    function  CalcRabGrpPreis(RGID: String; PR_Ebene: Integer; var Preis: Double): Boolean;

    function  UpdateArtikelEdiMenge(JournalTyp, ArtikelID: Integer; MengeDiff: Double): Boolean;
    function  UpdateEKBestMenge: Boolean;
    procedure UpdateArtikelPreis(RechTyp, Artikel_ID, Addr_ID: Integer; Preis: Double);

    // Export-Funktionen
    procedure ExportDatasetToStream(Stream: TStream; Dataset: TDataset; Delimiter: String;
      Spaltennamen: Boolean = True; TextInHochKomma: Boolean = True; DosZeichenSatz: Boolean = False);
    procedure ExportDatasetToFile(FileName: String; Dataset: TDataset; Delimiter: String;
      Append: Boolean; Spaltennamen: Boolean = True; TextInHochKomma: Boolean = True; DosZeichenSatz: Boolean = False);
    procedure ExportDatasetToExcel(FileName: String; Dataset: TDataset; Spaltennamen: Boolean = True);

    function  GetSearchSQL(Felder: array of String; Suchbegriff: String): String;

    function  GetVertreterProv(ID: Integer): Double;

    procedure CheckTerminalID;


    //--------------------
    function GetArtikelPreis(ArtikelID, KunID, PE: Integer;
                             Brutto: Boolean;
                             Menge: Double;
                             var Preis: Double): Boolean;

    function GetStaffelpreis(ArtikelID: Integer;
                             Menge: Double;
                             Vkx: Double;
                             var Staffelpreis: Double): Boolean;

    function GetLagerMenge(ArtikelID: Integer; var Menge: Double): Boolean;

    function GetJournalPosMenge(JournalID, ArtikelID: Integer; var Menge: Double): Boolean;

    function GetArtikelSNAnzahl(ArtikelID: Integer; Status: String): Integer;

    function GetWGRCalcFaktor(Wgr, PreisID: Integer; var Faktor: Double): Boolean;

    procedure StarteNewProgramm(Name, Cmd, Dir: String);


    procedure LockError(Error: Integer);
  end;

  function GetProjectVersion: string;

var
  DM1: TDM1;

implementation

uses
  gnugettext, IniFiles, FileCtrl, shellapi, XLSFile,
  OF_Tool1, OF_Function, OF_Link, OF_Logging, OF_Progress, OF_SearchClass,
  OF_SqlRechteDlg;
  //ZExtra, ZSqlTypes,

{$R *.DFM}

const
  abc: string = '@12345@';

// aktuell verwendete Datenbank-Version (Struktur/Intern) = 1.10
// wird mit der Version in der SQL-Registry verglichen
// und das öffnen einer DB mit zu großer DB-Version (Programm älter als DB)
// abgebrochen
const
  DBVersion_Soll = 110;

procedure TDM1.DM1Create(Sender: TObject);
var
  P: PChar;
  Size: DWord;
  S: String;
  I: Integer;
begin
  try
    TranslateComponent (self);
  except
  end;

  OF_SN          :='---';

  LogLevel        :=10;

  Lang_2          :='de';

  InNewNummer     := False;
  SQLLog          := True;
  RestoreRun      := False;

  IsLinux         := False;

  if ParamCount > 0 then
  begin
    for i := 0 to ParamCount do
    begin
      S := UpperCase(ParamStr(I));
      if (Length(S) > 0) and (S[1] = '/') then
        delete(S, 1, 1);
      if (Length(S) > 0) and (S[1] = '-') then
        delete(S, 1, 1);

      if S = 'LINUX' then
        IsLinux := True;
    end;
  end;

  DB1.Protocol    := 'mysql';
  DB1.Connected   := False;
  DB1.Database    := '';
  DB1.HostName    := '';
  DB1.User        := '';
  DB1.Password    := '';
  DB1.LoginPrompt := False;

  TermID          := -1;
  TermIDStr       := '';
  AtrisEnable     := False;

  // Rechnernamen ermitteln
  size := 1024;
  p := StrAlloc(Size);
  Windows.getcomputername(P, Size);
  comp := p;
  strdispose(p);

  MainDir       := ExtractFilePath(Paramstr(0));
  LogDir        := MainDir+'LOG\';
  ForceDirectories(LogDir);
  AnzPreis      := 5; //default = VK5
  USE_KFZ       := False;
  DefMwSt       := 16; // in %
  DefMwStCD     := 2;
  DefSpracheID  := 2; // Deutsch
  DefSprachCode := 'de';
  LastVertrID   := -1;
  LastVertrProz := 0;
  AktMandant    := '';
  MandantOK     := False;

  EK_NACHKOMMA  := 3;
  VK_NACHKOMMA  := 2;

  WgrFaktorCache.Wgr := -1; // Cache ungültig

  SetLength(MandantTab, 0);
  ReadMandanten(application.name);

  //MessageDlg (abc,mtinformation,[mbok],0);


  Lang_2 := GetCurrentLanguage;
  Lang_2 := LowerCase(Copy(Lang_2, 1, 2));



  
end;

//------------------------------------------------------------------------------
// Öffnet einen bestehenden Mandanten, wenn dieser nicht existiert wird versucht
// die DB und die Tabellen anzulegen, dabei werden die akt. Benutzerrechte
// geprüft und bei zu wenigen Rechten abgebrochen.
// Weiterhin wird die Version der Tabellenstruktur geprüft und ggf. aktualisiert.
// auch hierbei werden die Benutzerrrechte gecheckt.
// bei einer zu neuen Tabellenversion wird das öffnen des Mandanten abgebrochen.
//------------------------------------------------------------------------------
function TDM1.OpenMandant(NewMandant, App: String; save: boolean): boolean;
var
  Mandant: TMandantRec;
  IniName : String;
  MyIni   : tIniFile;
  NewDB   : Boolean;
  I       : Integer;
  DSTab   : Array of Boolean;
  V       : Double;
  S       : String;
  Warn    : Integer;
  Error   : Integer;
  DBFound: boolean;  //Datenbank gefunden.
  ConOK,
  DBOK    : Boolean;
  Res     : tSDBUserRechte;
  ST      : tDateTime;
  FehlTab : String;     // Liste der fehlenden Tabellen
  TempTbl : TZQuery;

  procedure SqlRechteFehler(Txt: String; Rechte: TSDBUserRechte);
  var
    MySqlRechteDlg: tSqlRechteDlg;
  begin
    MySqlRechteDlg := tSqlRechteDlg.Create(Self);
    try
      MySqlRechteDlg.ShowDlg(Txt, Rechte);
    finally
      MySqlRechteDlg.Free;
    end;
  end;

  procedure MsgNoSQLRights(Rechte: tSDBUserRechte);
  begin
    SqlRechteFehler(_(
      'Sie verfügen über zu wenige Benutzerrechte auf dem MySQL-Server'+#13#10+
      'um die Tabellenstruktur für den akt. Mandanten zu aktualisieren.'+#13#10+
      'Sie benötigen mind. folgende Rechte :'+#13#10+
      'SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER und INDEX'+#13#13+
      'Bitte loggen Sie sich mit genügend Rechten erneut ein.'),
      Rechte
    );
  end;

  function ReadString(Key, Name, Default: String): String;
  var
    Tab: String;
  begin
    if not DB1.Connected then
      exit;

    UniQuery.Close;
    UniQuery.Sql.Text := 'show tables like "REGIST%RY"';
    UniQuery.Open;
    if UniQuery.RecordCount = 1 then
      Tab := UniQuery.Fields[0].AsString
    else
      Tab := 'REGISTRY';

    UniQuery.Close;
    UniQuery.Sql.Text := 'select * from '+Tab+' '+
                         'where MAINKEY=:KEY and NAME=:NAME';
    UniQuery.ParamByName('KEY').AsString := Key;
    UniQuery.ParamByName('NAME').AsString := Name;
    UniQuery.Open;
    if UniQuery.RecordCount > 0 then
      Result := UniQuery.FieldByName('VAL_CHAR').AsString
    else
      Result := Default;
    UniQuery.Close;
  end;

begin
  Result := False;
  NewDB  := False;
  if GetMandant(NewMandant, Mandant) then
  begin
    // offene Datasets merken
    (*
    // 16.10.09-ud.
    // Die Funktion DatasetCount gibt es so nicht mehr.
    // Ausserdem ist über die DSTab[] nicht definiert welche Tabelle auf ist.
    // Hier muss eine andere Lösung her.
    { TODO : Funktion erneuern... }

    SetLength(DSTab, DB1.DatasetCount);
    for i := 0 to DB1.DatasetCount-1 do
      DSTab[i] := TDataset(DB1.Datasets[i]).Active;
    *)

    DB1.Disconnect;

    GetMandant(NewMandant, Mandant);

    DB1.Protocol := 'mysql';
    DB1.HostName := Mandant.Server;
    DB1.User     := Mandant.User;
    DB1.Password := Mandant.Pass;
    DB1.Database := '';  //Mandant.DB;  //Die Database wir nach der Serverprüfung übergeben.
    DB1.Port     := Mandant.Port;


    //if Mandant.UseNTUserName then DB1.Login :=User;
    //DB1.LoginPrompt :=Mandant.ShowLoginDlg;

    ConOK := False;
    DBOK := False;

    try
      DB1.Connect;  //Server öffnen.
    except
      on E: Exception do
      begin
        begin
          MessageDlg(_('Fehler beim verbinden zum MySQL-Server.'+
                       #13#10#13#10+
                       'Meldung :')+#13#10+E.Message, mterror, [mbok], 0
          );
          exit;
        end;
      end;
    end;

    //Server konnte fehlerfrei geöffnet werden.
    //Prüfen ob Datenbank vorhanden ist.
    DBFound := False;
    TempTbl := TZQuery.Create(nil);
    try
      TempTbl.Connection := DB1;
      TempTbl.SQL.Text := 'show databases';
      try
        TempTbl.Open;

        //Server nach der Datenbank durchsuchen.
        while not TempTbl.Eof do
        begin
          if UpperCase(TempTbl.FieldByName('DATABASE').AsString) = UpperCase(Mandant.DB) then
          begin
            DBFound := True;
            Break;
          end;
          TempTbl.Next;
        end;

        TempTbl.Close;
      except
        on E: Exception do
        begin
          begin
            MessageDlg(_('Fehler beim suchen der Datenbank.'+
                         #13#10#13#10+
                         'Meldung :')+#13#10+E.Message, mterror, [mbok], 0
            );
            exit;
          end;
        end;
      end;

      //Wurde die Datenbank gefunden?
      if not DBFound then
      begin
        if MessageDlg(_('Die Datenbank scheint noch nicht zu '+
                        'existieren.'+#13#10+
                        'Wollen Sie die Datenbank erstellen ?'),
                         mtconfirmation,[mbyes, mbno], 0) <> mryes then
        begin
          Exit;
        end;

        //Ja, Database neu anlegen...
        TempTbl.Close;
        TempTbl.SQL.Text := 'create database if not exists '+Mandant.DB;
        try
          TempTbl.ExecSQL;
        except
          on E: Exception do
          begin
            begin
              MessageDlg(_('Fehler beim anlegen der Datenbank.'+
                           #13#10#13#10+
                           'Meldung :')+#13#10+E.Message, mterror, [mbok], 0
              );
              exit;
            end;
          end;
        end;
        NewDB := True;  //Neue Datenbank wurde angelegt...
      end;

    finally
      TempTbl.Free;
    end;


    //Server schließen und Databasename übergeben...
    DB1.Disconnect;
    DB1.Database := Mandant.DB;


    try
      DB1.Connect;

      //if DB1.LoginPrompt then User :=DB1.Login else User :=NTUser;

      ConOK := True;
      DBOK  := True;
    except
      on E: Exception do
      begin
        if (Pos('UNBEKANNTE DATENBANK',UpperCase(E.Message)) = 1) or
           (Pos('UNKNOWN DATABASE',UpperCase(E.Message)) = 1) then
        begin
          if MessageDlg(_('Die Datenbank scheint noch nicht zu '+
                          'existieren.'+#13#10+
                          'Wollen Sie die Datenbank erstellen ?'),
                           mtconfirmation,[mbyes,mbno],0) = mryes then
          begin
            //16.10.09-ud. -BEGIN-
            TempTbl := TZQuery.Create(nil);
            try
              try
                TempTbl.Connection := DB1;
                TempTbl.SQL.Text := 'create database if not exists '+Mandant.DB;
                TempTbl.ExecSQL;

                DBOK := True;
                DB1.Database := Mandant.DB;
                DB1.Connect;
                NewDB := True;
                ConOK := True;
              except
                MessageDlg('Fehler beim anlegen der Datenbank: '+Mandant.DB, mterror, [mbok], 0);
              end;
            finally
              TempTbl.Free;
            end;

            (* Block entfernt...
            try
              DB1.CreateDatabase(Mandant.DB); // DB anlegen
              DBOK := True;
              DB1.Connect;
              NewDB := True;
              ConOK := True;
            except
              //MessageDlg('Fehler beim erzeugen der Datenbank !',
              //            mterror,[mbok],0);
            end;
            *)

            //16.10.09-ud. -ENDE-
          end else
            exit;
        end else
        begin
          MessageDlg(_('Fehler beim verbinden zum MySQL-Server.'+
                       #13#10#13#10+
                       'Meldung :')+#13#10+E.Message, mterror, [mbok], 0
          );
          exit;
        end;
      end;
    end;

    if not DBOK then
    begin
      MessageDlg(_('Die Datenbank für diesen Mandant konnte nicht '+
                   'erstellt werden !'+#13#10+
                   'Bitte prüfen Sie die Einstellungen und ob Sie über '+
                   'ausreichende Rechte'+#13#10+
                   'zum erstellen einer DB auf diesem Server verfügen.'),
                   mterror, [mbok], 0
      );
      exit;
    end;

    if not ConOK then
    begin
      MessageDlg(_('Der gewünschte Mandant konnte nicht geöffnet werden !'+#13#10+
                   'Überprüfen Sie die Verbindung zum Server, Benutzernamen'+#13#10+
                   'und Paßwort.'), mterror, [mbok], 0
      );
      exit;
    end;

    if not NewDB then
    begin
      // prüfen, ob Tabellen vorhanden sind, wenn nicht, dann neu erzeugen
      try
        UniQuery.close;
        UniQuery.sql.text := 'SHOW TABLES';
        UniQuery.open;
        NewDB := (UniQuery.RecordCount = 0) or
                 ((UniQuery.RecordCount = 1) and
                  (UniQuery.FieldByName('Tables_in_'+DB1.Database).AsString = 'UCHECK'));

        if not NewDB then
        begin
          UniQuery.First;
          FehlTab := '';
          for i:=0 to Length(CAO_TABELLEN_V109)-1 do
          begin
            if not UniQuery.Locate('Tables_in_'+DB1.Database , CAO_TABELLEN_V109[i], []) then
            begin
              if Length(FehlTab) > 0 then
                FehlTab := FehlTab+', ';
              FehlTab := FehlTab+CAO_TABELLEN_V109[i];
            end;
          end;
        end;
      except
      end;
      Uniquery.Close;
    end;

    try
      if NewDB then // neue DB wurde erstellt
      begin
        Res := GetDBUserRechte(True, '', '');
        if (urSelect in Res) and (urInsert in Res) and
           (urUpdate in Res) and (urDelete in Res) and
           (urCreate in Res) and (urAlter  in Res) and
           (urDrop   in Res) and (urIndex  in Res) then
        begin
          // User hat die benötigten Rechte ! Jetzt Tabellen anlegen ...
          if not UpdateDatabase(CreateMandantStr, Warn, Error, 'db_create_110') then //CreateMandantSql
            MessageDlg('Fehler beim erstellen der Tabellen !', mterror, [mbok], 0);
        end else
        begin
          SqlRechteFehler(_('Sie verfügen über zu wenige Benutzerrechte auf '+
                            'dem MySQL-Server um die Tabellenstruktur für einen '+
                            'neuen Mandanten (DB) zu erzeugen.'+#13#10#13#10+
                            'Sie benötigen mind. folgende Rechte :'+#13#10#13#10+
                            'SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, '+
                            'ALTER und INDEX'+#13#13#13#10+
                            'Bitte loggen Sie sich mit genügend Rechten erneut ein.'),
                            Res
          );
          DB1.Disconnect;
          exit;
        end;
      end;
    except
      MessageDlg(_('Fehler beim erstellen der Tabellen !'), mterror, [mbok], 0);
      exit;
    end;

    try
      if NewDB then   // wenn neue Tabellen angelegt, dann evt. Formulare importieren ...
        if (FileExists(ExtractFilePath(paramstr(0))+'formulare.cao')) and
           (MessageDlg(_('Sollen die Standardformulare installiert werden ?'),
                         mtconfirmation,mbyesnocancel,0) = mryes) then
        begin
          ZBatchSQL1.Script.LoadFromFile(ExtractFilePath(paramstr(0))+'formulare.cao');
          ProgressForm.Init(_('Formulare installieren ...'));
          ProgressForm.Start;
          ZBatchSQL1.Execute;
          ProgressForm.Stop;
        end;
    except
      MessageDlg(_('Fehler beim anlegen der Formulare !'), mterror, [mbok], 0);
    end;
    ProgressForm.Stop;

    try
      S := ReadString('MAIN', 'DB_VERSION', '0.00');

      if DecimalSeparator <> '.' then
        while (Pos('.',S) > 0) do
          S[Pos('.',S)] := DecimalSeparator;
        V := StrToFloat(S);
    except
      V := -1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

      MessageDlg(_('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                   'Der ausgewählte Mandant wurde nicht geöffnet.'), mterror, [mbok], 0);

      DB1.Disconnect;
      exit;
    end;

    //Check ob DB zu alt (Version < 1.09
    try
      S := ReadString('MAIN', 'DB_VERSION', '0.00');
      if DecimalSeparator <> '.' then
        while (Pos('.',S) > 0) do
          S[Pos('.',S)] := DecimalSeparator;
        V := StrToFloat(S)*100;

      if V < 109 then
      begin
        MessageDlg(_('Die Datenbank ist zu alt (<1.09).'+#13#10+
                     'Bitte Installieren Sie zunächst die Version 1.2.5.x'+#13#10+
                     'von Open-Faktura und dann erst eine Version >=1.3.x.x'),
                     mterror, [mbok], 0);

        DB1.Disconnect;
        exit;
      end;
    except
      V := -1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

      MessageDlg(_('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                   'Der ausgewählte Mandant wurde nicht geöffnet.'), mterror, [mbok], 0);
      DB1.Disconnect;
      exit;
    end;

    //---ENDE Check----

    // DB Update-Check für Tabellenstruktur Version 1.09
    try
      S := ReadString ('MAIN', 'DB_VERSION', '0.00');
      if DecimalSeparator <> '.' then
        while (Pos('.',S) > 0) do
          S[Pos('.',S)] := DecimalSeparator;
        V := StrToFloat(S)*100;
    except
      V := -1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

      MessageDlg('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                 'Der ausgewählte Mandant wurde nicht geöffnet.', mterror, [mbok], 0);
      DB1.Disconnect;
      exit;
    end;

    if V = 109 then
    begin
      MessageDlg('Die ausgewählte Datenbank ist nicht auf dem aktuellen Stand'+#13#10+
                 'und wird deshalb nun aktualisiert (Version 1.09 auf Version 1.10)',
                 mtinformation, [mbok], 0);

      Res := GetDBUserRechte (True, '', '');
      if (urSelect in Res) and (urInsert in Res) and (urUpdate in Res) and
         (urDelete in Res) and (urCreate in Res) and (urAlter  in Res) and
         (urDrop   in Res) and (urIndex  in Res) then
      begin
        // User hat die benötigten Rechte !
        if not UpdateDataBase (DBUpdTo1_10, Warn, Error, 'db_update_110') then
          MessageDlg('Fehler beim Update der Tabellenstruktur auf Version 1.10 !',
                     mterror, [mbok], 0
          );
      end else
      begin
        MsgNoSQLRights(Res);
        DB1.Disconnect;
        exit;
      end;
    end;

    // DB Tabellenstruktur zu neu für das Programm ???
    try
      S := ReadString ('MAIN','DB_VERSION','0.00');
      if DecimalSeparator <> '.' then
        while (Pos('.',S) > 0) do
          S[Pos('.',S)] := DecimalSeparator;
      V := StrToFloat(S)*100;
    except
      V :=-1; // zur Sicherheit, damit die nä. Updateschritte nicht ausgeführt werden !!!

      MessageDlg(_('Die Datenbankversion konnte nicht ermittelt werden !'+#13#10+
                   'Der ausgewählte Mandant wurde nicht geöffnet.'), mterror, [mbok], 0
      );
      DB1.Disconnect;
      exit;
    end;

    if V = DBVersion_Soll then
    begin
      (*
      //16.10.09-ud. siehe oben...
      { TODO : Funktion erneuern... }
      for i := 0 to DB1.DatasetCount-1 do
      begin
        if DSTab[i] then
          TDataset(DB1.Datasets[i]).Active := True;
      end;
      setLength(DSTab, 0);
      *)

      AktMandant := NewMandant;

      Result := True;

      if Save then
      begin
        ininame := ExtractFilePath(paramstr(0))+'CAO32_DB.CFG';
        MyIni := tIniFile.Create(IniName);
        try
          try
            MyIni.WriteString(APP, 'AKTMANDANT', AktMandant);
          except
            MessageDlg(Format(_('Fehler beim schreiben in die '+#13#10+
                                'Konfigurationsdatei %s.'),
                                [IniName]), mterror, [mbok], 0
            );
          end;
        finally
          MyIni.Free;
        end;
      end;
      MandantOK  := True;
    end else
    begin
      if V > DBVersion_Soll then
      begin
        MessageDlg(_('Der aktuelle Mandant hat eine neuere DB-Version'+#13#10+
                     'und kann mit dieser Programmversion nicht geöffnet werden.'+#13#10+
                     'Bitte aktualisieren Sie das Programm ...'), mterror, [mbok], 0
        );
        DB1.Disconnect;
        Result := False;
      end;
    end;
  end else
  begin
    // Mandantendaten konnten aus der INI nicht gelesen werden.
    Result := False;

    MessageDlg(_('Die Einstellungen für den aktuellen Mandanten'+#13#10+
                 'konnten aus der Datei "CAO32_DB.CFG" nicht gelesen werden.'+#13#10+
                 'Bitte prüfen Sie die Einstellungen.'), mterror, [mbok], 0
    );
  end;
end;

//------------------------------------------------------------------------------
// Sollte nach dem Öffnen eines neuen Mandanten aufgerufen werden
//------------------------------------------------------------------------------
procedure TDM1.InitMandantAfterOpen;
var
  s: String;
  Ini: TIniFile;
  i, v: Integer;
begin
  try
    WhrungTab.Open;
    LandTab.Open;
    LiefArtTab.Open;
    ZahlArtTab.Open;
    ShopOrderStatusTab.Open;
    VertreterTab.Open;
    SprachTab.Open;

    if SprachTab.RecordCount>0 then
    begin
      DefSpracheID  := SprachTab.FieldByName('SPRACH_ID').AsInteger;
      DefSprachCode := SprachTab.FieldByName('CODE').AsString;
    end;

    // PLZ installieren
    try
      // Alte Version einlesen
      V := ReadInteger('MAIN', 'PLZ_VERSION', 106);

      UniQuery.Close;
      UniQuery.sql.text := 'select count(*) as ANZ from PLZ';
      UniQuery.Open;
      if (UniQuery.recordcount = 1) and
         ((UniQuery.fieldbyname('ANZ').asInteger < 10) or (PLZ_VERSION > V)) and
         (FileExists(ExtractFilePath(paramstr(0))+'plz.cao')) then
      begin
        ProgressForm.Init(_('PLZ importieren...'));
        UniQuery.close;
        UniQuery.sql.text := 'delete from PLZ';
        UniQuery.execsql;
        ZBatchSql1.Script.LoadFromFile(ExtractFilePath(paramstr(0))+'plz.cao');
        try
          SQLLog := False;
          Screen.Cursor := crSqlWait;
          ProgressForm.Start;
          ZBatchSql1.Execute;
        finally
          SQLLog := True;
          Screen.Cursor := crDefault;
        end;
        WriteInteger('MAIN', 'PLZ_VERSION', PLZ_VERSION);
      end;
      UniQuery.close;
    except
    end;

    ProgressForm.Stop;

    // BLZ installieren
    try
      // Alte Version einlesen
      V := ReadInteger('MAIN', 'BLZ_VERSION', 106);

      UniQuery.Close;
      UniQuery.sql.text := 'select count(*) as ANZ from BLZ';
      UniQuery.Open;
      if (UniQuery.recordcount = 1) and
         ((UniQuery.fieldbyname('ANZ').asInteger < 10) or (BLZ_VERSION > V)) and
         (FileExists(ExtractFilePath(paramstr(0))+'blz.cao')) then
      begin
        ProgressForm.Init(_('BLZ importieren...'));
        UniQuery.close;
        UniQuery.sql.text := 'delete from BLZ';
        UniQuery.execsql;
        ZBatchSql1.Script.LoadFromFile(ExtractFilePath(paramstr(0))+'blz.cao');
        try
          SQLLog := False;
          Screen.Cursor := crSqlWait;
          ProgressForm.Start;
          ZBatchSql1.Execute;
        finally
          SQLLog := True;
          Screen.Cursor := crDefault;
        end;
        WriteInteger('MAIN', 'BLZ_VERSION', BLZ_VERSION);
      end;
      UniQuery.close;
    except
    end;

    ProgressForm.Stop;

    // Länder installieren
    try
      UniQuery.Close;
      UniQuery.sql.text := 'select count(*) as ANZ from LAND';
      UniQuery.Open;
      if (UniQuery.recordcount = 1) and
         (UniQuery.fieldbyname('ANZ').asInteger < 20)and
         (FileExists(ExtractFilePath(paramstr(0))+'land.cao')) then
      begin
        ProgressForm.Init(_('Länder importieren...'));
        if UniQuery.fieldbyname('ANZ').asInteger > 0 then
        begin
          ZBatchSql1.Script.Text := 'delete from LAND;';
          ProgressForm.Start;
          ZBatchSql1.Execute;
        end;
        ZBatchSql1.Script.LoadFromFile(ExtractFilePath(paramstr(0))+'land.cao');
        ZBatchSql1.Execute;
      end;
      UniQuery.close;
    except
    end;

    ProgressForm.Stop;

    LeitWaehrung := ReadString('MAIN', 'LEITWAEHRUNG', '@@');
    if LeitWaehrung = '@@' then
    begin
      LeitWaehrung := '€';
      WriteString('MAIN', 'LEITWAEHRUNG', '€');
    end;

    LandK2 := ReadString('MAIN', 'LAND', 'DE');

    AnzPreis := ReadInteger('MAIN\ARTIKEL', 'ANZPREIS', -1);
    if AnzPreis = -1 then
    begin
      WriteInteger('MAIN\ARTIKEL', 'ANZPREIS', 5);
      AnzPreis := 5;
    end;

    EK_NACHKOMMA := ReadInteger('MAIN\BELEGE', 'EK_EP_NACHKOMMASTELLEN', 3);
    VK_NACHKOMMA := ReadInteger('MAIN\BELEGE', 'VK_EP_NACHKOMMASTELLEN', 2);

    if VK_NACHKOMMA > 4 then VK_NACHKOMMA := 4;
    if VK_NACHKOMMA < 2 then VK_NACHKOMMA := 2;
    if EK_NACHKOMMA > 4 then EK_NACHKOMMA := 4;
    if EK_NACHKOMMA < 2 then EK_NACHKOMMA := 2;

    EK_DFormat := ',#0.';
    for i := 1 to EK_NACHKOMMA do
      EK_DFormat := EK_DFormat+'0';
    EK_EFormat := '0.';
    for i:=1 to EK_NACHKOMMA do
      EK_EFormat := EK_EFormat+'0';

    VK_DFormat := ',#0.';
    for i := 1 to VK_NACHKOMMA do
      VK_DFormat := VK_DFormat+'0';
    VK_EFormat := '0.';
    for i := 1 to VK_NACHKOMMA do
      VK_EFormat := VK_EFormat+'0';

    // Globale MWST-Tabelle
    MWSTTab[0] := ReadDouble('MAIN\MWST', '0', 0);
    MWSTTab[1] := ReadDouble('MAIN\MWST', '1', 16);
    MWSTTab[2] := ReadDouble('MAIN\MWST', '2', 7);
    MWSTTab[3] := ReadDouble('MAIN\MWST', '3', 0);

    // Default-Steuer und Code laden
    i := ReadInteger('MAIN\MWST', 'DEFAULT', 1);
    if (i < 0) or (i > 3) then
      i := 2;
    DefMwStCD := I;
    DefMwSt   := MWSTTab[I];

    // Globale Kalkulationsfaktoren
    for i := 1 to 5 do
    begin
      GCalcFaktorTab[i] := ReadDouble('MAIN\ARTIKEL', 'VK'+IntToStr(i)+'_CALC_FAKTOR', 0);
    end;

    // Shop-Calc-Faktor
    GCalcFaktorTab[6] := ReadDouble('MAIN\ARTIKEL', 'SHOP_CALC_FAKTOR', 0);

    // Brutto-Rundungswert für Artikel
    BR_RUND_WERT := ReadInteger('MAIN\ARTIKEL', 'BRUTTO_RUNDUNG_WERT', 0);
    if BR_RUND_WERT < 1 then
      BR_RUND_WERT := 1; //mind 1 cent

    // Brutto-Summen-Rundungswert für Belege
    BR_SUM_RUND_WERT := ReadInteger('MAIN\BELEGE', 'BRUTTO_RUNDUNG_WERT', 0);
    if BR_SUM_RUND_WERT < 1 then
    begin
      BR_SUM_RUND_WERT := 1; //mind 1 cent
      WriteInteger('MAIN\BELEGE', 'BRUTTO_RUNDUNG_WERT', BR_SUM_RUND_WERT);
    end;

    i := ReadInteger('MAIN', 'USE_KFZ', -1);
    if i = -1 then
    begin
      i := 0;
      WriteInteger('MAIN', 'USE_KFZ', 0);
    end;

    Use_KFZ := i=1;
    if USE_KFZ then
    begin
      S := ReadString('MAIN\KFZ', 'ATRIS_PFAD', '@@@');
      if S = '@@@' then
        WriteString('MAIN\KFZ', 'ATRIS_PFAD', '');

      if (Length(S) > 0) and (S <> '@@@') and (DirectoryExists(S)) then
      begin
        if (Length(s) > 0) and (s[Length(s)] <> '\') then
          s := s+'\';
        AtrisPfad := S;
        AtrisEnable := True;
      end else
      begin
        ini := tinifile.create('atris_st.ini');
        try
          s := ini.ReadString('INTERFACE', 'BESTINFO32', '');
        finally
          ini.free;
        end;
        if Length(s) > 0 then
        begin
          s := ExtractFilePath(s);
          if (Length(s) > 0) and (s[Length(s)] <> '\') then
            s := s+'\';
          if DirectoryExists(S) then
          begin
            AtrisPfad := s;
            AtrisEnable := True;
          end;
        end;
      end;
    end;

    CheckTerminalID; // Terminal-Nummer auslesen und ggf. neu setzen

    // Default-Sprache laden
    SprachTab.Open;
    if SprachTab.RecordCount > 0 then
    begin
      DefSpracheID := SprachTab.FieldByName('SPRACH_ID').AsInteger;
      DefSprachCode := SprachTab.FieldByName('CODE').AsString;
    end;

    BLZ_LEN := ReadInteger('MAIN\ADRESSEN', 'BLZ_LEN', -1);
    if BLZ_LEN = -1 then
    begin
      BLZ_LEN := 8;
      WriteInteger('MAIN\ADRESSEN', 'BLZ_LEN', 8);
    end;

    // Pfade laden
    BackupDir   := ReadString('MAIN\PFADE', 'BACKUP_DIR', MainDir+'BACKUP\');
    TmpDir      := ReadString('MAIN\PFADE', 'TMP_DIR', MainDir+'TMP\');
    DTADir      := ReadString('MAIN\PFADE', 'DTA_DIR', MainDir+'DTA\');
    ExportDir   := ReadString('MAIN\PFADE', 'EXPORT_DIR', MainDir+'EXPORT\');
    ImportDir   := ReadString('MAIN\PFADE', 'IMPORT_DIR', MainDir+'IMPORT\');
    FormularDir := ReadString('MAIN\PFADE', 'FORMULAR_DIR', MainDir+'FORMULAR\');

    if (Length(BackupDir) > 0) and (Backupdir[Length(BackupDir)] <> '\') then
      BackupDir := BackupDir + '\';
    if (Length(TmpDir) > 0) and (TmpDir[Length(TmpDir)] <> '\') then
      TmpDir := TmpDir + '\';
    if (Length(DTADir) > 0) and (DTADir[Length(DTADir)] <> '\') then
      DTADir := DTADir + '\';
    if (Length(ExportDir) > 0) and (ExportDir[Length(ExportDir)] <> '\') then
      ExportDir := ExportDir + '\';
    if (Length(ImportDir) > 0) and (ImportDir[Length(ImportDir)] <> '\') then
      ImportDir := ImportDir + '\';
    if (Length(FormularDir) > 0) and (FormularDir[Length(FormularDir)] <> '\') then
      FormularDir := FormularDir + '\';

    // wenn Pfad nicht existiert dann anlegen
    try
      ForceDirectories(BackupDir);
    except
    end;
    try
      ForceDirectories(TmpDir);
    except
    end;
    try
      ForceDirectories(DTADir);
    except
    end;
    try
      ForceDirectories(ExportDir);
    except
    end;
    try
      ForceDirectories(ImportDir);
    except
    end;
    try
      ForceDirectories(FormularDir);
    except
    end;

    //Für KL's Erweiterung der KFZ-Gruppen
    UniQuery.Close;

    //Prüfen, ob Zeilen (KFZ-Gruppen)in der Registry vorhanden
    UniQuery.Sql.Text := 'select count(*) as ANZ from REGISTRY '+
                         'where MAINKEY="MAIN\\KFZ_GRP"';
    UniQuery.Open;
    if UniQuery.FieldByName('ANZ').AsInteger = 0 then
    begin
      //Nein, Gruppen müssen angelegt werden
      UniQuery.Close;
      ZBatchSql1.Script.Text :=
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "alle Fahrzeuge", NULL, NULL, "0", NULL, NULL, NULL, NULL, NULL, NULL, "N", "N", "20030914192412");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Neuwagen", NULL, NULL, "1", NULL, NULL, NULL, "KFZ_GRUPPE=1", NULL, NULL, "N", "N", "20030914192412");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Gebrauchtwagen", NULL, NULL, "2", NULL, NULL, NULL, "KFZ_GRUPPE=2", NULL, NULL, "N", "N", "20030914192412");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Kundenfahrzeug", NULL, NULL, "3", NULL, NULL, NULL, "KFZ_GRUPPE=3", NULL, NULL, "N", "N", "20030914192413");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Traktoren", NULL, NULL, "4", NULL, NULL, NULL, "KFZ_GRUPPE=4", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Landmaschinen", NULL, NULL, "5", NULL, NULL, NULL, "KFZ_GRUPPE=5", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "PKW", NULL, NULL, "6", NULL, NULL, NULL, "KFZ_GRUPPE=6", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "PKW Anhänger", NULL, NULL, "7", NULL, NULL, NULL, "KFZ_GRUPPE=7", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Transporter bis 3,5t", NULL, NULL, "8", NULL, NULL, NULL, "KFZ_GRUPPE=8", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "LKW 3,5t - 7,5t", NULL, NULL, "9", NULL, NULL, NULL, "KFZ_GRUPPE=9", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "LKW ab 7,5t", NULL, NULL, "10", NULL, NULL, NULL, "KFZ_GRUPPE=10", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "LKW Anhänger", NULL, NULL, "11", NULL, NULL, NULL, "KFZ_GRUPPE=11", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "KOM (Kraftomnibus)", NULL, NULL, "12", NULL, NULL, NULL, "KFZ_GRUPPE=12", NULL, NULL, "N", "N", "20030914192415");'+
        'INSERT INTO REGISTRY VALUES("MAIN\\KFZ_GRP", "Baumaschienen", NULL, NULL, "13", NULL, NULL, NULL, "KFZ_GRUPPE=13", NULL, NULL, "N", "N", "20030914192415");';
      try
        ProgressForm.Start;
        ZBatchSql1.Execute;
        ProgressForm.Stop;
      except
      end;
    end;
    UniQuery.Close;
    //ENde KFZ-Gruppenerweiterung

  except
    MessageDlg(_('Beim öffnen der Tabellen ist ein Fehler aufgetreten !'), mterror, [mbok], 0);
  end;
end;

//------------------------------------------------------------------------------
// prüft mittels TryAndError die DB-Rechte des Benutzers ...
// zurückgeliefert wird ein Set der Rechte
// wenn es dumm läuft und der User zwar CREATE-Rechte hat, aber keine DROP-Rechte,
// dann bleibt die Tabelle UTEST als Leiche zurück
//------------------------------------------------------------------------------
function TDM1.GetDBUserRechte(AktUser: Boolean; User, Secret: String): TSDBUserRechte;
var
  LastUser, LastUserSecret: String;
  Error: Boolean;
  S: String;
begin
  Result := [];
  Error  := False;
  if AktUser = False then
  begin
    // akt. User sichern
    LastUser       := DB1.User;
    LastUserSecret := DB1.Password;

    DB1.Disconnect;
    DB1.User     :=User;
    DB1.Password :=Secret;

    try
      DB1.Connect;
    except
      Error := True;
    end;
  end;

  if not Error then
  begin
    // jetzt Rechte prüfen

    UniQuery.Close;
    UniQuery.Sql.Text :='DROP TABLE IF EXISTS UCHECK ';
    try
     UniQuery.ExecSql;
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'CREATE TABLE UCHECK (SPALTE1 VARCHAR(10) '+
                         'NOT NULL, PRIMARY KEY(SPALTE1))';
    try
      UniQuery.ExecSql;
      include(Result, urCreate);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'ALTER TABLE UCHECK CHANGE SPALTE1 SPALTE1 '+
                         'INT(10) DEFAULT "1" NOT NULL';
    try
      UniQuery.ExecSql;
      include(Result, urAlter);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'CREATE INDEX TEST ON UCHECK (SPALTE1)';
    try
      UniQuery.ExecSql;
      include(Result, urIndex);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'INSERT INTO UCHECK (SPALTE1) VALUES (5)';
    try
      UniQuery.ExecSql;
      include(Result, urInsert);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'UPDATE UCHECK SET SPALTE1=6 WHERE SPALTE1=5';
    try
      UniQuery.ExecSql;
      include (Result,urUpdate);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'SELECT SPALTE1 FROM UCHECK WHERE SPALTE1=6';
    try
      UniQuery.Open;
      if (UniQuery.Active) and (UniQuery.RecordCount = 1) then
        include(Result, urSelect);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'DELETE FROM UCHECK WHERE SPALTE1=6';
    try
      UniQuery.ExecSql;
      include(Result, urDelete);
    except
    end;
    UniQuery.Close;

    UniQuery.Sql.Text := 'DROP TABLE UCHECK';
    try
      UniQuery.ExecSql;
      include (Result,urDrop);
    except
    end;
    UniQuery.Close;
  end;

  if AktUser = False then
  begin
    DB1.Disconnect;
    DB1.User     := LastUser;
    DB1.Password := LastUserSecret;

    try
      DB1.Connect;
    except
      Error := True;
    end;
  end;

  { // nur zu Testzwecken
  S :='';
  if urSelect in Result then S :=S+'SELECT : JA'+#13 else S :=S+'SELECT : NEIN'+#13;
  if urInsert in Result then S :=S+'INSERT : JA'+#13 else S :=S+'INSERT : NEIN'+#13;
  if urUpdate in Result then S :=S+'UPDATE : JA'+#13 else S :=S+'UPDATE : NEIN'+#13;
  if urDelete in Result then S :=S+'DELETE : JA'+#13 else S :=S+'DELETE : NEIN'+#13;
  if urCreate in Result then S :=S+'CREATE : JA'+#13 else S :=S+'CREATE : NEIN'+#13;
  if urAlter  in Result then S :=S+'ALTER : JA'+#13 else S :=S+'ALTER : NEIN'+#13;
  if urDrop   in Result then S :=S+'DROP : JA'+#13 else S :=S+'DROP : NEIN'+#13;
  //if urIndex  in Result then S :=S+'INDEX : JA'+#13 else S :=S+'INDEX : NEIN'+#13;


  //MessageDlg('Userrechte :'+#13#10+S,mtinformation, [mbok],0);

  if (urSelect in Result)and
    (urInsert in Result)and
    (urUpdate in Result)and
    (urDelete in Result)and
    (urCreate in Result)and
    (urAlter in Result)and
    (urDrop in Result) then
  begin
   MessageDlg('Benutzer darf Update ausführen !',mtinformation,[mbok],0);
  end;
  }

end;

//------------------------------------------------------------------------------
function TDM1.UpdateDatabase(Data: TJvStrHolder; var Warnings, Errors: Integer; LogFileName: String): boolean;
var
  Idx: Integer;
  S, S1, S2: String;
  F: TextFile;
  FN: String;
begin
  FN := LogDir + LogFileName+'_' + FormatDateTime('yyyy_mm_dd_hh_mm_ss',Now)+'.log';

  AssignFile (F, FN);

  if not FileExists(FN) then
    FileClose(FileCreate(FN));

  Append(F);

  Warnings := 0;
  Errors := 0;
  try
    UniQuery.Close;
    UniQuery.Sql.Clear;
    S2 := '';

    for idx := 0 to Data.Strings.Count-1 do
    begin
      s := Data.Strings[idx];
      S1 := s;
      while (Length(S1) > 0) and (S1[Length(S1)] = ' ') do
        delete(S1, Length(S1), 1);
      if (pos(';', s1) > 0) and (pos(';', s1) = Length(s1)) then
      begin
        delete(s, Length(s1), 1);
        if Length(S) > 0 then
          S2 := S2+S;
        try
          if (Length(S) > 0) and (S[1] = ';') then
            delete(s, 1, 1);
          UniQuery.Sql.Text := S2;
          UniQuery.ExecSql;
        except
          on e:exception do
          begin
            inc(Warnings);
            Writeln (F,'SQL:'+S2);
            Writeln (F,'RES:'+e.Message);
            Writeln (F);
          end;
        end;

        UniQuery.Close;
        UniQuery.Sql.Clear;
        S2 :='';
      end else
        if (Length(S) > 0) and (s[1] <> '#') then
          S2 := S2+#13#10+S;
    end;
    Result := True;
  except
    inc(Errors);
    Result := False;
    UniQuery.Close;
    UniQuery.Sql.Clear;
  end;
  CloseFile(F);
end;

//------------------------------------------------------------------------------
function TDM1.IncNummer(Quelle: Integer): Int64;
var
  F: Integer;
begin
  if (Quelle > 10) and (Quelle < 20) then
    Quelle := 10;

  NummerTab.Close;
  NummerTab.Sql.Clear;
  NummerTab.Sql.Add('select VAL_INT as QUELLE, VAL_CHAR as FORMAT,');
  NummerTab.Sql.Add('VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, MAINKEY, NAME');
  NummerTab.Sql.Add('from REGISTRY');
  NummerTab.Sql.Add('where MAINKEY="MAIN\\NUMBERS"');
  NummerTab.Sql.Add('and VAL_INT=:ID');

  NummerTab.ParamByName('ID').Value := Quelle;
  NummerTab.Open;
  if NummerTab.RecordCount > 0 then
  begin
    Result := NummerTabNext_Num.AsLargeInt;
    NummerTab.Edit;
    try
      F := Length(NummerTabFormat.AsString);
      NummerTabNext_Num.AsLargeInt := NummerTabNext_Num.AsLargeInt+1;

      if Length(NummerTabNext_Num.AsString) > F then
        NummerTabNext_Num.AsLargeInt := 1;

      NummerTab.Post;
    except
      NummerTab.Cancel;
    end;
  end else
  begin
    // Nummer existiert nicht
    InNewNummer := True;
    try
      NummerTab.Append;
      try
        NummerTabQUELLE.Value     := Quelle;
        NummerTabNEXT_NUM.Value   := 1;
        NummerTabFORMAT.Value     := '000000';
        NummerTabMainKey.Value    := 'MAIN\NUMBERS';
        NummerTabMAXLEN.AsInteger := 6;
        NummerTabNAME.AsString    := IntToStr(QUELLE);
        NummerTab.Post;
        Result :=1;
      except
        NummerTab.Cancel;
      end;
    finally
      InNewNummer := False;
    end;
  end;
  NummerTab.Close;
end;

//------------------------------------------------------------------------------
function TDM1.IncNummerStr(Quelle: Integer): String;
var
  Max: Integer;
  Num: Int64;
  Format: String;
begin
  if (Quelle > 10) and (Quelle < 20) then
    Quelle := 10;

  NummerTab.Close;
  NummerTab.Sql.Clear;
  NummerTab.Sql.Add('select VAL_INT as QUELLE, VAL_CHAR as FORMAT,');
  NummerTab.Sql.Add('VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, MAINKEY, NAME');
  NummerTab.Sql.Add('from REGISTRY');
  NummerTab.Sql.Add('where MAINKEY="MAIN\\NUMBERS"');
  NummerTab.Sql.Add('and VAL_INT=:ID');

  NummerTab.ParamByName('ID').Value := Quelle;
  NummerTab.Open;
  if NummerTab.RecordCount > 0 then
  begin
    Num := NummerTabNext_Num.AsLargeInt;
    NummerTab.Edit;
    try
      Max    := NummerTabMaxLen.AsInteger;
      Format := NummerTabFormat.AsString;

      NummerTabNext_Num.AsLargeInt := Num+1;

      if Length(IntToStr(Num)) > Max then
        NummerTabNext_Num.AsLargeInt := 1;

      NummerTab.Post;
    except
      NummerTab.Cancel;
    end;
  end else
  begin
    // Nummer existiert nicht
    Format := '000000';
    Num    := 1;
    Max    := 6;

    InNewNummer := True;
    try
      NummerTab.Append;
      try
        NummerTabQUELLE.Value     := Quelle;
        NummerTabNEXT_NUM.Value   := 1;
        NummerTabFORMAT.Value     := Format;
        NummerTabMainKey.Value    := 'MAIN\NUMBERS';
        NummerTabMAXLEN.AsInteger := Max;
        NummerTabNAME.AsString    := IntToStr(QUELLE);
        NummerTab.Post;
      except
        NummerTab.Cancel;
      end;
    finally
      InNewNummer := False;
    end;
  end;
  NummerTab.Close;

  Result := FormatFloat(Format, Num);
end;

//------------------------------------------------------------------------------
function tDM1.GetNummerFormat(Quelle: Integer): String;
begin
  if NummerTab.Active then
    NummerTab.Close;

  NummerTab.Sql.Clear;
  NummerTab.Sql.Add('select VAL_INT as QUELLE, VAL_CHAR as FORMAT,');
  NummerTab.Sql.Add('VAL_INT2 as NEXT_NUM, VAL_INT3 as MAXLEN, MAINKEY, NAME');
  NummerTab.Sql.Add('from REGISTRY');
  NummerTab.Sql.Add('where MAINKEY="MAIN\\NUMBERS"');
  NummerTab.Sql.Add('and VAL_INT=:ID');

  NummerTab.ParamByName('ID').Value := Quelle;
  NummerTab.Open;

  if NummerTab.RecordCount = 0 then
  begin
    InNewNummer := True;
    try
      NummerTab.Append;
      try
        NummerTabQUELLE.Value     := Quelle;
        NummerTabNEXT_NUM.Value   := 1;
        NummerTabFORMAT.Value     := '000000';
        NummerTabMainKey.Value    := 'MAIN\NUMBERS';
        NummerTabName.AsString    := Inttostr(Quelle);
        NummerTab.Post;
      except
        NummerTab.Cancel;
      end;
    finally
      InNewNummer := False;
    end;
  end;

  Result := NummerTabFORMAT.AsString;

  NummerTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.ReadMandanten (App : String);
var
  IniName: string;
  Ini: TIniFile;
  po, idx, i: integer;
  S, S1, PW, PWC: String;
begin
  IniName := ExtractFilePath(ParamStr(0))+'CAO32_DB.CFG';
  ini := TIniFile.create(ininame);
  try
    po := 1;
    while (po < 1001) and
          (ini.ReadString('MANDANTEN', 'M'+formatfloat('000', po), '@ERROR@') <> '@ERROR@') do
    begin
      idx := Length(MandantTab);
      setLength(MandantTab, idx+1);

      MandantTab[Idx].Name   := ini.readstring('MANDANTEN', 'M'+formatfloat ('000',po), '');
      MandantTab[Idx].Server := ini.readstring('MANDANTEN', 'M'+formatfloat ('000',po)+'_SERVER', '');
      MandantTab[Idx].User   := ini.readstring('MANDANTEN', 'M'+formatfloat ('000',po)+'_USER', '');
      PW                     := ini.readstring('MANDANTEN', 'M'+formatfloat ('000',po)+'_PASS', '');
      PWC                    := ini.readstring('MANDANTEN', 'M'+formatfloat ('000',po)+'_PASS_C', '');
      if (Length(PW) > 0) then
      begin
        Cipher.Decoded := PW;
        PWC := Cipher.Encoded;
        if Length(PWC) > 0 then
        begin
          S1 := '';
          for i := 1 to Length(PWC) do
            S1 := S1 + IntToHex(Ord(PWC[i]), 2);
          try
            ini.writestring('MANDANTEN', 'M'+formatfloat('000',po)+'_PASS_C', S1);
            ini.writestring('MANDANTEN', 'M'+formatfloat('000',po)+'_PASS', '');
          except
            MessageDlg(Format(_('Fehler beim schreiben in die '+#13#10+
                                'Konfigurationsdatei %s.'),
                                [IniName]), mterror, [mbok], 0);
          end;
        end;
      end else
      begin
        if Length(PWC) >= 2 then
        begin
          try
            S1 := '';
            for i := 1 to Length(PWC) div 2 do
              S1 := S1+CHR(StrToInt('$'+Copy(PWC, (i-1)*2+1, 2)));
            Cipher.Encoded := S1;
            PW := Cipher.Decoded;
          except
            PW := '';
          end;
        end;
      end;

      MandantTab[Idx].Pass := PW;
      MandantTab[Idx].DB   := ini.readstring('MANDANTEN','M'+formatfloat('000',po)+'_DB', '');
      MandantTab[Idx].Port := ini.readinteger('MANDANTEN','M'+formatfloat('000',po)+'_PORT', 3306);
      inc(po);
    end;

    AktMandant := Ini.ReadString(APP, 'AKTMANDANT', '');
    if (AktMandant = '') and (idx > 0) then
      AktMandant := MandantTab[0].Name;

    UseNTUserName   := Ini.ReadBool(APP, 'USE_NTUSERNAME', True);
    DefaultUserName := Ini.ReadString(APP, 'DEFAULT_USER', '');
    DefaultPassword := Ini.ReadString(APP, 'DEFAULT_PASSWORD', '');
    PWC             := Ini.ReadString(APP, 'DEFAULT_PASSWORD_C', '');

    if Length(DefaultPassword) > 0 then
    begin
      Cipher.Decoded := DefaultPassword;
      PWC := Cipher.Encoded;
      if Length(PWC) > 0 then
      begin
        S1 := '';
        for i := 1 to Length(PWC) do
          S1 := S1+IntToHex(Ord(PWC[i]), 2);
        try
          Ini.writestring(APP, 'DEFAULT_PASSWORD_C', S1);
          Ini.WriteString(APP, 'DEFAULT_PASSWORD', '');
        except
          MessageDlg(Format(_('Fehler beim schreiben in die '+#13#10+
                              'Konfigurationsdatei %s.'),
                              [IniName]), mterror, [mbok], 0);
        end;
      end;
    end else
    begin
      if Length(PWC) > 2 then
      begin
        try
          S1 := '';
          for i:=1 to Length(PWC) div 2 do
            S1 := S1+CHR(StrToInt('$'+Copy(PWC, (I-1)*2+1, 2)));
          Cipher.Encoded := S1;
          DefaultPassword := Cipher.Decoded;
        except
          DefaultPassword := '';
        end;
      end;
    end;

    //PLZ-Verion lesen...
    S := Ini.ReadString('VERSION', 'PLZ', '1.06');
    if DecimalSeparator <> '.' then
    begin
      while (Pos('.',S)>0) do
        S[Pos('.',S)] := DecimalSeparator;
    end;
    PLZ_VERSION := CAO_Round(StrToFloat(S)*100);

    //BLZ-Verion lesen...
    S := Ini.ReadString('VERSION', 'BLZ', '1.06');
    if DecimalSeparator <> '.' then
    begin
      while (Pos('.',S) > 0) do
        S[Pos('.',S)] := DecimalSeparator;
    end;
    BLZ_VERSION := CAO_round(StrToFloat(S)*100);

    //Kassen-Display DLL-Name ermitteln
    DisplayDLL := Ini.ReadString('DISPLAY', 'DLL_NAME', '');

  finally
    ini.free;
  end;
end;

//------------------------------------------------------------------------------
procedure tDM1.SaveMandanten;
var
  IniName: string;
  Ini: TIniFile;
  idx, i: integer;
  S1, PW, PWC: String;
  MySList: TStringList;
begin
  if Length(MandantTab) = 0 then
    exit;

  ininame := ExtractFilePath(paramstr(0))+'CAO32_DB.CFG';
  ini := tinifile.create(ininame);
  MySList := TStringList.Create;
  try
    ini.ReadSectionValues('MANDANTEN', MySList);
    ini.EraseSection('MANDANTEN');
    try
      for Idx := 0 to Length(MandantTab)-1 do
      begin
        ini.Writestring('MANDANTEN', 'M'+formatfloat('000',Idx+1), MandantTab[Idx].Name);
        ini.Writestring('MANDANTEN', 'M'+formatfloat('000',Idx+1)+'_SERVER', MandantTab[Idx].Server);
        ini.Writestring('MANDANTEN', 'M'+formatfloat('000',Idx+1)+'_USER', MandantTab[Idx].User);
        PW := MandantTab[Idx].Pass;
        if (Length(PW) > 0) then
        begin
          Cipher.Decoded := PW;
          PWC := Cipher.Encoded;
          if Length(PWC) > 0 then
          begin
            S1 := '';
            for i := 1 to Length(PWC) do
              S1 := S1+IntToHex(Ord(PWC[i]), 2);
            ini.writestring('MANDANTEN', 'M'+formatfloat('000', IDX+1)+'_PASS_C', S1);
            ini.writestring('MANDANTEN', 'M'+formatfloat('000', IDX+1)+'_PASS', '');
          end;
        end;

        ini.Writestring('MANDANTEN', 'M'+formatfloat('000', Idx+1)+'_DB', MandantTab[Idx].DB);
        //NEU
        ini.Writeinteger('MANDANTEN', 'M'+formatfloat('000', Idx+1)+'_PORT', MandantTab[Idx].Port);
        ini.WriteBool('MANDANTEN', 'M'+formatfloat('000', Idx+1)+'_SHOW_LOGINDIALOG', False);
        ini.WriteBool('MANDANTEN', 'M'+formatfloat('000', Idx+1)+'_USE_NTUSERNAME', False);
      end;

      // aktuelle Mandanten der einzelnen programme zurückschreiben
      if MySList.Count > 0 then
      begin
        repeat
          if Pos('CAO', UpperCase(MySList.Strings[0])) = 1 then
          begin
            ini.Writestring('MANDANTEN',
                            MySList.Names[0],
                            MySList.Values[MySList.Names[0]]
            );
          end;
          MySList.Delete(0);
        until MySList.Count=0;
      end;
    except
      MessageDlg(Format(_('Fehler beim schreiben in die '+#13#10+
                          'Konfigurationsdatei %s.'),
                          [IniName]), mterror, [mbok], 0);
    end;
  finally
    ini.free;
    MySList.Free;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.GetMandant(Name: String; var Daten: TMandantRec): Boolean;
var
  i: integer;
begin
  Result := False;
  Name := UpperCase(Name);
  if Length(MandantTab) > 0 then
  for i := 0 to Length(MandantTab)-1 do
  begin
    if UpperCase(MandantTab[i].Name) = Name then
    begin
      Daten := MandantTab[i];
      Result := True;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure tDM1.NewMandant(Daten: TMandantRec);
var
  i : Integer;
begin
  i := Length(MandantTab);
  SetLength(MandantTab, I+1);
  MandantTab[i] := Daten;
  SaveMandanten;
end;

//------------------------------------------------------------------------------
procedure tDM1.DeleteMandant(Name: String);
var
  i, j: Integer;
begin
  if Length(MandantTab) = 0 then
    exit;

  for i := 0 to Length(MandantTab)-1 do
  begin
    if MandantTab[i].Name = Name then
    begin
      if i < Length(MandantTab)-1 then
      begin
        for j := i+1 to Length(MandantTab)-1 do
        begin
          MandantTab[j-1] := MandantTab[j];
        end;
      end;
      SetLength(MandantTab, Length(MandantTab)-1);
    end;
  end;
  SaveMandanten;
end;

//------------------------------------------------------------------------------
function tDM1.ReadInteger(Key, Name: String; Default: Integer): Integer;
begin
  if not DB1.Connected then
    exit;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if RegTab.RecordCount > 0 then
      Result := RegTabVal_Int.AsInteger
    else
      Result :=Default;
    RegTab.Close;
  finally
   RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.ReadIntegerU(Key, Name: String; Default: Integer): Integer;
begin
  Result := 0;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  Result := ReadInteger(Key, Name, Default);
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteInteger(Key, Name: String; Value: Integer);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value := Key;
      RegTabName.Value := Name;
      RegTabVal_Int.AsInteger := Value;
      RegTabVal_Typ.AsInteger := 3;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end else
  if RegTabVal_Int.AsInteger<> Value then
  begin
    RegTab.Edit;
    try
      RegTabVal_Int.AsInteger := Value;
      RegTabVal_Typ.AsInteger := 3;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteIntegerU(Key, Name: String; Value: Integer);
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  WriteInteger (Key, Name, Value);
end;

//------------------------------------------------------------------------------
function tDM1.ReadBoolean(Key, Name: String; Default: Boolean): Boolean;
begin
  if not DB1.Connected then
    exit;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if RegTab.RecordCount > 0 then
      Result := RegTabVal_Int.AsInteger = 1
    else
      Result := Default;
    RegTab.Close;
  finally
   RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.ReadBooleanU(Key, Name: String; Default: Boolean): Boolean;
begin
  Result := False;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  Result := ReadBoolean(Key, Name, Default);
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteBoolean(Key, Name: String; Value: Boolean);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value := Key;
      RegTabName.Value := Name;
      RegTabVal_Int.AsInteger := ord(Value);
      RegTabVal_Typ.AsInteger := 3;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end else
  if RegTabVal_Int.AsInteger <> ord(Value) then
  begin
    RegTab.Edit;
    try
      RegTabVal_Int.AsInteger := ord(Value);
      RegTabVal_Typ.AsInteger := 3;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteBooleanU(Key, Name: String; Value: Boolean);
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  WriteBoolean(Key, Name, Value);
end;

//------------------------------------------------------------------------------
function tDM1.ReadString(Key, Name, Default: String): String;
begin
  if not DB1.Connected then
    exit;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if RegTab.RecordCount > 0 then
      Result := RegTabVal_Char.AsString
    else
      Result :=Default;
    RegTab.Close;
  finally
    RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.ReadStringU(Key, Name, Default: String): String;
begin
  Result := '';
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  Result := ReadString(Key, Name, Default);
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteString (Key, Name, Value: String);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value := Key;
      RegTabName.Value := Name;
      RegTabVal_Char.AsString := Value;
      RegTabVal_Typ.AsInteger := 1;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end  else
  if RegTabVal_Char.AsString <> Value then
  begin
    RegTab.Edit;
    try
      RegTabVal_Char.AsString := Value;
      RegTabVal_Typ.AsInteger := 1;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteStringU(Key, Name, Value: String);
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  WriteString(Key, Name, Value);
end;

//------------------------------------------------------------------------------
function tDM1.ReadLongString(Key, Name, Default: String): String;
begin
  if not DB1.Connected then
    exit;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if RegTab.RecordCount > 0 then
      Result := RegTabVal_Blob.AsString
    else
      Result := Default;
    RegTab.Close;
  finally
    RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.ReadLongStringU(Key, Name, Default: String): String;
begin
  Result := '';
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  Result := ReadLongString(Key, Name, Default);
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteLongString(Key, Name, Value: String);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value := Key;
      RegTabName.Value := Name;
      RegTabVal_Blob.AsString := Value;
      RegTabVal_Typ.AsInteger := 5;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end else
  if RegTabVal_Blob.AsString <> Value then
  begin
    RegTab.Edit;
    try
      RegTabVal_Blob.AsString := Value;
      RegTabVal_Typ.AsInteger := 5;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteLongStringU(Key, Name, Value: String);
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  WriteLongString(Key, Name, Value);
end;

//------------------------------------------------------------------------------
function tDM1.ReadDouble(Key, Name: String; Default: Double): Double;
begin
  if not DB1.Connected then
    exit;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if RegTab.RecordCount > 0 then
      Result := RegTabVal_Double.AsFloat
    else
      Result := Default;
    RegTab.Close;
  finally
    RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.ReadDoubleU(Key, Name: String; Default: Double): Double;
begin
  Result := 0;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  Result := ReadDouble(Key, Name, Default);
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteDouble(Key, Name: String; Value: Double);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value := Key;
      RegTabName.Value := Name;
      RegTabVal_Double.AsFloat := Value;
      RegTabVal_Typ.AsInteger := 4;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end else
  if RegTabVal_Double.AsFloat<> Value then
  begin
    RegTab.Edit;
    try
      RegTabVal_Double.AsFloat := Value;
      RegTabVal_Typ.AsInteger := 4;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteDoubleU(Key, Name: String; Value: Double);
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;
  if Length(Key) > 0 then
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER+'\'+KEY
  else
    Key := 'USERSETTINGS\'+CAOSecurity.CurrUSER;
  WriteDouble(Key, Name, Value);
end;

//------------------------------------------------------------------------------
function tDM1.ReadLayout(Key, Name: String; var Data: tStream; Version: Integer = 0): Boolean;
begin
  if not DB1.Connected then
    exit;

  Result := False;

  RegTab.ReadOnly := True;
  try
    RegTab.Close;
    RegTab.ParamByName('KEY').AsString := Key;
    RegTab.ParamByName('NAME').AsString := Name;
    RegTab.Open;
    if (RegTab.RecordCount > 0) and (not RegTabVal_Bin.IsNull) then
    begin
      Data.Size := 0;
      Data.Position := 0;
      RegTabVal_Bin.SaveToStream(Data);
      Data.Position := 0;
      Result := RegTabVal_Int.AsInteger = Version;
    end;
    RegTab.Close;
  finally
    RegTab.ReadOnly := False;
  end;
end;

//------------------------------------------------------------------------------
procedure tDM1.WriteLayout(Key, Name: String; Data: tStream; Version: Integer = 0);
begin
  if not DB1.Connected then
    exit;

  RegTab.Close;
  RegTab.ParamByName('KEY').AsString := Key;
  RegTab.ParamByName('NAME').AsString := Name;
  RegTab.Open;
  if RegTab.RecordCount = 0 then
  begin
    RegTab.Append;
    try
      RegTabMainKey.Value    := Key;
      RegTabName.Value       := Name;
      RegTabVAL_TYP.Value    := 7;
      RegTabVal_Int.AsInteger := Version;
      Data.Position :=  0;
      RegTabVAL_BIN.LoadFromStream(Data);
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end  else
  begin
    RegTab.Edit;
    try
      Data.Position := 0;
      RegTabVAL_BIN.LoadFromStream(Data);
      RegTabVAL_TYP.Value := 7;
      RegTabVal_INT.AsInteger := Version;
      RegTab.Post;
    except
      RegTab.Cancel;
    end;
  end;

  RegTab.Close;
end;

//------------------------------------------------------------------------------
procedure tDM1.GridSaveLayout(Grid: tDBGrid; Sec: String; Version: Integer=0);
var
  M: TMemoryStream;
begin
  if Length(CAOSecurity.CurrUSER) = 0 then
    exit;

  m := TMemorystream.create;
  try
    Grid.Columns.SaveToStream(M);
    WriteLayout('USERSETTINGS\'+CAOSecurity.CurrUser+'\LAYOUT', SEC, M, Version);
  finally
    M.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.GridLoadLayout(var Grid: tDBGrid; Sec: String; Version: Integer=0);
var
  M: TMemoryStream;
  I: Integer;
  Found: Boolean;
begin
  M := TMemoryStream.Create;
  try
    try
      if ReadLayout('USERSETTINGS\'+CAOSecurity.CurrUser+'\LAYOUT', SEC, TStream(M), Version) then
        Grid.Columns.LoadFromStream(M);
      {
      if Grid.Columns.Count>0 then
      begin
        repeat
          Found := False;
          for i:=0 to Grid.Columns.Count-1 do
          begin
            if not assigned(Grid.Columns[i].Field) then
            begin
              Grid.Columns[i].Free;
              Found := True;
              Break;
            end;
          end;
        until not Found;
      end;
      }
    except
    end;
  finally
    M.Free;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_Rechnung (Journal_ID : Integer):String; // liefert Rechnungnummer zurück
var
  Pos: Integer;
  SNSql: String;
begin
  Result := '';

  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName ('ID').Value := Journal_ID;
      JourTab.Open;
      JourTab.Edit;

      // neue Rechnungsnummer holen, aber nur wenn USE_SHOP_ORDERID = False

      if (not ReadBoolean('SHOP', 'USE_SHOP_ORDERID', False)) or (JourTabSHOP_ID.AsInteger < 1) then
         JourTabVRENUM.Value := IncNummerStr (VK_RECH);

      Result := JourTabVRENUM.Value;

      JourTabSTADIUM.Value := 22;
      JourTabRDatum.Value  := now;
      JourTabQuelle.Value  := VK_RECH;
      JourTabQuelle_Sub.Value := 1; // Rechnung

      JourTabKONTOAUSZUG.Value := -1;
      JourTabUW_NUM.Value := -1;
      JourTabBANK_ID.Value :=  -1;

      JourTabIST_Betrag.Value := 0;
      JourTabIST_Anzahlung.Value := 0;
      JourTabFreigabe1_Flag.Value := False;
      JourTabMAHNKOSTEN.Value := 0;

      // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
      // falls diese noch nicht zugewiesen sind
      KunTab.Close;
      KunTab.ParamByName ('ID').AsInteger := JourTabAddr_ID.Value;
      KunTab.Open;

      if KunTab.RecordCount = 1 then
      begin
        KunTab.Edit;
        if KunTabKun_Zahlart.AsInteger < 0 then
          KunTabKun_Zahlart.Value := JourTabZahlart.Value;
        if KunTabKun_Liefart.AsInteger < 0 then
          KunTabKun_Liefart.Value := JourTabLiefart.Value;
        KunTab.Post;
      end;

      KunTab.Close;

      case JourTabZahlart.Value of
        //bar bzw. scheck
        1,5:
        begin
          if JourTabSOLL_SKONTO.Value > 0 then
          begin
            JourTabStadium.Value := 80+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := JourTabSOLL_SKONTO.Value;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value :=
              JourTabBSumme.Value-(JourTabBSumme.Value / 100) *
              JourTabSOLL_SKONTO.Value;
          end else
          begin
            JourTabStadium.Value := 90+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := 0;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value := JourTabBSumme.Value;
          end;
        end;
        //Überweisung, Lastschrift, EC-Karte u.s.w.
        else
          JourTabStadium.Value := 20+JourTabZahlart.Value;  //KL16052005
      end;

      // Wenn MWST-Freie Rechnung dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;
      JourTab.Post;

      if JourTabZahlArt.Value = 1 then  // Kassenbuchung
      begin
        BucheKasse(JourTabIST_Zahldat.Value,
                   VK_RECH,JourTabRec_ID.Value,
                   JourTabVReNum.Value,
                   JourTabGegenKonto.Value,
                   JourTabIST_Skonto.Value,
                   JourTabIST_Betrag.Value,
                   'ZE VK-RE '+JourTabKun_Name1.Value
        );
      end;

      JPosTab.Close;
      JPosTab.ParamByName ('ID').Value := Journal_ID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
        JPosTab.Edit;

        //MWST_Code löschen, wenn MwSt-freier Beleg
        if JourTabMWST_FREI_FLAG.AsBoolean then
          JPosTabSteuer_Code.Value := 0;

        // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
            (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Artikel Buchen
        if (JPosTabGebucht.Value = False) and
           ((JPosTabArtikelTyp.Value =' N') or
            (JPosTabArtikelTyp.Value = 'X')) and
            (JPosTabARTIKEL_ID.Value > -1) then
        begin
          // Bei Stücklistenunterartikeln herausfinden ob diese
          // "normale" Artikel sind
          if JPosTabArtikelTyp.Value = 'X' then
          begin
            UniQuery.Close;
            UniQuery.Sql.Text := 'SELECT ARTIKELTYP FROM ARTIKEL '+
                                 'WHERE REC_ID='+
                                 IntToStr(JPosTabARTIKEL_ID.AsInteger
            );
            UniQuery.Open;
            if (UniQuery.RecordCount = 1) and
               (UniQuery.FieldByName('ARTIKELTYP').AsString = 'N') then
            begin
              // Menge erniedrigen , aber nur bei 'N'
              ArtMengeTab.Close;
              ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.AsInteger;
              ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value;
              ArtMengeTab.ExecSql;
            end;
            UniQuery.Close;
          end else
          begin
            // Menge erniedrigen
            ArtMengeTab.Close;
            ArtMengeTab.ParamByName ('ID').Value := JPosTabARTIKEL_ID.AsInteger;
            ArtMengeTab.ParamByName ('SUBMENGE').Value := JPosTabMenge.Value;
            ArtMengeTab.ExecSql;
          end;

          JPosTabGebucht.Value := True;
        end;

        // Daten aktualisieren
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value  := VK_RECH;
        JPosTabQuelle_Sub.Value := 1; // Rechnung

        JPosTab.Post;

        // Lieferschein(e) aktualisieren
        if (JPosTabVLSNum.AsString <> '') and
           (JPosTabVLSNum.AsString <> '0') then
        begin
          UniQuery.close;
          UniQuery.sql.clear;
          UniQuery.sql.add('update JOURNAL');
          UniQuery.sql.add('set STADIUM=90, VRENUM="'+JPosTabVRENum.Value+'", RDATUM=:RDATUM');
          UniQuery.sql.add('where QUELLE=2 and VLSNUM="'+JPosTabVLSNum.AsString+'"');
          UniQuery.parambyname('RDATUM').AsDateTime := JourTabRDatum.Value;
          UniQuery.ExecSql;
          UniQuery.close;
          UniQuery.sql.clear;
        end;
        JPosTab.Next;
      end;

      // im Artkikel die MENGE_VKRE_EDI aktualisieren
      UpdateArtikelEdiMenge(VK_RECH_EDI, JPosTabArtikel_ID.AsInteger,0);

      if JourTabKFZ_ID.Value >= 0 then
      begin
        ReKFZTab.Close;
        ReKFZTab.ParamByName('KID').AsInteger := JourTabKFZ_ID.Value;
        ReKFZTab.Open;
        if ReKFZTab.RecordCount = 1 then
        begin
          ReKFZTab.Edit;
          ReKFZTabLE_BESUCH.Value := JourTabRDAtum.Value;
          ReKFZTabKM_STAND.Value := JourTabKM_Stand.Value;

          try
            ReKFZTab.Post;
          except
            ReKFZTab.Cancel;
          end;
        end;
        ReKFZTab.Close;
      end;

      //Seriennumern aktualisieren
      try
        {
        dm1.UniQuery.close;
        dm1.UniQuery.sql.text :='UPDATE ARTIKEL_SERNUM SET VERK_NUM='+
                                IntToStr(JourTabVRENUM.AsInteger)+
                                ' where VK_JOURNAL_ID='+
                                IntToStr(JourTabRec_ID.AsInteger);
        dm1.UniQuery.ExecSql;
        dm1.UniQuery.close;  }

        //NEU
        UniQuery.Close;
        UniQuery.Sql.Text :=
          'select JPS.QUELLE,JPS.JOURNAL_ID,JPS.JOURNALPOS_ID,'+
          'JPS.ARTIKEL_ID,JPS.SNUM_ID from JOURNALPOS as JP, '+
          'JOURNALPOS_SERNUM as JPS where JP.JOURNAL_ID='+
          IntToStr(JourTabRec_ID.AsInteger)+
          ' and JP.SN_FLAG="Y" and JP.MENGE>0 and '+
          'JP.ARTIKEL_ID=JPS.ARTIKEL_ID and '+
          'JP.REC_ID=JPS.JOURNALPOS_ID and '+
          'JP.JOURNAL_ID=JPS.JOURNAL_ID';

        SNSql := '';
        UniQuery.Open;
        while not UniQuery.Eof do
        begin
          SNSql :=SNSql+
            'UPDATE ARTIKEL_SERNUM SET STATUS="VK_RECH" '+
            'WHERE ARTIKEL_ID='+
            IntToStr(Uniquery.FieldByName('ARTIKEL_ID').AsInteger)+
            ' and SNUM_ID='+
            IntToStr(Uniquery.FieldByName('SNUM_ID').AsInteger)+';';
            UniQuery.Next;
        end;
        UniQuery.Close;

        ZBatchSql1.Script.Text :=
          'UPDATE JOURNALPOS_SERNUM SET QUELLE=3 '+
          'where JOURNAL_ID='+IntToStr(JourTabRec_ID.AsInteger)+';';

        if Length(SNSql) > 0 then
          ZBatchSql1.Script.Add(SNSql);

        ProgressForm.Init(_('Seriennummern aktualisieren'));
        try
          ProgressForm.Start;
          ZBatchSql1.Execute;
        finally
          ProgressForm.Stop;
        end;
      except
        MessageDlg(_('Fehler beim aktualisieren der Seriennummern.'), mterror, [mbok], 0);
      end;

      JPosTab.Close;
      JourTab.Close;

      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.

    except
      MessageDlg(_('Fehler beim Buchen der Rechnung !'), mterror, [mbok], 0);
      //Transact1.RollBack;
      DB1.Rollback; //16.10.09-ud.
      Result :='';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_BCKasse(Journal_ID: Integer): String; // liefert BON-Nummer zurück
var
  Pos: Integer;
  SNSql: String;
begin
  Result :='';
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName('ID').Value := Journal_ID;
      JourTab.Open;
      JourTab.Edit;
      // neue Rechnungsnummer holen
      JourTabVRENUM.Value := IncNummerStr ({VK_KASSE}22);

      Result := JourTabVRENUM.Value;

      JourTabSTADIUM.Value := 22;
      JourTabRDatum.Value  := now;
      JourTabQuelle.Value  := VK_RECH;
      JourTabQuelle_Sub.Value := 2; // Kasse

      JourTabKONTOAUSZUG.Value := -1;
      JourTabUW_NUM.Value := -1;
      JourTabBANK_ID.Value := -1;
      JourTabFreigabe1_Flag.Value := False;

      case JourTabZahlart.Value of
        //bar bzw. scheck oder ec-karte
        1,5,6:
        begin
          if JourTabSOLL_SKONTO.Value > 0 then
          begin
            JourTabStadium.Value := 80+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := JourTabSOLL_SKONTO.Value;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value :=
              JourTabBSumme.Value-(JourTabBSumme.Value / 100) *
              JourTabSOLL_SKONTO.Value;
          end else
          begin
              JourTabStadium.Value := 90+JourTabZahlart.Value;
              JourTabIST_SKONTO.Value := 0;
              JourTabIST_ANZAHLUNG.Value := 0;
              JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
              JourTabIST_BETRAG.Value := JourTabBSumme.Value;
          end;
        end;
      end;

      // Wenn MWST-Freier Kassenbeleg dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;

      JourTab.Post;

      {    if JourTabZahlArt.Value = 1 then  // Kassenbuchung
      begin
           BucheKasse (JourTabIST_Zahldat.Value,
                       VK_RECH,JourTabRec_ID.Value,
                       Inttostr(JourTabVReNum.Value),
                       JourTabGegenKonto.Value,
                       JourTabIST_Skonto.Value,
                       JourTabIST_Betrag.Value,
                       'ZE VK-RE '+JourTabKun_Name1.Value);

      end; }

      JPosTab.Close;
      JPosTab.ParamByName('ID').Value := Journal_ID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
        JPosTab.Edit;

        //MWST_Code löschen, wenn MwSt-freier Beleg
        if JourTabMWST_FREI_FLAG.AsBoolean then
          JPosTabSteuer_Code.Value := 0;

        // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
           (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Artikel Buchen
        if (JPosTabGebucht.Value = False) and
           ((JPosTabArtikelTyp.Value = 'N') or (JPosTabArtikelTyp.Value = 'X')) and
           (JPosTabARTIKEL_ID.Value > -1) then
        begin
          // Bei Stücklistenunterartikeln herausfinden ob diese
          // "normale" Artikel sind
          if JPosTabArtikelTyp.Value = 'X' then
          begin
            UniQuery.Close;
            UniQuery.Sql.Text := 'SELECT ARTIKELTYP FROM ARTIKEL '+
                                 'WHERE REC_ID='+
                                 IntToStr(JPosTabARTIKEL_ID.AsInteger);
            UniQuery.Open;
            if (UniQuery.RecordCount = 1) and
               (UniQuery.FieldByName('ARTIKELTYP').AsString = 'N') then
            begin
              // Menge erniedrigen , aber nur bei 'N'
              ArtMengeTab.Close;
              ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.AsInteger;
              ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value;
              ArtMengeTab.ExecSql;
            end;
            UniQuery.Close;
          end else
          begin
            // Menge erniedrigen
            ArtMengeTab.Close;
            ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.AsInteger;
            ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value;
            ArtMengeTab.ExecSql;
          end;

          JPosTabGebucht.Value := True;
        end;

        // Daten aktualisieren
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value := VK_RECH;
        JPosTabQuelle_Sub.Value := 2; // Kasse

        JPosTab.Post;
        JPosTab.Next;
      end;

      // im Artkikel die MENGE_VKRE_EDI aktualisieren
      UpdateArtikelEdiMenge(VK_RECH_EDI, JPosTabArtikel_ID.AsInteger, 0);

      //Seriennumern aktualisieren
      try
        //NEU
        UniQuery.Close;
        UniQuery.Sql.Text :=
          'select JPS.QUELLE,JPS.JOURNAL_ID,JPS.JOURNALPOS_ID,'+
          'JPS.ARTIKEL_ID,JPS.SNUM_ID from JOURNALPOS as JP, '+
          'JOURNALPOS_SERNUM as JPS where JP.JOURNAL_ID='+
          IntToStr(JourTabRec_ID.AsInteger)+
          ' and JP.SN_FLAG="Y" and JP.MENGE>0 and '+
          'JP.ARTIKEL_ID=JPS.ARTIKEL_ID and '+
          'JP.REC_ID=JPS.JOURNALPOS_ID and '+
          'JP.JOURNAL_ID=JPS.JOURNAL_ID';

        SNSql :=  '';
        UniQuery.Open;
        while not UniQuery.Eof do
        begin
          SNSql := SNSql+
            'UPDATE ARTIKEL_SERNUM SET STATUS="VK_RECH" '+
            'WHERE ARTIKEL_ID='+
            IntToStr(Uniquery.FieldByName('ARTIKEL_ID').AsInteger)+
            ' and SNUM_ID='+
            IntToStr(Uniquery.FieldByName('SNUM_ID').AsInteger)+';';
          DM1.UniQuery.Next;
        end;
        UniQuery.Close;

        ZBatchSql1.Script.Text :=
          'UPDATE JOURNALPOS_SERNUM SET QUELLE=3 '+
          'where JOURNAL_ID='+IntToStr(JourTabRec_ID.AsInteger)+';';

        if Length(SNSql) > 0 then
          ZBatchSql1.Script.Add(SNSql);

        ProgressForm.Init(_('Seriennummern aktualisieren'));
        try
          ProgressForm.Start;
          ZBatchSql1.Execute;
        finally
          ProgressForm.Stop;
        end;
      except
        MessageDlg(_('Fehler beim aktualisieren der Seriennummern.'), mterror, [mbok], 0);
      end;

      JPosTab.Close;
      JourTab.Close;
      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.

    except
      MessageDlg(_('Fehler beim Buchen der Rechnung !'), mterror, [mbok], 0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result := '';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_Gutschrift(Journal_ID: Integer): String; // liefert Gutschriftnummer zurück
var
  Pos: Integer;
  SNSql: String;
begin
  Result :='';

  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName ('ID').Value :=Journal_ID;
      JourTab.Open;
      JourTab.Edit;


      JourTabVRENUM.Value  :=IncNummerStr (VK_GS);

      Result :=JourTabVRENUM.Value;

      JourTabSTADIUM.Value :=22;
      JourTabRDatum.Value  :=now;
      JourTabQuelle.Value  :=VK_GS;
      JourTabQuelle_Sub.Value :=1;

      JourTabKONTOAUSZUG.Value :=-1;
      JourTabUW_NUM.Value :=-1;
      JourTabBANK_ID.Value :=-1;

      JourTabIST_Betrag.Value :=0;
      JourTabIST_Anzahlung.Value :=0;
      JourTabFreigabe1_Flag.Value := False;
      JourTabMAHNKOSTEN.Value :=0;


      // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
      // falls diese noch nicht zugewiesen sind
      KunTab.Close;
      KunTab.ParamByName ('ID').AsInteger :=JourTabAddr_ID.Value;
      KunTab.Open;

      if KunTab.RecordCount=1 then
      begin
        KunTab.Edit;
        if KunTabKun_Zahlart.AsInteger < 0 then
          KunTabKun_Zahlart.Value := JourTabZahlart.Value;
        if KunTabKun_Liefart.AsInteger < 0 then
          KunTabKun_Liefart.Value := JourTabLiefart.Value;
        KunTab.Post;
      end;

      KunTab.Close;

      case JourTabZahlart.Value of
        //bar bzw. scheck
        1,5:
        begin
          if JourTabSOLL_SKONTO.Value > 0 then
          begin
            JourTabStadium.Value := 80+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := JourTabSOLL_SKONTO.Value;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value :=
              JourTabBSumme.Value-(JourTabBSumme.Value / 100) *
              JourTabSOLL_SKONTO.Value;
          end else
          begin
            JourTabStadium.Value := 90+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := 0;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value := JourTabBSumme.Value;
          end;
        end;
        //Überweisung, Lastschrift, EC-Karte u.s.w.
        else
          JourTabStadium.Value := 20+JourTabZahlart.Value;  //KL16052005
      end;


      JourTabNSUMME.AsFloat   := JourTabNSUMME.AsFloat *-1;
      JourTabMSUMME.AsFloat   := JourTabMSUMME.AsFloat *-1;
      JourTabBSUMME.AsFloat   := JourTabBSUMME.AsFloat *-1;

      JourTabNSUMME_0.AsFloat := JourTabNSUMME_0.AsFloat *-1;
      JourTabNSUMME_1.AsFloat := JourTabNSUMME_1.AsFloat *-1;
      JourTabNSUMME_2.AsFloat := JourTabNSUMME_2.AsFloat *-1;
      JourTabNSUMME_3.AsFloat := JourTabNSUMME_3.AsFloat *-1;

      JourTabMSUMME_0.AsFloat := JourTabMSUMME_0.AsFloat *-1;
      JourTabMSUMME_1.AsFloat := JourTabMSUMME_1.AsFloat *-1;
      JourTabMSUMME_2.AsFloat := JourTabMSUMME_2.AsFloat *-1;
      JourTabMSUMME_3.AsFloat :=JourTabMSUMME_3.AsFloat *-1;

      JourTabBSUMME_0.AsFloat := JourTabBSUMME_0.AsFloat *-1;
      JourTabBSUMME_1.AsFloat := JourTabBSUMME_1.AsFloat *-1;
      JourTabBSUMME_2.AsFloat := JourTabBSUMME_2.AsFloat *-1;
      JourTabBSUMME_3.AsFloat := JourTabBSUMME_3.AsFloat *-1;

      JourTabKOST_NETTO.AsFloat  := JourTabKOST_NETTO.AsFloat *-1;
      JourTabWERT_NETTO.AsFloat  := JourTabWERT_NETTO.AsFloat *-1;
      JourTabLOHN.AsFloat        := JourTabLOHN.AsFloat *-1;
      JourTabWare.AsFloat        := JourTabWare.AsFloat *-1;
      JourTabTKost.AsFloat       := JourTabTKost.AsFloat *-1;
      JourTabROHGEWINN.AsFloat   := JourTabROHGEWINN.AsFloat *-1;
      JourTabPROVIS_WERT.AsFloat := JourTabPROVIS_WERT.AsFloat *-1;



      // Wenn MWST-Freie Rechnung dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;

      JourTab.Post;
      {
      if JourTabZahlArt.Value = 1 then  // Kassenbuchung
      begin
           BucheKasse (JourTabIST_Zahldat.Value,
                       VK_RECH,JourTabRec_ID.Value,
                       JourTabVReNum.Value,
                       JourTabGegenKonto.Value,
                       JourTabIST_Skonto.Value,
                       JourTabIST_Betrag.Value,
                       'ZA VK-GS '+JourTabKun_Name1.Value);

      end;
      }
      JPosTab.Close;
      JPosTab.ParamByName('ID').Value := Journal_ID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
        JPosTab.Edit;

        //MWST_Code löschen, wenn MwSt-freier Beleg
        if JourTabMWST_FREI_FLAG.AsBoolean then
          JPosTabSteuer_Code.Value := 0;

        // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
           (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Artikel Buchen
        if (JPosTabGebucht.Value = False) and
           ((JPosTabArtikelTyp.Value = 'N') or (JPosTabArtikelTyp.Value = 'X')) and
           (JPosTabARTIKEL_ID.Value > -1) then
        begin
          // Bei Stücklistenunterartikeln herausfinden ob diese
          // "normale" Artikel sind
          if JPosTabArtikelTyp.Value = 'X' then
          begin
            UniQuery.Close;
            UniQuery.Sql.Text := 'SELECT ARTIKELTYP FROM ARTIKEL '+
                                 'WHERE REC_ID='+
                                 IntToStr(JPosTabARTIKEL_ID.AsInteger);
            UniQuery.Open;
            if (UniQuery.RecordCount = 1) and
               (UniQuery.FieldByName('ARTIKELTYP').AsString = 'N') then
            begin
              // Menge erhöhen , aber nur bei 'N'
              ArtMengeTab.Close;
              ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.AsInteger;
              ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value*-1;
              ArtMengeTab.ExecSql;
            end;
            UniQuery.Close;
          end else
          begin
            // Menge erniedrigen
            ArtMengeTab.Close;
            ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.AsInteger;
            ArtMengeTab.ParamByName ('SUBMENGE').Value :=JPosTabMenge.Value*-1;
            ArtMengeTab.ExecSql;
          end;

          JPosTabGebucht.Value := True;
        end;

        // Daten aktualisieren
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value := VK_GS;
        JPosTabQuelle_Sub.Value := 1;

        //Daten negieren
        JPOsTabMenge.AsFloat := JPosTabMenge.AsFloat * -1;

        JPosTabGPREIS.AsFloat := JPosTabGPREIS.AsFloat*-1;
        JPosTabG_RGEWINN.AsFloat := JPosTabG_RGEWINN.AsFloat*-1;
        JPosTabG_RABATT_BETRAG.AsFloat := JPosTabG_RABATT_BETRAG.AsFloat*-1;
        JPosTabPROVIS_WERT.AsFloat := JPosTabPROVIS_WERT.AsFloat*-1;

        JPosTab.Post;

        JPosTab.Next;
      end;

      // im Artkikel die MENGE_GS_EDI aktualisieren
      UpdateArtikelEdiMenge(VK_GS_EDI, JPosTabArtikel_ID.AsInteger, 0);

      if JourTabKFZ_ID.Value>=0 then
      begin
        ReKFZTab.Close;
        ReKFZTab.ParamByName('KID').AsInteger := JourTabKFZ_ID.Value;
        ReKFZTab.Open;
        if ReKFZTab.RecordCount = 1 then
        begin
          ReKFZTab.Edit;
          ReKFZTabLE_BESUCH.Value := JourTabRDAtum.Value;
          ReKFZTabKM_STAND.Value := JourTabKM_Stand.Value;

          try
            ReKFZTab.Post;
          except
            ReKFZTab.Cancel;
          end;
        end;
        ReKFZTab.Close;
      end;

      //Seriennumern aktualisieren
      try
        UniQuery.Close;
        UniQuery.Sql.Text :=
          'select JPS.QUELLE,JPS.JOURNAL_ID,JPS.JOURNALPOS_ID,'+
          'JPS.ARTIKEL_ID,JPS.SNUM_ID from JOURNALPOS as JP, '+
          'JOURNALPOS_SERNUM as JPS where JP.JOURNAL_ID='+
          IntToStr(JourTabRec_ID.AsInteger)+
          ' and JP.SN_FLAG="Y" and JP.MENGE>0 and '+
          'JP.ARTIKEL_ID=JPS.ARTIKEL_ID and '+
          'JP.REC_ID=JPS.JOURNALPOS_ID and '+
          'JP.JOURNAL_ID=JPS.JOURNAL_ID';

        SNSql := '';
        UniQuery.Open;
        while not UniQuery.Eof do
        begin
          SNSql := SNSql+
            'UPDATE ARTIKEL_SERNUM SET STATUS="LAGER" '+
            'WHERE ARTIKEL_ID='+
            IntToStr(Uniquery.FieldByName('ARTIKEL_ID').AsInteger)+
            ' and SNUM_ID='+
            IntToStr(Uniquery.FieldByName('SNUM_ID').AsInteger)+';';
          UniQuery.Next;
        end;
        UniQuery.Close;

        ZBatchSql1.Script.Text :=
          'UPDATE JOURNALPOS_SERNUM SET QUELLE=4 '+
          'where JOURNAL_ID='+IntToStr(JourTabRec_ID.AsInteger)+';';

        if Length(SNSql) > 0 then
          ZBatchSql1.Script.Add(SNSql);

        ProgressForm.Init(_('Seriennummern aktualisieren'));
        try
          ProgressForm.Start;
          ZBatchSql1.Execute;
        finally
          ProgressForm.Stop;
        end;
      except
         MessageDlg(_('Fehler beim aktualisieren der Seriennummern.'), mterror, [mbok], 0);
      end;

      JPosTab.Close;
      JourTab.Close;
      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.

    except
      MessageDlg(_('Fehler beim Buchen der Gutschrift !'),mterror,[mbok],0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result :='';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_Angebot(Journal_ID: Integer): String; // liefert AGB-Nummer zurück
var
  Pos: Integer;
begin
  Result :='';
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName('ID').Value := Journal_ID;
      JourTab.Open;
      JourTab.Edit;
      // neue Nummer holen
      JourTabVRENUM.Value  := IncNummerStr(VK_AGB);

      Result := JourTabVRENUM.Value;

      JourTabSTADIUM.Value        := 0;
      JourTabRDatum.Value         := now;
      JourTabQuelle.Value         := VK_AGB;

      JourTabKONTOAUSZUG.Value    := -1;
      JourTabUW_NUM.Value         := -1;
      JourTabBANK_ID.Value        := -1;

      JourTabIST_Betrag.Value     := 0;
      JourTabIST_Anzahlung.Value  := 0;
      JourTabFreigabe1_Flag.Value := False;

      // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
      // falls diese noch nicht zugewiesen sind
      KunTab.Close;
      KunTab.ParamByName('ID').AsInteger := JourTabAddr_ID.Value;
      KunTab.Open;
      if KunTab.RecordCount = 1 then
      begin
        KunTab.Edit;
        if KunTabKun_Zahlart.AsInteger < 0 then
          KunTabKun_Zahlart.Value := JourTabZahlart.Value;
        if KunTabKun_Liefart.AsInteger < 0 then
          KunTabKun_Liefart.Value := JourTabLiefart.Value;
        KunTab.Post;
      end;

      KunTab.Close;


      // Wenn MWST-Freies Angebot dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;


      JourTab.Post;

      JPosTab.Close;
      JPosTab.ParamByName('ID').Value := Journal_ID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
        JPosTab.Edit;

        //MWST_Code löschen, wenn MwSt-freier Beleg
        if JourTabMWST_FREI_FLAG.AsBoolean then
          JPosTabSteuer_Code.Value := 0;

        // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
           (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Daten aktualisieren
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value := VK_AGB;

        JPosTab.Post;
        JPosTab.Next;
      end;

      JPosTab.Close;
      JourTab.Close;
      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.
    except
      MessageDlg(_('Fehler beim Buchen des Angebotes !'), mterror, [mbok], 0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result := '';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_Auftrag(Journal_ID: Integer): String; // liefert Auftragsnummer zurück
var
  Pos: Integer;
begin
  Result := '';
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;
  try
    try
    JourTab.Close;
    JourTab.ParamByName('ID').Value := Journal_ID;
    JourTab.Open;
    JourTab.Edit;
    // neue Nummer holen
    JourTabVRENUM.Value := IncNummerStr(VK_AUF);

    Result := JourTabVRENUM.Value;

    JourTabSTADIUM.Value        := 0;
    JourTabRDatum.Value         := now;
    JourTabQuelle.Value         := VK_AUF;

    JourTabKONTOAUSZUG.Value    := -1;
    JourTabUW_NUM.Value         := -1;
    JourTabBANK_ID.Value        := -1;

    JourTabIST_Betrag.Value     := 0;
    JourTabIST_Anzahlung.Value  := 0;
    JourTabFreigabe1_Flag.Value := False;

    // Kundendaten (Zahlungsart und Lieferart) aktualisieren,
    // falls diese noch nicht zugewiesen sind
    KunTab.Close;
    KunTab.ParamByName('ID').AsInteger := JourTabAddr_ID.Value;
    KunTab.Open;
    if KunTab.RecordCount = 1 then
    begin
      KunTab.Edit;
      if KunTabKun_Zahlart.AsInteger < 0 then
        KunTabKun_Zahlart.Value := JourTabZahlart.Value;
      if KunTabKun_Liefart.AsInteger < 0 then
        KunTabKun_Liefart.Value := JourTabLiefart.Value;
      KunTab.Post;
    end;

    KunTab.Close;

    // Wenn MWST-Freies Angebot dann alle MWST-Felder löschen
    if JourTabMWST_FREI_FLAG.AsBoolean then
    begin
      JourTabMWST_0.AsInteger := 0;
      JourTabMWST_1.AsInteger := 0;
      JourTabMWST_2.AsInteger := 0;
      JourTabMWST_3.AsInteger := 0;
      JourTabMSUMME_0.AsFloat := 0;
      JourTabMSUMME_1.AsFloat := 0;
      JourTabMSUMME_2.AsFloat := 0;
      JourTabMSUMME_3.AsFloat := 0;
      JourTabMSUMME.AsFloat   := 0;
      JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
    end;

    JourTab.Post;

    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    Pos := 0;

    while not JPosTab.Eof do
    begin
      JPosTab.Edit;

      //MWST_Code löschen, wenn MwSt-freier Beleg
      if JourTabMWST_FREI_FLAG.AsBoolean then
        JPosTabSteuer_Code.Value := 0;

      // Position schreiben, aber nur bei Artikeln, nicht bei Text
      if (JPosTabArtikelTyp.Value <> 'T') and
         (JPosTabArtikelTyp.Value <> 'X') then
      begin
        Inc(Pos);
        JposTabView_Pos.Value := Inttostr(Pos);
      end;

      // Daten aktualisieren
      JPosTabVRENUM.Value := JourTabVRENUM.Value;
      JPosTabQuelle.Value := VK_AUF;

      JPosTab.Post;
      JPosTab.Next;
    end;

    JPosTab.Close;
    JourTab.Close;
    //Transact1.Commit;
    DB1.Commit;  //16.10.09-ud.

    except
    MessageDlg(_('Fehler beim Buchen des Auftrages !'),mterror,[mbok],0);
    //Transact1.RollBack;
    DB1.Rollback;  //16.10.09-ud.
    Result :='';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_EKBest(Journal_ID: Integer): String; // liefert EK-BST-Nummer zurück
var
  Pos: Integer;
  NewEK: Double;
begin
  Result :='';
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName('ID').Value := Journal_ID;
      JourTab.Open;
      JourTab.Edit;
      // neue Nummer holen
      JourTabVRENUM.Value := IncNummerStr(EK_BEST);

      Result := JourTabVRENUM.Value;

      JourTabSTADIUM.Value        := 0;
      JourTabRDatum.Value         := now;
      JourTabQuelle.Value         := EK_BEST;

      JourTabKONTOAUSZUG.Value    := -1;
      JourTabUW_NUM.Value         := -1;
      JourTabBANK_ID.Value        := -1;

      JourTabIST_Betrag.Value     := 0;
      JourTabIST_Anzahlung.Value  := 0;
      JourTabFreigabe1_Flag.Value := False;

      JourTabStadium.AsInteger    := 20;


      // Wenn MWST-Freie Bestellung dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;


      // Lieferantendaten (Zahlungsart) aktualisieren,
      // falls diese noch nicht zugewiesen ist
      KunTab.Close;
      KunTab.ParamByName('ID').AsInteger := JourTabAddr_ID.Value;
      KunTab.Open;
      if KunTab.RecordCount = 1 then
      begin
        KunTab.Edit;
        if KunTabKrd_Num.Value < 1 then
        begin
          // Wenn noch keine KRD-NUM, dann neue Nummer zuweisen
          KunTabKrd_Num.Value := IncNummer (KRD_NUM_KEY);
          JourTabGEGENKONTO.Value := KunTabKrd_Num.Value;
          // Bitcodiertes Flag für "ist Lieferant" setzen
          KunTabSTATUS.AsInteger := KunTabSTATUS.AsInteger or 16;
        end;
        if KunTabLief_Zahlart.AsInteger < 0 then
          KunTabLief_Zahlart.Value :=JourTabZahlart.Value;
        KunTab.Post;
      end;

      JourTab.Post;

      JPosTab.Close;
      JPosTab.ParamByName ('ID').Value := Journal_ID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
        JPosTab.Edit;

        //MWST_Code löschen, wenn MwSt-freier Beleg
        if JourTabMWST_FREI_FLAG.AsBoolean then
          JPosTabSteuer_Code.Value := 0;

        // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
           (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Artikel Buchen  (Bestellmenge  erhöhen)
        if (JPosTabArtikelTyp.Value = 'N') and
           (JPosTabARTIKEL_ID.Value > -1) then
        begin
          {
          // Menge nicht verändern !!!
          ArtMengeTab.Close;
          ArtMengeTab.ParamByName ('ID').Value :=JPosTabARTIKEL_ID.Value;
          ArtMengeTab.ParamByName ('SUBMENGE').Value :=0;
          //Bestellmenge erhöhen
          ArtMengeTab.ParamByName ('BMENGE').Value :=JPosTabMenge.Value*-1; // Menge wird abgezogen, daher - ( - * - = +)
          ArtMengeTab.ExecSql;
          JPosTabGebucht.Value := True;
          }

          // Lieferanten im Artikelstamm aktualisieren

          NewEK := JPosTabEPREIS.AsFloat;

          if JPosTabRabatt.Value <> 0 then
          begin
            if JPosTabRabatt.Value = 100 then
              NewEK := 0
            else
              NewEK := NewEK - (NewEK * JPosTabRabatt.Value / 100);
          end;


          //Lieferantenpreis erstellen bzw. aktualisieren
          UpdateArtikelPreis(EK_RECH,
                             JPosTabARTIKEL_ID.Value,
                             JourTabAddr_ID.Value,
                             NewEK
          );
        end;

        // Daten aktualisieren
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value := EK_BEST;

        JPosTab.Post;

        // im Artkikel die MENGE_VKRE_EDI aktualisieren
        //UpdateArtikelEdiMenge (EK_BEST_EDI, JPosTabArtikel_ID.AsInteger,0);

        JPosTab.Next;
      end;

      JPosTab.Close;
      JourTab.Close;

      // EDI-Mengen in der Tabelle ARTIKEL_BDATEN aktualisieren
      UpdateArtikelEdiMenge(EK_BEST_EDI, JPosTabArtikel_ID.AsInteger, 0);
      // Menge bestellter Artikel aktualisieren
      UpdateEKBestMenge;

      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.
    except
      MessageDlg(_('Fehler beim Buchen der EK-Bestellung !'), mterror, [mbok], 0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result := '';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Buche_Einkauf(Journal_ID: Integer): String; // liefert Belegnummer zurück
var
  NewEK,
  NewMenge,
  OldEK,
  OldMenge,
  //BM,ABM,
  Faktor,
  FaktorWGR,
  N,B       : Double;

  UseRabGrp : Boolean;
  STA,OFF,
  SUM, I    : Integer;
  LastID    : Integer;
  Sql       : String;
begin
  Result := '';
  UseRabGrp := False;
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName ('ID').Value := Journal_ID;
      JourTab.Open;
      JourTab.Edit;
      // neue Rechnungsnummer holen
      JourTabVRENUM.Value  := IncNummerStr (EK_RECH);

      Result := JourTabVRENUM.Value;

      JourTabIST_Betrag.Value := 0;
      JourTabIST_Anzahlung.Value := 0;
      JourTabMAHNKOSTEN.Value := 0;
      JourTabFreigabe1_Flag.Value := False;


      // Lieferantendaten (Zahlungsart) aktualisieren,
      // falls diese noch nicht zugewiesen ist
      KunTab.Close;
      KunTab.ParamByName('ID').AsInteger := JourTabAddr_ID.Value;
      KunTab.Open;
      if KunTab.RecordCount = 1 then
      begin
        KunTab.Edit;
        if KunTabKrd_Num.Value<1 then
        begin
          // Wenn noch keine KRD-NUM, dann neue Nummer zuweisen
          KunTabKrd_Num.Value := IncNummer(KRD_NUM_KEY);
          JourTabGEGENKONTO.Value := KunTabKrd_Num.Value;
          // Bitcodiertes Flag für "ist Lieferant" setzen
          KunTabSTATUS.AsInteger := KunTabSTATUS.AsInteger or 16;
        end;
        if KunTabLief_Zahlart.AsInteger < 0 then
          KunTabLief_Zahlart.Value := JourTabZahlart.Value;
        KunTab.Post;
      end;


      case JourTabZahlart.Value of
        //bar bzw. scheck
        1,5:
        begin
          if JourTabSOLL_SKONTO.Value > 0 then
          begin
            JourTabStadium.Value := 80+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := JourTabSOLL_SKONTO.Value;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value :=
              JourTabBSumme.Value-(JourTabBSumme.Value / 100)*JourTabSOLL_SKONTO.Value;
          end else
          begin
            JourTabStadium.Value := 90+JourTabZahlart.Value;
            JourTabIST_SKONTO.Value := 0;
            JourTabIST_ANZAHLUNG.Value := 0;
            JourTabIST_ZAHLDAT.Value := JourTabRDatum.Value;
            JourTabIST_BETRAG.Value := JourTabBSumme.Value;
          end;
        end;
        //Überweisung, NN, Lastschrift, EC-Karte
        2,3,4,6,9:
          JourTabStadium.Value := 20+JourTabZahlart.Value;
      end;

      JourTabQuelle.Value         := EK_RECH;
      JourTabKONTOAUSZUG.Value    := -1;
      JourTabUW_NUM.Value         := -1;
      JourTabBANK_ID.Value        := -1;
      JourTabFREIGABE1_Flag.Value := False;

      // Wenn MWST-Freier Einkauf dann alle MWST-Felder löschen
      if JourTabMWST_FREI_FLAG.AsBoolean then
      begin
        JourTabMWST_0.AsInteger := 0;
        JourTabMWST_1.AsInteger := 0;
        JourTabMWST_2.AsInteger := 0;
        JourTabMWST_3.AsInteger := 0;
        JourTabMSUMME_0.AsFloat := 0;
        JourTabMSUMME_1.AsFloat := 0;
        JourTabMSUMME_2.AsFloat := 0;
        JourTabMSUMME_3.AsFloat := 0;
        JourTabMSUMME.AsFloat   := 0;
        JourTabBSUMME.AsFloat   := JourTabNSUMME.AsFloat;
      end;
      JourTab.Post;

      if JourTabZahlArt.Value = 1 then  // Kassenbuchung
      begin
        BucheKasse(JourTabIST_Zahldat.Value,
                   EK_RECH,
                   JourTabRec_ID.Value,
                   JourTabVReNum.Value,
                   JourTabGegenKonto.Value,
                   JourTabIST_Skonto.Value,
                   JourTabIST_Betrag.Value*-1, // negativ, da Ausgabe !!!
                   'ZA EK-RE '+JourTabKun_Name1.Value
        );
      end;

      JPosTab.Close;
      JPosTab.ParamByName ('ID').Value :=Journal_ID;
      JPosTab.Open;

      while not JPosTab.Eof do
      begin
        try
          JPosTab.Edit;

          //MWST_Code löschen, wenn MwSt-freier Beleg
          if JourTabMWST_FREI_FLAG.AsBoolean then
            JPosTabSteuer_Code.Value := 0;

          // EK-Preis, letzter EK, letzt. Lief, Lief-Datum
          // im Artikelstam aktualisieren !!!
          UpdateArtTab.Close;
          UpdateArtTab.ParamByName ('ID').AsInteger := JPosTabARTIKEL_ID.Value;
          UpdateArtTab.Open;
          if UpdateArtTab.RecordCount = 1 then
          begin
            //UseRabGrp :=Length(UpdateArtTab.FieldByName ('RABGRP_ID').AsString)>0;
            UseRabGrp := (Length(UpdateArtTab.FieldByName('RABGRP_ID').AsString) > 0) and
                         (UpdateArtTab.FieldByName ('RABGRP_ID').AsString<>'-');


            try
              UpdateArtTab.Edit;

              OldEK    := UpdateArtTab.FieldByName ('EK_PREIS').AsFloat;
              OldMenge := UpdateArtTab.FieldByName ('MENGE_AKT').AsFloat;

              NewEK    := JPosTabEPREIS.AsFloat;
              NewMenge := JPosTabMenge.AsFloat;

              if JPosTabRabatt.Value <> 0 then
              begin
                if JPosTabRabatt.Value = 100 then
                  NewEK := 0
                else
                  NewEK := NewEK - (NewEK * JPosTabRabatt.Value / 100);
              end;

              NewMenge := CAO_round(JPosTabMenge.AsFloat * 100)/100; // auf 2 Nachkommastellen

              //UpdateArtTab.FieldByName ('LAST_EK').AsFloat  :=CAO_round(NewEK*1000)/1000; // auf 3 Nachkommastellen
              //UpdateArtTab.FieldByName ('LAST_LIEF').AsInteger :=JourTabAddr_ID.Value;
              //UpdateArtTab.FieldByName ('LAST_LIEFDAT').AsDateTime :=JourTabRDatum.AsDateTime;


              // Lieferantenpreis anlegen bzw. aktualisieren
              UpdateArtikelPreis(EK_RECH,
                                 JPosTabARTIKEL_ID.Value,
                                 JourTabAddr_ID.Value,
                                 NewEK
              );

              // EK Berechnen (Mittelwert)
              if (OldMenge+NewMenge <> 0) and (OldMenge >= 0) then
                NewEK := (NewEK * NewMenge + OldEK * OldMenge) / (OldMenge+NewMenge);

              // nur Speichern, wenn keine Rabattgruppe gesetzt
              if not UseRabGrp then
              begin
                UpdateArtTab.FieldByName('EK_PREIS').AsFloat := CAO_round(NewEK*1000)/1000; // auf 3 Nachkommastellen

                // Berechnung von VK-Preisen wenn Kalkulationsfaktoren verwendet werden
                for i := 1 to AnzPreis do
                begin
                  Faktor := GCalcFaktorTab[i];
                  FaktorWgr := 0;
                  GetWGRCalcFaktor(UpdateArtTab.FieldByName ('WARENGRUPPE').AsInteger, i, FaktorWgr);
                  if FaktorWgr <> 0 then
                    Faktor := FaktorWgr;

                  if (Faktor >0) then
                  begin
                    N := CAO_round(NewEK * Faktor * 100) / 100;

                    UpdateArtTab.FieldByName('VK'+IntToStr(i)).AsFloat := N;

                    B := N * (100+MwStTab[UpdateArtTab.FieldByName ('STEUER_CODE').AsInteger]);

                    B := CAO_Round (B / BR_RUND_WERT) * BR_RUND_WERT / 100;

                    UpdateArtTab.FieldByName('VK'+IntToStr(i)+'B').AsFloat := B;
                  end;
                end;
              end;

              //Bestelmenge aus Artikel holen
              //ABM :=UpdateArtTab.FieldByName ('MENGE_BESTELLT').AsFloat;

              UpdateArtTab.Post;
            except
              UpdateArtTab.Cancel;
              MessageDlg(_('Fehler beim aktualisieren der Artikel-Mengen.'), mterror, [mbok], 0);
            end;
          end;
          //else ABM :=999999;

          UpdateArtTab.Close;

          // Artikel Buchen
          if (JPosTabGebucht.Value = False) and
             (JPosTabArtikelTyp.Value = 'N') and
             (JPosTabARTIKEL_ID.Value > -1) then
          begin
            {
            if JPosTabQUELLE_SRC.AsInteger>0 then
            begin

              // Bestellmenge aktualisieren
              BM :=JPosTabMenge.AsFloat;

              //Nachschauen, ob die Menge größer als die Best.-Menge ist und ggf. die Menge vermindern
              UniQuery.close;
              UniQuery.sql.text :='select MENGE from JOURNALPOS where QUELLE=6 and REC_ID='+IntToStr(JPosTabQUELLE_SRC.AsInteger);
              UniQuery.open;

              if (UniQuery.RecordCount=1) then
              begin
                 if BM > UniQuery.FieldByName('MENGE').AsFloat
                  then BM :=UniQuery.FieldByName('MENGE').AsFloat;
              end else BM :=0;

              UniQuery.close;

              // Artikel-Bestellmenge darf nicht < 0 sein !!!
              if ABM-BM<0 then BM :=ABM;

            end else BM :=0; // war kein Artikel aus einer Bestellung
            }

            // Lager-Menge erhöhen
            ArtMengeTab.Close;
            ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.Value;
            ArtMengeTab.ParamByName('SUBMENGE').Value := (CAO_round(JPosTabMenge.Value*100)/100)*-1;
            //Bestellmenge erniedrigen
            //ArtMengeTab.ParamByName ('BMENGE').Value := BM; // Menge wird abgezogen
            ArtMengeTab.ExecSql;
            JPosTabGebucht.Value := True;
          end;

          // Daten aktualisieren
          JPosTabVRENUM.Value := JourTabVRENUM.Value;
          JPosTabQuelle.Value  := EK_RECH;

          JPosTab.Post;
        except
          JPosTab.Cancel;
          MessageDlg(_('Fehler beim aktualisieren der EK-Positionen'), mterror, [mbok], 0);
        end;

        //Seriennumern aktualisieren
        if JPosTabSN_Flag.AsBoolean then
        begin
          try
            UniQuery.close;
            UniQuery.sql.text :=
              'SELECT SNUM_ID from JOURNALPOS_SERNUM '+
              'WHERE '+
              'JOURNAL_ID='+IntToStr(JourTabRec_ID.AsInteger)+' and '+
              'JOURNALPOS_ID='+IntToStr(JPosTabRec_ID.AsInteger);

            Sql :='';
            UniQuery.open;
            while not UniQuery.Eof do
            begin
              SQL := SQL+'UPDATE ARTIKEL_SERNUM SET STATUS="LAGER" '+
                         'WHERE '+
                         'ARTIKEL_ID='+IntToStr(JPosTabArtikel_ID.AsInteger)+
                         ' and '+
                         'SNUM_ID='+IntToStr(UniQuery.FieldByName('SNUM_ID').AsInteger)+
                         ' and STATUS="EK_EDI";';

              UniQuery.Next;

            end;
            UniQuery.Close;

            if Length(SQL) > 0 then
            begin
              ZBatchSql1.Script.Text := Sql;
              ProgressForm.Init(_('Seriennummern aktualisieren'));
              try
                ProgressForm.Start;
                ZBatchSql1.Execute;
              finally
                ProgressForm.Stop;
              end;
            end;
          except
            MessageDlg(_('Fehler beim aktualisieren der Seriennummern. (1)'), mterror, [mbok], 0);
          end;
        end;

        JPosTab.Next;
      end;

      //Seriennumern aktualisieren
      try
        UniQuery.close;
        UniQuery.sql.text :=
          'UPDATE JOURNALPOS_SERNUM SET QUELLE=5 WHERE '+
          'JOURNAL_ID='+IntToStr(JourTabRec_ID.AsInteger)+
          ' and QUELLE=15';

        UniQuery.ExecSql;
        UniQuery.close;
      except
        MessageDlg(_('Fehler beim aktualisieren der Seriennummern. (2)'),mterror,[mbok],0);
      end;

      // im Artkikel die MENGE_VKRE_EDI aktualisieren
      UpdateArtikelEdiMenge (EK_RECH_EDI, JPosTabArtikel_ID.AsInteger,0);
      // EK-Bestellmenge aktualisieren
      UpdateEKBestMenge;

      // Status der Bestellungen dieses Lieferanten aktualisieren
      UniQuery.close;
      UniQuery.sql.clear;
      UniQuery.sql.add ('select');
      UniQuery.sql.add ('JOURNAL.REC_ID,SUM(JP2.MENGE) as ');
      UniQuery.sql.add ('MENGE_EK,JOURNALPOS.MENGE as MENGE_BEST');
      UniQuery.sql.add ('from JOURNALPOS, JOURNAL');
      UniQuery.sql.add ('left outer join JOURNALPOS as JP2 on ');
      UniQuery.sql.add ('JP2.QUELLE_SRC = JOURNALPOS.REC_ID and JP2.QUELLE<>15');
      UniQuery.sql.add ('where JOURNAL.QUELLE=6 and JOURNALPOS.QUELLE=6 and ');
      UniQuery.sql.add ('JOURNALPOS.ADDR_ID='+Inttostr(JourTabAddr_ID.AsInteger));
      UniQuery.sql.add ('and (JOURNALPOS.ARTIKELTYP="N" or ');
      UniQuery.sql.add ('JOURNALPOS.ARTIKELTYP="S") and ');
      UniQuery.sql.add ('JOURNAL.REC_ID=JOURNALPOS.JOURNAL_ID and ');
      UniQuery.sql.add ('JOURNAL.STADIUM>=20 and JOURNAL.STADIUM<100');
      UniQuery.sql.add ('group by JOURNALPOS.REC_ID');

      LastID :=-1;
      try
        UniQuery.open;

        while not UniQuery.eof do
        begin
          if LastID <> UniQuery.FieldByName('REC_ID').AsInteger then
          begin
            if LastID <> -1 then
            begin
              if off = 0 then
                STA := 100
              else
              if off = sum then
                STA := 20
              else
                STA := 30;

              uniquery2.close;
              uniquery2.sql.text := 'UPDATE JOURNAL SET STADIUM='+
                                    Inttostr(STA)+
                                    ' WHERE QUELLE=6 and REC_ID='+
                                    Inttostr(LastID);
              uniquery2.execsql;
            end;
            sum := 0;
            off := 0;
            LastID := UniQuery.FieldByName('REC_ID').AsInteger;
          end;
          sum := sum + UniQuery.FieldByName ('MENGE_BEST').AsInteger;
          off := off + (UniQuery.FieldByName ('MENGE_BEST').AsInteger -
                        UniQuery.FieldByName ('MENGE_EK').AsInteger);

          UniQuery.next;
        end;
        if LastID <> -1 then
        begin
          if off < 1 then
            STA := 100
          else
          if off = sum then
            STA := 20
          else
            STA := 30;

          uniquery2.close;
          uniquery2.sql.text := 'UPDATE JOURNAL SET STADIUM='+
                                Inttostr(STA)+
                                ' WHERE QUELLE=6 and REC_ID='+
                                Inttostr(LastID);
          uniquery2.execsql;
        end;
      except
         MessageDlg(_('Fehler beim aktualisieren der EK-Bestellungen.'),mterror,[mbok],0);
      end;
      UniQuery.close;

      JPosTab.Close;
      JourTab.Close;
      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.
    except
      MessageDlg(_('Fehler beim Buchen der EK-Rechnung !'),mterror,[mbok],0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result :='';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
// Nur zur Probe aus der EDI-Rechnung einen Lieferschein erstellen !
function tDM1.Buche_Lieferschein(Journal_ID: Integer;
                                  Teillief: Boolean;
                                  var LieferscheinID: Integer): String; // liefert Belegnummer zurück
var
  NewId: Integer;
  Pos: Integer;
  S: String;
begin
  if not TeilLief then
    NewID := CopyRechnung(Journal_ID, VK_LIEF_EDI)
  else
    NewID := Journal_ID;

  LieferscheinID := NewID;

  Result :='';
  //Transact1.AutoCommit := False;
  DB1.AutoCommit := False;  //16.10.09-ud.
  try
    try
      JourTab.Close;
      JourTab.ParamByName('ID').Value := NewID;
      JourTab.Open;
      JourTab.Edit;

      // Nachschauen, ob Kunde eine Lieferanschrift hat
      KunTab.Close;
      KunTab.ParamByName('ID').AsInteger := JourTabAddr_ID.Value;
      KunTab.Open;

      // neu 22.08.2003
      // Lieferanschrift zuweisen
      with UniQuery do
      begin
        SQL.Text := 'select * from ADRESSEN_LIEF where REC_ID='+
                     IntToStr(JourTabLIEF_ADDR_ID.AsInteger);
        Open;
        if RecordCount > 0 then
        begin
          JourTabKUN_Anrede.Text  := FieldByName('ANREDE').AsString;
          JourTabKUN_NAME1.Text   := FieldByName('NAME1').AsString;
          JourTabKUN_NAME2.Text   := FieldByName('NAME2').AsString;
          JourTabKUN_NAME3.Text   := FieldByName('NAME3').AsString;
          JourTabKUN_Strasse.Text := FieldByName('STRASSE').AsString;
          JourTabKUN_LAND.Text    := FieldByName('LAND').AsString;
          JourTabKUN_PLZ.Text     := FieldByName('PLZ').AsString;
          JourTabKUN_Ort.Text     := FieldByName('ORT').AsString;
        end;
      end;

      // neue Belegnummer holen
      JourTabVLSNUM.AsString      := IncNummerStr (VK_LIEF);
      JourTabVRENUM.AsString      := '';
      JourTabRDatum.Value         := 0;
      JourTabFreigabe1_Flag.Value := False;

      Result                      := JourTabVLSNUM.AsString;

      JourTabLDatum.Value         := Now;
      JourTabStadium.Value        := 20+JourTabLiefart.Value;

      JourTabQuelle.Value         := VK_LIEF;
      JourTabKONTOAUSZUG.Value    := -1;
      JourTabUW_NUM.Value         := -1;
      JourTabBANK_ID.Value        := -1;

      // Warenwert erst mal auf Nettosumme !!!
      // Muß noch geändert werden !!!
      JourTabWERT_NETTO.Value     := JourTabNSumme.Value;

      JourTab.Post;

      // Lieferscheinnummer in die Seriennummern eintragen
      {
      UniQuery.Sql.Text :=
         'UPDATE ARTIKEL_SERNUM SET LIEF_NUM='+
         Inttostr(JourTabVLSNUM.AsInteger)+
         ' WHERE LS_JOURNAL_ID='+
         IntToStr(NewID);
      UniQuery.ExecSql;
      }

      JPosTab.Close;
      JPosTab.ParamByName('ID').Value := NewID;
      JPosTab.Open;

      Pos := 0;

      while not JPosTab.Eof do
      begin
         JPosTab.Edit;

         // Position schreiben, aber nur bei Artikeln, nicht bei Text
        if (JPosTabArtikelTyp.Value <> 'T') and
           (JPosTabArtikelTyp.Value <> 'X') then
        begin
          Inc(Pos);
          JposTabView_Pos.Value := Inttostr(Pos);
        end;

        // Daten aktualisieren
        JPosTabVLSNUM.Value := JourTabVLSNUM.Value;
        JPosTabVRENUM.Value := JourTabVRENUM.Value;
        JPosTabQuelle.Value := VK_LIEF;

        JPosTab.Post;
        JPosTab.Next;
      end;

      JPosTab.Close;
      JourTab.Close;
      //Transact1.Commit;
      DB1.Commit;  //16.10.09-ud.
    except
      MessageDlg(_('Fehler beim Buchen des VK-Lieferscheines !'),mterror,[mbok],0);
      //Transact1.RollBack;
      DB1.Rollback;  //16.10.09-ud.
      Result :='';
    end;
  finally
    //Transact1.AutoCommit := True;
    DB1.AutoCommit := True;  //16.10.09-ud.
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Storno_Einkauf(Journal_ID: Integer): Boolean; // True, Wenn OK
var
  S: String;
begin
  Result := False;
  try
    JourTab.Close;
    JourTab.ParamByName('ID').Value := Journal_ID;
    JourTab.Open;

    if JourTabZahlArt.Value = 1 then  // Kassenbuchung stornieren
    begin
      with UniQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from FIBU_KASSE');
        SQL.Add('where JOURNAL_ID='+Inttostr(Journal_ID));
        ExecSql;
        SQL.Clear;
      end;
    end;

    // ggf. Seriennummer freigeben
    with UniQuery do
    begin
      Close;
      SQL.Text := 'select JPS.*, ASN.SERNUMMER, ASN.STATUS '+
                  'from JOURNALPOS_SERNUM JPS, ARTIKEL_SERNUM ASN '+
                  'where JOURNAL_ID='+Inttostr(Journal_ID)+
                  ' and JPS.ARTIKEL_ID=ASN.ARTIKEL_ID and '+
                  'JPS.SNUM_ID=ASN.SNUM_ID and ASN.STATUS="LAGER"';
      Open;
      S := '';
      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          if Length(s) > 0 then
            s := s+',';
          s := s+IntToStr(FieldByName('SNUM_ID').AsInteger);
          Next;
        end;
      end;
      Close;

      if Length(s) > 0 then
      begin
        SQL.Text := 'DELETE FROM ARTIKEL_SERNUM '+
                    'WHERE SNUM_ID IN ('+s+')';
        ExecSql;
      end;

      Sql.Text := 'DELETE FROM JOURNALPOS_SERNUM where '+
                  'JOURNAL_ID='+IntToStr(Journal_ID);
      ExecSql;

      {SQL.Clear;
      SQL.Add ('update ARTIKEL_SERNUM set EK_JOURNAL_ID=-1, ');
      SQL.Add ('EK_JOURNALPOS_ID=-1 where EK_JOURNAL_ID='+Inttostr(Journal_ID));
      ExecSql;     }
      SQL.Clear;
    end;

    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    while not JPosTab.Eof do
    begin
      // Artikel Buchen
      if (JPosTabArtikelTyp.Value = 'N') and
          (JPosTabARTIKEL_ID.Value > -1) then
      begin
        // Menge erniedrugen (EK STORNO)
        ArtMengeTab.Close;
        ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.Value;
        ArtMengeTab.ParamByName ('SUBMENGE').Value := JPosTabMenge.Value;
        //ArtMengeTab.ParamByName ('BMENGE').Value := 0;
        ArtMengeTab.ExecSql;
        JPosTabGebucht.Value := True;
      end;

      // Daten aktualisieren
      JPosTab.Delete;
    end;
    JPosTab.Close;

    JourTab.Delete;
    JourTab.Close;

    //Datei-Links löschen
    LinkForm.DelLinks(EK_RECH, JOURNAL_ID);

    Result := True;
  except
    MessageDlg(_('Fehler beim Storno der EK-Rechnung !'), mterror, [mbok], 0);
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Storno_Verkauf(Journal_ID: Integer): Boolean; // True, Wenn OK
var
  S: String;
begin
  Result := False;
  try
    JourTab.Close;
    JourTab.ParamByName('ID').Value := Journal_ID;
    JourTab.Open;

    if JourTabZahlArt.Value = 1 then  // Kassenbuchung stornieren
    begin
      with UniQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM FIBU_KASSE');
        SQL.Add('WHERE JOURNAL_ID='+Inttostr(Journal_ID));
        ExecSql;
        SQL.Clear;
      end;
    end;

    // ggf. Seriennummer freigeben
    with UniQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := 'SELECT * FROM JOURNALPOS_SERNUM '+
                  'WHERE JOURNAL_ID='+InttoStr(Journal_ID);
      Open;
      S := '';
      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          if Length(s) > 0 then
            s := s+',';
          s := s+IntToStr(FieldByName('SNUM_ID').AsInteger);
          Next;
        end;
      end;
      Close;

      if Length(s) > 0 then
      begin
        SQL.Text := 'UPDATE ARTIKEL_SERNUM SET STATUS="LAGER" '+
                    'WHERE SNUM_ID IN ('+s+')';
        ExecSql;
      end;

      Close;
      SQL.Text := 'DELETE FROM JOURNALPOS_SERNUM '+
                  'WHERE JOURNAL_ID='+InttoStr(Journal_ID);
      ExecSql;

      //SQL.Add ('update ARTIKEL_SERNUM set VK_JOURNAL_ID=-1, ');
      //SQL.Add ('VK_JOURNALPOS_ID=-1 where VK_JOURNAL_ID='+Inttostr(Journal_ID));
      //ExecSql;
      //SQL.Clear;
    end;

    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    while not JPosTab.Eof do
    begin
      // Artikel Buchen
      if (JPosTabArtikelTyp.Value = 'N')and
         (JPosTabARTIKEL_ID.Value > -1) then
      begin
        // Menge erhöhen (VK STORNO)
        ArtMengeTab.Close;
        ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.Value;
        ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value*-1;
        //ArtMengeTab.ParamByName ('BMENGE').Value := 0;
        ArtMengeTab.ExecSql;
        //JPosTabGebucht.Value := True;
      end else
      if (JPosTabArtikelTyp.Value = 'S') and
         (JPosTabARTIKEL_ID.Value > -1) then
      begin
        // Stückliste, Unterartikel Menge korregieren
        STListTab.Close;
        STListTab.ParamByName('ID').AsInteger := JPosTabARTIKEL_ID.Value;
        STListTab.Open;
        while not STListTab.Eof do
        begin
          // Menge erhöhen (VK STORNO)
          ArtMengeTab.Close;
          ArtMengeTab.ParamByName('ID').Value := STListTabART_ID.AsInteger;
          ArtMengeTab.ParamByName('SUBMENGE').Value := STListTabMENGE.Value*JPosTabMenge.Value*-1;
          //ArtMengeTab.ParamByName ('BMENGE').Value :=0;
          ArtMengeTab.ExecSql;

          STListTab.Next;
        end;
        STListTab.Close;
      end;

      // Verweise löschen
      UniQuery.Sql.Text := 'UPDATE JOURNALPOS SET QUELLE_SRC=-1 '+
                           'WHERE QUELLE_SRC='+
                           Inttostr(JPosTabRec_ID.AsInteger);
      UniQuery.ExecSql;


      // Daten aktualisieren
      //JPosTab.Delete;
      JPosTab.Edit;
      JPosTabGebucht.AsBoolean := False;
      JPosTab.Post;

      JPosTab.Next;
    end;
    JPosTab.Close;

    JourTab.Edit;

    JourTabStadium.AsInteger   := 127;

    JourTabNSUMME_0.AsFloat    := 0;
    JourTabNSUMME_1.AsFloat    := 0;
    JourTabNSUMME_2.AsFloat    := 0;
    JourTabNSUMME_3.AsFloat    := 0;
    JourTabNSUMME.AsFloat      := 0;

    JourTabMSUMME_0.AsFloat    := 0;
    JourTabMSUMME_1.AsFloat    := 0;
    JourTabMSUMME_2.AsFloat    := 0;
    JourTabMSUMME_3.AsFloat    := 0;
    JourTabMSUMME.AsFloat      := 0;

    JourTabBSUMME_0.AsFloat    := 0;
    JourTabBSUMME_1.AsFloat    := 0;
    JourTabBSUMME_2.AsFloat    := 0;
    JourTabBSUMME_3.AsFloat    := 0;
    JourTabBSUMME.AsFloat      := 0;

    JourTabKOST_NETTO.AsFloat  := 0;
    JourTabWERT_NETTO.AsFloat  := 0;
    JourTabLohn.AsFloat        := 0;
    JourTabWare.AsFloat        := 0;
    JourTabRohgewinn.AsFloat   := 0;
    JourTabTKost.AsFloat       := 0;
    JourTabPROVIS_WERT.AsFloat := 0;

    JourTabVRENUM.AsString := JourTabVRENUM.AsString + ' - STORNO -';

    JourTab.Post;
    JourTab.Close;

    //Datei-Links löschen
    LinkForm.DelLinks(VK_RECH, JOURNAL_ID);

    Result := True;
  except
    MessageDlg(_('Fehler beim Storno der VK-Rechnung !'), mterror, [mbok], 0);
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Storno_Angebot(Journal_ID: Integer): Boolean; // True, Wenn OK
begin
  Result := False;
  try
    JourTab.Close;
    JourTab.ParamByName('ID').Value := Journal_ID;
    JourTab.Open;

    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    while not JPosTab.Eof do
      JPosTab.Delete;
    JPosTab.Close;

    JourTab.Delete;
    JourTab.Close;

    //Datei-Links löschen
    LinkForm.DelLinks(VK_AGB, JOURNAL_ID);

    Result := True;
  except
    MessageDlg(_('Fehler beim Storno des Angebotes !'), mterror, [mbok], 0);
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.Storno_EKBestellung(Journal_ID: Integer): Boolean; // True, Wenn OK
begin
  Result := False;
  try
    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    while not JPosTab.Eof do
    begin
      // Bestellmenge aktualsieren
      if (JPosTabArtikelTyp.Value = 'N') and
         (JPosTabARTIKEL_ID.Value > -1) then
      begin
        // Menge nicht verändern !!!
        ArtMengeTab.Close;
        ArtMengeTab.ParamByName('ID').Value := JPosTabARTIKEL_ID.Value;
        ArtMengeTab.ParamByName('SUBMENGE').Value := 0;
        //Bestellmenge erniedrigen
        //ArtMengeTab.ParamByName ('BMENGE').Value :=JPosTabMenge.Value; // Menge wird abgezogen
        ArtMengeTab.ExecSql;
      end;
      // Position löschen
      JPosTab.Delete;
    end;
    JPosTab.Close;

    JourTab.Close;
    JourTab.ParamByName('ID').AsInteger := Journal_ID;
    JourTab.Open;
    JourTab.Delete;
    JourTab.Close;

    //Datei-Links löschen
    LinkForm.DelLinks(EK_BEST, JOURNAL_ID);

    Result := True;
  except
    MessageDlg(_('Fehler beim Storno der EK-Bestellung !'), mterror, [mbok], 0);
    Result := False;
  end;

  UpdateEKBestMenge; // Bestellmengen aktualisieren
end;

//------------------------------------------------------------------------------
function tDM1.Storno_Lieferschein(Journal_ID: Integer): Boolean; // True, Wenn OK
var
  S : String;
begin
  Result := False;
  try
    JourTab.Close;
    JourTab.ParamByName('ID').Value := Journal_ID;
    JourTab.Open;

    // ggf. Seriennummer freigeben
    with UniQuery do
    begin
       Close;
       //SQL.Clear;
       SQL.Text := 'SELECT * FROM JOURNALPOS_SERNUM '+
                   'WHERE JOURNAL_ID='+InttoStr(Journal_ID);
       Open;
       S := '';
       if RecordCount > 0 then
       begin
         if Length(s) > 0 then
           s :=s+',';
         s := s+IntToStr (FieldByName('SNUM_ID').AsInteger);
         Next;
       end;
       Close;

       if Length(s) > 0 then
       begin
          SQL.Text := 'UPDATE ARTIKEL_SERNUM SET STATUS="LAGER" '+
                      'WHERE SNUM_ID IN ('+s+')';
          ExecSql;
       end;
    end;  //

    JPosTab.Close;
    JPosTab.ParamByName('ID').Value := Journal_ID;
    JPosTab.Open;

    while not JPosTab.Eof do
      JPosTab.Delete;
    JPosTab.Close;

    JourTab.Delete;
    JourTab.Close;

    //Datei-Links löschen
    LinkForm.DelLinks(VK_LIEF, JOURNAL_ID);

    Result := True;
  except
    MessageDlg(_('Fehler beim Storno des Lieferscheins !'), mterror, [mbok], 0);
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function tDM1.CalcLeitWaehrung(Betrag: Double; Waehrung: String): Double;
var
  Kurs: Double;
begin
  if Waehrung = Leitwaehrung then
  begin
    Result := Betrag;
    exit;
  end;
  if CacheLastWaehrung <> Waehrung then
  begin
    Kurs := ReadDouble('MAIN\WAEHRUNG', Waehrung, 1);
    CacheLastKurs     := Kurs;
    CacheLastWaehrung := Waehrung;
  end else
    Kurs := CacheLastKurs;

  if Kurs = 0 then
    Result := 0
  else
    Result := (CAO_Round(Betrag / Kurs * 100))/100;
end;

//------------------------------------------------------------------------------
function tDM1.CopyRechnung(Journal_ID, Dest: Integer): Integer;  // Liefert Rec-ID zurück
var
  id, i: integer;
  BelegNr: string;
  w: string;
  N, n0, n1, n2, n3,
  M, m0, m1, m2, m3,
  B, b0, b1, b2, b3: Double;
  Summe,
  NSumme,MSumme,BSumme, Steuer,
  EK, Lohn, Ware, TKst: Double;
  T: Char;
begin
  Result := -1;

  N := 0; N0 := 0; N1 := 0; N2 := 0; N3 := 0;
  M := 0; M0 := 0; M1 := 0; M2 := 0; M3 := 0;
  B := 0; B0 := 0; B1 := 0; B2 := 0; B3 := 0;
  Lohn := 0; Ware := 0; TKst := 0;

  CpySrcKopfTab.Close;
  CpySrcKopfTab.ParamByName('ID').Value := Journal_ID;
  CpySrcKopfTab.Open;

  if CpySrcKopfTab.RecordCount = 0 then
  begin
    CpySrcKopfTab.Close;
    Exit;
  end;

  BelegNr := IncNummerStr(Dest);

  CpyDstKopfTab.Open;
  CpyDstKopfTab.Append;

  w := CpySrcKopfTabWAEHRUNG.Value;

  CpyDstKopfTabQUELLE.Value     := Dest; //CpySrcKopfTabQUELLE.Value;
  CpyDstKopfTabQUELLE_SUB.Value := 0;//CpySrcKopfTabQUELLE_SUB.Value;

  CpyDstKopfTabATRNUM.Value := -1;
  CpyDstKopfTabLief_Addr_ID.Value := CpySrcKopfTabLief_Addr_ID.Value;

  CpyDstKopfTabVRENUM.Value     := BelegNr;
  CpyDstKopfTabVLSNUM.Value     := '';
  CpyDstKopfTabFOLGENR.Value    := -1;
  CpyDstKopfTabKM_STAND.Value   := -1;
  CpyDstKopfTabADATUM.Value     := 0;
  CpyDstKopfTabRDATUM.Value     := Now;

  if Dest <> EK_BEST_EDI then
    CpyDstKopfTabLDATUM.Value := 0
  else
    CpyDstKopfTabLDATUM.Value := CpySrcKopfTabLDATUM.Value;

  CpyDstKopfTabTermin.Value            := 0;

  CpyDstKopfTabKOST_NETTO.Value        := Calcleitwaehrung(CpySrcKopfTabKOST_NETTO.AsFloat,w);
  CpyDstKopfTabWERT_NETTO.Value        := CalcLeitWaehrung(CpySrcKopfTabWERT_NETTO.AsFloat,W);
  CpyDstKopfTabLOHN.Value              := CalcLeitWaehrung(CpySrcKopfTabLOHN.AsFloat,W);
  CpyDstKopfTabWARE.Value              := CalcLeitWaehrung(CpySrcKopfTabWARE.AsFloat,W);
  CpyDstKopfTabTKOST.Value             := CalcLeitWaehrung(CpySrcKopfTabTKOST.AsFloat,W);

  CpyDstKopfTabADDR_ID.Value           := CpySrcKopfTabADDR_ID.Value;
  CpyDstKopfTabKFZ_ID.Value            := CpySrcKopfTabKFZ_ID.Value;
  CpyDstKopfTabVERTRETER_ID.Value      := CpySrcKopfTabVERTRETER_ID.Value;
  CpyDstKopfTabGLOBRABATT.Value        := CpySrcKopfTabGLOBRABATT.Value;

  CpyDstKopfTabPR_EBENE.Value          := CpySrcKopfTabPR_EBENE.Value;
  CpyDstKopfTabLIEFART.Value           := CpySrcKopfTabLIEFART.Value;
  CpyDstKopfTabZAHLART.Value           := CpySrcKopfTabZAHLART.Value;

  CpyDstKopfTabMWST_0.Value            := CpySrcKopfTabMWST_0.Value;
  CpyDstKopfTabMWST_1.Value            := CpySrcKopfTabMWST_1.Value;
  CpyDstKopfTabMWST_2.Value            := CpySrcKopfTabMWST_2.Value;
  CpyDstKopfTabMWST_3.Value            := CpySrcKopfTabMWST_3.Value;
  CpyDstKopfTabMWST_FREI_FLAG.Value    := CpySrcKopfTabMWST_FREI_FLAG.Value;


  CpyDstKopfTabNSUMME_0.Value          := CalcLeitWaehrung(CpySrcKopfTabNSUMME_0.AsFloat,W);
  CpyDstKopfTabNSUMME_1.Value          := CalcLeitWaehrung(CpySrcKopfTabNSUMME_1.AsFloat,W);
  CpyDstKopfTabNSUMME_2.Value          := CalcLeitWaehrung(CpySrcKopfTabNSUMME_2.AsFloat,W);
  CpyDstKopfTabNSUMME_3.Value          := CalcLeitWaehrung(CpySrcKopfTabNSUMME_3.AsFloat,W);
  CpyDstKopfTabNSUMME.Value            := CalcLeitWaehrung(CpySrcKopfTabNSUMME.AsFloat,W);

  CpyDstKopfTabMSUMME_0.Value          := CalcLeitWaehrung(CpySrcKopfTabMSUMME_0.AsFloat,W);
  CpyDstKopfTabMSUMME_1.Value          := CalcLeitWaehrung(CpySrcKopfTabMSUMME_1.AsFloat,W);
  CpyDstKopfTabMSUMME_2.Value          := CalcLeitWaehrung(CpySrcKopfTabMSUMME_2.AsFloat,W);
  CpyDstKopfTabMSUMME_3.Value          := CalcLeitWaehrung(CpySrcKopfTabMSUMME_3.AsFloat,W);
  CpyDstKopfTabMSUMME.Value            := CalcLeitWaehrung(CpySrcKopfTabMSUMME.AsFloat,W);

  CpyDstKopfTabBSUMME_0.Value          := CalcLeitWaehrung(CpySrcKopfTabBSUMME_0.AsFloat,W);
  CpyDstKopfTabBSUMME_1.Value          := CalcLeitWaehrung(CpySrcKopfTabBSUMME_1.AsFloat,W);
  CpyDstKopfTabBSUMME_2.Value          := CalcLeitWaehrung(CpySrcKopfTabBSUMME_2.AsFloat,W);
  CpyDstKopfTabBSUMME_3.Value          := CalcLeitWaehrung(CpySrcKopfTabBSUMME_3.AsFloat,W);
  CpyDstKopfTabBSUMME.Value            := CalcLeitWaehrung(CpySrcKopfTabBSUMME.AsFloat,W);

  CpyDstKopfTabATSUMME.Value           := CalcLeitWaehrung(CpySrcKopfTabATSUMME.AsFloat,W);
  CpyDstKopfTabATMSUMME.Value          := CalcLeitWaehrung(CpySrcKopfTabATMSUMME.AsFloat,W);

  CpyDstKopfTabWAEHRUNG.Value          := LeitWaehrung;//CpySrcKopfTabWAEHRUNG.Value;
  CpyDstKopfTabGEGENKONTO.Value        := CpySrcKopfTabGEGENKONTO.Value;
  CpyDstKopfTabSOLL_STAGE.Value        := CpySrcKopfTabSOLL_STAGE.Value;
  CpyDstKopfTabSOLL_SKONTO.Value       := CpySrcKopfTabSOLL_SKONTO.Value;
  CpyDstKopfTabSOLL_NTAGE.Value        := CpySrcKopfTabSOLL_NTAGE.Value;
  CpyDstKopfTabSOLL_RATEN.Value        := CpySrcKopfTabSOLL_RATEN.Value;

  CpyDstKopfTabSOLL_RATBETR.Value      := CalcLeitWaehrung(CpySrcKopfTabSOLL_RATBETR.AsFloat,W);

  CpyDstKopfTabSOLL_RATINTERVALL.Value := CpySrcKopfTabSOLL_RATINTERVALL.Value;

  CpyDstKopfTabIST_ANZAHLUNG.Value     := 0;
  CpyDstKopfTabIST_ZAHLDAT.Value       := 0;
  CpyDstKopfTabMAHNKOSTEN.Value        := 0;
  CpyDstKopfTabKONTOAUSZUG.Value       := -1;
  CpyDstKopfTabBANK_ID.Value           := -1;
  CpyDstKopfTabSTADIUM.Value           := 6;
  CpyDstKopfTabFREIGABE1_Flag.Value    := False;
  CpyDstKopfTabERSTELLT.Value          := Now;
  CpyDstKopfTabERST_NAME.Value         := View_User;

  CpyDstKopfTabKUN_NUM.Value           := CpySrcKopfTabKUN_NUM.Value;
  CpyDstKopfTabKUN_ANREDE.Value        := CpySrcKopfTabKUN_ANREDE.Value;
  CpyDstKopfTabKUN_NAME1.Value         := CpySrcKopfTabKUN_NAME1.Value;
  CpyDstKopfTabKUN_NAME2.Value         := CpySrcKopfTabKUN_NAME2.Value;
  CpyDstKopfTabKUN_NAME3.Value         := CpySrcKopfTabKUN_NAME3.Value;
  CpyDstKopfTabKUN_ABTEILUNG.Value     := CpySrcKopfTabKUN_ABTEILUNG.Value;
  CpyDstKopfTabKUN_STRASSE.Value       := CpySrcKopfTabKUN_STRASSE.Value;
  CpyDstKopfTabKUN_LAND.Value          := CpySrcKopfTabKUN_LAND.Value;
  CpyDstKopfTabKUN_PLZ.Value           := CpySrcKopfTabKUN_PLZ.Value;
  CpyDstKopfTabKUN_ORT.Value           := CpySrcKopfTabKUN_ORT.Value;
  CpyDstKopfTabUSR1.Value              := CpySrcKopfTabUSR1.Value;
  CpyDstKopfTabUSR2.Value              := CpySrcKopfTabUSR2.Value;
  CpyDstKopfTabPROJEKT.Value           := CpySrcKopfTabPROJEKT.Value;
  CpyDstKopfTabORGNUM.Value            := CpySrcKopfTabORGNUM.Value;
  CpyDstKopfTabBEST_NAME.Value         := CpySrcKopfTabBEST_NAME.Value;
  CpyDstKopfTabBEST_CODE.Value         := CpySrcKopfTabBEST_CODE.Value;
  CpyDstKopfTabINFO.AsString           := CpySrcKopfTabINFO.AsString;
  CpyDstKopfTabBEST_DATUM.Value        := CpySrcKopfTabBEST_DATUM.Value;
  CpyDstKopfTabPROVIS_WERT.Value       := CpySrcKopfTabPROVIS_WERT.Value;

  CpyDstKopfTabPROVIS_WERT.Value       := CpySrcKopfTabPROVIS_WERT.Value;
  CpyDstKopfTabBRUTTO_FLAG.AsBoolean   := CpySrcKopfTabBRUTTO_FLAG.AsBoolean;

  CpyDstKopfTabGewicht.AsFloat         := CpySrcKopfTabGewicht.AsFloat;
  CpyDstKopfTabRohgewinn.AsFloat       := CpySrcKopfTabRohgewinn.AsFloat;

  CpyDstKopfTabUW_NUM.Value            := -1;

  if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI]) and (Dest = VK_RECH_EDI)) or
     ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI]) and (Dest = EK_BEST_EDI)) then
  begin
    CpyDstKopfTabKOST_NETTO.Value        := 0;
    CpyDstKopfTabWERT_NETTO.Value        := 0;
    CpyDstKopfTabLOHN.Value              := 0;
    CpyDstKopfTabWARE.Value              := 0;
    CpyDstKopfTabTKOST.Value             := 0;
    CpyDstKopfTabGLOBRABATT.Value        := 0;

    if Dest <> EK_BEST_EDI then
    begin
      CpyDstKopfTabPR_EBENE.Value     := 2;
    end else
    begin
      CpyDstKopfTabPR_EBENE.Value      := 0;
      CpyDstKopfTabKUN_NUM.Value       := '';
      CpyDstKopfTabKUN_ANREDE.Value    := '';
      CpyDstKopfTabKUN_NAME1.Value     := '';
      CpyDstKopfTabKUN_NAME2.Value     := '';
      CpyDstKopfTabKUN_NAME3.Value     := '';
      CpyDstKopfTabKUN_ABTEILUNG.Value := '';
      CpyDstKopfTabKUN_STRASSE.Value   := '';
      CpyDstKopfTabKUN_LAND.Value      := '';
      CpyDstKopfTabKUN_PLZ.Value       := '';
      CpyDstKopfTabKUN_ORT.Value       := '';

      CpyDstKopfTabLief_Addr_ID.Value  := CpySrcKopfTabAddr_ID.Value;
      CpyDstKopfTabAddr_ID.Value       := -1;
      CpyDstKopfTabLDatum.Value        := int(Now)+3;
    end;

    CpyDstKopfTabLIEFART.Value := -1;
    CpyDstKopfTabZAHLART.Value := -1;
  end;

  CpyDstKopfTab.Post;

  ID := CpyDstKopfTabREC_ID.Value;

  CpySrcPosTab.Close;
  CpySrcPosTab.ParamByName('ID').AsInteger := Journal_ID;
  CpySrcPosTab.Open;

  CpyDstPosTab.Open;

  while not CpySrcPosTab.Eof do
  begin
    // Bei Lieferscheinen die Transportkosten überspringen
    if (Dest = VK_LIEF_EDI) and
       (CpySrcPosTab.FieldByName('ARTIKELTYP').AsString = 'K') then
    begin
      CpySrcPosTab.Next;
      Continue;
    end;

    if (DEST in [EK_RECH_EDI,EK_BEST_EDI]) and
       (CpySrcPosTab.FieldByName('ARTIKELTYP').AsString = 'S') then
    begin
      // Wenn das Ziel ein Einkauf oder eine EK-Bestellung ist,
      // dann Stücklistenartikel nicht mitkopieren.
      CpySrcPosTab.Next;
      Continue;
    end;


    CpyDstPosTab.Append;

    for i := 0 to CpySrcPosTab.Fields.Count-1 do
    begin
      if UpperCase(CpySrcPosTab.Fields[i].FieldName) <> 'REC_ID' then
        CpyDstPosTab.FieldByName(CpySrcPosTab.Fields[i].FieldName).Value := CpySrcPosTab.Fields[i].Value;
    end;
    CpyDstPosTab.FieldByName('VRENUM').Value          := BelegNr;
    CpyDstPosTab.FieldByName('QUELLE').Value          := Dest;
    CpyDstPosTab.FieldByName('QUELLE_SUB').Value      := 0;
    CpyDstPosTab.FieldByName('JOURNAL_ID').Value      := ID;
    CpyDstPosTab.FieldByName('GEBUCHT').Value         := False;
    CpyDstPosTab.FieldByName('EPREIS').Value          := CalcLeitwaehrung(CpySrcPosTab.FieldByName('EPREIS').AsFloat,W);
    CpyDstPosTab.FieldByName('E_RGEWINN').Value       := CalcLeitwaehrung(CpySrcPosTab.FieldByName('E_RGEWINN').AsFloat,W);

    //JP14062005
    if (DEST in [EK_RECH_EDI,EK_BEST_EDI]) and
       (CpySrcPosTab.FieldByName('ARTIKELTYP').AsString = 'X') then
    begin
      // Wenn das Ziel ein Einkauf oder eine EK-Bestellung ist,
      // dann Stücklisten-Unterartikel in normale Artikel (N) umwandeln
      CpyDstPosTab.FieldByName('ARTIKELTYP').AsString := 'N';
    end;

    //NEU
    //if (CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI])and(Dest=VK_RECH_EDI) then
    if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI]) and (Dest = VK_RECH_EDI)) or
       ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI]) and (Dest = EK_BEST_EDI)) or
       (Dest = VK_LIEF_EDI) then
    begin
      if (DEST <> EK_BEST_EDI) then
        CpyDstPosTab.FieldByName('GEGENKTO').Value := ReadInteger('MAIN\KONTEN', 'DEF_ERLOESKTO', 8400)
      else
        CpyDstPosTab.FieldByName('GEGENKTO').Value := ReadInteger ('MAIN\KONTEN', 'DEF_AUFWANDSKTO', 3400);

      if (CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger >= 0) and
          (Dest <> VK_LIEF_EDI) then
      begin
        UpdateArtTab.Close;
        UpdateArtTab.ParamByName('ID').AsInteger := CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger;
        UpdateArtTab.Open;

        if UpdateArtTab.RecordCount = 1 then
        begin
          if (DEST = EK_BEST_EDI) and // nur bei EK-Bestellungen
             (UpdateArtTab.FieldByName('RABGRP_ID').AsString <> '-') and
             (Length(UpdateArtTab.FieldByName('RABGRP_ID').AsString) > 0) then
          begin
            // Ist ein Artikel mit Rabattgruppe !!!
            case AnzPreis of
              1: EK := UpdateArtTab.FieldByName('VK1').Value;
              2: EK := UpdateArtTab.FieldByName('VK2').Value;
              3: EK := UpdateArtTab.FieldByName('VK3').Value;
              4: EK := UpdateArtTab.FieldByName('VK4').Value;
              else EK := UpdateArtTab.FieldByName('VK5').Value;
            end;

            CalcRabGrpPreis(UpdateArtTab.FieldByName ('RABGRP_ID').AsString, 0{EK}, EK);
            CpyDstPosTab.FieldByName('EPREIS').Value := CAO_round(EK * 1000)/1000; //auf 3 Nachkommastellen runden
          end else
          begin
            // neuen VK-Preis zuweisen
            case CpyDstKopfTabPR_EBENE.Value of
              0: CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('EK_PREIS').Value;
              1: CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('VK1').Value;
              2: CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('VK2').Value;
              3: CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('VK3').Value;
              4: CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('VK4').Value;
              else CpyDstPosTab.FieldByName('EPREIS').Value := UpdateArtTab.FieldByName('VK5').Value;
            end;
          end;
        end;

        if DEST <> EK_BEST_EDI then
          CpyDstPosTab.FieldByName('GEGENKTO').Value := UpdateArtTab.FieldByName ('ERLOES_KTO').AsInteger
        else
          CpyDstPosTab.FieldByName('GEGENKTO').Value := UpdateArtTab.FieldByName ('AUFW_KTO').AsInteger;

        if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT').Value  := 0;
        if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT2').Value := 0;
        if DEST = EK_BEST_EDI then CpyDstPosTab.FieldByName('RABATT3').Value := 0;

        UpdateArtTab.Close;
      end;

      //Neuen Pos.-GPREIS berechnen
      CpyDstPosTab.FieldByName('EPREIS').AsFloat :=
        cao_round_nk(CpyDstPosTab.FieldByName('EPREIS').AsFloat, DM1.EK_NACHKOMMA);

      if CpyDstPosTab.FieldByName('MENGE').Value = 0 then
      begin
        CpyDstPosTab.FieldByName('GPREIS').Value := 0;
       end else
       begin
        Summe := CpyDstPosTab.FieldByName('EPREIS').Value *
                 CpyDstPosTab.FieldByName('MENGE').Value;

        if CpyDstPosTab.FieldByName('RABATT').Value <> 0 then
          Summe := Summe - Summe * CpyDstPosTab.FieldByName('RABATT').Value / 100;

        CpyDstPosTab.FieldByName('GPREIS').Value :=cao_round_nk (Summe,2); // Auf 2 NK runden
      end;

      {
      Summe :=CpyDstPosTab.FieldByName('EPREIS').Value * CpyDstPosTab.FieldByName('MENGE').Value;
      if CpyDstPosTab.FieldByName('RABATT').Value <> 0
        then Summe :=Summe - Summe * CpyDstPosTab.FieldByName('RABATT').Value / 100;

      Case CpyDstPosTab.FieldByName('STEUER_CODE').Value of
          0: Steuer :=CpyDstKopfTabMWST_0.Value;
          1: Steuer :=CpyDstKopfTabMWST_1.Value;
          2: Steuer :=CpyDstKopfTabMWST_2.Value;
          3: Steuer :=CpyDstKopfTabMWST_3.Value;
          else Steuer :=0;
      end;

      NSumme :=CAO_round_nk(Summe,2);  // Auf ganze Pfennige Runden
      MSumme :=CAO_round_nk(Summe * (Steuer / 100),2); // Auf ganze Pfennige Runden
      BSumme :=NSumme+MSumme;

      N :=N+NSumme;
      M :=M+MSumme;
      B :=B+BSumme;


      case CpyDstPosTab.FieldByName('STEUER_CODE').Value of
              0:M0 :=M0 + MSumme;
              1:M1 :=M1 + MSumme;
              2:M2 :=M2 + MSumme;
              3:M3 :=M3 + MSumme;
      end;
      }

      if CpyDstKopfTabBrutto_Flag.ASBoolean then
      begin
        //Bruttofakturierung
        B := B+CpyDstPosTab.FieldByName('GPREIS').AsFloat;

        case CpyDstPosTab.FieldByName('STEUER_CODE').AsInteger of
          0: B0 := B0 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          1: B1 := B1 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          2: B2 := B2 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          3: B3 := B3 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
        end;
      end else
      begin
        // Netto
        N := N+CpyDstPosTab.FieldByName('GPREIS').AsFloat;

        case CpyDstPosTab.FieldByName('STEUER_CODE').AsInteger of
          0: N0 := N0 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          1: N1 := N1 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          2: N2 := N2 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
          3: N3 := N3 + CpyDstPosTab.FieldByName('GPREIS').AsFloat;
        end;
      end;

      // Lohn, Ware, Transportkosten
      if Length(CpyDstPosTab.FieldByName('ARTIKELTYP').AsString) = 1 then
        T := CpyDstPosTab.FieldByName('ARTIKELTYP').AsString[1]
      else
        T := '?';

      case t of
        'N','S','V','F' : Ware := Ware + CpyDstPosTab.FieldByName('GPREIS').AsFloat;//NSumme;
        'L'             : Lohn := Lohn + CpyDstPosTab.FieldByName('GPREIS').AsFloat;//NSumme;
        'K'             : TKst := TKst + CpyDstPosTab.FieldByName('GPREIS').AsFloat;//NSumme;
      end;
    end;

    if not CpyDstKopfTabMWST_FREI_Flag.AsBoolean then
    begin
      if CpyDstKopfTabBrutto_Flag.ASBoolean then
      begin
        //Bruttofakturierung
        M1 := CAO_round_nk(B1 / (100+CpyDstKopfTabMwSt_1.AsFloat)*CpyDstKopfTabMwSt_1.AsFloat,2);
        M2 := CAO_round_nk(B2 / (100+CpyDstKopfTabMwSt_2.AsFloat)*CpyDstKopfTabMwSt_2.AsFloat,2);
        M3 := CAO_round_nk(B3 / (100+CpyDstKopfTabMwSt_3.AsFloat)*CpyDstKopfTabMwSt_3.AsFloat,2);

        N0 := B0-M0;
        N1 := B1-M1;
        N2 := B2-M2;
        N3 := B3-M3;

        M := M0+M1+M2+M3;
        N := B-M;
      end else
      begin
        // Nettofakturierung
        M1 := CAO_round(N1*CpyDstKopfTabMwSt_1.AsFloat)/100;
        M2 := CAO_round(N2*CpyDstKopfTabMwSt_2.AsFloat)/100;
        M3 := CAO_round(N3*CpyDstKopfTabMwSt_3.AsFloat)/100;

        B0 := N0+M0;
        B1 := N1+M1;
        B2 := N2+M2;
        B3 := N3+M3;

        M := M0+M1+M2+M3;
        B := N+M;
      end;
    end else
    begin  // MwSt-Frei ...
      M := 0; M1 := 0; M2 := 0; M3 := 0;
      B := N;
    end;

    // Bei VK-Rechnungen (Edi) die Lieferscheinnummer der
    // zugrundeliegenden Rechnung löschen
    if Dest = VK_RECH_EDI then
      CpyDstPosTab.FieldByName('VLSNUM').AsString := '';

    if ((Dest = EK_RECH_EDI) and (CpySrcKopfTabQuelle.AsInteger = EK_BEST)) or
       ((Dest = VK_LIEF_EDI) and (CpySrcKopfTabQuelle.AsInteger = VK_RECH_EDI)) then
    begin
      // Im Einkauf Verweis auf die zugrundeliegenden Bestell-Positionen machen
      // im Verkauf/Lieferschein Verweis auf zugrundeliegende EDI-Rechnunsposition machen
      CpyDstPosTab.FieldByName('QUELLE_SRC').AsInteger :=
        CpySrcPosTab.FieldByName('REC_ID').AsInteger;
    end;

    CpyDstPosTab.Post;

    // Seriennummern bei Lieferscheinen zuweisen
    {
    if (Dest=VK_LIEF_EDI) and
       (CpySrcKopfTabQuelle.AsInteger=VK_RECH_EDI) then
    begin
        UniQuery.Sql.Text :=
          'UPDATE ARTIKEL_SERNUM SET '+
          'LS_JOURNALPOS_ID='+
          Inttostr(CpyDstPosTab.FieldByName ('REC_ID').AsInteger)+','+
          'LS_JOURNAL_ID='+Inttostr(ID)+
          ' where VK_JOURNALPOS_ID='+
          IntToStr(CpySrcPosTab.FieldByName ('REC_ID').AsInteger)+' and '+
          'LS_JOURNALPOS_ID=-1 and ARTIKEL_ID='+
          IntToStr(CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger);

        UniQuery.ExecSql;
    end;
    }

    // EDI-Mengen aktualisieren
    UpdateArtikelEdiMenge(Dest, CpyDstPosTab.FieldByName('ARTIKEL_ID').AsInteger, 0);

    CpySrcPosTab.Next;
  end;

  if ((CpySrcKopfTabQuelle.AsInteger in [EK_RECH,EK_RECH_EDI]) and (Dest = VK_RECH_EDI)) or
     ((CpySrcKopfTabQuelle.AsInteger in [VK_RECH,VK_RECH_EDI,VK_AGB,VK_AGB_EDI]) and (Dest = EK_BEST_EDI)) or
     (Dest=VK_LIEF_EDI) then
  begin
    CpyDstKopfTab.Edit;

    CpyDstKopfTabNSumme.Value := N;
    CpyDstKopfTabNSumme_0.Value := N0;
    CpyDstKopfTabNSumme_1.Value := N1;
    CpyDstKopfTabNSumme_2.Value := N2;
    CpyDstKopfTabNSumme_3.Value := N3;

    CpyDstKopfTabMSumme.Value := M;
    CpyDstKopfTabMSumme_0.Value := M0;
    CpyDstKopfTabMSumme_1.Value := M1;
    CpyDstKopfTabMSumme_2.Value := M2;
    CpyDstKopfTabMSumme_3.Value := M3;

    CpyDstKopfTabBSumme.Value := B;
    CpyDstKopfTabBSumme_0.Value := B0;
    CpyDstKopfTabBSumme_1.Value := B1;
    CpyDstKopfTabBSumme_2.Value := B2;
    CpyDstKopfTabBSumme_3.Value := B3;

    CpyDstKopfTabWare.Value     := Ware;
    CpyDstKopfTabLohn.Value     := Lohn;
    CpyDstKopfTabTKost.Value    := TKst;

    try
      CpyDstKopfTab.Post;
    except
    end;
  end;
  CpySrcPosTab.Close;
  CpyDstPosTab.Close;
  CpyDstKopfTab.Close;
  CpySrcKopfTab.Close;

  Result := ID;
end;

//------------------------------------------------------------------------------
function tDM1.BucheKasse(Datum: tDateTime; Quelle: Integer; Journal_ID: Integer;
                         BelNum: String; GKonto: Integer; Skonto: Double;
                         Betrag: Double; Text: String): boolean;

begin
  KasBuch.Close;
  KasBuch.Open;
  KasBuch.Append;

  try
    KasBuchBDATUM.Value     := Datum;
    KasBuchQUELLE.Value     := Quelle;
    KasBuchJOURNAL_ID.Value := Journal_ID;
    KasBuchZU_ABGANG.Value  := Betrag;
    KasBuchBTXT.AsString    := Text;
    KasBuchBELEGNUM.Value   := BelNum;
    KasBuchGKONTO.Value     := GKonto;
    KasBuchSKONTO.Value     := Skonto;

    KasBuchERSTELLT.AsDateTime := now;
    KasBuchERST_NAME.AsString  := view_user;
    KasBuchMA_ID.AsInteger     := UserID;

    KasBuch.Post;
    Result := True;
  except
    KasBuch.Cancel;
    Result := False;
  end;
  KasBuch.Close;
end;

//------------------------------------------------------------------------------
procedure TDM1.JourTabCalcFields(DataSet: TDataSet);
begin
     JourTabIST_SKONTO_BETR.Value :=JourTabBSumme.Value - JourTabIST_Betrag.Value;
end;
//------------------------------------------------------------------------------
procedure TDM1.KGRTabBeforePost(DataSet: TDataSet);
begin
     if KGRTabMainKey.Value='' then KGRTabMainKey.Value :='MAIN\ADDR_HIR';
end;
//------------------------------------------------------------------------------
procedure TDM1.FirBankTabBeforePost(DataSet: TDataSet);
begin
     FirBankTabmainkey.Value :='MAIN\FIRMENKONTEN';
end;
//------------------------------------------------------------------------------
function TDM1.GetWGRDefaultKonten (WGR : Integer; var EKTO, AKTO : Integer) : Boolean;
begin
     Result := False;
     if not WGRTab.Active then WGRTab.Open;

     if WGRTab.Locate ('ID',WGR,[]) then
     begin
        if WgrTabDEF_AKTO.AsInteger > 0 then AKTO :=WgrTabDEF_AKTO.AsInteger;
        if WGRTabDEF_EKTO.AsInteger > 0 then EKTO :=WGRTabDEF_EKTO.AsInteger;
        Result := True;
     end;
end;
//------------------------------------------------------------------------------
Function tDM1.CheckBankverbindung(addr_id: integer): boolean;
begin
  Result := False;
  KunTab.Close;
  KunTab.ParamByName ('ID').AsInteger := addr_id;
  KunTab.Open;
  if not KunTab.Eof then
  begin
    try
      Result := (Length(KunTabBLZ.AsString) = BLZ_LEN) and
                (Length(KunTabKTO.AsString) > 1) and
                (Length(KunTabBank.AsString) > 3) and
                (StrToInt(KunTabBLZ.AsString) > 0);

    except
      Result := False;
    end;
  end else
    Result := False;
  KunTab.Close;
end;

//------------------------------------------------------------------------------
Function tDM1.GetBankverbindung(addr_id: integer; var BLZ: Integer;
                                var KTO: String; var Inhaber: String): boolean;
var
  OK: Boolean;
begin
  OK := False;
  KunTab.Close;
  KunTab.ParamByName('ID').AsInteger := addr_id;
  KunTab.Open;
  if not KunTab.Eof then
  begin
    try
      OK :=(Length(KunTabBLZ.AsString) = 8) and
           (Length(KunTabKTO.AsString) > 1) and
           (Length(KunTabBank.AsString) > 3) and
           (StrToInt(KunTabBLZ.AsString) > 0);
    except
      OK := False;
    end;
  end else
    Result :=OK;

  if OK then
  begin
    BLZ := StrToInt(KunTabBLZ.AsString);
    KTO := KunTabKTO.AsString;

    if Length(KunTabKTO_INHABER.AsString) > 0 then
      Inhaber := KunTabKTO_INHABER.AsString
    else
      Inhaber := KunTabName1.AsString;
  end;

  KunTab.Close;
  Result := OK;
end;

//------------------------------------------------------------------------------
Function tDM1.GetLieferant(addr_id: integer; var Info: String): boolean; // True wenn ok
var
  s : String;
begin
  if Addr_id<1 then begin Info :='???'; exit; end;

  KunTab.Close;
  KunTab.ParamByName('ID').AsInteger := addr_id;
  KunTab.Open;
  if not KunTab.Eof then
  begin
    S := KunTabNAME1.AsString;
    if Length(KunTabNAME2.AsString) > 0 then
    begin
      if Length(S) > 0 then
        S := S+', ';
      S := S+KunTabNAME2.AsString;
    end;
    if Length(KunTabNAME3.AsString) > 0 then
    begin
      if Length(S) > 0 then
        S := S+', ';
      S := S+KunTabNAME3.AsString;
    end;

    if Length(KunTabStrasse.AsString) > 0 then
    begin
      if Length(S) > 0 then
        S := S+', ';
      S := S+KunTabStrasse.AsString;
    end;

    S := S+', '+KunTabPlz.AsString+' '+KunTabOrt.AsString;

    Info := S;
    Result := True;
  end else
  begin
    Result := False;
    S := '';
  end;
  KunTab.Close;
end;

//------------------------------------------------------------------------------
procedure TDM1.DataModuleDestroy(Sender: TObject);
begin
     SetLength(MandantTab,0);
end;
//------------------------------------------------------------------------------
function TDM1.CalcRabGrpPreis(RGID: String; PR_Ebene: Integer; var Preis: Double): Boolean;
begin
  Result := False;
  if (RGID = '-') or (Length(RGID) = 0) or (PR_Ebene < 0) or (PR_EBENE > 4) or
     (PR_EBENE >= ANZPREIS) then
    exit;

  if Preis = 0 then
  begin
    Result := True;
    exit;
  end;

  if PR_Ebene = 0 then  //EK-Preis
  begin
    if not LiefRabGrp.Active then
      LiefRabGrp.Open;

    if (LiefRabGrp.RecordCount = 0) then
      exit;
    if (LiefRabGrpRABGRP_ID.AsString = RGID) or
       (LiefRabGrp.Locate('RABGRP_ID', RGID, [loCaseInsensitive])) then
    begin
      if (LiefRabGrpRABGRP_ID.Value = RGID) then
      begin
        Preis := Preis - (Preis / 100 * LiefRabGrpRABATT1.AsFloat);
        Preis := Preis - (Preis / 100 * LiefRabGrpRABATT2.AsFloat);
        Preis := Preis - (Preis / 100 * LiefRabGrpRABATT3.AsFloat);

        // auf 3 Nachkommastellen runden
        Preis := CAO_round(Preis*1000)/1000;

        Result := True;
      end;
    end;
  end else
  begin
    if not KunRabGrp.Active then
      KunRabGrp.Open;

    if (KunRabGrp.RecordCount = 0) then
      exit;
    if //KunRabGrpRABGRP_ID.AsString=RGID)or
      (KunRabGrp.Locate('RABGRP_ID,LIEF_RABGRP', VarArrayOf([RGID,PR_Ebene]), [loCaseInsensitive])) then
    begin
      if (KunRabGrpRABGRP_ID.Value = RGID) and
         (KunRabGrpLIEF_RABGRP.AsInteger = PR_Ebene) then
      begin
        Preis := Preis - (Preis / 100 * KunRabGrpRABATT1.AsFloat);
        Preis := Preis - (Preis / 100 * KunRabGrpRABATT2.AsFloat);
        Preis := Preis - (Preis / 100 * KunRabGrpRABATT3.AsFloat);

        // auf 2 Nachkommastellen runden
        Preis := CAO_round(Preis*100)/100;

        Result := True;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TDM1.UpdateArtikelEdiMenge(JournalTyp, ArtikelID: Integer; MengeDiff: Double): Boolean;
var
  OldTickCount: DWord;
begin
  Result := False;

  ///NEU JAN 06.06.2004
  try
    OldTickCount := GetTickCount;

    zbatchsql1.Script.text :=
      'delete from ARTIKEL_BDATEN where QUELLE='+IntToStr(JournalTyp)+';'+
      'insert into ARTIKEL_BDATEN '+
      'select ARTIKEL_ID, QUELLE, 0, 0, SUM(MENGE) '+
      'from JOURNALPOS '+
      'where QUELLE='+IntToStr(JournalTyp)+' and '+
      'ARTIKELTYP IN ("N","S","L","K","X") and ARTIKEL_ID>0 '+
      'group by ARTIKEL_ID, QUELLE '+
      'having SUM(MENGE) !=0;';

    ProgressForm.Init('EDI-Mengen aktualisieren ...');
    ProgressForm.Start;
    ZBatchSql1.Execute;
    ProgressForm.Stop;

    if (LogLevel >= 5) and (assigned(LogForm)) then
      logform.addlog('EDI-Mengen aktualisieren :'+FormatFloat (',#0.00',(GetTickCount - OldTickCount)/1000)+'Sek.'+#13#10);

    Result := True;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
function TDM1.UpdateEKBestMenge : Boolean;
var OldTickCount : DWord;
begin
  Result := False;

  try
    OldTickCount := GetTickCount;

    zbatchsql1.Script.text :=
      'delete from ARTIKEL_BDATEN where QUELLE IN(26);'+
      'insert into ARTIKEL_BDATEN '+
      'select '+
      'JP1.ARTIKEL_ID,26,0,0,IF(SUM(JP1.MENGE)-SUM(IFNULL(JP2.MENGE,0))<0,'+
      '0,SUM(JP1.MENGE) - SUM(IFNULL(JP2.MENGE,0))) as MENGE_OFFEN '+
      'from JOURNALPOS JP1, JOURNAL J '+
      'left outer join JOURNALPOS JP2 on JP2.QUELLE_SRC=JP1.REC_ID '+
      'and JP2.QUELLE IN(5) '+
      'where JP1.QUELLE=6 and J.QUELLE=6 and J.STADIUM IN (20,30) and '+
      'J.REC_ID=JP1.JOURNAL_ID and JP1.ARTIKELTYP IN ("N","S","L","K") '+
      'group by JP1.ARTIKEL_ID having MENGE_OFFEN>0;';

    ProgressForm.Init('EK-BEST-Mengen aktualisieren ...');
    ProgressForm.Start;
    ZBatchSql1.Execute;
    ProgressForm.Stop;

    if (LogLevel >= 5) and (assigned(LogForm)) then
      logform.addlog ('EKBEST-Mengen aktualisieren :'+FormatFloat (',#0.00',(GetTickCount - OldTickCount)/1000)+'Sek.'+#13#10);

    Result := True;
  except
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.NummerTabNewRecord(DataSet: TDataSet);
begin
  // Neuanlage abbrechen, es sei denn die Neuanlage wird von
  // GetNummer aufgerufen, GetNummer setzt dann die Variable
  // InNewNummer auf True
  if not InNewNummer then 
    Abort;
end;

//------------------------------------------------------------------------------
procedure TDM1.ShopOrderStatusTabBeforePost(DataSet: TDataSet);
var S : String;
begin
  if Pos('SHOP_',ShopOrderStatusTab.Sql.Text) > 0 then 
    S := Copy(ShopOrderStatusTab.Sql.Text, Pos('SHOP_',ShopOrderStatusTab.Sql.Text), 6)
  else 
    S := 'SHOP';

  if ShopOrderStatusTabMainKey.Value = '' then 
    ShopOrderStatusTabMainKey.Value := S+'\ORDERSTATUS';
end;

//------------------------------------------------------------------------------
procedure TDM1.ZBatchSql1BeforeExecute(Processor: TZSQLProcessor; StatementIndex: Integer);
begin
  //wird bei jeder einzelnen SQL Anweisung aus dem Skript aufgerufen.
  ProgressForm.UpdateScreen;
end;

//------------------------------------------------------------------------------
procedure TDM1.ZBatchSql1AfterExecute(Processor: TZSQLProcessor; StatementIndex: Integer);
begin
end;

//------------------------------------------------------------------------------
procedure TDM1.ExportDatasetToStream(Stream: TStream; Dataset : TDataset; Delimiter : String;
                                     Spaltennamen : Boolean = True; TextInHochKomma : Boolean = True;
                                     DosZeichenSatz : Boolean = False);
var
  I, J      : Integer;
  Buffer,S  : string;
  FieldDesc : tField;
  OldC      : tCursor;
begin
  OldC := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    with Dataset do
    begin
      // Feldnamen als Überschrift ausgeben !!
      if (Fields.Count > 0) and (Stream.Position = 0) and (Spaltennamen) then
      begin
        Buffer := '';
        for J := 0 to FieldCount-1 do
        begin
          if J > 0 then 
            Buffer := Buffer + Delimiter;
          Buffer := Buffer + Fields[J].FieldName;
        end;

        if DosZeichenSatz then 
          CharToOEM(PChar(Buffer), @Buffer[1]);

        Stream.Write(PChar(Buffer)^, Length(Buffer));
     end;

     First;

     while not EOF do
     begin
        Buffer := #13#10;
        for J := 0 to Fields.Count-1 do
        begin
          FieldDesc := Fields[J];
          if J > 0 then 
            Buffer := Buffer + Delimiter;
          if not (FieldDesc.DataType in [ftInteger, ftSmallInt, ftFloat, ftAutoInc, ftCurrency, ftLargeInt, ftBCD]) and not FieldDesc.IsNull then
          begin
            S := FieldDesc.AsString;

            if TextInHochKomma then
              Buffer := Buffer + AnsiQuotedStr(sqlStringToSQL(S), '"')
            else 
              Buffer := Buffer + sqlStringToSql(S);
          end else 
            Buffer := Buffer + FieldDesc.AsString;
        end;
        if DosZeichenSatz then 
          CharToOEM(PChar(Buffer), @Buffer[1]);
        Stream.Write(PChar(Buffer)^, Length(Buffer));
        inc(i);
        Next;
      end;

    end;
  finally
    Screen.Cursor :=oldC;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.ExportDatasetToFile (FileName: String;
                                    Dataset : TDataset;
                                    Delimiter : String;
                                    Append : Boolean;
                                    Spaltennamen : Boolean = True;
                                    TextInHochKomma : Boolean = True;
                                    DosZeichenSatz : Boolean = False);
var 
  St : tFileStream; 
  M : Word;
begin
  //Append := True;
  // 1. Datei erzeugen wenn sie nicht existiert
  if ((FileExists(FileName)) and (not Append)) or (not FileExists(FileName)) then
    FileClose(FileCreate(FileName));

  if Append then 
    M := fmOpenReadWrite 
  else 
    M := fmOpenWrite;
  M := M or fmShareDenyWrite;

  St := tFileStream.Create(FileName, M);
  if Append then 
    ST.Position := ST.Size;
  try
    ExportDatasetToStream (St, Dataset, Delimiter, Spaltennamen, TextInHochKomma, DosZeichenSatz);
  finally
    St.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.ExportDatasetToExcel (FileName: String;
                                     Dataset : TDataset;
                                     Spaltennamen : Boolean = True);

var 
  XLSfile: TXLSfile;
  I, J      : Integer;
  S         : string;
  FieldDesc : tField;
  OldC      : tCursor;
begin
  OldC := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    XLSFile := TXLSfile.Create(Self);
    I := 1;
    with Dataset do
    begin
      // Feldnamen als Überschrift ausgeben !!
      if Spaltennamen then
      begin
        for J := 0 to FieldCount-1 do 
          XLSFile.AddStrCell(J+1, I, [], Fields[J].FieldName);
      end;
      First;
      while (not EOF) and (I < 65534) do {Excel kann nur 65535 Zeilen !!!}
      begin
        inc(i);
        for J := 0 to Fields.Count-1 do
        begin
          FieldDesc := Fields[J];

          case FieldDesc.DataType of
            ftInteger,
            ftSmallInt,
            ftAutoInc,
            ftLargeInt,
            ftBCD       : XLSFile.AddDoubleCell(J+1, I, [], FieldDesc.AsInteger);
            ftFloat,
            ftCurrency  : XLSFile.AddDoubleCell(J+1, I, [], FieldDesc.AsFloat);
          else            XLSFile.AddStrCell(J+1, I, [], FieldDesc.AsString);
          end;
        end;
        Next;
      end;
    end;

    XLSFile.FileName := FileName;
    XLSFile.Write;
  finally
    XLSFile.Free;
    Screen.Cursor := oldC;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.UpdateArtikelPreis(RechTyp, Artikel_ID, Addr_ID: Integer; Preis: Double);
begin
  Uniquery.Close;
  UniQuery.ReadOnly := False;
  try
    UniQuery.Sql.Text := 'select * from ARTIKEL_PREIS where ARTIKEL_ID='+
                         IntToStr(Artikel_ID)+
                         ' and ADRESS_ID='+
                         IntToStr(Addr_ID);
    UniQuery.Open;
    if UniQuery.RecordCount = 1 then
    begin
      UniQuery.Edit;
      try
        UniQuery.FieldByName('PREIS').AsFloat := Preis;
        UniQuery.FieldByName('GEAEND').AsDateTime := Now;
        UniQuery.FieldByName('GEAEND_NAME').AsString := View_User;

        UniQuery.Post;
      except
        UniQuery.Cancel;
      end;
    end else
    begin 
      if UniQuery.RecordCount = 0 then
      begin
        // neuen Eintrag anlegen
        UniQuery.Append;
        try
          UniQuery.FieldByName('ARTIKEL_ID').AsInteger := Artikel_ID;
          UniQuery.FieldByName('ADRESS_ID').AsInteger := Addr_ID;
          UniQuery.FieldByName('PREIS_TYP').AsInteger := RechTyp;
          UniQuery.FieldByName('PREIS').AsFloat := Preis;
          UniQuery.FieldByName('GEAEND').AsDateTime := Now;
          UniQuery.FieldByName('GEAEND_NAME').AsString := View_User;
          UniQuery.Post;
        except
          UniQuery.Cancel;
        end;
      end;
    end;
  finally
    Uniquery.Close;
    UniQuery.ReadOnly := True;
  end;
end;

//------------------------------------------------------------------------------
function TDM1.GetSearchSQL(Felder: array of String; Suchbegriff: String): String;
var
  Stk          : TaaStringStack;
  Parser       : TaaSearchParser;
  RPNNode      : TaaRPNNode;
  Word1        : string;
  Word2        : string;
  SQL, SQL2, S : String;
  I, P         : Integer;

begin
  Stk := nil;
  Parser := nil;
  try
    Stk := TaaStringStack.Create;
    Parser := TaaSearchParser.Create(Suchbegriff);
    RPNNode := Parser.RPN;
    while (RPNNode <> nil) do
    begin
      if (RPNNode is TaaRPNWord) then
        Stk.Push('(@@@FN@@@ like ''%' + TaaRPNWord(RPNNode).PhraseWord + '%'')')
      else 
      if (RPNNode is TaaRPN_AND) then
      begin
        Word2 := Stk.Pop;
        Word1 := Stk.Pop;
        Stk.Push('(' + Word1 + ' and ' + Word2 + ')');
      end else 
      if (RPNNode is TaaRPN_OR) then
      begin
        Word2 := Stk.Pop;
        Word1 := Stk.Pop;
        Stk.Push('(' + Word1 + ' or ' + Word2 + ')');
      end else
      begin
        Word1 := Stk.Pop;
        Stk.Push('(not ' + Word1 + ')');
      end;
      RPNNode := RPNNode.Next;
    end;

    SQL := '';
    SQL2 := Stk.Pop; // in SQL2 steht jetzt der SQL-Befehl mit dem Feldplatzhalter

    // Feldnamen einfügen
    if Length(Felder) > 0 then // Alle Felder durchlaufen
    begin
      For i := 0 to Length(Felder)-1 do
      begin
        S := SQL2;
        while Pos('@@@FN@@@',S) > 0 do // Platzhalter gefunden
        begin
          P := Pos('@@@FN@@@',S);
          Delete(S, P, 8);           // Platzhalter löschen
          insert(Felder[i], S, P);   // und durch Feldnamen ersetzen
        end;

        // wenn in mehreren Feldern gesucht wird dan die einzelnen Suchen
        // mit oder verknüpfen
        if Length(SQL) > 0 then 
          SQL := SQL + ' or ';
        SQL := SQL + '('+S+')';
      end;
    end;
    Result := SQL; // SQL-String zurückgeben
  finally
    Stk.Free;
    Parser.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.FirmaTabCalcFields(DataSet: TDataSet);
begin
  FirmaTabUSER_AKT.AsString     := View_User;
  FirmaTabLEITWAEHRUNG.AsString := Leitwaehrung;
  FirmaTabMANDANT_NAME.AsString := AktMandant;
end;

//------------------------------------------------------------------------------
function TDM1.GetVertreterProv(ID: Integer): Double;
begin
  Result := 0;
  if ID < 1 then 
    exit;

  if ID = LastVertrID then
  begin
    Result := LastVertrProz;
    exit;
  end;

  if not VertreterTab.Active then 
    VertreterTab.Open;

  if (VertreterTab.Locate('VERTRETER_ID', ID, [])) and
     (VertreterTab.FieldByName('VERTRETER_ID').AsInteger = ID) then
  begin
    LastVertrID   := VertreterTab.FieldByName('VERTRETER_ID').AsInteger;
    LastVertrProz := VertreterTab.FieldByName('PROVISIONSATZ').AsFloat;

    Result := LastVertrProz;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.CheckTerminalID;
var 
  I: Integer;
begin
  Uniquery.SQL.Text := 'select SUBSTRING_INDEX(USER(),"@",-1) as PC';
  Uniquery.Open;
  TermIDStr := Uniquery.FieldByName('PC').AsString;
  Uniquery.Close;

  Uniquery.SQL.Text := 'select MAINKEY, NAME, VAL_INT from REGISTRY '+
                       'where MAINKEY="MAIN\\TERMINAL" and NAME="'+TermIDStr+'"';
  Uniquery.Open;
  if Uniquery.RecordCount = 1 then
  begin
    TermID := Uniquery.FieldByName('VAL_INT').AsInteger;
    Uniquery.Close;
  end else
  begin
    Uniquery.Close;
    Uniquery.SQL.Text := 'select COUNT(*) as ANZ FROM REGISTRY '+
                         'where MAINKEY="MAIN\\TERMINAL"';
    UniQuery.Open;
    I := UniQuery.FieldByName('ANZ').AsInteger+1;
    UniQuery.Close;

    UniQuery.SQL.Text := 'INSERT INTO REGISTRY SET '+
                         'MAINKEY="MAIN\\TERMINAL", NAME="'+TermIDStr+'", '+
                         'VAL_INT='+IntToStr(i)+', VAL_TYP=3';
    UniQuery.ExecSQL;

    TermID := I;
  end;

  //CheckRegister2;
end;

//------------------------------------------------------------------------------
function tDM1.GetArtikelPreis(ArtikelID, KunID, PE: Integer; Brutto: Boolean; Menge: Double; var Preis: Double): Boolean;
var 
  PR, M, B : Double;
  PreisTyp : Integer;
begin
  Result := False;

  if PE=0 then 
    PreisTyp := EK_RECH 
  else 
    PreisTyp := VK_RECH;


  if (ArtInfoTab.Active) and
     (ArtInfoTab.RecordCount > 0) and
     (
       (DM1.ArtInfoTab.Locate('REC_ID;PREIS_TYP;ADRESS_ID', VarArrayOF([ArtikelID,PreisTyp,KunID]), [])) or
       (DM1.ArtInfoTab.Locate('REC_ID', ArtikelID, []))
     ) then
     //(ArtInfoTab.Locate ('REC_ID',ArtikelID,[])) then
  begin
    if Brutto then
    // B R U T T O - P R E I S E R M I T T L U N G
    begin
      //Kundenpreis prüfen
      if (ArtInfoTabAdress_ID.AsInteger = KunID) and (ArtInfoTabPreis.AsFloat <> 0) then
      begin
        PR := ArtInfoTabPreis.AsFloat;
        // Brutto berechnen
        case ArtInfoTabSTEUER_CODE.AsInteger of
          1: M := MWSTTab[1];
          2: M := MWSTTab[2];
          3: M := MWSTTab[3];
        else
          M := MWSTTab[0];
        end;

        M := M+100;           // jetzt z.B. 116
        B := CAO_round(PR*M); // jetzt ganze Cent
        B := CAO_Round(B / BR_RUND_WERT) * BR_RUND_WERT / 100;
        Preis := B;
      end else
        // Normaler Preis
      begin
        case PE of
          0: PR := ArtInfoTabEK_PREIS.Value;
          1: PR := ArtInfoTabVK1B.Value;
          2: PR := ArtInfoTabVK2B.Value;
          3: PR := ArtInfoTabVK3B.Value;
          4: PR := ArtInfoTabVK4B.Value;
        else
          PR := ArtInfoTabVK5B.Value;
        end;
        Preis := PR;

        // oder eventuell einen Staffelpreis
        case PE of
          0,1: ; // Do Nothing
          2: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK2B.Value, PR) then 
               Preis := PR;
          3: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK3B.Value, PR) then 
               Preis := PR;
          4: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK4B.Value, PR) then 
               Preis := PR;
        else
          if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK5B.Value, PR) then 
            Preis := PR;
        end;
      end;


      if (ArtInfoTabRABGRP_ID.AsString <> '-') and (Length(ArtInfoTabRABGRP_ID.AsString) > 0) and
         //(ArtInfoTabPreis.AsFloat=0) then
         (ArtInfoTabAdress_ID.AsInteger <> KunID) then
      begin
        // Ist ein Artikel mit Rabattgruppe !!!
        // Brutto muß berechnet werden

        // Listenpreis festlegen
        case AnzPreis of
          1: PR := ArtInfoTabVK1.Value;
          2: PR := ArtInfoTabVK2.Value;
          3: PR := ArtInfoTabVK3.Value;
          4: PR := ArtInfoTabVK4.Value;
        else
          PR := ArtInfoTabVK5.Value;
        end;

        // nur wenn Rab.Gruppe gefunden
        if CalcRabGrpPreis(ArtInfoTabRABGRP_ID.AsString, PE,PR) then
        begin
          case ArtInfoTabSTEUER_CODE.AsInteger of
            1: M := MWSTTab[1];
            2: M := MWSTTab[2];
            3: M := MWSTTab[3];
          else
            M := MWSTTab[0];
          end;
          M := M+100; // jetzt z.B. 116

          B := CAO_round(PR*M); // jetzt ganze Cent
          B := CAO_Round (B / BR_RUND_WERT) * BR_RUND_WERT / 100;
          Preis := B;
        end;
      end;
    end else
    begin
      // N E T T O - P R E I S E R M I T T L U N G
      // Kundenpreis prüfen
      if (ArtInfoTabAdress_ID.AsInteger = KunID) and
         (ArtInfoTabPreis.AsFloat <> 0) then
      begin
        // Kundenpreis verwenden
        Preis := ArtInfoTabPreis.AsFloat;
      end else
      begin
        // normalen Preis verwenden
        case PE of
          0: PR := ArtInfoTabEK_Preis.Value;
          1: PR := ArtInfoTabVK1.Value;
          2: PR := ArtInfoTabVK2.Value;
          3: PR := ArtInfoTabVK3.Value;
          4: PR := ArtInfoTabVK4.Value;
        else
          PR := ArtInfoTabVK5.Value;
        end;
        Preis := PR;

        // oder eventuell einen Staffelpreis
        case PE of
          0,
          1: ; // Do Nothing
          2: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK2.Value, PR) then 
               Preis := PR;
          3: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK3.Value, PR) then 
               Preis := PR;
          4: if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK4.Value, PR) then 
               Preis := PR;
          else
            if GetStaffelPreis(ArtikelID, Menge, ArtInfoTabVK5.Value, PR) then 
              Preis := PR;
        end;
      end;

      if (ArtInfoTabRABGRP_ID.AsString <> '-') and
         (Length(ArtInfoTabRABGRP_ID.AsString) > 0) and
         (ArtInfoTabAdress_ID.AsInteger <> KunID) then
      begin
        // Ist ein Artikel mit Rabattgruppe !!!

        // Listenpreis festlegen
        case AnzPreis of
          1: PR := ArtInfoTabVK1.Value;
          2: PR := ArtInfoTabVK2.Value;
          3: PR := ArtInfoTabVK3.Value;
          4: PR := ArtInfoTabVK4.Value;
        else
          PR := ArtInfoTabVK5.Value;
        end;

        // nur wenn Rab.Gruppe gefunden
        if CalcRabGrpPreis(ArtInfoTabRABGRP_ID.AsString, PE, PR) then 
          Preis := PR;
      end;

    end;

    Result := True;
  end;
end;

//------------------------------------------------------------------------------
// GetLagerMenge - Lesen der aktuellen Artikelmenge (Lagerbestand)
//------------------------------------------------------------------------------

function tDM1.GetLagerMenge(ArtikelID: Integer; var Menge: Double): Boolean;
begin
  Result := False;
  Menge  := 0;

  DM1.Uniquery.close;
  DM1.UniQuery.Sql.Clear;
  DM1.Uniquery.sql.Add('SELECT MENGE_AKT FROM ARTIKEL');
  DM1.UniQuery.Sql.Add(' WHERE REC_ID='+Inttostr(ArtikelID));
  DM1.UniQuery.ExecSql;
  DM1.Uniquery.Open;

  if DM1.UniQuery.RecordCount > 0 then
  begin
    Menge := DM1.UniQuery.FieldByName('MENGE_AKT').AsFloat;
    Result := True;
  end;
  DM1.UniQuery.Close;
end;

//------------------------------------------------------------------------------
// Liefert True zurück wenn in der Warengruppe ein Kalkulationsfaktor festgelegt
// wurde
//------------------------------------------------------------------------------
function tDM1.GetWGRCalcFaktor(Wgr, PreisID: Integer; var Faktor: Double): Boolean;
var 
 I: Integer;
begin
  Result := False;
  if (PreisID < 1) or (PreisID > 5) then // VK geht nur von 1-5 !!!
    exit; 

  if WgrFaktorCache.Wgr = Wgr then
  begin
    Faktor := WgrFaktorCache.FTab[PreisID];
  end else
  begin
    if not WgrTab.Active then 
      WgrTab.Open;

    if (WgrTab.RecordCount > 0) and (WgrTab.Locate('ID', Wgr, [])) then
    begin
      for i := 1 to AnzPreis do
      begin
        WgrFaktorCache.FTab[i] := WgrTab.FieldByName('VK'+IntToStr(I)+'_FAKTOR').AsFloat;
      end;
      WgrFaktorCache.Wgr := Wgr;
      Faktor := WgrFaktorCache.FTab[PreisID];
    end else 
      WgrFaktorCache.Wgr := -1; // Cache ungültig da Wgr nicht gefunden

  end;
  Result := Faktor <> 0;
end;

//------------------------------------------------------------------------------
function GetProjectVersion: string;
var 
  Null, InfoSize, FixInfo: DWord; 
  PFixInfo: PVSFixedFileInfo; 
  Zeiger: Pointer;
begin
  result := '??';
  Null := 0;
  InfoSize := GetFileVersionInfoSize(PChar(application.exename),Null);
  if InfoSize > 0 then
  begin
    Zeiger := GetMemory(InfoSize);
    try
      if assigned(Zeiger) then
      begin
        GetFileVersionInfo(PChar(application.exename), Null, InfoSize, Zeiger);
        if VerQueryValue(Zeiger, '\', Pointer(PFixInfo), FixInfo) then
        begin
          result := Format('%d.%d.%d.%d', [
                           HiWord(PFixInfo^.dwFileVersionMS),
                           LoWord(PFixInfo^.dwFileVersionMS),
                           HiWord(PFixInfo^.dwFileVersionLS),
                           LoWord(PFixInfo^.dwFileVersionLS)]);
        end;
      end;
    finally
      FreeMemory(Zeiger);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Benutzerrechte
//------------------------------------------------------------------------------
function TDM1.CaoSecurityFindUser(UserName: String; var MA_ID, GRUPPE_ID: Integer): Boolean;
begin
  // Vorgehen :
  // 1. Mitarbeiter über seinen Namen in der Tabelle MITARBEITER suchen
  // 2. wenn gefunden, die MITARBEITER.MA_ID verwenden umaus der Tabelle
  //    BENUTZERRECHTE die zugehörige Gruppe zu ermitteln
  // 3. MA_ID und Gruppe zurückliefern,
  //    wenn User nicht gefunden, Result = False

  Result    := False;
  GRUPPE_ID := -1;
  MA_ID     := -1;

  UniQuery.Close;
  UniQuery.SQL.Text := 'SELECT MA_ID, LOGIN_NAME FROM MITARBEITER '+
                       'WHERE LOGIN_NAME=:NAME';
  UniQuery.ParamByName('NAME').AsString := UserName;
  UniQuery.Open;

  if UniQuery.RecordCount=1 then
  begin
    MA_ID := UniQuery.FieldByName('MA_ID').AsInteger;
    UniQuery.Close;

    {$IFDEF ALPHA}
    //Jetzt Benutzergruppe finden
    UniQuery.Sql.Text := 'SELECT GRUPPEN_ID, USER_ID FROM BENUTZERRECHTE '+
                         'WHERE USER_ID='+IntToStr(MA_ID)+' AND '+
                         'MODUL_ID=0 and SUBMODUL_ID=0';
    UniQuery.Open;
    if UniQuery.RecordCount = 1 then
    begin
      GRUPPE_ID := UniQuery.FieldByName('GRUPPEN_ID').AsInteger;
      Result := True;
    end;
    UniQuery.Close;

    {$ELSE}
    GRUPPE_ID := 1;
    Result := True;     
    {$ENDIF}
  end else
  begin
    UniQuery.Close;
    Result := False;
  end;
end;

//------------------------------------------------------------------------------
procedure TDM1.CaoSecurityLoadGruppeRechte(Sender: TObject);
begin
  {$IFDEF ALPHA}
  with UniQuery do
  begin
    Close;
    Sql.Text := 'select GRUPPEN_ID, MODUL_ID, SUBMODUL_ID, RECHTE '+
                'from BENUTZERRECHTE B '+
                'where GRUPPEN_ID='+IntToStr(CaoSecurity.CurrGroupID)+' and '+
                'USER_ID=-1 and MODUL_ID > 0 '+
                'order by GRUPPEN_ID, MODUL_ID, SUBMODUL_ID';
    Open;
    while not Eof do
    begin
      CaoSecurity.AddGruppenRecht(FieldByName('MODUL_ID').AsInteger,
                                  FieldByName('SUBMODUL_ID').AsInteger,
                                  FieldByName('RECHTE').AsInteger);

      Next;
    end;
    Close;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TDM1.CaoSecurityLoadUserRechte(Sender: TObject);
begin
  {$IFDEF ALPHA}
  with UniQuery do
  begin
    Close;
    Sql.Text := 'select GRUPPEN_ID,USER_ID,MODUL_ID,SUBMODUL_ID,RECHTE '+
                'from BENUTZERRECHTE where '+
                'USER_ID='+IntToStr(CaoSecurity.CurrUserID)+
                ' and GRUPPEN_ID=-1 and MODUL_ID > 0 '+
                'order by MODUL_ID, SUBMODUL_ID';
    Open;
    while not Eof do
    begin
      CaoSecurity.AddUserRecht(FieldByName('MODUL_ID').AsInteger,
                               FieldByName('SUBMODUL_ID').AsInteger,
                               FieldByName('RECHTE').AsInteger);

      Next;
    end;
    Close;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TDM1.StarteNewProgramm(Name, Cmd, Dir: String);
var 
  res: integer;
  Msg: String;
begin
  res := shellexecute(
    application.mainform.handle,
    pchar('open'), PChar(name), pchar(cmd), pchar(dir), sw_shownormal
  );

  if res <= 32 then
  begin
    Msg := GetErrorStr(Res);
    messagebox(application.mainform.handle, @msg[1], 'Problem', 16);
  end;
end;

//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Funktionen um ein virtuelles Recordlocking zu ermöglichen
//------------------------------------------------------------------------------
{
// Problem, Funktion wird erst ab MySQL 4.0.2 unterstützt :-(

function TDM1.CaoSecurityIsFreeLock(ModulID: String; SatzID: Integer): Boolean;
begin
  LockQuery.Close;
  LockQuery.Sql.Text := 'SELECT IS_FREE_LOCK("'+ModulID+'_RECID_'+
                        IntToStr(SatzID)+'") as LOCKVAR';
  LockQuery.Open;
  if (LockQuery.RecordCount = 1) and
     (LockQuery.FieldByName('LOCKVAR').AsInteger = 1) then 
    Result := True
  else 
    Result := False;

  LockQuery.Close;
end;
}

//------------------------------------------------------------------------------
function TDM1.CaoSecuritySetLock(ModulID: String; SatzID: Integer): Boolean;
begin
  LockQuery.Close;
  LockQuery.Sql.Text := 'SELECT GET_LOCK("'+ModulID+'_RECID_'+
                        IntToStr(SatzID)+'",3) as LOCKVAR';
  LockQuery.Open;
  if (LockQuery.RecordCount = 1) and
     (LockQuery.FieldByName('LOCKVAR').AsInteger = 1) then 
    Result := True
  else 
    Result := False;

  LockQuery.Close;
end;

//------------------------------------------------------------------------------
function TDM1.CaoSecurityReleaseLock(ModulID: String; SatzID: Integer): Boolean;
begin
  LockQuery.Close;
  LockQuery.Sql.Text := 'SELECT RELEASE_LOCK("'+ModulID+'_RECID_'+
                        IntToStr(SatzID)+'") as LOCKVAR';
  LockQuery.Open;
  if (LockQuery.RecordCount = 1) and
     (LockQuery.FieldByName('LOCKVAR').AsInteger = 1) then 
    Result := True
  else 
    Result := False;

  LockQuery.Close;
end;

//------------------------------------------------------------------------------
procedure TDM1.LockError(Error: Integer);
begin
  //MessageDlg(_('Datensatz-Sperre Code : ')+IntToStr(Error),mterror,[mbok],0);
  MessageDlg(_('der Datensatz wird zur Zeit von '+
               'einem anderen Nutzer bearbeitet,'+#13#10+
               'warten Sie bis der Benutzer den Datensatz '+
               'freigegebn hat.'+#13#10+
               'Code : ')+IntToStr(Error), mterror, [mbok], 0
  );
end;

//------------------------------------------------------------------------------
function TDM1.InsertStuecklistenArtikel(JournalID, JournalposID, ArtikelID, AddrID, BelegArt : Integer;
                                        Menge: Double; BelegNum: String): Boolean;
var 
  IStr: String;
begin
  Result := False;

  STListTab.Close;
  STListTab.ParamByName('ID').ASInteger := ArtikelID;
  STListTab.Open;

  while not STListTab.Eof do
  begin
    // Menge erniedrigen
    {
    ArtMengeTab.Close;
    ArtMengeTab.ParamByName('ID').Value := STListTabART_ID.Value;
    ArtMengeTab.ParamByName('SUBMENGE').Value := JPosTabMenge.Value * STListTabMENGE.Value;
    ArtMengeTab.ExecSql;
    }
    if Length(IStr) > 0 then 
      IStr := IStr+';'+#13#10;

    // Batch-SQL erzeugen und die Stücklistenartikel mit in die Rechnung zu speichern
    // mit Artikeltyp="X"

    UniQuery.close;
    UniQuery.sql.text := 'select MATCHCODE,ARTNUM,BARCODE,LAENGE,'+
                         'GROESSE,DIMENSION,GEWICHT,ME_EINHEIT,'+
                         'LANGNAME, SN_FLAG '+
                         'from ARTIKEL where REC_ID='+
                         IntToStr(STListTabART_ID.Value);
    UniQuery.open;

    IStr := Istr+
            'INSERT INTO JOURNALPOS SET '+
            'QUELLE='+IntToStr(BelegArt)+
            ',QUELLE_SUB='+IntToStr(1)+
            ',JOURNAL_ID='+IntToStr(JournalID)+
            ',ARTIKELTYP="X"'+
            ',ARTIKEL_ID='+IntToStr(STListTabART_ID.Value)+
            ',TOP_POS_ID='+IntToStr(JournalposID)+
            ',ADDR_ID='+IntToStr(AddrID)+
            ',VRENUM="'+BelegNum+'"'+
            ',MENGE="'+sqlFloatToStr(Menge * STListTabMENGE.Value)+'"'+
            ',POSITION='+IntToStr(0)+
            ',MATCHCODE="'+sqlStringToSQL(UniQuery.fieldbyname ('MATCHCODE').AsString)+'"'+
            ',ARTNUM="'+sqlStringToSQL(UniQuery.fieldbyname ('ARTNUM').AsString)+'"'+
            ',BARCODE="'+sqlStringToSQL(UniQuery.fieldbyname ('BARCODE').AsString)+'"'+
            ',LAENGE="'+sqlStringToSQL(UniQuery.fieldbyname ('LAENGE').AsString)+'"'+
            ',GROESSE="'+sqlStringToSQL(UniQuery.fieldbyname ('GROESSE').AsString)+'"'+
            ',DIMENSION="'+sqlStringToSQL(UniQuery.fieldbyname ('DIMENSION').AsString)+'"'+
            ',GEWICHT='+sqlFloatToStr(UniQuery.fieldbyname ('GEWICHT').AsFloat)+
            ',ME_EINHEIT="'+sqlStringToSQL(UniQuery.fieldbyname ('ME_EINHEIT').AsString)+'"'+
            ',BEZEICHNUNG="'+sqlStringToSQL(UniQuery.fieldbyname ('LANGNAME').AsString)+'"'+
            ',SN_FLAG="'+UniQuery.fieldbyname('SN_FLAG').AsString+'"';

    UniQuery.close;
    STListTab.Next;
  end;
  STListTab.Close;

  // Stücklistenunterartikel hinzufügen
  if Length(IStr) > 0 then
  begin
    ZBatchSql1.Script.Text := ISTr;
    try
      ProgressForm.Start;
      ZBatchSql1.Execute;
      ProgressForm.Stop;
    except
       MessageDlg(_('Fehler beim hinzufügen der Stücklisten-Unterartikel.'), mterror, [mbok], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
function TDM1.UpdateStuecklistenArtikel(JournalID, JournalposID, ArtikelID: Integer;
                                         Menge: Double): Boolean;
var 
  IStr: String;
begin
  Result := False;

  STListTab.Close;
  STListTab.ParamByName('ID').ASInteger := ArtikelID;
  STListTab.Open;

  while not STListTab.Eof do
  begin
    if Length(IStr) > 0 then 
      IStr := IStr+';'+#13#10;

    // Batch-SQL erzeugen und die Stücklistenartikel (Menge) zu aktualisieren
    IStr := Istr+
            'UPDATE JOURNALPOS SET '+
            'MENGE="'+sqlFloatToStr(Menge * STListTabMENGE.Value)+'" '+
            'WHERE JOURNAL_ID='+IntToStr(JournalID)+' '+
            'AND TOP_POS_ID='+IntToStr(JournalposID)+' '+
            'AND ARTIKEL_ID='+IntToStr(STListTabART_ID.AsInteger);
    STListTab.Next;
  end;
  STListTab.Close;

  // Stücklistenunterartikel updaten
  if Length(IStr) > 0 then
  begin
    DM1.ZBatchSql1.Script.Text := ISTr;
    try
      ProgressForm.Start;
      ZBatchSql1.Execute;
      ProgressForm.Stop;
    except
      MessageDlg(_('Fehler beim aktualisieren der Stücklisten-Unterartikel.'), mterror, [mbok], 0);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Menge von allen identischen Artikeln in JOURNALPOS ermitteln
//------------------------------------------------------------------------------
function TDM1.GetJournalPosMenge(JournalID, ArtikelID: Integer; var Menge: Double): Boolean;
var 
  JPosMenge: Double;
begin
  Result := False;
  Menge  := 0;

  DM1.Uniquery.close;
  DM1.UniQuery.Sql.Clear;
  DM1.Uniquery.sql.Add('SELECT SUM(MENGE) AS JPOSMENGE FROM JOURNALPOS');
  DM1.UniQuery.Sql.Add(' WHERE JOURNAL_ID='+Inttostr(JournalID));
  DM1.UniQuery.Sql.Add(' AND ARTIKEL_ID='+Inttostr(ArtikelID));
  DM1.UniQuery.ExecSql;
  DM1.Uniquery.Open;

  if DM1.UniQuery.RecordCount = 1 then
  begin
    Menge := DM1.UniQuery.FieldByName('JPOSMENGE').AsFloat;
    Result := True;
  end;

  DM1.UniQuery.Close;
end;

//------------------------------------------------------------------------------
// Prüfen, wie viele Seriennummern je Artikel verfügbar sind
//------------------------------------------------------------------------------
function TDM1.GetArtikelSNAnzahl (ArtikelID: Integer; Status: String): Integer;
// Status: 'LAGER','VK_LIEF','VK_RECH','RMA_IH',
//         'RMA_AH','RMA_AT','INV_DIV','EK_EDI'
begin
  Result := 0;
  try
    DM1.Uniquery.close;
    DM1.UniQuery.Sql.Clear;
    DM1.Uniquery.sql.Add('SELECT * FROM ARTIKEL_SERNUM ');
    DM1.UniQuery.Sql.Add('WHERE ARTIKEL_ID='+inttostr(ArtikelID));
    DM1.Uniquery.sql.Add('AND STATUS="'+UpperCase(Trim(Status))+'"');
    DM1.UniQuery.ExecSql;
    DM1.Uniquery.Open;
    Result := DM1.UniQuery.RecordCount;
  except
    MessageDlg(_('Die Seriennummern für Artikel '+ inttostr(ArtikelID)+#13#10+
                  'mit Status '+UpperCase(Trim(Status))+#13#10+
                  'koennen nicht gelesen werden.'), mterror, [mbok], 0);
  end;
  DM1.UniQuery.Close;
end;

//------------------------------------------------------------------------------
// Staffelpreisberechnung je VKx (VK2 bis VK5) ermitteln
// INPUT :  ArtikelID
//          Menge - angeforderte Artikelmenge
//          VKx - Standardpreis für den jeweiligen VK
// OUTPUT:  Staffelpreis
// EXAMPLE: if GetStaffelPreis(ArtikelID,Menge,VK2.Value,Staffelpreis)
//             then Preis := Staffelpreis;
//------------------------------------------------------------------------------

function TDM1.GetStaffelpreis(ArtikelID: Integer; Menge: Double; Vkx: Double; var Staffelpreis: Double): Boolean;
Var
  Menge2,
  Menge3,
  Menge4,
  Menge5,
  Rabatt2,
  Rabatt3,
  Rabatt4,
  Rabatt5: Double;
begin
  Result := False;
  try
    DM1.Uniquery.close;
    DM1.UniQuery.Sql.Clear;
    DM1.Uniquery.sql.Add('SELECT * FROM ARTIKEL_PREIS ');
    DM1.UniQuery.Sql.Add('WHERE ARTIKEL_ID='+inttostr(ArtikelID));
    DM1.Uniquery.sql.Add('AND PREIS_TYP=3 ');   // Staffelpreise
    DM1.Uniquery.sql.Add('AND ADRESS_ID=-99');  // ohne Kundenzuordnung
    DM1.UniQuery.ExecSql;
    DM1.Uniquery.Open;

    if DM1.UniQuery.RecordCount = 1 then
    begin
      Menge5 := DM1.UniQuery.FieldByName('MENGE5').AsFloat;
      Menge4 := DM1.UniQuery.FieldByName('MENGE4').AsFloat;
      Menge3 := DM1.UniQuery.FieldByName('MENGE3').AsFloat;
      Menge2 := DM1.UniQuery.FieldByName('MENGE2').AsFloat;

      Rabatt5 := DM1.UniQuery.FieldByName('PREIS5').AsFloat;
      Rabatt4 := DM1.UniQuery.FieldByName('PREIS4').AsFloat;
      Rabatt3 := DM1.UniQuery.FieldByName('PREIS3').AsFloat;
      Rabatt2 := DM1.UniQuery.FieldByName('PREIS2').AsFloat;

      if (Menge >= Menge5) and (Rabatt5 > 0) then
      begin
        Result := True;
        Staffelpreis :=  cao_round((VKx - VKx * Rabatt5 / 100)*100)/100;
      end else
      if (Menge >= Menge4) and (Rabatt4 > 0) then
      begin
        Result := True;
        Staffelpreis :=  cao_round((VKx - VKx * Rabatt4 / 100)*100)/100;
      end else
      if (Menge >= Menge3) and (Rabatt3 > 0) then
      begin
        Result := True;
        Staffelpreis :=  cao_round((VKx - VKx * Rabatt3 / 100)*100)/100;
      end else
      if (Menge >= Menge2) and (Rabatt2 > 0) then
      begin
        Result := True;
        Staffelpreis :=  cao_round((VKx - VKx * Rabatt2 / 100)*100)/100;
      end;

    end;
  except
    MessageDlg(_('Der Staffelpreis für Artikel '+ inttostr(ArtikelID)+#13#10+
                 'mit Preis_Typ = 3 '+#13#10+
                 'und Adress_ID = -99 '+#13#10+
                 'konnte nicht gelesen werden.'), mterror, [mbok], 0);
  end;
  DM1.UniQuery.Close;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TDM1.WgrTabNewRecord(DataSet: TDataSet);
begin
  WgrTabSTEUER_CODE.Value := DefMwStCD;
end;

end.

