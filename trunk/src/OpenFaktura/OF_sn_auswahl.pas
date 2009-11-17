{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Seriennummern Auswahl für Verkauf                          }
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
{ 11.05.2003 - Unit erstellt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_SN_Auswahl;

{$I OF.INC}

interface
// 16.10.09-ud.IO.
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ExtCtrls,
  ComCtrls;
{
uses
  JvDBCtrl,
}

type
  TSNAuswahlForm = class(TForm)
    SB1: TStatusBar;
    TopPanel: TPanel;
    GridPanel: TPanel;
    MidPanel: TPanel;
    SNLagerTab: TZQuery;
    SNLagerDS: TDataSource;
    SNPosGrid: TOFDBGrid;
    SNLagerGrid: TOFDBGrid;
    SNLagerTabSERNUMMER: TStringField;
    RBtn: TSpeedButton;
    RABtn: TSpeedButton;
    LBtn: TSpeedButton;
    LABtn: TSpeedButton;
    SchnellErfassPanel: TPanel;
    CloseBtn: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ArtNr: TLabel;
    Label3: TLabel;
    ArtMatch: TLabel;
    ArtBez: TLabel;
    SNLagerTabSNUM_ID: TIntegerField;
    SNLagerTabARTIKEL_ID: TIntegerField;
    procedure SNLagerGridDblClick(Sender: TObject);
    procedure SNPosGridDblClick(Sender: TObject);
    procedure SNLagerTabAfterOpen(DataSet: TDataSet);
    procedure LABtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SNLagerGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    Anzahl: Integer;
    ArtID : Integer;
    InAdd : Boolean;
    PosID : Integer;
    KopfID: Integer;
    
    SNTab : TZQuery;
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    function AuswahlSN (NewAnzahl, NewArtikelID: Integer;
    NewSNTab: TZQuery;
    NewKopfID, NewPosID: Integer;
    SNDataSet: tDataSource): Boolean;
    // Liefert True, wenn die gewünschte Anzahl erfasst wurde und der Dialog
    // geschlossen wird
  end;
    
var
  SNAuswahlForm: TSNAuswahlForm;
  
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM;
  
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.FormCreate(Sender: TObject);
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
procedure tSNAuswahlForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 406;
    ptMaxTrackSize.x := 500;
    ptMinTrackSize.y := 298;
    ptMaxTrackSize.y := 500;
  end;
end;

//------------------------------------------------------------------------------
function tSNAuswahlForm.AuswahlSN (NewAnzahl, NewArtikelID: Integer; NewSNTab: TZQuery;
                NewKopfID, NewPosID: Integer; SNDataSet: tDataSource): Boolean;
begin
  SNTab  := NewSNTab;
  KopfID := NewKopfID;
  PosID  := NewPosID;
  SNPosGrid.DataSource := SNDataSet;

  SNLagerGrid.RowColor1 := DM1.C2Color;
  SNPosGrid.RowColor1   := DM1.C2Color;

  InAdd  := False;

  Anzahl := NewAnzahl;
  ArtID  := NewArtikelID;


  DM1.Uniquery.Close;
  DM1.Uniquery.Sql.Text := 'SELECT ARTNUM,MATCHCODE,BEZEICHNUNG ' +
  'FROM JOURNALPOS WHERE REC_ID=' + IntToStr(PosID);
  DM1.Uniquery.Open;
  ArtNr.Caption    := DM1.Uniquery.FieldByName('ARTNUM').AsString;
  ArtMatch.Caption := DM1.Uniquery.FieldByName('MATCHCODE').AsString;
  ArtBez.Caption   := DM1.Uniquery.FieldByName('BEZEICHNUNG').AsString;
  DM1.Uniquery.Close;


  SNLagerTab.Close;
  SNLagerTab.ParamByName ('AID').AsInteger := ArtID;
  SNLagerTab.Open;

  SNLagerTabAfterOpen(nil);

  Result := ShowModal = mrOK;

  SNLagerTab.Close;
end;            

//------------------------------------------------------------------------------
// Seriennummer zumBeleg hinzufügen
//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerGridDblClick(Sender: TObject);
begin
  if SNTab.RecordCount >= Anzahl then 
    exit;
  {
  SNLagerTab.Edit;
  SNLagerTabVK_JOURNALPOS_ID.AsInteger :=PosID;
  SNLagerTabVK_JOURNAL_ID.AsInteger    :=KopfID;
  SNLagerTab.Post;
  }
  with DM1.UniQuery do
  begin
    Close;
    SQL.Text := 'INSERT INTO JOURNALPOS_SERNUM ' +
      'SET QUELLE=13,JOURNAL_ID=' + IntToStr(KopfID) + ',' +
      'JOURNALPOS_ID=' + IntToStr(PosID) + ',' +
      'ARTIKEL_ID=' + IntToStr(SNLagerTabARTIKEL_ID.AsInteger) + ',' +
      'SNUM_ID=' + IntToStr(SNLagerTabSNUM_ID.AsInteger);
    ExecSql;
  end;

  SNLagerTab.Refresh;
  SNTab.Refresh;
  SNLagerTabAfterOpen(nil);
end;

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNPosGridDblClick(Sender: TObject);
begin
  if SNTab.RecordCount = 0 then 
    exit;
  {
  SNTab.Edit;
  
  SNTab.FieldByName('VK_JOURNAL_ID').AsInteger :=-1;
  SNTab.FieldByName('VK_JOURNALPOS_ID').AsInteger :=-1;
  SNTab.FieldByName('LS_JOURNAL_ID').AsInteger :=-1;
  SNTab.FieldByName('LS_JOURNALPOS_ID').AsInteger :=-1;
  
  SNTab.Post;
  }
  with DM1.UniQuery do
  begin
    Close;
    SQL.Text := 'DELETE FROM JOURNALPOS_SERNUM WHERE ' +
      'JOURNAL_ID=' + IntToStr(KopfID) + ' and ' +
      'JOURNALPOS_ID=' + IntToStr(PosID) + ' and ' +
      'SNUM_ID=' + IntToStr(SNTab.FieldByName('SNUM_ID').AsInteger);
    ExecSql;
  end;

  SNLagerTab.Refresh;
  SNTab.Refresh;
  SNLagerTabAfterOpen(nil)
end;

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerTabAfterOpen(DataSet: TDataSet);
begin
  RBtn.Enabled  := (SNLagerTab.RecordCount > 0) and (SNTab.RecordCount < Anzahl);
  RABtn.Enabled := RBtn.Enabled;
  LBtn.Enabled  := SNTab.RecordCount > 0;
  LABtn.Enabled := LBtn.Enabled;

  if SNTab.RecordCount = Anzahl then 
    SB1.Panels[0].Text := _('alle Seriennummern erfasst !')
  else 
    SB1.Panels[0].Text := Format(_('%d Seriennummern benötigt, %d erfasst'), [Anzahl, SNTab.RecordCount]);

  if SNTab.RecordCount = Anzahl then
  begin
    Edit1.Color := clWindow;
    //CloseBtn.Enabled :=True;
    CloseBtn.ModalResult := mrOK;
    CloseBtn.Caption     := 'OK';
    CloseBtn.Kind        := bkOK;
  end else
  begin
    //CloseBtn.Enabled := False;
    CloseBtn.ModalResult := mrCancel;
    CloseBtn.Caption     := 'Abbruch';
    CloseBtn.Kind        := bkAbort;
  end;
end; 

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.LABtnClick(Sender: TObject);
begin
  // Seriennummern Verweis löschen ....
  dm1.UniQuery.close;
  dm1.UniQuery.sql.text := 'DELETE FROM JOURNALPOS_SERNUM ' +
    'WHERE JOURNALPOS_ID=' + IntToStr(PosID) + ' ' +
    'AND JOURNAL_ID=' + IntToStr(KopfID);
  dm1.UniQuery.ExecSql;
  dm1.UniQuery.close;

  SNTab.Refresh;
  SNLagerTab.Refresh;
  SNLagerTabAfterOpen(nil);
end;

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
  Edit1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.Edit1Change(Sender: TObject);
begin
  if SNLagerTab.Locate ('SERNUMMER', Edit1.Text, [loCaseInsensitive]) then 
    Edit1.Color := $00B0FFB0
  else
  if SNTab.RecordCount = Anzahl then 
    Edit1.Color := clWindow
  else 
    Edit1.Color := $00B0B0FF;
end;

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if SNTab.RecordCount = Anzahl then 
      close;

    if SNLagerTab.Locate ('SERNUMMER', Edit1.Text, [loCaseInsensitive]) then 
      SNLagerGridDblClick(Sender);
    Edit1.Text := '';
  end;
end;  

//------------------------------------------------------------------------------
procedure TSNAuswahlForm.SNLagerGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #32) or (key = #13) then
  begin
    key := #0;
    if SNTab.RecordCount = Anzahl then 
      close
    else 
      SNLagerGridDblClick(Sender);
  end;
end;  

//------------------------------------------------------------------------------

end.

