{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : allgemeiner Shop-Setup-Dialog                                     }
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
{ 22.07.2003 - Unit erstellt }
{ 25.07.2003 - Shop-Warengruppe hinzugefügt }
{ 27.07.2003 - Einstellung f. Bruttoshop hinzugefügt }
{ 14.10.2003 - KL: Einstellung für SHOP_VK hinzugefügt }
{ 19.02.2004 - JP: Auswahl der Shopsoftware hinzugefügt (osCommerce und xtCommerce) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_ShopSetup;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, StdCtrls, ExtCtrls,
  Mask, JvExMask, JvSpin, ComCtrls, Buttons;
{
uses
  ToolWin, JvToolEdit, JvCurrEdit,
  JvMaskEdit,
  JvDBComb, JvDBCtrl,
}

type
  TShopSetupForm = class(TForm)
    NavPan: TPanel;
    PC1: TPageControl;
    Nav1: TDBNavigator;
    AllgTS: TTabSheet;
    UseShopCB: TCheckBox;
    ShopSaveBtn: TSpeedButton;
    StatusUpdateSM_CB: TCheckBox;
    UrlTS: TTabSheet;
    Label50: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    ProxyServer: TEdit;
    ProxyUser: TEdit;
    ProxyPass: TEdit;
    ProxyPort: TJvSpinEdit;
    TabSheet1: TTabSheet;
    Label46: TLabel;
    ShopOrderstatusGrid: TOFDBGrid;
    Label47: TLabel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ShopZahlArt: TZQuery;
    ShopZahlArtDS: TDataSource;
    ShopZahlArtMAINKEY: TStringField;
    ShopZahlArtSHOP_CLASS: TStringField;
    ShopZahlArtID: TIntegerField;
    ZahlartGrid: TOFDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    ShopZahlArtZahlartStr: TStringField;
    ShopLiefArt: TZQuery;
    ShopLiefArtMainKey: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    ShopLiefArtDS: TDataSource;
    LiefartGrid: TOFDBGrid;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    ShopWgr: TComboBox;
    Label1: TLabel;
    BruttoCB: TCheckBox;
    UpdateMengeCB: TCheckBox;
    UseOrderIDCB: TCheckBox;
    DefDebNumLab: TLabel;
    DefDebNum: TJvSpinEdit;
    ImportMengeCB: TCheckBox;
    ShopPreis: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    Label39: TLabel;
    ShopImportURLEdit: TEdit;
    Label40: TLabel;
    ShopUpdateURLEdi: TEdit;
    ShopUserEdit: TEdit;
    ShopPWEdit: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label3: TLabel;
    ChangeOrderstatusCB: TCheckBox;
    NewOrderStatusLB: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    SWCB: TComboBox;
    UseCusomerIDCB: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ShopSaveBtnClick(Sender: TObject);
    procedure ShopZahlArtBeforePost(DataSet: TDataSet);
    procedure ShopLiefArtBeforePost(DataSet: TDataSet);
    procedure ChangeOrderstatusCBClick(Sender: TObject);
  private
    { Private-Deklarationen }
    First    : Boolean;
    FShopID  : Integer;
    ShopIDStr: String;
    procedure SetShopID (Value: Integer);
  public
    { Public-Deklarationen }
  published
    property ShopID: Integer read FShopID write SetShopID;
  end;
    
    //var
    //  ShopSetupForm: TShopSetupForm;
    
implementation

{$R *.DFM}

uses
  OF_DM, OF_Main;
  
//------------------------------------------------------------------------------
procedure TShopSetupForm.FormCreate(Sender: TObject);
begin
  First := True;
  Nav1.DataSource := nil;
  ShopOrderstatusGrid.DataSource := nil;

  ShopSaveBtn.Left := 3;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;

  ShopID := 1;
end;              

//------------------------------------------------------------------------------
procedure TShopSetupForm.SetShopID (Value: Integer);
begin
  FShopID := Value;

  if ShopID > 1 then 
    ShopIDStr := '_' + IntToStr(ShopID);

  ShopZahlArt.Close;
  ShopZahlArt.Sql.Text :=
    'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID ' +
    'from REGISTRY ' +
    'where MAINKEY="SHOP' + ShopIDStr + '\\ZAHLART_MAP" and Upper(NAME)!="DEFAULT" ' +
    'order by NAME';

  ShopLiefArt.Close;
  ShopLiefArt.Sql.Text :=
    'select MAINKEY, NAME as SHOP_CLASS, VAL_INT as ID ' +
    'from REGISTRY ' +
    'where MAINKEY="SHOP' + ShopIDStr + '\\LIEFART_MAP" and Upper(NAME)!="DEFAULT" ' +
    'order by NAME';

  DM1.ShopOrderStatusTab.Close;
  DM1.ShopOrderStatusTab.Sql.Text :=
    'select VAL_INT as ORDERSTATUS_ID,NAME as LANGBEZ,VAL_BLOB as TEXT,MAINKEY ' +
    'from REGISTRY where MAINKEY="SHOP' + ShopIDStr + '\\ORDERSTATUS" ' +
    'order by ORDERSTATUS_ID';
end;

//------------------------------------------------------------------------------
procedure TShopSetupForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  Nav1.DataSource     := nil;
  ShopOrderstatusGrid.DataSource := nil;

  ShopZahlArt.Close;
  ShopLiefArt.Close;

  DM1.ShopOrderStatusTab.Close;
  DM1.ShopOrderStatusTab.Sql.Text :=
    'select VAL_INT as ORDERSTATUS_ID,NAME as LANGBEZ,VAL_BLOB as TEXT,MAINKEY ' +
    'from REGISTRY where MAINKEY="SHOP' + ShopIDStr + '\\ORDERSTATUS" ' +
    'order by ORDERSTATUS_ID';
  DM1.ShopOrderStatusTab.Open;
end;

//------------------------------------------------------------------------------
procedure TShopSetupForm.PC1Change(Sender: TObject);
var 
  W: Integer;
begin
  case PC1.ActivePage.Tag of
    3: begin
      Nav1.DataSource := DM1.ShopOSDS;
    end;
    4: begin
      if not ShopLiefArt.Active then 
        ShopLiefArt.Open;
      if not DM1.LiefartTab.Active then 
        dm1.LiefartTab.open;
      Nav1.DataSource := ShopLiefArtDS;
    end;
    5: begin
      if not ShopZahlArt.Active then 
        ShopZahlArt.Open;
      if not DM1.ZahlartTab.Active then 
        dm1.ZahlartTab.open;
      Nav1.DataSource := ShopZahlArtDS;
    end;
  end;

  ShopSaveBtn.Visible := PC1.ActivePage.Tag in [1, 2];

  Nav1.Visible        := PC1.ActivePage.Tag in [3, 4, 5];

  Nav1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit,
  nbPost, nbCancel, nbRefresh, nbInsert, nbDelete];


  if PC1.ActivePage.Tag = 1 then
  begin
    if not DM1.ShopOrderStatusTab.Active then 
      DM1.ShopOrderStatusTab.Open;

    NewOrderStatusLB.Items.Clear;
    DM1.ShopOrderStatusTab.First;
    while not DM1.ShopOrderStatusTab.Eof do
    begin
      NewOrderStatusLB.Items.Add (DM1.ShopOrderStatusTabLANGBEZ.AsString);
      DM1.ShopOrderStatusTab.Next;
    end;

    ChangeOrderstatusCB.Checked := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'UPDATEORDERSTATUS', False);
    W := DM1.ReadInteger ('SHOP' + ShopIDStr, 'DEFAULT_ORDERSTATUS', 0);

    if DM1.ShopOrderStatusTab.Locate ('ORDERSTATUS_ID', W, []) then
      NewOrderStatusLB.ItemIndex  := NewOrderStatusLB.Items.IndexOf (DM1.ShopOrderStatusTabLANGBEZ.AsString);
    ChangeOrderstatusCBClick(self);

    UseShopCB.Checked         := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'USE_SHOP', False);
    SWCB.ItemIndex            := DM1.ReadInteger ('SHOP' + ShopIDStr, 'TYP', 0);

    StatusUpdateSM_CB.Checked := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'UPDATEORDERSTATUS_SENDMAIL', False);
    BruttoCB.Checked          := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'BRUTTO_SHOP', False);

    UseOrderIDCB.Checked      := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'USE_SHOP_ORDERID', False);
    UseCusomerIDCB.Checked    := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'USE_SHOP_CUSTOMERID', False);
    UpdateMengeCB.Checked     := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'UPDATE_MENGE', False);

    ImportMengeCB.Checked     := DM1.ReadBoolean ('SHOP' + ShopIDStr, 'IMPORT_MENGE', True);

    DefDebNum.Value           := DM1.ReadInteger ('SHOP' + ShopIDStr, 'DEFAULT_DEBNUM', 0);
    ShopPreis.ItemIndex       := DM1.ReadInteger ('SHOP' + ShopIDStr, 'SHOP_VK', 0);

    Nav1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh, nbInsert, nbDelete];

    W := DM1.ReadInteger ('SHOP' + ShopIDStr, 'DEFAULT_WGR', 0);
    ShopWgr.Items.Clear;
    if not DM1.WgrTab.Active then 
      DM1.WgrTab.Open;
    DM1.WgrTab.First;
    While not DM1.WgrTab.Eof do
    begin
      if DM1.WgrTabID.AsInteger > 0 then 
        ShopWgr.Items.Add (DM1.WgrTabName.AsString);

      if DM1.WgrTabID.AsInteger = W then 
        ShopWgr.ItemIndex := ShopWgr.Items.Count-1;

      DM1.WgrTab.Next;
    end;
  end;

  if PC1.ActivePage.Tag = 2 then
  begin
    ShopUserEdit.Text      := DM1.ReadString  ('SHOP' + ShopIDStr, 'SHOPTRANS_USER', '');
    ShopPWEdit.Text        := DM1.ReadString  ('SHOP' + ShopIDStr, 'SHOPTRANS_SECRET', '');
    ShopImportURLEdit.Text := DM1.ReadString  ('SHOP' + ShopIDStr, 'IMPORT_URL', '');
    ShopUpdateURLEdi.Text  := DM1.ReadString  ('SHOP' + ShopIDStr, 'UPDATE_URL', '');

    ProxyPort.Value        := DM1.ReadInteger ('SHOP' + ShopIDStr, 'PROXY_PORT', 0);
    ProxyServer.Text       := DM1.ReadString  ('SHOP' + ShopIDStr, 'PROXY_SERV', '');
    ProxyUser.Text         := DM1.ReadString  ('SHOP' + ShopIDStr, 'PROXY_USER', '');
    ProxyPass.Text         := DM1.ReadString  ('SHOP' + ShopIDStr, 'PROXY_PASS', '');
  end;

  if Nav1.Visible and ShopSavebtn.Visible then 
    ShopSaveBtn.Left := Nav1.Left + Nav1.Width + 3
  else 
    ShopSaveBtn.Left := Nav1.Left;
end;

//------------------------------------------------------------------------------
procedure TShopSetupForm.FormShow(Sender: TObject);
begin
  ZahlartGrid.RowColor1          := DM1.C2Color;
  LiefartGrid.RowColor1          := DM1.C2Color;
  ShopOrderstatusGrid.RowColor1  := DM1.C2Color;
  ZahlartGrid.EditColor          := DM1.EditColor;
  LiefartGrid.EditColor          := DM1.EditColor;
  ShopOrderstatusGrid.EditColor  := DM1.EditColor;
  ShopOrderstatusGrid.DataSource := DM1.ShopOSDS;
  DM1.ShopOrderStatusTab.Open;

  PC1.ActivePage := AllgTS;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TShopSetupForm.ShopSaveBtnClick(Sender: TObject);
var 
  W, P: String;
begin
  if PC1.ActivePage.Tag = 1 then
  begin
    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'USE_SHOP', UseShopCB.Checked);
    DM1.WriteInteger ('SHOP' + ShopIDStr, 'TYP', SWCB.ItemIndex);

    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'UPDATEORDERSTATUS_SENDMAIL', StatusUpdateSM_CB.Checked);
    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'BRUTTO_SHOP', BruttoCB.Checked);

    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'USE_SHOP_ORDERID', UseOrderIDCB.Checked);
    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'USE_SHOP_CUSTOMERID', UseCusomerIDCB.Checked);
    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'UPDATE_MENGE', UpdateMengeCB.Checked);
    DM1.WriteInteger ('SHOP' + ShopIDStr, 'DEFAULT_DEBNUM', Trunc(DefDebNum.Value));

    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'IMPORT_MENGE', ImportMengeCB.Checked);

    DM1.WriteInteger ('SHOP' + ShopIDStr, 'SHOP_VK', SHOPPREIS.ItemIndex);

    W := '';
    if ShopWGR.ItemIndex > -1 then  
      W := ShopWgr.Items[ShopWGR.ItemIndex];

    if not DM1.WgrTab.Active then 
      DM1.WgrTab.Open;
    DM1.WgrTab.First;
    While not DM1.WgrTab.Eof do
    begin
      if DM1.WgrTabNAME.AsString = W then 
        DM1.WriteInteger ('SHOP' + ShopIDStr, 'DEFAULT_WGR', DM1.WgrTabID.AsInteger);
      DM1.WgrTab.Next;
    end;

    DM1.WriteBoolean ('SHOP' + ShopIDStr, 'UPDATEORDERSTATUS', ChangeOrderstatusCB.Checked);


    W := NewOrderStatusLB.Items[NewOrderStatusLB.ItemIndex];
    if (length(W) > 0) and (DM1.ShopOrderStatusTab.Locate ('LANGBEZ', W, [])) then 
      DM1.WriteInteger ('SHOP' + ShopIDStr, 'DEFAULT_ORDERSTATUS', DM1.ShopOrderStatusTabORDERSTATUS_ID.AsInteger);
  end else
  if PC1.ActivePage.Tag = 2 then // URL / PROXY
  begin
    DM1.WriteString  ('SHOP' + ShopIDStr, 'SHOPTRANS_USER', ShopUserEdit.Text);
    DM1.WriteString  ('SHOP' + ShopIDStr, 'SHOPTRANS_SECRET', ShopPWEdit.Text);
    DM1.WriteString  ('SHOP' + ShopIDStr, 'IMPORT_URL', ShopImportURLEdit.Text);
    DM1.WriteString  ('SHOP' + ShopIDStr, 'UPDATE_URL', ShopUpdateURLEdi.Text);

    DM1.WriteInteger ('SHOP' + ShopIDStr, 'PROXY_PORT', Trunc(ProxyPort.Value));
    DM1.WriteString  ('SHOP' + ShopIDStr, 'PROXY_SERV', ProxyServer.Text);
    DM1.WriteString  ('SHOP' + ShopIDStr, 'PROXY_USER', ProxyUser.Text);
    DM1.WriteString  ('SHOP' + ShopIDStr, 'PROXY_PASS', ProxyPass.Text);
  end;
end;

procedure TShopSetupForm.ShopZahlArtBeforePost(DataSet: TDataSet);
begin
  ShopZahlArtMAINKEY.AsString := 'SHOP' + ShopIDStr + '\ZAHLART_MAP';
end;

procedure TShopSetupForm.ShopLiefArtBeforePost(DataSet: TDataSet);
begin
  ShopLiefArtMainKey.AsString := 'SHOP' + ShopIDStr + '\LIEFART_MAP';
end;

procedure TShopSetupForm.ChangeOrderstatusCBClick(Sender: TObject);
begin
  label4.enabled := ChangeOrderstatusCB.Checked;
  NewOrderStatusLB.Enabled := ChangeOrderStatusCB.Checked;
end;

end.

