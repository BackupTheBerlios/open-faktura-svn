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
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Adressen_Lief;

interface
// 16.10.09-ud.IO.
uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, VolDBEdit, DBCtrls, StdCtrls, Mask, JvExMask, JvToolEdit,
  JvDBControls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid,
  ComCtrls, JvExComCtrls, JvComCtrls, ToolWin;

type
  TAdressenLiefForm = class(TForm)
    ToolBar1: TToolBar;
    PC1: TJvPageControl;
    ListeTS: TTabSheet;
    DetailsTS: TTabSheet;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    AddrGrid: TOFDBGrid;
    DetailBtn: TToolButton;
    ToolButton3: TToolButton;
    UebernehmenBtn: TToolButton;
    KunLiefTab: TZQuery;
    KunLiefDS: TDataSource;
    KunLiefTabREC_ID: TIntegerField;
    KunLiefTabADDR_ID: TIntegerField;
    KunLiefTabANREDE: TStringField;
    KunLiefTabNAME1: TStringField;
    KunLiefTabNAME2: TStringField;
    KunLiefTabABTEILUNG: TStringField;
    KunLiefTabSTRASSE: TStringField;
    KunLiefTabLAND: TStringField;
    KunLiefTabPLZ: TStringField;
    KunLiefTabORT: TStringField;
    KunLiefTabINFO: TMemoField;
    LiefAnsrGB: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    lplz: TJvDBComboEdit;
    lort: TJvDBComboEdit;
    lstrasse: TDBEdit;
    labteilung: TDBEdit;
    lname3: TDBEdit;
    lname2: TDBEdit;
    lname1: TDBEdit;
    lanrede: TVolgaDBEdit;
    lland: TDBEdit;
    KunLiefTabNAME3: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure AddrGridDblClick(Sender: TObject);
    procedure KunLiefTabAfterInsert(DataSet: TDataSet);
    procedure KunLiefTabBeforePost(DataSet: TDataSet);
    procedure UebernehmenBtnClick(Sender: TObject);
    procedure KunLiefTabBeforeDelete(DataSet: TDataSet);
    procedure KunLiefTabAfterOpen(DataSet: TDataSet);
    procedure lplzButtonClick(Sender: TObject);
    procedure lanredeEnter(Sender: TObject);
    procedure lanredeExit(Sender: TObject);
    procedure lanredeKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure lanredeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
    AddrID: Integer;
  public
    { Public-Deklarationen }
    procedure Edit (NewAdressID: Integer);
    function Get (NewAdressID: Integer; var LiefAddrID: Integer): Boolean;
  end;
    
var
  AdressenLiefForm: TAdressenLiefForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Main, OF_Kunde, OF_PLZ;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.FormCreate(Sender: TObject);
var 
  I: Integer;
begin
  try 
    TranslateComponent(self);  
  except 
  end;

  for i := 0 to PC1.PageCount-1 do 
    PC1.Pages[i].TabVisible := False;
  Height := Height - 20;
  PC1.ActivePage := PC1.Pages[0];

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.Edit(NewAdressID: Integer);
begin
  AddrGrid.RowColor1 := DM1.C2Color;
  AddrGrid.EditColor := DM1.EditColor;
  PC1.HintColor := Application.HintColor;
  AddrID := NewAdressID;
  KunLiefTab.Close;
  KunLiefTab.ParamByName('ADDR_ID').AsInteger := AddrID;
  KunLiefTab.Open;
  PC1.ActivePage := PC1.Pages[0];
  UebernehmenBtn.Visible := False;
  DetailBtn.Caption := 'Details';
  DetailBtn.ImageIndex := 48;
  PC1.ActivePage := ListeTS;
  ShowModal;
  KunLiefTab.Close;
end;                            

//------------------------------------------------------------------------------
function TAdressenLiefForm.Get (NewAdressID: Integer; var LiefAddrID: Integer): Boolean;
var 
  Res: Integer;
begin
  Result := False;
  AddrGrid.RowColor1 := DM1.C2Color;
  AddrGrid.EditColor := DM1.EditColor;
  PC1.HintColor := Application.HintColor;
  AddrID := NewAdressID;
  KunLiefTab.Close;
  KunLiefTab.ParamByName('ADDR_ID').AsInteger := AddrID;
  KunLiefTab.Open;
  PC1.ActivePage := PC1.Pages[0];
  UebernehmenBtn.Visible := True;
  DetailBtn.Caption := _('Details');
  DetailBtn.ImageIndex := 48;
  PC1.ActivePage := ListeTS;
  Res := ShowModal;
  if Res = mrOK then
  begin
    LiefAddrID := KunLiefTabREC_ID.AsInteger;
    Result := True;
  end;
  KunLiefTab.Close;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.AddrGridDblClick(Sender: TObject);
begin
  if (PC1.ActivePage <> DetailsTS) and (KunLiefTab.RecordCount > 0) then
  begin
    PC1.ActivePage := DetailsTS;
    DetailBtn.Caption := _('Liste');
    DetailBtn.ImageIndex := 5;
  end else
  begin
    DetailBtn.Caption := _('Details');
    DetailBtn.ImageIndex := 48;
    PC1.ActivePage := ListeTS;
  end;
end; 

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabAfterInsert(DataSet: TDataSet);
begin
  PC1.ActivePage := DetailsTS;
  DetailBtn.Caption := _('Liste');
  DetailBtn.ImageIndex := 5;
  if PC1.ActivePage = DetailsTS then lanrede.setfocus;
  KunLiefTabLAND.AsString := DM1.LandK2;

  if (not (KunLiefTab.State = dsInsert)) then 
    KunLiefTab.Append;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabBeforePost(DataSet: TDataSet);
begin
  if length(KunLiefTabNAME1.AsString) = 0 then
  begin
    MessageDlg (_('Das Feld Name1 muß einen Wert haben !'), mterror, [mbok], 0);
    Abort; exit;
  end;
  if length(KunLiefTabStrasse.AsString) = 0 then
  begin
    MessageDlg (_('Das Feld Straße muß einen Wert haben !'), mterror, [mbok], 0);
    Abort; exit;
  end;
  if length(KunLiefTabLand.AsString)<>2 then
  begin
    MessageDlg (_('Das Feld Land muß einen Wert haben !'), mterror, [mbok], 0);
    Abort; exit;
  end;
  if length(KunLiefTabPLZ.AsString) = 0 then
  begin
    MessageDlg (_('Das Feld PLZ muß einen Wert haben !'), mterror, [mbok], 0);
    Abort; exit;
  end;
  if length(KunLiefTabOrt.AsString) = 0 then
  begin
    MessageDlg (_('Das Feld Ort muß einen Wert haben !'), mterror, [mbok], 0);
    Abort; exit;
  end;

  KunLiefTabADDR_ID.AsInteger := AddrID;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.UebernehmenBtnClick(Sender: TObject);
begin
  ModalResult := mrOK;
  //Close;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabBeforeDelete(DataSet: TDataSet);
begin
  // 1. im Journal LIEF_ADDR_ID löschen
  with dm1.UniQuery do
  begin
    sql.clear;
    SQL.Add('update JOURNAL');
    SQL.Add('set LIEF_ADDR_ID="-1"');
    SQL.Add('Where LIEF_ADDR_ID=' + IntToStr(KunLiefTabRec_ID.Value));
    SQL.Add('and QUELLE != 6 and QUELLE != 16');
    execsql;
  end;
end;       

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.KunLiefTabAfterOpen(DataSet: TDataSet);
begin
  UebernehmenBtn.Enabled := KunLiefTab.RecordCount>0;
  DetailBtn.Enabled      := KunLiefTab.RecordCount>0;
  if (not (KunLiefTab.State in [dsEdit, dsInsert])) and (KunLiefTab.RecordCount = 0) then 
    PC1.ActivePage := PC1.Pages[0];
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lplzButtonClick(Sender: TObject);
var 
  sland, 
  splz, 
  sort, 
  svwahl: string;
begin
  if not KunLiefTab.Active then 
    exit;
  SLAND  := LLand.Text;
  SPLZ   := LPLZ.Text;
  SORT   := LOrt.Text;
  SVWAHL := '';
  if PLZForm.Get(tControl(Sender).Tag, SLAND, SPLZ, SORT, SVWAHL) then
  begin
    if not (KunLiefTab.State in [dsEdit, dsInsert]) then 
      KunLiefTab.Edit;

    KunLiefTabLand.Value  := SLand;
    KunLiefTabPLZ.Value   := SPLZ;
    KunLiefTabOrt.Value   := SORT;
  end;
end;  

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeEnter(Sender: TObject);
begin
  TDBEdit(sender).Color := DM1.EditColor;
end;

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeExit(Sender: TObject);
var 
  SLand, 
  SOrt, 
  SPlz, 
  SVWahl: string;
begin
  tDBEdit(sender).Color := clWindow;
  if (Sender is tJVDBComboEdit) and (uppercase(tJVDBComboEdit(Sender).Name) = 'LPLZ') and
     (KunLiefTab.State in [dsInsert]) then
  begin
    SLand  := LLand.Text;
    SPLZ   := LPLZ.Text;
    SOrt   := LOrt.Text;
    SVWahl := '';

    if PLZForm.GetDataIfUniquePLZ(SLAND, SPLZ, SORT, SVWAHL) then
    begin
      KunLiefTabLand.Value  := SLand;
      KunLiefTabPLZ.Value   := SPLZ;
      KunLiefTabOrt.Value   := SORT;
    end;
  end;
end;                             

//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (key = 33) then // PGUP
  begin
    KunLiefTab.Prior;
    key := 0;
  end else
  begin
    if (Shift = []) and (key = 34) then // PGDOWN
    begin
      KunLiefTab.Next;
      key := 0;
    end;
  end; 
end;
  
//------------------------------------------------------------------------------
procedure TAdressenLiefForm.lanredeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if uppercase(tControl(Sender).Name) = 'LORT' then 
      LAnrede.SetFocus
    else 
      SendMessage (Self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;  

//------------------------------------------------------------------------------

end.

