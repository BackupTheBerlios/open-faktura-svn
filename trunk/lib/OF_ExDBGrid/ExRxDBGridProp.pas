{
ExDBGrid Component Suite Version 3.9 - ExRxDBGridProp

Original Design Copyright (©) 1998 GExperts Inc
Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExRxDBGridProp;

interface

uses
   SysUtils, Classes, Controls, Forms, Dialogs,
   {$IFDEF EX_COMPILER_6_UP}
   DesignIntf, DesignEditors,
   {$ELSE}
   DsgnIntf,
   {$ENDIF}
   StdCtrls, Buttons, Graphics, {$IFDEF JEDI}JvJclUtils{$ELSE}FileUtil{$ENDIF},
   ExRxDBGrid;

type
   TExRxDBGridControlsEditor = class(TPropertyEditor)
   public
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
      function GetValue: string; override;
   end;

   TfmExRxDBGridProp = class(TForm)
      GroupBoxFields: TGroupBox;
      lbFields: TListBox;
      GroupBoxSelected: TGroupBox;
      lbSelected: TListBox;
      sbAdd: TSpeedButton;
      sbDelete: TSpeedButton;
      LabelControl: TLabel;
      cbControl: TComboBox;
      btnOK: TButton;
      btnCancel: TButton;
      procedure FormCreate(Sender: TObject);
      procedure lbSelectedClick(Sender: TObject);
      procedure cbControlClick(Sender: TObject);
      procedure sbAddClick(Sender: TObject);
      procedure sbDeleteClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
   private
      procedure SetControl(Name: string);
   public
      ExRxDBGridControls: TExRxDBGridControls;
      Grid: TExRxDBGrid;
      procedure Initialize;
   end;

type
   TFilenameProperty = class(TStringProperty)
   protected
      function GetFilter: string; virtual;
   public
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
   end;

const
   {$IFDEF ENGLISH}
   lsFormCaption = 'Set Grid Controls';
   lsCurrentFields = ' Current Fields ';
   lsSelectedFields = ' Selected Fields ';
   lsLabelControl = 'Control :';
   lsBtnCancel = '&Cancel';
   lsDataSourceNeeded = 'Grid needs a datasource to be set before controls can be edited.';
   lsDataSetNeeded = 'Grid needs a dataset linked to datasource before controls can be edited.';
   lsAlreadyAdded = 'Field "%s" has already been added.';
   lsDefaultFilter = 'All Files (*.*)|*.*';
   {$ENDIF}
   {$IFDEF FRENCH}
   lsFormCaption = 'Affectation des contrôles';
   lsCurrentFields = ' Champs existants ';
   lsSelectedFields = ' Champs sélectionnés ';
   lsLabelControl = 'Contrôle :';
   lsBtnCancel = '&Annuler';
   lsDataSourceNeeded = 'Vous devez choisir une source de données (datasource) avant d''affecter les contrôles.';
   lsDataSetNeeded = 'Vous devez lier la source à un ensemble de données (dataset) avant d''affecter les contrôles.';
   lsAlreadyAdded = 'Le champ "%s" a déjà été sélectionné.';
   lsDefaultFilter = 'Tous les fichiers (*.*)|*.*';
   {$ENDIF}
   {$IFDEF GERMAN}
   lsFormCaption = 'Set Grid Controls';
   lsCurrentFields = ' aktuelle Felder ';
   lsSelectedFields = ' ausgewähltes Feld ';
   lsLabelControl = 'Control :';
   lsBtnCancel = '&Abbruch';
   lsDataSourceNeeded = 'Grid needs a datasource to be set before controls can be edited.';
   lsDataSetNeeded = 'Grid needs a dataset linked to datasource before controls can be edited.';
   lsAlreadyAdded = 'Feld "%s" wurde bereits hinzugefügt.';
   lsDefaultFilter = 'Alle Dateien (*.*)|*.*';
   {$ENDIF}

var
   fmExRxDBGridProp: TfmExRxDBGridProp;

implementation

{$R *.DFM}

procedure TExRxDBGridControlsEditor.Edit;
var
   Dlg: TfmExRxDBGridProp;
   CloseDataset: Boolean;
begin
   CloseDataset := False;

   if TExRxDBGrid(GetComponent(0)).DataSource = nil then
      raise Exception.Create(lsDataSourceNeeded);

   if TExRxDBGrid(GetComponent(0)).DataSource.DataSet = nil then
      raise Exception.Create(lsDataSetNeeded);

   if not TExRxDBGrid(GetComponent(0)).DataSource.DataSet.Active then
      begin
         TExRxDBGrid(GetComponent(0)).DataSource.DataSet.Open;
         CloseDataset := True;
      end;

   Dlg := TfmExRxDBGridProp.Create(Application);
   try
      Dlg.ExRxDBGridControls.Assign(TExRxDBGridControls(GetOrdValue));
      Dlg.Grid := TExRxDBGrid(GetComponent(0));
      Dlg.Initialize;
      Dlg.Caption := lsFormCaption;
      Dlg.ShowModal;
      if Dlg.ModalResult = mrOk then
         begin
            TExRxDBGridControls(GetOrdValue).Assign(Dlg.ExRxDBGridControls);
            Modified;
         end;
   finally
      Dlg.Free;
      if CloseDataset then
         begin
            TExRxDBGrid(GetComponent(0)).DataSource.DataSet.Close;
         end;
   end;
end;

function TExRxDBGridControlsEditor.GetAttributes: TPropertyAttributes;
begin
   Result := [paDialog, paReadOnly];
end;

function TExRxDBGridControlsEditor.GetValue: string;
begin
   Result := '(' + GetPropType^.Name + ')';
end;

procedure TfmExRxDBGridProp.FormCreate(Sender: TObject);
begin
   ExRxDBGridControls := TExRxDBGridControls.Create(nil);
   GroupBoxFields.Caption := lsCurrentFields;
   GroupBoxSelected.Caption := lsSelectedFields;
   LabelControl.Caption := lsLabelControl;
   btnCancel.Caption := lsBtnCancel;
end;

procedure TfmExRxDBGridProp.Initialize;
var
   i: Integer;
begin
   for i := 0 to Grid.Columns.Count - 1 do
      lbFields.Items.Add(Grid.Columns.Items[i].FieldName);

   for i := 0 to ExRxDBGridControls.Count - 1 do
      lbSelected.Items.Add(ExRxDBGridControls.Items[i].FieldName);

   for i := 0 to Grid.Owner.ComponentCount - 1 do
      if Grid.Owner.Components[i] is TWinControl then
         cbControl.Items.Add(Grid.Owner.Components[i].Name);

   lbSelectedClick(lbSelected);
end;

procedure TfmExRxDBGridProp.SetControl(Name: string);
var
   i: Integer;
begin
   for i := 0 to cbControl.Items.Count - 1 do
      if CompareText(Name, cbControl.Items[i]) = 0 then
         begin
            cbControl.ItemIndex := i;
            Exit;
         end;
   cbControl.ItemIndex := -1;
end;

procedure TfmExRxDBGridProp.lbSelectedClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      begin
         cbControl.Enabled := True;
         cbControl.Color := clWindow;
         SetControl(ExRxDBGridControls.Items[lbSelected.ItemIndex].ControlName);
      end
   else
      begin
         cbControl.Enabled := False;
         cbControl.Color := clBtnface;
      end;
end;

procedure TfmExRxDBGridProp.cbControlClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      ExRxDBGridControls.Items[lbSelected.ItemIndex].ControlName := cbControl.Text;
end;

procedure TfmExRxDBGridProp.sbAddClick(Sender: TObject);
begin
   if (lbFields.ItemIndex >= 0) then
      begin
         if (lbSelected.Items.Indexof(lbFields.Items[lbFields.ItemIndex]) < 0) then
            begin
               lbSelected.Items.Add(lbFields.Items[lbFields.ItemIndex]);

               with ExRxDBGridControls.Add do
                  FieldName := lbFields.Items[lbFields.ItemIndex];
            end
         else
            MessageDlg(Format(lsAlreadyAdded, [lbFields.Items[lbFields.ItemIndex]]), mtWarning, [mbOK], 0);
      end;
end;

procedure TfmExRxDBGridProp.sbDeleteClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      begin
         ExRxDBGridControls.Items[lbSelected.ItemIndex].Free;
         lbSelected.Items.Delete(lbSelected.ItemIndex);
      end;
end;

procedure TfmExRxDBGridProp.FormDestroy(Sender: TObject);
begin
   ExRxDBGridControls.Free;
end;

function TFilenameProperty.GetFilter: string;
begin
   Result := lsDefaultFilter;
end;

procedure TFilenameProperty.Edit;
var
   FileOpen: TOpenDialog;
begin
   FileOpen := TOpenDialog.Create(Application);
   try
      FileOpen.Filename := GetValue;
      FileOpen.InitialDir := ExtractFilePath(FileOpen.Filename);

      if (ExtractFileName(FileOpen.Filename) = '') or not ValidFileName(ExtractFileName(FileOpen.Filename)) then
         FileOpen.Filename := '';

      FileOpen.Filter := GetFilter;
      FileOpen.Options := FileOpen.Options + [ofHideReadOnly];

      if FileOpen.Execute then
         SetValue(FileOpen.Filename);
   finally
      FileOpen.Free;
   end;
end;

function TFilenameProperty.GetAttributes: TPropertyAttributes;
begin
   Result := [paDialog, paRevertable];
end;

end.

