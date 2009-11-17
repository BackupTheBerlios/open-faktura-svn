{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Bestellvorschläge Einkauf                                         }
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
{ - Beschreibung genauer angeben                                               }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_EK_Bestellvorschlag;

{$I CAO32.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZSqlUpdate, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Buttons, Mask, DBCtrls, OFGroupBox,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, OFDBGrid, ComCtrls, JvExComCtrls,
  JvComCtrls, ExtCtrls, ToolWin, JvMenus, OFSecurity;
  //OF_Var_Const,

type
  TEBBestVorForm = class(TForm)
    EKBestVorDS: TDataSource;
    MainPanel: TPanel;
    EKBestVorTab: TOFZQuery;
    MainMenu1: TJvMainMenu;
    Bearbeiten1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    Layoutspeichern1: TMenuItem;
    SichtbareSpalten1: TMenuItem;
    N3: TMenuItem;
    Aktualisieren1: TMenuItem;
    ArtPan: TPanel;
    FilterLab: TLabel;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    Belegnummer1: TMenuItem;
    Datum1: TMenuItem;
    Name1: TMenuItem;
    Stadium1: TMenuItem;
    Preis1: TMenuItem;
    Suchen1: TMenuItem;
    Drucken1: TMenuItem;
    ClientPanel: TPanel;
    DetailPan: TPanel;
    LiefPC: TJvPageControl;
    LieferantenTab: TTabSheet;
    Splitter1: TSplitter;
    JourGrid: TOFDBGrid;
    N1: TMenuItem;
    nurArtikelInRechnungen: TMenuItem;
    alleBestellvorschlaege: TMenuItem;
    Label1: TLabel;
    Filter1: TMenuItem;
    EKBestVorTabREC_ID: TIntegerField;
    EKBestVorTabKURZNAME: TStringField;
    EKBestVorTabMATCHCODE: TStringField;
    EKBestVorTabARTNUM: TStringField;
    EKBestVorTabVK_MENGE: TFloatField;
    EKBestVorTabMENGE_AKT: TFloatField;
    EKBestVorTabMENGE_DIV: TFloatField;
    EKBestVorTabMENGE_BESTELLT: TFloatField;
    EKBestVorTabMENGE_EKBEST_EDI: TFloatField;
    EKBestVorTabMENGE_BVOR: TFloatField;
    EKBestVorTabMENGE_MIN: TFloatField;
    EKBestVorTabMIN_EKPREIS: TFloatField;
    EKBestVorTabANZ_LIEF: TLargeintField;
    EKBestLiefTab: TZQuery;
    EKBestLiefDS: TDataSource;
    LiefListGrid: TOFDBGrid;
    EKBestLiefTabARTIKEL_ID: TIntegerField;
    EKBestLiefTabADRESS_ID: TIntegerField;
    EKBestLiefTabPREIS_TYP: TIntegerField;
    EKBestLiefTabBESTNUM: TStringField;
    EKBestLiefTabPREIS: TFloatField;
    EKBestLiefTabINFO: TMemoField;
    EKBestLiefTabGEAEND: TDateTimeField;
    EKBestLiefTabGEAEND_NAME: TStringField;
    EKBestLiefTabMATCHCODE: TStringField;
    EKBestLiefTabKUNDENGRUPPE: TIntegerField;
    EKBestLiefTabKUNNUM2: TStringField;
    EKBestLiefTabNAME1: TStringField;
    EKBestLiefTabSTRASSE: TStringField;
    EKBestLiefTabLAND: TStringField;
    EKBestLiefTabPLZ: TStringField;
    EKBestLiefTabORT: TStringField;
    EKBestLiefTabTELE1: TStringField;
    EKBestLiefTabFAX: TStringField;
    EKBestLiefTabEMAIL: TStringField;
    EKBestLiefTabLIEF_LIEFART: TIntegerField;
    EKBestLiefTabLIEF_ZAHLART: TIntegerField;
    DetailTab: TTabSheet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    LiefEdiBtn: TToolButton;
    ToolButton5: TToolButton;
    BestellenBtn: TToolButton;
    ToolButton7: TToolButton;
    DBNavigator2: TDBNavigator;
    EKBestLiefUpdateSql: TZUpdateSql;
    SuchGB: TOFGroupBox;
    CaoGroupBox1: TOFGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    CaoGroupBox2: TOFGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    LiefDetailSaveBtn: TBitBtn;
    LiefDetailCancelBtn: TBitBtn;
    DBMemo1: TDBMemo;
    EKBestVorTabINFO: TMemoField;
    EKBestVorUpdateSql: TZUpdateSql;
    EKHistTab: TTabSheet;
    VKReEdiTab: TTabSheet;
    EKBestTab: TTabSheet;
    BewegungInfoTab: TZQuery;
    BewegungInfoDS: TDataSource;
    InfoGrid: TOFDBGrid;
    BewegungInfoTabRDATUM: TDateField;
    BewegungInfoTabKUN_NAME1: TStringField;
    BewegungInfoTabEPREIS: TFloatField;
    BewegungInfoTabMENGE: TFloatField;
    BewegungInfoTabRABATT: TFloatField;
    BewegungInfoTabWAEHRUNG: TStringField;
    BewegungInfoTabVRENUM: TStringField;
    procedure JourGridTitleBtnClick(Sender: TObject; ACol: Integer;
    Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure EKBestVorTabAfterScroll(DataSet: TDataSet);
    procedure Layoutspeichern1Click(Sender: TObject);
    procedure SichtbareSpalten1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Aktualisieren1Click(Sender: TObject);
    procedure Preis1Click(Sender: TObject);
    procedure SuchenBtn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure MenuFilterClick(Sender: TObject);
    procedure EKBestVorDSDataChange(Sender: TObject; Field: TField);
    procedure LiefEdiBtnClick(Sender: TObject);
    procedure EKBestLiefTabAfterScroll(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure EKBestLiefDSStateChange(Sender: TObject);
    procedure LiefDetailSaveBtnClick(Sender: TObject);
    procedure LiefDetailCancelBtnClick(Sender: TObject);
    procedure EKBestLiefTabAfterPost(DataSet: TDataSet);
    procedure EKBestLiefTabBeforePost(DataSet: TDataSet);
    procedure LiefPCChange(Sender: TObject);
  private
    { Private-Deklarationen }
    SortField      : String;
    SortName       : String;
    First          : Boolean;
    QueryTime      : DWord;
    LastID         : Integer;
    Filter         : Integer;

    procedure SetSort (Index: Integer);
    procedure UpdateStatus;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    procedure UpdateQuery;
  end;

    // var EBBestVorForm: TEBBestVorForm;

implementation

uses
  OF_Tool1, OF_Main, OF_DM, CAO_Kunde, OF_DBGrid_Layout;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TEBBestVorForm.FormCreate(Sender: TObject);
begin
  Scaled := TRUE;
  //if Screen.Width <> 800 then ScaleBy(Screen.Width,800);
  OnUpdateStatusBar := nil;
  First     := True;
  LastID    := -1;
  Filter    := 3;
  alleBestellvorschlaege.Checked := True;

  SortName  := 'Artikelnummer';
  SortField := 'ARTNUM';
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.FormActivate(Sender: TObject);
//var ID : Integer; LastSDate : Integer;
begin
  if First then
  begin
    LastID := -1;

    JourGrid.RowColor1     := DM1.C2Color;
    LiefListGrid.RowColor1 := DM1.C2Color;
    InfoGrid.RowColor1     := DM1.C2Color;
    //JourPosGrid.RowColor1 :=DM1.C2Color;
    JourGrid.EditColor     := DM1.EditColor;
    LiefListGrid.EditColor := DM1.EditColor;
    //JourPosGrid.EditColor :=DM1.EditColor;

    dm1.GridLoadLayout (tDBGrid(JourGrid),    'EK_BESTVOR_ART' , 101);
    dm1.GridLoadLayout (tDBGrid(LiefListGrid), 'EK_BESTVOR_LIEF', 101);

    Filter := DM1.ReadIntegerU ('', 'EK_BESTVOR_FILTER', 1);

    First := False;

    LiefPC.ActivePage := LieferantenTab;
  end;
  UpdateQuery;
  UpdateStatus;
  JourGrid.SetFocus;
end;                                    

//------------------------------------------------------------------------------
procedure TEBBestVorForm.FormDeactivate(Sender: TObject);
begin
  if EKBestVorTab.Active then EKBestVorTab.Close;
  if EKBestLiefTab.Active then EKBestLiefTab.Close;
end;
//------------------------------------------------------------------------------
procedure TEBBestVorForm.SetSort (Index: Integer);
begin
  case Index of
    {RDATUM} 
    2: begin 
      Datum1.Checked :=True;
      sortfield := 'ARTNUM';
      SortName  := 'Artikelnummer';
    end;
    {NAME}   
    3: begin 
      Name1.Checked :=True;
      sortfield := 'KURZNAME';
      SortName  := 'Artikelbezeichnung';
    end;
    {STADIUM}
    4: begin 
      Stadium1.Checked :=True;
      sortfield := 'VK_MENGE';
      SortName  := 'Menge verkauft';
    end;
    {PREIS}  
    5: begin 
      Preis1.Checked :=True;
      sortfield := 'MENGE_AKT';
      SortName  := 'Menge Lager';
    end;
    {RNUM}
    else begin 
      Belegnummer1.Checked :=True;
      sortfield := 'MATCHCODE';
      SortName  := 'Suchbegriff';
    end;
  end;
  
  if Not First then 
    UpdateQuery;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.JourGridTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var 
  fn: string; 
  i: integer;
begin
  fn := uppercase (Field.FieldName);

  if fn = 'MATCHCODE' then 
    I := 1 
  else
  if fn = 'ARTNUM' then 
    I := 2 
  else
  if fn = 'KURZNAME' then 
    I := 3 
  else
  if fn = 'VK_MENGE' then 
    I := 4 
  else
  if fn = 'MENGE_AKT' then 
    I := 5
  else 
    I := 1;

  SetSort (I);
end;                 

//------------------------------------------------------------------------------
procedure TEBBestVorForm.UpdateQuery;
var 
  OldTime: DWord;
begin
  Application.ProcessMessages;
  try
    OldTime := GetTickCount;
    Screen.Cursor := crSQLWait;
    EKBestVorTab.Close;
    EKBestVorTab.SQL.Text :=
    'select A.REC_ID, A.KURZNAME, A.MATCHCODE, A.ARTNUM,' +

    {
    'A.MENGE_VKRE_EDI as VK_MENGE, A.MENGE_AKT,'+
    'A.MENGE_VKRE_EDI - A.MENGE_AKT - A.MENGE_BESTELLT -'+
    'A.MENGE_EKBEST_EDI + A.MENGE_MIN as MENGE_DIV,'+
    'A.MENGE_BESTELLT, A.MENGE_EKBEST_EDI, A.MENGE_BVOR,'+
    }
    //Neu
    'IFNULL(AB_VK_EDI.SUM_MENGE,0) as VK_MENGE, A.MENGE_AKT,' +
    'IFNULL(AB_VK_EDI.SUM_MENGE,0) - A.MENGE_AKT -' +
    'IFNULL(AB_EKB.SUM_MENGE, 0) - IFNULL(AB_EKB_EDI.SUM_MENGE, 0)+' +
    'A.MENGE_MIN as MENGE_DIV,' +
    'IFNULL(AB_EKB.SUM_MENGE, 0) as MENGE_BESTELLT,' +
    'IFNULL(AB_EKB_EDI.SUM_MENGE, 0) as MENGE_EKBEST_EDI,A.MENGE_BVOR,' +

    'A.MENGE_MIN,MIN(AP.PREIS) as MIN_EKPREIS,A.INFO,' +
    'COUNT(AP.ADRESS_ID) as ANZ_LIEF ' +
    'from ARTIKEL A ' +

    'LEFT OUTER JOIN ARTIKEL_BDATEN as AB_VK_EDI on ' +
    'AB_VK_EDI.ARTIKEL_ID=A.REC_ID and AB_VK_EDI.QUELLE=13 ' +
    'LEFT OUTER JOIN ARTIKEL_BDATEN as AB_EKB_EDI on ' +
    'AB_EKB_EDI.ARTIKEL_ID=A.REC_ID and AB_EKB_EDI.QUELLE=16 ' +
    'LEFT OUTER JOIN ARTIKEL_BDATEN as AB_EKB on ' +
    'AB_EKB.ARTIKEL_ID=A.REC_ID and AB_EKB.QUELLE=26 ' +

    'LEFT OUTER JOIN ARTIKEL_PREIS AP ON AP.ARTIKEL_ID=A.REC_ID ' +
    'and AP.PREIS_TYP=5 ' +
    'where A.ARTIKELTYP="N" and A.MENGE_AKT+IFNULL(AB_EKB.SUM_MENGE, 0)' +
    '<IFNULL(AB_VK_EDI.SUM_MENGE,0) + A.MENGE_MIN  ';

    EKBestVorTab.SQL.Add ('group BY A.REC_ID');

    case Filter of
      2:   begin
        EKBestVorTab.SQL.Add ('HAVING VK_MENGE>0');
        FilterLab.Caption := ' gefiltert (nur verkaufte Artikel)';
        nurArtikelInRechnungen.checked := True;
      end;
      else begin
        FilterLab.Caption := '';
        alleBestellvorschlaege.checked := True;
      end;
    end;


    EKBestVorTab.SQL.Add ('ORDER BY ' + sortfield);
    try 
      EKBestVorTab.Open; 
    except 
    end;
    ToolBar1.Enabled := (EKBestVorTab.Active) and (EKBestVorTab.RecordCount > 0);
  finally
    Screen.Cursor := crDefault;
    QueryTime := gettickcount - oldtime;
  end;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestVorTabAfterScroll(DataSet: TDataSet);
begin
  if EKBestVorTabRec_ID.AsInteger = LastID then 
    exit;

  LastID := EKBestVorTabRec_ID.AsInteger;
  UpdateStatus;
  EKBestLiefTab.Close;
  EKBestLiefTab.ParamByName('AID').asInteger := EKBestVorTabREC_ID.AsInteger;
  EKBestLiefTab.Open;

  LiefPCCHange(Self);
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.Layoutspeichern1Click(Sender: TObject);
begin
  dm1.GridSaveLayout(tDBGrid(JourGrid), 'EK_BESTVOR_ART', 101);
  dm1.GridSaveLayout(tDBGrid(LiefListGrid), 'EK_BESTVOR_LIEF', 101);
end;                                   

//------------------------------------------------------------------------------
procedure TEBBestVorForm.SichtbareSpalten1Click(Sender: TObject);
begin
  VisibleSpaltenForm.UpdateTable (tDBGrid(JourGrid));
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.Aktualisieren1Click(Sender: TObject);
begin
  EKBestVorTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.Preis1Click(Sender: TObject);
begin
  SetSort(tMenuItem(Sender).Tag);
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.UpdateStatus;
var 
  SuchZeit, Datensatz, Sortierung: String;
begin
  SuchZeit := FormatFloat ('0.00', (querytime) / 1000) + ' Sek.';
  Datensatz := Inttostr(EKBestVorTab.RecNo) + ' von ' + inttostr (EKBestVorTab.RecordCount);
  Sortierung := 'Sortierung : ' + SortName;

  if assigned(OnUpdateStatusBar) then 
    OnUpdateStatusBar(SuchZeit, Datensatz, Sortierung, '', '');
end;                 

//------------------------------------------------------------------------------
procedure TEBBestVorForm.SuchenBtn1Click(Sender: TObject);
begin
  MainForm.FindDialog1.OnFind := FindDialog1Find;
  MainForm.FindDialog1.Execute;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.FindDialog1Find(Sender: TObject);
var 
  f, t: string;
  i: integer;
  Found: Boolean;
begin
  i := JourGrid.Col;
  f := JourGrid.Columns[i-1].FieldName;
  t := MainForm.FindDialog1.FindText;
  Found := False;
  if frDown in MainForm.FindDialog1.Options then 
    EKBestVorTab.Next
  else 
    EKBestVorTab.Prior;
  repeat
    if frMatchCase in MainForm.FindDialog1.Options then
    begin
      // Groß- und Kleinschreibung beachten
      Found := Pos (t, EKBestVorTab.FieldByName(f).AsString)>0;
    end else
    begin
      // Groß- und Kleinschreibung nicht beachten
      Found := Pos (uppercase(t), uppercase(EKBestVorTab.FieldByName(f).AsString))>0;
    end;

    if not Found then
    begin
      if frDown in MainForm.FindDialog1.Options then 
        EKBestVorTab.Next
      else 
        EKBestVorTab.Prior;
    end;
  until (EKBestVorTab.Eof) or (EKBestVorTab.Bof) or (Found);
end;                                                

//------------------------------------------------------------------------------
procedure TEBBestVorForm.MenuFilterClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and (tMenuItem(Sender).Tag > 0) then
  begin
    Filter := tMenuItem(Sender).Tag;
    DM1.WriteIntegerU ('', 'EK_BESTVOR_FILTER', Filter);
    UpdateQuery;
  end;
end;                                                    

//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestVorDSDataChange(Sender: TObject; Field: TField);
begin
  EKBestVorTabAfterScroll(nil);
end;                                                            

//------------------------------------------------------------------------------
procedure TEBBestVorForm.LiefEdiBtnClick(Sender: TObject);
begin
  LiefPC.ActivePage := DetailTab;
end;
//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestLiefTabAfterScroll(DataSet: TDataSet);
begin
  LiefEdiBtn.Enabled   := EKBestLiefTab.RecordCount > 0;
  BestellenBtn.Enabled := EKBestLiefTab.RecordCount > 0;
  DetailTab.TabVisible := EKBestLiefTab.RecordCount > 0;
  LiefListGrid.Enabled := EKBestLiefTab.RecordCount > 0;
end;                                                  

//------------------------------------------------------------------------------
procedure TEBBestVorForm.ToolButton2Click(Sender: TObject);
begin
  if not assigned(MainForm.AddrForm) then
  begin
    MainForm.AddrForm := TAdressForm.Create (Self{MainForm});
    with MainForm.AddrForm do
    begin
      BorderStyle := bsSizeable;
      Height      := 500;
      Width       := 620;
      Left        := MainForm.Left + 160;
      Top         := MainForm.Top + 10;
      //Formactivate(Sender);
      UebernahmeBtn.Visible := True;
      uebernehmen1.Visible := True;
      //bernehmenundSchlieen1.Visible :=True;
      Button1.Cancel := True;
      Invalidate;
    end;
  end;
  with MainForm.AddrForm do
  begin
    ShowModal;
    if Uebern then
    begin
      // Adresse in Preisliste übernehmen

      with DM1.UniQuery do
      begin
        Close;
        Sql.Text := 'INSERT INTO ARTIKEL_PREIS ' +
        'SET ADRESS_ID=' + IntToStr(KSQueryRec_ID.AsInteger) +
        ',ARTIKEL_ID=' + IntToStr(EKBestVorTabREC_ID.AsInteger) +
        ',PREIS_TYP=5';
        ExecSQL;
      end;
      EKBestVorTab.Refresh;
      LastID := -1;
      EKBestVorTabAfterScroll(nil);

      LiefPC.ActivePage := DetailTab;

      EKBestLiefTab.Locate(
        'ADRESS_ID;ARTIKEL_ID;PREIS_TYP',
        VarArrayOf([KSQueryRec_ID.AsInteger, EKBestVorTabREC_ID.AsInteger, 5]), []
      );

      Uebern := False;
      FormDeactivate (Sender);
    end;
  end; // with
end;  

//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestLiefDSStateChange(Sender: TObject);
begin
  LiefDetailSaveBtn.Enabled   := EKBestLiefTab.State in [dsEdit, dsInsert];
  LiefDetailCancelBtn.Enabled := EKBestLiefTab.State in [dsEdit, dsInsert];
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.LiefDetailSaveBtnClick(Sender: TObject);
begin
  EKBestLiefTab.Post;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.LiefDetailCancelBtnClick(Sender: TObject);
begin
  EKBestLiefTab.Cancel;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestLiefTabAfterPost(DataSet: TDataSet);
begin
  EKBestVorTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.EKBestLiefTabBeforePost(DataSet: TDataSet);
begin
  EKBestLiefTabGEAEND.AsDateTime := Now;
  EKBestLiefTabGEAEND_NAME.AsString := DM1.View_User;
end;

//------------------------------------------------------------------------------
procedure TEBBestVorForm.LiefPCChange(Sender: TObject);
begin
  if LiefPC.ActivePage = EKBestTab then
  begin
    if InfoGrid.Parent <> EKBestTab then 
      InfoGrid.Parent := EKBestTab;
    BewegungInfoTab.Close;
    BewegungInfoTab.ParamByName('QUELLE').AsInteger := EK_BEST_EDI;
    BewegungInfoTab.ParamByName('AID').AsInteger := EKBestVorTabREC_ID.AsInteger;
    BewegungInfoTab.Open;
  end else
  if LiefPC.ActivePage = EKHistTab then
  begin
    if InfoGrid.Parent <> EKHistTab then 
      InfoGrid.Parent := EKHistTab;
    BewegungInfoTab.Close;
    BewegungInfoTab.ParamByName('QUELLE').AsInteger := EK_RECH;
    BewegungInfoTab.ParamByName('AID').AsInteger := EKBestVorTabREC_ID.AsInteger;
    BewegungInfoTab.Open;
  end else
  if LiefPC.ActivePage = VKReEdiTab then
  begin
    if InfoGrid.Parent <> VKReEdiTab then 
      InfoGrid.Parent := VKReEdiTab;
    BewegungInfoTab.Close;
    BewegungInfoTab.ParamByName('QUELLE').AsInteger := VK_RECH_EDI;
    BewegungInfoTab.ParamByName('AID').AsInteger := EKBestVorTabREC_ID.AsInteger;
    BewegungInfoTab.Open;
  end else
  begin 
    BewegungInfoTab.Close;
  end;
end;
  
//------------------------------------------------------------------------------

end.

{

SQL ab 1.3 :

select A.REC_ID, A.ARTNUM,A.MENGE_AKT, MENGE_MIN,
IFNULL(ABD_VK.SUM_MENGE,0) as MENGE_VK_EDI,
IFNULL(ABD_EKB.SUM_MENGE,0) as MENGE_EKB_EDI,
IFNULL(ABD_VK.SUM_MENGE,0) - A.MENGE_AKT - A.MENGE_BESTELLT -IFNULL(ABD_EKB.SUM_MENGE,0) + A.MENGE_MIN as DIFF
from ARTIKEL A
left outer join ARTIKEL_BDATEN ABD_VK on ABD_VK.ARTIKEL_ID = A.REC_ID and ABD_VK.QUELLE=13
left outer join ARTIKEL_BDATEN ABD_EKB on ABD_EKB.ARTIKEL_ID = A.REC_ID and ABD_EKB.QUELLE=16
where A.MENGE_AKT + A.MENGE_BESTELLT < IFNULL(ABD_VK.SUM_MENGE,0) + A.MENGE_MIN
order by A.REC_ID

}

