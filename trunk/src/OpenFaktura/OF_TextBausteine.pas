{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : [[ add description here! ]]                                       }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  gehˆrt zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung f¸r irgendeinen Zweck verˆffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
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

unit OF_TextBausteine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, ToolWin, ImgList, StdCtrls, Db, Grids,  DBGrids, 
  JvDBCtrl, ZQuery, ZMySqlQuery, Buttons, JvSpeedButton, Menus, 
  btJvxRichPopup, JvRichEd, JvDBRichEd, ComCtrls, JvComCtrls, Mask;
  CaoGroupBox, OFDBGrid, 
  
type
  TTextBausteinForm = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    TopPanel: TPanel;
    PC1: TJvPageControl;
    ListeTS: TTabSheet;
    DetailTS: TTabSheet;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    UebernehmenBtn: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    TbsTab: TZQuery;
    TbsDS: TDataSource;
    TBSGrid: TOFDBGrid;
    TbsTabID: TIntegerField;
    TbsTabBESCHREIBUNG: TStringField;
    TbsTabLANGTEXT: TMemoField;
    LangTextGB: TOFGroupBox;
    KurzTextGB: TOFGroupBox;
    DBEdit4: TDBEdit;
    LangtextRichEdit: TJvDBRichEdit;
    ListeBtn: TJvSpeedButton;
    DetailBtn: TJvSpeedButton;
    Label1: TLabel;
    FontDialog1: TFontDialog;
    ImageList1: TImageList;
    ToolButton5: TToolButton;
    BTJvxRichPopUpMenu1: TBTJvxRichPopUpMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TbsTabNewRecord(DataSet: TDataSet);
    procedure TBSGridDblClick(Sender: TObject);
    procedure TabSelectBtnClick(Sender: TObject);
    procedure TbsTabAfterScroll(DataSet: TDataSet);
    procedure TbsTabAfterDelete(DataSet: TDataSet);
    procedure PC1Change(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure TbsTabBeforePost(DataSet: TDataSet);
    procedure LangtextRichEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure UebernehmenBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    GlobTBS: String;
    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);  message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    function GetTBS (var TBS: String; UseRTF: Boolean): Boolean;
  end;
    
var
  TextBausteinForm: TTextBausteinForm;
  
implementation

uses 
  OF_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
function TTextBausteinForm.GetTBS (var TBS: String; UseRTF: Boolean): Boolean;
begin
  UebernehmenBtn.Visible := True;
  Result := ShowModal = mrOK;
  if Result then 
    TBS := GlobTBS 
  else 
    TBS := '';
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.FormCreate(Sender: TObject);
begin
  DetailBtn.Align := alRight;
  ListeBtn.Align  := alRight;
  PC1.HideAllTabs := True;
  PC1.ActivePage  := ListeTS;

  with BTJvxRichPopupMenu1 do
  begin
    miUndo.ImageIndex       := 13;
    miCut.ImageIndex        := 0;
    miCopy.ImageIndex       := 1;
    miPaste.ImageIndex      := 2;
    miClear.ImageIndex      := -1;
    miSelectAll.ImageIndex  := -1;
    miFont.ImageIndex       := 4;
    miLeft.ImageIndex       := 9;
    miCenter.ImageIndex     := 10;
    miRight.ImageIndex      := 11;
    miBold.ImageIndex       := 5;
    miUnderlined.ImageIndex := 7;
    miItalic.ImageIndex     := 6;
    miBullet.ImageIndex     := 12;
  end;

  UebernehmenBtn.Visible := False;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.FormActivate(Sender: TObject);
begin
  TBSTab.Open;
  PC1.ActivePage  := ListeTS;
  PC1Change(sender);

  TBSGrid.RowColor2 := DM1.C2Color;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.FormDeactivate(Sender: TObject);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.FormCloseQuery(Sender: TObject;
var CanClose: Boolean);
begin
  TBSTab.Close;
  UebernehmenBtn.Visible := False;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 600;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 400;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TbsTabNewRecord(DataSet: TDataSet);
begin
  PC1.ActivePage := DetailTS;
  PC1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TBSGridDblClick(Sender: TObject);
begin
  if TBSTab.RecordCount > 0 then
  begin
    PC1.ActivePage := DetailTS;
    PC1Change(Self);
  end;
end;                      

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TabSelectBtnClick(Sender: TObject);
begin
  if Sender is tJvSpeedButton then
    PC1.ActivePage := PC1.Pages[tJvSpeedButton(Sender).Tag-1];
  PC1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TbsTabAfterScroll(DataSet: TDataSet);
begin
  DetailBtn.Enabled := (TBSTab.RecordCount>0)or(TBSTab.State = dsInsert);
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TbsTabAfterDelete(DataSet: TDataSet);
begin
  PC1.ActivePage := ListeTS;
  PC1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.PC1Change(Sender: TObject);
begin
  ListeBtn.Font.Style  := [];
  DetailBtn.Font.Style := [];

  if PC1.ActivePage = ListeTS then
  begin
    ListeBtn.Font.Style  := [fsBold];
  end else
  begin
    DetailBtn.Font.Style  := [fsBold];
    DetailBtn.Enabled     := True;
  end;
end; 

//------------------------------------------------------------------------------
procedure TTextBausteinForm.ListeBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and
     (tJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.ListeBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.TbsTabBeforePost(DataSet: TDataSet);
begin
  if (length(TbsTabBESCHREIBUNG.AsString) = 0) or
     (LangtextRichEdit.Lines.Count = 0) then
  begin
    MessageDlg ('Die Beschreibung und der Langtext m¸ssen' + #13#10 +
      'ausgef¸llt werden, speichern nicht mˆglich.',
      mterror, [mbok], 0);
    Abort;
  end;
end;  

//------------------------------------------------------------------------------
procedure TTextBausteinForm.LangtextRichEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) and (LangtextRichEdit.SelLength > 0) then
  begin
    if Key = Ord('F') then
    begin
      Key := 0;
      CharAttr(LangtextRichEdit, fsBold);
    end else
    if Key = Ord('K') then
    begin
      Key := 0;
      CharAttr(LangtextRichEdit, fsItalic);
    end else
    if Key = Ord('U') then
    begin
      Key := 0;
      CharAttr(LangtextRichEdit, fsUnderline);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TTextBausteinForm.UebernehmenBtnClick(Sender: TObject);
begin
  try
    LangtextRichEdit.WordWrap := False;
    GlobTBS := LangtextRichEdit.Lines.Text;
    ModalResult := mrOK; // Schlieﬂt den Dialog
  finally
    LangtextRichEdit.WordWrap := True;
  end;
end;

//------------------------------------------------------------------------------

end.
