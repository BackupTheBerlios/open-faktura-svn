{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Seriennummern erfassen für Einkauf                         }
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
{ 09.05.2003 - Unit erstellt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_SN_Erfassen;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  ComCtrls, Buttons, ExtCtrls;

type
  TSNErfassenForm = class(TForm)
    Panel1: TPanel;
    Sb1: TStatusBar;
    SNAdd: TEdit;
    Panel2: TPanel;
    SNGrid: TOFDBGrid;
    SNAddBtn: TButton;
    CloseBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ArtNr: TLabel;
    ArtMatch: TLabel;
    ArtBez: TLabel;
    SNDelBtn: TBitBtn;
    procedure SNAddChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SNAddBtnClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SNAddKeyPress(Sender: TObject; var Key: Char);
    //procedure ZMySqlQuery1AfterDelete(DataSet: TDataSet);
    procedure SNDelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    Anzahl: Integer;
    InAdd : Boolean;
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    function ErfasseSN ( NewAnzahl: Integer): Boolean;
    // Liefert True, wenn die gewünschte Anzahl erfasst wurde und der Dialog
    // geschlossen wird
  end;
    
var
  SNErfassenForm: TSNErfassenForm;
  
implementation

uses
  GNUGetText, DB,
  OF_DM, OF_Function, OF_MakeEKRech;
  //OLD: ZSqlTypes,

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TSNErfassenForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure tSNErfassenForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 442;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 254;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
function tSNErfassenForm.ErfasseSN (NewAnzahl: Integer): Boolean;
begin
  SNGrid.RowColor1 := DM1.C2Color;
  InAdd  := False;
  Anzahl := NewAnzahl;

  ArtNr.Caption := MakeEKReForm.PosTabARTNUM.AsString;
  ArtMatch.Caption := MakeEKReForm.PosTabMATCHCODE.AsString;
  ArtBez.Caption := MakeEKReForm.PosTabBEZEICHNUNG.AsString;
  {
  MakeEKReForm.SNTab.AfterPost   :=ZMySqlQuery1AfterDelete;
  MakeEKReForm.SNTab.AfterDelete :=ZMySqlQuery1AfterDelete;
  }
  ShowModal;
  {
  MakeEKReForm.SNTab.AfterPost   :=nil;
  MakeEKReForm.SNTab.AfterDelete :=nil;
  }

  Result := MakeEKReForm.SNTab.RecordCount = Anzahl;
end;                                                

//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddChange(Sender: TObject);
var 
  OK: Boolean;
begin
  OK := (Length(SNAdd.Text) > 0) and
        (not MakeEKReForm.SNTab.Locate('SERNUMMER', SNAdd.Text, [loCaseInsensitive]));

  SNAddBtn.Enabled := (OK) and (MakeEKReForm.SNTab.RecordCount < Anzahl);

  if not ok then
  begin
    if SNAdd.Text <> '' then
    begin
      SNAdd.Color := clRed;
      SB1.Panels[1].Text := _('SN bereits vorhanden !!!');
    end else
    begin
      SNAdd.Color := clWindow;
      SB1.Panels[1].Text := _('Bitte SN eingeben ...');
    end;
  end else
  begin
    SNAdd.Color := clWindow;
    SB1.Panels[1].Text := _('Seriennummer ok');
  end;

  if MakeEKReForm.SNTab.RecordCount = Anzahl then 
    CloseBtn.Kind := bkOK 
  else 
    CloseBtn.Kind := bkAbort;

  SNAdd.Enabled    := MakeEKReForm.SNTab.RecordCount<>Anzahl;
  SNDelBtn.Enabled := MakeEKReForm.SNTab.RecordCount>0;

  SB1.Panels[0].Text := Format(_('%d Seriennummern benötigt, %d erfasst'), [Anzahl, MakeEKReForm.SNTab.RecordCount]);

  if MakeEKReForm.SNTab.RecordCount = Anzahl then
  begin
    SB1.Panels[0].Text := _('alle Seriennummern erfasst !');
    SB1.Panels[1].Text := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TSNErfassenForm.FormActivate(Sender: TObject);
begin
  SNAddBtn.Enabled := False;

  if MakeEKReForm.SNTab.RecordCount = Anzahl then 
	  CloseBtn.Kind := bkOK 
	else 
    CloseBtn.Kind := bkAbort;

  SNAdd.Enabled    := MakeEKReForm.SNTab.RecordCount<>Anzahl;
  SNDelBtn.Enabled := MakeEKReForm.SNTab.RecordCount>0;

  if MakeEKReForm.SNTab.RecordCount < Anzahl then 
    SB1.Panels[1].Text := _('Bitte SN eingeben ...')
  else 
    SB1.Panels[1].Text := '';

  SB1.Panels[0].Text := Format(_('%d Seriennummern benötigt, %d erfasst'), [Anzahl, MakeEKReForm.SNTab.RecordCount]);

  if MakeEKReForm.SNTab.RecordCount = Anzahl then 
    SB1.Panels[0].Text := _('alle Seriennummern erfasst !');

  SNAdd.Text := '';
end;

//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddBtnClick(Sender: TObject);
var 
  LastID: Integer;
begin
  InAdd := True;

  with dm1.uniquery do
  begin
    Close;
    sql.text :=
      'INSERT INTO ARTIKEL_SERNUM SET ' +
      'ARTIKEL_ID=' + IntToStr(MakeEKReForm.PosTabARTIKEL_ID.AsInteger) + ',' +
      'SERNUMMER="' + sqlStringToSQL(SNAdd.Text) + '",' +
      'STATUS="EK_EDI"';
    ExecSql;

    sql.text := 'SELECT LAST_INSERT_ID() as ID';
    Open;
    if RecordCount = 1 then
      LastID := FieldByName('ID').AsInteger
    else
      LastID := -1;
    close;

    sql.text :=
      'INSERT INTO JOURNALPOS_SERNUM SET ' +
      'QUELLE=15,' +
      'JOURNAL_ID=' + IntToStr(MakeEKReForm.ReEdiTabREC_ID.AsInteger) + ',' +
      'JOURNALPOS_ID=' + IntToStr(MakeEKReForm.PosTabREC_ID.AsInteger) + ',' +
      'ARTIKEL_ID=' + IntToStr(MakeEKReForm.PosTabARTIKEL_ID.AsInteger) + ',' +
      'SNUM_ID=' + IntToStr(LastID);
    ExecSql;

    SNAdd.Text := '';
  end;

  MakeEKReForm.SNTab.Refresh;

  {
  MakeEKReForm.SNTab.Append;
  try
  MakeEKReForm.SNTabSERNUMMER.AsString :=SNAdd.Text;
  MakeEKReForm.SNTab.Post;

  SNAdd.Text :='';

  except
  MakeEKReForm.SNTab.Cancel;
  end;
  }

  InAdd := False;
  SNAddChange(Sender);
end;

//------------------------------------------------------------------------------
procedure TSNErfassenForm.Panel1Resize(Sender: TObject);
begin
  CloseBtn.Left := Panel1.Width - 5 - CloseBtn.Width;
  ArtBez.Width  := Panel3.Width - 5 - ArtBez.Left;
end;

//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNAddKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (SNAddBtn.Enabled) then
  begin
    Key := #0;
    SNAddBtnClick (Sender);
  end;
end;

//------------------------------------------------------------------------------
{
procedure TSNErfassenForm.ZMySqlQuery1AfterDelete(DataSet: TDataSet);
begin
if (not (MakeEKReForm.SNTab.State in [dsEdit, dsInsert]))and
(not InAdd)
then SNAddChange(Self);
end;
}

//------------------------------------------------------------------------------
procedure TSNErfassenForm.SNDelBtnClick(Sender: TObject);
begin
  //MakeEKReForm.SNTab.Delete;
  with DM1.Uniquery do
  begin
    Close;
    Sql.Text :=
      'DELETE FROM JOURNALPOS_SERNUM ' +
      'WHERE QUELLE=15 and ' +
      'JOURNAL_ID=' + IntToStr(MakeEKReForm.ReEdiTabREC_ID.AsInteger) + ' and ' +
      'JOURNALPOS_ID=' + IntToStr(MakeEKReForm.PosTabREC_ID.AsInteger) + ' and ' +
      'ARTIKEL_ID=' + IntToStr(MakeEKReForm.SNTabARTIKEL_ID.AsInteger) + ' and ' +
      'SNUM_ID=' + IntToStr(MakeEKReForm.SNTabSNUM_ID.AsInteger);
    execsql;

    Sql.Text :=
      'DELETE FROM ARTIKEL_SERNUM WHERE ' +
      'ARTIKEL_ID=' + IntToStr(MakeEKReForm.SNTabARTIKEL_ID.AsInteger) + ' and ' +
      'SNUM_ID=' + IntToStr(MakeEKReForm.SNTabSNUM_ID.AsInteger) + ' and ' +
      'STATUS="EK_EDI"';
    execsql;

    sql.text := '';
  end;
  MakeEKReForm.SNTab.Refresh;
  SNAddChange(Self);
end;

//------------------------------------------------------------------------------

end.

