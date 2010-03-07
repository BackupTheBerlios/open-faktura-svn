{
ExDBGrid Component Suite Version 3.9 - ExDBGridProp

Original Design Copyright (©) 1998 GExperts Inc
Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExDBGridProp;

interface

uses
   SysUtils, Classes, Controls, Forms, Dialogs,
   {$IFDEF EX_COMPILER_6_UP}
   DesignIntf, DesignEditors,
   {$ELSE}
   DsgnIntf,
   {$ENDIF}
   StdCtrls, Buttons, Graphics, {$IFDEF JEDI}JvJclUtils{$ELSE}FileUtil{$ENDIF},
   ExDBGrid;

type
   TExDBGridControlsEditor = class(TPropertyEditor)
   public
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
      function GetValue: string; override;
   end;

   TfmExDBGridProp = class(TForm)
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
      ExDBGridControls: TExDBGridControls;
      Grid: TExDBGrid;
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
    lsCurrentFields = ' Current Fields ';
    lsSelectedFields = ' Selected Fields ';
    lsLabelControl = 'Control :';
    lsBtnCancel = '&Cancel';
    lsDataSourceNeeded = 'Das Grid benötigt eine Datasource bevor es editiert werden kann.';
    lsDataSetNeeded = 'Das Grid benötigt ein Dataset verbunden mit einer Datasource bevor es editiert werden kann.';
    lsAlreadyAdded = 'Feld "%s" wurde bereits hinzugefügt.';
    lsDefaultFilter = 'Alle Dateien (*.*)|*.*';
    {$ENDIF}

var
   fmExDBGridProp: TfmExDBGridProp;

implementation

{$R *.DFM}

procedure TExDBGridControlsEditor.Edit;
var
   Dlg: TfmExDBGridProp;
   CloseDataset: Boolean;
begin
   CloseDataset := False;

   if TExDBGrid(GetComponent(0)).DataSource = nil then
      raise Exception.Create(lsDataSourceNeeded);

   if TExDBGrid(GetComponent(0)).DataSource.DataSet = nil then
      raise Exception.Create(lsDataSetNeeded);

   if not TExDBGrid(GetComponent(0)).DataSource.DataSet.Active then
      begin
         TExDBGrid(GetComponent(0)).DataSource.DataSet.Open;
         CloseDataset := True;
      end;

   Dlg := TfmExDBGridProp.Create(Application);
   try
      Dlg.ExDBGridControls.Assign(TExDBGridControls(GetOrdValue));
      Dlg.Grid := TExDBGrid(GetComponent(0));
      Dlg.Initialize;
      Dlg.Caption := lsFormCaption;
      Dlg.ShowModal;
      if Dlg.ModalResult = mrOk then
         begin
            TExDBGridControls(GetOrdValue).Assign(Dlg.ExDBGridControls);
            Modified;
         end;
   finally
      Dlg.Free;
      if CloseDataset then
         begin
            TExDBGrid(GetComponent(0)).DataSource.DataSet.Close;
         end;
   end;
end;

function TExDBGridControlsEditor.GetAttributes: TPropertyAttributes;
begin
   Result := [paDialog, paReadOnly];
end;

function TExDBGridControlsEditor.GetValue: string;
begin
   Result := '(' + GetPropType^.Name + ')';
end;

procedure TfmExDBGridProp.FormCreate(Sender: TObject);
begin
   ExDBGridControls := TExDBGridControls.Create(nil);
   GroupBoxFields.Caption := lsCurrentFields;
   GroupBoxSelected.Caption := lsSelectedFields;
   LabelControl.Caption := lsLabelControl;
   btnCancel.Caption := lsBtnCancel;
end;

procedure TfmExDBGridProp.Initialize;
var
   i: Integer;
begin
   for i := 0 to Grid.Columns.Count - 1 do
      lbFields.Items.Add(Grid.Columns.Items[i].FieldName);

   for i := 0 to ExDBGridControls.Count - 1 do
      lbSelected.Items.Add(ExDBGridControls.Items[i].FieldName);

   for i := 0 to Grid.Owner.ComponentCount - 1 do
      if Grid.Owner.Components[i] is TWinControl then
         cbControl.Items.Add(Grid.Owner.Components[i].Name);

   lbSelectedClick(lbSelected);
end;

procedure TfmExDBGridProp.SetControl(Name: string);
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

procedure TfmExDBGridProp.lbSelectedClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      begin
         cbControl.Enabled := True;
         cbControl.Color := clWindow;
         SetControl(ExDBGridControls.Items[lbSelected.ItemIndex].ControlName);
      end
   else
      begin
         cbControl.Enabled := False;
         cbControl.Color := clBtnface;
      end;
end;

procedure TfmExDBGridProp.cbControlClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      ExDBGridControls.Items[lbSelected.ItemIndex].ControlName := cbControl.Text;
end;

procedure TfmExDBGridProp.sbAddClick(Sender: TObject);
begin
   if (lbFields.ItemIndex >= 0) then
      begin
         if (lbSelected.Items.Indexof(lbFields.Items[lbFields.ItemIndex]) < 0) then
            begin
               lbSelected.Items.Add(lbFields.Items[lbFields.ItemIndex]);

               with ExDBGridControls.Add do
                  FieldName := lbFields.Items[lbFields.ItemIndex];
            end
         else
            MessageDlg(Format(lsAlreadyAdded, [lbFields.Items[lbFields.ItemIndex]]), mtWarning, [mbOK], 0);
      end;
end;

procedure TfmExDBGridProp.sbDeleteClick(Sender: TObject);
begin
   if lbSelected.ItemIndex >= 0 then
      begin
         ExDBGridControls.Items[lbSelected.ItemIndex].Free;
         lbSelected.Items.Delete(lbSelected.ItemIndex);
      end;
end;

procedure TfmExDBGridProp.FormDestroy(Sender: TObject);
begin
   ExDBGridControls.Free;
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

