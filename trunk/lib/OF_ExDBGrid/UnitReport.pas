{
ExDBGrid Component Suite Version 3.9 - UnitReport

Original Design Copyright (©) 1999 Li Software
Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit UnitReport;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, StdCtrls, Buttons, ExtCtrls, grids, dbgrids, Quickrpt, Qrctrls, Qrprntr,
   Qrextra, printers;

type
   TPrintAction = (paPrint, paPreview);

procedure ShowReportByDataSet(DSet: TDataSet; cap: string; Action: TPrintAction);
procedure ShowReportByGrid(Grid: TDBGrid; cap: string; Action: TPrintAction);

implementation

function GetAl(F: TField): TAlignment;
begin
   Result := taLeftJustify;
   case F.DataType of
      ftUnknown, ftString:
         Result := taLeftJustify;
      ftAutoInc, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftBytes:
         Result := taRightJustify;
      ftBoolean, ftDate, ftTime, ftDateTime:
         Result := taCenter;
   end;
end;

procedure SetPages(b: TQRBand);
begin
   with TQRSysData(b.AddPrintable(TQRSysData)) do
      begin
         Data := qrsPageNumber;
         AutoSize := False;
         Left := 0;
         Top := 0;
         Width := b.Width;
         Text := 'Page: ';
         Alignment := taCenter;
      end;
end;

procedure SetTitle(b: TQRBand; Cap: string);
begin
   with TQRLabel(b.AddPrintable(TQRLabel)) do
      begin
         AutoSize := False;
         Left := 0;
         Width := b.Width;
         Caption := Cap;
         Size.Top := 1;
         Font.Style := [fsBold];
         Font.Color := clBlue;
         Font.Size := 9; //14
         Alignment := taCenter;
         AutoStretch := True;
      end;
end;

function SetReport(aForm: TForm; DSet: TDataSet; cap: string): TQuickRep;
begin
   Result := TQuickRep.Create(Application);

   with Result do
      begin
         Parent := aForm;
         Font.Name := 'Tahoma';
         //Font.Charset := ANSI_CHARSET;
         Font.Charset := aForm.Font.Charset;
         ReportTitle := cap;
         Font.Size := 8;
         DataSet := DSet;
      end;
end;

procedure Get2Cmpnts(var DSet: TDataSet; var Grid: TDBGrid; IsDS: Boolean; Cmpnt: TComponent);
begin
   Grid := nil;

   if IsDS then
      DSet := TDataSet(Cmpnt)
   else
      begin
         Grid := TDBGrid(Cmpnt);
         DSet := Grid.DataSource.DataSet;
      end;
end;

procedure SetColTitle(cBands: TQRBand; x, i: Integer; Cmpnt: TComponent; IsDS: Boolean);
var
   DSet: TDataSet;
   Grid: TDBGrid;
begin
   Get2Cmpnts(DSet, Grid, IsDS, Cmpnt);

   with TQRLabel(cBands.AddPrintable(TQRLabel)) do
      begin
         Height := 20;
         Size.Left := x;
         Size.Top := 0;
         AutoSize := false;
         Size.Width := Dset.Fields[i].DisplayWidth;
         AutoStretch := True;
         Alignment := GetAl(Dset.Fields[i]);
         Caption := Dset.Fields[i].DisplayLabel;
      end;
end;

procedure SetDetail(aBands: TQRBand; x, i: Integer; Cmpnt: TComponent; IsDS: Boolean);
var
   DSet: TDataSet;
   Grid: TDBGrid;
begin
   Get2Cmpnts(DSet, Grid, IsDS, Cmpnt);

   with TQRDBText(aBands.AddPrintable(TQRDBText)) do
      begin
         DataSet := DSet;
         AutoSize := false;
         AutoStretch := True;
         if IsDS then
            begin
               Size.Left := x;
               Size.Top := 0;
               DataField := DSet.Fields[i].FieldName;
               Size.Width := Dset.Fields[i].DisplayWidth;
               Alignment := GetAl(Dset.Fields[i]);
            end
         else
            {$IFDEF EX_COMPILER_4_UP}
            if Grid.Columns.Items[i].Visible then
               {$ENDIF}
               begin
                  Top := 1;
                  Left := x;
                  Width := Grid.Columns[i].Width;
                  Alignment := Grid.Columns[i].Alignment;
                  DataField := Grid.Columns[i].FieldName;
                  Font.Style := Grid.Columns[i].Font.Style;

                  if (Grid.Columns[i].Font.Name = 'Wingdings') or
                     (Grid.Columns[i].Font.Name = 'Symbol') then
                     begin
                        Font.Name := Grid.Columns[i].Font.Name;
                        Font.Charset := SYMBOL_CHARSET;
                     end;
               end;
      end;
end;

function BadType(DataType: TFieldType): Boolean;
begin
   Result := (DataType in [ftVarBytes, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
      ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor]);
end;

procedure SetDSOrient(x, i: Integer; bBands: TQRBand);
var
   DSet: TDataSet;
   aReport: TQuickRep;
begin
   aReport := TQuickRep(bBands.Parent);
   DSet := aReport.DataSet;

   if ((x + Dset.Fields[i].DisplayWidth) > bBands.Size.Width) and
      (aReport.Page.Orientation = poPortrait) then
      aReport.Page.Orientation := poLandscape;
end;

procedure SetGridOrient(x, i: Integer; bBands: TQRBand; Grid: TDBGrid);
var
   aReport: TQuickRep;
begin
   aReport := TQuickRep(bBands.Parent);
   if ((x + Grid.Columns[i].Width) > bBands.Width) and
      (aReport.Page.Orientation = poPortrait) then
      aReport.Page.Orientation := poLandscape;
end;

procedure SetDSLabels(aBands, bBands, cBands: TQRBand; DSet: TDataSet);
var
   x, i: Integer;
begin
   x := 1;

   for i := 0 to DSet.FieldCount - 1 do
      begin
         if (Dset.Fields[i].DisplayWidth = 0) or (not Dset.Fields[i].Visible) or
            BadType(Dset.Fields[i].DataType) then
            Continue;

         SetDSOrient(x, i, bBands);

         if (x + Dset.Fields[i].DisplayWidth) > bBands.Size.Width then
            Break;

         SetDetail(aBands, x, i, DSet, True);
         SetColTitle(cBands, x, i, DSet, True);
         x := x + Dset.Fields[i].DisplayWidth + 5;
      end;
end;

procedure SetGridLabels(aBands, bBands, cBands: TQRBand; Grid: TDBGrid);
var
   i, x: Integer;
begin
   x := 1;

   for i := 0 to Grid.Columns.Count - 1 do
      try
         begin
            {$IFDEF EX_COMPILER_3}
            if (Grid.Columns[i].Width = 0) or BadType(Grid.Columns[i].Field.DataType) then
               {$ELSE}
            if (Grid.Columns[i].Width = 0) or BadType(Grid.Columns[i].Field.DataType) or (not Grid.Columns.Items[i].Visible) then
               {$ENDIF}
               Continue;

            SetGridOrient(x, i, bBands, Grid);

            if (x + Grid.Columns[i].Width) > bBands.Width then
               Break;

            SetDetail(aBands, x, i, Grid, False);

            with TQRLabel(cBands.AddPrintable(TQRLabel)) do
               begin
                  Height := 80;
                  Left := x;
                  Top := 1;
                  AutoSize := false;
                  Width := Grid.Columns[i].Width;
                  Alignment := taCenter;
                  Caption := Grid.Columns[i].Title.Caption;
                  x := x + Grid.Columns[i].Width + 5;
               end;
         end;
      except
         on E: Exception do
            MessageDlg('Error: ' + E.Message, mtError, [mbOk], 0);
      end;
end;

procedure ShowReport(Cmpnt: TComponent; cap: string; IsDS: Boolean; Action: TPrintAction);
var
   DSet: TDataSet;
   Grid: TDBGrid;
   aForm: TForm;
   aReport: TQuickRep;
   cBands, bBands, aBands, dBands: TQRBand;
begin
   Get2Cmpnts(DSet, Grid, IsDS, Cmpnt);

   aForm := TForm.Create(Application);
   aReport := SetReport(aForm, DSet, Cap);

   aBands := TQRBand.Create(aReport);
   aBands.Parent := aReport;
   aBands.BandType := rbDetail;
   aBands.Size.Height := 4;

   bBands := TQRBand.Create(aReport);
   bBands.Parent := aReport;
   bBands.BandType := rbPageHeader;
   bBands.Frame.DrawBottom := true;
   bBands.Frame.DrawTop := true;
   bBands.Size.Height := 10;

   cBands := TQRBand.Create(aReport);
   cBands.Parent := aReport;
   cBands.BandType := rbColumnHeader;
   cBands.Frame.DrawBottom := true;
   cBands.Frame.DrawTop := true;
   cBands.Size.Height := 16;
   cBands.Font.Style := [fsBold];
   cBands.Font.Color := clMaroon;

   dBands := TQRBand.Create(aReport);
   dBands.Parent := aReport;
   dBands.BandType := rbPageFooter;

   if IsDS then
      SetDSLabels(aBands, bBands, cBands, DSet)
   else
      SetGridLabels(aBands, bBands, cBands, Grid);

   SetTitle(bBands, cap);
   SetPages(dBands);

   aReport.Page.PaperSize := Default;
   aReport.PrinterSettings.PaperSize := Default;

   case Action of
      paPreview: aReport.Preview;
      paPrint: aReport.Print;
   end;

   dBands.Free;
   bBands.Free;
   cBands.Free;
   aBands.Free;
   aReport.Free;
   aForm.Free;
end;

procedure ShowReportByDataSet(DSet: TDataSet; cap: string; Action: TPrintAction);
begin
   ShowReport(DSet, cap, True, Action);
end;

procedure ShowReportByGrid(Grid: TDBGrid; cap: string; Action: TPrintAction);
begin
   ShowReport(Grid, cap, False, Action);
end;

end.

