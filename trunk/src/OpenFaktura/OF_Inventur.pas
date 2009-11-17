{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog zur Erstellung von Inventuren                              }
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
{ - Stadien für ARTIKEL_INVENTUR.STATUS:                                       }
{     0 = unbearbeitet                                                         }
{     1 = bearbeitet                                                           }
{     2 = Menge im Lager gebucht                                               }
{     3 = Menge nicht gebucht, weil Artikel nicht gefunden                     }
{ - Stadien für INVENTUR.STATUS:                                               }
{     0 = in Bearbeitung                                                       }
{     1 = Inventur abgeschlossen, keine Bearbeitung mehr möglich               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 13.01.2003 - Version 1.0.0.48 released Jan Pokrandt                          }
{ 07.02.2004 - Suchfunktion eingebaut                                          }
{            - unter "Alle Warengruppen" werden jetzt max. 50.000 Artikel      }
{              angezeigt                                                       }
{            - Drucken von Zähl- und Wertliste ist jetzt auf die aktuell       }
{              selektierte Warengruppe beschränkt                              }
{              (gilt nicht wenn "Alle Warengruppen" selektiert ist             }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Inventur;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ZSqlUpdate, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, ComCtrls, DBCtrls, Mask, JvExMask,
  JvToolEdit, JvDBControls, OFGroupBox, ToolWin, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, OFDBGrid, JvExComCtrls, JvComCtrls, JvExControls,
  JvComponent, JvSpeedButton,
  OF_Var_Const, JvMenus;

{
uses
  Buttons,
  JvDBCtrl,
  ZUpdateSql,
}

type
  TInventurForm = class(TForm)
    MainPanel: TPanel;
    TopPan: TPanel;
    Label35: TLabel;
    ButtonPan: TPanel;
    ListeBtn: TJvSpeedButton;
    AllgemeinBtn: TJvSpeedButton;
    ArtikelBtn: TJvSpeedButton;
    FertigBtn: TJvSpeedButton;
    PC1: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    InvKopfTab: TZQuery;
    InvListeGrid: TOFDBGrid;
    InvKopfDS: TDataSource;
    InvKopfTabID: TIntegerField;
    InvKopfTabDATUM: TDateField;
    InvKopfTabBESCHREIBUNG: TStringField;
    InvKopfTabINFO: TMemoField;
    InvKopfTabSTATUS: TIntegerField;
    InvKopfTabCALC_STATUS: TStringField;
    ListeToolbar: TToolBar;
    DBNavigator1: TDBNavigator;
    NewBelBtn: TToolButton;
    EdiBtn1: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    SuchGB: TOFGroupBox;
    WgrGB: TOFGroupBox;
    ArtWgrTV: TTreeView;
    InvArtDS: TDataSource;
    InvArtTab: TZQuery;
    InvArtTabINVENTUR_ID: TIntegerField;
    InvArtTabARTIKEL_ID: TIntegerField;
    InvArtTabWARENGRUPPE: TIntegerField;
    InvArtTabARTNUM: TStringField;
    InvArtTabMATCHCODE: TStringField;
    InvArtTabBARCODE: TStringField;
    InvArtTabKURZTEXT: TStringField;
    InvArtTabMENGE_IST: TFloatField;
    InvArtTabMENGE_SOLL: TFloatField;
    InvArtTabSTATUS: TIntegerField;
    InvArtTabBEARBEITER: TStringField;
    ArtListGrid: TOFDBGrid;
    InvArtTabCALC_STATUS: TStringField;
    MainMenu1: TJvMainMenu;
    Adresse1: TMenuItem;
    Neu1: TMenuItem;
    N1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    Sortierung1: TMenuItem;
    Match1: TMenuItem;
    Name11: TMenuItem;
    Drucken1: TMenuItem;
    Artikelliste1: TMenuItem;
    Ansicht1: TMenuItem;
    Allgemein1: TMenuItem;
    MengePreise1: TMenuItem;
    Historie1: TMenuItem;
    Liste1: TMenuItem;
    N4: TMenuItem;
    Treffer1: TMenuItem;
    N101: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N5001: TMenuItem;
    alle1: TMenuItem;
    N6: TMenuItem;
    Aktualisieren1: TMenuItem;
    MnuExtras: TMenuItem;
    Lagerwertliste1: TMenuItem;
    InventurAuswertung1: TMenuItem;
    alleArtikelalsbearbeitetmarkieren1: TMenuItem;
    SollmengennachISTMengenbernehmen1: TMenuItem;
    ISTMengenauf0setzen1: TMenuItem;
    ArtikelToolbar: TToolBar;
    DBNavigator2: TDBNavigator;
    ToolButton3: TToolButton;
    alleArtikelalsunbearbeitetmarkieren1: TMenuItem;
    SumQuery: TZQuery;
    SumDS: TDataSource;
    SumQueryWARENGRUPPE: TIntegerField;
    SumQueryNAME: TStringField;
    SumQuerySUM_SOLL: TFloatField;
    SumQuerySUM_IST: TFloatField;
    SumQueryWERT_SOLL: TFloatField;
    SumQueryWERT_IST: TFloatField;
    SumQueryWERT_DIFF: TFloatField;
    InvArtTabINVENTUR_WERT: TFloatField;
    InvArtTabEK_PREIS: TFloatField;
    Panel3: TPanel;
    CaoGroupBox2: TOFGroupBox;
    Label4: TLabel;
    DBText1: TDBText;
    CaoGroupBox1: TOFGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    DBEdit1: TDBEdit;
    CaoGroupBox3: TOFGroupBox;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    AllgToolbar: TToolBar;
    DBNavigator3: TDBNavigator;
    ToolButton4: TToolButton;
    EdiBtn2: TToolButton;
    CaoGroupBox4: TOFGroupBox;
    WgrGrid: TOFDBGrid;
    CaoGroupBox5: TOFGroupBox;
    FertigToolbar: TToolBar;
    DBNavigator4: TDBNavigator;
    ToolButton5: TToolButton;
    RefreshBtn: TToolButton;
    ToolButton7: TToolButton;
    InvFertigBtn: TToolButton;
    Label3: TLabel;
    DBText2: TDBText;
    InvArtTabLAENGE: TStringField;
    InvArtTabGROESSE: TStringField;
    InvArtTabDIMENSION: TStringField;
    InvArtTabGEWICHT: TFloatField;
    InvArtTabUpd: TZUpdateSql;
    SearchTimer: TTimer;
    Label52: TLabel;
    SuchFeldCB: TComboBox;
    Label31: TLabel;
    SuchBeg: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure InvKopfTabAfterScroll(DataSet: TDataSet);
    procedure NewBelBtnClick(Sender: TObject);
    procedure InvKopfTabCalcFields(DataSet: TDataSet);
    procedure EdiBtn1Click(Sender: TObject);
    procedure ListeBtnClick(Sender: TObject);
    procedure ArtWgrTVChange(Sender: TObject; Node: TTreeNode);
    procedure ArtListGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure Name11Click(Sender: TObject);
    procedure InvArtTabCalcFields(DataSet: TDataSet);
    procedure InvArtTabBeforePost(DataSet: TDataSet);
    procedure alleArtikelalsbearbeitetmarkieren1Click(Sender: TObject);
    procedure SollmengennachISTMengenbernehmen1Click(Sender: TObject);
    procedure ISTMengenauf0setzen1Click(Sender: TObject);
    procedure InvArtTabAfterScroll(DataSet: TDataSet);
    procedure InvArtTabBeforeDelete(DataSet: TDataSet);
    procedure InvArtTabAfterPost(DataSet: TDataSet);
    procedure alleArtikelalsunbearbeitetmarkieren1Click(Sender: TObject);
    procedure ArtListGridDblClick(Sender: TObject);
    procedure Artikelliste1Click(Sender: TObject);
    procedure Lagerwertliste1Click(Sender: TObject);
    procedure PC1Resize(Sender: TObject);
    procedure InvFertigBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ListeBtnMouseEnter(Sender: TObject);
    procedure ListeBtnMouseLeave(Sender: TObject);
    procedure ArtListGridKeyPress(Sender: TObject; var Key: Char);
    procedure SuchFeldCBChange(Sender: TObject);
    procedure SuchBegChange(Sender: TObject);
    procedure SuchBegKeyPress(Sender: TObject; var Key: Char);
    procedure SearchTimerTimer(Sender: TObject);
  private
    { Private-Deklarationen }
    searchtime : Integer;
    QueryTime  : Integer;
    Limit      : Integer;
    StatStr    : String;
    SuchBegr   : String;
    
    sortname   : string;
    SortField  : String;
    WGR        : Integer;
    aktsort    : integer;
    sum        : Integer; // Summe der Artikel in der akt. Inventur
    unfertig   : integer; // Summe der unfertigen Artikel in der akt. Inventur
    
    First      : Boolean;
    
    Artikel_SQL: String;
    
    procedure UpdateQuery;
    procedure UpdateStatus;
    procedure SetSort (Sort: Integer);
    
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
  end;
    
    //var InventurForm: TInventurForm;
    
implementation

{$R *.DFM}

uses
  GNUGetText,
  OF_DM, OF_Main,
  {$IFDEF WITH_REPORT}
  OF_FreePrintRech,
  {$ENDIF}
  OF_InventurMakeArtikel, OF_Progress;
  
//------------------------------------------------------------------------------
procedure TInventurForm.FormCreate(Sender: TObject);
var 
 i: integer;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  First := True;

  OnUpdateStatusBar := nil;

  for i := 0 to PC1.PageCount-1 do 
    PC1.Pages[i].TabVisible := False;
  PC1.ActivePage := PC1.Pages[0];
  ListeBtn.Font.Style := [fsBold];

  Artikel_SQL    := '';
  StatStr        := '';
  WGr            := 0;
  SetSOrt (1);

  Sortierung1.Enabled := False;
  MnuExtras.Enabled := False;
  SuchFeldCB.ItemIndex := 0;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.FormActivate(Sender: TObject);
var 
  root_tn, tn  : ttreenode;
  WgrMitNr     : Boolean;
  WgrSort      : Integer;
  WgrName      : String;
begin
  if First then
  begin
    First := False;

    InvListeGrid.RowColor1 := DM1.C2Color;
    InvListeGrid.EditColor := DM1.EditColor;
    ArtListGrid.RowColor1  := DM1.C2Color;
    ArtListGrid.EditColor  := DM1.EditColor;
    WgrGrid.RowColor1      := DM1.C2Color;
    WgrGrid.EditColor      := DM1.EditColor;

    if DM1.ReadString ('MAIN\REPORT\INVENTUR', 'Default', '@@@') = '@@@' then 
      DM1.WriteString ('MAIN\REPORT\INVENTUR', 'Default', '');

    WgrMitNr    := DM1.ReadBoolean ('MAIN\ARTIKEL', 'WGR_MIT_NR', False);
    WgrSort     := DM1.ReadInteger ('MAIN\ARTIKEL', 'WGR_SORT'  , 0);


    SumQueryWERT_SOLL.DisplayFormat := ',#0.000 "' + DM1.LeitWaehrung + '"';
    SumQueryWERT_IST.DisplayFormat  := ',#0.000 "' + DM1.LeitWaehrung + '"';
    SumQueryWERT_DIFF.DisplayFormat := ',#0.00 "' + DM1.LeitWaehrung + '"';

    // Warengruppenauswahl füllen
    ArtWgrTV.Items.BeginUpdate;
    ArtWgrTV.Items.Clear;
    DM1.WgrTab.Close;

    if WgrSort = 1 then 
      DM1.WgrTab.Sql.Text := 'select * from WARENGRUPPEN order by NAME'
    else 
      DM1.WgrTab.Sql.Text := 'select * from WARENGRUPPEN order by ID';

    DM1.WgrTab.Open;
    DM1.WgrTab.DisableControls;
    DM1.WgrTab.First;

    tn := ttreenode.Create (ArtWgrTV.Items);
    tn.Data := Pointer(-1);
    root_tn := ArtWgrTV.Items.Add (tn, _('alle Warengruppen'));


    Artikel_SQL := '';
    try
      while not DM1.WgrTab.EOF do
      begin
        WgrName := DM1.WgrTabNAME.AsString;
        if WgrMitNr then 
          WgrName := FormatFloat ('000', DM1.WgrTabID.AsInteger) + ' - ' + WgrName;

        tn := ArtWgrTV.Items.AddChild (root_tn, WgrName);
        tn.Data := Pointer(DM1.WgrTabID.Value);
        DM1.WgrTab.Next;
      end;

      root_tn.Selected := True;
      root_tn.Expand (True);
    finally
      DM1.WgrTab.EnableControls;
    end;
    ArtWgrTV.Items.EndUpdate;

    // Ende Warengruppen Tree-View

    PC1.ActivePage := PC1.Pages[0];
    InvListeGrid.SetFocus;
  end;
  InvKopfTab.Open;
end;      

//------------------------------------------------------------------------------
procedure TInventurForm.FormDeactivate(Sender: TObject);
begin
  InvKopfTab.Close;
  InvArtTab.Close;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.PC1Change(Sender: TObject);
begin
  ListeBtn.Font.Style     := [];
  AllgemeinBtn.Font.Style := [];
  ArtikelBtn.Font.Style   := [];
  FertigBtn.Font.Style    := [];

  case PC1.ActivePageIndex of
    0: ListeBtn.Font.Style     := [fsBold];
    1: AllgemeinBtn.Font.Style := [fsBold];
    2: ArtikelBtn.Font.Style   := [fsBold];
    3: FertigBtn.Font.Style    := [fsBold];
  end;

  if PC1.ActivePageIndex = 2 then 
    Updatequery 
  else 
    InvArtTab.Close;

  if PC1.ActivePageIndex = 3 then
  begin
    SUMQuery.ParamByName ('ID').AsInteger := InvKopfTabID.AsInteger;
    SUMQuery.Active := True;

    sum := 0;
    unfertig := 0;
    dm1.uniquery.sql.text := 'select STATUS, COUNT(*) as ANZAHL ' +
    'from ARTIKEL_INVENTUR ' +
    'where INVENTUR_ID=' +
    Inttostr(InvKopfTabID.AsInteger) +
    ' group by STATUS';
    dm1.uniquery.open;
    while not dm1.uniquery.eof do
    begin
      sum := sum + dm1.uniquery.fieldbyname ('ANZAHL').asInteger;

      if dm1.uniquery.fieldbyname ('STATUS').asInteger = 0 then 
        unfertig := unfertig + dm1.uniquery.fieldbyname ('ANZAHL').asInteger;

      dm1.uniquery.next;
    end;
    dm1.uniquery.close;
    UpdateStatus;

  end else 
    SUMQuery.Active := False;

  Sortierung1.Enabled := InvArtTab.Active;
  MnuExtras.Enabled   := (InvArtTab.Active)and(InvKopfTabSTATUS.Value = 0); //JP040705

  InvFertigBtn.Enabled := 
    (InvKopfTab.RecordCount > 0) and 
    (InvKopfTabSTATUS.Value = 0) and
    (PC1.ActivePageIndex = 3) and
    (Unfertig = 0);
end;               

//------------------------------------------------------------------------------
procedure TInventurForm.InvKopfTabAfterScroll(DataSet: TDataSet);
begin
  ArtikelBtn.Enabled   := (InvKopfTab.RecordCount > 0);
  Fertigbtn.Enabled    := (InvKopfTab.RecordCount > 0);
  AllgemeinBtn.Enabled := InvKopfTab.RecordCount > 0;
  EdiBtn1.Enabled      := ArtikelBtn.Enabled;
  EdiBtn2.Enabled      := ArtikelBtn.Enabled;
  CaoGroupBox1.Enabled := (InvKopfTab.RecordCount > 0) and (InvKopfTabSTATUS.Value = 0);
  CaoGroupBox2.Enabled := (InvKopfTab.RecordCount > 0) and (InvKopfTabSTATUS.Value = 0);
  CaoGroupBox3.Enabled := (InvKopfTab.RecordCount > 0) and (InvKopfTabSTATUS.Value = 0);
  ArtListGrid.ReadOnly := (InvKopfTab.RecordCount = 0) or (InvKopfTabSTATUS.Value = 1);

  InvFertigBtn.Enabled := (InvKopfTab.RecordCount > 0) and (InvKopfTabSTATUS.Value = 0);
  RefreshBtn.Enabled   := (InvKopfTab.RecordCount > 0) and (InvKopfTabSTATUS.Value = 0);
end;                                                                

//------------------------------------------------------------------------------
procedure TInventurForm.NewBelBtnClick(Sender: TObject);
var 
  InventurMakeArtikelForm: TInventurMakeArtikelForm;
begin
  if MessageDlg (_('Wollen Sie wirklich eine neue Inventur erstellen ?' + #13#10 +
    'Dieser Vorgang kann nicht rückgängig gemacht werden !'),
    mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    InvKopfTab.Append;
    InvKopfTabDATUM.AsDateTime := now;
    InvKopfTabBESCHREIBUNG.AsString := _('Inventur vom') + ' ' +
    FormatDateTime ('dd.mm.yyyy', now);
    InvKopfTab.Post;

    InventurMakeArtikelForm := TInventurMakeArtikelForm.Create (Self);
    try
      InventurMakeArtikelForm.MakeInventur (InvKopfTabID.AsInteger);
    finally
      InventurMakeArtikelForm.Free;
      InventurMakeArtikelForm := nil;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvKopfTabCalcFields(DataSet: TDataSet);
begin
  case InvKopfTabSTATUS.AsInteger of
    0: InvKopfTabCALC_Status.AsString := _('in Bearbeitung');
    1: InvKopfTabCALC_Status.AsString := _('Fertiggestellt');
    else InvKopfTabCALC_Status.AsString := '???';
  end;
end;
//------------------------------------------------------------------------------
procedure TInventurForm.EdiBtn1Click(Sender: TObject);
begin
  PC1.ActivePage := TabSheet2;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ListeBtnClick(Sender: TObject);
begin
  PC1.ActivePageIndex := TJvSpeedButton(Sender).Tag;
  PC1Change(Sender);
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ArtWgrTVChange(Sender: TObject; Node: TTreeNode);
var 
  Last: String;
begin
  Last := Artikel_SQL;
  Wgr := Integer(Node.Data);
  if not DM1.WgrTab.Active then 
    DM1.WgrTab.Open;
  if DM1.WgrTab.Locate ('ID', variant (wgr), []) then 
    Artikel_SQL := 'AI.WARENGRUPPE=' + IntToStr(DM1.WgrTabID.AsInteger)
  else 
    Artikel_SQL := '';
  if Last <> Artikel_SQL then 
    UpdateQuery;
end;            

//------------------------------------------------------------------------------
procedure TInventurForm.UpdateQuery;
var 
  LastTime: DWord; 
  Anz, Limit: LongInt;
begin
  LastTime := GetTickCount;
  InvArtTab.SQL.Clear;
  InvArtTab.Close;

  if SortField = 'CALC_STATUS' then 
    SortField := 'STATUS';

  Anz := 0; 
	Limit := -1;
  if (Wgr < 1) and (length(Suchbegr) = 0) then
  begin
    with dm1.uniquery do
    begin
      sql.text := 'SELECT COUNT(*) AS ANZ FROM ARTIKEL_INVENTUR AI WHERE ' +
        'INVENTUR_ID=' + IntToStr(InvKopfTabID.AsInteger);
      if Artikel_SQL <> '' then 
        SQL.Text := SQL.Text + ' AND ' + Artikel_SQL;
      Open;
      if RecordCount>0 then 
        ANZ := FieldByName('ANZ').AsInteger;
      Close;

      if Anz > 50000 then
      begin
        MessageDlg (_('Ihre Datenabfrage hat mehr als 50.000 Datensätze ' +
          'zurückgeliefert' + #13#10 +
          'und wurde deshalb auf die 1. 50.000 Datensätze ' +
          'beschränkt.' + #13#10#13#10 +
          'Wählen Sie eine Warengruppe aus um diese Begrenzung ' +
          'zu umgehen.'), mtwarning, [mbok], 0);
        Limit := 50000;
      end;
    end;
  end;

  InvArtTab.SQL.Add ('SELECT');
  InvArtTab.SQL.Add ('AI.INVENTUR_ID,AI.ARTIKEL_ID,AI.WARENGRUPPE,AI.ARTNUM,');
  InvArtTab.SQL.Add ('AI.MATCHCODE,AI.BARCODE,AI.KURZTEXT,A.LAENGE,');
  InvArtTab.SQL.Add ('A.GROESSE,A.DIMENSION,A.GEWICHT,AI.MENGE_IST,');
  InvArtTab.SQL.Add ('AI.MENGE_SOLL,AI.MENGE_DIFF,AI.EK_PREIS,AI.INVENTUR_WERT,');
  InvArtTab.SQL.Add ('AI.STATUS,AI.BEARBEITER');
  InvArtTab.SQL.Add ('FROM ARTIKEL_INVENTUR AI');
  InvArtTab.SQL.Add ('left outer JOIN ARTIKEL A on A.REC_ID=AI.ARTIKEL_ID');
  InvArtTab.SQL.Add ('WHERE');
  if Artikel_SQL <> '' then 
    InvArtTab.SQL.Add (Artikel_SQL + ' AND ');
  InvArtTab.SQL.Add ('INVENTUR_ID=' + IntToStr(InvKopfTabID.AsInteger));


  if SuchBegr <> '' then
  begin
    case SuchFeldCB.ItemIndex of
      1: begin
        InvArtTab.SQL.Add ('and (' + DM1.GetSearchSQL (['AI.MATCHCODE'], Suchbegr) + ')');
      end;
      2: begin
        InvArtTab.SQL.Add ('and (' + DM1.GetSearchSQL (['AI.ARTNUM'], Suchbegr) + ')');
      end;
      3: begin
        InvArtTab.SQL.Add ('and (' + DM1.GetSearchSQL (['AI.BARCODE'], Suchbegr) + ')');
      end;
      else begin
        InvArtTab.SQL.Add ('and (' + DM1.GetSearchSQL (['AI.KURZTEXT'], Suchbegr) + ')');
      end;
    end;
  end;

  InvArtTab.SQL.Add ('ORDER BY ' + SortField);
  if Limit > 0 then 
    InvArtTab.SQL.Add ('LIMIT 0,' + Inttostr(limit));
  Screen.Cursor := crSQLWait;

  try
    try 
      InvArtTab.Open; 
    except 
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  InvArtTabAfterPost(nil);

  QueryTime := GetTickCount - LastTime;
  UpdateStatus;
  ProgressForm.Stop
end;

//------------------------------------------------------------------------------
procedure TInventurForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung, Erstellt, Geaendert: String;
begin
  if InvArtTab.RecordCount = 0 then 
    Datensatz := _('keine')
  else 
  if InvArtTab.RecordCount = Limit then 
    Datensatz := inttostr (InvArtTab.RecNo) + ' ' + _('von') + ' >=' + inttostr (InvArtTab.RecordCount)
  else 
    Datensatz := inttostr (InvArtTab.RecNo) + ' ' + _('von') + ' ' + inttostr (InvArtTab.RecordCount);

  Sortierung := _('Sortierung : ') + sortname;

  SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' ' + _('Sek.');

  if assigned (OnUpdateStatusBar) then 
    OnUpdateStatusBar (SuchZeit, Datensatz, Sortierung, StatStr, '');
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ArtListGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  if SortField <>Field.FieldName then
  begin
    SortField := Field.FieldName;
    UpdateQuery;
  end;
end;                                                              

//------------------------------------------------------------------------------
procedure TInventurForm.SetSort (Sort: Integer);
begin
  if sort < 0 then 
    sort := aktsort;
  if sort = aktsort then 
    exit;
  case sort of
    {mach}     
    1: begin
      sortname         := _('Suchbegriff');
      SortField        := 'MATCHCODE'
    end;
    {name}     
    2: begin
      sortname         := _('Artikelnummer');
      SortField        := 'ARTNUM'
    end;
  end;
  AktSort := Sort;

  if First then 
    exit;

  UpdateQuery;
  UpdateStatus;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.Name11Click(Sender: TObject);
begin
  if (tmenuitem (sender).tag > 0) and (tmenuitem (sender).tag < 6) then
  begin
    tmenuitem (sender).checked := not tmenuitem (sender).checked;
    SetSort (tmenuitem (sender).tag);
  end;
end;                                                            

//------------------------------------------------------------------------------
procedure TInventurForm.InvArtTabCalcFields(DataSet: TDataSet);
begin
  case InvArtTabSTATUS.AsInteger of
    0: InvArtTabCALC_STATUS.AsString := '';
    1: InvArtTabCALC_STATUS.AsString := _('OK');
    2: InvArtTabCALC_STATUS.AsString := _('Gebucht');
    3: InvArtTabCALC_STATUS.AsString := _('Fehler');
  end;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvArtTabBeforePost(DataSet: TDataSet);
begin
  InvArtTabBEARBEITER.Value := DM1.view_user;
  InvArtTabSTATUS.Value := 1;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.alleArtikelalsbearbeitetmarkieren1Click(
Sender: TObject);
begin
  with dm1.UniQuery do
  begin
    sql.text := 'update ARTIKEL_INVENTUR set STATUS=1 where INVENTUR_ID=' +
      Inttostr(InvKopfTabID.AsInteger);
    execsql;
  end;
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.alleArtikelalsunbearbeitetmarkieren1Click(Sender: TObject);
begin
  with dm1.UniQuery do
  begin
    sql.text := 'update ARTIKEL_INVENTUR set STATUS=0 where INVENTUR_ID=' +
      Inttostr(InvKopfTabID.AsInteger);
    execsql;
  end;
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.SollmengennachISTMengenbernehmen1Click(
Sender: TObject);
begin
  with dm1.UniQuery do
  begin
    sql.text := 'update ARTIKEL_INVENTUR set MENGE_IST=MENGE_SOLL' +
      ' where INVENTUR_ID=' + Inttostr(InvKopfTabID.AsInteger);
    execsql;
  end;
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ISTMengenauf0setzen1Click(Sender: TObject);
begin
  with dm1.UniQuery do
  begin
    sql.text := 'update ARTIKEL_INVENTUR set MENGE_IST=0 where INVENTUR_ID=' +
      Inttostr(InvKopfTabID.AsInteger);
    execsql;
  end;
  UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvArtTabAfterScroll(DataSet: TDataSet);
begin
  UpdateStatus; ProgressForm.Stop
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvArtTabBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvArtTabAfterPost(DataSet: TDataSet);
var p: double;
begin
  sum := 0;
  unfertig := 0;
  dm1.uniquery.sql.text := 'select STATUS, COUNT(*) as ANZAHL from ARTIKEL_INVENTUR ' +
    'where INVENTUR_ID=' + Inttostr(InvKopfTabID.AsInteger) +
    ' group by STATUS';
  dm1.uniquery.open;
  while not dm1.uniquery.eof do
  begin
    sum := sum + dm1.uniquery.fieldbyname ('ANZAHL').asInteger;

    if dm1.uniquery.fieldbyname ('STATUS').asInteger = 0 then 
      unfertig := unfertig + dm1.uniquery.fieldbyname ('ANZAHL').asInteger;

    dm1.uniquery.next;
  end;
  dm1.uniquery.close;

  if sum <> 0 then 
    p := unfertig * 100 / sum 
  else 
    p := 0;

  StatStr := _('Unbearbeitet') + ': ' + Inttostr(unfertig) + ' (' + FormatFloat ('0.0"%)"', p);

  InvArtTabAfterScroll (nil);
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ArtListGridDblClick(Sender: TObject);
begin
  if InvArtTabStatus.AsInteger = 1 then 
    exit;
  InvArtTab.Edit;
  InvArtTabStatus.AsInteger := 1;
  InvArtTab.Post;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.PC1Resize(Sender: TObject);
begin
  // ca. 20% der Gesamtbreite
  WgrGB.Width := Round(Tabsheet3.ClientWidth * 0.20);
end;

//------------------------------------------------------------------------------
procedure TInventurForm.Artikelliste1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  if InvArtTab.Active then
    InvArtTab.Close;
  PrintRechForm.ShowInvArtZaehlliste (InvKopfTabID.AsInteger, Wgr);
  PC1Change(Sender);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TInventurForm.Lagerwertliste1Click(Sender: TObject);
begin
  {$IFDEF WITH_REPORT}
  if InvArtTab.Active then
    InvArtTab.Close;
  PrintRechForm.ShowInvArtWertliste (InvKopfTabID.AsInteger, Wgr);
  PC1Change(Sender);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TInventurForm.InvFertigBtnClick(Sender: TObject);
var 
  InventurMakeArtikelForm: TInventurMakeArtikelForm;
  Akt, Err: Integer; s: string;
begin
  RefreshBtnClick (Sender);

  if MessageDlg (_('Wollen Sie diese Inventur abschließen ?' + #13#10 +
    'Dieser Vorgang kann nicht rückgängig gemacht werden !'),
    mtconfirmation, mbyesnocancel, 0) = mryes then
  begin
    InventurMakeArtikelForm := TInventurMakeArtikelForm.Create (Self);
    try
      { TODO : Monitor Transaction gibt es nicht mehr } //17.10.09-ud.
      //MainForm.ZMonitor1.Transaction := nil; // Monitor aus !
      if InventurMakeArtikelForm.SaveInventur (InvKopfTabID.AsInteger, Akt, Err) then
      begin
        InvKopfTab.Edit;
        InvKopfTabStatus.AsInteger := 1; // Abgeschlossen
        InvKopfTab.Post;
      end;

      S := Inttostr(akt) + ' ' + _('Artikel wurden aktualisiert');
      if err > 0 then 
      begin
        s := s + ',' + #13#10 +
          inttostr(err) +
          ' ' + _('Artikel konnten nicht aktualisiert werden,' + #13#10 +
          'da der Artikel nicht mehr existiert.');
      end;
      S := _('Die Inventur wurde erfolgreich abgeschlossen.') + #13#10 + S;

      MessageDlg (S, mtinformation, [mbok], 0);
    finally
      { TODO : Monitor Transaction gibt es nicht mehr } //17.10.09-ud.
      //MainForm.ZMonitor1.Transaction := DM1.Transact1;
      InventurMakeArtikelForm.Free;
      InventurMakeArtikelForm := nil;
    end;
  end;
end;  

//------------------------------------------------------------------------------
procedure TInventurForm.RefreshBtnClick(Sender: TObject);
begin
  dm1.uniquery.close;
  dm1.uniquery.sql.text :=
    'update ARTIKEL_INVENTUR set MENGE_DIFF = MENGE_IST - MENGE_SOLL ' +
    'where INVENTUR_ID=' + IntToStr(InvKopfTabID.AsInteger);
  dm1.UniQuery.ExecSql;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ListeBtnMouseEnter(Sender: TObject);
begin
  if (sender is tJvSpeedButton) and (TJvSpeedButton(Sender).Enabled) then
  begin
    tJvSpeedButton(Sender).Transparent := False;
    tJvSpeedButton(Sender).Font.Color := clBlack;
  end;
end;                                  

//------------------------------------------------------------------------------
procedure TInventurForm.ListeBtnMouseLeave(Sender: TObject);
begin
  if (sender is tJvSpeedButton) then
  begin
    tJvSpeedButton(Sender).Transparent := True;
    tJvSpeedButton(Sender).Font.Color := clWhite;
  end;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.ArtListGridKeyPress(Sender: TObject;
var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if InvArtTab.State = dsEdit then 
      InvArtTab.Post;
    InvArtTab.Next;
  end;
end;  

//------------------------------------------------------------------------------
procedure TInventurForm.SuchFeldCBChange(Sender: TObject);
begin
  if SuchBeg.Text <> '' then
  begin
    searchtime := 15;
    searchtimer.enabled := true;
  end;
end;                 

//------------------------------------------------------------------------------
procedure TInventurForm.SuchBegChange(Sender: TObject);
begin
  if (InvArtTab.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg (_('Der aktuelle Artikel wurde verändert,' + #13#10 +
      'wollen Sie die Änderung speichern ?'),
      mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      InvArtTab.Post;
    end else
    begin
      try
        if (InvArtTab.State in [dsEdit, dsInsert]) then 
          InvArtTab.Cancel;
      except 
      end;
    end;
  end;

  searchtime := 15;
  searchtimer.enabled := true;
end;      

//------------------------------------------------------------------------------
procedure TInventurForm.SuchBegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    try
      ArtListGrid.SetFocus;
    except 
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TInventurForm.SearchTimerTimer(Sender: TObject);
begin
  if SuchBeg.Text = '%' then 
    exit;
  SuchBegr := Suchbeg.Text;

  // führende Leerzeichen entfernen
  while (length(Suchbegr) > 0) and (Suchbegr[1] = ' ') do 
    delete (Suchbegr, 1, 1);
  // Leerzeichen am ende Entfernen
  while (length(Suchbegr) > 0) and (Suchbegr[length(Suchbegr)] = ' ') do 
    delete (Suchbegr, length(SuchBegr), 1);

  if searchtime > 0 then 
    dec (searchtime) 
  else
  begin
    searchtimer.enabled := false;
    UpdateQuery;
  end;
end;

//------------------------------------------------------------------------------

end.

