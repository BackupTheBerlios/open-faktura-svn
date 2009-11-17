{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Adressen-Import aus Textdatei (csv) importieren                   }
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

unit OF_Adressen_Import;

interface

{$I OF.INC}

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ComCtrls, SortGrid, Grids, Buttons, DBGrids, Spin, Mask,
  JvExMask, JvToolEdit, ExtCtrls;

type
  TKundenImportForm = class(TForm)
    Panel1: TPanel;
    UpdateBtn: TBitBtn;
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
    Sg2: TSortGrid;
    TabSheet5: TTabSheet;
    Label4: TLabel;
    LB4: TListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    KeyGrid: TStringGrid;
    Label5: TLabel;
    WertGrid: TStringGrid;
    Label6: TLabel;
    KunQuery: TZQuery;
    TabSheet6: TTabSheet;
    Label1: TLabel;
    FileEdit: TJvFilenameEdit;
    KGRLabel: TLabel;
    pb1: TProgressBar;
    KunQueryMATCHCODE: TStringField;
    KunQueryKUNDENGRUPPE: TIntegerField;
    KunQueryKUNNUM2: TStringField;
    KunQueryNAME1: TStringField;
    KunQueryPLZ: TStringField;
    KunQueryORT: TStringField;
    KunQueryLAND: TStringField;
    KunQueryNAME2: TStringField;
    KunQueryNAME3: TStringField;
    KunQueryABTEILUNG: TStringField;
    KunQueryANREDE: TStringField;
    KunQuerySTRASSE: TStringField;
    KunQueryPOSTFACH: TStringField;
    KunQueryPF_PLZ: TStringField;
    KunQueryGRUPPE: TStringField;
    KunQueryTELE1: TStringField;
    KunQueryTELE2: TStringField;
    KunQueryFAX: TStringField;
    KunQueryFUNK: TStringField;
    KunQueryEMAIL: TStringField;
    KunQueryINTERNET: TStringField;
    KunQueryDIVERSES: TStringField;
    KunQueryBRIEFANREDE: TStringField;
    KunQueryBLZ: TStringField;
    KunQueryKTO: TStringField;
    KunQueryBANK: TStringField;
    KunQueryDEB_NUM: TIntegerField;
    KunQueryKRD_NUM: TIntegerField;
    KunQueryUST_NUM: TStringField;
    KunQuerySHOP_ID: TIntegerField;
    KunQuerySHOP_KUNDE_ID: TIntegerField;
    KunQueryKUNNUM1: TStringField;
    Label9: TLabel;
    DelimCB: TComboBox;
    LineIgnoreEdit: TSpinEdit;
    Label10: TLabel;
    KunQueryEMAIL2: TStringField;
    KunQueryIBAN: TStringField;
    KunQuerySWIFT: TStringField;
    KunQueryKTO_INHABER: TStringField;
    KunQueryPROVIS_PROZ: TFloatField;
    KunQueryKUN_SEIT: TDateField;
    KunQueryKUN_GEBDATUM: TDateField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    ProfGrid: TDBGrid;
    ProfLoadBtn: TButton;
    ProfSaveBtn: TButton;
    ProfileEdit: TEdit;
    ProfTab: TZQuery;
    ProfTabMAINKEY: TStringField;
    ProfTabNAME: TStringField;
    ProfTabVAL_BLOB: TMemoField;
    ProfTabLAST_CHANGE: TDateTimeField;
    ProfDS: TDataSource;
    ITab: TSortGrid;
    Label8: TLabel;
    Animate1: TAnimate;
    KunQueryVERTRETER_ID: TIntegerField;
    KunQueryINFO: TMemoField;
    KunQueryGRABATT: TFloatField;
    KunQueryKUN_KRDLIMIT: TFloatField;
    KunQueryPR_EBENE: TIntegerField;
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
    procedure FormCreate(Sender: TObject);
    procedure ProfSaveBtnClick(Sender: TObject);
    procedure ProfLoadBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ProfileEditChange(Sender: TObject);
    procedure ProfTabBeforePost(DataSet: TDataSet);
  private
    { Private-Deklarationen }
    Delim      : String;
    
    function CreateProfile: String;
    procedure LoadProfile (P: String);
  public
    { Public-Deklarationen }
    KundenGruppe: Integer;
  end;

implementation

uses
  gnugettext,
  OF_Main, OF_DM, OF_Tool1, OF_Function,
  OF_Kunde;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TKundenImportForm.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except 
  end;

  PC1.ActivePage := PC1.Pages[0];
  Delim := #9;
  DelimCB.ItemIndex := 0;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.FileEditChange(Sender: TObject);
var 
  Dat, S, S1   : String;
  SCount     : Integer;
  ZCount     : Integer;
  TxT        : TextFile;
  P, P1      : PChar;
  NewDelim   : String;
  Zeile, Err, I: Integer;
begin
  case DelimCB.ItemIndex of
    0: NewDelim := #9;
    1: NewDelim := ',';
    2: NewDelim := ';';
  end;
  Delim := NewDelim;

  Dat := FileEdit.Text;
  if (length(Dat) > 0) and (dat[1] = '"') then 
    delete(dat, 1, 1);
  if (length(Dat) > 0) and (dat[length(dat)] = '"') then 
    delete(dat, length(dat), 1);
  LB1.Items.Clear;
  if not fileexists (dat) then
  begin
    UpdateBtn.Enabled := False;
    exit;
  end;

  ZCount := 0;
  ITab.RowCount := 2;

  Screen.Cursor := crHourGlass;

  ZCount := 0;
  Zeile  := 0;
  ITab.RowCount := 2;
  ITab.ColCount := 2;

  AssignFile (Txt, Dat);
  {$I-}
  Reset (txt);
  Err := IOResult;
  {$I+}
  if err = 0 then
  begin
    try
      // Textdatei Zeilenweise einlesen
      while not Eof(Txt) do
      begin
        Readln (txt, S);
        if (length(S) = 0) then 
          Continue; // leerzeilen Ignorieren

        SCount := 0;
        inc(Zeile);
        if (Zeile <= LineIgnoreEdit.Value) then 
          Continue;

        inc(ZCount); // Zeilen-Counter erhöhen

        if ITab.RowCount<ZCount + 1 then 
          ITab.RowCount := ZCount + 1; // Stringgrid um eine Zeile erweitern

        P := PChar(S);
        while P^ <> #0 do
        begin
          if P^ = '"' then
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
          ITab.Cells[SCount, ZCount] := S1;

          if P^ = Delim then P := CharNext(P);
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
      LB1.Items.Add(ITab.Cells[i, 0]);
    for i := 1 to ITab.ColCount-1 do 
      LB4.Items.Add(ITab.Cells[i, 0]);
  end else 
    MessageDlg(GetWinErrorStr(Err), mterror, [mbok], 0);
  Screen.Cursor := crDefault;
end; 

//------------------------------------------------------------------------------
procedure TKundenImportForm.SpeedButton1Click(Sender: TObject);
begin
  if (LB1.Itemindex > -1) then 
    FeldGrid.Cells[1, FeldGrid.Row] := LB1.Items[LB1.Itemindex];
end;
//------------------------------------------------------------------------------
procedure TKundenImportForm.SpeedButton2Click(Sender: TObject);
begin
  if (LB1.Itemindex > -1) then
    FeldGrid.Cells[1, FeldGrid.Row] := '';
end;
//------------------------------------------------------------------------------
procedure TKundenImportForm.UpdateBtnClick(Sender: TObject);
var 
  I, C, Y   : Integer;
  SQL, SQLW: String;
begin
  pb1.position := 0;
  pb1.max := ITab.RowCount-1;
  UpdateBtn.Enabled := False;
  C := 0;
  try
    for Y := 1 to SG2.RowCount-1 do
    begin
      pb1.position := Y;
      SQL := '';

      //Wertzuweisungen
      for I := 1 to WertGrid.RowCount-1 do
      begin
        if length(WertGrid.Cells[1, I]) > 0 then
        begin
          if length(SQL) > 0 then 
            SQL := SQL + ',';
          SQL := SQL + WertGrid.Cells[0, I] + '=''';
          SQL := SQL + sqlStringToSql(WertGrid.Cells[1, I]);
          SQL := SQL + '''';
        end;
      end;

      // Feldzuweisungen
      for I := 1 to FeldGrid.RowCount-1 do
      begin
        if length(FeldGrid.Cells[1, I])>0 then
        begin
          if length(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]) > 0 then
          begin
            if length(SQL) > 0 then 
              SQL := SQL + ',';
            SQL := SQL + FeldGrid.Cells[0, I] + '=''';
            SQL := SQL + sqlStringToSql(ITab.Cells[StrToInt(Copy (FeldGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y]);
            SQL := SQL + '''';
          end;
        end;
      end;

      if (length(SQL) > 0) and (POS('KUNDENGRUPPE', uppercase(sql)) = 0) then 
        SQL := SQL + ', KUNDENGRUPPE=' + IntToStr(KundenGruppe);


      if SG2.Cells[1, Y] = 'N' then
      begin
        if length(sql) > 0 then
        begin
          if (length(SQL) > 0) and (POS('WAEHRUNG', uppercase(sql)) = 0) then 
            SQL := SQL + ', WAEHRUNG=' + '''' + DM1.LeitWaehrung + '''';


          SQL := SQL + ', ERSTELLT=NOW(), GEAEND=NOW(), ERST_NAME="IMPORT ' + sqlStringToSql(DM1.View_User) + '"';

          KunQuery.Close;
          KunQuery.SQL.Text := 'INSERT INTO ADRESSEN SET ' + SQL;

          KunQuery.ExecSql;
          KunQuery.Close;
          SG2.Cells[1, Y] := SG2.Cells[1, Y] + '    OK';
        end;
      end else
      if SG2.Cells[1, Y] = 'U' then
      begin
        KunQuery.Close;
        KunQuery.SQL.Text := 'update ADRESSEN SET ' + SQL +
                             ' where REC_ID=' +
        IntToStr(Integer(SG2.Objects[0, Y]));
        KunQuery.ExecSql;
        KunQuery.Close;
        SG2.Cells[1, Y] := SG2.Cells[1, Y] + '    OK';
      end;

      inc(c);
      if c >= 100 then
      begin
        c := 0; 
        SG2.Row := Y;
        Application.ProcessMessages;
      end;
    end; // for y
  finally
    Screen.Cursor := crDefault;
    MessageDlg (_('Import abgeschlossen !'), mtinformation, [mbok], 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.FormShow(Sender: TObject);
var 
  i: integer;
begin
  FileEdit.InitialDir := DM1.ImportDir;

  ProfileEdit.Text := '';
  ProfSaveBtn.Enabled := False;
  ProfTab.Open;
  PC1.ActivePage := PC1.Pages[0];
  PC1Change(Sender);

  //TV1.Items.Assign (Form1.TV1.Items);
  UpdateBtn.Enabled := False;
  FeldGrid.Cells[0, 0] := _('Ziel-Feld');
  FeldGrid.Cells[1, 0] := _('Import-Feld');
  LB1.Items.Clear;
  with KunQuery do
  begin
    if Fields.Count>0 then
    begin
      FeldGrid.RowCount := Fields.Count + 1;
      for i := 0 to Fields.Count-1 do
        FeldGrid.Cells[0, I + 1] := Fields[i].FieldName;
    end;
  end;

  WertGrid.Cells[0, 0] := _('Ziel-Feld');
  WertGrid.Cells[1, 0] := _('Wert');
  with KunQuery do
  begin
    if Fields.Count > 0 then
    begin
      WertGrid.RowCount := Fields.Count + 1;
      for i := 0 to Fields.Count-1 do
        WertGrid.Cells[0, I + 1] := Fields[i].FieldName;
    end;
  end;

  KeyGrid.RowCount := 7;
  KeyGrid.Cells[0, 0] := _('Key-Feld');
  KeyGrid.Cells[1, 0] := _('Import-Feld');
  KeyGrid.Cells[0, 1] := 'KUNDENGRUPPE';
  KeyGrid.Cells[0, 2] := 'MATCHCODE';
  KeyGrid.Cells[0, 3] := 'KUNNUM1';
  KeyGrid.Cells[0, 4] := 'NAME1';
  KeyGrid.Cells[0, 5] := 'DEB_NUM';
  KeyGrid.Cells[0, 6] := 'KRD_NUM';
  LB4.Items.Clear;

  Kundengruppe := AdressForm.KSQueryKUNDENGRUPPE.AsInteger;
  if Kundengruppe < 1 then 
    Kundengruppe := 1;
  KGRLabel.Caption := _('Default-Kundengruppe') + ' : ' + Inttostr(Kundengruppe);
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.PC1Change(Sender: TObject);
var 
  I, C, X, Y  : Integer;
  HatKey   : Boolean;
  Found    : Boolean;
  SQLW, SQLF: String;
  ZWF      : Integer;
  LocA     : Array of String;
  LocFeld  : String;
  LocData  : Variant;
begin
  if PC1.ActivePage = TabSheet4 then
  begin
    try
      SG2.Visible := False;
      Animate1.Visible := True;
      Animate1.Active := True;
      Screen.Cursor := crSqlWait;
      Application.ProcessMessages;

      pb1.position := 0;
      pb1.max := ITab.RowCount-1;
      SG2.RowCount := 2;
      SG2.ColCount := 2;
      SG2.Cells[1, 1] := '';

      //Tabelle kopieren
      SG2.RowCount := ITab.RowCount;
      SG2.ColCount := ITab.ColCount;
      for x := 0 to ITab.ColCount-1 do
        for y := 0 to ITab.RowCount-1 do
          SG2.Cells[x, y] := ITab.Cells[x, y];

      // 1. Zeile für Import-Status einfügen
      SG2.InsertColumn (1);
      SG2.Cells[1, 0] := _('Import-Status');
      SG2.ColWidths[1] := 80;

      // Zielfeldnamen in das Grid schreiben
      // dabei ermitteln ob überhaupt Felder zugewiesen wurden
      for x := 0 to LB1.Items.Count-1 do
      begin
        Found := False;
        for y := 1 to FeldGrid.RowCount-1 do
          if LB1.Items[x] = FeldGrid.Cells[1, Y] then
          begin
            Found := True;
            SG2.Cells[x + 2, 0] := FeldGrid.Cells[0, Y];
          end;
        if not Found then 
          SG2.Cells[x + 2, 0] := '';
      end;

      // Spalten aus dem Grid löschen die im Import nicht verwendet wurde
      x := 2;
      repeat
        if x < SG2.ColCount then
        begin
          if SG2.Cells[X, 0] = '' then
          begin
            SG2.DeleteColumn(X);
            Found := x<SG2.ColCount;
          end else
          begin
            inc(X);
            Found := False;
          end;
        end;
      until (x = SG2.ColCount) and (Not Found);

      // Zunächst ermitteln ob Keyfelder verwendet wurden,
      // wenn nein, dann geht nur Neuanlage
      HatKey := False;
      for i := 1 to KeyGrid.RowCount-1 do
        if length(KeyGrid.Cells[1, i]) > 0 then 
          HatKey := True;

      if not HatKey then
      begin
        for i := 1 to SG2.RowCount-1 do 
          SG2.Cells[1, i] := 'N';
      end else
      begin
        Found := False;
        SQLF := 'SELECT COUNT(*) as ANZ, A.REC_ID';

        X := -1;

        for I := 1 to KeyGrid.RowCount-1 do
        begin
          if length(KeyGrid.Cells[1, I]) > 0 then
          begin
            SQLF := SQLF + ', ' + KeyGrid.Cells[0, I];
            if length(LocFeld) > 0 then 
              LocFeld := LocFeld + ';';
            LocFeld := LocFeld + KeyGrid.Cells[0, I];
            Inc(X);
          end;
        end;

        // Prüfen ob Kundengruppe mit im SQL ist, wenn nein dann Kundengruppe
        // hinzufügen
        if Pos ('KUNDENGRUPPE', SQLF) = 0 then
        begin
          SQLF := SQLF + ', KUNDENGRUPPE';
        end;

        SQLF := SQLF + ' from ADRESSEN A';
        SQLF := SQLF + ' group by A.REC_ID';
        
        DM1.UniQuery.Close;
        DM1.UniQuery.Sql.Text := SQLF;
        DM1.UniQuery.Open;
        
        // Alle Zeilen durchgehen und ermitteln ob Neuanlage oder Update
        // Wenn Update, das wird die ARTIKEL.REC_ID in der 1. Spalte als
        // Pointer abgelegt
        // Wenn Warengruppe, dann wird diese in der 2. Spalte als Pointer
        // abgelegt

        for Y := 1 to SG2.RowCount-1 do
        begin
          pb1.position := Y;
          inc (c); 
          if c >= 100 then 
          begin 
            c := 0; 
            Application.ProcessMessages; 
          end;

          SetLength(LocA, 0);

          for I := 1 to KeyGrid.RowCount-1 do
          begin
            if length(KeyGrid.Cells[1, I]) > 0 then
            begin
              SetLength(LocA, length(LocA) + 1);
              LocA[length(LocA)-1] := ITab.Cells[StrToInt(Copy (KeyGrid.Cells[1, I], 6, length(FeldGrid.Cells[1, I]) - 6 + 1)), Y];
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
              SG2.Cells[1, Y] := 'U';
              SG2.Objects[0, Y] := Pointer(Integer(DM1.UniQuery.FieldByName('REC_ID').AsInteger));
              SG2.Objects[1, Y] := Pointer(Integer(DM1.UniQuery.FieldByName('KUNDENGRUPPE').AsInteger));
            end  else
            begin
              SG2.Cells[1, Y] := 'N';
              SG2.Objects[0, Y] := Pointer(Integer(-1)); //REC_ID
              SG2.Objects[1, Y] := Pointer(Integer(-1)); //KGR
            end;
          except
            SG2.Cells[1, Y] := '-/-';
            SG2.Objects[0, Y] := Pointer(Integer(-1)); //REC_ID
            SG2.Objects[1, Y] := Pointer(Integer(-1)); //KGR
          end;
        end;
        DM1.Uniquery.Close;
      end;

      // Anzahl der zugewiesenen Felder ermitteln
      ZWF := 0;
      for i := 1 to FeldGrid.RowCount-1 do
        if length(FeldGrid.Cells[1, i]) > 0 then 
          inc(ZWF);

    finally
      Screen.Cursor := crDefault;
      Animate1.Visible := False;
      Animate1.Active := False ;
      SG2.Visible := True;
      UpdateBtn.Enabled := (SG2.ColCount > 2) and (SG2.RowCount > 2) and (ZWF > 0);
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
procedure TKundenImportForm.WertGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := not ((ACol = 0)or(ARow = 0));
end;                                                                  

//------------------------------------------------------------------------------
procedure TKundenImportForm.SpeedButton3Click(Sender: TObject);
begin
  if (LB4.Itemindex > -1) then 
    KeyGrid.Cells[1, KeyGrid.Row] := LB4.Items[LB4.Itemindex];
end;                            

//------------------------------------------------------------------------------
procedure TKundenImportForm.SpeedButton4Click(Sender: TObject);
begin
  if (LB4.Itemindex > -1) then 
    KeyGrid.Cells[1, KeyGrid.Row] := '';
end;

//------------------------------------------------------------------------------
function TKundenImportForm.CreateProfile: String;
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
    SL.Add('FILE=' + Dat);
    SL.Add('DELIM=' + Delim);
    SL.Add('ZEILEN_UEBERSPRINGEN=' + IntToStr(LineIgnoreEdit.Value));

    for i := 1 to FeldGrid.RowCount-1 do
    begin
      if length(FeldGrid.Cells[1, i]) > 0 then
      begin
        SL.Add('Z_' + FeldGrid.Cells[0, i] + '=' + FeldGrid.Cells[1, i]);
      end;
    end;

    for i := 1 to WertGrid.RowCount-1 do
    begin
      if length(WertGrid.Cells[1, i]) > 0 then
      begin
        SL.Add('W_' + WertGrid.Cells[0, i] + '=' + WertGrid.Cells[1, i]);
      end;
    end;

    for i := 1 to KeyGrid.RowCount-1 do
    begin
      if length(KeyGrid.Cells[1, i]) > 0 then
      begin
        SL.Add('K_' + KeyGrid.Cells[0, i] + '=' + KeyGrid.Cells[1, i]);
      end;
    end;

    Result := SL.CommaText;
  finally
    SL.Free;
  end;
end;          

//------------------------------------------------------------------------------
procedure TKundenImportForm.LoadProfile (P: String);
var 
  SL : tStringList;
  I, J : Integer;
  Key, Val, S: String;
  LiStr : String;
begin
  SL := tStringList.Create;
  try
    SL.CommaText := P;

    if SL.Count = 0 then 
      exit;

    For i := 0 to SL.Count-1 do
    begin
      S := SL[i];

      if Pos('=', S) > 0 then
      begin
        Key := Copy(S, 1, Pos('=', S)-1);
        Val := S;
        Delete(Val, 1, Pos('=', Val));

        if Key = 'FILE' then
        begin
          FileEdit.Text := Val;
          FileEditChange(Self);
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
        if Pos('Z_', Key) = 1 then
        begin
          Delete(Key, 1, 2);
          for j := 1 to FeldGrid.RowCount-1 do
            if FeldGrid.Cells[0, j] = Key then 
              FeldGrid.Cells[1, j] := Val;
        end else
        if Pos('W_', Key) = 1 then
        begin
          Delete(Key, 1, 2);
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

  finally
    SL.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.ProfSaveBtnClick(Sender: TObject);
begin
  DM1.WriteLongString('MAIN\IMPORT\ADRESSEN', ProfileEdit.Text, CreateProfile);
  ProfTab.Refresh;
end;                 

//------------------------------------------------------------------------------
procedure TKundenImportForm.ProfLoadBtnClick(Sender: TObject);
begin
  if length(ProfTabNAME.AsString) = 0 then 
    exit;

  LoadProfile(DM1.ReadLongString ('MAIN\IMPORT\ADRESSEN', ProfTabNAME.AsString, ''));

  ProfileEdit.Text := ProfTabNAME.AsString;
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.FormCloseQuery(Sender: TObject;
var 
  CanClose: Boolean);
begin
  ProfTab.Close;
end;

//------------------------------------------------------------------------------
procedure TKundenImportForm.ProfileEditChange(Sender: TObject);
begin
  ProfSaveBtn.Enabled := length(ProfileEdit.Text) > 0;
end;                                                

//------------------------------------------------------------------------------
procedure TKundenImportForm.ProfTabBeforePost(DataSet: TDataSet);
begin
  ProfTabMAINKEY.AsString := 'MAIN\IMPORT\ADRESSEN';
end;
//------------------------------------------------------------------------------

end.

