{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Erstellung von Teil-Lieferungen aus Rechnungen                    }
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
{ 09.11.2003 - Bug bei Lagermengen < 0 beseitigt                               }
{ 07.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_TeilLieferDlg;

{$I OF.INC}

interface
// 16.10.09-ud.nIO.
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSqlUpdate, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, StdCtrls, Buttons,
  DBCtrls, ExtCtrls;
{
uses
  ZUpdateSql,
}

type
  TTeilLieferForm = class(TForm)
    Panel1: TPanel;
    LiefTab: TZQuery;
    LiefDS: TDataSource;
    ExRxDBGrid1: TOFDBGrid;
    LiefTabREC_ID: TIntegerField;
    LiefTabARTIKEL_ID: TIntegerField;
    LiefTabPOSITION: TIntegerField;
    LiefTabARTNUM: TStringField;
    LiefTabMATCHCODE: TStringField;
    LiefTabBEZEICHNUNG: TMemoField;
    LiefTabME_RE: TFloatField;
    LiefTabLIEFERMENGE: TFloatField;
    LiefTabMENGE_GELIEFERT: TFloatField;
    LiefTabLAGERMENGE: TFloatField;
    ZUpdateSql1: TZUpdateSql;
    DBNavigator1: TDBNavigator;
    MakeLiefBtn: TBitBtn;
    AbbruchBtn: TBitBtn;
    procedure LiefTabBeforePost(DataSet: TDataSet);
    procedure LiefTabBeforeDelete(DataSet: TDataSet);
    procedure AbbruchBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MakeLiefBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LiefTabAfterPost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    LiefID: Integer;
    
    Fertig : Boolean;
    Abbruch: Boolean;
  public
    { Public-Deklarationen }
    function ShowDlg (Journal_ID: Integer): Boolean;
  end;
    
var
  TeilLieferForm: TTeilLieferForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Var_Const,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_LiefExport_Dlg, OF_Progress, OF_MakeVKRech;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TTeilLieferForm.FormCreate(Sender: TObject);
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
function TTeilLieferForm.ShowDlg (Journal_ID: Integer): Boolean;
var 
  M: Double;
begin
  ExRxDBGrid1.RowColor1 := DM1.C2Color;
  ExRxDBGrid1.EditColor := DM1.EditColor;

  LiefID := DM1.CopyRechnung (Journal_ID, VK_LIEF_EDI);
  LiefTab.ParamByName ('JID').AsInteger := LiefID;
  LiefTab.Open;
  LiefTab.DisableControls;
  while not LiefTab.Eof do
  begin
    LiefTab.Edit;
    M := LiefTabME_RE.AsFloat - LiefTabMENGE_GELIEFERT.AsFloat;
    if M > LiefTabLAGERMENGE.AsFloat then 
      M := LiefTabLAGERMENGE.AsFloat;
    if M < 0 then 
      M := 0;
    LiefTabLIEFERMENGE.AsFloat := M;
    LiefTab.Post;
    LiefTab.Next;
  end;
  LiefTab.First;
  LiefTab.EnableControls;
  ProgressForm.Stop;
  Abbruch := False;
  Fertig  := False;

  ShowModal;

  LiefTab.Close;
  if Abbruch then 
    DM1.Storno_Lieferschein (LiefID);
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure TTeilLieferForm.LiefTabBeforePost(DataSet: TDataSet);
var 
  M: Double;
begin
  if LiefTab.State = dsInsert then 
  begin 
    Abort; 
    LiefTab.Cancel; 
  end;

  M := LiefTabME_RE.AsFloat - LiefTabMENGE_GELIEFERT.AsFloat;
  if LiefTabLIEFERMENGE.AsFloat > M then
  begin
    MessageDlg (_('Die Liefermenge + bereits gelieferte Mengen dürfen' + #13#10 +
      'nicht größer als die Rechnungsmenge sein !'), mtError, [mbok], 0);
    Abort;
    //Break;
  end;
end;

//------------------------------------------------------------------------------
procedure TTeilLieferForm.LiefTabBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

//------------------------------------------------------------------------------
procedure TTeilLieferForm.AbbruchBtnClick(Sender: TObject);
begin
  if not Fertig then 
    Abbruch := True;
  Close;
end;

//------------------------------------------------------------------------------
procedure TTeilLieferForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  if not Fertig then 
    Abbruch := True;
end;

//------------------------------------------------------------------------------
procedure TTeilLieferForm.MakeLiefBtnClick(Sender: TObject);
var 
  ls_num : String;
  CurrPos: Integer;
  LieferscheinID: Integer;
  LiefExportDlg: TLiefExportDlg;
begin
  Fertig := True;
  // jetzt Lieferschein erstellen
  ls_num := dm1.buche_lieferschein (LiefID, True, LieferscheinID);

  // 2. In allen Positionen der EDI-Rechnung die Lieferscheinnummer eintragen
  if length(ls_num) > 0 then
  begin
    //LS-Nummer in die Positionen eintragen
    MakeVKReForm.PosTab.DisableControls;
    try
      CurrPos := MakeVKReForm.PosTab.RecNo;


      MakeVKReForm.PosTab.First;
      while not MakeVKReForm.PosTab.Eof do
      begin
        MakeVKReForm.PosTab.Edit;
        MakeVKReForm.PosTabVLSNum.AsString := ls_num;
        MakeVKReForm.PosTab.Post;
        MakeVKReForm.PosTab.Next;
      end;
      MakeVKReForm.PosTab.Locate ('POSITION', variant (CurrPos), []);
    finally
      MakeVKReForm.PosTab.EnableControls;
      MakeVKReForm.UpBtn1.Enabled := True;
      MakeVKReForm.UpBtn2.Enabled := True;
    end;

    if not (MakeVKReForm.ReEdiTab.State in [dsEdit, dsInsert]) then 
      MakeVKReForm.ReEdiTab.Edit;
    try
      MakeVKReForm.ReEdiTabVLSNum.AsString := ls_num;
      MakeVKReForm.ReEdiTabLDatum.Value := Now;
      MakeVKReForm.ReEdiTab.Post;
    except
      MakeVKReForm.ReEdiTab.Cancel;
    end;
  end;

  MakeVKReForm.LieferscheinBuchenBtn.Enabled := False;
  MakeVKReForm.TeillieferungBtn.Enabled := False;

  Fertig := True;
  Close;

  try
    LiefExportDlg := TLiefExportDlg.Create(Self);
    try
      LiefExportDlg.MakeExport (MakeVKReForm.ReEdiTabLiefArt.AsInteger,
      LieferscheinID);
    finally
      LiefExportDlg.Free;
    end;
  except 
  end;

  {$IFDEF WITH_REPORT}
  PrintRechForm.ShowBelegDlg (VK_LIEF, LieferscheinID, False);
  {$ELSE}
  MessageDlg (_('Der Code zum drucken des Lieferscheines' + #13#10 +
    'ist in die GNU-Version noch nicht implementiert !'),
    mterror, [mbok], 0);
  {$ENDIF}
end;                    

//------------------------------------------------------------------------------
procedure TTeilLieferForm.LiefTabAfterPost(DataSet: TDataSet);
begin
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------

end.

