{***************************************************************
 *
 * Unit Name: DTAUS V1.1 14.09.2001
 * Zweck    : Komponente für beleglosen DTA-Verkehr
 * Autor    : Robert Wachtel
 *            rwachtel@gmx.de
 *            www.mpscologne.de
 * History  : 1.0 Januar 2000
 *              erste veröffentlichte Version
 *              (praktisch ohne Dokumentation)
 *            1.1 14.09.2001
 *            Überarbeitete Version
 *            Neue Property: Nachsatzaktualisierung: boolean
 *              true  : (Default) Nachsatzaktualisierung wird bei jedem zugefügten/geänderten
 *                      Datensatz durchgeführt
 *              false : Nachsatzaktualisierung wird bis zur Speicherung (SaveToDisk oder SaveToStream)
 *                      unterdrückt
 *              Bei Setzen auf true wird Nachsatzaktualisierung sofort durchgeführt
 *            Bug-Fix: u.U. konnte eine Endlosschleife bei Anlegen eines neuen
 *              Erweiterungsteils entstehen  
 *
 *   Geschrieben und getestet mit Delphi 3.02
 *
 *   Sollte mit jeder Delphi Version 3.x und höher funktionieren
 *
 * Zweck:
 * ======
 *
 *  TmpsDTAUS ist eine Komponente zur Erstellung von beleglosen
 *  DTA-Disketten für den Datenträgeraustausch mit der Bank
 *
 * Anwendung:
 * ==========
 *
 * Eigenschaften:
 *
 *  published
 *
 *    Ausfuehrungstermin (TDateTime)
 *      Ausführungstermin (ach was ;-)
 *    BLZ (integer)
 *      Bankleitzahl des Auftraggebers
 *    Dateiname (string)
 *      Dateiname der DTA-Datei
 *    Erstellungsdatum (TDateTime)
 *      Erstellungsdatum (so so ;-)
 *    Kennzeichen (string)
 *      1. Stelle:
 *        L - Lastschriften
 *        G - Gutschriften
 *      2. Stelle:
 *        K - Kundendiskette
 *        B - Bankdiskette
 *    Kontonummer (string)
 *      Kontonummer des Auftraggebers
 *    Kundendiskette (boolean)
 *      Kunden- oder Bankdiskette
 *    Kundenname (string)
 *      Name des Auftraggebers
 *    Lastschriften (boolean)
 *      Last- oder Gutschriften
 *    Name (string)
 *      Name der Komponente
 *    Referenznummer (string)
 *      interne Referenznummer
 *    Tag (integer)
 *      das übliche Tag ;-)
 *    Waehrung
 *      DM oder Euro
 *    Daten
 *
 *  public
 *
 *    Datensaetze (integer)
 *      Anzahl der Datensaetze
 *    SummeDM (currency)
 *      Summe aller DM-Beträge
 *    SummeEuro (currency)
 *      Summe aller Euro-Beträge
 *    SummeKontonummern (extended)
 *      Summe aller Kontonummern
 *    SummeBLZ (extended)
 *      Summe aller BLZ
 *
 *    (diese Werte werden für den DTA-Begleitzettel benötigt)
 *
 *  with DTAUS1 do
 *    begin
 *    Clear;
 *    Append;
 *    AktuellerDatensatz.BLZ := 123456789;
 *    AktuellerDatensatz.KontoNummer := '1234567890';
 *    AktuellerDatensatz.Betrag := 100;
 *    AktuellerDatensatz.Zahlungsart := LS_Einzug;
 *    AktuellerDatensatz.InterneNummer := 0;
 *    AktuellerDatensatz.Name := 'TESTNAME';
 *    AktuellerDatensatz.Verwendungszweck := 'TESTZWECK';
 *    Post;
 *  end;
 *  DTAUS1.SaveToDisk;
 *
 *  Installation:
 *  =============
 *
 *    In der Menüzeile wählen Sie "Komponente" und dort
 *    "Komponente installieren...".
 *    Dann suchen Sie diese Unit und drücken OK.
 *
 *    Vorsicht: So weit ich weiss, ist in Delphi 5 DSGNINTF.DCU nicht
 *              mehr enthalten. Bitte beachten Sie zur weiteren
 *              Vorgehensweise die Hinweise in der Datei README.TXT
 *              im Delphi 5 Verzeichnis.
 *
 *  Verschiedenes:
 *  ==============
 *
 *    Diese Komponente unterliegt dem Urheberrechtsschutz und
 *    ist daher (c) copyrighted 1999-2000 by Robby Wachtel.
 *
 *    Diese Komponente ist uneingeschränkte PublicDomain
 *    ausschließlich für private Nutzung!
 *    ===================================
 *
 *    Für jegliche kommerzielle Verwendung ist diese
 *    Komponente uneingeschränkte ShareWare, d.h. sie darf in
 *    kommerziellen Programmen *nur* nach Zahlung der
 *    Registrierungsgebühr (s. nächster Absatz) genutzt werden.
 *
 *    Wenn Sie diese Komponente nützlich finden und/oder diese
 *    Komponenten kommerziell nutzen wollen (also in Programmen,
 *    die Sie betrieblich und/oder beruflich entwickeln und/oder
 *    nutzen), senden Sie bitte einen Scheck über 10 Euro (oder
 *    US-$ 10) an folgende Adresse:
 *
 *    Robert Wachtel
 *    Kyffhäuserstr. 23
 *    D-50674 Köln
 *    DEUTSCHLAND
 *
 *    (Kontoverbindung auf Anfrage)
 *
 *    Sie erhalten dann das Recht, diese Komponente in kommerziellen
 *    Programmen jeder Art einzusetzen (also auch in Programmen,
 *    die Sie weiter veräußern). Dies wird Ihnen dann auch nochmal
 *    per E-Mail bestätigt.
 *
 *    Gleichzeitig erhalten Sie nach Registrierung neue und/oder
 *    fehlerbereinigte und/oder verbesserte Versionen dieser
 *    Komponente automatisch per E-Mail zugesandt.
 *
 *    Haben Sie Probleme oder Änderungsvorschläge, so stehe ich
 *    Ihnen gerne zur Verfügung. Ändern Sie diese Software
 *    oder Teile davon, so bitte ich um Übersendung einer
 *    Kopie dieser Änderungen.
 *
 *    Diese Software wird zur Verfügung gestellt, "wie sie ist", ohne
 *    Garantien für die Funktionsfähigkeit oder korrekte Funktion.
 *    Der Autor kann nicht für Datenverlust, Beschädigung, Probleme usw.
 *    aus der Verwendung dieser Software haftbar gemacht werden.
 *    (Bemerkung: Diese Einschränkungen sind notwendig, da beim heutigen
 *                Stand der technischen Entwicklungen eine 100%ige
 *                Fehlerfreiheit von Software einfach nicht *garantiert*
 *                werden kann - alleine schon aus Gründen der
 *                Vielfältigkeit der sich auf dem Markt befindlichen
 *                Prozessoren, Mainboards, Betriebssystemen usw. und deren
 *                Zusammenstellungen. Durch die vollständige
 *                Verfügbarkeit des Quellcodes (OpenSource) ist das
 *                Risiko allerdings einschätzbar und die Fehlersuche und
 *                -behebung schnell und simpel durchführbar.)
 *
 *    Sie können diese Software in jeder Form von Entwicklung einsetzen
 *    und sie auch beliebig weitergeben, unter folgenden Voraussetzungen:
 *
 *    1. Die Herkunft dieser Software muß unmißverständlich dargestellt
 *       werden. Sie dürfen nicht behaupten, daß Sie das Original dieser
 *       Software geschrieben haben. Wenn Sie diese Software in irgend
 *       einem Produkt einsetzen, setzen Sie bitte in einer Info-Box
 *       oder in der Dokumentation einen Hinweis in der Form
 *            Teile (c) 1999-2001 Robert Wachtel
 *
 *    2. Sie dürfen kein Einkommen aus der Distribution dieses
 *       Quellcodes an Dritte erzielen. Wenn Sie dieses Produkt
 *       kommerziell nutzen, dürfen Sie den Quellcode dieser
 *       Software nicht besonders in Rechnung stellen.
 *
 *    3. Diese Bemerkungen dürfen nicht aus diesem Quellcode
 *       entfernt werden.
 *
 *    4. Wenn Sie diese Komponente z.B. auf einer Magazin-CD oder
 *       ShareWare-Sammlung weitergeben, senden Sie mir eine Kopie
 *       des Mediums zu.
 *
 *  Credits: (da fällt mir kein passendes deutsches Wort zu ein ;-)
 *  ========
 *
 *  Dank an
 *    Bea für all die Liebe
 *    Simon Reinhardt für seine DelphiFundgrube (http://www.pics-software.de/faq.htm)
 *    Lloyd Linklater für sein "Delphi Notes Help File"
 *    Alle in news://de.comp.lang.delphi.*
 *
 *****************************************************************}

//  15.10.09-ud.
//    Registername geändert CAO-Faktura -> Open-Faktura


unit mpsDTAUS;

interface

uses SysUtils,
  classes;

// Konstantendeklarationen

{(*}

const

  _DTA_Dateiname                        = 'DTAUS0';

  _DTA_EmptySpace                       = #$20;

  _DTA_MinBLZ                           = 10000000;
  _DTA_MaxBLZ                           = 87096214;

  _DTA_MinErweiterungsteile             = 0;
  _DTA_MaxErweiterungsteile             = 15;

  _DTA_MinKonstanterTeil                = 187;
  _DTA_MaxKonstanterTeil                = 622;
  _DTA_ErweiterungsTeil                 = 29;

  _DTA_EmptyNum                         = '0';

  _DTA_A_1_Satzlaenge                   = '0128';
  _DTA_A_2_Satzart                      = 'A';
  _DTA_A_3_Kennzeichen_Gutschrift       = 'G';
  _DTA_A_3_Kennzeichen_Lastschrift      = 'L';
  _DTA_A_3_Kennzeichen_Kundendiskette   = 'K';
  _DTA_A_3_Kennzeichen_Bankdiskette     = 'B';
  _DTA_A_5_Reserve                      = '00000000';
  _DTA_A_8_Reserve                      = '    ';
  _DTA_A_11a_Reserve                    = '               ';
  _DTA_A_11c_Reserve                    = '                        ';
  _DTA_A_12_DM                          = #$20;
  _DTA_A_12_Euro                        = '1';

  _DTA_C_1_Satzlaenge_Konstant          = '0187';
  _DTA_C_2_Satzart                      = 'C';
  _DTA_C_6_InterneNummer_Begrenzer      = '0';
  _DTA_C_7_Lastschrift_Abbuchung        = '04000';
  _DTA_C_7_Lastschrift_Einzug           = '05000';
  _DTA_C_7_Lastschrift_POS_ec           = '05005';
  _DTA_C_7_Lastschrift_POS_edc          = '05006';
  _DTA_C_7_Lastschrift_CreditCard       = '05008';
  _DTA_C_7_Lastschrift_POS_POZ          = '05015';
  _DTA_C_7_Ruecklastschrift_Abbuchung   = '09040';
  _DTA_C_7_Ruecklastschrift_Einzug      = '09050';
  _DTA_C_7_Ueberweisungsgutschrift      = '51000';
  _DTA_C_7_LohnGehaltRente              = '53000';
  _DTA_C_7_VL                           = '54000';
  _DTA_C_7_Bezuege_Oeffentlicher_Kassen = '56000';
  _DTA_C_8_Reserve                      = #$20;
  _DTA_C_9_DM_Betrag_0                  = '00000000000';
  _DTA_C_12_Euro_Betrag_0               = '00000000000';
  _DTA_C_13_Reserve                     = '   ';
  _DTA_C_14b_Reserve                    = '        ';
  _DTA_C_17a_DM                         = #$20;
  _DTA_C_17a_Euro                       = '1';
  _DTA_C_17b_Reserve                    = '  ';
  _DTA_C_18_KeinErweiterungsteil        = '00';
  _DTA_C_Kennzeichen_Empty              = 0;
  _DTA_C_Kennzeichen_NameEmpfaenger     = 1;
  _DTA_C_Kennzeichen_Verwendungszweck   = 2;
  _DTA_C_Kennzeichen_NameAuftraggeber_  = 3;
  _DTA_C_Kennzeichen_Empty_S            = '  ';
  _DTA_C_Kennzeichen_NameEmpfaenger_S   = '01';
  _DTA_C_Kennzeichen_Verwendungszweck_S = '02';
  _DTA_C_Kennzeichen_NameAuftraggeber_S = '03';
  _DTA_C_Reserve                        = '           ';

  _DTA_E_1_Satzlaenge                   = '0128';
  _DTA_E_2_Satzart                      = 'E';
  _DTA_E_3_Reserve                      = '     ';
  _DTA_E_9_Reserve                      = '                                                   ';

{*)}

  // Typen-Deklaration

type

  _Waehrung = (DM, Euro);

  _Zahlungsarten = (
    LS_Abbuchung,
    LS_Einzug,
    LS_POS_ec,
    LS_POS_edc,
    LS_POS_cc,
    LS_POS_POZ,
    Rueck_LS_Abbuchung,
    Rueck_LS_Einzug,
    GS_Ueberweisung,
    LohnGehaltRente,
    VL,
    Oeffentliche_Bezuege
    );

{(*}

  // Record Vorsatzdaten
  tDTA_Satz_A_Record = record
    A1_Satzlaenge:        array[0..3] of char;
    A2_Satzart:           char;
    A3_Kennzeichen:       array[0..1] of char;
    A4_BLZ:               array[0..7] of char;
    A5_Reserve:           array[0..7] of char;
    A6_Kundenname:        array[0..26] of char;
    A7_DiskErstellDatum:  array[0..5] of char;
    A8_Reserve:           array[0..3] of char;
    A9_Kontonummer:       array[0..9] of char;
    A10_Referenznummer:   array[0..9] of char;
    A11a_Reserve:         array[0..14] of char;
    A11b_Ausfuehrung:     array[0..7] of char;
    A11c_Reserve:         array[0..23] of char;
    A12_Waehrung:         char;
  end;

{*)}

  // Klasse Vorsatzdaten
  tDTA_Satz_A = class
  private
    fSatz: tDTA_Satz_A_Record;
    fWaehrung: _Waehrung;
    fKundendiskette: boolean;
    fLastschriften: boolean;
    function GetKennzeichen: string;
    function GetBLZ: integer;
    function GetKundenname: string;
    function GetErstellung: TDateTime;
    function GetKontonummer: string;
    function GetReferenznummer: string;
    function GetAusfuehrung: TDateTime;
    procedure SetKennzeichen(const Value: string);
    procedure SetBLZ(const Value: integer);
    procedure SetKundenname(const Value: string);
    procedure SetErstellung(const Value: TDateTime);
    procedure SetKontonummer(const Value: string);
    procedure SetReferenznummer(const Value: string);
    procedure SetAusfuehrung(const Value: TDateTime);
    procedure SetWaehrung(const Value: _Waehrung);
    procedure SetKundendiskette(const Value: boolean);
    procedure SetLastschriften(const Value: boolean);
  public
    constructor Create;
  published
    property Kennzeichen: string read GetKennzeichen write SetKennzeichen;
    property BLZ: integer read GetBLZ write SetBLZ;
    property Kundenname: string read GetKundenname write SetKundenname;
    property Erstellungsdatum: TDateTime read GetErstellung write SetErstellung;
    property Kontonummer: string read GetKontonummer write SetKontonummer;
    property Referenznummer: string read GetReferenznummer write SetReferenznummer;
    property Ausfuehrungstermin: TDateTime read GetAusfuehrung write SetAusfuehrung;
    property Waehrung: _Waehrung read fWaehrung write SetWaehrung;
    property Kundendiskette: boolean read fKundendiskette write SetKundendiskette;
    property Lastschriften: boolean read fLastschriften write SetLastschriften;
  end;

{(*}

  // Record Datensatz C Konstanter Teil
  tDTA_Satz_C_Konstant_Record = record
    C1_Satzlaenge:          array[0..3] of char;
    C2_Satzart:             char;
    C3_BLZ_Erstbeteiligt:   array[0..7] of char;
    C4_BLZ_Endbeguenstigt:  array[0..7] of char;
    C5_Kontonummer:         array[0..9] of char;
    C6_InterneNummer:       array[0..12] of char;
    C7a_Textschluessel:     array[0..1] of char;
    C7b_Txt_Ergaenzung:     array[0..2] of char;
    C8_Reserve:             char;
    C9_Betrag_in_DM:        array[0..10] of char;
    C10_BLZ_Erstbeauftragt: array[0..7] of char;
    C11_Kontonummer:        array[0..9] of char;
    C12_Betrag_in_Euro:     array[0..10] of char;
    C13_Reserve:            array[0..2] of char;
    C14a_Name:              array[0..26] of char;
    C14b_Begrenzer:         array[0..7] of char;
    C15_Name:               array[0..26] of char;
    C16_Verwendungszweck:   array[0..26] of char;
    C17a_Waehrung:          char;
    C17b_Reserve:           array[0..1] of char;
    C18_Erweiterung:        array[0..1] of char;
    C19_Kennzeichen_1:      array[0..1] of char;
    C20_Daten_1:            array[0..26] of char;
    C21_Kennzeichen_2:      array[0..1] of char;
    C22_Daten_2:            array[0..26] of char;
    C23_Reserve:            array[0..10] of char;
  end;

{*)}

  // Klasse Datensatz C Konstanter Teil
  tDTA_Satz_C_Konstant = class
  private
    fSatz: tDTA_Satz_C_Konstant_Record;
    fZahlungsart: _Zahlungsarten;
    fVLProzent: integer;
    fVLJahr: integer;
    fWaehrung: _Waehrung;
    function GetSatzlaenge: integer;
    function GetBLZErstbeteiligt: integer;
    function GetBLZEndbeguenstigt: integer;
    function GetKontonummerEmpfaenger: string;
    function GetInterneNummer: extended;
    function GetTextschluessel: string;
    function GetTextErgaenzung: string;
    function GetBetragDM: currency;
    function GetBLZErstbeauftragt: integer;
    function GetKontonummerAuftraggeber: string;
    function GetBetragEuro: currency;
    function GetNameEmpfaenger: string;
    function GetNameAuftraggeber: string;
    function GetErweiterung: integer;
    function GetKennzeichen1: string;
    function GetDaten1: string;
    function GetKennzeichen2: string;
    function GetDaten2: string;
    procedure SetSatzlaenge(const Value: integer);
    procedure SetBLZErstbeteiligt(const Value: integer);
    procedure SetBLZEndbeguenstigt(const Value: integer);
    procedure SetKontonummerEmpfaenger(const Value: string);
    procedure SetInterneNummer(const Value: extended);
    procedure SetTextschluessel(const Value: string);
    procedure SetTextErgaenzung(const Value: string);
    procedure SetBetragDM(const Value: currency);
    procedure SetBLZErstbeauftragt(const Value: integer);
    procedure SetKontonummerAuftraggeber(const Value: string);
    procedure SetBetragEuro(const Value: currency);
    procedure SetNameEmpfaenger(const Value: string);
    procedure SetNameAuftraggeber(const Value: string);
    procedure SetWaehrung(const Value: _Waehrung);
    procedure SetErweiterung(const Value: integer);
    procedure SetKennzeichen1(const Value: string);
    procedure SetDaten1(const Value: string);
    procedure SetKennzeichen2(const Value: string);
    procedure SetDaten2(const Value: string);
    procedure SetZahlungsart(const Value: _Zahlungsarten);
    procedure SetVLProzent(const Value: integer);
    procedure SetVLJahr(const Value: integer);
    function GetVerwendungszweck: string;
    procedure SetVerwendungszweck(const Value: string);
  public
    constructor Create;
  published
    property Satzlaenge: integer read GetSatzlaenge write SetSatzlaenge;
    property BLZErstbeteiligt: integer read GetBLZErstbeteiligt write SetBLZErstbeteiligt;
    property BLZEndbeguenstigt: integer read GetBLZEndbeguenstigt write SetBLZEndbeguenstigt;
    property KontonummerEmpfaenger: string read GetKontonummerEmpfaenger write SetKontonummerEmpfaenger;
    property InterneNummer: extended read GetInterneNummer write SetInterneNummer;
    property Textschluessel: string read GetTextschluessel write SetTextschluessel;
    property TextErgaenzung: string read GetTextErgaenzung write SetTextErgaenzung;
    property BetragDM: currency read GetBetragDM write SetBetragDM;
    property BLZErstbeauftragt: integer read GetBLZErstbeauftragt write SetBLZErstbeauftragt;
    property KontonummerAuftraggeber: string read GetKontonummerAuftraggeber write SetKontonummerAuftraggeber;
    property BetragEuro: currency read GetBetragEuro write SetBetragEuro;
    property NameEmpfaenger: string read GetNameEmpfaenger write SetNameEmpfaenger;
    property NameAuftraggeber: string read GetNameAuftraggeber write SetNameAuftraggeber;
    property Waehrung: _Waehrung read fWaehrung write SetWaehrung;
    property Erweiterung: integer read GetErweiterung write SetErweiterung;
    property Kennzeichen1: string read GetKennzeichen1 write SetKennzeichen1;
    property Daten1: string read GetDaten1 write SetDaten1;
    property Kennzeichen2: string read GetKennzeichen2 write SetKennzeichen2;
    property Daten2: string read GetDaten2 write SetDaten2;
    property Zahlungsart: _Zahlungsarten read fZahlungsart write SetZahlungsart;
    property VLProzent: integer read fVLProzent write SetVLProzent;
    property VLJahr: integer read fVLJahr write SetVLJahr;
    property Verwendungszweck: string read GetVerwendungszweck write SetVerwendungszweck;
  end;

{(*}

  // Record Datensatz C Variabler Teil
  tDTA_Satz_C_Variabel_Record = record
    C24_Kennzeichen_1:  array[0..1] of char;
    C25_Daten_1:        array[0..26] of char;
    C26_Kennzeichen_2:  array[0..1] of char;
    C27_Daten_2:        array[0..26] of char;
    C28_Kennzeichen_3:  array[0..1] of char;
    C29_Daten_3:        array[0..26] of char;
    C30_Kennzeichen_4:  array[0..1] of char;
    C31_Daten_4:        array[0..26] of char;
    C32_Reserve:        array[0..11] of char;
  end;

{*)}

  // Klasse Datensatz C Variabler Teil
  tDTA_Satz_C_Variabel = class
  private
    fSatz: tDTA_Satz_C_Variabel_Record;
    function GetDaten1: string;
    function GetDaten2: string;
    function GetDaten3: string;
    function GetDaten4: string;
    function GetKennzeichen1: string;
    function GetKennzeichen2: string;
    function GetKennzeichen3: string;
    function GetKennzeichen4: string;
    procedure SetDaten1(const Value: string);
    procedure SetDaten2(const Value: string);
    procedure SetDaten3(const Value: string);
    procedure SetDaten4(const Value: string);
    procedure SetKennzeichen1(const Value: string);
    procedure SetKennzeichen2(const Value: string);
    procedure SetKennzeichen3(const Value: string);
    procedure SetKennzeichen4(const Value: string);
  public
    constructor Create;
  published
    property Kennzeichen1: string read GetKennzeichen1 write SetKennzeichen1;
    property Kennzeichen2: string read GetKennzeichen2 write SetKennzeichen2;
    property Kennzeichen3: string read GetKennzeichen3 write SetKennzeichen3;
    property Kennzeichen4: string read GetKennzeichen4 write SetKennzeichen4;
    property Daten1: string read GetDaten1 write SetDaten1;
    property Daten2: string read GetDaten2 write SetDaten2;
    property Daten3: string read GetDaten3 write SetDaten3;
    property Daten4: string read GetDaten4 write SetDaten4;
  end;

  // Einzelner Variabler Datensatz C in Liste variabler Datensätze C
  tDTA_Satz_C_Variabel_Item = class
    Datensatz: tDTA_Satz_C_Variabel;
    constructor Create;
    destructor Destroy; override;
  end;

  // Listenklasse der variablen Datensätze C
  tDTA_Satz_C_Variabel_Liste = class(TList)
    destructor Destroy; override;
  end;

  // Klasse für Datensatz C (konstant und variabel)
  tDTA_Satz_C = class
  private
    fNameEmpfaenger: string;
    fVerwendungszweck: string;
    fNameAuftraggeber: string;
    KonstanterTeil: tDTA_Satz_C_Konstant;
    VariablerTeil: tDTA_Satz_C_Variabel_Liste;
    procedure SetNameAuftraggeber(const Value: string);
    procedure SetNameEmpfaenger(const Value: string);
    procedure SetVerwendungszweck(const Value: string);
    procedure SetVariablerTeil;
    procedure NewErweiterungsTeil(const Value, Kennzeichen: string);
  public
    procedure SaveToStream(Stream: TStream);
    property NameEmpfaenger: string read fNameEmpfaenger write SetNameEmpfaenger;
    property Verwendungszweck: string read fVerwendungszweck write SetVerwendungszweck;
    property NameAuftraggeber: string read fNameAuftraggeber write SetNameAuftraggeber;
    constructor Create;
    destructor Destroy; override;
  end;

  // Liste der Datensätze C
  tDTA_Satz_C_Liste = class(Tlist)
    destructor Destroy; override;
  end;

{(*}

  // Record Nachspann
  tDTA_Satz_E_Record = record
    E1_Satzlaenge:          array[0..3] of char;
    E2_Satzart:             char;
    E3_Reserve:             array[0..4] of char;
    E4_Anzahl:              array[0..6] of char;
    E5_Summe_Betraege_DM:   array[0..12] of char;
    E6_Summe_Kontonummern:  array[0..16] of char;
    E7_Summe_BLZ:           array[0..16] of char;
    E8_Summe_Betraege_Euro: array[0..12] of char;
    E9_Reserve:             array[0..50] of char;
  end;

{*)}

  // Klasse Nachspann
  tDTA_Satz_E = class
  private
    fSatz: tDTA_Satz_E_Record;
    function GetAnzahl: integer;
    function GetSummeDM: currency;
    function GetSummeKontonummern: extended;
    function GetSummeBLZ: extended;
    function GetSummeEuro: currency;
    procedure SetAnzahl(const Value: integer);
    procedure SetSummeDM(const Value: currency);
    procedure SetSummeKontonummern(const Value: extended);
    procedure SetSummeBLZ(const Value: extended);
    procedure SetSummeEuro(const Value: currency);
  public
    constructor Create;
  published
    property Anzahl: integer read GetAnzahl write SetAnzahl;
    property SummeDM: currency read GetSummeDM write SetSummeDM;
    property SummeKontonummern: extended read GetSummeKontonummern write SetSummeKontonummern;
    property SummeBLZ: extended read GetSummeBLZ write SetSummeBLZ;
    property SummeEuro: currency read GetSummeEuro write SetSummeEuro;
  end;

  // Klasse aktueller Datensatz
  tDTA_AktuellerDatensatz = class
  private
    fRecNo: integer;
    fBLZ: integer;
    fKontoNummer: string;
    fZahlungsart: _Zahlungsarten;
    fInterneNummer: extended;
    fBetragDM: currency;
    fBetragEuro: currency;
    fWaehrung: _Waehrung;
    fName: string;
    fVerwendungszweck: string;
    procedure SetBetrag(const Value: currency);
    procedure SetBLZ(const Value: integer);
    procedure SetInterneNummer(const Value: extended);
    procedure SetZahlungsart(const Value: _Zahlungsarten);
    function GetBetrag: currency;
  public
    property RecNo: integer read fRecNo;
    property BLZ: integer read fBLZ write SetBLZ;
    property KontoNummer: string read fKontoNummer write fKontoNummer;
    property Zahlungsart: _Zahlungsarten read fZahlungsart write SetZahlungsart;
    property InterneNummer: extended read fInterneNummer write SetInterneNummer;
    property Betrag: currency read GetBetrag write SetBetrag;
    property Name: string read fName write fName;
    property Verwendungszweck: string read fVerwendungszweck write fVerwendungszweck;
  end;

  // Klasse DTAUS Komponente
  TmpsDTAUS = class(TComponent)
  private
    fVorsatz: tDTA_Satz_A;
    fEinzeldatensaetze: tDTA_Satz_C_Liste;
    fNachsatz: tDTA_Satz_E;
    fAktuellerDatensatz: tDTA_AktuellerDatensatz;
    fDateiname: TFileName;
    fKundenname: string;
    fRecNo: integer;
    fEOF: boolean;
    fBOF: boolean;
    fNachsatzaktualisierung: boolean;
    function GetLastschriften: boolean;
    procedure SetLastschriften(const Value: boolean);
    function GetKundendiskette: boolean;
    procedure SetKundendiskette(const Value: boolean);
    function GetKennzeichen: string;
    procedure SetKennzeichen(const Value: string);
    function GetAusfuehrungstermin: TDateTime;
    function GetBLZ: integer;
    function GetDatensaetze: integer;
    function GetErstellungsdatum: TDateTime;
    function GetKontonummer: string;
    function GetReferenznummer: string;
    function GetSummeBLZ: extended;
    function GetSummeDM: currency;
    function GetSummeEuro: currency;
    function GetSummeKontonummern: extended;
    function GetWaehrung: _Waehrung;
    procedure SetAusfuehrungstermin(const Value: TDateTime);
    procedure SetBLZ(const Value: integer);
    procedure SetErstellungsdatum(const Value: TDateTime);
    procedure SetKontonummer(const Value: string);
    procedure SetKundenname(const Value: string);
    procedure SetReferenznummer(const Value: string);
    procedure SetWaehrung(const Value: _Waehrung);
    procedure SetNachsatzaktualisierung(const Value: boolean);
    function GetNachsatzaktualisierung: boolean;
    //    procedure LoadAktuellerDatensatz;
    procedure WriteAktuellerDatensatz;
    procedure DoNachsatzAktualisierung(const Calculate: boolean);
    procedure Datensatzaktualisierung;
  public
    property Datensaetze: integer read GetDatensaetze;
    property SummeDM: currency read GetSummeDM;
    property SummeKontonummern: extended read GetSummeKontonummern;
    property SummeBLZ: extended read GetSummeBLZ;
    property SummeEuro: currency read GetSummeEuro;
    property AktuellerDatensatz: tDTA_AktuellerDatensatz read fAktuellerDatensatz write fAktuellerDatensatz;
    procedure SaveToStream(Stream: TStream);
    procedure Append;
    procedure Clear;
    procedure Post;
    procedure SaveToDisk;
    function GeTmpsDTAUSString: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Lastschriften: boolean read GetLastschriften write SetLastschriften;
    property Kundendiskette: boolean read GetKundendiskette write SetKundendiskette;
    property Kennzeichen: string read GetKennzeichen write SetKennzeichen;
    property BLZ: integer read GetBLZ write SetBLZ;
    property Kundenname: string read fKundenname write SetKundenname;
    property Erstellungsdatum: TDateTime read GetErstellungsdatum write SetErstellungsdatum;
    property Kontonummer: string read GetKontonummer write SetKontonummer;
    property Referenznummer: string read GetReferenznummer write SetReferenznummer;
    property Ausfuehrungstermin: TDateTime read GetAusfuehrungstermin write SetAusfuehrungstermin;
    property Waehrung: _Waehrung read GetWaehrung write SetWaehrung;
    property Dateiname: TFileName read fDateiname write fDateiname;
    property EOF: boolean read fEOF;
    property BOF: boolean read fBOF;
    property Nachsatzaktualisierung: boolean read GetNachsatzaktualisierung write SetNachsatzaktualisierung;
  end;

function _DTA_CompatibleString(const Input: string; const NumbersOnly: boolean): string;
function _DTA_ExtractDay(Date: TDateTime): Word;
function _DTA_ExtractMonth(Date: TDateTime): Word;
function _DTA_ExtractYear(Date: TDateTime): Word;
function _DTA_StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar;

procedure _DTA_StringToArray(const Text: string; const NumbersOnly: boolean; var Result: array of char);

procedure Register;

implementation

//********** RegisterComponent **********
// Komponenten in der Komponentenpalette registrieren

procedure Register;
begin
  //RegisterComponents('CAO-Faktura', [TmpsDTAUS]);
  RegisterComponents('Open-Faktura', [TmpsDTAUS]);  //15.10.09-ud.
end;

//********** _DTA_StrLCopy **********
// Kopiert einen PChar in einen anderen PChar
// bis zur maximalen übergebenen Länge und
// gibt den kopierten PChar zurück

function _DTA_StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar;
var
  i: integer;
begin
  for i := 0 to MaxLen - 1 do
  begin
    Dest[i] := Source[i];
  end;
  Result := Dest;
end;

//********** _DTA_ExtractDay **********
// Extrahiert den Tag aus dem übergebenen Datum

function _DTA_ExtractDay(Date: TDateTime): Word;
var
  Month, Year: Word;
begin
  DecodeDate(Date, Year, Month, Result);
end;

//********** _DTA_ExtractMonth **********
// Extrahiert den Monat aus dem übergebenen Datum

function _DTA_ExtractMonth(Date: TDateTime): Word;
var
  Day, Year: Word;
begin
  DecodeDate(Date, Year, Result, Day);
end;

//********** _DTA_ExtractYear **********
// Extrahiert das Jahr aus dem übergebenen Datum

function _DTA_ExtractYear(Date: TDateTime): Word;
var
  Day, Month: Word;
begin
  DecodeDate(Date, Result, Month, Day);
end;

//********** _DTA_ReplaceString **********
// Ersetzt einen Substring im übergebenen String
// durch einen anderen Substring, wobei die Länge
// nicht übereinstimmen muß

function _DTA_ReplaceString(const Source, Search, Replace: string): string;
var
  i: integer;
begin
  Result := Source;
  repeat
    i := Pos(Search, Result);
    if i > 0 then
    begin
      Delete(Result, i, Length(Search));
      Insert(Replace, Result, i);
    end;
  until i = 0;
end;

//********** _DTA_StringToArray **********
// Kopiert einen übergebenen String in ein Array of Char
// Wahlweise kann eine Überprüfung auf rein numerische
// Zeichen vorgenommen werden

procedure _DTA_StringToArray(const Text: string; const NumbersOnly: boolean; var Result: array of
  char);
begin
  if NumbersOnly then
  begin
    _DTA_StrLCopy(Result, PChar(StringOfChar(_DTA_EmptyNum, SizeOf(Result) -
      Length(_DTA_CompatibleString(Text, NumbersOnly)))
      + _DTA_CompatibleString(Text, NumbersOnly)), SizeOf(Result));
  end
  else
  begin
    _DTA_StrLCopy(Result, PChar(_DTA_CompatibleString(Text, NumbersOnly) +
      StringOfChar(_DTA_EmptySpace, SizeOf(Result))),
      SizeOf(Result));
  end;
end;

//********** _DTA_CompatibleString **********
// Entfernt alle Sonderzeichen aus dem
// übergebenen String
// Wahlweise kann eine Überprüfung auf rein numerische
// Zeichen vorgenommen werden

function _DTA_CompatibleString(const Input: string; const NumbersOnly: boolean): string;
var
  i: integer;
begin
  if NumbersOnly then
  begin
    Result := _DTA_ReplaceString(Input, _DTA_EmptySpace, _DTA_EmptyNum);
    for i := Length(Result) downto 1 do
    begin
      if not (Result[i] in ['0'..'9']) then
      begin
        Delete(Result, i, 1);
      end;
    end;
  end
  else
  begin
    Result := AnsiUpperCase(Input);
    Result := _DTA_ReplaceString(Result, 'ß', 'SS');
    Result := _DTA_ReplaceString(Result, 'Ä', 'AE');
    Result := _DTA_ReplaceString(Result, 'Ö', 'OE');
    Result := _DTA_ReplaceString(Result, 'Ü', 'UE');
    Result := _DTA_ReplaceString(Result, _DTA_EmptySpace + _DTA_EmptySpace, _DTA_EmptySpace);
    for i := Length(Result) downto 1 do
    begin
      if not (Result[i] in ['0'..'9', 'A'..'Z', #$20, #$24..#$26, #$2B..#$2F]) then
      begin
        Delete(Result, i, 1);
      end;
    end;
  end;
end;

{ tDTA_Satz_A }

// Klasse für den Datensatz A (Vorspann)

//********** tDTA_Satz_A.Create **********
// Im Konstruktor Default-Einstellungen vornehmen

constructor tDTA_Satz_A.Create;
begin
  inherited Create;
  FillChar(fSatz, SizeOf(fSatz), _DTA_EmptySpace);
  Erstellungsdatum := Date;                       // Erstellungdatum mit heutigem Datum vorbelegen
  Ausfuehrungstermin := Date;                     // Ausfuerhungstermin mit heutigem Datum vorbelegen
  Waehrung := Euro;                               // Waehrung auf Euro vorbelegen
  Lastschriften := true;                          // Lastschriften-Diskette
  Kundendiskette := true;                         // Kunden-Diskette
  BLZ := 0;                                       // BLZ mit leerem Wert vorbelegen
  Kontonummer := _DTA_EmptyNum;                   // Konto-Nummer mir leerem Wert vorbelegen
  Referenznummer := _DTA_EmptyNum;                // Refernznummer mit leerem Wert vorbelegen
  // zugehörigen Record mit Standardwerten vorbelegen
  with fSatz do
  begin
    A1_Satzlaenge := _DTA_A_1_Satzlaenge;         // Satzlänge ist konstant
    A2_Satzart := _DTA_A_2_Satzart;               // Satzart
    // Kennzeichen für Lastschrift/Gutschrift und Kunden-/Bankdiskette
    if Lastschriften then
    begin
      A3_Kennzeichen[0] := _DTA_A_3_Kennzeichen_Lastschrift;
    end
    else
    begin
      A3_Kennzeichen[0] := _DTA_A_3_Kennzeichen_Gutschrift;
    end;
    if Kundendiskette then
    begin
      A3_Kennzeichen[1] := _DTA_A_3_Kennzeichen_Kundendiskette;
    end
    else
    begin
      A3_Kennzeichen[1] := _DTA_A_3_Kennzeichen_Bankdiskette;
    end;
    A5_Reserve := _DTA_A_5_Reserve;               // Reservefelder
  end;
end;

//********** tDTA_Satz_A.GetAusfuehrung **********
// Ausführungsdatum zurückgeben

function tDTA_Satz_A.GetAusfuehrung: TDateTime;
begin
  with fSatz do
    Result := EncodeDate(
      StrToInt(A11b_Ausfuehrung[4] + A11b_Ausfuehrung[5] + A11b_Ausfuehrung[6] +
      A11b_Ausfuehrung[7]),                       // Jahr
      StrToInt(A11b_Ausfuehrung[2] + A11b_Ausfuehrung[3]), // Monat
      StrToInt(A11b_Ausfuehrung[0] + A11b_Ausfuehrung[1])); // Tag
end;

//********** tDTA_Satz_A.GetBLZ **********
// BLZ zurückgeben

function tDTA_Satz_A.GetBLZ: integer;
begin
  Result := StrToInt(fSatz.A4_BLZ);
end;

//********** tDTA_Satz_A.GetErstellung **********
// Erstellungsdatum zurückgeben, wobei
// angenommen wird, daß das Erstellungsdatum
// im aktuellen Jahrhundert liegt

function tDTA_Satz_A.GetErstellung: TDateTime;
begin
  with fSatz do
    Result := EncodeDate(
      StrToInt(Copy(IntToStr(_DTA_ExtractYear(Date)), 1, 2) + A7_DiskErstellDatum[4] +
      A7_DiskErstellDatum[5]),                    // Jahr
      StrToInt(A7_DiskErstellDatum[2] + A7_DiskErstellDatum[3]), // Monat
      StrToInt(A7_DiskErstellDatum[0] + A7_DiskErstellDatum[1])); // Tag
end;

//********** tDTA_Satz_A.GetKennzeichen **********
// Satzkennzeichen zurückgeben

function tDTA_Satz_A.GetKennzeichen: string;
begin
  Result := Trim(fSatz.A3_Kennzeichen);
end;

//********** tDTA_Satz_A.GetKontonummer **********
// Kontonummer zurückgeben

function tDTA_Satz_A.GetKontonummer: string;
begin
  Result := Trim(fSatz.A9_Kontonummer);
end;

//********** tDTA_Satz_A.GetKundenname **********
// Kundenname zurückgeben

function tDTA_Satz_A.GetKundenname: string;
begin
  Result := Trim(fSatz.A6_Kundenname);
end;

//********** tDTA_Satz_A.GetReferenznummer **********
// Kundenreferenznummer zurückgeben

function tDTA_Satz_A.GetReferenznummer: string;
begin
  Result := Trim(Copy(fSatz.A10_Referenznummer, 2, Length(fSatz.A10_Referenznummer) - 2));
end;

//********** tDTA_Satz_A.SetAusfuehrung **********
// Ausführungstermin setzen

procedure tDTA_Satz_A.SetAusfuehrung(const Value: TDateTime);
begin
  if (Value >= Erstellungsdatum) and (Value <= (Erstellungsdatum + 15)) then
  begin
    _DTA_StringToArray(Copy('0' + IntToStr(_DTA_ExtractDay(Value)), Length('0' +
      IntToStr(_DTA_ExtractDay(Value))) - 1, 2)
      + Copy('0' + IntToStr(_DTA_ExtractMonth(Value)), Length('0' +
      IntToStr(_DTA_ExtractMonth(Value))) - 1, 2)
      + Copy(IntToStr(_DTA_ExtractYear(Value)), 1, 4), true, fSatz.A11b_Ausfuehrung);
  end;
end;

//********** tDTA_Satz_A.SetBLZ **********
// BLZ setzen

procedure tDTA_Satz_A.SetBLZ(const Value: integer);
begin
  if ((Value >= _DTA_MinBLZ) and (Value <= _DTA_MaxBLZ)) or (Value = 0) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.A4_BLZ);
  end;
end;

//********** tDTA_Satz_A.SetErstellung **********
// Erstellungsdatum setzen, wobei angenommen wird,
// daß das Erstellungsdatum im aktuellen Jahrhundert liegt

procedure tDTA_Satz_A.SetErstellung(const Value: TDateTime);
begin
  _DTA_StringToArray(Copy('0' + IntToStr(_DTA_ExtractDay(Value)), Length('0' +
    IntToStr(_DTA_ExtractDay(Value))) - 1, 2)
    + Copy('0' + IntToStr(_DTA_ExtractMonth(Value)), Length('0' +
    IntToStr(_DTA_ExtractMonth(Value))) - 1, 2)
    + Copy(IntToStr(_DTA_ExtractYear(Value)), 3, 2), true, fSatz.A7_DiskErstellDatum);
end;

//********** tDTA_Satz_A.SetKennzeichen **********
// Kennzeichen setzen

procedure tDTA_Satz_A.SetKennzeichen(const Value: string);
begin
  if (Length(Value) = 2) and ((Value = 'GB') or (Value = 'LB') or (Value = 'GK') or (Value = 'LK')) then
  begin
    _DTA_StringToArray(Value, false, fSatz.A3_Kennzeichen);
  end;
end;

//********** tDTA_Satz_A.SetKontonummer **********
// Kontonummer setzen

procedure tDTA_Satz_A.SetKontonummer(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.A9_Kontonummer);
end;

//********** tDTA_Satz_A.SetKundendiskette **********
// Property Kundendiskette und Kennzeichen setzen

procedure tDTA_Satz_A.SetKundendiskette(const Value: boolean);
begin
  fKundendiskette := Value;
  if fKundendiskette then
  begin
    fSatz.A3_Kennzeichen[1] := _DTA_A_3_Kennzeichen_Kundendiskette;
  end
  else
  begin
    fSatz.A3_Kennzeichen[1] := _DTA_A_3_Kennzeichen_Bankdiskette;
  end;
end;

//********** tDTA_Satz_A.SetKundenname **********
// Kundennamme setzen

procedure tDTA_Satz_A.SetKundenname(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.A6_Kundenname);
end;

//********** tDTA_Satz_A.SetLastschriften **********
// Property Lastschriften und Kennzeichen setzen

procedure tDTA_Satz_A.SetLastschriften(const Value: boolean);
begin
  fLastschriften := Value;
  if fLastschriften then
  begin
    fSatz.A3_Kennzeichen[0] := _DTA_A_3_Kennzeichen_Lastschrift;
  end
  else
  begin
    fSatz.A3_Kennzeichen[0] := _DTA_A_3_Kennzeichen_Gutschrift;
  end;
end;

//********** tDTA_Satz_A.SetReferenznummer **********
// Referenznummer setzen

procedure tDTA_Satz_A.SetReferenznummer(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.A10_Referenznummer);
end;

//********** tDTA_Satz_A.SetWaehrung **********
// Währung setzen

procedure tDTA_Satz_A.SetWaehrung(const Value: _Waehrung);
begin
  fWaehrung := Value;
  if fWaehrung = Euro then
  begin
    fSatz.A12_Waehrung := _DTA_A_12_Euro;
  end
  else
  begin
    fSatz.A12_Waehrung := _DTA_A_12_DM;
  end;
end;

{ tDTA_Satz_E }

// Nachspanndatensatz E

//********** tDTA_Satz_E.Create **********
// Im Konstruktor Voreinstellungen vornehmen

constructor tDTA_Satz_E.Create;
begin
  inherited Create;
  FillChar(fSatz, SizeOf(fSatz), _DTA_EmptySpace);
  Anzahl := 0;                                    // Anzahl der Datensätze
  SummeDM := 0;                                   // Summe aller DM-Beträge in den Datensätzen C
  SummeKontonummern := 0;                         // Summe aller Kontonummern in den Datensätzen C
  SummeBLZ := 0;                                  // Summe aller BLZs in den Datensätzen C
  SummeEuro := 0;                                 // Summe aller Euro-Beträge in den Datensätzen C
  with fSatz do
  begin
    E1_Satzlaenge := _DTA_E_1_Satzlaenge;         // Satzlänge konstant
    E2_Satzart := _DTA_E_2_Satzart;               // Satzart
  end;
end;

//********** tDTA_Satz_E.GetAnzahl **********
// Anzahl der Datensätze zurückgeben

function tDTA_Satz_E.GetAnzahl: integer;
begin
  Result := StrToInt(fSatz.E4_Anzahl);
end;

//********** tDTA_Satz_E.GetSummeBLZ **********
// Summe aller BLZs zurückgeben

function tDTA_Satz_E.GetSummeBLZ: extended;
begin
  Result := Int(StrToFloat(fSatz.E7_Summe_BLZ));
end;

//********** tDTA_Satz_E.GetSummeDM **********
// Summe aller DM-Beträge zurückgeben

function tDTA_Satz_E.GetSummeDM: currency;
begin
  Result := (StrToCurr(fSatz.E5_Summe_Betraege_DM)) / 100;
end;

//********** tDTA_Satz_E.GetSummeEuro **********
// Summe aller Euro-Beträge zurückgeben

function tDTA_Satz_E.GetSummeEuro: currency;
begin
  Result := (StrToCurr(fSatz.E8_Summe_Betraege_Euro)) / 100;
end;

//********** tDTA_Satz_E.GetSummeKontonummern **********
// Summe aller Kontonummern zurückgeben

function tDTA_Satz_E.GetSummeKontonummern: extended;
begin
  Result := Int(StrToFloat(fSatz.E6_Summe_Kontonummern));
end;

//********** tDTA_Satz_E.SetAnzahl **********
// Anzahl der Datensätze ändern

procedure tDTA_Satz_E.SetAnzahl(const Value: integer);
begin
  _DTA_StringToArray(IntToStr(Value), true, fSatz.E4_Anzahl);
end;

//********** tDTA_Satz_E.SetSummeBLZ **********
// Summe der BLZs ändern

procedure tDTA_Satz_E.SetSummeBLZ(const Value: extended);
begin
  _DTA_StringToArray(FloatToStrF(Value, ffFixed, SizeOf(fSatz.E7_Summe_BLZ), 0), true, fSatz.E7_Summe_BLZ);
end;

//********** tDTA_Satz_E.SetSummeDM **********
// Summe der DM-Beträge ändern

procedure tDTA_Satz_E.SetSummeDM(const Value: currency);
begin
  _DTA_StringToArray(CurrToStrF(Value, ffFixed, 2), true, fSatz.E5_Summe_Betraege_DM);
end;

//********** tDTA_Satz_E.SetSummeEuro **********
// Summe der Euro-Beträge ändern

procedure tDTA_Satz_E.SetSummeEuro(const Value: currency);
begin
  _DTA_StringToArray(CurrToStrF(Value, ffFixed, 2), true, fSatz.E8_Summe_Betraege_Euro);
end;

//********** tDTA_Satz_E.SetSummeKontonummern **********
// Summe der Kontonummern ändern

procedure tDTA_Satz_E.SetSummeKontonummern(const Value: extended);
begin
  _DTA_StringToArray(FloatToStrF(Value, ffFixed, SizeOf(fSatz.E6_Summe_Kontonummern), 0), true,
    fSatz.E6_Summe_Kontonummern);
end;

{ tDTA_Satz_C_Konstant }

// Klasse der Konstanten Datensätze C

//********** tDTA_Satz_C_Konstant.Create **********
// Im Konstruktor Voreinstellungen setzen

constructor tDTA_Satz_C_Konstant.Create;
begin
  inherited Create;
  FillChar(fSatz, SizeOf(fSatz), _DTA_EmptySpace);
  BLZErstbeteiligt := 0;
  BLZEndbeguenstigt := 0;
  KontonummerEmpfaenger := _DTA_EmptyNum;
  InterneNummer := 0;
  Zahlungsart := LS_Einzug;
  BetragDM := 0;
  KontonummerAuftraggeber := _DTA_EmptyNum;
  BetragEuro := 0;
  Waehrung := Euro;
  Erweiterung := 0;
  Kennzeichen1 := _DTA_C_Kennzeichen_Empty_S;
  Kennzeichen2 := _DTA_C_Kennzeichen_Empty_S;
  fSatz.C1_Satzlaenge := _DTA_C_1_Satzlaenge_Konstant;
  fSatz.C2_Satzart := _DTA_C_2_Satzart;
end;

//************** tDTA_Satz_C_Konstant.GetBetragDM ********************
//

function tDTA_Satz_C_Konstant.GetBetragDM: currency;
begin
  Result := (StrToCurr(fSatz.C9_Betrag_in_DM)) / 100;
end;

//************** tDTA_Satz_C_Konstant.GetBetragEuro ********************
//

function tDTA_Satz_C_Konstant.GetBetragEuro: currency;
begin
  Result := (StrToCurr(fSatz.C12_Betrag_in_Euro)) / 100;
end;

//************** tDTA_Satz_C_Konstant.GetBLZEndbeguenstigt ********************
//

function tDTA_Satz_C_Konstant.GetBLZEndbeguenstigt: integer;
begin
  Result := StrToInt(fSatz.C4_BLZ_Endbeguenstigt);
end;

//************** tDTA_Satz_C_Konstant.GetBLZErstbeauftragt ********************
//

function tDTA_Satz_C_Konstant.GetBLZErstbeauftragt: integer;
begin
  Result := StrToInt(fSatz.C10_BLZ_Erstbeauftragt);
end;

//************** tDTA_Satz_C_Konstant.GetBLZErstbeteiligt ********************
//

function tDTA_Satz_C_Konstant.GetBLZErstbeteiligt: integer;
begin
  Result := StrToInt(fSatz.C3_BLZ_Erstbeteiligt);
end;

//************** tDTA_Satz_C_Konstant.GetDaten1 ********************
//

function tDTA_Satz_C_Konstant.GetDaten1: string;
begin
  Result := Trim(fSatz.C20_Daten_1);
end;

//************** tDTA_Satz_C_Konstant.GetDaten2 ********************
//

function tDTA_Satz_C_Konstant.GetDaten2: string;
begin
  Result := Trim(fSatz.C22_Daten_2);
end;

//************** tDTA_Satz_C_Konstant.GetErweiterung ********************
//

function tDTA_Satz_C_Konstant.GetErweiterung: integer;
begin
  Result := StrToInt(fSatz.C18_Erweiterung);
end;

//************** tDTA_Satz_C_Konstant.GetInterneNummer ********************
//

function tDTA_Satz_C_Konstant.GetInterneNummer: extended;
begin
  Result := Int(StrToFloat(fSatz.C6_InterneNummer));
end;

//************** tDTA_Satz_C_Konstant.GetKennzeichen1 ********************
//

function tDTA_Satz_C_Konstant.GetKennzeichen1: string;
begin
  Result := Trim(fSatz.C19_Kennzeichen_1);
end;

//************** tDTA_Satz_C_Konstant.GetKennzeichen2 ********************
//

function tDTA_Satz_C_Konstant.GetKennzeichen2: string;
begin
  Result := Trim(fSatz.C21_Kennzeichen_2);
end;

//************** tDTA_Satz_C_Konstant.GetKontonummerAuftraggeber ********************
//

function tDTA_Satz_C_Konstant.GetKontonummerAuftraggeber: string;
begin
  Result := Trim(fSatz.C11_Kontonummer);
end;

//************** tDTA_Satz_C_Konstant.GetKontonummerEmpfaenger ********************
//

function tDTA_Satz_C_Konstant.GetKontonummerEmpfaenger: string;
begin
  Result := Trim(fSatz.C5_Kontonummer);
end;

//************** tDTA_Satz_C_Konstant.GetNameAuftraggeber ********************
//

function tDTA_Satz_C_Konstant.GetNameAuftraggeber: string;
begin
  Result := Trim(fSatz.C15_Name);
end;

//************** tDTA_Satz_C_Konstant.GetNameEmpfaenger ********************
//

function tDTA_Satz_C_Konstant.GetNameEmpfaenger: string;
begin
  Result := Trim(fSatz.C14a_Name);
end;

//************** tDTA_Satz_C_Konstant.GetSatzlaenge ********************
//

function tDTA_Satz_C_Konstant.GetSatzlaenge: integer;
begin
  Result := StrToInt(fSatz.C1_Satzlaenge);
end;

//************** tDTA_Satz_C_Konstant.GetTextErgaenzung ********************
//

function tDTA_Satz_C_Konstant.GetTextErgaenzung: string;
begin
  Result := Trim(fSatz.C7b_Txt_Ergaenzung);
end;

//************** tDTA_Satz_C_Konstant.GetTextschluessel ********************
//

function tDTA_Satz_C_Konstant.GetTextschluessel: string;
begin
  Result := Trim(fSatz.C7a_Textschluessel);
end;

//************** tDTA_Satz_C_Konstant.GetVerwendungszweck ********************
//

function tDTA_Satz_C_Konstant.GetVerwendungszweck: string;
begin
  Result := Trim(fSatz.C16_Verwendungszweck);
end;

//************** tDTA_Satz_C_Konstant.SetBetragDM ********************
//

procedure tDTA_Satz_C_Konstant.SetBetragDM(const Value: currency);
begin
  if Value <> 0 then
  begin
    BetragEuro := 0;
    Waehrung := DM;
  end;
  _DTA_StringToArray(CurrToStrF(Value, ffFixed, 2), true, fSatz.C9_Betrag_in_DM);
end;

//************** tDTA_Satz_C_Konstant.SetBetragEuro ********************
//

procedure tDTA_Satz_C_Konstant.SetBetragEuro(const Value: currency);
begin
  if Value <> 0 then
  begin
    BetragDM := 0;
    Waehrung := Euro;
  end;
  _DTA_StringToArray(CurrToStrF(Value, ffFixed, 2), true, fSatz.C12_Betrag_in_Euro);
end;

//************** tDTA_Satz_C_Konstant.SetBLZEndbeguenstigt ********************
//

procedure tDTA_Satz_C_Konstant.SetBLZEndbeguenstigt(const Value: integer);
begin
  if ((Value >= _DTA_MinBLZ) and (Value <= _DTA_MaxBLZ)) or (Value = 0) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.C4_BLZ_Endbeguenstigt);
  end;
end;

//************** tDTA_Satz_C_Konstant.SetBLZErstbeauftragt ********************
//

procedure tDTA_Satz_C_Konstant.SetBLZErstbeauftragt(const Value: integer);
begin
  if ((Value >= _DTA_MinBLZ) and (Value <= _DTA_MaxBLZ)) or (Value = 0) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.C10_BLZ_Erstbeauftragt);
  end;
end;

//************** tDTA_Satz_C_Konstant.SetBLZErstbeteiligt ********************
//

procedure tDTA_Satz_C_Konstant.SetBLZErstbeteiligt(const Value: integer);
begin
  if ((Value >= _DTA_MinBLZ) and (Value <= _DTA_MaxBLZ)) or (Value = 0) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.C3_BLZ_Erstbeteiligt);
  end;
end;

//************** tDTA_Satz_C_Konstant.SetDaten1 ********************
//

procedure tDTA_Satz_C_Konstant.SetDaten1(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C20_Daten_1);
end;

//************** tDTA_Satz_C_Konstant.SetDaten2 ********************
//

procedure tDTA_Satz_C_Konstant.SetDaten2(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C22_Daten_2);
end;

//************** tDTA_Satz_C_Konstant.SetErweiterung ********************
//

procedure tDTA_Satz_C_Konstant.SetErweiterung(const Value: integer);
begin
  if (Value >= _DTA_MinErweiterungsteile) and (Value <= _DTA_MaxErweiterungsteile) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.C18_Erweiterung);
  end;
end;

//************** tDTA_Satz_C_Konstant.SetInterneNummer ********************
//

procedure tDTA_Satz_C_Konstant.SetInterneNummer(const Value: extended);
var
  dummyInterneNummer: array[0..10] of Char;
begin
  _DTA_StringToArray(FloatToStrF(Int(Value), ffFixed, SizeOf(dummyInterneNummer), 0), true, dummyInterneNummer);
  _DTA_StringToArray(_DTA_EmptyNum + dummyInterneNummer + _DTA_EmptyNum, true, fSatz.C6_InterneNummer);
end;

//************** tDTA_Satz_C_Konstant.SetKennzeichen1 ********************
//

procedure tDTA_Satz_C_Konstant.SetKennzeichen1(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C19_Kennzeichen_1);
end;

//************** tDTA_Satz_C_Konstant.SetKennzeichen2 ********************
//

procedure tDTA_Satz_C_Konstant.SetKennzeichen2(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C21_Kennzeichen_2);
end;

//************** tDTA_Satz_C_Konstant.SetKontonummerAuftraggeber ********************
//

procedure tDTA_Satz_C_Konstant.SetKontonummerAuftraggeber(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.C11_Kontonummer);
end;

//************** tDTA_Satz_C_Konstant.SetKontonummerEmpfaenger ********************
//

procedure tDTA_Satz_C_Konstant.SetKontonummerEmpfaenger(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.C5_Kontonummer);
end;

//************** tDTA_Satz_C_Konstant.SetNameAuftraggeber ********************
//

procedure tDTA_Satz_C_Konstant.SetNameAuftraggeber(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C15_Name);
end;

//************** tDTA_Satz_C_Konstant.SetNameEmpfaenger ********************
//

procedure tDTA_Satz_C_Konstant.SetNameEmpfaenger(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C14a_Name);
end;

//************** tDTA_Satz_C_Konstant.SetSatzlaenge ********************
//

procedure tDTA_Satz_C_Konstant.SetSatzlaenge(const Value: integer);
begin
  if (Value >= _DTA_MinKonstanterTeil) and (Value <= _DTA_MaxKonstanterTeil) then
  begin
    _DTA_StringToArray(IntToStr(Value), true, fSatz.C1_Satzlaenge);
  end;
end;

//************** tDTA_Satz_C_Konstant.SetTextErgaenzung ********************
//

procedure tDTA_Satz_C_Konstant.SetTextErgaenzung(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.C7b_Txt_Ergaenzung);
end;

//************** tDTA_Satz_C_Konstant.SetTextschluessel ********************
//

procedure tDTA_Satz_C_Konstant.SetTextschluessel(const Value: string);
begin
  _DTA_StringToArray(Value, true, fSatz.C7a_Textschluessel);
end;

//************** tDTA_Satz_C_Konstant.SetVerwendungszweck ********************
//

procedure tDTA_Satz_C_Konstant.SetVerwendungszweck(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C16_Verwendungszweck);
end;

//************** tDTA_Satz_C_Konstant.SetVLJahr ********************
//

procedure tDTA_Satz_C_Konstant.SetVLJahr(const Value: integer);
begin
  _DTA_StringToArray(IntToStr(Value), true, fSatz.C7b_Txt_Ergaenzung[2]);
end;

//************** tDTA_Satz_C_Konstant.SetVLProzent ********************
//

procedure tDTA_Satz_C_Konstant.SetVLProzent(const Value: integer);
var
  dummyVLProzent: array[0..1] of char;
begin
  _DTA_StringToArray(IntToStr(Value), true, dummyVLProzent);
  _DTA_StrLCopy(fSatz.C7b_Txt_Ergaenzung, dummyVLProzent, SizeOf(dummyVLProzent));
end;

//************** tDTA_Satz_C_Konstant.SetWaehrung ********************
//

procedure tDTA_Satz_C_Konstant.SetWaehrung(const Value: _Waehrung);
begin
  fWaehrung := Value;
  if fWaehrung = Euro then
  begin
    fSatz.C17a_Waehrung := _DTA_A_12_Euro;
    BetragDM := 0;
  end
  else
  begin
    fSatz.C17a_Waehrung := _DTA_A_12_DM;
    BetragEuro := 0;
  end;
end;

//************** tDTA_Satz_C_Konstant.SetZahlungsart ********************
//

procedure tDTA_Satz_C_Konstant.SetZahlungsart(const Value: _Zahlungsarten);
var
  dummyZahlungsart: array[0..4] of char;
begin
  fZahlungsart := Value;
  case fZahlungsart of
    LS_Abbuchung:
      _DTA_StringToArray(_DTA_C_7_Lastschrift_Abbuchung, true, dummyZahlungsart);
    LS_Einzug:
      _DTA_StringToArray(_DTA_C_7_Lastschrift_Einzug, true, dummyZahlungsart);
    LS_POS_ec:
      _DTA_StringToArray(_DTA_C_7_Lastschrift_POS_ec, true, dummyZahlungsart);
    LS_POS_edc:
      _DTA_StringToArray(_DTA_C_7_Lastschrift_POS_edc, true, dummyZahlungsart);
    LS_POS_POZ:
      _DTA_StringToArray(_DTA_C_7_Lastschrift_POS_POZ, true, dummyZahlungsart);
    GS_Ueberweisung:
      _DTA_StringToArray(_DTA_C_7_Ueberweisungsgutschrift, true, dummyZahlungsart);
    LohnGehaltRente:
      _DTA_StringToArray(_DTA_C_7_LohnGehaltRente, true, dummyZahlungsart);
    VL:
      _DTA_StringToArray(_DTA_C_7_VL, true, dummyZahlungsart);
  end;
  _DTA_StrLCopy(fSatz.C7a_Textschluessel, dummyZahlungsart, SizeOf(dummyZahlungsart));
end;

{ tDTA_Satz_C_Variabel }

//************** tDTA_Satz_C_Variabel.Create ********************
//

constructor tDTA_Satz_C_Variabel.Create;
begin
  inherited Create;
  FillChar(fSatz, SizeOf(fSatz), _DTA_EmptySpace);
  Kennzeichen1 := _DTA_C_Kennzeichen_Empty_S;
  Kennzeichen2 := _DTA_C_Kennzeichen_Empty_S;
  Kennzeichen3 := _DTA_C_Kennzeichen_Empty_S;
  Kennzeichen4 := _DTA_C_Kennzeichen_Empty_S;
end;

//************** tDTA_Satz_C_Variabel.GetDaten1 ********************
//

function tDTA_Satz_C_Variabel.GetDaten1: string;
begin
  Result := Trim(fSatz.C25_Daten_1);
end;

//************** tDTA_Satz_C_Variabel.GetDaten2 ********************
//

function tDTA_Satz_C_Variabel.GetDaten2: string;
begin
  Result := Trim(fSatz.C27_Daten_2);
end;

//************** tDTA_Satz_C_Variabel.GetDaten3 ********************
//

function tDTA_Satz_C_Variabel.GetDaten3: string;
begin
  Result := Trim(fSatz.C29_Daten_3);
end;

//************** tDTA_Satz_C_Variabel.GetDaten4 ********************
//

function tDTA_Satz_C_Variabel.GetDaten4: string;
begin
  Result := Trim(fSatz.C31_Daten_4);
end;

//************** tDTA_Satz_C_Variabel.GetKennzeichen1 ********************
//

function tDTA_Satz_C_Variabel.GetKennzeichen1: string;
begin
  Result := Trim(fSatz.C24_Kennzeichen_1);
end;

//************** tDTA_Satz_C_Variabel.GetKennzeichen2 ********************
//

function tDTA_Satz_C_Variabel.GetKennzeichen2: string;
begin
  Result := Trim(fSatz.C26_Kennzeichen_2);
end;

//************** tDTA_Satz_C_Variabel.GetKennzeichen3 ********************
//

function tDTA_Satz_C_Variabel.GetKennzeichen3: string;
begin
  Result := Trim(fSatz.C28_Kennzeichen_3);
end;

//************** tDTA_Satz_C_Variabel.GetKennzeichen4 ********************
//

function tDTA_Satz_C_Variabel.GetKennzeichen4: string;
begin
  Result := Trim(fSatz.C30_Kennzeichen_4);
end;

//************** tDTA_Satz_C_Variabel.SetDaten1 ********************
//

procedure tDTA_Satz_C_Variabel.SetDaten1(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C25_Daten_1);
end;

//************** tDTA_Satz_C_Variabel.SetDaten2 ********************
//

procedure tDTA_Satz_C_Variabel.SetDaten2(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C27_Daten_2);
end;

//************** tDTA_Satz_C_Variabel.SetDaten3 ********************
//

procedure tDTA_Satz_C_Variabel.SetDaten3(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C29_Daten_3);
end;

//************** tDTA_Satz_C_Variabel.SetDaten4 ********************
//

procedure tDTA_Satz_C_Variabel.SetDaten4(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C31_Daten_4);
end;

//************** tDTA_Satz_C_Variabel.SetKennzeichen1 ********************
//

procedure tDTA_Satz_C_Variabel.SetKennzeichen1(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C24_Kennzeichen_1);
end;

//************** tDTA_Satz_C_Variabel.SetKennzeichen2 ********************
//

procedure tDTA_Satz_C_Variabel.SetKennzeichen2(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C26_Kennzeichen_2);
end;

//************** tDTA_Satz_C_Variabel.SetKennzeichen3 ********************
//

procedure tDTA_Satz_C_Variabel.SetKennzeichen3(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C28_Kennzeichen_3);
end;

//************** tDTA_Satz_C_Variabel.SetKennzeichen4 ********************
//

procedure tDTA_Satz_C_Variabel.SetKennzeichen4(const Value: string);
begin
  _DTA_StringToArray(Value, false, fSatz.C30_Kennzeichen_4);
end;

{ tDTA_Satz_C_Variabel_Item }

//************** tDTA_Satz_C_Variabel_Item.Create ********************
//

constructor tDTA_Satz_C_Variabel_Item.Create;
begin
  DatenSatz := tDTA_Satz_C_Variabel.Create;
  inherited Create;
end;

//************** tDTA_Satz_C_Variabel_Item.Destroy ********************
//

destructor tDTA_Satz_C_Variabel_Item.Destroy;
begin
  DatenSatz.Free;
  inherited Destroy;
end;

{ tDTA_Satz_C_Variabel_Liste }

//************** tDTA_Satz_C_Variabel_Liste.Destroy ********************
//

destructor tDTA_Satz_C_Variabel_Liste.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do
  begin
    tDTA_Satz_C_Variabel_Item(Items[i]).Free;
  end;
  inherited Destroy;
end;

{ tDTA_Satz_C }

//************** tDTA_Satz_C.Create ********************
//

constructor tDTA_Satz_C.Create;
begin
  inherited Create;
  KonstanterTeil := tDTA_Satz_C_Konstant.Create;
  VariablerTeil := tDTA_Satz_C_Variabel_Liste.Create;
end;

//************** tDTA_Satz_C.Destroy ********************
//

destructor tDTA_Satz_C.Destroy;
begin
  VariablerTeil.Free;
  KonstanterTeil.Free;
  inherited Destroy;
end;

//************** tDTA_Satz_C.SetNameAuftraggeber ********************
//

procedure tDTA_Satz_C.SetNameAuftraggeber(const Value: string);
begin
  fNameAuftraggeber := Value;
  SetVariablerTeil;
end;

//************** tDTA_Satz_C.SetNameEmpfaenger ********************
//

procedure tDTA_Satz_C.SetNameEmpfaenger(const Value: string);
begin
  fNameEmpfaenger := Value;
  SetVariablerTeil;
end;

//************** tDTA_Satz_C.SetVerwendungszweck ********************
//

procedure tDTA_Satz_C.SetVerwendungszweck(const Value: string);
begin
  fVerwendungszweck := Value;
  SetVariablerTeil;
end;

//************** tDTA_Satz_C.SetVariablerTeil ********************
//

procedure tDTA_Satz_C.SetVariablerTeil;
var
  dString: string;
begin
  // Alle Daten des aktuellen Datensatzes zurücksetzen
  VariablerTeil.Clear;
  //	for i := VariablerTeil.Count - 1 downto 0 do
  // 	tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[i]).Free;
  VariablerTeil.Pack;
  KonstanterTeil.Erweiterung := _DTA_MinErweiterungsteile;
  KonstanterTeil.Daten1 := '';
  KonstanterTeil.Daten2 := '';
  KonstanterTeil.Kennzeichen1 := _DTA_C_Kennzeichen_Empty_S;
  KonstanterTeil.Kennzeichen2 := _DTA_C_Kennzeichen_Empty_S;
  KonstanterTeil.Satzlaenge := _DTA_MinKonstanterTeil;
  // Empfänger verwalten
  dString := _DTA_CompatibleString(NameEmpfaenger, false);
  KonstanterTeil.NameEmpfaenger := dString;
  Delete(dString, 1, Length(KonstanterTeil.NameEmpfaenger));
  NewErweiterungsteil(dString, _DTA_C_Kennzeichen_NameEmpfaenger_S);
  // Verwendungszweck
  dString := _DTA_CompatibleString(Verwendungszweck, false);
  KonstanterTeil.Verwendungszweck := dString;
  Delete(dString, 1, Length(KonstanterTeil.Verwendungszweck));
  NewErweiterungsteil(dString, _DTA_C_Kennzeichen_Verwendungszweck_S);
  // Auftraggeber
  dString := _DTA_CompatibleString(NameAuftraggeber, false);
  KonstanterTeil.NameAuftraggeber := dString;
  Delete(dString, 1, Length(KonstanterTeil.NameAuftraggeber));
  NewErweiterungsteil(dString, _DTA_C_Kennzeichen_NameAuftraggeber_S);
end;

//************** tDTA_Satz_C.NewErweiterungsTeil ********************
//

procedure tDTA_Satz_C.NewErweiterungsTeil(const Value, Kennzeichen: string);
var
  dString: string;
  VariabelItem: tDTA_Satz_C_Variabel_Item;
begin
  dString := Trim(Value);
  while (Length(dString) > 0) and (KonstanterTeil.Erweiterung <= _DTA_MaxErweiterungsteile) do
  begin
    KonstanterTeil.Erweiterung := KonstanterTeil.Erweiterung + 1;
    case KonstanterTeil.Erweiterung of
      1:
        begin
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          KonstanterTeil.Kennzeichen1 := Kennzeichen;
          KonstanterTeil.Daten1 := dString;
          Delete(dString, 1, Length(KonstanterTeil.Daten1));
        end;
      2:
        begin
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          KonstanterTeil.Kennzeichen2 := Kennzeichen;
          KonstanterTeil.Daten2 := dString;
          Delete(dString, 1, Length(KonstanterTeil.Daten2));
        end;
      3, 7, 11, 15:
        begin
          VariabelItem := tDTA_Satz_C_Variabel_Item.Create;
          VariablerTeil.Add(VariabelItem);
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          with tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[KonstanterTeil.Erweiterung div 4]).Datensatz do
          begin
            Kennzeichen1 := Kennzeichen;
            Daten1 := dString;
            Delete(dString, 1, Length(Daten1));
          end;
        end;
      4, 8, 12:
        begin
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          with tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[(KonstanterTeil.Erweiterung div 4) - 1]).Datensatz do
          begin
            Kennzeichen2 := Kennzeichen;
            Daten2 := dString;
            Delete(dString, 1, Length(Daten2));
          end;
        end;
      5, 9, 13:
        begin
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          with tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[(KonstanterTeil.Erweiterung div 4) - 1]).Datensatz do
          begin
            Kennzeichen3 := Kennzeichen;
            Daten3 := dString;
            Delete(dString, 1, Length(Daten3));
          end;
        end;
      6, 10, 14:
        begin
          KonstanterTeil.Satzlaenge := KonstanterTeil.Satzlaenge + _DTA_ErweiterungsTeil;
          with tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[(KonstanterTeil.Erweiterung div 4) - 1]).Datensatz do
          begin
            Kennzeichen4 := Kennzeichen;
            Daten4 := dString;
            Delete(dString, 1, Length(Daten4));
          end;
        end;
    end;
  end;
end;

//************** tDTA_Satz_C.SaveToStream ********************
//

procedure tDTA_Satz_C.SaveToStream(Stream: TStream);
var
  i: integer;
begin
  Stream.WriteBuffer(KonstanterTeil.fSatz, SizeOf(KonstanterTeil.fSatz));
  for i := 0 to VariablerTeil.Count - 1 do
  begin
    Stream.WriteBuffer(tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[i]).Datensatz.fSatz,
      SizeOf(tDTA_Satz_C_Variabel_Item(VariablerTeil.Items[i]).Datensatz.fSatz));
  end;
end;

{ tDTA_Satz_C_Liste }

//************** tDTA_Satz_C_Liste.Destroy ********************
//

destructor tDTA_Satz_C_Liste.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do
  begin
    tDTA_Satz_C(Items[i]).Free;
  end;
  inherited Destroy;
end;

{ TmpsDTAUS }

//********** TmpsDTAUS.Create **********
// Constructor einer neuen TmpsDTAUS-Komponente

constructor TmpsDTAUS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fAktuellerDatensatz := tDTA_AktuellerDatensatz.Create;
  fVorsatz := tDTA_Satz_A.Create;
  fEinzeldatensaetze := tDTA_Satz_C_Liste.Create;
  fNachsatz := tDTA_Satz_E.Create;
  fDateiname := _DTA_Dateiname;
  fRecNo := 0;
  fEOF := true;
  fBOF := true;
  fNachsatzaktualisierung := true;
end;

//********** TmpsDTAUS.Append **********
// Anhängen eines neuen Datensatz C

procedure TmpsDTAUS.Append;
begin
  // AktuellerDatensatz mit Standardwerten belegen
  with fAktuellerDatensatz do
  begin
    BLZ := 0;
    KontoNummer := '';
    Zahlungsart := LS_Einzug;
    InterneNummer := 0;
    fWaehrung := fVorsatz.Waehrung;
    Betrag := 0;
    Name := '';
    Verwendungszweck := '';
    fRecNo := 0;
  end;
  {
   fNachsatz.Anzahl := fNachsatz.Anzahl + 1; // Anzahl der Datensätze im konstanten Teil
   Einzeldatensatz := tDTA_Satz_C.Create;		// Neuen Einzeldatensatz C anlegen
   fEinzeldatensaetze.Add(Einzeldatensatz);  // zur TList der Einzeldatensätze hinzufügen
   fAktuellerDatensatz.fRecNo := fNachsatz.Anzahl; // und zum aktuellen Datensatz machen
   LoadAktuellerDatensatz; // Daten des letzten Datensatzes laden
  }
end;

//************** TmpsDTAUS.Datensatzaktualisierung ********************
//

procedure TmpsDTAUS.Datensatzaktualisierung;
var
  i: integer;
begin
  for i := 0 to fEinzeldatensaetze.Count - 1 do
  begin
    with tDTA_Satz_C(fEinzeldatensaetze.Items[i]) do
    begin
      KonstanterTeil.BLZErstbeauftragt := BLZ;
      KonstanterTeil.KontonummerAuftraggeber := Kontonummer;
      KonstanterTeil.NameAuftraggeber := Kundenname;
    end;
  end;
end;

//************** TmpsDTAUS.Destroy ********************
//

destructor TmpsDTAUS.Destroy;
begin
  fNachsatz.Free;
  fEinzeldatensaetze.Free;
  fVorsatz.Free;
  fAktuellerDatensatz.Free;
  inherited Destroy;
end;

//************** TmpsDTAUS.GetAusfuehrungstermin ********************
//

function TmpsDTAUS.GetAusfuehrungstermin: TDateTime;
begin
  Result := fVorsatz.Ausfuehrungstermin;
end;

//************** TmpsDTAUS.GetBLZ ********************
//

function TmpsDTAUS.GetBLZ: integer;
begin
  Result := fVorsatz.BLZ;
end;

//************** TmpsDTAUS.GetDatensaetze ********************
//

function TmpsDTAUS.GetDatensaetze: integer;
begin
  Result := fNachsatz.Anzahl;
end;

//************** TmpsDTAUS.GeTmpsDTAUSString ********************
//

function TmpsDTAUS.GeTmpsDTAUSString: string;
var
  mStream: TMemoryStream;
  s: PChar;
begin
  mStream := TMemoryStream.Create;
  SaveToStream(mStream);
  mStream.Position := 0;
  s := StrAlloc(mStream.Size + 1);
  mStream.Read(s^, mStream.Size);
  s[mStream.Size] := #0;
  mStream.Free;
  Result := s;
  StrDispose(s);
end;

//************** TmpsDTAUS.GetErstellungsdatum ********************
//

function TmpsDTAUS.GetErstellungsdatum: TDateTime;
begin
  Result := fVorsatz.Erstellungsdatum;
end;

//************** TmpsDTAUS.GetKennzeichen ********************
//

function TmpsDTAUS.GetKennzeichen: string;
begin
  Result := fVorsatz.Kennzeichen;
end;

//************** TmpsDTAUS.GetKontonummer ********************
//

function TmpsDTAUS.GetKontonummer: string;
begin
  Result := fVorsatz.Kontonummer;
end;

//************** TmpsDTAUS.GetKundendiskette ********************
//

function TmpsDTAUS.GetKundendiskette: boolean;
begin
  Result := fVorsatz.Kundendiskette;
end;

//************** TmpsDTAUS.GetLastschriften ********************
//

function TmpsDTAUS.GetLastschriften: boolean;
begin
  Result := fVorsatz.Lastschriften;
end;

//************** TmpsDTAUS.GetReferenznummer ********************
//

function TmpsDTAUS.GetReferenznummer: string;
begin
  Result := fVorsatz.Referenznummer;
end;

//************** TmpsDTAUS.GetSummeBLZ ********************
//

function TmpsDTAUS.GetSummeBLZ: extended;
begin
  Result := fNachsatz.SummeBLZ;
end;

//************** TmpsDTAUS.GetSummeDM ********************
//

function TmpsDTAUS.GetSummeDM: currency;
begin
  Result := fNachsatz.SummeDM;
end;

//************** TmpsDTAUS.GetSummeEuro ********************
//

function TmpsDTAUS.GetSummeEuro: currency;
begin
  Result := fNachsatz.SummeEuro;
end;

//************** TmpsDTAUS.GetSummeKontonummern ********************
//

function TmpsDTAUS.GetSummeKontonummern: extended;
begin
  Result := fNachsatz.SummeKontonummern;
end;

//************** TmpsDTAUS.GetWaehrung ********************
//

function TmpsDTAUS.GetWaehrung: _Waehrung;
begin
  Result := fVorsatz.Waehrung;
end;

//************** TmpsDTAUS.DoNachsatzAktualisierung ********************
//

procedure TmpsDTAUS.DoNachsatzAktualisierung(const Calculate: boolean);
var
  i: integer;
begin
  fNachsatz.SummeDM := 0;
  fNachsatz.SummeEuro := 0;
  fNachsatz.SummeBLZ := 0;
  fNachsatz.SummeKontonummern := 0;
  fNachsatz.Anzahl := fEinzeldatensaetze.Count;
  if Calculate then
  begin
    for i := 0 to fEinzeldatensaetze.Count - 1 do
    begin
      with tDTA_Satz_C(fEinzeldatensaetze.Items[i]) do
      begin
        fNachsatz.SummeDM := fNachsatz.SummeDM + KonstanterTeil.BetragDM;
        fNachsatz.SummeEuro := fNachsatz.SummeEuro + KonstanterTeil.BetragEuro;
        fNachsatz.SummeBLZ := fNachsatz.SummeBLZ + KonstanterTeil.BLZEndbeguenstigt;
        fNachsatz.SummeKontonummern := fNachsatz.SummeKontonummern + StrToInt64(KonstanterTeil.KontonummerEmpfaenger);
      end;
    end;
  end;
end;

//************** TmpsDTAUS.Post ********************
//

procedure TmpsDTAUS.Post;
begin
  WriteAktuellerDatensatz;
end;

//************** TmpsDTAUS.SaveToDisk ********************
//

procedure TmpsDTAUS.SaveToDisk;
var
  mStream: TMemoryStream;
begin
  mStream := TMemoryStream.Create;
  SaveToStream(mStream);
  mStream.SaveToFile(fDateiName);
  mStream.Free;
end;

//************** TmpsDTAUS.SaveToStream ********************
//

procedure TmpsDTAUS.SaveToStream(Stream: TStream);
var
  i: integer;
begin
  DoNachsatzaktualisierung(true);
  Stream.WriteBuffer(fVorsatz.fSatz, SizeOf(fVorsatz.fSatz));
  for i := 0 to fEinzeldatensaetze.Count - 1 do
  begin
    tDTA_Satz_C(fEinzeldatensaetze.Items[i]).SaveToStream(Stream);
  end;
  Stream.WriteBuffer(fNachsatz.fSatz, SizeOf(fNachsatz.fSatz));
end;

//************** TmpsDTAUS.SetAusfuehrungstermin ********************
//

procedure TmpsDTAUS.SetAusfuehrungstermin(const Value: TDateTime);
begin
  fVorsatz.Ausfuehrungstermin := Value;
end;

//************** TmpsDTAUS.SetBLZ ********************
//

procedure TmpsDTAUS.SetBLZ(const Value: integer);
begin
  fVorsatz.BLZ := Value;
  Datensatzaktualisierung;
end;

//************** TmpsDTAUS.SetErstellungsdatum ********************
//

procedure TmpsDTAUS.SetErstellungsdatum(const Value: TDateTime);
begin
  fVorsatz.Erstellungsdatum := Value;
end;

//************** TmpsDTAUS.SetKennzeichen ********************
//

procedure TmpsDTAUS.SetKennzeichen(const Value: string);
begin
end;

//************** TmpsDTAUS.SetKontonummer ********************
//

procedure TmpsDTAUS.SetKontonummer(const Value: string);
begin
  fVorsatz.Kontonummer := Value;
  Datensatzaktualisierung;
end;

//************** TmpsDTAUS.SetKundendiskette ********************
//

procedure TmpsDTAUS.SetKundendiskette(const Value: boolean);
begin
  fVorsatz.Kundendiskette := Value;
end;

//************** TmpsDTAUS.SetKundenname ********************
//

procedure TmpsDTAUS.SetKundenname(const Value: string);
begin
  fVorsatz.Kundenname := Value;
  fKundenname := Value;
  Datensatzaktualisierung;
end;

//************** TmpsDTAUS.SetLastschriften ********************
//

procedure TmpsDTAUS.SetLastschriften(const Value: boolean);
begin
  fVorsatz.Lastschriften := Value;
end;

//************** TmpsDTAUS.SetReferenznummer ********************
//

procedure TmpsDTAUS.SetReferenznummer(const Value: string);
begin
  fVorsatz.Referenznummer := Value;
end;

//************** TmpsDTAUS.SetWaehrung ********************
//

procedure TmpsDTAUS.SetWaehrung(const Value: _Waehrung);
var
  i: integer;
begin
  fVorsatz.Waehrung := Value;
  for i := 0 to fEinzeldatensaetze.Count - 1 do
  begin
    with tDTA_Satz_C(fEinzeldatensaetze.Items[i]) do
    begin
      KonstanterTeil.BetragDM := 0;
      KonstanterTeil.BetragEuro := 0;
      KonstanterTeil.Waehrung := fVorsatz.Waehrung;
    end;
  end;
  DoNachsatzAktualisierung(fNachsatzaktualisierung);
end;

//************** TmpsDTAUS.GetNachsatzaktualisierung ********************
//

function TmpsDTAUS.GetNachsatzaktualisierung: boolean;
begin
  Result := fNachsatzaktualisierung;
end;

//************** TmpsDTAUS.SetNachsatzaktualisierung ********************
//

procedure TmpsDTAUS.SetNachsatzaktualisierung(const Value: boolean);
begin
  if Value <> fNachsatzaktualisierung then
  begin
    DoNachsatzaktualisierung(Value);
  end;
  fNachsatzaktualisierung := Value;
end;

//************** TmpsDTAUS.WriteAktuellerDatensatz ********************
// Aktuellen Datensatz in DTA-Struktur aufnehmen

procedure TmpsDTAUS.WriteAktuellerDatensatz;
var
  Einzeldatensatz: tDTA_Satz_C;
begin
  // Neuer Datensatz?
  if fAktuellerDatenSatz.fRecNo = 0 then
  begin
    fNachsatz.Anzahl := fNachsatz.Anzahl + 1;     // Anzahl der Datensätze im konstanten Teil
    Einzeldatensatz := tDTA_Satz_C.Create;        // Neuen Einzeldatensatz C anlegen
    fEinzeldatensaetze.Add(Einzeldatensatz);      // zur TList der Einzeldatensätze hinzufügen
    fAktuellerDatensatz.fRecNo := fNachsatz.Anzahl; // und zum aktuellen Datensatz machen
  end;

  if (fAktuellerDatensatz.fRecNo > 0) and (fAktuellerDatensatz.fRecNo <= fEinzeldatensaetze.Count) then
  begin
    with tDTA_Satz_C(fEinzeldatensaetze.Items[fAktuellerDatensatz.fRecNo - 1]) do
    begin
      KonstanterTeil.BLZEndbeguenstigt := fAktuellerDatenSatz.fBLZ;
      KonstanterTeil.KontonummerEmpfaenger := fAktuellerDatenSatz.fKontoNummer;
      KonstanterTeil.Zahlungsart := fAktuellerDatenSatz.fZahlungsart;
      KonstanterTeil.InterneNummer := fAktuellerDatenSatz.fInterneNummer;
      KonstanterTeil.BetragDM := fAktuellerDatenSatz.fBetragDM;
      KonstanterTeil.BetragEuro := fAktuellerDatenSatz.fBetragEuro;
      KonstanterTeil.Waehrung := fAktuellerDatenSatz.fWaehrung;
      NameEmpfaenger := fAktuellerDatenSatz.fName;
      Verwendungszweck := fAktuellerDatenSatz.fVerwendungszweck;
      KonstanterTeil.BLZErstbeauftragt := fVorSatz.BLZ;
      KonstanterTeil.KontonummerAuftraggeber := fVorSatz.Kontonummer;
      NameAuftraggeber := fVorsatz.Kundenname;
      DoNachsatzAktualisierung(fNachsatzaktualisierung);
    end;
  end;
end;

//********** DTAUS.Clear **********
// Löscht alle Datensätze

procedure TmpsDTAUS.Clear;
begin
  fAktuellerDatensatz.Free;
  fAktuellerDatensatz := tDTA_AktuellerDatensatz.Create;
  fVorsatz.Free;
  fVorsatz := tDTA_Satz_A.Create;
  fEinzeldatensaetze.Free;
  fEinzeldatensaetze := tDTA_Satz_C_Liste.Create;
  fNachsatz.Free;
  fNachsatz := tDTA_Satz_E.Create;
  fDateiname := _DTA_Dateiname;
  fRecNo := 0;
  fEOF := true;
  fBOF := true;
  DoNachsatzaktualisierung(true);
end;

{ tDTA_AktuellerDatensatz }

//************** tDTA_AktuellerDatensatz.GetBetrag ********************
//

function tDTA_AktuellerDatensatz.GetBetrag: currency;
begin
  if fWaehrung = DM then
  begin
    Result := fBetragDM;
  end
  else
  begin
    Result := fBetragEuro;
  end;
end;

//************** tDTA_AktuellerDatensatz.SetBetrag ********************
//

procedure tDTA_AktuellerDatensatz.SetBetrag(const Value: currency);
begin
  if fWaehrung = DM then
  begin
    fBetragDM := Value;
    fBetragEuro := 0;
  end
  else
  begin
    fBetragEuro := Value;
    fBetragDM := 0;
  end;
end;

//************** tDTA_AktuellerDatensatz.SetBLZ ********************
//

procedure tDTA_AktuellerDatensatz.SetBLZ(const Value: integer);
begin
  fBLZ := Value;
end;

//************** tDTA_AktuellerDatensatz.SetInterneNummer ********************
//

procedure tDTA_AktuellerDatensatz.SetInterneNummer(const Value: extended);
begin
  fInterneNummer := Int(Value);
end;

//************** tDTA_AktuellerDatensatz.SetZahlungsart ********************
//

procedure tDTA_AktuellerDatensatz.SetZahlungsart(const Value: _Zahlungsarten);
begin
  fZahlungsart := Value;
end;

{
procedure TmpsDTAUS.Cancel;
begin
 LoadAktuellerDatensatz;	// Letzten aktuellen Datensatz wieder laden
end;

procedure TmpsDTAUS.Next;
begin
 if fAktuellerDatensatz.fRecNo < fNachsatz.Anzahl then
  fAktuellerDatensatz.fRecNo := fAktuellerDatensatz.fRecNo + 1;
 LoadAktuellerDatensatz;
end;

procedure TmpsDTAUS.Prior;
begin
 if fAktuellerDatensatz.fRecNo > 1 then
  fAktuellerDatensatz.fRecNo := fAktuellerDatensatz.fRecNo - 1;
 LoadAktuellerDatensatz;
end;

procedure TmpsDTAUS.Last;
begin
 fAktuellerDatensatz.fRecNo := fNachsatz.Anzahl;
 LoadAktuellerDatensatz;
end;

procedure TmpsDTAUS.First;
begin
 if fNachsatz.Anzahl > 0 then
  fRecNo := 1
 else
  fRecNo := 0;
 LoadAktuellerDatensatz;
end;

procedure TmpsDTAUS.Delete;
begin
 if fNachsatz.Anzahl > 0 then
 begin
  fNachsatz.Anzahl := fNachsatz.Anzahl - 1;
  fEinzeldatensaetze.Delete(fAktuellerDatensatz.fRecNo - 1);
   fEinzeldatensaetze.Pack;
   fAktuellerDatensatz.fRecNo := fAktuellerDatensatz.fRecNo - 1;
   LoadAktuellerDatensatz;
 end;
end;

procedure TmpsDTAUS.LoadAktuellerDatensatz;
begin
 if fRecNo > 0 then
  with tDTA_Satz_C(fEinzeldatensaetze.Items[fRecNo - 1]) do
   with fAktuellerDatensatz do
    begin
    fBLZ := KonstanterTeil.BLZEndbeguenstigt;
      fKontoNummer := KonstanterTeil.KontonummerEmpfaenger;
      fZahlungsart := KonstanterTeil.Zahlungsart;
      fInterneNummer := KonstanterTeil.InterneNummer;
      fBetragDM := KonstanterTeil.BetragDM;
      fBetragEuro := KonstanterTeil.BetragEuro;
      fWaehrung := KonstanterTeil.Waehrung;
      fName := KonstanterTeil.NameEmpfaenger;
      fVerwendungszweck := KonstanterTeil.Verwendungszweck;
   end;
end;

}

end.

