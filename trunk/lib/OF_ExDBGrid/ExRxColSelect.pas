{
ExDBGrid Component Suite Version 3.9 - ExRxColSelect

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExRxColSelect;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Db, Checklst, ExRxDBGrid, Buttons, ExtCtrls, ComCtrls, AdvStatusBar;

type
   TExRxColSelectFrm = class(TForm)
      ColList: TCheckListBox;
      AdvStatusBar1: TAdvStatusBar;
      Panel1: TPanel;
      Okbtn: TSpeedButton;
      Panel2: TPanel;
      Cancelbtn: TSpeedButton;
      procedure FormActivate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure ColListKeyPress(Sender: TObject; var Key: Char);
      procedure ColListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure FormCreate(Sender: TObject);
      procedure OkbtnClick(Sender: TObject);
      procedure CancelbtnClick(Sender: TObject);
      procedure ColListDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; var Accept: Boolean);
      procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
      FDataSource: TDataSource;
      FExRxDBGrid: TExRxDBGrid;
   public
      { Public declarations }
      property DataSource: TDataSource read FDataSource write FDataSource;
      property ExRxDBGrid: TExRxDBGrid read FExRxDBGrid write FExRxDBGrid;
   end;

var
   ExRxColSelectFrm: TExRxColSelectFrm;
   ColumnUpdate: Boolean;
   ExCheckWidth,
      ExCheckHeight: Integer;

implementation

{$R *.DFM}

procedure TExRxColSelectFrm.FormActivate(Sender: TObject);
var
   i, j: Integer;
begin
   ColumnUpdate := True;

   if ExRxDBGrid <> nil then
      begin
         with ExRxDBGrid do
            try
               if not (Assigned(DataSource) and
                  Assigned(DataSource.DataSet)) then exit;

               for i := 0 to DataSource.DataSet.FieldCount - 1 do
                  begin
                     if Uppercase(DataSource.DataSet.Fields[i].DisplayLabel) <> '<NO DISPLAY>' then
                        begin
                           j := ColList.Items.AddObject(DataSource.DataSet.Fields[i].DisplayLabel, DataSource.DataSet.Fields[i]);
                           ColList.Checked[j] := DataSource.DataSet.Fields[i].Visible;
                        end;
                  end;
            finally
            end;

         if ColList.Items.Count > 0 then
            ColList.ItemIndex := 0;
      end;
end;

procedure TExRxColSelectFrm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i: Integer;
   ContinueUpdate: Boolean;
begin
   if ExRxColSelectFrm.ModalResult = mrOk then
      begin
         ContinueUpdate := False;

         if ColumnUpdate then
            begin
               for i := 0 to ColList.Items.Count - 1 do
                  begin
                     if ColList.Checked[i] = True then
                        begin
                           ContinueUpdate := True;
                        end;
                  end;

               if ContinueUpdate = True then
                  begin
                     for i := 0 to ColList.Items.Count - 1 do
                        begin
                           with DataSource.DataSet.Fields[i] do
                              begin
                                 Visible := ColList.Checked[i];
                              end;
                        end;
                  end
               else
                  begin
                     {$IFDEF ENGLISH}
                     MessageDlg('You Cannot Hide All The Columns.', mtWarning, [mbOk], 0);
                     {$ENDIF}
                     {$IFDEF ITALIAN}
                     MessageDlg('Non potete Nascondere Tutte le Colonne.', mtWarning, [mbOk], 0);
                     {$ENDIF}
                     {$IFDEF PORTUGUESE}
                     MessageDlg('Você Não pode Esconder Todas as Colunas.', mtWarning, [mbOk], 0);
                     {$ENDIF}
                     {$IFDEF FRENCH}
                     MessageDlg('Vous ne pouvez pas masquer toutes les colonnes.', mtWarning, [mbOk], 0);
                     {$ENDIF}
                     {$IFDEF GERMAN}
                     MessageDlg('Sie können nicht alle Spalten ausblenden.', mtWarning, [mbOk], 0);
                     {$ENDIF}
                  end;
            end;
      end;
end;

procedure TExRxColSelectFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      begin
         ExRxColSelectFrm.ModalResult := mrCancel;
         ColumnUpdate := False;
      end;
end;

procedure TExRxColSelectFrm.ColListKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      begin
         ExRxColSelectFrm.ModalResult := mrCancel;
         ColumnUpdate := False;
      end;
end;

procedure TExRxColSelectFrm.ColListDrawItem(Control: TWinControl;
   Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   DrawRect: TRect;
begin
   with TCheckListBox(Control).Canvas do
      begin
         FillRect(Rect);

         //LIST ITEMS

         TextRect(Rect, Rect.Left + 4, Rect.Top + 1, TCheckListBox(Control).Items.Strings[Index]);

         //Top
         Pen.Color := clWindow;
         MoveTo(Rect.Left, Rect.Top);
         LineTo(Rect.Right, Rect.Top);
         //Left
         {Pen.Color := clWhite;
         MoveTo(Rect.Left, Rect.Top + 1);
         LineTo(Rect.Left, Rect.Bottom - 1);}
         //Bottom
         Pen.Color := clBtnShadow;
         MoveTo(Rect.Left, Rect.Bottom - 1);
         LineTo(Rect.Right, Rect.Bottom - 1);
         //Right
         Pen.Color := clBtnShadow;
         MoveTo(Rect.Right - 1, Rect.Top);
         LineTo(Rect.Right - 1, Rect.Bottom - 1);

         //CHECK ITEMS

         DrawRect := Rect;
         DrawRect.Right := Rect.Left;
         DrawRect.Left := DrawRect.Right - (ExCheckWidth + 2);
         DrawRect.Top := Rect.Top;
         DrawRect.Bottom := Rect.Bottom;

         //Top
         Pen.Color := clWindow;
         MoveTo(DrawRect.Left, DrawRect.Top);
         LineTo(DrawRect.Right, DrawRect.Top);
         //Left
         Pen.Color := clWindow;
         MoveTo(DrawRect.Left, DrawRect.Top + 1);
         LineTo(DrawRect.Left, DrawRect.Bottom - 1);
         //Bottom
         Pen.Color := clBtnShadow;
         MoveTo(DrawRect.Left, DrawRect.Bottom - 1);
         LineTo(DrawRect.Right, DrawRect.Bottom - 1);
         //Right
         {Pen.Color := clBtnShadow;
         MoveTo(DrawRect.Right - 1, DrawRect.Top);
         LineTo(DrawRect.Right - 1, DrawRect.Bottom - 1);}
      end;

   if (odSelected in State) then
      begin
         TCheckListBox(Control).Canvas.FrameRect(Rect);
      end;
end;

procedure TExRxColSelectFrm.FormCreate(Sender: TObject);
begin
   with TBitmap.Create do
      try
         Handle := LoadBitmap(0, PChar(32759));
         ExCheckWidth := Width div 4;
         ExCheckHeight := Height div 3;
      finally
         Free;
      end;

   {$IFDEF ENGLISH}
   Self.Caption := 'Customize';
   Okbtn.Caption := '&Ok';
   Cancelbtn.Caption := '&Cancel';
   {$ENDIF}
   {$IFDEF ITALIAN}
   Self.Caption := 'Personalizzare';
   Okbtn.Caption := '&Ok';
   Cancelbtn.Caption := '&Annullare';
   {$ENDIF}
   {$IFDEF PORTUGUESE}
   Self.Caption := 'Personalizar';
   Okbtn.Caption := '&Ok';
   Cancelbtn.Caption := '&Cancelar';
   {$ENDIF}
   {$IFDEF FRENCH}
   Self.Caption := 'Personnaliser';
   Okbtn.Caption := '&Ok';
   Cancelbtn.Caption := '&Annuler';
   {$ENDIF}
   {$IFDEF GERMAN}
   Self.Caption :='benutzerdef. Spalten';
   CancelBtn.Caption :='&Abbrechen';
   Okbtn.Caption := '&Ok';
   {$ENDIF}
end;

procedure TExRxColSelectFrm.OkbtnClick(Sender: TObject);
begin
   ExRxColSelectFrm.ModalResult := mrOk;
end;

procedure TExRxColSelectFrm.CancelbtnClick(Sender: TObject);
begin
   ExRxColSelectFrm.ModalResult := mrCancel;
end;

procedure TExRxColSelectFrm.ColListDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; var Accept: Boolean);

   procedure MoveC;
   var
      i, i1: Integer;
      b: Boolean;
   begin
      i := ColList.Tag;
      ColList.Tag := -1;
      if i < 0 then
         exit;
      i1 := ColList.ItemAtPos(Point(x, y), True);
      if i1 < 0 then
         exit;
      b := ColList.Checked[i];
      ColList.Items.Move(i, i1);
      ColList.Checked[i1] := b;
   end;

begin
   if Sender = Source then
      begin
         Accept := True;
         case State of
            dsDragEnter: ColList.Tag := ColList.ItemAtPos(Point(x, y), True);
            dsDragLeave: MoveC;
         end;
      end;
end;

procedure TExRxColSelectFrm.FormDestroy(Sender: TObject);
begin
   ColList.Items.Clear;
   inherited;
end;

end.

