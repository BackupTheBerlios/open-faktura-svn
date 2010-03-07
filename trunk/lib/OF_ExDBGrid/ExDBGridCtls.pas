{
ExDBGrid Component Suite Version 3.9 - ExDBGridCtls

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}
{$WARNINGS OFF}
{$HINTS OFF}

unit ExDBGridCtls;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Db, ComCtrls, AdvStatusBar, DBCtrls,
   Menus{$IFDEF JPEGGRAPHICS}, Jpeg{$ENDIF}, ExtDlgs, Printers
   {$IFDEF BDE}, DbTables{$ENDIF}
   {$IFDEF ADS}, AdsData, AdsFunc, AdsTable{$ENDIF}
   {$IFDEF ADO}, AdoDB{$ENDIF}
   {$IFDEF DAO}, DAODatabase, DAOTable, DAOQuery, DAODataset, DAOMDTable, DAOQueryDef{$ENDIF}
   {$IFDEF IBX}, IBCustomDataSet, IBTable, IBQuery{$ENDIF}
   {$IFDEF CDS}, DBClient{$ENDIF};

type
   TExDBGridCtlsForm = class(TForm)
      Memo1: TMemo;
      ScrollBox1: TScrollBox;
      AdvStatusBar1: TAdvStatusBar;
      DBImage: TImage;
      PopupMenu: TPopupMenu;
      Cut1: TMenuItem;
      Copy1: TMenuItem;
      Paste1: TMenuItem;
      N1: TMenuItem;
      Clear1: TMenuItem;
      OpenDialog: TOpenPictureDialog;
      SaveDialog: TSaveDialog;
      N2: TMenuItem;
      Open1: TMenuItem;
      Save1: TMenuItem;
      Panel1: TPanel;
      Okbtn: TSpeedButton;
      Panel2: TPanel;
      Cancelbtn: TSpeedButton;
      RichEdit1: TRichEdit;
      Panel3: TPanel;
      SaveAsbtn: TSpeedButton;
      Panel4: TPanel;
      PrintBtn: TSpeedButton;
      SaveAsDialog: TSaveDialog;
      PrintDialog: TPrintDialog;
      procedure CancelbtnClick(Sender: TObject);
      procedure OkbtnClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure MenuClick(Sender: TObject);
      procedure FileOpen(Sender: TObject);
      procedure SavebtnClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure Memo1KeyPress(Sender: TObject; var Key: Char);
      procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
      procedure SaveAsbtnClick(Sender: TObject);
      procedure PrintBtnClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
      FBlobCaption: string;
      FBlobField: TField;
      FDataSource: TDataSource;
      function GetBlobSize(Field: TBlobField): Longint;
      procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); message WM_ERASEBKGND;
   public
      { Public declarations }
      property BlobCaption: string read FBlobCaption write FBlobCaption;
      property BlobField: TField read FBlobField write FBlobField;
      property DataSource: TDataSource read FDataSource write FDataSource;
   end;

procedure WMEraseBkgndEx(WinControl: TWinControl; var Message: TWmEraseBkgnd);

var
   ExDBGridCtlsForm: TExDBGridCtlsForm;

procedure PrintStrings(Strings: TStrings);

implementation

{$R *.DFM}

procedure TExDBGridCtlsForm.CancelbtnClick(Sender: TObject);
begin
   ExDBGridCtlsForm.ModalResult := mrCancel;
end;

procedure TExDBGridCtlsForm.OkbtnClick(Sender: TObject);
var
   ImageInfo: Boolean;
   {$IFDEF BDE}
   BLOBStream: TBLOBStream;
   {$ENDIF}
   {$IFDEF ADO}
   ADOBLOBStream: TADOBLOBStream;
   {$ENDIF}
   {$IFDEF CDS}
   ClientBLOBStream: TClientBLOBStream;
   {$ENDIF}
begin
   if Memo1.Visible = True then
      begin
         if Assigned(FDataSource) then
            begin
               {$IFDEF BDE}
               if (FDataSource.DataSet is TTable) then
                  begin
                     if (TTable(FDataSource.DataSet).ReadOnly = False) then
                        begin
                           FDataSource.DataSet.Edit;
                           FBlobField.AsString := Memo1.Lines.Text;
                        end;
                  end
               else
                  if (FDataSource.DataSet is TQuery) then
                     begin
                        if (TQuery(FDataSource.DataSet).CanModify = True) then
                           begin
                              FDataSource.DataSet.Edit;
                              FBlobField.AsString := Memo1.Lines.Text;
                           end;
                        {$ENDIF}
                        {$IFDEF ADS}
                     end
                  else
                     if (FDataSource.DataSet is TAdsTable) then
                        begin
                           if (TAdsTable(FDataSource.DataSet).Readonly = False) then
                              begin
                                 FDataSource.DataSet.Edit;
                                 FBlobField.Assign(Memo1.Lines);
                              end;
                        end
                     else
                        if (FDataSource.DataSet is TAdsQuery) then
                           begin
                              if (TAdsQuery(FDataSource.DataSet).CanModify = True) then
                                 begin
                                    FDataSource.DataSet.Edit;
                                    FBlobField.Assign(Memo1.Lines);
                                 end;
                              {$ENDIF}
                              {$IFDEF ADO}
                           end
                        else
                           if (FDataSource.DataSet is TADOTable) then
                              begin
                                 if (TADOTable(FDataSource.DataSet).Readonly = False) then
                                    begin
                                       FDataSource.DataSet.Edit;
                                       FBlobField.Assign(Memo1.Lines);
                                    end;
                              end
                           else
                              if (FDataSource.DataSet is TADOQuery) then
                                 begin
                                    if (TADOQuery(FDataSource.DataSet).CanModify = True) then
                                       begin
                                          FDataSource.DataSet.Edit;
                                          FBlobField.Assign(Memo1.Lines);
                                       end;
                                    {$ENDIF}
                                    {$IFDEF DAO}
                                 end
                              else
                                 if (FDataSource.DataSet is TDAOTable) then
                                    begin
                                       if not (TDAOTable(FDataSource.DataSet).Parameters = [db_ReadOnly]) then
                                          begin
                                             FDataSource.DataSet.Edit;
                                             FBlobField.Assign(Memo1.Lines);
                                          end;
                                    end
                                 else
                                    if (FDataSource.DataSet is TDAOQuery) or (FDataSource.DataSet is TDAOQueryDef) then
                                       begin
                                          if (TDAOQuery(FDataSource.DataSet).CanModify = True) or (TDAOQueryDef(FDataSource.DataSet).CanModify = True) then
                                             begin
                                                FDataSource.DataSet.Edit;
                                                FBlobField.Assign(Memo1.Lines);
                                             end;
                                          {$ENDIF}
                                          {$IFDEF IBX}
                                       end
                                    else
                                       if (FDataSource.DataSet is TIBTable) then
                                          begin
                                             if (TIBTable(FDataSource.DataSet).ReadOnly = False) then
                                                begin
                                                   FDataSource.DataSet.Edit;
                                                   FBlobField.AsString := Memo1.Lines.Text;
                                                end;
                                          end
                                       else
                                          if (FDataSource.DataSet is TIBQuery) then
                                             begin
                                                if (TIBQuery(FDataSource.DataSet).CanModify = True) then
                                                   begin
                                                      FDataSource.DataSet.Edit;
                                                      FBlobField.AsString := Memo1.Lines.Text;
                                                   end;
                                                {$ENDIF}
                                                {$IFDEF CDS}
                                             end
                                          else
                                             if (FDataSource.DataSet is TClientDataSet) then
                                                begin
                                                   if (TClientDataSet(FDataSource.DataSet).ReadOnly = False) then
                                                      begin
                                                         FDataSource.DataSet.Edit;
                                                         FBlobField.AsString := Memo1.Lines.Text;
                                                      end;
                                                   {$ENDIF}
                                                end;
            end
         else
            raise(Exception.Create('Datasource Not Assigned'));
      end
   else
      if RichEdit1.Visible = True then
         begin
            if Assigned(FDataSource) then
               begin
                  {$IFDEF BDE}
                  if (FDataSource.DataSet is TTable) then
                     begin
                        if (TTable(FDataSource.DataSet).ReadOnly = False) then
                           begin
                              FDataSource.DataSet.Edit;
                              FBlobField.Assign(RichEdit1.Lines);
                           end;
                     end
                  else
                     if (FDataSource.DataSet is TQuery) then
                        begin
                           if (TQuery(FDataSource.DataSet).CanModify = True) then
                              begin
                                 FDataSource.DataSet.Edit;
                                 FBlobField.Assign(RichEdit1.Lines);
                              end;
                           {$ENDIF}
                           {$IFDEF ADS}
                        end
                     else
                        if (FDataSource.DataSet is TAdsTable) then
                           begin
                              if (TAdsTable(FDataSource.DataSet).Readonly = False) then
                                 begin
                                    FDataSource.DataSet.Edit;
                                    FBlobField.Assign(RichEdit1.Lines);
                                 end;
                           end
                        else
                           if (FDataSource.DataSet is TAdsQuery) then
                              begin
                                 if (TAdsQuery(FDataSource.DataSet).CanModify = True) then
                                    begin
                                       FDataSource.DataSet.Edit;
                                       FBlobField.Assign(RichEdit1.Lines);
                                    end;
                                 {$ENDIF}
                                 {$IFDEF ADO}
                              end
                           else
                              if (FDataSource.DataSet is TADOTable) then
                                 begin
                                    if (TADOTable(FDataSource.DataSet).Readonly = False) then
                                       begin
                                          FDataSource.DataSet.Edit;
                                          FBlobField.Assign(RichEdit1.Lines);
                                       end;
                                 end
                              else
                                 if (FDataSource.DataSet is TADOQuery) then
                                    begin
                                       if (TADOQuery(FDataSource.DataSet).CanModify = True) then
                                          begin
                                             FDataSource.DataSet.Edit;
                                             FBlobField.Assign(RichEdit1.Lines);
                                          end;
                                       {$ENDIF}
                                       {$IFDEF DAO}
                                    end
                                 else
                                    if (FDataSource.DataSet is TDAOTable) then
                                       begin
                                          if not (TDAOTable(FDataSource.DataSet).Parameters = [db_ReadOnly]) then
                                             begin
                                                FDataSource.DataSet.Edit;
                                                FBlobField.Assign(RichEdit1.Lines);
                                             end;
                                       end
                                    else
                                       if (FDataSource.DataSet is TDAOQuery) or (FDataSource.DataSet is TDAOQueryDef) then
                                          begin
                                             if (TDAOQuery(FDataSource.DataSet).CanModify = True) or (TDAOQueryDef(FDataSource.DataSet).CanModify = True) then
                                                begin
                                                   FDataSource.DataSet.Edit;
                                                   FBlobField.Assign(RichEdit1.Lines);
                                                end;
                                             {$ENDIF}
                                             {$IFDEF IBX}
                                          end
                                       else
                                          if (FDataSource.DataSet is TIBTable) then
                                             begin
                                                if (TIBTable(FDataSource.DataSet).Readonly = False) then
                                                   begin
                                                      FDataSource.DataSet.Edit;
                                                      FBlobField.Assign(RichEdit1.Lines);
                                                   end;
                                             end
                                          else
                                             if (FDataSource.DataSet is TIBQuery) then
                                                begin
                                                   if (TIBQuery(FDataSource.DataSet).CanModify = True) then
                                                      begin
                                                         FDataSource.DataSet.Edit;
                                                         FBlobField.Assign(RichEdit1.Lines);
                                                      end;
                                                   {$ENDIF}
                                                   {$IFDEF CDS}
                                                end
                                             else
                                                if (FDataSource.DataSet is TClientDataSet) then
                                                   begin
                                                      if (TClientDataSet(FDataSource.DataSet).Readonly = False) then
                                                         begin
                                                            FDataSource.DataSet.Edit;
                                                            FBlobField.Assign(RichEdit1.Lines);
                                                         end;
                                                      {$ENDIF}
                                                   end;
               end
            else
               raise(Exception.Create('Datasource Not Assigned'));
         end
      else
         begin
            if FDataSource.State in [dsEdit, dsInsert] then
               begin
                  {$IFDEF JPEGGRAPHICS}
                  ImageInfo := DBImage.Picture.Graphic is TJPEGImage;

                  if ImageInfo then
                     begin
                        try
                           {$IFDEF BDE}
                           BlobStream := TBLOBStream.Create(TBlobField(FBlobField), bmReadWrite);
                           BlobStream.Seek(0, soFromBeginning);
                           BlobStream.Truncate;
                           DBImage.Picture.Graphic.SaveToStream(BlobStream);
                           BlobStream.Free;
                           {$ENDIF}
                        except
                           try
                              {$IFDEF ADO}
                              ADOBlobStream := TADOBLOBStream.Create(TBlobField(FBlobField), bmReadWrite);
                              ADOBlobStream.Seek(0, soFromBeginning);
                              ADOBlobStream.Truncate;
                              DBImage.Picture.Graphic.SaveToStream(ADOBlobStream);
                              ADOBlobStream.Free;
                              {$ENDIF}
                           except
                              {$IFDEF CDS}
                              if FDataSource.DataSet is TClientDataSet then
                                 begin
                                    ClientBlobStream := TClientBLOBStream.Create(TBlobField(FBlobField), bmReadWrite);
                                    ClientBlobStream.Seek(0, soFromBeginning);
                                    ClientBlobStream.Truncate;
                                    DBImage.Picture.Graphic.SaveToStream(BlobStream);
                                    ClientBlobStream.Free;
                                 end;
                              {$ENDIF}
                           end;
                        end;
                     end
                  else
                     {$ENDIF}
                     begin
                        FDataSource.DataSet.FieldByName(FBlobField.FieldName).Assign(DBImage.Picture);
                     end;
               end;
         end;

   ExDBGridCtlsForm.ModalResult := mrYes;
end;

procedure TExDBGridCtlsForm.FormActivate(Sender: TObject);
var
   {$IFDEF JPEGGRAPHICS}
   {$IFDEF BDE}
   JPEGStream: TBLOBStream;
   {$ENDIF}
   {$IFDEF ADO}
   ADOJPEGStream: TADOBLOBStream;
   {$ENDIF}
   {$IFDEF CDS}
   ClientJPEGStream: TClientBLOBStream;
   {$ENDIF}
   {$ENDIF}
   {$IFDEF OLEGRAPHICS}
   MS1: TMemoryStream;
   {$ENDIF}
   {$IFDEF JPEGGRAPHICS}
   JPEGImage: TJPEGImage;
   {$ENDIF}
   BmpImage: TBitmap;
   BlobSize: string;
begin
   {$IFDEF JPEGGRAPHICS}
   {$IFDEF BDE}
   JPEGStream := nil;
   {$ENDIF}
   {$IFDEF ADO}
   ADOJPEGStream := nil;
   {$ENDIF}
   {$IFDEF CDS}
   ClientJPEGStream := nil;
   {$ENDIF}
   {$ENDIF}
   {$IFDEF OLEGRAPHICS}
   MS1 := nil;
   {$ENDIF}
   {$IFDEF JPEGGRAPHICS}
   JPEGImage := nil;
   {$ENDIF}
   BmpImage := nil;

   ExDBGridCtlsForm.Caption := FBlobCaption;

   if ((FBlobField is TMemoField) or (FBlobField.DataType = ftBytes)) and (FBlobField.DataType <> ftFmtMemo) then
      begin
         Memo1.Lines.Text := FBlobField.AsString;
         {$IFDEF BDE}
         if (FDataSource.DataSet is TTable) then
            begin
               if (TTable(FDataSource.DataSet).Readonly) then
                  Memo1.ReadOnly := True;
            end
         else
            if (FDataSource.DataSet is TQuery) then
               begin
                  if (TQuery(FDataSource.DataSet).CanModify = False) then
                     Memo1.ReadOnly := True;
               end;
         {$ENDIF}
         {$IFDEF ADS}
         if (FDataSource.DataSet is TAdsTable) then
            begin
               if (TAdsTable(FDataSource.DataSet).Readonly) then
                  Memo1.ReadOnly := True;
            end
         else
            if (FDataSource.DataSet is TAdsQuery) then
               begin
                  if (TAdsQuery(FDataSource.DataSet).CanModify = False) then
                     Memo1.ReadOnly := True;
               end;
         {$ENDIF}
         {$IFDEF ADO}
         if (FDataSource.DataSet is TADOTable) then
            begin
               if (TADOTable(FDataSource.DataSet).Readonly) then
                  Memo1.ReadOnly := True;
            end
         else
            if (FDataSource.DataSet is TADOQuery) then
               begin
                  if (TADOQuery(FDataSource.DataSet).CanModify = False) then
                     Memo1.ReadOnly := True;
               end;
         {$ENDIF}
         {$IFDEF DAO}
         if (FDataSource.DataSet is TDAOTable) then
            begin
               if (TDAOTable(FDataSource.DataSet).Parameters = [db_ReadOnly]) then
                  Memo1.ReadOnly := True;
            end
         else
            if (FDataSource.DataSet is TDAOQuery) or (FDataSource.DataSet is TDAOQueryDef) then
               begin
                  if (TDAOQuery(FDataSource.DataSet).CanModify = False) or (TDAOQueryDef(FDataSource.DataSet).CanModify = False) then
                     Memo1.ReadOnly := True;
               end;
         {$ENDIF}
         {$IFDEF IBX}
         if (FDataSource.DataSet is TIBTable) then
            begin
               if (TIBTable(FDataSource.DataSet).Readonly) then
                  Memo1.ReadOnly := True;
            end
         else
            if (FDataSource.DataSet is TIBQuery) then
               begin
                  if (TIBQuery(FDataSource.DataSet).CanModify = False) then
                     Memo1.ReadOnly := True;
               end;
         {$ENDIF}
         {$IFDEF CDS}
         if (FDataSource.DataSet is TClientDataSet) then
            begin
               if (TClientDataSet(FDataSource.DataSet).CanModify = False) then
                  Memo1.ReadOnly := True;
            end;
         {$ENDIF}
         Memo1.Visible := True;
         Panel3.Visible := True;
         Panel4.Visible := True;
      end
   else
      if not ((FBlobField is TMemoField) or (FBlobField.DataType = ftBytes)) and (FBlobField.DataType <> ftFmtMemo) and (FBlobField is TBlobField) then
         begin
            try
               try
                  try
                     DBImage.Picture.Assign(FBlobField);
                     try
                        BlobSize := IntToStr(GetBlobSize(TBlobField(FBlobField)));
                        ExDBGridCtlsForm.Caption := '';
                        ExDBGridCtlsForm.Caption := FBlobCaption + ' - Bitmap Image - ' + BlobSize + 'Kb';
                     except
                        ExDBGridCtlsForm.Caption := '';
                        ExDBGridCtlsForm.Caption := FBlobCaption + ' - Bitmap Image';
                     end;
                  except
                     {$IFDEF OLEGRAPHICS}
                     try
                        MS1 := TMemoryStream.Create;
                        TBlobField(FBlobField).SaveToStream(MS1);
                        MS1.Seek(78, soFromBeginning);

                        try
                           BlobSize := IntToStr(GetBlobSize(TBlobField(FBlobField)));
                           ExDBGridCtlsForm.Caption := '';
                           ExDBGridCtlsForm.Caption := FBlobCaption + ' - OLE Bitmap Image - ' + BlobSize + 'Kb';
                        except
                           ExDBGridCtlsForm.Caption := '';
                           ExDBGridCtlsForm.Caption := FBlobCaption + ' - OLE Bitmap Image';
                        end;

                        BmpImage := TBitmap.Create;
                        BmpImage.LoadFromStream(MS1);

                        DBImage.Picture.Assign(BmpImage);
                     finally
                        MS1.Free;
                        BmpImage.Free;
                     end;
                     {$ENDIF}
                  end;
               except
                  {$IFDEF JPEGGRAPHICS}
                  try
                     try
                        {$IFDEF BDE}
                        JPEGStream := TBLOBStream.Create(TBlobField(FBlobField), bmRead);
                        {$ENDIF}
                     except
                        try
                           {$IFDEF ADO}
                           ADOJPEGStream := TADOBLOBStream.Create(TBlobField(FBlobField), bmRead);
                           {$ENDIF}
                        except
                           {$IFDEF CDS}
                           if FDataSource.DataSet is TClientDataSet then
                              ClientJPEGStream := TClientBLOBStream.Create(TBlobField(FBlobField), bmRead);
                           {$ENDIF}
                        end;
                     end;

                     try
                        BlobSize := IntToStr(GetBlobSize(TBlobField(FBlobField)));
                        ExDBGridCtlsForm.Caption := '';
                        ExDBGridCtlsForm.Caption := FBlobCaption + ' - Jpeg Image - ' + BlobSize + 'Kb';
                     except
                        ExDBGridCtlsForm.Caption := '';
                        ExDBGridCtlsForm.Caption := FBlobCaption + ' - Jpeg Image';
                     end;

                     JPegImage := TJPEGImage.Create;
                     try
                        {$IFDEF BDE}
                        JPegImage.LoadFromStream(JPegStream);
                        {$ENDIF}
                     except
                        try
                           {$IFDEF ADO}
                           JPegImage.LoadFromStream(ADOJPegStream);
                           {$ENDIF}
                        except
                           {$IFDEF CDS}
                           if FDataSource.DataSet is TClientDataSet then
                              JPegImage.LoadFromStream(ClientJPegStream);
                           {$ENDIF}
                        end;
                     end;

                     DBImage.Picture.Assign(JPegImage);
                  finally
                     try
                        {$IFDEF BDE}
                        if Assigned(JPegStream) then
                           JPegStream.Free;
                        {$ENDIF}
                     except
                        try
                           {$IFDEF ADO}
                           if Assigned(ADOJPegStream) then
                              ADOJPegStream.Free;
                           {$ENDIF}
                        except
                           {$IFDEF CDS}
                           if FDataSource.DataSet is TClientDataSet then
                              begin
                                 if Assigned(ClientJPegStream) then
                                    ClientJPegStream.Free;
                              end;
                           {$ENDIF}
                        end;
                     end;
                     JPegImage.Free;
                  end;
                  {$ENDIF}
               end;

               ScrollBox1.Visible := True;
               Panel3.Visible := False;
               Panel4.Visible := False;
            except
               CancelbtnClick(Self);
               Close;
               //ExDBGridCtlsForm.ModalResult := mrCancel;
            end;
         end
      else
         if (FBlobField is TMemoField) or (FBlobField.DataType = ftFmtMemo) then
            begin
               RichEdit1.Lines.Assign(FBlobField);
               {$IFDEF BDE}
               if (FDataSource.DataSet is TTable) then
                  begin
                     if (TTable(FDataSource.DataSet).Readonly) then
                        RichEdit1.ReadOnly := True;
                  end
               else
                  if (FDataSource.DataSet is TQuery) then
                     begin
                        if (TQuery(FDataSource.DataSet).CanModify = False) then
                           RichEdit1.ReadOnly := True;
                     end;
               {$ENDIF}
               {$IFDEF ADS}
               if (FDataSource.DataSet is TAdsTable) then
                  begin
                     if (TAdsTable(FDataSource.DataSet).Readonly) then
                        RichEdit1.ReadOnly := True;
                  end
               else
                  if (FDataSource.DataSet is TAdsQuery) then
                     begin
                        if (TAdsQuery(FDataSource.DataSet).CanModify = False) then
                           RichEdit1.ReadOnly := True;
                     end;
               {$ENDIF}
               {$IFDEF ADO}
               if (FDataSource.DataSet is TADOTable) then
                  begin
                     if (TADOTable(FDataSource.DataSet).Readonly) then
                        RichEdit1.ReadOnly := True;
                  end
               else
                  if (FDataSource.DataSet is TADOQuery) then
                     begin
                        if (TADOQuery(FDataSource.DataSet).CanModify = False) then
                           RichEdit1.ReadOnly := True;
                     end;
               {$ENDIF}
               {$IFDEF DAO}
               if (FDataSource.DataSet is TDAOTable) then
                  begin
                     if (TDAOTable(FDataSource.DataSet).Parameters = [db_ReadOnly]) then
                        RichEdit1.ReadOnly := True;
                  end
               else
                  if (FDataSource.DataSet is TDAOQuery) or (FDataSource.DataSet is TDAOQueryDef) then
                     begin
                        if (TDAOQuery(FDataSource.DataSet).CanModify = False) or (TDAOQueryDef(FDataSource.DataSet).CanModify = False) then
                           RichEdit1.ReadOnly := True;
                     end;
               {$ENDIF}
               {$IFDEF IBX}
               if (FDataSource.DataSet is TIBTable) then
                  begin
                     if (TIBTable(FDataSource.DataSet).Readonly) then
                        RichEdit1.ReadOnly := True;
                  end
               else
                  if (FDataSource.DataSet is TIBQuery) then
                     begin
                        if (TIBQuery(FDataSource.DataSet).CanModify = False) then
                           RichEdit1.ReadOnly := True;
                     end;
               {$ENDIF}
               {$IFDEF CDS}
               if (FDataSource.DataSet is TClientDataSet) then
                  begin
                     if (TClientDataSet(FDataSource.DataSet).CanModify = False) then
                        RichEdit1.ReadOnly := True;
                  end;
               {$ENDIF}
               RichEdit1.Visible := True;
               Panel3.Visible := True;
               Panel4.Visible := True;
            end;
end;

procedure TExDBGridCtlsForm.MenuClick(Sender: TObject);
begin
   case Integer(TMenuItem(Sender).Tag) of
      1: DBImage.Perform(WM_CUT, 0, 0);
      2: DBImage.Perform(WM_COPY, 0, 0);
      3: DBImage.Perform(WM_PASTE, 0, 0);
      4: DBImage.Picture.Graphic := nil;
   end;
end;

procedure TExDBGridCtlsForm.FileOpen(Sender: TObject);
begin
   with OpenDialog do
      if Execute then
         DBImage.Picture.LoadFromFile(FileName);
end;

procedure TExDBGridCtlsForm.SavebtnClick(Sender: TObject);
begin
   with SaveDialog do
      if Execute then
         begin
            DBImage.Picture.SaveToFile(FileName);
            ShowMessage(FileName + ' Saved !');
         end;
end;

procedure TExDBGridCtlsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      ExDBGridCtlsForm.ModalResult := mrCancel;
end;

procedure TExDBGridCtlsForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      ExDBGridCtlsForm.ModalResult := mrCancel;
end;

procedure TExDBGridCtlsForm.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
      ExDBGridCtlsForm.ModalResult := mrCancel;
end;

function TExDBGridCtlsForm.GetBlobSize(Field: TBlobField): Longint;
begin
   Result := 0;
   try
      {$IFDEF BDE}
      with TBlobStream.Create(Field, bmRead) do
         try
            Result := Seek(0, 2);
         finally
            Free;
         end;
      {$ENDIF}
   except
      try
         {$IFDEF ADO}
         with TADOBlobStream.Create(Field, bmRead) do
            try
               Result := Seek(0, 2);
            finally
               Free;
            end;
         {$ENDIF}
      except
         {$IFDEF CDS}
         if FDataSource.DataSet is TClientDataSet then
            begin
               with TClientBlobStream.Create(Field, bmRead) do
                  try
                     Result := Seek(0, 2);
                  finally
                     Free;
                  end;
            end;
         {$ENDIF}
      end;
   end;
end;

procedure TExDBGridCtlsForm.SaveAsbtnClick(Sender: TObject);
var
   F1: TextFile;
   i: integer;
begin
   if Memo1.Visible then
      begin
         with SaveAsDialog do
            begin
               if Execute then
                  begin
                     AssignFile(F1, FileName);
                     Rewrite(F1);
                     for i := 0 to Memo1.Lines.Count - 1 do
                        begin
                           Write(F1, Memo1.Lines[i] + #13 + #10);
                        end;
                     CloseFile(F1);
                     ShowMessage(FileName + ' Saved !');
                  end;
            end;
      end
   else
      begin
         with SaveAsDialog do
            begin
               if Execute then
                  begin
                     AssignFile(F1, FileName);
                     Rewrite(F1);
                     for i := 0 to RichEdit1.Lines.Count - 1 do
                        begin
                           Write(F1, RichEdit1.Lines[i] + #13 + #10);
                        end;
                     CloseFile(F1);
                     ShowMessage(FileName + ' Saved !');
                  end;
            end;
      end;
end;

procedure TExDBGridCtlsForm.PrintBtnClick(Sender: TObject);
begin
   if Memo1.Visible then
      begin
         if PrintDialog.Execute then
            begin
               PrintStrings(Memo1.Lines);
            end;
      end
   else
      begin
         if PrintDialog.Execute then
            begin
               RichEdit1.Print(BlobCaption);
            end;
      end;
end;

procedure PrintStrings(Strings: TStrings);
var
   Prn: TextFile;
   i: word;
begin
   AssignPrn(Prn);
   try
      Rewrite(Prn);
      try
         for i := 0 to Strings.Count - 1 do
            writeln(Prn, Strings.Strings[i]);
      finally
         CloseFile(Prn);
      end;
   except
      on EInOutError do
         MessageDlg('Error Printing Text.', mtError, [mbOk], 0);
   end;
end;

procedure TExDBGridCtlsForm.FormCreate(Sender: TObject);
begin
   Self.ControlStyle := ControlStyle + [csOpaque];
   Perform(WM_PAINT, 0, 0);
end;

procedure TExDBGridCtlsForm.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
   WMEraseBkgndEx(Self, Msg);
end;

procedure WMEraseBkgndEx(WinControl: TWinControl; var Message: TWmEraseBkgnd);
var
   i, Clip, SaveIndex: Integer;
begin
   with WinControl do
      {$IFDEF EX_COMPILER_3}
      if (TMessage(Message).wParam = TMessage(Message).lParam) then
         {$ELSE}
      if not DoubleBuffered or (TMessage(Message).wParam = TMessage(Message).lParam) then
         {$ENDIF}
         begin
            SaveIndex := SaveDC(Message.DC);
            Clip := SimpleRegion;

            if ControlCount > 0 then
               begin
                  for i := 0 to ControlCount - 1 do
                     if not (Controls[i] is TWinControl) then
                        with Controls[i] do
                           begin
                              if (Visible or (csDesigning in ComponentState) and
                                 not (csNoDesignVisible in ControlStyle)) and
                                 (csOpaque in ControlStyle) then
                                 begin
                                    Clip := ExcludeClipRect(Message.DC, Left, Top, Left + Width, Top + Height);
                                    if Clip = NullRegion then
                                       break;
                                 end;
                           end;
               end;

            if Clip <> NullRegion then
               FillRect(Message.DC, ClientRect, Brush.Handle);

            RestoreDC(Message.DC, SaveIndex);
         end;
   Message.Result := 1;
end;

end.

