{
ExDBGrid Component Suite Version 3.9 - ExRxDBGridToWord

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

unit ExRxDBGridToWord;

interface

uses SysUtils, StdCtrls, Classes, Graphics, Db, Grids, DBGrids, ExRxDBGrid, ComObj;

procedure GridToWord(Grid: TExRxDBGrid; FormatNum: integer);

implementation

procedure GridToWord(Grid: TExRxDBGrid; FormatNum: integer);
var
   x: integer;
   y: integer;
   Word: Olevariant;
   GColCount: integer;
   GRowCount: integer;
begin
   {GColCount := 0;
   for y := 0 to Grid.DataSource.DataSet.FieldCount - 1 do
      begin
         if Grid.DataSource.DataSet.Fields[y].Visible then
            GColCount := GColCount + 1;
      end;}

   Word := CreateOLEobject('Word.Application');
   Word.Visible := True;
   Word.Documents.Add;
   GColCount := Grid.Columns.Count;
   GRowCount := Grid.DataSource.DataSet.RecordCount;
   Word.ActiveDocument.Range.Font.Name := Grid.Font.Name;
   Word.ActiveDocument.Range.Font.Size := Grid.Font.Size;
   Word.ActiveDocument.PageSetup.Orientation := 1;
   Word.ActiveDocument.Tables.Add(Word.ActiveDocument.Range, GRowCount + 1, GColCount);
   Word.ActiveDocument.Range.InsertAfter('Date ' + Datetimetostr(Now));
   Word.ActiveDocument.Range.Tables.Item(1).AutoFormat(FormatNum, 1, 1, 1, 1, 1, 0, 0, 0, 1);

   for y := 1 to GColCount do
      //for y := 1 to Grid.DataSource.DataSet.FieldCount do
      begin
         //if Grid.DataSource.DataSet.Fields[y - 1].Visible then
         Word.ActiveDocument.Tables.Item(1).Cell(1, y).Range.InsertAfter(Grid.Columns[y - 1].Title.Caption);
         //Word.ActiveDocument.Tables.Item(1).Cell(1, y).Range.InsertAfter(Grid.DataSource.DataSet.Fields[y - 1].DisplayLabel);
      end;

   x := 1;
   Grid.DataSource.DataSet.DisableControls;
   with Grid.DataSource.DataSet do
      begin
         First;
         while not Eof do
            begin
               x := x + 1;
               for y := 1 to GColCount do
                  //for y := 1 to Grid.DataSource.DataSet.FieldCount do
                  begin
                     //if Grid.DataSource.DataSet.Fields[y - 1].Visible then
                     Word.ActiveDocument.Tables.Item(1).Cell(x, y).Range.InsertAfter(FieldByName(Grid.Columns[y - 1].FieldName).AsString);
                     //Word.ActiveDocument.Tables.Item(1).Cell(x, y).Range.InsertAfter(FieldByName(Grid.Columns[y - 1].FieldName).AsString);
                  end;
               Next;
            end;
      end;
   Grid.DataSource.DataSet.EnableControls;

   Word.ActiveDocument.Range.Tables.Item(1).UpdateAutoFormat;
end;
end.

