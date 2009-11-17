{*********************************************************}
{*                VPTASKEDITDLG.PAS 1.03                 *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Visual PlanIt                              *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C) 2002        *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I Vp.INC}

unit OF_VpTaskEditDlg;

{ default task editing dialog }

interface

uses
  Windows, Messages, SysUtils,
  {$IFDEF VERSION6} Variants, {$ENDIF}
  Classes, Graphics, Controls, Forms, Dialogs, VpData, StdCtrls, ExtCtrls,
  VpEdPop, VpDateEdit, VpBase, VpSR, VpDlg, ComCtrls;

type
  { forward declarations }
  TVpOFTaskEditDialog = class;

  TOFTaskEditForm = class(TForm)
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DescriptionEdit: TEdit;
    DueDateLbl: TLabel;
    DueDateEdit: TDateTimePicker;
    CompleteCB: TCheckBox;
    CreatedOnLbl: TLabel;
    CompletedOnLbl: TLabel;
    DetailsMemo: TMemo;
    ResourceNameLbl: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    imgCalendar: TImage;
    imgCompleted: TImage;
    procedure FormCreate(Sender: TObject);
    procedure OnChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FReturnCode: TVpEditorReturnCode;
    FTask: TVpTask;
    FResource: TVpResource;
  public
    procedure PopulateSelf;
    procedure DePopulateSelf;
    property Task: TVpTask
      read FTask write FTask;
    property Resource: TVpResource
      read FResource write FResource;
    property ReturnCode: TVpEditorReturnCode
      read FReturnCode;
  end;

  TVpOFTaskEditDialog = class(TVpBaseDialog)
  protected {private}
    teEditDlg         : TOFTaskEditForm;
    teTask            : TVpTask;
  public
    constructor Create(AOwner : TComponent); override;
    function Execute(Task: TVpTask): Boolean; reintroduce;
    function AddNewTask: Boolean;
  published
    {properties}
    property DataStore;
    property Options;
    property Placement;
  end;

implementation

{$R *.dfm}

{ TTaskEditForm }

procedure TOFTaskEditForm.FormCreate(Sender: TObject);
begin
  FReturnCode := rtAbandon;
end;
{=====}

procedure TOFTaskEditForm.DePopulateSelf;
begin
  Task.Description := DescriptionEdit.Text;
  Task.DueDate := DueDateEdit.Date;
  Task.Details := DetailsMemo.Text;
  Task.Complete := CompleteCB.Checked;
  DueDateLbl.Caption := RSDueDate;
end;
{=====}

procedure TOFTaskEditForm.PopulateSelf;
begin
  ResourceNameLbl.Caption := Resource.Description;
  DueDateLbl.Caption := RSDueDate;
  OKBtn.Caption := RSOKBtn;
  CancelBtn.Caption := RSCancelBtn;
  CompleteCB.Caption := RSComplete;

  DescriptionEdit.Text := Task.Description;
  DueDateEdit.Date := Task.DueDate;
  DetailsMemo.Text := Task.Details;
  CompleteCB.Checked := Task.Complete;
  if Task.CompletedOn <> 0 then
    CompletedOnLbl.Caption := RSCompletedOn + ' ' +
                              FormatDateTime(ShortDateFormat, Task.CompletedOn)
  else
    CompletedOnLbl.Visible := False;
  CompletedOnLbl.Visible := CompleteCB.Checked;
  CreatedOnLbl.Caption := RSCreatedOn + ' ' +
                          FormatDateTime(ShortDateFormat, Task.CreatedOn);
end;
{=====}

procedure TOFTaskEditForm.OnChange(Sender: TObject);
begin
  Task.Changed := true;
end;
{=====}

procedure TOFTaskEditForm.OKBtnClick(Sender: TObject);
begin
  FReturnCode := rtCommit;
  Close;
end;
{=====}

procedure TOFTaskEditForm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;
{=====}

procedure TOFTaskEditForm.FormShow(Sender: TObject);
begin
  DescriptionEdit.SetFocus;
end;
{=====}

{ TVpTaskEditDialog }

constructor TVpOFTaskEditDialog.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FPlacement.Height   := 340;
  FPlacement.Width    := 545;
end;

function TVpOFTaskEditDialog.Execute(Task: TVpTask): Boolean;
var
  OFTaskEditForm: TOFTaskEditForm;
begin
  Result := false;
  teTask := Task;
  if (teTask <> nil) and (DataStore <> nil) and
     (DataStore.Resource <> nil) then
  begin
    Application.CreateForm(TOFTaskEditForm, OFTaskEditForm);
    try
      DoFormPlacement(OFTaskEditForm);
      SetFormCaption(OFTaskEditForm, Task.Description, RSDlgTaskEdit);
      OFTaskEditForm.Task := Task;
      OFTaskEditForm.Resource := DataStore.Resource;
      OFTaskEditForm.PopulateSelf;
      OFTaskEditForm.ShowModal;
      Result := (OFTaskEditForm.ReturnCode = rtCommit);
      Task.Changed := Result;
      if Result then begin
        OFTaskEditForm.DePopulateSelf;
        DataStore.PostTasks;
        DataStore.NotifyDependents;
      end;
    finally
      OFTaskEditForm.Release;
    end;
  end;
end;
{=====}

function TVpOFTaskEditDialog.AddNewTask: Boolean;
begin
  result := false;
  if DataStore <> nil then
  begin
    teTask := DataStore.Resource.Tasks.AddTask(DataStore.GetNextID('Tasks'));
    if teTask <> nil then
    begin
      Result := Execute(teTask);
      if not Result then teTask.Free;
    end;
  end;
end;
{=====}

end.

