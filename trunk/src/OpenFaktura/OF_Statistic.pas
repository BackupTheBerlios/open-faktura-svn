{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Grundmodul, welches alle anderen Module in die Oberfläche einbindet }
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
{ 13.01.2003 - Version 1.2 RC3 released Jan Pokrandt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_Statistic;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls,
  TeEngine, Series, TeeProcs, Chart, DbChart, StdCtrls, Buttons, ExtCtrls;

type
  TStatisticForm = class(TForm)
    MainPanel: TPanel;
    Panel1: TPanel;
    Query1: TZQuery;
    DBChart1: TDBChart;
    ComboBox1: TComboBox;
    ZVon: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ZBis: TDateTimePicker;
    RefreshBtn: TSpeedButton;
    StatusBar1: TStatusBar;
    PrintBtn: TSpeedButton;
    PrintDialog1: TPrintDialog;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ZBisChange(Sender: TObject);
    procedure ZVonChange(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private-Deklarationen }
    First: Boolean;
    
    
  public
    { Public-Deklarationen }
  end;
    
    //var TStatisticForm: TTStatisticForm;
    
implementation

{$R *.DFM}

uses
  printers, GNUGetText,
  OF_DM;
  
//------------------------------------------------------------------------------
procedure TStatisticForm.FormCreate(Sender: TObject);
var 
  Ja, Mo, Ta: Word;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  First := True;
  DecodeDate (Now, Ja, Mo, Ta);
  ZVon.Date := EncodeDate (Ja, 1, 1);
  ZBis.Date := EncodeDate (ja, 12, 31);
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.FormActivate(Sender: TObject);
begin
  if (First) then
  begin
    ZVon.Date           := DM1.ReadIntegerU('', 'STATISTIK_START', Round(Int(ZVon.Date)));
    ZBis.Date           := DM1.ReadIntegerU('', 'STATISTIK_ENDE', Round(Int(ZBis.Date)));
    ComboBox1.ItemIndex := DM1.ReadIntegerU('', 'STATISTIK_CHART', 0);
    First := False;
  end;
  ComboBox1Change(Self);
  Combobox1.Setfocus;
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.FormDeactivate(Sender: TObject);
begin
  Query1.Close;

  DM1.WriteIntegerU('', 'STATISTIK_START', Round(Int(ZVon.Date)));
  DM1.WriteIntegerU('', 'STATISTIK_ENDE', Round(Int(ZBis.Date)));
  DM1.WriteIntegerU('', 'STATISTIK_CHART', ComboBox1.ItemIndex);
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.ComboBox1Change(Sender: TObject);
var 
  i: integer;
  PieSerie: tPieSeries;
  BarSerie: tBarSeries;
begin
  if First then exit;

  while DBChart1.SeriesCount > 0 do 
    DBChart1.Series[0].Free;

  Query1.Close;

  case ComboBox1.ItemIndex of
    0: begin
      Query1.Sql.Text :=
        'select' +
        ' A.WARENGRUPPE, W.NAME, SUM(JP.MENGE) as MENGE_GES,' +
        ' round(' +
        '   sum(' +
        '    if' +
        ' (J.BRUTTO_FLAG,' +
        '     ((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE),' +
        '     ((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE)/' +
        '       case' +
        '        when JP.STEUER_CODE=0 then 1+J.MWST_0/100' +
        '        when JP.STEUER_CODE=1 then 1+J.MWST_1/100' +
        '        when JP.STEUER_CODE=2 then 1+J.MWST_2/100' +
        '        when JP.STEUER_CODE=3 then 1+J.MWST_3/100' +
        '       end' +
        '    )' +
        '   ),2' +
        '  ) as UMSATZ_GES' +
        ' from' +
        '  ARTIKEL A, JOURNAL J, JOURNALPOS JP, WARENGRUPPEN W' +
        ' where' +
        '  J.QUELLE=3 and JP.QUELLE=3 and J.STADIUM<127 and' +
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and' +
        '  J.REC_ID=JP.JOURNAL_ID and A.REC_ID=JP.ARTIKEL_ID and' +
        '  A.WARENGRUPPE=W.ID' +
        ' group by' +
        '  A.WARENGRUPPE' +
        ' Having' +
        '  UMSATZ_GES !=0' +
        ' order by' +
        '  UMSATZ_GES DESC' +
        ' LIMIT 0,100';

        {
        ' select'+
        '   A.WARENGRUPPE,'+
        '   W.NAME,'+
        '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* '+
        'JP.MENGE),2) as UMSATZ_GES,'+
        '   SUM(JP.MENGE) as MENGE_GES'+
        ' from'+
        '   ARTIKEL A,'+
        '   JOURNAL J,'+
        '   JOURNALPOS JP,'+
        '   WARENGRUPPEN W'+
        ' where'+
        '   J.QUELLE=3 and'+
        '   JP.QUELLE=3 and'+
        '   J.STADIUM<127 and'+
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and'+
        '   J.REC_ID=JP.JOURNAL_ID and'+
        '   A.REC_ID=JP.ARTIKEL_ID and'+
        '   A.WARENGRUPPE=W.ID'+
        ' group by'+
        '  A.WARENGRUPPE'+
        ' Having'+
        '  UMSATZ_GES !=0'+
        ' order by UMSATZ_GES DESC'+
        ' LIMIT 0,100';
        }
        
      Query1.ParamByName('ZV').AsDateTime := Int(ZVon.Date);
      Query1.ParamByName('ZB').AsDateTime := Int(ZBis.Date);
      Query1.Open;

      PieSerie := tPieSeries.Create (Self);
      with PieSerie do
      begin
        ParentChart := DBChart1;
        Active := False;
        Marks.ArrowLength := 20;
        Marks.Style := smsLabelPercent;
        Marks.Visible := True;
        DataSource := Query1;
        SeriesColor := clRed;
        XLabelsSource := 'NAME';
        OtherSlice.Style := poBelowPercent;
        OtherSlice.Text := _('Sonstige');
        OtherSlice.Value := 2;
        PieValues.DateTime := False;
        PieValues.Name := 'Torte';
        PieValues.Multiplier := 1;
        PieValues.Order := loNone;
        PieValues.ValueSource := 'UMSATZ_GES';
        RotationAngle := 235;
      end;

      DBChart1.AddSeries (PieSerie);
      PieSerie.Active := True;
      DBChart1.Title.Text.Text := _('Umsatz nach Warengruppen');
    end;
    1: begin
      Query1.Sql.Text :=
        'select' +
        '   DATE_FORMAT(RDATUM,"%m.%Y") as D,' +
        '   ROUND(SUM(J.NSUMME),2) as UMSATZ_GES' +
        ' from' +
        '   JOURNAL J' +
        ' where' +
        '   J.QUELLE=3 and' +
        '    J.STADIUM<127 and' +
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB' +
        ' group by' +
        '   YEAR(J.RDATUM),' +
        '   MONTH(J.RDATUM)' +
        ' order by' +
        '   YEAR(J.RDATUM),' +
        '   MONTH(J.RDATUM)' +
        ' LIMIT 0,100';
      Query1.ParamByName('ZV').AsDateTime := Int(ZVon.Date);
      Query1.ParamByName('ZB').AsDateTime := Int(ZBis.Date);
      Query1.Open;
      BarSerie := tBarSeries.Create (Self);
      with BarSerie do
      begin
        ParentChart := DBChart1;
        Active := False;
        Marks.ArrowLength := 20;
        Marks.Style := smsValue;
        Marks.Visible := True;
        DataSource := Query1;
        PercentFormat := '##0 %';
        SeriesColor := 56576;
        ShowInLegend := False;
        ValueFormat := ',#';
        VertAxis := aRightAxis;
        XLabelsSource := 'D';
        BarBrush.Color := clWhite;
        BarPen.Visible := False;
        BarWidthPercent := 65;
        XValues.DateTime := False;
        XValues.Name := 'X';
        XValues.Multiplier := 1;
        XValues.Order := loAscending;
        YValues.DateTime := False;
        YValues.Name := 'Balken';
        YValues.Multiplier := 1;
        YValues.Order := loNone;
        YValues.ValueSource := 'UMSATZ_GES';
      end;
      DBChart1.AddSeries (BarSerie);
      BarSerie.Active := True;
      DBChart1.View3DOptions.Orthogonal := True;
      DBChart1.Title.Text.Text := _('Umsatz nach Monaten');
    end;
    2: begin
      Query1.Sql.Text :=
        'select' +
        '   DATE_FORMAT(RDATUM,"%m.%Y") as D,' +
        '   ROUND(SUM(J.NSUMME),2) as UMSATZ_GES' +
        ' from' +
        '   JOURNAL J' +
        ' where' +
        '   J.QUELLE=5 and' +
        '   J.STADIUM<127 and' +
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB' +
        ' group by' +
        '   YEAR(J.RDATUM),' +
        '   MONTH(J.RDATUM)' +
        ' order by' +
        '   YEAR(J.RDATUM),' +
        '   MONTH(J.RDATUM)' +
        ' LIMIT 0,100';
      Query1.ParamByName('ZV').AsDateTime := Int(ZVon.Date);
      Query1.ParamByName('ZB').AsDateTime := Int(ZBis.Date);
      Query1.Open;
      BarSerie := tBarSeries.Create (Self);
      with BarSerie do
      begin
        ParentChart := DBChart1;
        Active := False;
        Marks.ArrowLength := 20;
        Marks.Style := smsValue;
        Marks.Visible := True;
        DataSource := Query1;
        PercentFormat := '##0 %';
        SeriesColor := 5592575;
        ShowInLegend := False;
        ValueFormat := ',#';
        VertAxis := aRightAxis;
        XLabelsSource := 'D';
        BarBrush.Color := clWhite;
        BarPen.Visible := False;
        BarWidthPercent := 65;
        XValues.DateTime := False;
        XValues.Name := 'X';
        XValues.Multiplier := 1;
        XValues.Order := loAscending;
        YValues.DateTime := False;
        YValues.Name := 'Balken';
        YValues.Multiplier := 1;
        YValues.Order := loNone;
        YValues.ValueSource := 'UMSATZ_GES';
      end;
      DBChart1.AddSeries (BarSerie);
      BarSerie.Active := True;
      DBChart1.View3DOptions.Orthogonal := True;
      DBChart1.Title.Text.Text := _('Einkauf nach Monaten');
    end;
    3: begin
      Query1.Sql.Text :=
        'select' +
        ' A.NAME1,' +
        ' A.NAME2,' +
        {
        '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* '+
        'JP.MENGE),2) as UMSATZ_GES,'+
        }
        ' round(' +
        '  sum(' +
        '   if (J.BRUTTO_FLAG,' +
        '     ((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE),' +
        '     ((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* JP.MENGE)/' +
        '       case' +
        '        when JP.STEUER_CODE=0 then 1+J.MWST_0/100' +
        '        when JP.STEUER_CODE=1 then 1+J.MWST_1/100' +
        '        when JP.STEUER_CODE=2 then 1+J.MWST_2/100' +
        '        when JP.STEUER_CODE=3 then 1+J.MWST_3/100' +
        '       end' +
        '    )' +
        '   ),2' +
        '  ) as UMSATZ_GES,' +
        '   SUM(JP.MENGE) as MENGE_GES' +
        ' from' +
        '   ADRESSEN A,' +
        '   JOURNAL J,' +
        '   JOURNALPOS JP' +
        ' where' +
        '   J.QUELLE=3 and' +
        '   J.STADIUM<127 and' +
        '   JP.QUELLE=3 and' +
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and' +
        '   J.REC_ID=JP.JOURNAL_ID and' +
        '   A.REC_ID=JP.ADDR_ID' +
        ' group by' +
        '  A.REC_ID' +
        ' order by UMSATZ_GES DESC' +
        ' LIMIT 0,10';
      Query1.ParamByName('ZV').AsDateTime := Int(ZVon.Date);
      Query1.ParamByName('ZB').AsDateTime := Int(ZBis.Date);
      Query1.Open;
      PieSerie := tPieSeries.Create (Self);
      with PieSerie do
      begin
        ParentChart := DBChart1;
        Active := False;
        Marks.ArrowLength := 8;
        Marks.Style := smsLabelPercent;
        Marks.Visible := True;
        DataSource := Query1;
        PercentFormat := '##0 %';
        SeriesColor := clGreen;
        ValueFormat := '#,##0';
        XLabelsSource := 'NAME1';
        OtherSlice.Style := poBelowPercent;
        OtherSlice.Text := _('Sonstige');
        OtherSlice.Value := 1;
        PieValues.DateTime := False;
        PieValues.Name := 'Torte';
        PieValues.Multiplier := 1;
        PieValues.Order := loDescending;
        PieValues.ValueSource := 'UMSATZ_GES';
        RotationAngle := 305;
      end;
      DBChart1.AddSeries (PieSerie);
      PieSerie.Active := True;
      DBChart1.Title.Text.Text := _('Kunden / Top 10');
    end;
    4: begin
      Query1.Sql.Text :=
        'select' +
        '   A.ARTNUM,' +
        '   A.MATCHCODE,' +
        '   A.KURZNAME,' +
        '   ROUND(SUM((JP.EPREIS - (JP.EPREIS / 100 * JP.RABATT))* ' +
        'JP.MENGE),2) as UMSATZ_GES,' +
        '   SUM(JP.MENGE) as MENGE_GES' +
        ' from' +
        '  ARTIKEL A,' +
        '   JOURNAL J,' +
        '   JOURNALPOS JP' +
        ' where' +
        '   J.QUELLE=3 and' +
        '   J.STADIUM<127 and' +
        '   JP.QUELLE=3 and' +
        '   J.RDATUM>= :ZV and J.RDATUM <=:ZB and' +
        '   J.REC_ID=JP.JOURNAL_ID and' +
        '   A.REC_ID=JP.ARTIKEL_ID' +
        ' group by' +
        '  A.REC_ID' +
        ' order by UMSATZ_GES DESC' +
        ' LIMIT 0,10';
      Query1.ParamByName('ZV').AsDateTime := Int(ZVon.Date);
      Query1.ParamByName('ZB').AsDateTime := Int(ZBis.Date);
      Query1.Open;
      PieSerie := tPieSeries.Create (Self);
      with PieSerie do
      begin
        ParentChart := DBChart1;
        Active := False;
        Marks.ArrowLength := 8;
        Marks.Style := smsLabelPercent;
        Marks.Visible := True;
        DataSource := Query1;
        PercentFormat := '##0 %';
        SeriesColor := clGreen;
        ValueFormat := '#,##0';
        XLabelsSource := 'KURZNAME';
        OtherSlice.Style := poBelowPercent;
        OtherSlice.Text := _('Sonstige');
        OtherSlice.Value := 1;
        PieValues.DateTime := False;
        PieValues.Name := 'Torte';
        PieValues.Multiplier := 1;
        PieValues.Order := loDescending;
        PieValues.ValueSource := 'UMSATZ_GES';
        RotationAngle := 305;
      end;
      DBChart1.AddSeries (PieSerie);
      PieSerie.Active := True;
      DBChart1.Title.Text.Text := _('Artikel / Top 10');
    end;
  end; //case
  DBChart1.TopAxis.Title.Caption := _('Zeitraum') + ' : ' +
    FormatDateTime ('dd.mm.yyyy', ZVon.Date) +
    ' ' + _('bis') + ' ' +
  FormatDateTime ('dd.mm.yyyy', ZBis.Date);
  DBChart1.TopAxis.Visible := True;
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.ZBisChange(Sender: TObject);
begin
  if ZBis.Date<ZVon.Date then 
    ZVon.Date := ZBis.Date;
  ComboBox1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.ZVonChange(Sender: TObject);
begin
  if ZVon.Date>ZBis.Date then 
    ZBis.Date := ZVon.Date;
  ComboBox1Change(Self);
end;

//------------------------------------------------------------------------------
procedure TStatisticForm.PrintBtnClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    DBChart1.PrintOrientation (Printer.Orientation);
  end;
end;

//------------------------------------------------------------------------------

end.

