{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Kategorie-Auswahl                                                 }
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
{ 27.06.2003 - Bug bei Kategorien, die auf neuere Oberkategorien verweisen }
{              (höhere TopID als eigenen ID) beseitigt }
{ 25.08.2003 - Sortierung innerhalb einer Kategorie hinzugefügt, diese kann auch }
{              verändert werden }
{ 07.01.2004 - "Eintrag auf oberste Ebene verschieben" hinzugefügt }
{ 23.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Artikel_Kat;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type 
  tKat = record
    ID           : Integer;
    TOP_ID       : Integer;
    Name         : String;
    Beschr       : String;
    ImageUrl     : String;
    Node         : tTreenode;
    TopNode      : tTreeNode;
    Sort         : Integer;
    Anz          : Integer;
    ArtikelInNode: Boolean;
  end;
  
  TKatForm = class(TForm)
    KatQuery: TZQuery;
    StatusBar1: TStatusBar;
    KatQuerySHOP_ID: TIntegerField;
    KatQueryID: TIntegerField;
    KatQueryTOP_ID: TIntegerField;
    KatQueryNAME: TStringField;
    Panel1: TPanel;
    KatNameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    KatQueryANZ: TLargeintField;
    KatQueryARTIKEL_ID: TIntegerField;
    PopupMenu1: TPopupMenu;
    neuenHaupteintragerstellen1: TMenuItem;
    neuenUntereintragerstellen1: TMenuItem;
    Eintragloeschen1: TMenuItem;
    ArtToKat: TZQuery;
    ArtToKatARTIKEL_ID: TIntegerField;
    ArtToKatKAT_ID: TIntegerField;
    AddArtBtn: TButton;
    DelArtBtn: TButton;
    ArtToKatSHOP_ID: TIntegerField;
    KatQueryCHANGE_FLAG: TBooleanField;
    KatTV: TTreeView;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ArtToKatDEL_FLAG: TBooleanField;
    KatQueryBESCHREIBUNG: TMemoField;
    KatQueryIMAGE: TStringField;
    KatImageEdit: TEdit;
    BildLab: TLabel;
    Label7: TLabel;
    KatBeschrEdi: TMemo;
    KatSavebtn: TButton;
    MakeKatBtn: TButton;
    SpeedButton1: TSpeedButton;
    KatMoveUpBtn: TSpeedButton;
    KatMoveDownBtn: TSpeedButton;
    KatQuerySORT_NUM: TIntegerField;
    DataSource1: TDataSource;
    ZMySqlQuery1: TZQuery;
    Label6: TLabel;
    Label8: TLabel;
    ItemToTop: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KatTVEditing(Sender: TObject; Node: TTreeNode;
    var AllowEdit: Boolean);
    procedure KatTVDragOver(Sender, Source: TObject; X, Y: Integer;
    State: TDragState; var Accept: Boolean);
    procedure KatTVDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure neuenHaupteintragerstellen1Click(Sender: TObject);
    procedure neuenUntereintragerstellen1Click(Sender: TObject);
    procedure Eintragloeschen1Click(Sender: TObject);
    procedure KatTVChange(Sender: TObject; Node: TTreeNode);
    procedure KatTVMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure AddArtBtnClick(Sender: TObject);
    procedure DelArtBtnClick(Sender: TObject);
    procedure KatTVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
    State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Panel1Resize(Sender: TObject);
    procedure KatBeschrEdiChange(Sender: TObject);
    procedure KatTVChanging(Sender: TObject; Node: TTreeNode;
    var AllowChange: Boolean);
    procedure KatSavebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MakeKatBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure KatMoveDownBtnClick(Sender: TObject);
    procedure KatMoveUpBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ItemToTopClick(Sender: TObject);
  private
    { Private-Deklarationen }
    InLoad   : Boolean;
    ArtikelID: Integer;
    ShopID   : Integer;
    Kat: Array of tKat;
    function GetNodeIndex(ID: Integer): Integer;
    function GetArtikelInKat(ID: Integer): Boolean;    
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;
  public
    { Public-Deklarationen }
    procedure ShowKatalog(NewShopID, NewArtikelID: Integer);
  end;
    
//var KatForm: TKatForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM, OF_ShopImageUpload, OF_Progress;

//------------------------------------------------------------------------------
procedure TKatForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  inherited;
  with Msg.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 498;
    ptMaxTrackSize.x := screen.width;
    ptMinTrackSize.y := 335;
    ptMaxTrackSize.y := screen.height;
  end;
end;

//------------------------------------------------------------------------------
procedure TKatForm.ShowKatalog(NewShopID, NewArtikelID: Integer);
begin
  InLoad    := False;
  ShopID    := NewShopID;
  ArtikelID := NewArtikelID;

  ArtToKat.Close;
  ArtToKat.ParamByName('ARTIKEL_ID').AsInteger := ArtikelID;
  ArtToKat.ParamByName('SHOP_ID').AsInteger    := ShopID;
  ArtToKat.Open;

  ShowModal;

  ArtToKat.Close;
end;                  

//------------------------------------------------------------------------------
function TKatForm.GetArtikelInKat (ID: Integer): Boolean;
begin
  Result := False;
  if (not ArtToKat.Active) or (ArtToKat.RecordCount = 0) then 
    exit;

  if (ArtToKat.Locate('KAT_ID', ID, [])) and (ArtToKatKAT_ID.AsInteger = ID) then 
    Result := True;
end;

//------------------------------------------------------------------------------
procedure TKatForm.FormShow(Sender: TObject);
var 
  KI, I, J: Integer; 
  Change, Found: Boolean; 
  PA, LPA: TTreeNode;
begin
  InLoad := True;
  KatTV.Items.BeginUpdate;
  KatTV.Items.Clear;
  KatTV.Items.EndUpdate;
  Application.ProcessMessages;
  KatTV.Items.BeginUpdate;
  try
    KatTV.Items.Clear;
    KatQuery.ParamByName('SHOP_ID').AsInteger := ShopID;
    KatQuery.Open;

    // Alle Einträge in ein dyn. Array speichern und im Treeview zunächst
    // als FLAT-Struktur anlegen (alle Nodes auf einer Ebene)
    while not KatQuery.Eof do
    begin
      KI := length(KAT);
      SetLength(Kat, KI + 1);
      Kat[KI].ID       := KatQueryID.AsInteger;
      Kat[KI].TOP_ID   := KatQueryTOP_ID.AsInteger;
      Kat[KI].Name     := KatQueryName.AsString;
      Kat[KI].Anz      := KatQueryANZ.AsInteger;
      Kat[KI].ImageUrl := KatQueryIMAGE.AsString;
      Kat[KI].Beschr   := KatQueryBESCHREIBUNG.AsString;
      Kat[KI].Sort     := KatQuerySort_Num.AsInteger;

      Kat[KI].TopNode  := nil;

      if not KatQueryARTIKEL_ID.IsNull then 
        inc(Kat[KI].Anz);

      Kat[KI].ArtikelInNode := GetArtikelInKat(Kat[KI].ID);
      Kat[KI].Node := KatTV.Items.Add(nil, KatQueryName.AsString);
      Kat[KI].Node.Data := Pointer(KatQueryID.AsInteger);

      if (assigned(Kat[KI].Node)) and (Kat[KI].Anz > 0) then
      begin
        Kat[KI].Node.Text := 
          KatQueryName.AsString +
          ' (' + 
          IntToStr(Kat[KI].Anz) + ')';
      end;

      KatQuery.Next;
    end;
    KatQuery.Close;

    // Jetzt solange das dynamische Array durchlaufen bis keine Änderungen
    // mehr nötig sind (Knoten werden jetzt unter Ihren Top-Knoten geschoben
    if length(KAT) > 0 then
    begin
      repeat
        KI := -1;
        Change := False;
        repeat
          inc(KI);

          if (Kat[ki].TOP_ID > 0) and (Kat[ki].TopNode = nil) then
          begin
            // knoten gefunden, der noch keinen übergeordenten Knoten
            // zugewiesen bekommen hat und selbst keine Top-Knoten ist

            for i := 0 to length(KAT)-1 do // Tabelle komplett durchlaufen
            // um den übergeordneten Knoten
            // zu finden
            begin
              // übergeordneten Knoten suchen
              if Kat[i].ID = Kat[ki].TOP_ID then
              begin
                // Top-Knoten im akt. Knoten eintragen
                Kat[ki].TopNode := Kat[i].Node;

                if Kat[i].Node.Count = 0 then
                begin
                  // Knoten im Treeview an die richtige stelle verschieben
                  Kat[ki].Node.MoveTo(Kat[i].Node, naAddChild);
                end else
                begin
                  Found := False;
                  for J := 0 to Kat[i].Node.Count do
                  begin
                    if Kat[GetNodeIndex(Integer(Kat[i].Node[j].Data))].Sort > Kat[KI].Sort then
                    begin
                      Kat[ki].Node.MoveTo(Kat[i].Node[J], naInsert);
                      Found := True;
                      break;
                    end;
                    if not Found then 
                      Kat[ki].Node.MoveTo(Kat[i].Node, naAddChild);
                  end;
                end;

                Change := True; // Änderungsflag setzen
                break;  // Schleife abbrechen
              end;
            end;
          end;
        until (KI = length(KAT)-1); // solange bis alle Knoten durch sind
      until change = False; // so lange wiederholen bis keine  Änderung
      // mehr stattgefunden hat
    end;

    // Top-Knoten sortieren
    repeat
      Change := False;

      PA := KatTV.Items.GetFirstNode;

      if not assigned(PA) then 
        break;

      LPA := PA;

      PA := PA.getNextSibling;

      Found := False;

      while (assigned(PA)) and (assigned(LPA)) do
      begin
        if (Kat[GetNodeIndex(Integer(PA.Data))].Sort < Kat[GetNodeIndex(Integer(LPA.Data))].Sort) then
        begin
          PA.MoveTo(LPA, naInsert);
          Found  := True;
          Change := True;
          break;
        end;
        LPA := PA;
        PA := PA.getNextSibling;
      end;
    until not Change;

  finally
    InLoad := False;

    KatTV.FullExpand; // Alle knoten auflättern
    KatTV.Items.EndUpdate; // Anzeige wiederherstellen

    // obersten Knoten auswählen
    if KatTV.Items.Count > 0 then
    begin
      KatTV.Selected := KatTV.Items[0];
      KatTVChange(self, nil);
    end;
  end;
  ZMySQLQuery1.open;
end;                       

//------------------------------------------------------------------------------
procedure TKatForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setlength(Kat, 0);
end;

//------------------------------------------------------------------------------
function TKatForm.GetNodeIndex (ID: Integer): Integer;
var 
  i: integer;
begin
  Result := -1;
  if length(Kat) < 1 then 
    exit;
  for i := 0 to pred(length(Kat)) do
  begin
    if Kat[i].ID = ID then
    begin
      Result := i;
      break;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatTVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var 
 i: Integer;
begin
  try
    i := GetNodeIndex (Integer(Node.Data));
    if (i >= 0) and (KAT[i].ArtikelInNode) then 
      Sender.Canvas.Font.Style := [fsBold];
  except 
  end;
  DefaultDraw := True;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatTVChange(Sender: TObject; Node: TTreeNode);
var 
  i: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex(Integer(KatTV.Selected.Data));
    if I >= 0 then
    begin
      InLoad := True;
      try
        KatNameEdit.Text := Kat[i].Name;
        KatImageEdit.Text := Kat[i].ImageUrl;
        KatBeschrEdi.Text := Kat[i].Beschr;

        Label1.Caption := IntToStr(Kat[i].ID);
        Label2.Caption := IntToStr(Kat[i].TOP_ID);
        Label8.Caption := IntToStr(Kat[i].Sort);
      finally
        InLoad := False;
      end;
      AddArtBtn.Enabled := not Kat[i].ArtikelInNode;
      DelArtBtn.Enabled := Kat[i].ArtikelInNode;
    end;
    Eintragloeschen1.Enabled := KatTV.Selected.HasChildren = False;
    KatMoveUpBtn.Enabled     := True;
    KatMoveDownBtn.Enabled   := True;
  end else
  begin
    Eintragloeschen1.Enabled := False;
    AddArtBtn.Enabled        := False;
    DelArtBtn.Enabled        := False;
    KatMoveUpBtn.Enabled     := False;
    KatMoveDownBtn.Enabled   := False;
  end;
end; 

//------------------------------------------------------------------------------
procedure TKatForm.KatTVMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var 
  N: TTreeNode; 
  PO: TPoint;
begin
  if Button = mbRight then
  begin
    N := KatTV.GetNodeAt(X, Y);
    if (Assigned(N)) then
    begin
      if (KatTV.Selected <> N) then
      begin
        KatTV.Selected := N;
        KatTVChange(Self, N);
      end;
      GetCursorPos(PO); // absolute Mauskoordinalten holen
      PopupMenu1.Popup(PO.x, PO.Y);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatTVEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;                                                              

//------------------------------------------------------------------------------
procedure TKatForm.KatTVDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is tTreeView;
end;

//------------------------------------------------------------------------------
// Eintrag verschieben, d.h. TOP_ID ändert sich
procedure TKatForm.KatTVDragDrop(Sender, Source: TObject; X, Y: Integer);
var 
  TopNode: TTreeNode; 
  I, J: Integer;
begin
  TopNode := KatTV.GetNodeAt (X, Y);
  if (assigned(TopNode)) and (assigned(KatTV.Selected)) then
  begin
    I := GetNodeIndex(Integer(TopNode.Data));
    J := GetNodeIndex(Integer(KatTV.Selected.Data));
    if (KAT[I].ID >= 1) and (KAT[J].ID >= 1) and (KAT[I].ID <> KAT[J].ID) then
    begin
      Kat[J].TOP_ID := Kat[I].ID;
      KatTV.Selected.MoveTo(TopNode, naAddChild);
      DM1.UniQuery.Close;
      DM1.UniQuery.Sql.Text := 
        'UPDATE ARTIKEL_KAT SET TOP_ID=' + IntToStr(Kat[I].ID) +
        ' ,CHANGE_FLAG="Y"' +
        ' WHERE ID=' + IntToStr(Kat[J].ID) +
        ' AND SHOP_ID=' + IntToStr(ShopID);
      DM1.UniQuery.ExecSql;

      KatTVChange(Self, Nil);
    end;
  end;
end;             

//------------------------------------------------------------------------------
procedure TKatForm.neuenHaupteintragerstellen1Click(Sender: TObject);
var 
  KI: Integer;
begin
  KI := length(KAT);
  SetLength(Kat, KI + 1);

  Kat[KI].TOP_ID            := -1;
  Kat[KI].Anz               := 0;
  Kat[KI].Name              := _('neuer Eintrag');
  Kat[KI].ArtikelInNode     := False;

  KatQuery.Close;
  //KatQuery.RequestLive      :=True;
  KatQuery.Open;
  KatQuery.Append;

  KatQuerySHOP_ID.AsInteger := ShopID;
  KatQueryTOP_ID.AsInteger  := -1;
  KatQueryNAME.AsString     := Kat[KI].Name;
  KatQuery.Post;

  Kat[KI].ID                := KatQueryID.AsInteger;
  Kat[KI].Node              := KatTV.Items.Add (nil, Kat[KI].Name);
  Kat[KI].Node.Data         := Pointer(Kat[KI].ID);

  KatQuery.Close;
  //KatQuery.RequestLive :=False;

  KatTV.Selected := Kat[KI].Node;
  KatTVChange (Self, Nil);
end;

//------------------------------------------------------------------------------
procedure TKatForm.neuenUntereintragerstellen1Click(Sender: TObject);
var 
  I, KI: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex (Integer(KatTV.Selected.Data));

    KI := length(KAT);
    SetLength(Kat, KI + 1);

    Kat[KI].TOP_ID            := Kat[i].ID;
    Kat[KI].Anz               := 0;
    Kat[KI].Name              := _('neuer Eintrag');
    Kat[KI].ArtikelInNode     := False;

    KatQuery.Close;
    //KatQuery.RequestLive      :=True;
    KatQuery.Open;
    KatQuery.Append;

    KatQuerySHOP_ID.AsInteger := ShopID;
    KatQueryTOP_ID.AsInteger  := Kat[i].ID;
    KatQueryNAME.AsString     := Kat[KI].Name;
    KatQuery.Post;

    Kat[KI].ID                := KatQueryID.AsInteger;
    Kat[KI].Node              := KatTV.Items.AddChild(Kat[i].Node, Kat[KI].Name);
    Kat[KI].Node.Data         := Pointer(Kat[KI].ID);
    Kat[KI].TopNode           := Kat[i].Node;

    KatQuery.Close;
    //KatQuery.RequestLive      :=False;

    KatTV.Selected            := Kat[KI].Node;
    KatTVChange(Self, Nil);
  end;
end;                                                 

//------------------------------------------------------------------------------
procedure TKatForm.Eintragloeschen1Click(Sender: TObject);
var 
  I, J: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex(Integer(KatTV.Selected.Data));

    Kat[i].Node.Delete;

    DM1.UniQuery.Close;
    DM1.UniQuery.Sql.Text := 
      'UPDATE ARTIKEL_KAT' +
      ' SET DEL_FLAG="Y"' +
      ' WHERE ID=' + IntToStr(Kat[I].ID) +
      ' AND SHOP_ID=' + IntToStr(ShopID);
    DM1.UniQuery.ExecSql;

    DM1.UniQuery.Sql.Text := 
      'UPDATE ARTIKEL_TO_KAT' +
      ' SET DEL_FLAG="Y"' +
      ' WHERE KAT_ID=' + IntToStr(Kat[I].ID) +
      ' AND SHOP_ID=' + IntToStr(ShopID);
    DM1.UniQuery.ExecSql;

    if I < Pred(Length(Kat)) then
    begin
      for J := Succ(I) to Pred(Length(Kat)) do 
        Kat[Pred(J)] := Kat[J];
    end;
    SetLength(Kat, Pred(Length(Kat)));

    KatTVChange (Self, Nil);
  end;
end;                                  

//------------------------------------------------------------------------------
procedure TKatForm.AddArtBtnClick(Sender: TObject);
var 
  I: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex(Integer(KatTV.Selected.Data));
    inc(Kat[i].Anz);
    Kat[i].ArtikelInNode := True;
    Kat[i].Node.Text := Kat[i].Name + ' (' + IntToStr(Kat[i].Anz) + ')';

    ArtToKat.Append;
    ArtToKatSHOP_ID.AsInteger    := ShopID;
    ArtToKatARTIKEL_ID.AsInteger := ArtikelID;
    ArtToKatKAT_ID.AsInteger     := Kat[i].ID;
    try
      ArtToKat.Post;
    except
      ArtToKat.Cancel;
      MessageDlg(_('Dieser Artikel ist bereits in dieser Kathegorie,' + #13#10 +
        'ist aber zum Löschen vorgesehen, bitte führen Sie' + #13#10 +
        'zunächst ein Shopupdate durch.'), mterror, [mbok], 0
      );
    end;

    KatTVChange(Self, Nil);
  end;
  ProgressForm.Stop;
end;    

//------------------------------------------------------------------------------
procedure TKatForm.DelArtBtnClick(Sender: TObject);
var 
  I: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex(Integer(KatTV.Selected.Data));

    if not GetArtikelInKat(Kat[i].ID) then 
      exit;

    dec(Kat[i].Anz);
    Kat[i].ArtikelInNode := False;

    if Kat[i].Anz > 0 then 
      Kat[i].Node.Text := Kat[i].Name + ' (' + IntToStr(Kat[i].Anz) + ')'
    else 
      Kat[i].Node.Text := Kat[i].Name;

    if (ArtToKat.Locate('KAT_ID', Kat[i].ID, [])) and (ArtToKatKat_ID.AsInteger = Kat[i].ID) then
    begin
      ArtToKat.Edit;
      ArtToKatDEL_FLAG.AsBoolean := True;
      ArtToKat.Post;
      ArtToKat.Refresh;
    end;

    KatTVChange (Self, Nil);
  end;
  ProgressForm.Stop;
end;                                                 

//------------------------------------------------------------------------------
procedure TKatForm.Panel1Resize(Sender: TObject);
begin
  AddArtBtn.Top       := Panel1.Height - 63;
  MakeKatBtn.Top      := Panel1.Height - 63;

  DelArtBtn.Top       := Panel1.Height - 33;
  KatSavebtn.Top      := Panel1.Height - 33;

  KatBeschrEdi.Height := Panel1.Height - 149;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatBeschrEdiChange(Sender: TObject);
var 
  I: Integer;
begin
  if InLoad then
  begin
    KatSaveBtn.Enabled := False;
  end else
  begin
    if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
    begin
      I := GetNodeIndex(Integer(KatTV.Selected.Data));

      KatSaveBtn.Enabled := (KatBeschrEdi.Text<>Kat[i].Name) or 
                            (KatImageEdit.Text<>Kat[i].ImageUrl) or
                            (KatNameEdit.Text<>Kat[i].Beschr);
    end else
    begin
      KatSaveBtn.Enabled := False;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TKatForm.KatTVChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
var 
  Res: Integer;
begin
  if KatSavebtn.Enabled then
  begin
    Res := MessageDlg (_('Der aktuelle Eintrag wurde geändert.' + #13#10 +
      'Wollen Sie die Änderungen speichern ?'), mtconfirmation,
      mbyesnocancel, 0);

    if Res = mrYes then 
      KatSavebtnClick(Sender);

    AllowChange := Res in [mryes, mrno];

  end else 
    AllowChange := True;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatSavebtnClick(Sender: TObject);
var 
  I: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
  begin
    I := GetNodeIndex (Integer(KatTV.Selected.Data));

    DM1.UniQuery.Close;
    DM1.UniQuery.ReadOnly := False;
    DM1.UniQuery.Sql.Text := 'Select * from ARTIKEL_KAT where ID=' + IntToStr(Kat[i].ID);
    DM1.UniQuery.Open;

    if (DM1.UniQuery.RecordCount = 1) and (DM1.UniQuery.FieldByName('ID').AsInteger = Kat[i].ID) then
    begin
      Kat[i].Beschr := KatBeschrEdi.Text;
      Kat[i].ImageUrl := KatImageEdit.Text;
      Kat[i].Name := KatNameEdit.Text;

      DM1.UniQuery.Edit;

      DM1.UniQuery.FieldByName('NAME').AsString         := KatNameEdit.Text;
      DM1.UniQuery.FieldByName('BESCHREIBUNG').AsString := KatBeschrEdi.Text;
      DM1.UniQuery.FieldByName('IMAGE').AsString        := KatImageEdit.Text;
      DM1.UniQuery.FieldByName('CHANGE_FLAG').AsString  := 'Y';

      DM1.UniQuery.Post;
      DM1.UniQuery.Close;
      DM1.UniQuery.ReadOnly := True;

      KatTV.Selected.Text := KatNameEdit.Text;
    end;
    KatSavebtn.Enabled := False;
  end;
  ProgressForm.Stop;
end;                                     

//------------------------------------------------------------------------------
procedure TKatForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var 
  Res: Integer;
begin
  if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) and (KatSaveBtn.Enabled) then
  begin
    Res := MessageDlg (_('Der aktuelle Eintrag wurde geändert.' + #13#10 +
      'Wollen Sie die Änderungen speichern ?'), mtconfirmation,
      mbyesnocancel, 0);

    if Res = mrYes then 
      KatSavebtnClick(Sender);
    CanClose := Res in [mryes, mrno];

  end else 
    CanClose := True;
end;

//-KARL-------------------------------------------------------------------------
procedure TKatForm.MakeKatBtnClick(Sender: TObject);
var 
  PO: tPoint;
begin
  GetCursorPos (PO); // absolute Mauskoordinalten holen
  PopupMenu1.Popup (PO.x, PO.Y);
end;

//------------------------------------------------------------------------------
procedure TKatForm.SpeedButton1Click(Sender: TObject);
var 
  Name: String;
begin
  if FileUpload.KategorieImage (Name) then 
    KatImageEdit.Text := Name;
end;
//------------------------------------------------------------------------------
procedure TKatForm.KatMoveUpBtnClick(Sender: TObject);
var 
  I, J: Integer; 
  PA: TTreeNode; 
  Found: Boolean;
begin
  try
    if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
    begin
      I := GetNodeIndex(Integer(KatTV.Selected.Data));

      DM1.UniQuery.Close;
      DM1.UniQuery.ReadOnly := False;
      DM1.UniQuery.Sql.Text := 
        'UPDATE ARTIKEL_KAT SET SORT_NUM = SORT_NUM-1,' +
        'CHANGE_FLAG="Y" ' +
        'where ID=' + IntToStr(Kat[i].ID);
      DM1.UniQuery.ExecSql;

      if Kat[i].Sort > 0 then 
        Dec(Kat[i].Sort);
      Label8.Caption := IntToStr(Kat[i].Sort);

      PA := KatTV.Selected.Parent;
      if Assigned(PA) then
      begin
        Found := False;
        for J := 0 to PA.Count-1 do
        begin
          if Kat[GetNodeIndex(Integer(PA[j].Data))].Sort > Kat[I].Sort then
          begin
            KatTV.Selected.MoveTo(PA[J], naInsert);
            Found := True;
            break;
          end;
        end;
        if not Found then 
          KatTV.Selected.MoveTo(Kat[i].Node, naAddChild);
      end else
      begin
        // Knoten auf oberster Ebene
        PA := KatTV.Items.GetFirstNode;

        while assigned(PA) do
        begin
          if (PA <> KatTV.Selected) and (Kat[GetNodeIndex(Integer(PA.Data))].Sort > Kat[I].Sort) then
          begin
            KatTV.Selected.MoveTo(PA, naInsert);
            Found := True;
            break;
          end;
          PA := PA.getNextSibling;
        end;
        if not Found then 
          KatTV.Selected.MoveTo(PA, naAdd);
      end;
    end;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TKatForm.KatMoveDownBtnClick(Sender: TObject);
var 
  I, J: Integer; 
  PA: tTreeNode; 
  Found: Boolean;
begin
  try
    if (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Data)) then
    begin
      I := GetNodeIndex(Integer(KatTV.Selected.Data));

      DM1.UniQuery.Close;
      DM1.UniQuery.ReadOnly := False;
      DM1.UniQuery.Sql.Text := 
        'UPDATE ARTIKEL_KAT SET SORT_NUM = SORT_NUM+1,' +
        'CHANGE_FLAG="Y" ' +
        'where ID=' + IntToStr(Kat[i].ID);
      DM1.UniQuery.ExecSql;

      Inc(Kat[i].Sort); Label8.Caption := IntToStr(Kat[i].Sort);

      PA := KatTV.Selected.Parent;
      if Assigned(PA) then
      begin
        Found := False;
        for J := 0 to PA.Count-1 do
        begin
          if Kat[GetNodeIndex(Integer(PA[j].Data))].Sort > Kat[I].Sort then
          begin
            KatTV.Selected.MoveTo(PA[J], naInsert);
            Found := True;
            break;
          end;
        end;
        if not Found then 
          KatTV.Selected.MoveTo (PA, naAddChild);
      end else
      begin
        // Knoten auf oberster Ebene
        PA := KatTV.Items.GetFirstNode;

        while assigned(PA) do
        begin
          if (PA <> KatTV.Selected) and (Kat[GetNodeIndex(Integer(PA.Data))].Sort > Kat[I].Sort) then
          begin
            KatTV.Selected.MoveTo(PA, naInsert);
            Found := True;
            break;
          end;
          PA := PA.getNextSibling;
        end;
        if not Found then 
          KatTV.Selected.MoveTo(PA, naAdd);
      end;
    end;
  except 
  end;
end;

//------------------------------------------------------------------------------
procedure TKatForm.FormCreate(Sender: TObject);
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
procedure TKatForm.PopupMenu1Popup(Sender: TObject);
begin
  ItemToTop.Enabled := (Assigned(KatTV.Selected)) and (Assigned(KatTV.Selected.Parent));
end;                                                 

//------------------------------------------------------------------------------
procedure TKatForm.ItemToTopClick(Sender: TObject);
var 
  J: Integer;
begin
  if (assigned(KatTV.Selected)) then
  begin
    J := GetNodeIndex(Integer(KatTV.Selected.Data));
    if (KAT[J].ID >= 1) and (KAT[J].ID > 0) then
    begin
      Kat[J].TOP_ID := -1;
      KatTV.Selected.MoveTo(nil, naAddChild);
      DM1.UniQuery.Close;
      DM1.UniQuery.Sql.Text := 
        'UPDATE ARTIKEL_KAT SET TOP_ID=-1' +
        ' ,CHANGE_FLAG="Y"' +
        ' WHERE ID=' + IntToStr(Kat[J].ID) +
        ' AND SHOP_ID=' + IntToStr(ShopID);
      DM1.UniQuery.ExecSql;

      KatTVChange(Self, Nil);
    end;
  end;
end;             

//------------------------------------------------------------------------------

end.

