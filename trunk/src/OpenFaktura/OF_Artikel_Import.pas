{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Artikel aus Textdatei (csv)                                       }
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
{ - Messdaten obsolet! Präzisieren oder entfernen, da nicht aussagekräftig     }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 20.06.2003 - Bugfix, wenn die Warengruppe per Importfeld oder Wertzuweisung }
{              verwendet wurde, gab es einen SQL-Fehler }
{ 29.06.2003 - Trennzeichen kann jetzt gewählt werden }
{            - die ersten n Zeilen können ignoriert werden }
{ 18.07.2003 - Bug mit ASCII-Zeichen kleiner 0x20 (Space) gefixt }
{ 30.07.2003 - Profile / Laden / Speichern hinzugefügt }
{ 12.09.2003 - Timing bei Analyse of Neuanlage/Update verbessert }
{ 11.10.2003 - beim Vergleich der Keyfelder wird nicht mehr zw. GROSS/klein }
{              unterschieden. }
{ 19.11.2003 - HerstellerName zum Import hinzugefügt, Hersteller die nicht }
{              gefunden wurden werden automatisch angelegt }
{ 18.12.2003 - Import im Kategorie-Name/ID erweitert }
{            - wenn die ID verwendet wird, so wird nur dann ein Eintrag angelegt, }
{              wenn diese tatsächlich existiert }
{            - wenn der Name angegeben wurde, wird die ID ermittelt sofern der }
{              Eintrag existiert, ansonsten wird der Eintrag neu angelegt und }
{              der Artikel wird der Kategorie zugewiesen }
{ 24.10.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 09.04.2005 - Fehlerhandling beim Öffnen von Dateien eingebaut }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}


{-------------------------------------------------------------------------------
Meßdaten: (lexa: obsolet!)

- Import von 27000 Artikeln jeweils Artikel + Lieferantenpreis (alles Neuanlage)

5,8 Minuten

- Import von 27000 Artikeln jeweils Artikel + Lieferantenpreis (alles Update)

4,7 Minuten (ohne Aktualisierung der Tabellenposition 4,2 Minuten)

- Update der Lieferantenpreise (Keine Artikeldaten werden geändert)

2,4 Minuten

- Update der Artikel (keine Lieferantenpreise wurden geändert)

2,9 Minuten

-------------------------------------------------------------------------------}

unit OF_Artikel_Import;

interface

{$I OF.INC}

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, SortGrid, Grids, Buttons, DBGrids, Spin, JvToolEdit, Mask,
  JvExMask, ExtCtrls, ComCtrls;

type
  TArtikelImportForm = class(TForm)
    Panel1: TPanel;
    CloseBtn: TBitBtn;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    LB1: TListBox;
    FeldGrid: TStringGrid;
    Logbuch: TTabSheet;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ImGrid: TSortGrid;
    TabSheet5: TTabSheet;
    Label4: TLabel;
    LB4: TListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    KeyGrid: TStringGrid;
    Label5: TLabel;
    WertGrid: TStringGrid;
    Label6: TLabel;
    ASQuery: TZQuery;
    TabSheet6: TTabSheet;
    Label1: TLabel;
    FileEdit: TJvFilenameEdit;
    LiefIDLabel: TLabel;
    KuNrEdit: TJvComboEdit;
    pb1: TProgressBar;
    Label8: TLabel;
    DelimCB: TComboBox;
    Label7: TLabel;
    LineIgnoreEdit: TSpinEdit;
    ProfSaveBtn: TButton;
    ProfileEdit: TEdit;
    ProfLoadBtn: TButton;
    ITab: TSortGrid;
    Bevel1: TBevel;
    ProfTab: TZQuery;
    ProfDS: TDataSource;
    Label9: TLabel;
    ProfGrid: TDBGrid;
    ProfTabMAINKEY: TStringField;
    ProfTabNAME: TStringField;
    ProfTabVAL_BLOB: TMemoField;
    ProfTabLAST_CHANGE: TDateTimeField;
    Bevel2: TBevel;
    
    ASQueryREC_ID: TIntegerField;
    ASQueryWARENGRUPPE: TIntegerField;
    ASQueryMATCHCODE: TStringField;
    ASQueryARTNUM: TStringField;
    ASQueryBARCODE: TStringField;
    ASQueryKURZNAME: TStringField;
    ASQueryLANGNAME: TBlobField;
    ASQueryVK1: TFloatField;
    ASQueryVK2: TFloatField;
    ASQueryVK3: TFloatField;
    ASQueryVK4: TFloatField;
    ASQueryVK5: TFloatField;
    ASQuerySTEUER_CODE: TIntegerField;
    ASQueryME_EINHEIT: TStringField;
    ASQueryERSATZ_ARTNUM: TStringField;
    ASQueryKAS_NAME: TStringField;
    ASQueryPR_EINHEIT: TFloatField;
    ASQueryLAENGE: TStringField;
    ASQueryGROESSE: TStringField;
    ASQueryDIMENSION: TStringField;
    ASQueryGEWICHT: TFloatField;
    ASQueryEK_PREIS: TFloatField;
    ASQueryMENGE_BVOR: TFloatField;
    ASQueryHERKUNFTSLAND: TStringField;
    ASQueryLAGERORT: TStringField;
    ASQueryRABGRP_ID: TStringField;
    ASQueryARTIKELTYP: TStringField;
    ASQueryMENGE_AKT: TFloatField;
    ASQueryERLOES_KTO: TIntegerField;
    ASQueryAUFW_KTO: TIntegerField;
    ASQueryERSTELLT: TDateField;
    ASQueryERST_NAME: TStringField;
    ASQueryGEAEND: TDateField;
    ASQueryGEAEND_NAME: TStringField;
    ASQuerySHOP_ARTIKEL_ID: TIntegerField;
    ASQuerySHOP_PREIS_LISTE: TFloatField;
    ASQueryINVENTUR_WERT: TFloatField;
    ASQueryMENGE_MIN: TFloatField;
    ASQuerySN_FLAG: TBooleanField;
    ASQueryNO_EK_FLAG: TBooleanField;
    ASQuerySHOP_ID: TIntegerField;
    ASQuerySHOP_CHANGE_DATE: TDateTimeField;
    ASQuerySHOP_CHANGE_FLAG: TIntegerField;
    ASQueryVK1B: TFloatField;
    ASQueryVK2B: TFloatField;
    ASQueryVK3B: TFloatField;
    ASQueryVK4B: TFloatField;
    ASQueryVK5B: TFloatField;
    ASQueryHERSTELLER_ID: TIntegerField;
    Label10: TLabel;
    ASQueryVPE: TIntegerField;
    ASQueryHERST_ARTNUM: TStringField;
    ASQuerySHOP_LANGTEXT: TMemoField;
    ASQuerySHOP_DATENBLATT: TStringField;
    ASQuerySHOP_KATALOG: TStringField;
    ASQuerySHOP_ZEICHNUNG: TStringField;
    ASQuerySHOP_HANDBUCH: TStringField;
    Label11: TLabel;
    ModusCB: TComboBox;
    UpdateBtn: TBitBtn;
    ASQuerySHOP_IMAGE: TStringField;
    ASQuerySHOP_IMAGE_MED: TStringField;
    ASQuerySHOP_IMAGE_LARGE: TStringField;
    ASQueryUSERFELD_01: TStringField;
    ASQueryUSERFELD_02: TStringField;
    ASQueryUSERFELD_03: TStringField;
    ASQueryUSERFELD_04: TStringField;
    ASQueryUSERFELD_05: TStringField;
    ASQueryUSERFELD_06: TStringField;
    ASQueryUSERFELD_07: TStringField;
    ASQueryUSERFELD_08: TStringField;
    ASQueryUSERFELD_09: TStringField;
    ASQueryUSERFELD_10: TStringField;
    ASQueryHERSTELLER_NAME: TStringField;
    KatTab: TZQuery;
    KatTabSHOP_ID: TIntegerField;
    KatTabID: TIntegerField;
    KatTabNAME: TStringField;
    ASQueryKATEGORIE_ID: TIntegerField;
    ASQueryKATEGORIE_NAME: TStringField;
    ASQueryINFO: TMemoField;
    ASQueryPROVIS_PROZ: TFloatField;
    Label12: TLabel;
    HKTextCB: TCheckBox;
        
    procedure FileEditChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure WertGridSelectCell(Sender: TObject; ACol, ARow: Integer;
    var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure KuNrEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProfSaveBtnClick(Sender: TObject);
    procedure ProfLoadBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ProfileEditChange(Sender: TObject);
    procedure ProfTabBeforePost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    Delim      : String;
    
    Vk1_faktor,
    Vk2_faktor,
    Vk3_faktor,
    Vk4_faktor,
    Vk5_faktor,
    shop_faktor: Double;
    
    DEF_EKTO,
    DEF_AKTO,
    DEF_L_EKTO,
    DEF_L_AKTO : Integer;
    
    function CreateProfile: String;
    procedure LoadProfile (P: String);    
  public
    { Public-Deklarationen }
    //WarenGruppe : Integer;
    LiefID     : Integer;
  end;
        
  // nicht notwendig, Formular wird dynamisch zur Laufzeit erzeugt !!!
  //var ArtikelImportForm: TArtikelImportForm;
  
implementation

uses
  GNUGetText,
  OF_DM, OF_Tool1, OF_Function, OF_Var_Const,
  OF_Main, OF_ARTIKEL1, OF_Kunde;

{$R *.DFM}
  
//------------------------------------------------------------------------------
procedure TArtikelImportForm.FormCreate(Sender: TObject);
begin
  try 
    TranslateComponent(self);  
  except 
  end;

  PC1.ActivePage := PC1.Pages[0];
  Delim := #9;
  DelimCB.ItemIndex := 0;

  Vk1_faktor        := 0;
  Vk2_faktor        := 0;
  Vk3_faktor        := 0;
  Vk4_faktor        := 0;
  Vk5_faktor        := 0;
  shop_faktor       := 0;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy(96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TArtikelImportForm.FormShow(Sender: TObject);
var 
  i, j: integer;
begin
  FileEdit.InitialDir := DM1.ImportDir;
  ModusCB.ItemIndex   := 0;

  // Kalkulationsfaktoren laden
  Vk1_faktor  := DM1.ReadDouble('MAIN\ARTIKEL', 'VK1_CALC_FAKTOR', 0);
  Vk2_faktor  := DM1.ReadDouble('MAIN\ARTIKEL', 'VK2_CALC_FAKTOR', 0);
  Vk3_faktor  := DM1.ReadDouble('MAIN\ARTIKEL', 'VK3_CALC_FAKTOR', 0);
  Vk4_faktor  := DM1.ReadDouble('MAIN\ARTIKEL', 'VK4_CALC_FAKTOR', 0);
  Vk5_faktor  := DM1.ReadDouble('MAIN\ARTIKEL', 'VK5_CALC_FAKTOR', 0);
  shop_faktor := DM1.ReadDouble('MAIN\ARTIKEL', 'SHOP_CALC_FAKTOR', 0);

  ASQueryVK1.Visible := Vk1_faktor <= 0;
  ASQueryVK2.Visible := Vk2_faktor <= 0;
  ASQueryVK3.Visible := Vk3_faktor <= 0;
  ASQueryVK4.Visible := Vk4_faktor <= 0;
  ASQueryVK5.Visible := Vk5_faktor <= 0;
  ASQuerySHOP_PREIS_LISTE.Visible := shop_faktor <= 0;

  DEF_EKTO   := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_ERLOESKTO', 8400);
  DEF_AKTO   := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_AUFWANDSKTO', 3400);
  DEF_L_EKTO := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_LOHN_ERLOESKTO', 8401);
  DEF_L_AKTO := DM1.ReadInteger('MAIN\ARTIKEL', 'DEF_LOHN_AUFWANDSKTO', 3401);

  ProfileEdit.Text := '';
  ProfSaveBtn.Enabled := False;
  ProfTab.Open;
  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);

  UpdateBtn.Enabled := False;
  FeldGrid.Cells[0, 0] := _('Ziel-Feld');
  FeldGrid.Cells[1, 0] := _('Import-Feld');
  LB1.Items.Clear;
  with ASQuery do
  begin
    if Fields.Count > 0 then
    begin
      j := 0;
      FeldGrid.RowCount := 2;

      for i := 0 to Fields.Count-1 do
      begin
        if Fields[i].Visible then
        begin
          inc(j);
          if FeldGrid.RowCount<J + 1 then 
            FeldGrid.RowCount := J + 1;
          FeldGrid.Cells[0, J] := Fields[i].FieldName;
        end;
      end;
    end;
  end;

  inc(j);
  if FeldGrid.RowCount<J + 1 then 
    FeldGrid.RowCount := J + 1;
  FeldGrid.Cells[0, J] := 'LIEF_BESTNUM';

  inc(j);
  if FeldGrid.RowCount<J + 1 then 
    FeldGrid.RowCount := J + 1;
  FeldGrid.Cells[0, J] := 'LIEF_PREIS';


  WertGrid.Cells[0, 0] := _('Ziel-Feld');
  WertGrid.Cells[1, 0] := _('Wert');
  with ASQuery do
  begin
    if Fields.Count>0 then
    begin
      j := 0;
      WertGrid.RowCount := 2;

      for i := 0 to Fields.Count-1 do
      begin
        if Fields[i].Visible then
        begin
          inc(j);
          if WertGrid.RowCount<J + 1 then WertGrid.RowCount := J + 1;
          WertGrid.Cells[0, J] := Fields[i].FieldName;
        end;
      end;
    end;
  end;

  KeyGrid.Cells[0, 0] := _('Key-Feld');
  KeyGrid.Cells[1, 0] := _('Import-Feld');
  KeyGrid.Cells[0, 1] := 'WARENGRUPPE';
  KeyGrid.Cells[0, 2] := 'MATCHCODE';
  KeyGrid.Cells[0, 3] := 'ARTNUM';
  KeyGrid.Cells[0, 4] := 'BARCODE';
  KeyGrid.Cells[0, 5] := 'KURZNAME';
  KeyGrid.Cells[0, 6] := 'HERST_ARTNUM';
  KeyGrid.Cells[0, 7] := 'LIEF_BESTNUM';
  LB4.Items.Clear;

  LiefID := -1;
  LiefIDLabel.Caption := _('Lieferanten-ID') + ' : ' + IntToStr(LiefID);
end;

//------------------------------------------------------------------------------
procedure TArtikelImportForm.FileEditChange(Sender: TObject);
var 
  Dat: String;
  S, S1: String;
  SCount: Integer;
  ZCount: Integer;
  TxT: TextFile;
  P, P1: PChar;
  NewDelim: String;
  Zeile: Integer;
  KCount: Integer;
  I, Err: Integer;
begin
  case DelimCB.ItemIndex of
    0: NewDelim := #9;
    1: NewDelim := ',';
    2: NewDelim := ';';
  end;
  Delim := NewDelim;

  //if ImpTab.Active then ImpTab.Close;
  Dat := FileEdit.Text;
  if (length(Dat) > 0) and (dat[1] = '"') then 
    delete(dat, 1, 1);
  if (length(Dat) > 0) and (dat[length(dat)] = '"') then 
    delete(dat, length(dat), 1);
  LB1.Items.Clear;
  if not fileexists(dat) then
  begin
    UpdateBtn.Enabled := False;
    exit;
  end;

  ZCount := 0;
  Zeile  := 0;
  ITab.RowCount := 2;
  ITab.ColCount := 2;

  AssignFile(Txt, Dat);
  {$I-}
  Reset(txt);
  Err := IOResult;
  {$I+}
  if Err = 0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      // Textdatei Zeilenweise einlesen
      while not Eof(Txt) do
      begin
        Readln(txt, S);
        if (length(S) = 0) then 
          Continue; // Leerzeilen Ignorieren

        if HKTextCB.Checked then
        begin
          repeat
            KCount := 0;
            for i := 1 to length(S) do 
              if S[i] = '"' then 
                inc(KCount);

            if KCount and 1 = 1 then
            begin
              if not eof(txt) then
              begin
                Readln(Txt, S1);
                S := S + #13 + S1;
              end;
            end;
          until Eof(txt) or( KCount and 1 = 0);
        end;

        inc(Zeile);
        if (Zeile <= LineIgnoreEdit.Value) then 
          Continue;

        // Prüfen ob zeile nur aus Trennzeichen besteht
        // wenn ja dann überspringen
        S1 := S;
        while (length(S1) > 0) and (Pos(Delim, S1) > 0) do 
          delete(S1, Pos(Delim, S1), 1);
        if length(S1) = 0 then 
          Continue;

        SCount := 0;

        inc(ZCount); // Zeilen-Counter erhöhen

        for i := 0 to ITab.ColCount-1 do 
          ITab.Cells[i, ZCount] := '';

        if ITab.RowCount<ZCount + 1 then 
          ITab.RowCount := ZCount + 1; // Stringgrid um eine Zeile erweitern

        try
          P := PChar(S);
          while P^ <> #0 do
          begin
            if (P^ = '"') and (HKTextCB.Checked) then 
              S1 := AnsiExtractQuotedStr(P, '"')
            else
            begin
              P1 := P;
              while (P^ <> #0) and (P^ <> Delim) do 
                P := CharNext(P);
              SetString(S1, P1, P - P1);
            end;

            //Wert einfügen
            inc(SCount);
            if ITab.ColCount<SCount + 1 then 
              ITab.ColCount := SCount + 1;
            ITab.Cells[SCount, ZCount] := sqlToString(S1);

            if P^ = Delim then 
              P := CharNext(P);
          end;
        except 
        end;
        //NEU ENDE

        ITab.Cells[0, ZCount] := IntToStr(ZCount);
      end;
    finally
      // Datei schließen
      CloseFile (txt);
    end;
    for i := 1 to ITab.ColCount-1 do 
      ITab.Cells[i, 0] := 'Feld_' + FormatFloat('00', I);

    // Listen mit Feldnamen löschen
    LB1.Items.Clear;
    LB4.Items.Clear;

    //Feldnamen einfügen
    for i := 1 to ITab.ColCount-1 do 
      LB1.Items.Add (ITab.Cells[i, 0]);
    for i := 1 to ITab.ColCount-1 do 
      LB4.Items.Add (ITab.Cells[i, 0]);
  end else 
    MessageDlg(GetWinErrorStr(Err), mterror, [mbok], 0);

  Screen.Cursor := crDefault;
end;          

//------------------------------------------------------------------------------
procedure TArtikelImportForm.SpeedButton1Click(Sender: TObject);
begin
  if (LB1.Itemindex > -1) then 
    FeldGrid.Cells[1, FeldGrid.Row] := LB1.Items[LB1.Itemindex];
end;                    

//------------------------------------------------------------------------------
procedure TArtikelImportForm.SpeedButton2Click(Sender: TObject);
begin
  if (FeldGrid.Row > 0) then 
    FeldGrid.Cells[1, FeldGrid.Row] := '';
end;
//------------------------------------------------------------------------------
procedure TArtikelImportForm.UpdateBtnClick(Sender: TObject);
var 
  I, Y, ID: Integer;
  S, SQLW: String;
  P, F: Double;
  EKTO, AKTO: Integer;
  UpLPreis: Boolean;
  FZW: String;
  Update: Boolean;
  EK, VK1,
  VK2, VK3,
  VK4, VK5,
  SHOP, VK1B,
  VK2B, VK3B,
  VK4B, VK5B,
  ST: Double;
  STC, WGR,
  WgrOrg: Integer;
  LastTime: DWord;
  C: Integer;
  Modus: Integer;
  HName: String;
  HID: Integer;
  KID: Integer;
  KName: String;
begin
  Modus := ModusCB.ItemIndex;
  Screen.Cursor := crSqlWait;
  LastTime := GetTickCount;
  try
    C := 0;
    pb1.position := 0;
    pb1.max := ITab.RowCount-1;
    UpdateBtn.Enabled := False;

    DM1.HerstellerTab.Close;
    DM1.HerstellerTab.ReadOnly := True;
    DM1.HerstellerTab.ParamByName('SID').AsInteger := 1;
    DM1.HerstellerTab.Open;
    KatTab.Open;

    for Y := 1 to ImGrid.RowCount-1 do
    begin
      pb1.position := Y;
      Update := False;

      ST   := 0;
      EK   := 0;
      VK1  := 0; VK1B  := 0;
      VK2  := 0; VK2B  := 0;
      VK3  := 0; VK3B  := 0;
      VK4  := 0; VK4B  := 0;
      VK5  := 0; VK5B  := 0;
      STC  := -1;
      WGR  := -1;
      SHOP := 0;
      EKTO := -1;
      AKTO := -1;

      KID   := -1;
      KName := '';

      if length(ImGrid.Cells[1, Y]) > 0 then
      begin
        // Update oder Neuanlage ???
        if (copy(ImGrid.Cells[1, Y], 1, 1) = 'U') then
        begin
          Update := True;
        end;

        UpLPreis := False;
        FZW := '';

        // Feldzuweisungen
        for I := 1 to FeldGrid.RowCount-1 do
        begin
          if length(FeldGrid.Cells[1, I]) > 0 then
          begin
            if length(ITab.Cells[StrToInt(Copy(FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]) > 0 then
            begin
              if (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_BESTNUM') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_PREIS') then
              begin
                UpLPreis := True;
                continue;
              end;

              if (Uppercase(FeldGrid.Cells[0, I]) = 'HERSTELLER_NAME') then
              begin
                HID := -1;
                try
                  S := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                  if length(S) > 0 then
                  begin
                    if DM1.HerstellerTab.Locate('HERSTELLER_NAME', S, []) then
                    begin
                      HID := DM1.Herstellertab.FieldByName('HERSTELLER_ID').AsInteger;
                    end else
                    begin
                      try
                        DM1.HerstellerTab.Append;
                        DM1.HerstellerTab.FieldByName ('HERSTELLER_NAME').AsString := S;
                        DM1.HerstellerTab.FieldByName ('SHOP_ID').AsInteger := 1;
                        DM1.HerstellerTab.Post;

                        HID := DM1.Herstellertab.FieldByName('HERSTELLER_ID').AsInteger;
                      except
                        DM1.Herstellertab.Cancel;
                        HID := -1;
                      end;
                    end;
                  end;
                except
                  HID := -1;
                end;
                if HID > 0 then
                begin
                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + 'HERSTELLER_ID=' + IntToStr(HID);
                end;
              end else
              if (Uppercase(FeldGrid.Cells[0, I]) = 'HERSTELLER_ID') then
              begin
                HID := -1;
                try
                  S := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                  if length(S) > 0 then 
                    HID := StrToInt(S);
                except
                  HID := -1;
                end;
                if HID > 0 then
                begin
                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + Uppercase(FeldGrid.Cells[0, I]) + '=' + IntToStr(HID);
                end;
              end else
              if (Uppercase(FeldGrid.Cells[0, I]) = 'KATEGORIE_ID') then
              begin
                KID := -1;
                try
                  S := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                  if length(S) > 0 then 
                    KID := StrToInt(S);
                  if (KID > -1) and (not KatTab.Locate('ID', KID, [])) then 
                    KID := -1;
                except
                  KID := -1;
                end;
              end else
              if (Uppercase(FeldGrid.Cells[0, I]) = 'KATEGORIE_NAME') then
              begin
                KNAME := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                if (length(KNAME) > 0) and (KatTab.Locate('NAME', Uppercase(KName), [loCaseInsensitive])) then
                begin
                  KID := KatTabID.AsInteger;
                end else
                begin
                  // Kategorie neu anlegen
                  KatTab.Append;
                  try
                    KatTabShop_ID.AsInteger := 1;
                    KatTabName.AsString := KName;
                    KatTab.Post;
                    KID := KatTabID.AsInteger;
                  except
                    KatTab.Cancel;
                  end;
                end;
              end else
              if (Uppercase(FeldGrid.Cells[0, I]) = 'VK1') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'VK2') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'VK3') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'VK4') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'VK5') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'SHOP_PREIS_LISTE') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'EK_PREIS') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'GEWICHT') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'STEUER_CODE') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'WARENGRUPPE') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'ERLOES_KTO') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'AUFW_KTO') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'PE_EINHEIT') or
                 (Uppercase(FeldGrid.Cells[0, I]) = 'MENGE_BVOR') then
              begin
                S := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                while pos(ThousandSeparator, S) > 0 do 
                  delete(S, Pos(ThousandSeparator, S), 1);
                try 
                  P := StrToFloat (S); 
                except 
                  P := 0; 
                end;
                //if not Update then try ASQuery.FieldByName (FeldGrid.Cells[0,I]).AsFloat :=P; except end;

                if Uppercase(FeldGrid.Cells[0, I]) = 'VK1'              then VK1 := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'VK2'              then VK2 := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'VK3'              then VK3 := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'VK4'              then VK4 := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'VK5'              then VK5 := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'EK_PREIS'         then EK := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'SHOP_PREIS_LISTE' then SHOP := P else
                if Uppercase(FeldGrid.Cells[0, I]) = 'STEUER_CODE'      then STC := Round(P) else
                if Uppercase(FeldGrid.Cells[0, I]) = 'WARENGRUPPE'      then WGR := Round(P) else
                if Uppercase(FeldGrid.Cells[0, I]) = 'ERLOES_KTO'       then EKTO := Round(P) else
                if Uppercase(FeldGrid.Cells[0, I]) = 'AUFW_KTO'         then AKTO := Round(P) else
                begin
                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + Uppercase(FeldGrid.Cells[0, I]) + '=' + sqlFloatToStr(P);
                end;
              end else
              if (Uppercase(FeldGrid.Cells[0, I]) = 'RABGRP_ID') then
              begin
                if not DM1.LiefRabGrp.Active then 
                  DM1.LiefRabGrp.Open;

                if DM1.LiefRabGrp.Locate ('ADDR_ID;RABGRP_TYP;LIEF_RABGRP;MIN_MENGE',
                          VarArrayOf ([LiefID, 5,
                          ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y], 1]), []) then
                begin
                  try
                    //   if not Update then ASQuery.FieldByName ('RABGRP_ID').AsString :=
                    //     DM1.LiefRabGrp.FieldByName ('RABGRP_ID').AsString;

                    if length(FZW) > 0 then 
                      FZW := FZW + ',';
                    FZW := FZW + Uppercase(FeldGrid.Cells[0, I]) + '="' + DM1.LiefRabGrp.FieldByName ('RABGRP_ID').AsString + '"';

                  except 
                  end;
                end;
              end else
              begin
                try
                  // if not Update then ASQuery.FieldByName (FeldGrid.Cells[0,I]).AsString :=
                  //   ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1,I],6,2)),Y];

                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + Uppercase(FeldGrid.Cells[0, I]) + '="' + 
                         sqlStringToSql(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]) + '"';

                except 
                end;
              end;
            end;
          end;
        end;

        // Wertzuweisungen
        for I := 1 to WertGrid.RowCount-1 do
        begin
          if length(WertGrid.Cells[1, I]) > 0 then
          begin
            //-------------------------------
            if (Uppercase(WertGrid.Cells[0, I]) = 'KATEGORIE_ID') then
            begin
              KID := -1;
              try
                S := WertGrid.Cells[1, I];
                if length(S) > 0 then 
                  KID := StrToInt(S);
                if (KID > -1) and (not KatTab.Locate('ID', KID, [])) then 
                  KID := -1;
              except
                KID := -1;
              end;
            end else
            if (Uppercase(WertGrid.Cells[0, I]) = 'KATEGORIE_NAME') then
            begin
              KNAME := WertGrid.Cells[1, I];
              if (length(KNAME) > 0) and (KatTab.Locate('NAME', Uppercase(KName), [loCaseInsensitive])) then
              begin
                KID := KatTabID.AsInteger;
              end else
              begin
                // Kategorie neu anlegen
                KatTab.Append;
                try
                  KatTabShop_ID.AsInteger := 1;
                  KatTabName.AsString := KName;
                  KatTab.Post;
                  KID := KatTabID.AsInteger;
                except
                  KatTab.Cancel;
                end;
              end;
            end else
            //---------------------
            if length(WertGrid.Cells[1, I]) > 0 then
            begin
              if (Uppercase(WertGrid.Cells[0, I]) = 'VK1') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'VK2') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'VK3') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'VK4') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'VK5') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'EK_PREIS') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'SHOP_PREIS_LISTE') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'GEWICHT') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'STEUER_CODE') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'ERLOES_KTO') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'AUFW_KTO') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'WARENGRUPPE') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'PE_EINHEIT') or
                 (Uppercase(WertGrid.Cells[0, I]) = 'MENGE_BVOR') then
              begin
                S := WertGrid.Cells[1, I];
                while pos(ThousandSeparator, S) > 0 do 
                  delete(S, Pos(ThousandSeparator, S), 1);
                try 
                  P := StrToFloat (S); 
                except 
                  P := 0; 
                end;

                //if not Update then try ASQuery.FieldByName (WertGrid.Cells[0,I]).AsFloat :=P; except end;

                if Uppercase(WertGrid.Cells[0, I]) = 'VK1'              then VK1 := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'VK2'              then VK2 := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'VK3'              then VK3 := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'VK4'              then VK4 := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'VK5'              then VK5 := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'EK_PREIS'         then EK := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'SHOP_PREIS_LISTE' then SHOP := P else
                if Uppercase(WertGrid.Cells[0, I]) = 'STEUER_CODE'      then STC := Round(P) else
                if Uppercase(WertGrid.Cells[0, I]) = 'ERLOES_KTO'       then EKTO := Round(P) else
                if Uppercase(WertGrid.Cells[0, I]) = 'AUFW_KTO'         then AKTO := Round(P) else
                if Uppercase(WertGrid.Cells[0, I]) = 'WARENGRUPPE'      then WGR := Round(P) else
                begin
                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + Uppercase(WertGrid.Cells[0, I]) + '=' + sqlFloatToStr(P);
                end;
              end else
              if (Uppercase(WertGrid.Cells[0, I]) = 'RABGRP_ID') then
              begin
                if not DM1.LiefRabGrp.Active then 
                  DM1.LiefRabGrp.Open;

                if DM1.LiefRabGrp.Locate('ADDR_ID;RABGRP_TYP;LIEF_RABGRP;MIN_MENGE',  
                                         VarArrayOf ([LiefID, 5, WertGrid.Cells[1, I], 1]), []) then
                begin
                  try
                    //   if not Update then ASQuery.FieldByName ('RABGRP_ID').AsString :=
                    //     DM1.LiefRabGrp.FieldByName ('RABGRP_ID').AsString;

                    if length(FZW) > 0 then 
                      FZW := FZW + ',';
                    FZW := FZW + Uppercase(FeldGrid.Cells[0, I]) + '="' + DM1.LiefRabGrp.FieldByName ('RABGRP_ID').AsString + '"';

                  except 
                  end;
                end;
              end else
              begin
                try
                  // if not Update then ASQuery.FieldByName (WertGrid.Cells[0,I]).AsString :=
                  //   ZSqlTypes.StringToSql(WertGrid.Cells[1,I]);

                  if length(FZW) > 0 then 
                    FZW := FZW + ',';
                  FZW := FZW + Uppercase(WertGrid.Cells[0, I]) + '="' + sqlStringToSql(WertGrid.Cells[1, I]) + '"';
                except 
                end;
              end;
            end;
          end;
        end;
        // Ende Wertzuweisungen

        if (STC < 0) or (STC > 3) then 
          ST := DM1.MwstTab[DM1.DefMwStCD]
        else 
          ST := DM1.MwstTab[STC];

        if EK <> 0 then  // macht nur sinn wenn EK <> 0
        begin
          if (VK1_FAKTOR <> 0) then 
            VK1 := Round(EK * VK1_FAKTOR * 100) / 100;
          if (VK2_FAKTOR <> 0) then 
            VK2 := Round(EK * VK2_FAKTOR * 100) / 100;
          if (VK3_FAKTOR <> 0) then 
            VK3 := Round(EK * VK3_FAKTOR * 100) / 100;
          if (VK4_FAKTOR <> 0) then 
            VK4 := Round(EK * VK4_FAKTOR * 100) / 100;
          if (VK5_FAKTOR <> 0) then 
            VK5 := Round(EK * VK5_FAKTOR * 100) / 100;
          if (SHOP_FAKTOR <> 0) then 
            SHOP := Round(EK * SHOP_FAKTOR * 100) / 100;
        end;

        if (not Update) and ((length(FZW) > 0) or (EK <> 0)) and (WGR < 1) then 
          WGR := 1;

        if (Wgr > 0) then 
          WgrOrg := Wgr
        else 
        if Update then 
          WgrOrg := Integer(ImGrid.Objects[1, Y]);

        //Warengruppenkalkulation berechnen
        if (WgrOrg > 0) and (EK <> 0) then
        begin
          if DM1.GetWGRCalcFaktor(WgrOrg, 1, F) then 
            VK1 := Round(EK * F * 100) / 100;
          if DM1.GetWGRCalcFaktor(WgrOrg, 2, F) then 
            VK2 := Round(EK * F * 100) / 100;
          if DM1.GetWGRCalcFaktor(WgrOrg, 3, F) then 
            VK3 := Round(EK * F * 100) / 100;
          if DM1.GetWGRCalcFaktor(WgrOrg, 4, F) then 
            VK4 := Round(EK * F * 100) / 100;
          if DM1.GetWGRCalcFaktor(WgrOrg, 5, F) then 
            VK5 := Round(EK * F * 100) / 100;
        end;
        
        if VK1 <> 0 then 
          VK1B := Round (round(VK1 * (100 + ST)) / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
        if VK2 <> 0 then 
          VK2B := Round (round(VK2 * (100 + ST)) / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
        if VK3 <> 0 then 
          VK3B := Round (round(VK3 * (100 + ST)) / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
        if VK4 <> 0 then         
          VK4B := Round (round(VK4 * (100 + ST)) / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;
        if VK5 <> 0 then 
          VK5B := Round (round(VK5 * (100 + ST)) / DM1.BR_RUND_WERT) * DM1.BR_RUND_WERT / 100;

        // SQL erweitern

        if EK <> 0 then
        begin
          if length(FZW) > 0 then 
            FZW := FZW + ',';
          FZW := FZW + 'EK_PREIS=' + sqlFloatToStr(EK);
        end;

        if VK1 <> 0 then 
          FZW := FZW + ',VK1=' + sqlFloatToStr(VK1);
        if VK2 <> 0 then 
          FZW := FZW + ',VK2=' + sqlFloatToStr(VK2);
        if VK3 <> 0 then 
          FZW := FZW + ',VK3=' + sqlFloatToStr(VK3);
        if VK4 <> 0 then 
          FZW := FZW + ',VK4=' + sqlFloatToStr(VK4);
        if VK5 <> 0 then 
          FZW := FZW + ',VK5=' + sqlFloatToStr(VK5);

        if SHOP <> 0 then 
          FZW := FZW + ',SHOP_PREIS_LISTE=' + sqlFloatToStr(SHOP);

        if VK1B <> 0 then 
          FZW := FZW + ',VK1B=' + sqlFloatToStr(VK1B);
        if VK2B <> 0 then 
          FZW := FZW + ',VK2B=' + sqlFloatToStr(VK2B);
        if VK3B <> 0 then 
          FZW := FZW + ',VK3B=' + sqlFloatToStr(VK3B);
        if VK4B <> 0 then 
          FZW := FZW + ',VK4B=' + sqlFloatToStr(VK4B);
        if VK5B <> 0 then 
          FZW := FZW + ',VK5B=' + sqlFloatToStr(VK5B);

        if (length(FZW) > 0) and (FZW[1] = ',') then 
          delete(FZW, 1, 1);

        if (not Update) and (length(FZW) > 0) then
        begin
          //if WGR<1 then WGR :=1;

          FZW := FZW + ',WARENGRUPPE=' + IntToStr(WGR);

          if (EKTO < 1) or (AKTO < 1) then
          begin
            if EKTO < 1 then 
              EKTO := DEF_EKTO;
            if AKTO < 1 then 
              AKTO := DEF_AKTO;

            DM1.GetWGRDefaultKonten (WGR, EKTO, AKTO);
          end;

          FZW := FZW + ',ERLOES_KTO=' + IntToStr(EKTO);
          FZW := FZW + ',AUFW_KTO=' + IntToStr(AKTO);

          if (ArtikelForm.ArtnumAuto) and (Pos('ARTNUM=', FZW) = 0) and (Update = False) then //JP16062005
          begin
            // Artikelnummer vergeben
            FZW := FZW + ',ARTNUM="' + sqlStringToSql(DM1.IncNummerStr(ARTNUM_KEY)) + '"';
          end;          

          if (STC < 0) or (STC > 3) then 
            STC := DM1.DefMwStCD;

          FZW := FZW + ',STEUER_CODE=' + IntToStr(STC);
          FZW := FZW + ',ERSTELLT="' + sqlDateTimeToSqlDate(Now) + '"';
          FZW := FZW + ',ERST_NAME="' + sqlStringToSql(DM1.View_User) + '"';
        end else
        if (length(FZW) > 0) then
        begin
          if WGR > 0 then 
            FZW := FZW + ',WARENGRUPPE=' + IntToStr(WGR);
          if STC >= 0 then 
            FZW := FZW + ',STEUER_CODE=' + IntToStr(STC);
        end;

        if length(FZW) > 0 then
        begin
          FZW := FZW + ',GEAEND="' + sqlDateTimeToSqlDate(Now) + '"';
          FZW := FZW + ',GEAEND_NAME="' + sqlStringToSql(DM1.View_User) + '"';
        end;

        ID := -1;
        if (Update) and (length(FZW) > 0) and (Modus in [0, 1]) then
        begin
          DM1.UniQuery.Close;
          DM1.UniQuery.Sql.Text := 'update ARTIKEL SET ' +
                          FZW +
                          ' where REC_ID=' +
                          IntToStr(Integer(ImGrid.Objects[0, Y]));
                          DM1.UniQuery.ExecSql;
                          ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '    OK';

          if assigned(ImGrid.Objects[0, Y]) then 
            ID := Integer(ImGrid.Objects[0, Y])
          else 
            ID := -1;
        end else
        if (length(FZW) > 0) and (Modus in [0, 2]) and (not Update) then
        begin
          DM1.UniQuery.Close;
          DM1.UniQuery.Sql.Text := 'INSERT INTO ARTIKEL SET ' + FZW;
          DM1.UniQuery.ExecSql;

          DM1.UniQuery.Close;
          DM1.UniQuery.Sql.Text := 'SELECT LAST_INSERT_ID() as ID';
          DM1.UniQuery.Open;
          ID := DM1.UniQuery.FieldByName ('ID').AsInteger;
          ImGrid.Objects[0, Y] := Pointer(Integer(ID));
          ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '    OK';
        end;

        if (length(ImGrid.Cells[1, Y]) > 0) and (Copy(ImGrid.Cells[1, Y], 1, 1) = '-') then
        begin
          if assigned(ImGrid.Objects[0, Y]) then 
            ID := Integer(ImGrid.Objects[0, Y])
          else 
            ID := -1;
        end;

        // Kategorie ggf. Zuweisen
        if (KID > -1) and (ID > -1) then
        begin
          DM1.UniQuery.Close;
          DM1.UniQuery.Sql.Text := 'REPLACE INTO ARTIKEL_TO_KAT SET ' +
                            'SHOP_ID=1, ARTIKEL_ID=' + IntToStr(ID) + ', ' +
                            'KAT_ID=' + IntToStr(KID);
          try
            DM1.Uniquery.ExecSql;
          except 
          end;
        end;

        // Lieferantenpreise pflegen
        if (UpLPreis) and (ID > 0) then
        begin
          Update := copy(ImGrid.Cells[1, Y], 3, 1) = 'U';

          FZW := '';

          if not Update then
          begin
            // neuen Datensatz in Preistabelle einfügen
            FZW := 'INSERT INTO ARTIKEL_PREIS SET ADRESS_ID=' + IntToStr(LiefID) +
                   ',ARTIKEL_ID=' + IntToStr(Integer(ImGrid.Objects[0, Y])) +
                   ',PREIS_TYP=5';
          end;

          // Feldzuweisungen
          for I := FeldGrid.RowCount - 3 to FeldGrid.RowCount-1 do
          begin
            if length(FeldGrid.Cells[1, I]) > 0 then
            begin
              if length(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]) > 0 then
              begin
                if (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_BESTNUM') then
                begin
                  if length(FZW) > 0 then 
                    FZW := FZW + ', ';
                    FZW := FZW + 'BESTNUM="' + sqlStringToSql(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]) + '"';

                end else
                if (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_PREIS') then
                begin
                  S := ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
                  while pos(ThousandSeparator, S) > 0 do 
                    delete(S, Pos(ThousandSeparator, S), 1);

                  try 
                    P := StrToFloat (S); 
                  except 
                    P := 0; 
                  end;

                  FZW := FZW + ',PREIS=' + sqlFloatToStr(P);
                end;
              end;
            end;
          end;

          if length(FZW) > 0 then
          begin
            FZW := FZW + ',GEAEND="' + sqlDateTimeToSqlDate(Now) + '"';
            FZW := FZW + ',GEAEND_NAME="' + sqlStringToSql(DM1.View_User) + '"';
          end;

          if (Update) and (length(FZW) > 0) then
          begin
            FZW := 'UPDATE ARTIKEL_PREIS SET ' + FZW +
                   ' where ADRESS_ID=' + IntToStr(LiefID) +
                   ' and ARTIKEL_ID=' + IntToStr(Integer(ImGrid.Objects[0, Y])) +
                   ' and PREIS_TYP=5';
          end;


          if (((Update) and (Modus in [0, 1])) or
             ((not Update) and (Modus in [0, 2]) and (copy(ImGrid.Cells[1, Y], 3, 1) = 'N'))) and (length(FZW) > 0) then
          begin
            DM1.Uniquery.Close;
            DM1.Uniquery.SQL.Text := FZW;
            try
              DM1.UniQuery.ExecSql;
            except
            end;
            if length(ImGrid.Cells[1, Y]) > 3  then 
              ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '/OK'
            else 
              ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '    -/OK';
          end else
          begin
            if Length(ImGrid.Cells[1, Y]) > 3 then 
              ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '/-'
            else 
              ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '    -/-';
          end;
        end;

        inc(c); 
        if c >= 100 then 
        begin 
          c := 0; 
          ImGrid.Row := Y; 
          Application.ProcessMessages; 
        end;

      end; // if length(FeldGrid.Cells[1,Y])>0 ...
    end; // for Y ...

  finally
    KatTab.Close;
    LastTime := GetTickCount - LastTime;

    P := LastTime / 60000; // jetzt Minuten

    Screen.Cursor := crDefault;

    MessageDlg(_('Import abgeschlossen !'), mtinformation, [mbok], 0);
  end;
end;          

//------------------------------------------------------------------------------
procedure TArtikelImportForm.PC1Change(Sender: TObject);
var 
  I, C, X, X2, Y: integer;
  HatKey    : Boolean;
  Found     : Boolean;
  SQLF, S, FNS: String;
  ZWF, Mode, FN: Integer;
  LocFeld   : String;
  LocData   : Variant;
  LocA      : Array of String;
  Found2    : Boolean;
  UpLPreis  : Boolean;
  UpArtikel : Boolean;
  HName, HID: Boolean;
  KName, KID: Boolean;
  T         : Array of Integer;

begin
  LocFeld := '';
  SetLength(LocA, 0);

  if PC1.ActivePage = TabSheet4 then
  begin
    try
      ImGrid.Visible := False;
      Screen.Cursor := crSqlWait;
      Application.ProcessMessages;

      if (length(KeyGrid.Cells[1, 7])>0)and(LiefID<1) then
      begin
        MessageDlg(_('Wenn dem Keyfeld LIEF_BESTNUM ein Wert ' +
                     'zugewiesen wird,' + #13#10 + 'dann muß auch ein Lieferant' +
                     ' ausgewählt werden !'), mterror, [mbok], 0);
        exit;
      end;

      // Hersteller-Felder
      HName := False;
      HID   := False;
      // Kategorie-Felder
      KName := False;
      KID   := False;

      UpLPreis := False; UpArtikel := False;
      for I := 1 to FeldGrid.RowCount-1 do
      begin
        if length(FeldGrid.Cells[1, I])>0 then
        begin
          if length(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y])>0 then
          begin
            if (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_BESTNUM') or
               (Uppercase(FeldGrid.Cells[0, I]) = 'LIEF_PREIS') then
            begin
              if LiefID < 1 then
              begin
                MessageDlg(_('Wenn Lieferantenpreise bzw. ' +
                             'Lieferantenbestellnummern zugewiesen ' +
                             'wurden,' + #13#10 +
                             'dann muß auch ein Lieferant ' +
                             'ausgewählt werden !'), mterror, [mbok], 0);
                exit;
              end;
              UpLPreis := True;
            end else
            begin
              if ((Uppercase(FeldGrid.Cells[0, I]) = 'VK1') and (VK1_FAKTOR <> 0)) or
                 ((Uppercase(FeldGrid.Cells[0, I]) = 'VK2') and (VK2_FAKTOR <> 0)) or
                 ((Uppercase(FeldGrid.Cells[0, I]) = 'VK3') and (VK3_FAKTOR <> 0)) or
                 ((Uppercase(FeldGrid.Cells[0, I]) = 'VK4') and (VK4_FAKTOR <> 0)) or
                 ((Uppercase(FeldGrid.Cells[0, I]) = 'VK5') and (VK5_FAKTOR <> 0)) then
              begin
                MessageDlg(_('Wenn Kalkulationsfaktoren im Setup ' +
                             'zugewiesen wurden,' + #13#10 +
                             'dann darf der jeweilige VK-Preis im Import ' +
                             'nicht ausgewählt werden !'), mterror, [mbok], 0);
                exit;
              end;

              if (Uppercase(FeldGrid.Cells[0, I]) = 'HERSTELLER_NAME') then HName := True;
              if (Uppercase(FeldGrid.Cells[0, I]) = 'HERSTELLER_ID')   then HID   := True;
              if (Uppercase(FeldGrid.Cells[0, I]) = 'KATEGORIE_ID')    then KID   := True;
              if (Uppercase(FeldGrid.Cells[0, I]) = 'KATEGORIE_NAME')  then KName := True;

              UpArtikel := True;
            end;
          end;
        end;
      end{for};

      if HName and HID then
      begin
        MessageDlg(_('Hersteller-Name und Hersteller-ID können' + #13#10 +
                     'nicht gleichzeitig zugewiesen werden'), mterror, [mbok], 0);
        exit;
      end;

      if KName and KID then
      begin
        MessageDlg(_('Kategorie-Name und Kategorie-ID können' + #13#10 +
                     'nicht gleichzeitig zugewiesen werden'), mterror, [mbok], 0);
        exit;
      end;

      pb1.position := 0;
      pb1.max := ITab.RowCount-1;
      ImGrid.RowCount := 2;
      ImGrid.ColCount := 2;
      ImGrid.Cells[1, 1] := '';

      //Tabelle kopieren
      ImGrid.RowCount := ITab.RowCount;
      //ImGrid.ColCount :=ITab.ColCount;

      {
      for x :=0 to ITab.ColCount-1 do
      for y :=0 to ITab.RowCount-1 do
      ImGrid.Cells[x,y] :=ITab.Cells[x,y];
      }

      // 1. Zeile für Import-Status einfügen
      ImGrid.InsertColumn (1);
      ImGrid.Cells[1, 0] := _('Import-Status');
      ImGrid.ColWidths[1] := 80;

      // Zielfeldnamen in das Grid schreiben
      // dabei ermitteln ob überhaupt Felder zugewiesen wurden

      setlength(T, 2);
      T[0] := 0;
      T[1] := -1;

      for x := 0 to LB1.Items.Count-1 do
      begin
        Found := False;
        for y := 1 to FeldGrid.RowCount-1 do
				begin  //10.10.09-ud.
          if LB1.Items[x] = FeldGrid.Cells[1, Y] then
          begin
            Found := True;
            Found2 := False;
            FNS := Copy(FeldGrid.Cells[1, Y], 6, length(FeldGrid.Cells[1, Y] ) - 6 + 1);
            FN := StrToIntDef(FNS, -1);
            if FN >= 0 then
            begin
              for x2 := 0 to length(t)-1 do
                if t[x2] = FN then
                begin 
                  Found2 := true; 
                  break; 
                end;

              if not Found2 then
              begin
                SetLength(T, length(T) + 1);
                T[length(T)-1] := FN;

                if ImGrid.ColCount<length(t) then 
                  ImGrid.ColCount := length(t);

                if length(t)-1 > 1 then 
                  ImGrid.Cells[length(T)-1, 0] := FeldGrid.Cells[0, Y];
              end;
            end;

            //ImGrid.Cells[x+2,0] :=FeldGrid.Cells[0,Y];
          end{if};
				end;	//10.10.09-ud.
        if not Found then 
          ImGrid.Cells[x + 2, 0] := '';
      end{for};

      for y := 1 to ITab.RowCount-1 do
      begin
        for x := 0 to length(T)-1 do
        begin
          if T[x] > -1 then 
            ImGrid.Cells[x, y] := ITab.Cells[T[x], y]
          else 
            ImGrid.Cells[x, y] := '';
        end;
      end;

      {
      // Spalten aus dem Grid löschen die im Import nicht verwendet wurde
      x :=2;
      repeat
          if x<ImGrid.ColCount then
          begin
          if ImGrid.Cells[X,0]='' then
          begin
          ImGrid.DeleteColumn(X);
          
          // Found :=True;
          Found :=x<ImGrid.ColCount;
          end
          else
          begin
          inc(X);
          Found :=False;
          end;
          end;
      until (x=ImGrid.ColCount)and(Not Found);
      }
      SetLength(T, 0);

      // Zunächst ermitteln ob Keyfelder verwendet wurden,
      // wenn nein, dann geht nur Neuanlage
      HatKey := False;
      for i := 1 to KeyGrid.RowCount-1 do
        if length(KeyGrid.Cells[1, i]) > 0 then 
          HatKey := True;

      if not HatKey then
      begin
        S := 'N/';
        if UpLPreis then 
          S := S + 'N' 
        else 
          S := S + '-';
        for i := 1 to ImGrid.RowCount-1 do 
          ImGrid.Cells[1, i] := S;
      end else
      begin
        Found := False;
        Mode := 0;
        //------------------------------------

        SQLF := 'SELECT COUNT(*) as ANZ, A.REC_ID';
        
        X := -1;
        for I := 1 to KeyGrid.RowCount-1 do
        begin
          if length(KeyGrid.Cells[1, I]) > 0 then
          begin
            if I < 7 then 
              Mode := 1
            else 
            if Mode = 1 then 
              Mode := 2 
            else 
              Mode := 3;

            if I = 7 then
            begin
              SQLF := SQLF + ', AP.BESTNUM';
              if length(LocFeld) > 0 then 
                LocFeld := LocFeld + ';';
              LocFeld := LocFeld + 'BESTNUM';
            end else
            begin
              SQLF := SQLF + ', ' + KeyGrid.Cells[0, I];
              if length(LocFeld) > 0 then 
                LocFeld := LocFeld + ';';
              LocFeld := LocFeld + KeyGrid.Cells[0, I];
            end;
            Inc(X);
          end;
        end{for};

        // Prüfen ob Warengruppe mit im SQL ist, wenn nein dann Warengruppe
        // hinzufügen, denn diese brauchen wir für die
        // Warengruppen-Kalkulationsfaktoren
        if Pos ('WARENGRUPPE', SQLF) = 0 then
        begin
          SQLF := SQLF + ', WARENGRUPPE';
        end;


        // Wenn Lieferantenpreise über Feld- oder Wertzuweisungen
        // gemacht wurden, dann die Query so erweitern das auch die
        // Lieferantenpreise mit drin stehen
        if (UpLPreis) and (Mode = 1) then 
          Mode := 2;

        LocData := VarArrayCreate ([0, X], varVariant);
          
        // 1 = SQL nur aus Artikeltabelle
        // 2 = SQL aus Artikel und Artikel-Preis Tabelle
        // 3 = SQL nur aus Preistabelle

        case Mode of
          1: begin
            SQLF := SQLF + ' from ARTIKEL A';
          end;
          2: begin
            SQLF := SQLF + ', AP.ADRESS_ID ' +
                           ' from ARTIKEL A left outer join ARTIKEL_PREIS AP' +
                           ' on AP.ARTIKEL_ID=A.REC_ID and AP.PREIS_TYP=5' +
                           ' and AP.ADRESS_ID=' + IntToStr(LiefID);
          end;
          3: begin
            SQLF := SQLF + ', AP.ADRESS_ID ' +
                           ' from ARTIKEL A left outer join ARTIKEL_PREIS AP' +
                           ' on AP.ARTIKEL_ID=A.REC_ID and AP.PREIS_TYP=5' +
                           ' and AP.ADRESS_ID=' + IntToStr(LiefID);
          end;
        end;

        SQLF := SQLF + ' group by A.REC_ID';

        DM1.UniQuery.Close;
        DM1.UniQuery.Sql.Text := SQLF;
        DM1.UniQuery.Open;

        // Alle Zeilen durchgehen und ermitteln ob Neuanlage oder Update
        // Wenn Update, das wird die ARTIKEL.REC_ID in der 1. Spalte als
        // Pointer abgelegt
        // Wenn Warengruppe, dann wird diese in der 2. Spalte als Pointer
        // abgelegt

        for Y := 1 to ImGrid.RowCount-1 do
        begin
          pb1.position := Y;
          inc (c); 
          if c >= 100 then 
          begin 
            c := 0; 
            Application.ProcessMessages; 
          end;
          //ImGrid.Row :=Y;

          SetLength(LocA, 0);

          for I := 1 to KeyGrid.RowCount-1 do
          begin
            if length(KeyGrid.Cells[1, I])>0 then
            begin
              SetLength(LocA, length(LocA) + 1);
              LocA[length(LocA)-1] := ITab.Cells[StrToInt(Copy (KeyGrid.Cells[1, I], 6, length(KeyGrid.Cells[1, I]) - 6 + 1)), Y];
            end;
          end;

          if length(LocA) = 1 then
          begin
            LocData := LocA[0];
          end else
          begin
            LocData := VarArrayCreate ([0, length(LocA)-1], varVariant);
            for i := 0 to length(LocA)-1 do 
              LocData[i] := LocA[i];
          end;

          try
            if (DM1.UniQuery.Locate(LocFeld, LocData, [loCaseInsensitive])) and
               (DM1.UniQuery.FieldByName('ANZ').AsInteger = 1) then
            begin
              if UpArtikel then 
                ImGrid.Cells[1, Y] := 'U/'
              else 
                ImGrid.Cells[1, Y] := '-/';

              ImGrid.Objects[0, Y] := Pointer(Integer(DM1.UniQuery.FieldByName('REC_ID').AsInteger));
              ImGrid.Objects[1, Y] := Pointer(Integer(DM1.UniQuery.FieldByName('WARENGRUPPE').AsInteger));

              if UpLPreis then
              begin
                if DM1.UniQuery.FieldByName('ADRESS_ID').AsInteger = LiefID then 
                  ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + 'U'
                else 
                  ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + 'N';
              end else 
                ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '-';
            end else
            begin
              ImGrid.Cells[1, Y] := 'N/';
              ImGrid.Objects[0, Y] := Pointer(Integer(-1)); //REC_ID
              ImGrid.Objects[1, Y] := Pointer(Integer(-1)); //WGR
              if UpLPreis then 
                ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + 'N'
              else 
                ImGrid.Cells[1, Y] := ImGrid.Cells[1, Y] + '-';
								
              if (not UpArtikel) and (UpLPreis) then 
                ImGrid.Cells[1, Y] := '-/- Fehler 1';
            end;
          except
            ImGrid.Cells[1, Y] := '-/-';
            ImGrid.Objects[0, Y] := Pointer(Integer(-1)); //REC_ID
            ImGrid.Objects[1, Y] := Pointer(Integer(-1)); //WGR
          end;
        end;
        DM1.UniQuery.Close;
      end;

      // Anzahl der zugewiesenen Felder ermitteln
      ZWF := 0;
      for i := 1 to FeldGrid.RowCount-1 do
        if length(FeldGrid.Cells[1, i]) > 0 then 
          inc(ZWF);
    finally
      Screen.Cursor := crDefault;
      ImGrid.Visible := True;
      UpdateBtn.Enabled := (ImGrid.ColCount > 2) and (ImGrid.RowCount > 2) and (ZWF > 0);
    end;
  end else
  begin
    UpdateBtn.Enabled := False;

    if PC1.ActivePage = TabSheet6 then 
      ITab.Top := 106 
    else 
      ITab.Top := 4;

    if (PC1.ActivePage = TabSheet1) or (PC1.ActivePage = TabSheet3) or
       (PC1.ActivePage = TabSheet6) or (PC1.ActivePage = TabSheet5) then 
    begin
      ITab.Parent := PC1.ActivePage;
    end;
  end;
end;
  
//------------------------------------------------------------------------------
procedure TArtikelImportForm.WertGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := not ((ACol = 0) or (ARow = 0));
end;
//------------------------------------------------------------------------------
procedure TArtikelImportForm.SpeedButton3Click(Sender: TObject);
begin
  if (LB4.Itemindex > -1) then 
    KeyGrid.Cells[1, KeyGrid.Row] := LB4.Items[LB4.Itemindex];
end;
//------------------------------------------------------------------------------
procedure TArtikelImportForm.SpeedButton4Click(Sender: TObject);
begin
  if (KeyGrid.Row > 0) then 
    KeyGrid.Cells[1, KeyGrid.Row] := '';
end;
//------------------------------------------------------------------------------
procedure TArtikelImportForm.KuNrEditButtonClick(Sender: TObject);
var 
  LIStr: String;
begin
  if not assigned(MainForm.AddrForm) then
  begin
    MainForm.AddrForm := TAdressForm.Create (MainForm);
    with MainForm.AddrForm do
    begin
      BorderStyle := bsSizeable;
      Height      := 500;
      Width       := 620;
      Left        := MainForm.Left + 160;
      Top         := MainForm.Top + 10;
      UebernahmeBtn.Visible := True;
      uebernehmen1.Visible := True;
      Button1.Cancel := True;
      Invalidate;
    end;
  end;
  MainForm.AddrForm.ShowModal;
  if MainForm.AddrForm.Uebern then
  begin // Adreese überbnehmen
    LiefID         := MainForm.AddrForm.KSQueryRec_ID.Value;
    KuNrEdit.Text  := MainForm.AddrForm.KSQueryKunNum2.AsString;

    MainForm.AddrForm.Uebern := False;
    MainForm.AddrForm.FormDeactivate (Sender);

    if LiefID > 0 then 
      DM1.GetLieferant (LiefID, LiStr)
    else 
      LiStr := '';

    LiefIDLabel.Caption := _('Lieferanten-ID') + ' : ' + IntToStr(LiefID) + '-' + LiStr;
  end;
end;  

//------------------------------------------------------------------------------
function TArtikelImportForm.CreateProfile: String;
var 
  I    : Integer;
  Dat  : String;
  Sl   : tStringList;
begin
  Dat := FileEdit.Text;
  if (length(Dat) > 0) and (dat[1] = '"') then 
    delete(dat, 1, 1);
  if (length(Dat) > 0) and (dat[length(dat)] = '"') then 
    delete(dat, length(dat), 1);

  SL := tStringList.Create;
  try
    SL.Add ('FILE=' + Dat);
    SL.Add ('DELIM=' + Delim);
    SL.Add ('HOCHKOMMA=' + IntToStr(Ord(HKTextCB.Checked)));
    //SL.Add ('WGR='+InttoStr(Warengruppe));
    SL.Add ('LIEF=' + IntToStr(LiefID));
    SL.Add ('ZEILEN_UEBERSPRINGEN=' + IntToStr(LineIgnoreEdit.Value));

    for i := 1 to FeldGrid.RowCount-1 do
    begin
      if length(FeldGrid.Cells[1, i]) > 0 then
      begin
        SL.Add ('Z_' + FeldGrid.Cells[0, i] + '=' + FeldGrid.Cells[1, i]);
      end;
    end;

    for i := 1 to WertGrid.RowCount-1 do
    begin
      if length(WertGrid.Cells[1, i]) > 0 then
      begin
        SL.Add ('W_' + WertGrid.Cells[0, i] + '=' + WertGrid.Cells[1, i]);
      end;
    end;

    for i := 1 to KeyGrid.RowCount-1 do
    begin
      if length(KeyGrid.Cells[1, i]) > 0 then
      begin
        SL.Add ('K_' + KeyGrid.Cells[0, i] + '=' + KeyGrid.Cells[1, i]);
      end;
    end;

    Result := SL.CommaText;
  finally
    SL.Free;
  end;
end;                                  

//------------------------------------------------------------------------------
procedure TArtikelImportForm.LoadProfile (P: String);
var 
  SL       : tStringList;
  I, J      : Integer;
  Key, Val, S: String;
  LiStr    : String;
begin
  SL := tStringList.Create;
  try
    LiefID := -1;
    LiefIDLabel.Caption := _('Lieferanten-ID') + ' : ' + IntToStr(LiefID);

    SL.CommaText := P;

    if SL.Count = 0 then exit;

    for i := 0 to SL.Count-1 do
    begin
      S := SL[i];

      if Pos('=', S) > 0 then
      begin
        Key := Copy (S, 1, Pos('=', S)-1);
        Val := S;
        Delete (Val, 1, Pos('=', Val));

        if Key = 'FILE' then
        begin
          FileEdit.Text := Val;
          FileEditChange (Self);
        end else
        if Key = 'HOCHKOMMA' then
        begin
          HKTextCB.Checked := Val = '1';
        end else
        if Key = 'DELIM' then
        begin
          case VAL[1] of
            #9: DelimCB.ItemIndex := 0;
            ',': DelimCB.ItemIndex := 1;
            ';': DelimCB.ItemIndex := 2;
          end;
          Delim := Val;
          FileEditChange (Self);
        end else
        if Key = 'ZEILEN_UEBERSPRINGEN' then
        begin
          LineIgnoreEdit.Value := StrToIntDef(Val, 0);
          FileEditChange (Self);
        end else
        //if Key='WGR' then
        //begin
        //   if length(Val)>0 then Warengruppe :=StrToInt(Val);
        //end
        //   else
        if Key = 'LIEF' then
        begin
          if length(Val) > 0 then
          begin
            LiefID := StrToInt(Val);

            if LiefID > 0 then 
              DM1.GetLieferant(LiefID, LiStr)
            else 
              LiStr := '';
            LiefIDLabel.Caption := _('Lieferanten-ID') + ' : ' + IntToStr(LiefID) + '-' + LiStr;
          end;
        end else
        if Pos('Z_', Key) = 1 then
        begin
          Delete (Key, 1, 2);
          for j := 1 to FeldGrid.RowCount-1 do
            if FeldGrid.Cells[0, j] = Key then FeldGrid.Cells[1, j] := Val;
        end else
        if Pos('W_', Key) = 1 then
        begin
          Delete (Key, 1, 2);
          for j := 1 to WertGrid.RowCount-1 do
            if WertGrid.Cells[0, j] = Key then 
              WertGrid.Cells[1, j] := Val;
        end else
        if Pos('K_', Key) = 1 then
        begin
          Delete(Key, 1, 2);
          for j := 1 to KeyGrid.RowCount-1 do
            if KeyGrid.Cells[0, j] = Key then 
              KeyGrid.Cells[1, j] := Val;
        end;
      end;
    end;

  //WGRLabel.Caption :='Warengruppe : '+Inttostr(Warengruppe);
  finally
    SL.Free;
  end;
end;
  
//------------------------------------------------------------------------------
procedure TArtikelImportForm.ProfSaveBtnClick(Sender: TObject);
begin
  DM1.WriteLongString('MAIN\IMPORT\ARTIKEL', ProfileEdit.Text, CreateProfile);
  ProfTab.Refresh;
end;

//------------------------------------------------------------------------------
procedure TArtikelImportForm.ProfLoadBtnClick(Sender: TObject);
begin
  if length(ProfTabNAME.AsString) = 0 then 
    exit;

  LoadProfile(DM1.ReadLongString('MAIN\IMPORT\ARTIKEL', ProfTabNAME.AsString, ''));

  ProfileEdit.Text := ProfTabNAME.AsString;
end;                                                   

//------------------------------------------------------------------------------
procedure TArtikelImportForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  ProfTab.Close;
end;

//------------------------------------------------------------------------------
procedure TArtikelImportForm.ProfileEditChange(Sender: TObject);
begin
  ProfSaveBtn.Enabled := length(ProfileEdit.Text) > 0;
end;

//------------------------------------------------------------------------------
procedure TArtikelImportForm.ProfTabBeforePost(DataSet: TDataSet);
begin
  ProfTabMAINKEY.AsString := 'MAIN\IMPORT\ARTIKEL';
end;                                                

//------------------------------------------------------------------------------

end.
