{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Funktionen, die von den Journalen zur Ermittlung des              }
{            Klartext-Status (Stadium) verwendet werden                        }
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
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt }
{ 17.01.2002 - Glob. Variable IsNT + Betriebssystemerkennung eingebaut }
{ 10.05.2003 - Funktion GetEKBestStatus hinzugefügt }
{ 29.07.2003 - neue Zahlungsarten hinzugefügt }
{ 26.10.2003 - neue Funktion CAO_ROUND hinzugefügt, die richtig rundet ;-) }
{              ab 0,5 wird aufgerundet (Kaufmännisch) }
{ 15.03.2004 - Diverse Datumsfunktionen hinzugefügt }
{ 13.04.2004 - lexa: Validierung von Mail-Adressen }
{            - lexa: Umwandlung von beliebigem Text in gültige (Windows-) Dateinamen }
{ 08.01.2005 - GNUGetText implementiert / Mehrsprachigkeit }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Tool1;

interface

{$R-}

uses
  Windows;

function GetRechStatus(NumStatus: Byte; Quelle: Integer): String;
function GetLiefStatus(NumStatus: Byte; Print: Boolean): String;
function GetEKBestStatus(NumStatus: Byte): String;
function GetEKPRAFStatus(NumStatus: Byte): String;
function CAO_Round(Val: Double): Int64;
function CAO_Round_NK(Val: Double; NK: Integer): Double;
function tapiRequestMakeCall(lpszDestAddress, lpszAppName,
            lpszCalledParty, lpszComment: LPCSTR): DWORD; stdcall;

function Kalenderwoche(Datum: TDateTime): byte;
function FirstDayOfWeek(D: TDateTime): TDateTime; // liefert Mo der Woche
function LastDayOfWeek(D: TDateTime): TDateTime; // liefert So der Woche

function StringToFilename(StringToConvert, Prefix: String; MaxLength: integer): String;

function GetErrorStr(Error: Integer): String;
function GetIOErrorStr(Error: Integer): String;
function GetWinErrorStr(Error: Integer): String;

var
  IsNT: boolean;  // True, Wenn Windown NT, 2000 oder XP

implementation

uses
  GNUGetText, SysUtils, Math,
  OF_Var_Const;

//------------------------------------------------------------------------------
function tapiRequestMakeCall; external 'TAPI32.DLL' name 'tapiRequestMakeCall';
//------------------------------------------------------------------------------

function CAO_Round(Val: Double): Int64;
//var
//  OldPrecMode: TFPUPrecisionMode;
begin
  if Val > 0 then
    Result := Trunc(Val + 0.500000001)
  else
    Result := Trunc(Val - 0.500000001);

  //OldPrecMode := GetPrecisionMode;
  //SetPrecisionMode(pmSingle);
  {
  if val > 0 then
  result := trunc(trunc((val+0.5)*100)/100)
  else
  result :=trunc(trunc((val-0.5)*100)/100);
  }
  //setprecisionmode(oldprecmode);
end;

//------------------------------------------------------------------------------
function CAO_Round_NK(Val: Double; NK: Integer): Double;
var
  Mul,
  i: Integer;
begin
  if NK < 0 then
    NK := 0;
  if NK = 0 then
  begin
    Result := CAO_Round(Val);
  end else
  begin
    if NK = 1 then
    begin
      Mul := 10;
    end else
    begin
      Mul := 10;
      for i := 2 to NK do
        Mul := Mul * 10;
    end;
    Result := CAO_Round(Val * Mul) / Mul;
  end;
end;

//------------------------------------------------------------------------------
function GetLiefStatus(NumStatus: Byte; Print: Boolean): String;
var
  status: string[20];
begin
  if print then
  begin
    case NumStatus of
      00..19: status := _('bearbeiten');
      20..79: status := _('LS gedruckt');
      80..99: status := _('LS+RE gedruckt');
      else
        status := _('- UNBEKANNT - ');
    end;
  end
  else
  begin
    case NumStatus of
      00..19: status := _('bearbeiten');
      20..99: status := _('nicht gedruckt');
      else
        status := _('- UNBEKANNT -');
    end;
  end;
  Result := Status;
end;

//------------------------------------------------------------------------------
function GetEKBestStatus(NumStatus: Byte): String;
var
  status: string[20];
begin
  case NumStatus of
    00..19: status := _('bearbeiten');
    20    : status := _('offen');
    30    : status := _('Teillieferung');
    100   : status := _('voll geliefert');
    101   : status := _('nicht lieferbar');
    else
      status := _('- UNBEKANNT -');
  end;
  Result := Status;
end;

//------------------------------------------------------------------------------
function GetEKPRAFStatus(NumStatus: Byte): String;  //EK-Preisanfrage
var
  status: string[20];
begin
  case NumStatus of
    00    : status := _('bearbeiten');
    10    : status := _('warte auf Lieferant');
    50    : status := _('Nachbearbeitung');
    99    : status := _('Abgeschlossen');
    else
      status := _('- UNBEKANNT -');
  end;
  Result := Status;
end;

//------------------------------------------------------------------------------
function GetRechStatus(NumStatus: Byte; Quelle: Integer): String;
var
  status: string[20];
begin
  case NumStatus of
    00..09: status := _('bearbeiten');
    10..19: status := _('Liefersch. gedr.');
    20    : status := _('Vorkasse offen');
    21..23: status := _('-> o f f e n <-');
    24    : status := _('Nachnahme offen');
    25    : status := _('-> o f f e n <-');
    26    : status := _('EC-KARTE');
    27    : status := _('Kreditkarte');
    28    : status := _('PayPal');
    29    : status := _('off. Lastschrift');
    30..39: status := _('1x gemahnt');
    40..49: status := _('2x gemahnt');
    50..59: status := _('3x gemahnt');
    60..69: status := _('INKASSO ! ');
    70..79: status := _('Teilzahlung');

    80    : status := _('Vorkasse m. Sk.');
    81    : status := _('BAR mit Skonto');
    82    : status := _('Überw. m. Skonto');
    83    : status := _('Post NN m. Sk.');
    84    : status := _('UPS NN m. Sk.');
    85    : status := _('Scheck m. Skonto');
    86    : status := _('EC-Karte m. Sk.');
    87    : status := _('Kreditk. m. Sk.');
    88    : status := _('PayPal');
    89    : status := _('Lastschr. m. Sk.');

    90    : status := _('Vorkasse');
    91    : status := _('BAR erhalten');
    92    : status := _('Überweisung BANK');
    93    : status := _('Post Nachnahme');
    94    : status := _('UPS Nachnahme');
    95    : status := _('Scheck erhalten');
    96    : status := _('EC-KARTE');
    97    : status := _('Kreditkarte');
    98    : status := _('PayPal');
    99    : status := _('Lastschrift');
    110   : if Quelle = VK_RECH then
              status := _('Lastschrift')
            else
              status := _('Angewiesen');
    127   : status := _('*** STORNO ***');
    else
      status := _('-  UNBEKANNT  -');
  end;
  Result := Status;
end;

//------------------------------------------------------------------------------
{
*** Bemerkungen zur Berechnung der Wochennummer nach DIN 1355 ***
Der Montag ist der erste Tag der Woche
Eine Woche gehört zu demjenigen Kalenderjahr,
in dem 3 oder mehr Tage der Woche liegen.
Der Donnerstag einer Woche liegt immer in demjenigen Kalenderjahr,
dem die Woche zugerechnet wird.
Der 4. Januar liegt immer in der ersten Kalenderwoche.
Der 28. Dezember liegt immer in der letzten Kalenderwoche. }

//Quelle : http://www.delphi-fundgrube.de/faq04.htm

function Kalenderwoche(Datum: TDateTime): byte;
var
  AYear,
  dummy: word;
  First: TDateTime;
begin
  DecodeDate(Datum + ((8 - DayOfWeek(Datum)) mod 7) - 3, AYear, dummy, dummy);
  First := EncodeDate(AYear, 1, 1);
  Result := (trunc(Datum - First - 3 + (DayOfWeek(First) + 1) mod 7) div 7) + 1;
end;

//------------------------------------------------------------------------------
function FirstDayOfWeek(D: TDateTime): TDateTime; // liefert Mo der Woche
var
  WT: Integer;
begin
  D := Int(D);  // nur Datum ohne Zeit
  WT := DayOfWeek(D); //Wochentag ermitteln 1=So, 2=Mo ...
  if WT = 1 then
    WT := 8; // Montag bleibt 2, Sonntag = 8
  dec(WT, 2); // 0=Montag, 1= Dienstag u.s.w.

  if WT > 0 then
    D := D - WT; // Wenn akt. Tag > Montag, dann x Tage abziehen um
  // den Montag zu erhalten
  Result := D;
end;

//------------------------------------------------------------------------------
function LastDayOfWeek(D: TDateTime): TDateTime; // liefert So der Woche
var
  WT: Integer;
begin
  D := Int(D);  // nur Datum ohne Zeit
  WT := DayOfWeek(D); //Wochentag ermitteln 1=So, 2=Mo ...
  if WT = 1 then
    WT := 8; // Montag bleibt 2, Sonntag = 8
  dec(WT, 2); // 0=Montag, 1= Dienstag u.s.w.

  if WT < 6 then
    D := D + 6 - WT; // Wenn akt. Tag < Sonntag, dann x Tage
  // hinzuaddieren um den Sonntag zu erhalten
  Result := D;
end;

//------------------------------------------------------------------------------
function StringToFilename(StringToConvert, Prefix: String; MaxLength: integer): String;
{*** function by lexa for CAO-Faktura MailClient, 31.3.2004 ***}
//
// Wandelt einen beliebigen String in einen gültigen Windows-Dateinamen um
// Der Name wird aus 'StringToConvert' generiert.
//
// * Prüfkriterien für 'StringToConvert':
//   - ungültige Zeichen werden ersetzt durch DefaultReplaceChar
//     Es werden auch Sonderzeichen abgefangen, z.B. ALT+0160 auf Num-Block
//   - Punkte, Kommas, Leerzeichen usw. am Anfang und Ende werden entfernt (TrimString)
//   - Falsche Hochkommas sind in Dateinamen prinzipiell gültig, diese werden aber
//     trotzdem ersetzt durch normales Hochkomma -> ' (für Samba gut???)
//   - Der String wird bei MaxLength abgeschnitten.
//       : Ist MaxLength > MaxAllowedLength wird MaxLength auf MaxAllowedLength gesetzt
//       : Ist MaxLength ungültig (kleiner 1), wird MaxLength auf MaxAllowedLength gesetzt
//   - Ist der generierte Name ein Windows Gerätename, wird er geändert (con, aux, ...)
//
// * Rückgabewerte
//   - Ein Kennzeichner (Marker) kann optional vorangestellt werden: 'CAO-MC ' + ...
//   - OKAY: Ist der Rückgabewert <> '', wurde ein gültiger Dateiname generiert
//   - ERROR: Ist der Rückgabewert = '', konnte aus folgenden Gründen kein Name generiert werden:
//       : der String war von Anfang an leer, oder
//       : der String enthielt ausschließlich ungültige Zeichen und ist nach dem Filtern leer
//   - Die Datei-Erweiterung wird NICHT geliefert und muss außerhalb angehängt werden (.html etc.)
// -----------------------------------------------------------------------------

const
  // gültige Zeichen f. einen Dateinamen. Bei Bedarf solche nachrüsten: ô, á ... etc.
  // Euro Zeichen '€' rausgenommen, kann Probleme auf WinNT machen (??)
  // Nach Test wieder einfügen (NT mit SP5 sollte jeder haben)
  ValidChars: set of char = [
    'A'..'Z', 'a'..'z', '0'..'9',
    'Ä', 'Ö', 'Ü', 'ä', 'ö', 'ü', 'ß',
    '_', '-', '+', ',', ' ', '~', '#',
    '(', ')', '=', '[', ']', '&', '%',
    ';', '$', '!', '@', '§', '^',
    '{', '}', '.'
  ];

  // ungültige Zeichen werden durch dieses ersetzt.
  // Optional änderbar, ABER es darf NICHT in CharsToDel enthalten sein!!!
  DefaultReplaceChar = '_';

  // diese Zeichen werden am Anfang u. Ende des Strings ersatzlos gelöscht
  CharsToDel: set of char = [' ', '.', ',', ';'];

  // max. Länge des Dateinamens
  // Windows FAT : max. 255 Zeichen Dateiname inkl. Pfad
  // Windows NTFS: max. 255 Zeichen Dateiname, Pfad unbegrenzt
  MaxAllowedLength = 45; // Zeichen

  // sicherheitshalber Gerätenamen abfangen!
  InvalidFilenames: array[1..3] of String = ('nul', 'aux', 'con');

  // Optional. Wird jedem generierten Dateinamen vorangesetzt, kann auch leer sein
  // und ist dann wirkungslos. Kennzeichnet den Ursprung der Datei
var
  i: integer;

  { Sub-function }
  function StringIsConvertable(s: String): boolean;
  // ist ein konvertierbarer String vorhanden? d.h. <> '' und nach Löschen führender
  // u. abschließender Zeichen verbleibt mindestens 1 gültiges oder ungültiges Zeichen
  var
    b: boolean;
    i: integer;
  begin
    if (length(s) = 0) then                // der String ist leer
    begin
      b := false;
    end else
    begin
      b := true;
      for i := 1 to length(s) do          // ist mindestens 1 gültiges Zeichen drin?
      begin
        if not (s[i] in CharsToDel) then
          break;
      end;
      if i > length(s) then
        b := false;                      // enthält kein gültiges Zeichen
      end;
    StringIsConvertable := b;
  end;

  { Sub-function }
  function TrimString(s: String): String;
  // Punkte, Kommas, Leerzeichen usw. (CharsToDel) am Anfang u. Ende entfernen
  // Der String kann am Ende leer sein, darf aber nicht leer reinkommen!
  begin
    while (length(s) > 0) and (s[1] in CharsToDel) do          // führende CharsToDel entfernen
      s := copy(s, 2, length(s));
    while (length(s) > 0) and (s[length(s)] in CharsToDel) do // abschließende CharsToDel entfernen
      s := copy(s, 1, length(s)-1);
    TrimString := s;
  end;

  { Sub-function }
  function ReplaceWrongApostrophes(s: String): String;
  // ersetzt 'falsche' Hochkommas (stört evtl. auf Samba Shares)
  var
    i: integer;
  const
    WrongApostrophes: set of char = ['´', '`'];
    GoodApostrophe = '''';   // normales Hochkomma -> '
  begin
    for i := 1 to length(s) do if s[i] in WrongApostrophes then
      s[i] := GoodApostrophe;
    ReplaceWrongApostrophes := s;
  end;

{ Main-function }
begin
  // ist StringToConvert leer bzw. überhaupt konvertierbar?
  if not StringIsConvertable(StringToConvert) then
  begin
    StringToFilename := '';
    exit;
  end;

  // String trimmen (führende/abschließende Leerzeichen etc)
  StringToConvert := TrimString(StringToConvert);

  // ist StringToConvert nach dem Trimmen konvertierbar oder leer?
  if not StringIsConvertable(StringToConvert) then
  begin
    StringToFilename := '';
    exit;
  end;

  // MaxLength (gewünschte maximale Stringlänge) prüfen bzw. korrigieren
  if (MaxLength > MaxAllowedLength) or (MaxLength < 1) then
    MaxLength := MaxAllowedLength;

  // 'falsche' Hochkommas ersetzen
  StringToConvert := ReplaceWrongApostrophes(StringToConvert);

  // CAO_Marker vor den Betreff setzen (Dateiursprung kennzeichnen)
  // Der Marker kann leer sein und hat dann keine Funktion
  StringToConvert := Prefix + StringToConvert;

  // String auf MaxLength abschneiden
  StringToConvert := copy(StringToConvert, 1, MaxLength);

  // ungültige Dateinamen-Zeichen im verbliebenen String ersetzen
  for i := 1 to length(StringToConvert) do
  begin
    if not (char(StringToConvert[i]) in ValidChars) then
      StringToConvert[i] := DefaultReplaceChar;
  end;

  // reservierte Gerätenamen abfangen, falls Windows das mal vergißt ;-)
  // Ist nicht nötig, wenn der Marker davorsteht
  if (Prefix  = '') then
  begin
    for i := low(InvalidFilenames) to high(InvalidFilenames) do
    begin
      if lowercase(InvalidFilenames[i]) = lowercase(StringToConvert) then
        StringToConvert := DefaultReplaceChar + StringToConvert;
    end;
  end;

  // hier ist StringToConvert niemals leer !!
  StringToFilename := StringToConvert;
end; { Main - function }

//------------------------------------------------------------------------------
//     *** function by lexa for CAO-Faktura MailClient, 04.04.2004 ***
//------------------------------------------------------------------------------
function ValidateEMailAdresse(Adresse: string): boolean;

// Lockere Prüfung eines Strings anhand RFC #822 auf einige Merkmale einer
// Mailadresse mit Domänenpart oder IP-Adresse
// Quellen:
//  - RFC #733 (veraltet), RFC #822 (ersetzt RFC #733, Format von Internet-Mails
//  - RFC #822: die Adresse darf Leerzeichen enthalten,
//              wenn gequotet: "Hans Wurst"@foo.bar
//              (Relikt aus RFC #733, deshalb hier 'verboten')
//  - RFC #733: der lokale Part muss keinen Domänenpart enthalten, "ich@daheim"
//              ist nach RFC #733  gültig, jedoch nicht nach RFC #822 und
//              deshalb hier 'verboten' }
//
// Return: FALSE: der String kann keine gültige Mailadresse sein
//         TRUE : der String ist als Mailadresse zulässig
//                (blah@da.heim, foo@192.168.1.1)

const
  Punkt = '.';
  At = '@';
  ValidChars: set of char = [At, 'A'..'Z', '0'..'9', Punkt, '-', '_', '[', ']'];
var
  s: String;
  b: boolean;
  i: integer;
begin
  b := true;
  Adresse := uppercase(Adresse);

  // String hat zu wenig Zeichen oder enthält nicht '@'
  if (length(Adresse) <= 4) or (pos(At, Adresse) = 0) then
    b := false;

  // Domänenpart oder IP Adresse vorhanden?
  //(mind. ein '.' MUSS rechts vom '@' enthalten sein)
  if b then
  begin
    s := copy( Adresse,
    pos(At, Adresse) + 1,
    length(Adresse) - pos(At, Adresse) + 1);

    if (pos(Punkt, s) = 0) or (s[1] = Punkt) or (s[length(s)] = Punkt) then
      b := false;
  end;

  // ungültige Zeichen enthalten?
  if b then
  begin
    for i := 1 to length(Adresse) do
    begin
      if not (Adresse[i] in ValidChars) then
      begin
        b := false;
        break;
      end; {if}
    end; {for }
  end;

  ValidateEMailAdresse := b;
end;

//------------------------------------------------------------------------------
function GetErrorStr(Error: Integer): String;
var
  Msg: String;
begin
  Msg := '';
  if Error <32 then
  begin
    case Error of
      0: msg := _('Zuwenig Speicher, ausführbare Datei war zerstört, ' +
                  'Relokationswerte waren ungültig');
      2: msg := _('Datei wurde nicht gefunden.');
      3: msg := _('Verzeichnis wurde nicht gefunden.');
      5: msg := _('Fehler beim gemeinsamen Zugriff auf eine Datei ' +
                  'im Netz oder Fehler' +
                  ' beim Zugriff auf eine gesperrte Datei im Netz.');
      6: msg := _('Bibliothek forderte separate Datensegmente für jede Task an.');
      8: msg := _('Zuwenig Speicher, um die Anwendung zu starten.');
      10: msg := _('Falsche Windows-Version.');
      11: msg := _('Ungültige ausführbare Datei. Entweder keine ' +
                   'Windows-Anwendung oder Fehler in der EXE-Datei.');
      12: msg := _('Anwendung für ein anderes Betriebssystem.');
      13: msg := _('Anwendung für MS-DOS 4.0.');
      14: msg := _('Typ der ausführbaren Datei unbekannt.');
      15: msg := _('Versuch, eine Real-Mode-Anwendung (für eine frühere ' +
                   'Windows-Version) zu laden.');
      16: msg := _('Versuch, eine zweite Instanz einer ausführbaren Datei mit' +
                   ' mehreren Datensegmenten' +
                   ', die nicht als nur lesbar gekennzeichnet waren, zu laden.');
      19: msg := _('Versuch, eine komprimierte ausführbare Datei zu laden. ' +
                   'Die Datei muß dekomprimiert' +
                   ' werden, bevor sie geladen werden kann.');
      20: msg := _('Ungültige dynamische Linkbibliothek (DLL). Eine der DLLs,' +
                   ' die benötigt wurde, um ' +
                   'die Anwendung auszuführen, war beschädigt.');
      21: msg := _('Anwendung benötigt Windows-32-Bit-Erweiterungen.');
      else
        msg := _('Unbekannter Fehler Code :') + inttostr(Error);
    end;
  end;
  Result := Msg + #0;
end;

//------------------------------------------------------------------------------
function GetIOErrorStr (Error: Integer): String;
var
  Msg: String;
begin
  Msg := '';
  case Error of
    0: msg := _('');
    //          32 : GetErrorString (Error);
    100: msg := _('Fehler beim Lesen vom Datenträger');
    101: msg := _('Fehler beim Schreiben auf Datenträger ');
    102: msg := _('Dateivariable ist keiner Datei zugewiesen');
    103: msg := _('Datei nicht geöffnet ');
    104: msg := _('Datei wurde nicht für Leseoperationen geöffnet');
    105: msg := _('Datei wurde nicht für Schreiboperationen geöffnet');
    106: msg := _('Ungültiges numerisches Format');
    else
      msg := Format(_('E/A-Fehler Nr. %d'), [Error]);
  end;
  Result := Msg;
end;

//------------------------------------------------------------------------------
function GetWinErrorStr(Error: Integer): String;
var
  Msg: String;
begin
  case Error of
    0: msg := '';
    1: msg := _('Unzulässige Funktion.');
    2: msg := _('Die angegebene Datei wurde nicht gefunden.');
    3: msg := _('Der angegebene Pfad wurde nicht gefunden.');
    4: msg := _('Die Datei konnte nicht geöffnet werden.');
    5: msg := _('Zugriff wurde verweigert.');
    6: msg := _('Die Zugriffsnummer ist nicht definiert.');
    7: msg := _('Die Speichersteuerblöcke wurden zerstört.');
    8: msg := _('Es ist nicht genügend Speicher verfügbar, um diesen Befehl auszuführen.');
    9: msg := _('Die Adresse des Speichersteuerblocks ist ungültig.');
    10: msg := _('Die Umgebung stimmt nicht.');
    11: msg := _('Es wurde versucht, ein Programm im falschen Format zu laden.');
    12: msg := _('Der Zugriffscode ist ungültig.');
    13: msg := _('Die Daten sind ungültig.');
    14: msg := _('Für diesen Vorgang ist nicht genügend Arbeitsspeicher verfügbar.');
    15: msg := _('Das angegebene Laufwerk wurde nicht gefunden.');
    16: msg := _('Das Verzeichnis kann nicht entfernt werden.');
    17: msg := _('Die Datei kann auf kein anderes Laufwerk verschoben werden.');
    18: msg := _('Es sind keine weiteren Dateien vorhanden.');
    19: msg := _('Der Datenträger ist schreibgeschützt.');
    20: msg := _('Das angegebene Gerät wurde nicht gefunden.');
    21: msg := _('Das Gerät ist nicht bereit.');
    22: msg := _('Das Gerät erkennt den Befehl nicht.');
    23: msg := _('Datenfehler (CRC-Prüfung)');
    24: msg := _('Das Programm hat einen Befehl aufgerufen, aber die Befehlslänge ist falsch.');
    25: msg := _('Das Laufwerk kann auf dem Datenträger einen bestimmten Bereich oder eine bestimmte Spur nicht finden.');
    26: msg := _('Auf die angegebene Festplatte oder Diskette kann nicht zugegriffen werden.');
    27: msg := _('Das Laufwerk kann den angeforderten Sektor nicht finden.');
    28: msg := _('Der Drucker hat kein Papier mehr.');
    29: msg := _('Auf das angegebene Gerät kann nicht geschrieben werden.');
    30: msg := _('Vom angegebenen Gerät kann nicht gelesen werden.');
    31: msg := _('Ein an das System angeschlossenes Gerät funktioniert nicht.');
    32: msg := _('Der Prozess kann nicht auf die Datei zugreifen, da sie von einem anderen Prozess verwendet wird.');
    33: msg := _('Der Prozess kann nicht auf die Datei zugreifen, da ein anderer Prozess einen Teil der Datei gesperrt hat.');
    34: msg := _('Im Laufwerk befindet sich eine falsche Diskette. Legen Sie %2 (Datenträgernummer: %3) in das Laufwerk %1 ein.');
    36: msg := _('Zu viele Dateien zur gemeinsamen Verwendung geöffnet.');
    38: msg := _('Ende der Datei (EOF) erreicht.');
    39: msg := _('Der Datenträger ist voll.');
    50: msg := _('Die Netzwerkanforderung wird nicht unterstützt.');
    51: msg := _('Der Remote-Computer ist nicht verfügbar.');
    52: msg := _('Ein gleicher Name ist bereits im Netzwerk vorhanden.');
    53: msg := _('Der Netzwerkpfad wurde nicht gefunden.');
    54: msg := _('Das Netzwerk ist ausgelastet.');
    55: msg := _('Die angegebene Netzwerkressource oder das Gerät ist nicht mehr verfügbar.');
    56: msg := _('Das Netzwerk-BIOS-Befehlslimit wurde erreicht.');
    57: msg := _('Es ist ein Hardwarefehler bei einem Netzwerkadapter aufgetreten.');
    58: msg := _('Der angegebene Server kann den angeforderten Vorgang nicht ausführen.');
    59: msg := _('Ein unerwarteter Netzwerkfehler ist aufgetreten.');
    60: msg := _('Der Remote-Adapter ist inkompatibel.');
    61: msg := _('Die Druckerwarteschlange ist voll.');
    62: msg := _('Auf dem Server ist nicht genügend Speicher für den Druckauftrag verfügbar.');
    63: msg := _('Ihr Druckauftrag wurde gelöscht.');
    64: msg := _('Der angegebene Netzwerkname ist nicht mehr verfügbar.');
    65: msg := _('Der Netzwerkzugriff wurde verweigert.');
    66: msg := _('Der Typ der Netzwerkressource ist falsch.');
    67: msg := _('Der Netzwerkname wurde nicht gefunden.');
    68: msg := _('Die Namensbegrenzung der lokalen Netzwerkadapterkarte wurde überschritten.');
    69: msg := _('Das Netzwerk-BIOS-Sitzungslimit wurde erreicht.');
    70: msg := _('Der Remote-Server wurde angehalten oder wird gerade gestartet.');
    71: msg := _('Es können keine weiteren Verbindungen zum Remote-Computer hergestellt werden, da die maximale Anzahl der Clients mit diesem verbunden ist.');
    72: msg := _('Der angegebene Drucker oder das angegebene Datenträgergerät wurde angehalten.');
    80: msg := _('Die Datei ist vorhanden.');
    82: msg := _('Das Verzeichnis oder die Datei konnte nicht erstellt werden.');
    83: msg := _('Fehler bei INT 24');
    84: msg := _('Zum Verarbeiten dieser Anforderung ist kein Speicher verfügbar.');
    85: msg := _('Der lokale Gerätename wird bereits verwendet.');
    86: msg := _('Das angegebene Netzwerkkennwort ist falsch.');
    87: msg := _('Der Parameter stimmt nicht.');
    88: msg := _('Es ist ein Schreibfehler im Netzwerk aufgetreten.');
    89: msg := _('Das System kann derzeit keinen weiteren Prozess starten.');
    100: msg := _('Es kann keine weitere Systemsemaphore erstellt werden.');
    101: msg := _('Die exklusive Semaphore gehört einem anderen Prozess.');
    102: msg := _('Die Semaphore ist gesetzt und kann nicht geschlossen werden.');
    103: msg := _('Die Semaphore kann nicht erneut gesetzt werden.');
    104: msg := _('Derzeit einer Unterbrechung (Interrupt) kann keine exklusive Semaphore angefordert werden.');
    105: msg := _('Das bisher bestehende Besitzrecht dieser Semaphore ist beendet.');
    106: msg := _('Legen Sie die Diskette in Laufwerk %1 ein.');
    107: msg := _('Das Programm wurde abgebrochen, da keine andere Diskette eingelegt wurde.');
    108: msg := _('Der Datenträger wird von einem anderen Prozess verwendet oder gesperrt.');
    109: msg := _('Die Pipe wurde beendet.');
    110: msg := _('Das angegebene Gerät oder die angegebene Datei konnte nicht geöffnet werden.');
    111: msg := _('Der Dateiname ist zu lang.');
    112: msg := _('Es ist nicht genügend Speicherplatz auf dem Datenträger verfügbar.');
    113: msg := _('Es sind keine weiteren internen Dateibezeichner verfügbar.');
    114: msg := _('Der interne Dateibezeichner des Ziels stimmt nicht.');
    117: msg := _('Der von der Anwendung ausgeführte IOCTL-Aufruf ist falsch.');
    118: msg := _('Der Parameter der Option zur Überprüfung von Schreibvorgängen stimmt nicht.');
    119: msg := _('Das System unterstützt den angeforderten Befehl nicht.');
    120: msg := _('Die Funktion ist nur im Win32-Modus gültig.');
    121: msg := _('Das Zeitlimit für die Semaphore wurde erreicht.');
    122: msg := _('Der an einen Systemaufruf übergebene Datenbereich ist zu klein.');
    123: msg := _('Die Syntax für den Dateinamen, Verzeichnisnamen oder die Datenträgerbezeichnung ist falsch.');
    124: msg := _('Die Ebene des Systemaufrufs ist falsch.');
    125: msg := _('Der Datenträger hat keine Datenträgerbezeichnung.');
    126: msg := _('Das angegebene Modul wurde nicht gefunden.');
    127: msg := _('Die angegebene Prozedur wurde nicht gefunden.');
    128: msg := _('Es sind keine Child-Prozesse vorhanden, auf die gewartet werden muss.');
    129: msg := _('Die Anwendung %1 kann nicht im Win32-Modus ausgeführt werden.');
    130: msg := _('Versuch, eine Dateizugriffnummer zu einer offenen Datenträgerpartition für einen anderen Vorgang als Rohdaten-E/A auf Datenträger zu benutzen.');
    131: msg := _('Es wurde versucht, den Dateizeiger vor den Anfang der Datei zu bewegen.');
    132: msg := _('Der Dateizeiger kann nicht auf dem angegebenen Gerät oder Laufwerk gesetzt werden.');
    133: msg := _('Ein JOIN- oder SUBST-Befehl kann nicht für ein Laufwerk verwendet werden, das bereits mit JOIN zugeordnete Laufwerke enthält.');
    134: msg := _('Es wurde versucht, einen JOIN- oder SUBST-Befehl für ein Laufwerk zu verwenden, das bereits mit JOIN zugeordnet wurde.');
    135: msg := _('Es wurde versucht, einen JOIN- oder SUBST-Befehl für ein Laufwerk zu verwenden, das bereits mit SUBST zugeordnet wurde.');
    136: msg := _('Das System hat versucht, eine JOIN-Zuordnung eines Laufwerks zu löschen, das nicht mit JOIN zugeordnet wurde.');
    137: msg := _('Das System hat versucht, eine SUBST-Zuordnung eines Laufwerks zu löschen, das nicht mit SUBST zugeordnet wurde.');
    138: msg := _('Das System hat versucht, einem Verzeichnis, das sich auf einem mit JOIN zugeordneten Laufwerk befindet, ein Laufwerk mit SUBST zuzuordnen.');
    139: msg := _('Das System hat versucht, einem Verzeichnis, das sich auf einem mit SUBST zugeordneten Laufwerk befindet, ein Laufwerk mit SUBST zuzuordnen.');
    140: msg := _('Das System hat versucht, einem Verzeichnis, das sich auf einem mit SUBST zugeordneten Laufwerk befindet, ein Laufwerk mit JOIN zuzuordnen.');
    141: msg := _('Das System hat versucht, einem Verzeichnis, das sich auf einem mit JOIN zugeordneten Laufwerk befindet, ein Laufwerk mit SUBST zuzuordnen.');
    142: msg := _('Das System kann derzeit keine Zuordnung mit JOIN oder SUBST ausführen.');
    143: msg := _('Das System kann einem Verzeichnis auf dem gleichen Laufwerk kein Laufwerk mit JOIN oder SUBST zuordnen.');
    144: msg := _('Das Verzeichnis ist kein Unterverzeichnis des Stammverzeichnisses.');
    145: msg := _('Das Verzeichnis ist nicht leer.');
    146: msg := _('Der angegebene Pfad wird in einer SUBST-Zuordnung verwendet.');
    147: msg := _('Zum Ausführen dieses Befehls sind nicht genügend Ressourcen verfügbar.');
    148: msg := _('Der angegebene Pfad kann derzeit nicht verwendet werden.');
    149: msg := _('Es wurde versucht, ein Laufwerk mit JOIN oder SUBST zuzuordnen, auf dem sich ein Verzeichnis befindet, dass das Ziel einer früheren SUBST-Zuordnung ist.');
    150: msg := _('Es wurden keine Informationen zur System-Ablaufverfolgung in der Datei CONFIG.SYS angegeben, oder die Ablaufverfolgung ist nicht erlaubt.');
    151: msg := _('Die Anzahl der angegebenen Semaphore-Ereignisse für DosMuxSemWait ist falsch.');
    152: msg := _('DosMuxSemWait wurde nicht ausgeführt. Es sind bereits zu viele Semaphoren gesetzt.');
    153: msg := _('Die DosMuxSemWait-Liste ist fehlerhaft.');
    154: msg := _('Die angegebene Datenträgerbezeichnung ist länger als das Zieldateisystem zuläßt.');
    155: msg := _('Es kann kein weiterer Thread erstellt werden.');
    156: msg := _('Der Empfängerprozess hat das Signal abgelehnt.');
    157: msg := _('Das Segment ist bereits gelöscht und kann nicht gesperrt werden.');
    158: msg := _('Die Sperre des Segments ist bereits aufgehoben.');
    159: msg := _('Die Adresse der Thread-ID ist falsch.');
    160: msg := _('Die an DosExecPgm übergebene Argumentenzeichenfolge ist falsch.');
    161: msg := _('Die Pfadangabe ist ungültig.');
    162: msg := _('Ein Signal wartet bereits.');
    164: msg := _('Es können keine weiteren Threads im System erstellt werden.');
    167: msg := _('Ein Teil einer Datei konnte nicht gesperrt werden.');
    170: msg := _('Die angeforderte Ressource wird bereits verwendet.');
    173: msg := _('Es stand keine Sperranforderung für den angegebenen Abbruchbereich aus.');
    174: msg := _('Das Dateisystem unterstützt keine atomaren Änderungen zum Sperrentyp.');
    180: msg := _('Das System hat eine falsche Segmentnummer gefunden.');
    182: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    183: msg := _('Eine bereits vorhandene Datei kann nicht neu erstellt werden.');
    186: msg := _('Das übergebene Attribut ist falsch.');
    187: msg := _('Der angegebene System-Semaphorenname wurde nicht gefunden.');
    188: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    189: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    190: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    191: msg := _('%1 kann im Wind32-Modus nicht ausgeführt werden.');
    192: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    193: msg := _('%1 ist keine zulässige Win32-Anwendung.');
    194: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    195: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    196: msg := _('Das Betriebssystem kann diese Anwendung nicht ausführen.');
    197: msg := _('Das Betriebssystem ist momentan nicht konfiguriert, um diese Anwendung auszuführen.');
    198: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    199: msg := _('Das Betriebssystem kann diese Anwendung nicht ausführen.');
    200: msg := _('Das Codesegment muss kleiner als 64 KB sein.');
    201: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    202: msg := _('Das Betriebssystem kann %1 nicht ausführen.');
    203: msg := _('Das System konnte die angegebene Umgebungsoption nicht finden.');
    205: msg := _('Kein Prozess in der Befehlsteilstruktur hat eine Signalbehandlungsroutine.');
    206: msg := _('Der Dateiname oder die Erweiterung ist zu lang.');
    207: msg := _('Der Ring 2-Stapel wird bereits verwendet.');
    208: msg := _('Die Platzhalterzeichen für Dateinamen (* oder ?) wurden falsch eingegeben, oder es wurden zu viele Platzhalterzeichen angegeben.');
    209: msg := _('Das zu verzögernde Signal ist falsch.');
    210: msg := _('Die Signalbehandlungsroutine konnte nicht eingerichtet werden.');
    212: msg := _('Das Segment ist gesperrt und kann nicht neu zugeordnet werden.');
    214: msg := _('An dieses Programm oder Dynamic-Link-Modul sind zu viele Dynamic-Link-Module angefügt.');
    215: msg := _('Aufrufe an LoadModule können nicht verschachtelt werden.');
    230: msg := _('Der Pipe-Zustand stimmt nicht.');
    231: msg := _('Alle Pipe-Exemplare sind ausgelastet.');
    232: msg := _('Pipe wird gerade geschlossen.');
    233: msg := _('Kein Prozess ist am anderen Ende der Pipe.');
    234: msg := _('Es sind mehr Daten verfügbar.');
    240: msg := _('Die Sitzung wurde abgebrochen.');
    254: msg := _('Der angegebene Name des erweiterten Attributs war unzulässig.');
    255: msg := _('Die erweiterten Attribute sind inkonsistent.');
  end;
  Result := Msg;
end;

//------------------------------------------------------------------------------
// Unit-Init
//------------------------------------------------------------------------------
var JvVerInf: TOSVersionInfo;
begin
  IsNT := false;
  JvVerInf.dwOSVersionInfoSize := sizeof(JvVerInf);
  if (GetVersionEx(JvVerInf)) then
    IsNT := JvVerInf.dwPlatformId = VER_PLATFORM_WIN32_NT;
end.
//------------------------------------------------------------------------------

{

// Quelle : http://www.delphi-fundgrube.de/files/feiertg.txt

const
Feiertage : array [1..19] of string[25] =
('Neujahr','Maifeiertag','Tag der deutschen Einheit','Allerheiligen',
'Totensonntag','Volkstrauertag','1. Weihnachtstag','2. Weihnachtstag',
'Karfreitag','Ostersonntag','Ostermontag','Christi Himmelfahrt',
'Pfingstsonntag','Pfingstmontag','Fronleichnam','Heilige 3 Könige',
'Mariä Himmelfahrt','Reformationstag','Buß- und Bettag');
Sondertage : array [1..24] of string[25] =
('Mariä Lichtmeß','Valentinstag','Weiberfastnacht','Rosenmontag','Fastnacht',
'Aschermittwoch','Mariä Verkündigung','Palmsonntag','Gründonnerstag','Muttertag',
'Peter und Paul','Mariä Geburt','Erntedankfest','Mariä Empfängnis','Silvester',
'1. Advent','2. Advent','3. Advent','4. Advent','Heiligabend','Frühlingsanfang',
'Sommmeranfang','Herbstanfang','Winteranfang');

var
Feiertag      : array [1..365] of ShortInt;

function TagImJahr(Datum:TDateTime):word;
var T,M,J  : word;
Erster : TDateTime;
begin
try
DecodeDate(Datum,J,M,T);
Erster:=EncodeDate(J,1,1);
Result:=trunc(Datum-Erster+1);
except
Result:=0;
end;
end;

procedure FeiertageBerechnen(Y:word);
var D,dw,OM,aw : word;
Dat        : TDateTime;
Ostern     : TDateTime;
Weihnacht  : TDateTime;

function OsterSonntag(Y:word):TDateTime;
var a,b,c,d,e,tag,monat : integer;
begin
a:=y MOD 19 ;
b:=y MOD 4;
c:=y MOD 7;
d:=(19*a+24) MOD 30;
e:=(2*b+4*c+6*d+5) MOD 7;
Tag:=22+d+e;
monat:=3;
IF Tag>31 then begin
tag:=d+e-9;
monat:=4;
end;
IF (tag=26) AND (monat=4) then
tag:=19;
IF (tag=25) AND (monat=4) AND (d=28) AND (e=6) AND (a>10) then
tag:=18;
try
Result:= EncodeDate(y,monat,tag);
except
Result:=0;
end;
end;

begin
for D:=1 to 365 do
Feiertag[D]:=0;
Ostern:=OsterSonntag(Y);
try
DecodeDate(Ostern,Y,OM,D);
except
OM:=4;
end;
try
Weihnacht:=EncodeDate(Y,12,25);
if (DayOfWeek(Weihnacht)-1)=0 then
dw:=7
else
dw:=DayOfWeek(Weihnacht)-1;
except
Weihnacht:=-1;
dw:=0;
end;
//Mariä Lichtmeß                    Sondertage
Dat:=Encodedate(Y,2,2);
Feiertag[TagImJahr(Dat)]:=-1;
//Valentinstag
Dat:=Encodedate(Y,2,14);
Feiertag[TagImJahr(Dat)]:=-2;
//Weiberfastnacht
Dat:=Ostern-45;
while DayOfWeek(Dat)<>2 do
Dat:=Dat-1;
Feiertag[TagImJahr(Dat)-4]:=-3;
//Rosenmontag
Feiertag[TagImJahr(Dat)]:=-4;
//Fastnacht
Feiertag[TagImJahr(Dat)+1]:=-5;
//Aschermittwoch
Feiertag[TagImJahr(Dat)+2]:=-6;
//Mariä Verkündigung
Dat:=Encodedate(Y,3,25);
Feiertag[TagImJahr(Dat)]:=-7;
//Palmsonntag
Feiertag[TagImJahr(Ostern)-7]:=-8;
//Gründonnerstag
Feiertag[TagImJahr(Ostern)-3]:=-9;
//Muttertag
Dat:=EncodeDate(y,4,30);
aw:=DayOfWeek(Dat)-1;
Dat:=Dat-aw+14;
if Dat=(Ostern+49) then
Dat:=Dat-7;
Feiertag[TagImJahr(Dat)]:=-10;
{Peter und Paul
Dat:=Encodedate(Y,6,29);
Feiertag[TagImJahr(Dat)]:=-11;
//Mariä Geburt
Dat:=Encodedate(Y,9,8);
Feiertag[TagImJahr(Dat)]:=-12;
//Erntedankfest
Dat:=Encodedate(Y,10,1);
while DayOfWeek(Dat)<>1 do
Dat:=Dat+1;
Feiertag[TagImJahr(Dat)]:=-13;
//Mariä Empfängnis
Dat:=Encodedate(Y,12,8);
Feiertag[TagImJahr(Dat)]:=-14;
//Silvester
Dat:=Encodedate(Y,12,31);
Feiertag[TagImJahr(Dat)]:=-15;
//1. Advent
Dat:=Weihnacht;
while DayOfWeek(Dat)<>1 do
Dat:=Dat-1;
Feiertag[TagImJahr(Dat)-21]:=-16;
//2. Advent
Feiertag[TagImJahr(Dat)-14]:=-17;
//3. Advent
Feiertag[TagImJahr(Dat)-7]:=-18;
//4. Advent
Feiertag[TagImJahr(Dat)]:=-19;
//Heiligabend
Feiertag[TagImJahr(Weihnacht)-1]:=-20;
//Frühlingsanfang
Dat:=Encodedate(Y,3,21);
Feiertag[TagImJahr(Dat)]:=-21;
//Sommmeranfang
Dat:=Encodedate(Y,6,21);
Feiertag[TagImJahr(Dat)]:=-22;
//Herbstanfang
Dat:=Encodedate(Y,9,23);
Feiertag[TagImJahr(Dat)]:=-23;
//Winteranfang
Dat:=Encodedate(Y,12,22);
Feiertag[TagImJahr(Dat)]:=-24;
//Neujahr                         Feiertage
Feiertag[1]:=1;
//Maifeiertag
Dat:=Encodedate(Y,5,1);
Feiertag[TagImJahr(Dat)]:=2;
//Tag der deutschen Einheit
Dat:=Encodedate(Y,10,3);
Feiertag[TagImJahr(Dat)]:=3;
//Allerheiligen
Dat:=Encodedate(Y,11,1);
Feiertag[TagImJahr(Dat)]:=4;
//Totensonntag
if Weihnacht>=0 then
Feiertag[TagImJahr(Weihnacht-dw-28)]:=5;
//Buß- und Bettag
if Config.Land=12 then
Feiertag[TagImJahr(Weihnacht-dw-32)]:=19;
//Volkstrauertag
if Weihnacht>=0 then
Feiertag[TagImJahr(Weihnacht-dw-35)]:=6;
//1. Weihnachtstag
if Weihnacht>=0 then
Feiertag[TagImJahr(Weihnacht)]:=7;
//2. Weihnachtstag
if Weihnacht>=0 then
Feiertag[TagImJahr(Weihnacht)+1]:=8;
//Karfreitag
Feiertag[TagImJahr(Ostern)-2]:=9;
//Ostersonntag
Feiertag[TagImJahr(Ostern)]:=10;
//Ostermontag
Feiertag[TagImJahr(Ostern)+1]:=11;
//Christi Himmelfahrt
Feiertag[TagImJahr(Ostern)+39]:=12;
//Pfingstsonntag
Feiertag[TagImJahr(Ostern)+49]:=13;
//Pfingstmontag
Feiertag[TagImJahr(Ostern)+50]:=14;
//Fronleichnam
if (Config.Land<2) or ((Config.Land>=9) and (Config.Land<=12)) or (Config.Land=15) then
Feiertag[TagImJahr(Ostern)+60]:=15;
//Heilige 3 Könige
if (Config.Land=0) or (Config.Land=1) or (Config.Land=13) then
Feiertag[6]:=16;
//Mariä Himmelfahrt
if (Config.Land=1) or (Config.Land=11) then begin
Dat:=Encodedate(Y,8,15);
Feiertag[TagImJahr(Dat)]:=17;
end;
//Reformationstag
if (Config.Land=3) or (Config.Land=7) or (Config.Land=12) or (Config.Land=13) or (Config.Land=15) then begin
Dat:=Encodedate(Y,10,31);
Feiertag[TagImJahr(Dat)]:=18;
end;
end;

Aufruf :

FeiertageBerechnen(Jahr);

Danach enthält die Variable Feiertag Werte kleiner 0 für Sondertage und Werte größer 0 für Feiertage.

z.B.:

FT:=Feiertag[TagImJahr(Date)];
if FT>0 then
Label1.Caption:=Feiertage[FT];
if FT<0 then
Label1.Caption:=Sondertage[abs(FT)];

Die Variable Config.Land kann folgende Werte annehmen:

0 : Baden-Württemberg
1 : Bayern
2 : Berlin
3 : Brandenburg
4 : Bremen
5 : Hanmburg
6 : Hessen
7 : Mecklenburg-Vorpommern
8 : Niedersachsen
9 : Nordrhein-Westfalen
10: Rheinland-Pfalz
11: Saarland
12: Sachsen
13: Sachsen-Anhalt
14: Schleswig-Holstein
15: Thüringen

}

