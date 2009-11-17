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
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_InventurMakeArtikel;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls,
  ComCtrls, StdCtrls;

type
  TInventurMakeArtikelForm = class(TForm)
    Label1: TLabel;
    PB1: TProgressBar;
    Timer1: TTimer;
    Query1: TZQuery;
    Query1ARTIKEL_ID: TIntegerField;
    Query1MENGE_DIFF: TFloatField;
    Query1STATUS: TIntegerField;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    { TODO : Query Event Progress gibt es nicht mehr } //17.10.09-ud.
    //procedure Query1Progress(Sender: TObject; Stage: TZProgressStage; Proc: TZProgressProc; Position, Max: Integer; var Cancel: Boolean);
  private
    { Private-Deklarationen }
    InvID   : Integer;
    Run     : Boolean;
    Job     : Integer;
    Akt     : Integer;
    Err     : Integer;
  public
    { Public-Deklarationen }
    procedure MakeInventur (ID: Integer);
    function SaveInventur (ID: Integer;
var aktualisiert,
  fehler: Integer): Boolean;
  end;

    //var InventurMakeArtikelForm: TInventurMakeArtikelForm;

implementation

uses
  GNUGetText,
  OF_DM, OF_Function;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TInventurMakeArtikelForm.MakeInventur (ID: Integer);
begin
  Label1.Caption :=
    _('Die Artikel-SOLL-Daten werden jetzt erstellt.' + #13#10 +
    'Bitte haben Sie etwas Geduld,' + #13#10 +
    'dieser Vorgang kann einige Minuten in Anspruch nehmen ...');

  Caption := _('Inventur wird erstellt ...');
  InvID := ID;
  Job   := 1;
  ShowModal;
end;

//------------------------------------------------------------------------------
function TInventurMakeArtikelForm.SaveInventur (ID: Integer; var aktualisiert, fehler: Integer): Boolean;
begin
  Label1.Caption :=
    _('Die Inventur wird nun abgeschlossen,' + #13#10 +
    'dabei werden die Fehlmengen im Lager korregiert.' + #13#10 +
    'Bitte haben Sie etwas Geduld,' + #13#10 +
    'dieser Vorgang kann einige Minuten in Anspruch nehmen ...');

  Caption := _('Inventur wird abgesclossen ...');
  InvID := ID;
  Job   := 2;
  Akt   := 0;
  Err   := 0;
  ShowModal;

  aktualisiert := akt;
  fehler       := err;
  Result       := True;
end;

//------------------------------------------------------------------------------
procedure TInventurMakeArtikelForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  Run := False;
  Timer1.Enabled := False;
  Job := 0;
end;

//------------------------------------------------------------------------------
procedure TInventurMakeArtikelForm.FormActivate(Sender: TObject);
var 
  s, i: integer;
begin
  Run := True;

  if Job = 1 then // Inventur erstellen
  begin
    try
      Application.ProcessMessages;

      query1.sql.text :=
        'insert into ARTIKEL_INVENTUR (INVENTUR_ID,ARTIKEL_ID,WARENGRUPPE,' +
        'ARTNUM,MATCHCODE,BARCODE,KURZTEXT,MENGE_SOLL,INVENTUR_WERT,EK_PREIS)' +
        ' select :INV_ID,REC_ID,WARENGRUPPE,ARTNUM,MATCHCODE,BARCODE,' +
        'KURZNAME,MENGE_AKT,INVENTUR_WERT,EK_PREIS from ARTIKEL ' +
        'where ARTIKEL.ARTIKELTYP in ("N","S")';
      query1.ParamByName('INV_ID').asInteger := INVID;

      { TODO : Query Event Progress gibt es nicht mehr } //17.10.09-ud.
      //query1.OnProgress := Query1Progress;
      query1.ExecSql;
    finally
      Run := False;
    end;
  end else
  begin
    if Job = 2 then // Inventur abschließen
    begin
      Application.ProcessMessages;
      try
        Screen.Cursor := crSqlWait;
        query1.sql.text :=
          'select ARTIKEL_ID,MENGE_DIFF,STATUS from ARTIKEL_INVENTUR ' +
          // 'where INVENTUR_ID=:INV_ID';
          'where INVENTUR_ID=:INV_ID and MENGE_DIFF !=0 and STATUS=1';
        query1.ParamByName('INV_ID').asInteger := INVID;

        PB1.Position := 0;
        query1.open;
        PB1.Max := Query1.RecordCount;
        I := 1;

        dm1.uniquery.close;
        dm1.uniquery.sql.text := '';

        while not query1.eof do
        begin
          PB1.Position := query1.RecNo;
          Label2.Caption := IntToStr(Query1.RecNo) + ' von ' +
          IntToStr(Query1.RecordCount);

          if i >= 100 then
          begin
            i := 1;
            Application.ProcessMessages;
          end else 
            inc(i);

          try
            dm1.uniquery.sql.text :=
              'UPDATE ARTIKEL SET ' +
              'MENGE_AKT=MENGE_AKT+ ' +
              sqlFloatToStr(query1menge_diff.asfloat) +
              ',SHOP_CHANGE_FLAG=1 ' +
              ' WHERE REC_ID=' + IntToStr(Query1Artikel_ID.AsInteger);
            dm1.uniquery.execsql;

            s := dm1.uniquery.RowsAffected;

            if s = 1 then 
            begin 
              s := 2; 
              inc(akt); 
            end else 
            begin 
              s := 3; 
              inc(err);
            end;
          except
            s := 4; 
            inc(err);
          end;

          try
            dm1.uniquery.sql.text :=
              'UPDATE ARTIKEL_INVENTUR SET STATUS=' + Inttostr(S) +
              ' WHERE INVENTUR_ID=' + Inttostr(InvID) +
              ' and ARTIKEL_ID=' + IntTostr(Query1Artikel_ID.AsInteger);
            dm1.uniquery.execsql;
          except 
          end;
          query1.next;
        end;
        query1.close;

        try
          dm1.uniquery.sql.text :=
            'UPDATE ARTIKEL SET SHOP_CHANGE_FLAG=0' +
            ' WHERE SHOP_ID<1';
          dm1.uniquery.execsql;
        except 
        end;

      finally
        Run := False;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  Timer1.Enabled := True;
end;  

//------------------------------------------------------------------------------
procedure TInventurMakeArtikelForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  CanClose := not Run;
end;

//------------------------------------------------------------------------------
procedure TInventurMakeArtikelForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

//------------------------------------------------------------------------------
//17.10.09-ud.
(*
procedure TInventurMakeArtikelForm.Query1Progress(Sender: TObject; Stage: TZProgressStage;
   Proc: TZProgressProc; Position, Max: Integer; var Cancel: Boolean);
begin
  PB1.Max := Max;
  PB1.Position := Position;
  Application.ProcessMessages;
end;
*)

//------------------------------------------------------------------------------

end.

