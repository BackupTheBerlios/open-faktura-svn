{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Hersteller erstellen und pflegen (bearbeiten)                     }
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
{ - Hersteller löschen                                                         }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 09.02.2004 - Dialog überarbeitet, da nicht gespeichert wurde, wenn das Name-Feld }
{              nicht verlassen wurde }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Hersteller;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, VolDBEdit{???},
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, OFDBGrid, OFGroupBox;
{
uses
  ComCtrls, ToolWin,
  JvDBCtrl, JvCombobox,
}
type
  THerstellerForm = class(TForm)
    MainPanel: TPanel;
    HerstInfoTab: TZQuery;
    HerstInfoDS: TDataSource;
    ListeGB: TOFGroupBox;
    HerstellerGrid: TOFDBGrid;
    CaoGroupBox7: TOFGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    HerstNameEdi: TDBEdit;
    HerstInfoUrlEdi: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    HerstellerTab: TZQuery;
    HerstellerDS: TDataSource;
    HerstellerTabSHOP_ID: TIntegerField;
    HerstellerTabHERSTELLER_ID: TIntegerField;
    HerstellerTabADDR_ID: TIntegerField;
    HerstellerTabHERSTELLER_NAME: TStringField;
    HerstellerTabHERSTELLER_IMAGE: TStringField;
    HerstellerTabLAST_CHANGE: TDateTimeField;
    HerstellerTabSHOP_DATE_ADDED: TDateTimeField;
    HerstellerTabSHOP_DATE_CHANGE: TDateTimeField;
    HerstInfoTabHERSTELLER_URL: TStringField;
    HerstInfoTabURL_CLICKED: TIntegerField;
    HerstInfoTabDATE_LAST_CLICK: TDateTimeField;
    HerstellerTabCHANGE_FLAG: TBooleanField;
    HerstellerTabDEL_FLAG: TBooleanField;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ShopDelCB: TDBCheckBox;
    ProdImageUploadBtn: TSpeedButton;
    SprachLB: TVolgaDBEdit;
    HerstInfoTabSHOP_ID: TIntegerField;
    HerstInfoTabHERSTELLER_ID: TIntegerField;
    HerstInfoTabSPRACHE_ID: TIntegerField;
    AddBtn: TSpeedButton;
    SaveBtn: TSpeedButton;
    AbortBtn: TSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure HerstellerTabAfterScroll(DataSet: TDataSet);
    procedure HerstellerTabBeforePost(DataSet: TDataSet);
    procedure HerstellerTabBeforeDelete(DataSet: TDataSet);
    procedure SprachLBChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure HerstInfoTabBeforePost(DataSet: TDataSet);
    procedure HerstellerDSDataChange(Sender: TObject; Field: TField);
    procedure AddBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure AbortBtnClick(Sender: TObject);
    procedure ProdImageUploadBtnClick(Sender: TObject);
    procedure HerstInfoTabAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure HerstellerDSStateChange(Sender: TObject);
  private
    { Private-Deklarationen }
    ShopID  : Integer;
    SprachID: Integer;
  public
    { Public-Deklarationen }
    procedure ShowDialog (NewShopID: Integer);
  end;
    
    //var HerstellerForm: THerstellerForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM, OF_ShopImageUpload, OF_Progress;

//------------------------------------------------------------------------------
procedure THerstellerForm.FormCreate(Sender: TObject);
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
procedure THerstellerForm.ShowDialog (NewShopID: Integer);
begin
  ShopID := NewShopID;
  if ShopID < 1 then 
    SHOPID := 1;

  SprachID := DM1.DefSpracheID;

  //Sprachen in Listbox füllen
  SprachLB.ComboProps.ComboItems.Clear;
  SprachLB.ComboProps.ComboValues.Clear;

  DM1.SprachTab.First;
  while not DM1.SprachTab.Eof do
  begin
    SprachLB.ComboProps.ComboItems.Add  (DM1.SprachTab.FieldByName ('NAME').AsString);
    SprachLB.ComboProps.ComboValues.Add (DM1.SprachTab.FieldByName ('SPRACH_ID').AsString);

    DM1.SprachTab.Next;
  end;
  SprachLB.CreateDropDownList;

  SprachLB.Value := SprachID;

  HerstellerTab.Close;
  HerstellerTab.ParamByName ('SID').AsInteger := ShopID;
  HerstInfoTab.ParamByName ('SID').AsInteger := ShopID;
  HerstInfoTab.ParamByName ('SPID').AsInteger := SprachID;

  HerstellerTab.Open;

  HerstellerGrid.RowColor1 := DM1.C2Color;

  ShowModal;

  HerstInfoTab.Close;
  HerstellerTab.Close;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabAfterScroll(DataSet: TDataSet);
begin
  if HerstInfoTab.State in [dsEdit, dsInsert] then 
    HerstInfoTab.Post;

  HerstInfoTab.Close;

  if HerstellerTab.State = dsInsert then
  begin
    HerstInfoTab.ParamByName ('HID').AsInteger  := -1;
    HerstInfoTab.ParamByName ('SPID').AsInteger := -1;
    HerstInfoTab.ReadOnly := True;
  end else
  begin
    HerstInfoTab.ParamByName ('HID').AsInteger := HerstellerTabHERSTELLER_ID.AsInteger;
    HerstInfoTab.ParamByName ('SPID').AsInteger := SprachID;
    HerstInfoTab.ReadOnly := False;
  end;

  if HerstellerTab.RecordCount > 0 then 
    HerstInfoTab.Open;
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabBeforePost(DataSet: TDataSet);
begin
  HerstellerTabSHOP_ID.AsInteger      := ShopID;
  HerstellerTabLAST_CHANGE.AsDateTime := Now;
  HerstellerTabCHANGE_FLAG.AsBoolean  := True;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerTabBeforeDelete(DataSet: TDataSet);
begin
  //

  // Hersteller-Info löschen
  // in allen Shopartikeln den Hersteller löschen
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.SprachLBChange(Sender: TObject);
begin
  SprachID := SprachLB.Value;
  HerstellerTabAfterScroll(nil);
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if HerstInfoTab.State in [dsEdit, dsInsert] then 
    HerstInfoTab.Post;
  if (HerstellerTab.State in [dsEdit, dsInsert]) then
  begin
    if HerstellerTabHERSTELLER_NAME.AsString = '' then 
      HerstellerTab.Cancel
    else 
      HerstellerTab.Post;
  end;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstInfoTabBeforePost(DataSet: TDataSet);
begin
  HerstInfoTabSHOP_ID.AsInteger := ShopID;
  HerstInfoTabHERSTELLER_ID.AsInteger := HerstellerTabHERSTELLER_ID.AsInteger;
  HerstInfoTabSPRACHE_ID.AsInteger := SprachID;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerDSDataChange(Sender: TObject; Field: TField);
begin
  SaveBtn.Enabled :=
    ((HerstInfoTab.Active) and (HerstInfoTab.State in [dsEdit, dsInsert])) or
    ((HerstellerTab.Active) and (HerstellerTab.State in [dsEdit, dsInsert]));

  AbortBtn.Enabled := SaveBtn.Enabled;
  AddBtn.Enabled := not SaveBtn.Enabled;

  HerstInfoUrlEdi.Enabled := (HerstInfoTab.Active) and (HerstellerTab.State <> dsInsert);
end;                                                  

//------------------------------------------------------------------------------
procedure THerstellerForm.AddBtnClick(Sender: TObject);
begin
  HerstellerTab.Append;
  HerstNameEdi.SetFocus;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.SaveBtnClick(Sender: TObject);
begin
  if HerstNameEdi.Focused then
  begin
    HerstellerTabHERSTELLER_NAME.AsString := HerstNameEdi.Text;
  end;

  if length(HerstellerTabHERSTELLER_NAME.asString) = 0 then
  begin
    MessageDlg (_('Speichern nicht möglich, ' + #13#10 +
      'das Feld Name muß einen Wert enthalten.'),
      mterror, [mbok], 0);
    exit;
  end;

  if (HerstInfoTab.State in [dsEdit, dsInsert]) then 
    HerstInfoTab.Post;
  if (HerstellerTab.State in [dsEdit, dsInsert]) then
  begin
    if HerstellerTabHERSTELLER_NAME.AsString = '' then 
      HerstellerTab.Cancel
    else 
      HerstellerTab.Post;
  end;
  ProgressForm.Stop;
end;  

//------------------------------------------------------------------------------
procedure THerstellerForm.AbortBtnClick(Sender: TObject);
begin
  if HerstInfoTab.State in [dsEdit, dsInsert] then 
    HerstInfoTab.Cancel;
  if HerstellerTab.State in [dsEdit, dsInsert] then 
    HerstellerTab.Cancel;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.ProdImageUploadBtnClick(Sender: TObject);
var 
  Name: String;
begin
  if HerstellerTabHERSTELLER_NAME.AsString = '' then
  begin
    MessageDlg (_('Bitte erst Herstellernamen eingeben !'), mterror, [mbok], 0);
    exit;
  end;

  if FileUpload.HerstellerImage(Name) then
  begin
    if not (HerstellerTab.State in [dsEdit, dsInsert]) then 
      HerstellerTab.Edit;
    HerstellerTabHERSTELLER_IMAGE.AsString := Name;
    HerstellerTab.Post;
  end;
  ProgressForm.Stop;
end;  

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstInfoTabAfterPost(DataSet: TDataSet);
begin
  ProgressForm.Stop;
end;

//------------------------------------------------------------------------------
procedure THerstellerForm.HerstellerDSStateChange(Sender: TObject);
begin
  HerstellerDSDataChange(Sender, nil);
end;

//------------------------------------------------------------------------------

end.

