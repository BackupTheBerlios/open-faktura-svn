{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Export der Lieferscheindaten für Paketdienste              }
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
{ 13.01.2003 - Unit erstellt Jan Pokrandt                                      }
{ 27.03.2004 - Überprüfung der Feldnamen eingebaut                             }
{ 07.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_LiefExport_Dlg;

{$I OF.INC}

interface
// 16.10.09-ud.IO.
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Buttons, Mask, JvExMask, JvToolEdit, Grids, JvExGrids, JvStringGrid;

type
  TLiefExportDlg = class(TForm)
    SrcGrid: TJvStringGrid;
    DstGrid: TJvStringGrid;
    AddBtn: TSpeedButton;
    SrcFelderLab: TLabel;
    DestFelderLab: TLabel;
    SrcFeldQuery: TZQuery;
    SrcFeldQueryREC_ID: TIntegerField;
    SrcFeldQueryADDR_ID: TIntegerField;
    SrcFeldQueryATRNUM: TIntegerField;
    SrcFeldQueryVLSNUM: TIntegerField;
    SrcFeldQueryLDATUM: TDateField;
    SrcFeldQueryGEWICHT: TFloatField;
    SrcFeldQueryNSUMME: TFloatField;
    SrcFeldQueryMSUMME: TFloatField;
    SrcFeldQueryBSUMME: TFloatField;
    SrcFeldQueryWAEHRUNG: TStringField;
    SrcFeldQueryERSTELLT: TDateField;
    SrcFeldQueryERST_NAME: TStringField;
    SrcFeldQueryKUN_NUM: TStringField;
    SrcFeldQueryKUN_ANREDE: TStringField;
    SrcFeldQueryKUN_NAME1: TStringField;
    SrcFeldQueryKUN_NAME2: TStringField;
    SrcFeldQueryKUN_NAME3: TStringField;
    SrcFeldQueryKUN_ABTEILUNG: TStringField;
    SrcFeldQueryKUN_STRASSE: TStringField;
    SrcFeldQueryKUN_LAND: TStringField;
    SrcFeldQueryKUN_PLZ: TStringField;
    SrcFeldQueryKUN_ORT: TStringField;
    SrcFeldQueryUSR1: TStringField;
    SrcFeldQueryUSR2: TStringField;
    SrcFeldQueryPROJEKT: TStringField;
    SrcFeldQueryBEST_NAME: TStringField;
    SrcFeldQueryBEST_CODE: TIntegerField;
    SrcFeldQueryBEST_DATUM: TDateField;
    DelBtn: TSpeedButton;
    AktivCB: TCheckBox;
    ExportFileNameLab: TLabel;
    ExportFilenameEdit: TJvFilenameEdit;
    MitFeldNamenCB: TCheckBox;
    TrennzeichenLab: TLabel;
    TrennzeichenCB: TComboBox;
    ModusCB: TComboBox;
    ModusLab: TLabel;
    OKBtn: TBitBtn;
    CloseBtn: TBitBtn;
    HelpBtn: TBitBtn;
    TextInHKCB: TCheckBox;
    SrcFeldQueryEMAIL: TStringField;
    SrcFeldQueryEMAIL2: TStringField;
    SrcFeldQueryINTERNET: TStringField;
    SrcFeldQueryBRIEFANREDE: TStringField;
    SrcFeldQueryDEB_NUM: TIntegerField;
    SrcFeldQueryUST_NUM: TStringField;
    SrcFeldQueryUSERFELD_01: TStringField;
    SrcFeldQueryUSERFELD_02: TStringField;
    SrcFeldQueryUSERFELD_03: TStringField;
    SrcFeldQueryUSERFELD_04: TStringField;
    SrcFeldQueryUSERFELD_05: TStringField;
    SrcFeldQueryUSERFELD_06: TStringField;
    SrcFeldQueryUSERFELD_07: TStringField;
    SrcFeldQueryUSERFELD_08: TStringField;
    SrcFeldQueryUSERFELD_09: TStringField;
    SrcFeldQueryUSERFELD_10: TStringField;
    SrcFeldQueryORGNUM: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure DstGridSetEditText(Sender: TObject; ACol, ARow: Integer;
    const Value: String);
  private
    { Private-Deklarationen }
    LastLiefArt: Integer;
    Versandart : String;
    Key        : String;
    
    // Cache
    CaAktiv        : Boolean;
    CaMitFeldNamen : Boolean;
    CaTextInHK     : Boolean;
    CaModus        : Integer;
    CaFileName     : String;
    CaFeldnamen    : String;
    CaTrennzeichen : String;
    CaDeToD        : Boolean;
    
    procedure UpdateSrc;
    procedure Add (S1, S2: String);
    procedure Del (S: String);
    
    procedure LoadData;
    procedure SaveData;
    procedure LoadFelder (FeldStr: String);
    function  SaveFelder: String;
  public
    { Public-Deklarationen }
    procedure MakeExport (Liefart: Integer; Beleg_ID: Integer);
    procedure ShowDlg    (Liefart: Integer);
  end;
    
implementation

uses
  GNUGetText, JclStrings,
  OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TLiefExportDlg.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  SrcGrid.Cells[0, 0] := _('Feldname');
  DstGrid.Cells[0, 0] := _('Feldname');
  DstGrid.Cells[1, 0] := _('benutzerdef. Name');
  LastLiefArt         := -1;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.FormShow(Sender: TObject);
begin
  SrcGrid.RowCount := 2;
  SrcGrid.Cells[0, 1] := '';
  DstGrid.RowCount := 2;
  DstGrid.Cells[0, 1] := '';
  DstGrid.Cells[1, 1] := '';

  UpdateSrc;
  LoadData;
end;             

//------------------------------------------------------------------------------
procedure TLiefExportDlg.ShowDlg (LiefArt: Integer);
begin
  case LiefArt of
    1 : VersandArt := 'DPD';
    3, 4: VersandArt := 'POST';
    5, 6: VersandArt := 'UPS';
  end;
  LastLiefArt := -1;
  Key := 'MAIN\EXPORT\' + Versandart;

  if DM1.ReadString ('MAIN\EXPORT', 'DEFAULT', '@@@') = '@@@' then 
    DM1.WriteString ('MAIN\EXPORT', 'DEFAULT', '');
  Caption := 'Versanddatenexport / ' + VersandArt;
  ShowModal;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.MakeExport (Liefart: Integer; Beleg_ID: Integer);
var 
  caFeldNamen2: String;
begin
  if DM1.ReadString ('MAIN\EXPORT', 'DEFAULT', '@@@') = '@@@' then 
    DM1.WriteString ('MAIN\EXPORT', 'DEFAULT', '');

  if LastLiefArt <> LiefArt then
  begin
    case LiefArt of
      1 : VersandArt := 'DPD';
      3, 4: VersandArt := 'POST';
      5, 6: VersandArt := 'UPS';
      else exit;
    end;
    LastLiefArt := LiefArt;
    Key := 'MAIN\EXPORT\' + Versandart;

    // Daten laden
    CaAktiv         := DM1.ReadBoolean    (Key, 'AKTIV', False);
    CaMitFeldNamen  := DM1.ReadBoolean    (Key, 'INCL_FELDNAMEN', TRUE);
    CaTextInHK      := DM1.ReadBoolean    (Key, 'TEXT_IN_HOCHKOMMAS', TRUE);
    CaModus         := DM1.ReadInteger    (Key, 'MODUS', 1);
    CaFileName      := DM1.ReadString     (Key, 'DATEINAME', DM1.ExportDir + Versandart + '.csv');
    CaFeldnamen     := DM1.ReadLongString (Key, 'FELDER', '');
    CaTrennzeichen  := DM1.ReadString     (Key, 'TRENNZEICHEN', ListSeparator);
    if CaTrennzeichen = 'TAB' then 
      CaTrennzeichen := #9;
    CaDeToD         := DM1.ReadBoolean    (Key, 'DE_ZU_D', False);
  end;
  if (not CaAktiv) or (length(CaFilename) = 0) or (length(CaFeldNamen) = 0) then 
    exit;

  // Erstetzung von DE durch D (für DPD), Notlösung, muß in der 1.3 gefixt werden
  caFeldNamen2 := caFeldNamen;

  if CaDeToD then
  begin
    if POS ('KUN_LAND as ', caFeldNamen2) > 0 then
    begin
      StrReplace (caFeldNamen2, 'KUN_LAND as ', 'IF(KUN_LAND="DE","D",KUN_LAND) as ', []);
    end else
    if POS ('KUN_LAND', caFeldNamen2) > 0 then
    begin
      StrReplace (caFeldNamen2, 'KUN_LAND', 'IF(KUN_LAND="DE","D",KUN_LAND) as KUN_LAND', []);
    end;
  end;

  if Pos ('REC_ID', caFeldNamen2) > 0 then 
    StrReplace (caFeldNamen2, 'REC_ID', 'JOURNAL.REC_ID', []);

  DM1.UniQuery.Close;
  DM1.UniQuery.SQL.Text := 
    'SELECT ' + CaFeldNamen2 + ' FROM JOURNAL ' +
    'left outer join ADRESSEN on ' +
    'ADRESSEN.REC_ID=JOURNAL.ADDR_ID ' +
    'WHERE QUELLE=2 and JOURNAL.REC_ID=' + Inttostr(Beleg_ID);
  try
    DM1.UniQuery.Open;
    DM1.ExportDatasetToFile (caFileName, DM1.Uniquery, caTrennzeichen, CaModus = 1, CaMitFeldNamen, CaTextInHK);
    DM1.UniQuery.Close;
  except
    MessageDlg (_('Während des Lieferschein-Exports ist ein ' +
      'Fehler aufgetreten,' + #13#10 +
      'näheres dazu findes Sie im SQL-Log'), mterror, [mbok], 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.UpdateSrc;
var 
  I, J: Integer;
begin
  J := 0;
  SrcGrid.RowCount := 2;
  SrcGrid.Cells[0, 1] := '';
  for i := 0 to SrcFeldQuery.FieldCount-1 do
  begin
    if (SrcFeldQuery.Fields[i].Visible) and (DstGrid.Cols[0].IndexOf(SrcFeldQuery.Fields[i].FieldName) < 1) then
    begin
      inc(J);
      if SrcGrid.RowCount<J + 1 then 
        SrcGrid.RowCount := J + 1;
      SrcGrid.Cells[0, J] := SrcFeldQuery.Fields[i].FieldName;
    end;
  end;
end;    

//------------------------------------------------------------------------------
procedure TLiefExportDlg.Add(S1, S2: String);
var 
  LastSrcRow, I, J: Integer;
begin
  LastSrcRow := SrcGrid.Row;

  if length(DstGrid.Cells[0, 1]) > 0 then
  begin
    I := DstGrid.RowCount;
    DstGrid.RowCount := I + 1;
  end else 
    I := 1;

  DstGrid.Cells[0, i] := S1;
  DstGrid.Cells[1, i] := S2;

  UpdateSrc;

  if LastSrcRow>SrcGrid.RowCount-1 then 
    dec (LastSrcRow);
  SrcGrid.Row := LastSrcRow;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.Del (S: String);
var 
  I, J, C: Integer;
begin
  I := DstGrid.Cols[0].IndexOf (S);
  if I > 0 then
  begin
    C := DstGrid.RowCount-1;
    if I < C then
    begin
      for j := i to c-1 do
      begin
        DstGrid.Cells[0, j] := DstGrid.Cells[0, j + 1];
        DstGrid.Cells[1, j] := DstGrid.Cells[1, j + 1];
      end;
    end;
    if C > 1 then
    begin
      DstGrid.RowCount := C;
    end else
    begin
      DstGrid.Cells[0, 1] := '';
      DstGrid.Cells[1, 1] := '';
    end;
  end;
  UpdateSrc;
end;    

//------------------------------------------------------------------------------
procedure TLiefExportDlg.AddBtnClick(Sender: TObject);
begin
  if (SrcGrid.Row > 0) and (length(SrcGrid.Cells[0, SrcGrid.Row]) > 0) then
  begin
    Add (SrcGrid.Cells[0, SrcGrid.Row], '');
  end;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.DelBtnClick(Sender: TObject);
begin
  if length(DstGrid.Cells[0, DstGrid.Row]) > 0 then 
    Del(DstGrid.Cells[0, DstGrid.Row]);
end;

//------------------------------------------------------------------------------
function TLiefExportDlg.SaveFelder: String;
var 
  I : Integer;
  S : String;
begin
  Result := '';
  S := '';
  for i := 1 to DstGrid.RowCount-1 do
  begin
    if length(DstGrid.Cells[0, i]) > 0 then
    begin
      if length(S) > 0 then 
        S := S + ',';
      S := S + DstGrid.Cells[0, I];
      if length(DstGrid.Cells[1, i]) > 0 then 
        s := s + ' as ' + DstGrid.Cells[1, I] + '';
    end;
  end;
  Result := S;
end;    

//------------------------------------------------------------------------------
procedure TLiefExportDlg.LoadFelder (FeldStr: String);
var S, S1, S2, S3: String;
begin
  SrcGrid.RowCount := 2;
  SrcGrid.Cells[0, 1] := '';
  DstGrid.RowCount := 2;
  DstGrid.Cells[0, 1] := '';
  DstGrid.Cells[1, 1] := '';

  UpdateSrc;

  S := FeldStr;

  while Pos (',', S) > 0 do
  begin
    if S[1] = ',' then 
      delete (S, 1, 1);
    S1 := Copy (S, 1, Pos(',', S)-1);
    Delete (S, 1, length(S1));
    if length(S1) > 0 then
    begin
      S2 := S1;
      S3 := S1;
      if pos (' as ', S2) > 0 then
      begin
        Delete (S2, Pos(' as ', S2), $FFFF);
        Delete (S3, 1, Pos(' as ', S3) + 3);
      end else 
        S3 := '';

      Add (S2, S3);
    end;
  end;
  if length(S) > 0 then
  begin
    S2 := S;
    S3 := S;
    if pos (' as ', S2) > 0 then
    begin
      Delete (S2, Pos(' as ', S2), $FFFF);
      Delete (S3, 1, Pos(' as ', S3) + 3);
    end else 
      S3 := '';
    Add (S2, S3);
  end;
end;  

//------------------------------------------------------------------------------
procedure TLiefExportDlg.LoadData;
var 
  FStr, S: String;
begin
  AktivCB.Checked          := DM1.ReadBoolean    (Key, 'AKTIV', False);
  MitFeldNamenCB.Checked   := DM1.ReadBoolean    (Key, 'INCL_FELDNAMEN', TRUE);
  TextInHKCB.Checked       := DM1.ReadBoolean    (Key, 'TEXT_IN_HOCHKOMMAS', TRUE);
  ModusCB.ItemIndex        := DM1.ReadInteger    (Key, 'MODUS', 1);
  ExportFilenameEdit.Text  := DM1.ReadString     (Key, 'DATEINAME', DM1.ExportDir + Versandart + '.csv');
  FStr                     := DM1.ReadLongString (Key, 'FELDER', '');
  S                        := DM1.ReadString     (Key, 'TRENNZEICHEN', ListSeparator);

  if S = #9 then 
    S := 'TAB';
  TrennzeichenCB.ItemIndex := TrennzeichenCB.Items.IndexOf(S);

  LoadFelder (FStr);
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.SaveData;
var 
  FStr, S: String;
begin
  Key := 'MAIN\EXPORT\' + Versandart;

  FStr := SaveFelder;

  S := TrennzeichenCB.Items[TrennzeichenCB.ItemIndex];
  if S = 'TAB' then 
    S := #9;

  DM1.WriteBoolean    (Key, 'AKTIV', AktivCB.Checked);
  DM1.WriteBoolean    (Key, 'INCL_FELDNAMEN', MitFeldNamenCB.Checked);
  DM1.WriteBoolean    (Key, 'TEXT_IN_HOCHKOMMAS', TextInHKCB.Checked);
  DM1.WriteInteger    (Key, 'MODUS', ModusCB.ItemIndex);
  DM1.WriteString     (Key, 'DATEINAME', ExportFilenameEdit.Text);
  DM1.WriteLongString (Key, 'FELDER', FStr);
  DM1.WriteString     (Key, 'TRENNZEICHEN', S);

end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.OKBtnClick(Sender: TObject);
begin
  SaveData;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
procedure TLiefExportDlg.DstGridSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
var 
  I: Integer; 
  Error: Boolean;
begin
  Error := False;
  if length(Value) > 0 then
  begin
    for i := 1 to length(value) do
    begin
      if not (Value[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_']) then
      begin
        error := True;
        Break;
      end;
    end;
  end;
  if Error then
  begin
    MessageDlg (_('Für Feldnamen sind nur die Zeichen' + #13#10 +
      '"A-Z", "a-z", "0-9", "-" und "_" zulässig'),
      mterror, [mbok], 0);
  end;
  OKBtn.Enabled := not Error;
end;

//------------------------------------------------------------------------------

end.

