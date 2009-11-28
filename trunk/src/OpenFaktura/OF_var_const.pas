{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Globale Variablen- und Typdeklarationen für allen Module          }
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
  - Diese Unit durch eine Singleton Klasse ersetzen.

  ISSUES, NOTES:
  -

  HISTORY:
  13.01.2003 - Version 1.0.0.48 released Jan Pokrandt
  26.04.2003 - Version 1.0.0.53 released Jan Pokrandt
  01.07.2003 - Anpassungen an MandantRec
  27.07.2003 - diverse Änderungen im Shop-Bereich
  30.07.2003 - KL Hersteller-ID bei tShopArtikel hinzugefügt
  30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)
  28.11.2009 - UD:
               - Konstante für die Konfigurationsdatei hinzugefügt und
                 von "CAO32_DB.cfg" in "OF_CFG.INI" umbenannt.
               - Globale Variable "APP_PATH" hinzugefügt.
               - Konstante "CFG_FORMULAR_FILENAME", "CFG_PLZ_FILENAME",
                 "CFG_BLZ_FILENAME", "CFG_LAND_FILENAME" hinzugefügt.
*******************************************************************************)

unit OF_Var_Const;

{$I OF.INC}

interface

uses
  SysUtils;

type
  tShopArtikelTyp = (saArtikel, saTKosten, saMMZuschlag);

  TMandantRec = Record
    Name: String;
    Server: String;
    User: String;
    Pass: String;
    DB: String;
    Port: Integer;
  end;

  TShopRePosOpt = Record
    Name: String;
    Value: String;
    //Aufpreis : Double;
  end;

  TShopPositionen = Record
    Menge: Double;
    ME: String;
    Modell: String;
    Name: String;
    Preis: Double;
    MwSt: Double;
    MwStID: Integer;
    SArtID: Integer;
    ArtTyp: tShopArtikelTyp;

    Opt: Array of tShopRePosOpt
  end;

  TShopSummen = Record
    Titel,
    Value: String;
  end;

  TShopRech = Record
    // Kopf
    Rech_ID        : Integer;
    Kun_ID         : Integer;
    Datum          : tDateTime;
    Waehrung       : String;
    Kurs           : Double;
    // diverses
    Tele,
    Mail           : String;
    Geschlecht     : Char;
    // Rechnungsanschrift
    R_Firma,
    //R_Name,
    R_LName,
    R_FName,
    R_Strasse,
    R_PLZ,
    R_Ort,
    R_BLand,
    R_Land,
    //Lieferanschrift
    L_Firma,
    //L_Name,
    L_LName,
    L_FName,
    L_Strasse,
    L_PLZ,
    L_Ort,
    L_BLand,
    L_Land         : String;

    Kun_GebDatum   : tDateTime;

    //Positionen
    Pos            : Array of tShopPositionen;

    //Summen
    Summen         : Array of tShopSummen;

    //Versandkosten  : Double;

    UserKomment    : String;
    Status         : Integer;

    PaymentMethod  : String;
    PaymentClass   : String;

    ShippingMethod : String;
    ShippingClass  : String;

    BANK_NAME,
    BANK_BLZ,
    BANK_KTO,
    BANK_INH       : String;
    BANK_STATUS    : Integer;

    VAT_ID         : String;  //JP19042005
    VAT_ID_EMPTY   : Boolean; //JP19042005
  end;

  TLangTxt = Record
    SprachID   : Integer;
    SprachCode : String;
    SprachName : String;
    Name       : String; //Prod.-Name
    URL        : String; //Prod.-URL
    LANGText   : String; //Prod.-Beschreibung

    KURZText   : String; //Prod.-Beschreibung

    META_TITLE : String;
    META_KEY   : String;
    META_DESC  : String;

    META_TITLE_EMPTY : Boolean;
    META_KEY_EMPTY   : Boolean;
    META_DESC_EMPTY  : Boolean;
  end;

  TShopArtikel = Record
    ID         : Integer;
    Menge      : Double;
    Modell     : String;
    Bild       : String;
    Bild_M     : String;
    Bild_G     : String;
    PreisN     : Double; // Netto
    //PreisB     : Double; // Brutto
    Gewicht    : Double;
    Status     : Integer;
    //MwSt       : Double;
    MwStID     : Integer;
    Hersteller : Integer;
    DatErst    : tDateTime;
    DatMod     : tDateTime;
    DatAvi     : tDateTime;
    MeVK       : Integer;
    Txt        : Array of tLangTxt;


    USER       : Array[1..10] of String;
    USER_EMPTY : Array[1..10] of Boolean;

    EAN        : String;
    EAN_EMPTY  : Boolean;

    WGR        : Integer; // -1 = EMPTY

    INFO       : String;
    INFO_EMPTY : Boolean;

    EK         : Double;
    VK1        : Double;
    VK2        : Double;
    VK3        : Double;
    VK4        : Double;
    VK5        : Double;

    EK_EMPTY  : Boolean;
    VK1_EMPTY : Boolean;
    VK2_EMPTY : Boolean;
    VK3_EMPTY : Boolean;
    VK4_EMPTY : Boolean;
    VK5_EMPTY : Boolean;
  end;

  TShopKunde = Record
    ID         : Integer;
    //VName      : String;
    //Name       : String;
    LName      : String;  // -> NAME3
    FName      : String;  // -> NAME2
    Firma      : String;  // -> NAME1

    Strasse    : String;
    Land       : String;
    PLZ        : String;
    Ort        : String;


    PR_EBENE   : Integer;
    GebDatum   : tDateTime;
    Geschlecht : Char;
    eMail      : String;
    Tele       : String;
    Fax        : String;
    KundeSeit  : tDateTime;

    VAT_ID         : String;  //JP19042005
    VAT_ID_EMPTY   : Boolean; //JP19042005

    // Default-Anschrift
    //L_VName    : String;
    //L_Name     : String;
    //L_LName    : String;
    //L_FName    : String;
    //L_Firma    : String;
    //L_Strasse  : String;
    //L_Ort      : String;
    //L_PLZ      : String;
    //L_Land     : String;
  end;


  TShopKatDescr = Record
    SprachID   : Integer;
    SprachCode : String;
    SprachName : String;
    Name       : String; //Kat.-Name
    Descr      : String  //Kat.-Beschreibung JP20072005
  end;

  TShopKatalog = Record
    ID           : Integer;
    ParentID     : Integer;
    ImageUrl     : String;
    SortOrder    : Integer;
    DateAdded    : tDateTime;
    LastModified : tDateTime;
    Descr        : array of tShopKatDescr;
    ProdList     : array of Integer;
  end;


  TShopHerDescr = Record
    SprachID        : Integer;
    SprachCode      : String;
    SprachName      : String;
    HERSTELLER_URL  : String;
    URL_CLICKED     : Integer;
    DATE_LAST_CLICK : tDateTime;
  end;

  TShopHersteller = Record
    ID           : Integer;
    Hersteller_Name  : String;
    HERSTELLER_IMAGE : String;
    DateAdded    : tDateTime;
    LastModified : tDateTime;

    Descr        : array of tShopHerDescr;
    //ProdList     : array of Integer;
  end;

  TOnUpdateStatusBar = procedure(SuchZeit, Datensatz, Sortierung,
                                 Erstellt, Geaendert: String) of object;

  TDBUserRechte = (urCreate, urDrop, urAlter, urIndex, urSelect, urInsert,
                   urUpdate, urDelete);

  TSDBUserRechte = set of TDBUserRechte;


const
  GNU: Boolean = True;
  CFG_FILENAME = 'OF_CFG.INI'; //28.11.09-ud.
  CFG_FORMULAR_FILENAME = 'formulare.of'; //28.11.09-ud.
  CFG_PLZ_FILENAME = 'plz.of'; //28.11.09-ud.
  CFG_BLZ_FILENAME = 'blz.of'; //28.11.09-ud.
  CFG_LAND_FILENAME = 'land.of'; //28.11.09-ud.

  BANK1         = 1201;
  KASSE1        = 1301;

  VK_AGB        = 1;
  VK_AGB_EDI    = 11; MOD_VK_AGB_EDI    = 11;

  VK_LIEF       = 2;
  VK_LIEF_EDI   = 12; MOD_VK_LIEF_EDI   = 12;

  VK_RECH       = 3;
  VK_RECH_EDI   = 13; MOD_VK_RECH_EDI   = 13;
  VK_WKRE_EDI   = 23; MOD_VK_WKRE_EDI   = 23; // wiederkehrende Rechnungen
  VK_KASSE      = 24;

  //VK-Gutschrift
  VK_GS         = 4;  MOD_VK_GS_EDI     = 14;
  VK_GS_EDI     = 14;

  //EK-Rechnung
  EK_RECH       = 5;
  EK_RECH_EDI   = 15; MOD_EK_RECH_EDI   = 15;

  //EK-Bestellung
  EK_BEST       = 6;
  EK_BEST_EDI   = 16; MOD_EK_BEST_EDI   = 16;

  //Preisanfrage
  EK_PRAF       = 7;
  EK_PRAF_EDI   = 17; MOD_EK_PRAF_EDI   = 17;

  //Auftrag
  VK_AUF        = 8;
  VK_AUF_EDI    = 18; MOD_VK_AUF_EDI    = 18;

  //Auftragsbestätigung
  VK_AB         = 9;
  VK_AB_EDI     = 19;

  // Modul-ID's bzw. Tabellen-ID's

  KRD_NUM_KEY   = 30;
  DEB_NUM_KEY   = 31;

  KRD_OPOS      = 40;
  DEB_OPOS      = 41;

  MOD_ADRESSEN  = 50;  // Tabelle ADRESSEN
  MOD_ADDR_LIEF = 51;  // Tabelle ADRESSEN_LIEF
  MOD_ADDR_ASP  = 52;  // Tabelle ADRESSEN_ASP

  MOD_ADDR_LIST = 54;

  MOD_ARTIKEL   = 55;
  MOD_ART_SLIST = 56;
  MOD_ART_LTEXT = 57;
  MOD_ART_LIST  = 59;

  MOD_KFZ       = 60;
  MOD_KFZ_LST   = 61;
  MOD_MITARB    = 65;
  MOD_VERTR     = 70;
  MOD_NOTIZ     = 75;

  KAS_BUCH      = 90; //50;
  MAHNUNG       = 91; //60;

  TEXTVERARB    = 97;
  ARTNUM_KEY    = 98;
  KUNNUM_KEY    = 99;

  UEBERWEISUNG  = 110;

  MOD_INV_ZAELLISTE = 200;
  MOD_INV_WERTLISTE = 201;


  CAO_TABELLEN_V109: array [0..42] of String = (
    'ADRESSEN',
    'ADRESSEN_LIEF',
    'ADRESSEN_MERK',
    'ADRESSEN_TO_MERK',
    'ANSPRECHPARTNER',     // bis 1.09
    'ARTIKEL',
    'ARTIKEL_INVENTUR',
    'ARTIKEL_KAT',
    'ARTIKEL_LTEXT',
    'ARTIKEL_MERK',
    'ARTIKEL_PREIS',
    'ARTIKEL_SERNUM',
    'ARTIKEL_STUECKLIST',
    'ARTIKEL_TO_MERK',
    'ARTIKEL_TO_KAT',
    'BLZ',
    'EXPORT',
    'FIBU_BANK',
    'FIBU_KASSE',
    'FIRMA',
    'HERSTELLER',
    'HERSTELLER_INFO',
    'INFO',
    'INVENTUR',
    'JOURNAL',
    'JOURNALPOS',
    'KFZ',
    'LAND',
    'LINK',
    'MITARBEITER',
    'PIM_AUFGABEN',
    'PIM_KONTAKTE',
    'PIM_TERMINE',
    'RABATTGRUPPEN',
    'REGISTERY',           //bis 1.09
    'SCHRIFTVERKEHR',
    'SPRACHEN',
    'UEBERWEISUNGEN',
    'VERTRAGG',
    'VERTRAGPOS',
    'VERTRETER',
    'WARENGRUPPEN',
    'WARTUNG'
  );


  CAO_TABELLEN_V100: array [0..53] of String = (
    'ADRESSEN',
    'ADRESSEN_ASP',      //neu ab 1.10
    'ADRESSEN_LIEF',
    'ADRESSEN_MERK',
    'ADRESSEN_TO_MERK',
    'ARTIKEL',
    'ARTIKEL_BDATEN',    //neu ab 1.10
    'ARTIKEL_ETIKETT',   //neu ab 1.10
    'ARTIKEL_INVENTUR',
    'ARTIKEL_KAT',
    'ARTIKEL_LTEXT',
    'ARTIKEL_MERK',
    'ARTIKEL_PREIS',
    'ARTIKEL_SERNUM',
    'ARTIKEL_STUECKLIST',
    'ARTIKEL_TO_MERK',
    'ARTIKEL_TO_KAT',
    'BENUTZERRECHTE',    //neu ab 1.10
    'BLZ',
    'EXPORT',
    'FIBU_BANK',
    'FIBU_KASSE',
    'FIRMA',
    'HERSTELLER',
    'HERSTELLER_INFO',
    'INFO',
    'INVENTUR',
    'JOURNAL',
    'JOURNALPOS',
    'JOURNALPOS_SERNUM', //neu 1.10
    'KFZ',
    'LAND',
    'LINK',
    'MAHNUNG',           //neu 1.10
    'MAIL',              //neu 1.10
    'MAIL_ADRESSEN',     //neu 1.10
    'MAIL_ANHANG',       //neu 1.10
    'MAIL_KONTEN',       //neu 1.10
    'MAIL_ORDNER',       //neu 1.10
    'MAIL_REGELN',       //neu 1.10
    'MITARBEITER',
    'PIM_AUFGABEN',
    'PIM_KONTAKTE',
    'PIM_TERMINE',
    'RABATTGRUPPEN',
    'REGISTRY',          //ab 1.10
    'SCHRIFTVERKEHR',
    'SPRACHEN',
    'UEBERWEISUNGEN',
    'VERTRAGG',
    'VERTRAGPOS',
    'VERTRETER',
    'WARENGRUPPEN',
    'WARTUNG'
  );

var
  APP_PATH: string; //28.11.09-ud.

implementation

initialization
  APP_PATH := ExtractFilePath(ParamStr(0));

finalization

end.

