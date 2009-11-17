{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zur Suche nach Seriennummern                               }
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

unit OF_ArtSernumSuchDlg;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, OFDBGrid, ComCtrls;

type
  TSerNumSuchForm = class(TForm)
    SNSucheArtTab: TZQuery;
    Label1: TLabel;
    SNEdi: TEdit;
    SNSucheArtDS: TDataSource;
    PC1: TPageControl;
    ArtikelTS: TTabSheet;
    SerNumTS: TTabSheet;
    SerNumDetailsTS: TTabSheet;
    CloseBtn: TBitBtn;
    HelpBtn: TBitBtn;
    SuchBtn: TBitBtn;
    SNSucheDS: TDataSource;
    SNSucheTab: TZQuery;
    SNSucheArtTabREC_ID: TIntegerField;
    SNSucheArtTabMATCHCODE: TStringField;
    SNSucheArtTabARTNUM: TStringField;
    SNSucheArtTabKURZNAME: TStringField;
    SNSucheTabSERNUMMER: TStringField;
    SNSucheTabSNUM_ID: TIntegerField;
    ArtikelGrid: TOFDBGrid;
    SerNoGrid: TOFDBGrid;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    NotFoundPan: TPanel;
    NotFoundLab: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    Bevel1: TBevel;
    Label8: TLabel;
    DBText7: TDBText;
    Bevel2: TBevel;
    HistTab: TZQuery;
    HistDS: TDataSource;
    HistTabQUELLE: TIntegerField;
    HistTabBELEGNUM: TStringField;
    HistTabBELEGDATUM: TStringField;
    HistTabKUN_ANREDE: TStringField;
    HistTabKUN_NAME1: TStringField;
    HistTabKUN_NAME2: TStringField;
    HistTabKUN_NAME3: TStringField;
    HistTabKUN_STRASSE: TStringField;
    HistTabKUN_LAND: TStringField;
    HistTabKUN_PLZ: TStringField;
    HistTabKUN_ORT: TStringField;
    HistTabCALC_NAME: TStringField;
    HistTabCALC_QUELLE: TStringField;
    HistGrid: TOFDBGrid;
    procedure SNEdiChange(Sender: TObject);
    procedure SuchBtnClick(Sender: TObject);
    procedure SNSucheArtTabAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SerNoGridDblClick(Sender: TObject);
    procedure ArtikelGridDblClick(Sender: TObject);
    procedure SNEdiKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SNSucheTabAfterOpen(DataSet: TDataSet);
    procedure HistTabCalcFields(DataSet: TDataSet);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
    
    //var SerNumSuchForm: TSerNumSuchForm;
    
implementation

uses
  GNUGetText, OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except
  end;

  ArtikelGrid.RowColor2 := DM1.C2Color;
  SerNoGrid.RowColor2   := DM1.C2Color;
  HistGrid.RowColor2    := DM1.C2Color;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.FormShow(Sender: TObject);
begin
  NotFoundLab.Caption := _('Bitte geben Sie eine Seriennummer ein.');
  NotFoundPan.Visible := True;
  PC1.Visible         := False;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNEdiChange(Sender: TObject);
begin
  SuchBtn.Enabled := length(SNEdi.Text) > 0;
  SNSucheArtTab.Close;
  SNSucheTab.Close;

  FormShow(Sender);
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNEdiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    SuchBtnClick(Sender);
  end;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SuchBtnClick(Sender: TObject);
var S: String;
begin
  S := '%' + SNEdi.Text + '%';
  SNSucheArtTab.ParamByName('SN').AsString := S;
  SNSucheArtTab.Open;

  if SNSucheArtTab.RecordCount = 1 then
  begin
    if SNSucheTab.RecordCount = 1 then
      PC1.ActivePage := SerNumDetailsTS
    else
      PC1.ActivePage := SerNumTS;
    ArtikelTS.TabVisible := False;
    SerNumTS.TabVisible := SNSucheTab.RecordCount > 1;
  end else
  begin
    ArtikelTS.Caption := Format(_('Artikel (%d)'), [SNSucheArtTab.RecordCount]);
    ArtikelTS.TabVisible := SNSucheArtTab.RecordCount > 1;
    PC1.ActivePage := ArtikelTS;
    SerNumTS.TabVisible := SNSucheTab.RecordCount > 0;        //07.11.09-ud. ERROR.
  end;

  PC1.Visible         := SNSucheArtTab.RecordCount > 0;
  NotFoundPan.Visible := SNSucheArtTab.RecordCount = 0;

  if SNSucheArtTab.RecordCount = 0 then
    NotFoundLab.Caption := _('Zu Ihrem Suchbegriff' + #13#10 + 'wurden keine Seiennummern gefunden.');
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.ArtikelGridDblClick(Sender: TObject);
begin
  if SNSucheArtTab.RecordCount > 0 then
  begin
    if SNSucheTab.RecordCount = 1 then
      PC1.ActivePage := SerNumDetailsTS
    else
      PC1.ActivePage := SerNumTS;
  end;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNSucheArtTabAfterScroll(DataSet: TDataSet);
begin
  if SNSucheArtTab.RecordCount = 0 then exit;

  SNSucheTab.Close;
  SNSucheTab.ParamByName('SN').AsString := SNSucheArtTab.ParamByName ('SN').AsString;
  SNSucheTab.ParamByName('AID').AsInteger := SNSucheArtTabREC_ID.AsInteger;
  SNSucheTab.Open;

  SernumTS.Caption := Format(_('Seriennummern (%d)'), [SNSucheTab.RecordCount]);
  SerNumDetailsTS.TabVisible := SNSucheTab.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SerNoGridDblClick(Sender: TObject);
begin
  if SNSucheTab.RecordCount > 0 then
    PC1.ActivePage := SerNumDetailsTS;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.SNSucheTabAfterOpen(DataSet: TDataSet);
begin
  HistTab.Close;
  HistTab.ParamByName('AID').AsInteger := SNSucheArtTabREC_ID.AsInteger;
  HistTab.ParamByName('SID').AsInteger := SNSucheTabSNUM_ID.AsInteger;
  HistTab.Open;
end;

//------------------------------------------------------------------------------
procedure TSerNumSuchForm.HistTabCalcFields(DataSet: TDataSet);
begin
  HistTabCALC_NAME.AsString :=
  Trim (HistTabKUN_ANREDE.AsString + ' ' +
  HistTabKUN_NAME1.AsString + ' ' +
  HistTabKUN_NAME1.AsString + ' ' +
  HistTabKUN_NAME1.AsString + ' ' +
  HistTabKUN_STRASSE.AsString + ' ' +
  HistTabKUN_LAND.AsString + ' ' +
  HistTabKUN_PLZ.AsString + ' ' +
  HistTabKUN_ORT.AsString);

  case HistTabQuelle.AsInteger of
    2: HistTabCALC_QUELLE.AsString := _('Lieferschein');
    3: HistTabCALC_QUELLE.AsString := _('Verkauf');
    5: HistTabCALC_QUELLE.AsString := _('Einkauf');
    12: HistTabCALC_QUELLE.AsString := _('Lief. (EDI)');
    13: HistTabCALC_QUELLE.AsString := _('Verkauf (EDI)');
    15: HistTabCALC_QUELLE.AsString := _('Einkauf (EDI)');
    else HistTabCALC_QUELLE.AsString := '???';
  end;
end;

//------------------------------------------------------------------------------

end.

