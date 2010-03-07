{
ExDBGrid Component Suite Version 3.9 - ExDBQbf

Original Design By (©) 1995 by Rick Rutt.
Updated Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExDBQbf;

interface

uses
   Windows, Classes, Graphics, Forms, Controls, Buttons, StdCtrls, ExtCtrls,
   Grids, DBGrids
   {$IFDEF BDE}, DBTables{$ENDIF}
   {$IFDEF ADS}, AdsData, AdsFunc, AdsTable{$ENDIF}
   {$IFDEF ADO}, AdoDB{$ENDIF}
   {$IFDEF DAO}, DAODatabase, DAOTable, DAOQuery, DAODataset, DAOMDTable, DAOQueryDef{$ENDIF}
   {$IFDEF IBX}, IBCustomDataSet, IBTable, IBQuery{$ENDIF}
   {$IFDEF CDS}, DBClient{$ENDIF};

procedure QueryByForm(grid: TDbGrid);
procedure SortByForm(grid: TDbGrid);

type
   TdlgExDBQbf = class(TForm)
      gridQBF: TStringGrid;
      Panel1: TPanel;
      OKBtn: TSpeedButton;
      Panel2: TPanel;
      CancelBtn: TSpeedButton;
      procedure OKBtnClick(Sender: TObject);
      procedure CancelBtnClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure gridQBFKeyPress(Sender: TObject; var Key: Char);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   dlgExDBQbf: TdlgExDBQbf;

implementation

uses Dialogs, Db;

{$R *.DFM}

const
   qbfRowHeight = 16;
   qbfColWidth = 150;
   qbfFieldLabel = ' Field ';
   qbfValueLabel = ' Value ';
   qbfQueryCaption = ' Query For Table ';
   qbfSortCaption = ' Sort Order For Table ';
var
   CallingGrid: TDbGrid;
   CallingMode: (modeQuery, modeSort);

procedure SetupAndShowForm;
var
   i, j, n: integer;
   {$IFDEF BDE}
   tbl: TTable;
   {$ENDIF}
   {$IFDEF ADS}
   adstbl: TAdsTable;
   {$ENDIF}
   {$IFDEF ADO}
   adotbl: TADOTable;
   {$ENDIF}
   {$IFDEF DAO}
   daotbl: TDAOTable;
   {$ENDIF}
   {$IFDEF IBX}
   ibtbl: TIBTable;
   {$ENDIF}
   {$IFDEF CDS}
   clienttbl: TClientDataSet;
   {$ENDIF}
   f: TField;
   bError: Boolean;
begin
   n := CallingGrid.FieldCount;
   if n <= 0 then
      begin
         MessageDlg('QBF called for a Grid without any Fields', mtWarning, [mbOK], 0);
      end
   else
      if CallingGrid.DataSource = nil then
         begin
            MessageDlg('QBF called for a Grid without a DataSource', mtWarning, [mbOK], 0);
         end
      else
         if CallingGrid.DataSource.DataSet = nil then
            begin
               MessageDlg('QBF called for a Grid with a DataSource without a DataSet', mtWarning, [mbOK], 0);
            end
         else
            begin
               bError := True;
               {$IFDEF BDE}
               if (CallingGrid.DataSource.DataSet is TTable) then
                  bError := False;
               {$ENDIF}
               {$IFDEF ADS}
               if (CallingGrid.DataSource.DataSet is TAdsTable) then
                  bError := False;
               {$ENDIF}
               {$IFDEF ADO}
               if (CallingGrid.DataSource.DataSet is TAdoTable) then
                  bError := False;
               {$ENDIF}
               {$IFDEF IBX}
               if (CallingGrid.DataSource.DataSet is TIBTable) then
                  bError := False;
               {$ENDIF}
               {$IFDEF CDS}
               if (CallingGrid.DataSource.DataSet is TClientDataSet) then
                  bError := False;
               {$ENDIF}
               if bError then
                  MessageDlg('QBF called for a Grid with a wrong DataSource Type', mtWarning, [mbOK], 0)
               else
                  begin
                     with dlgExDBQbf.gridQBF do
                        begin
                           DefaultRowHeight := qbfRowHeight;
                           Scrollbars := ssVertical;
                           ColCount := 3;
                           ColWidths[2] := 0;
                           RowCount := Succ(n);
                           Cells[0, 0] := qbfFieldLabel;
                           Options := Options + [goRowMoving];
                           {$IFDEF BDE}
                           tbl := TTable(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           {$IFDEF ADS}
                           adstbl := TAdsTable(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           {$IFDEF ADO}
                           adotbl := TADOTable(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           {$IFDEF DAO}
                           daotbl := TDAOTable(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           {$IFDEF IBX}
                           ibtbl := TIBTable(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           {$IFDEF CDS}
                           clienttbl := TClientDataSet(CallingGrid.DataSource.DataSet);
                           {$ENDIF}
                           if CallingMode = modeQuery then
                              begin
                                 {$IFDEF BDE}
                                 dlgExDBQbf.Caption := qbfQueryCaption + tbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF ADS}
                                 dlgExDBQbf.Caption := qbfQueryCaption + adstbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF ADO}
                                 dlgExDBQbf.Caption := qbfQueryCaption + adotbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF DAO}
                                 dlgExDBQbf.Caption := qbfQueryCaption + daotbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF IBX}
                                 dlgExDBQbf.Caption := qbfQueryCaption + ibtbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF CDS}
                                 dlgExDBQbf.Caption := qbfQueryCaption;
                                 {$ENDIF}
                                 Cells[1, 0] := qbfValueLabel;
                                 Options := Options + [goEditing];
                                 DefaultColWidth := qbfColWidth;
                              end
                           else
                              begin
                                 {$IFDEF BDE}
                                 dlgExDBQbf.Caption := qbfSortCaption + tbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF ADS}
                                 dlgExDBQbf.Caption := qbfSortCaption + adstbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF ADO}
                                 dlgExDBQbf.Caption := qbfSortCaption + adotbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF DAO}
                                 dlgExDBQbf.Caption := qbfSortCaption + daotbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF IBX}
                                 dlgExDBQbf.Caption := qbfSortCaption + ibtbl.TableName;
                                 {$ENDIF}
                                 {$IFDEF CDS}
                                 dlgExDBQbf.Caption := qbfSortCaption;
                                 {$ENDIF}
                                 Cells[1, 0] := '';
                                 Options := Options - [goEditing];
                                 DefaultColWidth := (2 * qbfColWidth);
                              end;
                           j := 0;
                           for i := 1 to n do
                              begin
                                 f := CallingGrid.Fields[Pred(i)];
                                 if f.DataType in [ftBlob, ftBytes, ftGraphic, ftMemo, ftUnknown, ftVarBytes] then
                                    RowCount := Pred(RowCount)
                                 else
                                    begin
                                       Inc(j);
                                       Cells[0, j] := f.DisplayLabel;
                                       Cells[1, j] := '';
                                       Cells[2, j] := f.FieldName;
                                    end;
                              end;
                           dlgExDBQbf.ShowModal;
                        end;
                  end;
            end;
end;

procedure QueryByForm(Grid: TDbGrid);
begin
   CallingGrid := Grid;
   CallingMode := modeQuery;
   SetupAndShowForm;
end;

procedure SortByForm(Grid: TDbGrid);
begin
   CallingGrid := Grid;
   CallingMode := modeSort;
   SetupAndShowForm;
end;

procedure TdlgExDBQbf.CancelBtnClick(Sender: TObject);
begin
   dlgExDBQbf.ModalResult := mrCancel;
   dlgExDBQbf.Hide;
end;

procedure TdlgExDBQbf.OKBtnClick(Sender: TObject);
var
   flds, sep, val: string;
   i, n: integer;
begin
   dlgExDBQbf.ModalResult := mrOk;

   flds := '';
   sep := '';

   with dlgExDBQbf.gridQBF do
      begin
         n := Pred(RowCount);
         if (n > 10) and (CallingMode = modeSort) then
            n := 10;
         if n > 0 then
            for i := 1 to n do
               begin
                  val := Cells[1, i];
                  if (CallingMode = modeSort) or (val <> '') then
                     begin
                        flds := flds + sep + Cells[2, i];
                        sep := ';';
                     end;
               end;

         {$IFDEF BDE}
         if CallingGrid.DataSource.DataSet is TTable then
            begin
               with CallingGrid.DataSource.DataSet as TTable do
                  begin
                     IndexFieldNames := flds;
                     if (CallingMode = modeSort) or (flds = '') then
                        begin
                           CancelRange;
                        end
                     else
                        begin
                           SetRangeStart;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           SetRangeEnd;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           ApplyRange;
                        end;
                     Refresh;
                  end;
            end;
         {$ENDIF}
         {$IFDEF ADS}
         if CallingGrid.DataSource.DataSet is TAdsTable then
            begin
               with CallingGrid.DataSource.DataSet as TAdsTable do
                  begin
                     IndexFieldNames := flds;
                     if (CallingMode = modeSort) or (flds = '') then
                        begin
                           CancelRange;
                        end
                     else
                        begin
                           SetRangeStart;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           SetRangeEnd;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           ApplyRange;
                        end;
                     Refresh;
                  end;
            end;
         {$ENDIF}
         {$IFDEF ADO}
         {with CallingGrid.DataSource.DataSet as TADOTable do
             begin
                 IndexFieldNames := flds;
                 if (CallingMode = modeSort) or (flds = '') then
                     begin
                         CancelRange;
                     end
                 else
                     begin
                         SetRangeStart;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         SetRangeEnd;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         ApplyRange;
                     end;
                 Refresh;
             end;}
         {$ENDIF}
         {$IFDEF DAO}
         {with CallingGrid.DataSource.DataSet as TDAOTable do
             begin
                 IndexFieldNames := flds;
                 if (CallingMode = modeSort) or (flds = '') then
                     begin
                         CancelRange;
                     end
                 else
                     begin
                         SetRangeStart;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         SetRangeEnd;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         ApplyRange;
                     end;
                 Refresh;
             end;}
         {$ENDIF}
         {$IFDEF IBX}
         {with CallingGrid.DataSource.DataSet as TIBTable do
             begin
                 IndexFieldNames := flds;
                 if (CallingMode = modeSort) or (flds = '') then
                     begin
                         CancelRange;
                     end
                 else
                     begin
                         SetRangeStart;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         SetRangeEnd;
                         for i := 1 to n do
                             begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                     begin
                                         FieldByName(Cells[0, i]).AsString := val;
                                     end;
                             end;
                         ApplyRange;
                     end;
                 Refresh;
             end;}
         {$ENDIF}
         {$IFDEF CDS}
         if CallingGrid.DataSource.DataSet is TClientDataSet then
            begin
               with CallingGrid.DataSource.DataSet as TClientDataSet do
                  begin
                     IndexFieldNames := flds;
                     if (CallingMode = modeSort) or (flds = '') then
                        begin
                           CancelRange;
                        end
                     else
                        begin
                           SetRangeStart;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           SetRangeEnd;
                           for i := 1 to n do
                              begin
                                 val := Cells[1, i];
                                 if val <> '' then
                                    begin
                                       FieldByName(Cells[2, i]).AsString := val;
                                    end;
                              end;
                           ApplyRange;
                        end;
                     //Refresh;
                  end;
            end;
         {$ENDIF}
      end;
   dlgExDBQbf.Hide;
end;

procedure TdlgExDBQbf.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      begin
         dlgExDBQbf.ModalResult := mrCancel;
      end;
end;

procedure TdlgExDBQbf.gridQBFKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      begin
         dlgExDBQbf.ModalResult := mrCancel;
      end;
end;

end.

