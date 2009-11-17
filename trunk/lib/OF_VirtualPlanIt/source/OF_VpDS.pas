{******************************************************************************}
{*                             OF_VpDS.PAS 0.01                               *}
{******************************************************************************}
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
{*        Jan Pokrandt                                                        *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{ This unit was provided by Steve Forbes and is used with permission           }


{$I Vp.INC}

unit OF_VpDS;

{ CAO (over ZEOS MySQL) DataStore Component }

interface

uses
  Windows, Classes, Dialogs, SysUtils, Db,
  ZConnection, ZDataset,
  VpBase, VpData, VpSR, VpBaseDS, VpDBDS, VpException, VpConst;

type TOnGetNexID = procedure (Table : String; var NextID : Integer) of Object;

type TOnPostResources = procedure (Resource: TVpResource) of Object;
type TOnLoadResources = procedure (Resource: TVpResource) of Object;

type
  TVpOFDataStore = class(TVpCustomDBDataStore)
  protected
    FDatabase        : TZConnection;
    FEventsTable     : TZQuery;
    FContactsTable   : TZQuery;
    FTasksTable      : TZQuery;

    //-------------
    FEventsTableName   : String;
    FContactsTableName : String;
    FTasksTableName    : String;

    FOnPostResources   : TOnPostResources;
    FOnLoadResources   : TOnLoadResources;


    { property getters }
    function GetConnected: Boolean;

    { ancestor property getters }
    function GetEventsTable : TDataset; override;
    function GetContactsTable : TDataset; override;
    function GetTasksTable : TDataset; override;

    { property setters }
    procedure SetConnected(const Value: boolean); override;

    procedure Loaded; override;
    procedure SetFilterCriteria(aTable: TDataset; aUseDateTime: Boolean;
      aResourceID: Integer; aStartDateTime : TDateTime;
      aEndDateTime: TDateTime); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetNextID(TableName: string): Integer; override;
    procedure Load; override;
    procedure CreateTable(TableName: string);
    procedure CreateIndexDefs(const TableName : string;
                                    IndexDefs : TIndexDefs); override;
    procedure CreateFieldDefs(const TableName : string; FieldDefs : TFieldDefs);
        override;

    procedure PostResources; override;
    procedure PostEvents; override;
    procedure PostContacts; override;
    procedure PostTasks; override;

    procedure PurgeResource(Res: TVpResource); override;
    procedure PurgeEvents(Res: TVpResource); override;
    procedure PurgeContacts(Res: TVpResource); override;
    procedure PurgeTasks(Res: TVpResource); override;

  published
    { properties }
    property DayBuffer;
    property ResourceID;
    property ReadOnly;
    property Database: TZConnection read FDatabase write FDatabase;

    property EventsTabName   : String read FEventsTableName   write FEventsTableName;
    property ContactsTabName : String read FContactsTableName write FContactsTableName;
    property TasksTabName    : String read FTasksTableName    write FTasksTableName;
    { events }
    property OnPostResources : TOnPostResources Read FOnPostResources write FOnPostResources;
    property OnLoadResources : TOnLoadResources Read FOnLoadResources write FOnLoadResources;

  end;

implementation

uses
{$IFDEF VERSION6}
  Variants;
{$ELSE}
  FileCtrl;
{$ENDIF}


//------------------------------------------------------------------------------
// TVpOFDataStore
//------------------------------------------------------------------------------
constructor TVpOFDataStore.Create(AOwner: TComponent);
begin
  // 08.2003 JP Default-Tabellennamen laden
  FEventsTableName   := EventsTableName;
  FContactsTableName := ContactsTableName;
  FTasksTableName    := TasksTableName;

  FOnPostResources   := nil;
  FOnLoadResources   := nil;

  FConnected := false;
  FResourceID := 0;

  FDatabase := nil;

  FEventsTable := TZQuery.Create(self);
  FEventsTable.Connection := FDatabase;
  FEventsTable.ReadOnly := FReadOnly;

  FContactsTable := TZQuery.Create(self);
  FContactsTable.Connection := FDatabase;
  FContactsTable.ReadOnly := FReadOnly;

  FTasksTable := TZQuery.Create(self);
  FTasksTable.Connection := FDatabase;
  FTasksTable.ReadOnly := FReadOnly;

  inherited;
end;
//------------------------------------------------------------------------------
destructor TVpOFDataStore.Destroy;
begin
  { free tables }
  if Assigned(FEventsTable) then FEventsTable.Free;
  if Assigned(FContactsTable) then FContactsTable.Free;
  if Assigned(FTasksTable) then FTasksTable.Free;
  inherited;
end;
//------------------------------------------------------------------------------
function TVpOFDataStore.GetConnected: Boolean;begin
  result := FDatabase.Connected;
end;
//------------------------------------------------------------------------------
function TVpOFDataStore.GetEventsTable : TDataset;
begin
  Result := FEventsTable;
end;
//------------------------------------------------------------------------------
function TVpOFDataStore.GetContactsTable : TDataset;
begin
  Result := FContactsTable;
end;
//------------------------------------------------------------------------------
function TVpOFDataStore.GetTasksTable : TDataset;
begin
  Result := FTasksTable;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.Load;
var Res : TVpResource;
begin
  if not FDatabase.Connected then exit;

  FEventsTable.Close;
  FContactsTable.Close;
  FTasksTable.Close;

  //inherited Load;

  // Resourcen werden nicht mehr aus einer Tabelle,
  // sondern über ein Ereignis in der Applikation geladen
  if assigned (FOnLoadResources) then
  begin
    Resource := nil;
    Resources.ClearResources;
    Res := Resources.AddResource(-1);
    Res.Loading := true;
    try
      FOnLoadResources (Res);
    finally
      Res.Loading := false;
    end;
    { Add events, contacts and tasks for the currently selected resource }
    if (Res.ResourceID = ResourceID) and Res.Active then begin
      Resource := Res;
      LoadEvents;
      LoadContacts;
      LoadTasks;
    end;
  end;

  FEventsTable.Close;
  FContactsTable.Close;
  FTasksTable.Close;

end;
//------------------------------------------------------------------------------
function TVpOFDataStore.GetNextID(TableName: string): Integer;
begin
  result := -1;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.CreateTable(TableName: string);
var
  Table: TZTable;
begin
  Table := TZTable.Create(self);
  try
    Table.Connection := FDatabase;

    if TableName = FEventsTableName then
    begin
      // Create Events Table
      Table.Active := false;
      Table.TableName := FEventsTableName;
    end

    else if TableName = FContactsTableName then
    begin
      // Create Contacts Table
      Table.Active := false;
      Table.TableName := FContactsTableName;
    end

    else if TableName = FTasksTableName then
    begin
      // Create Tasks Table
      Table.Active := false;
      Table.TableName := FTasksTableName;
    end;
  finally
    Table.Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    Connected := AutoConnect;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PostResources;
var
  I: Integer;
  Resource: TVpResource;
  Qry: TZQuery;
begin
  // Das Speichern der Resourcen wird jetzt der Applikation überlassen
  // Dazu wird das Ereignis 1 mal pro Resource aufgerufen

  if not Assigned (FOnPostResources) then exit;
  if (Resources.Count > 0) then
  begin
     for I := pred(Resources.Count) downto 0 do
     begin
        Resource := Resources.Items[I];
        if Resource = nil then
        begin
          Continue;
        end;
        try
           FOnPostResources (Resource);
        except
        end;
     end;
  end;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PostEvents;
var
  I: Integer;
  Event: TVpEvent;
  Qry: TZQuery;
begin
  if (Resource <> nil) and Resource.EventsDirty then
  begin
    Qry := TZQuery.Create(self);
    try
      Qry.Connection      := FDatabase;
      Qry.ReadOnly        := False;

      for I := pred(Resource.Schedule.EventCount) downto 0 do
      begin
        Event := Resource.Schedule.GetEvent(I);
        if Event.Deleted then
        begin
          Qry.SQL.Text := 'DELETE FROM '+FEventsTableName+' '
          + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Event.RecordID;
          Qry.ExecSQL;
          Event.Free;
          Continue;
        end

        else if Event.Changed then
        begin
          Qry.SQL.Text := 'SELECT * FROM '+FEventsTableName+' '
            + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Event.RecordID;
          Qry.Open;

          if Qry.Locate('RecordID', Event.RecordID, []) then
          begin
            // existing record found

            if (Qry.FieldByName('StartTime').AsDateTime <> Event.StartTime) or
               (Qry.FieldByName('EndTime').AsDateTime <> Event.EndTime) or
               (Qry.FieldByName('ResourceID').AsInteger <> Resource.ResourceID) or
               (Qry.FieldByName('Description').AsString <> Event.Description) or
               (Qry.FieldByName('Notes').AsString <> Event.Note) or
               (Qry.FieldByName('Category').AsInteger <> Event.Category) or
               (Qry.FieldByName('DingPath').AsString <> Event.AlarmWavPath) or
               (Qry.FieldByName('AllDayEvent').AsBoolean <> Event.AllDayEvent) or
               (Qry.FieldByName('AlarmSet').AsBoolean <> Event.AlarmSet) or
               (Qry.FieldByName('AlarmAdvance').AsInteger <> Event.AlarmAdv) or
               (Qry.FieldByName('AlarmAdvanceType').AsInteger <> Ord(Event.AlarmAdvType)) or
               (Qry.FieldByName('SnoozeTime').AsDateTime <> Event.SnoozeTime) or
               (Qry.FieldByName('RepeatCode').AsInteger <> Ord(Event.RepeatCode)) or
               (Qry.FieldByName('RepeatRangeEnd').AsDateTime <> Event.RepeatRangeEnd) or
               (Qry.FieldByName('CustomInterval').AsInteger <> Event.CustInterval) or
               (Qry.FieldByName('UserField0').AsString <> Event.UserField0) or
               (Qry.FieldByName('UserField1').AsString <> Event.UserField1) or
               (Qry.FieldByName('UserField2').AsString <> Event.UserField2) or
               (Qry.FieldByName('UserField3').AsString <> Event.UserField3) or
               (Qry.FieldByName('UserField4').AsString <> Event.UserField4) or
               (Qry.FieldByName('UserField5').AsString <> Event.UserField5) or
               (Qry.FieldByName('UserField6').AsString <> Event.UserField6) or
               (Qry.FieldByName('UserField7').AsString <> Event.UserField7) or
               (Qry.FieldByName('UserField8').AsString <> Event.UserField8) or
               (Qry.FieldByName('UserField9').AsString <> Event.UserField9) then
            begin
              Qry.Edit;
              try
                Qry.FieldByName('StartTime').AsDateTime := Event.StartTime;
                Qry.FieldByName('EndTime').AsDateTime := Event.EndTime;
                Qry.FieldByName('ResourceID').AsInteger := Resource.ResourceID;
                Qry.FieldByName('Description').AsString := Event.Description;
                Qry.FieldByName('Notes').AsString := Event.Note;
                Qry.FieldByName('Category').AsInteger := Event.Category;
                Qry.FieldByName('DingPath').AsString := Event.AlarmWavPath;
                Qry.FieldByName('AllDayEvent').AsBoolean := Event.AllDayEvent;
                Qry.FieldByName('AlarmSet').AsBoolean := Event.AlarmSet;
                Qry.FieldByName('AlarmAdvance').AsInteger := Event.AlarmAdv;
                Qry.FieldByName('AlarmAdvanceType').AsInteger := Ord(Event.AlarmAdvType);
                Qry.FieldByName('SnoozeTime').AsDateTime := Event.SnoozeTime;
                Qry.FieldByName('RepeatCode').AsInteger := Ord(Event.RepeatCode);
                Qry.FieldByName('RepeatRangeEnd').AsDateTime := Event.RepeatRangeEnd;
                Qry.FieldByName('CustomInterval').AsInteger := Event.CustInterval;
                Qry.FieldByName('UserField0').AsString := Event.UserField0;
                Qry.FieldByName('UserField1').AsString := Event.UserField1;
                Qry.FieldByName('UserField2').AsString := Event.UserField2;
                Qry.FieldByName('UserField3').AsString := Event.UserField3;
                Qry.FieldByName('UserField4').AsString := Event.UserField4;
                Qry.FieldByName('UserField5').AsString := Event.UserField5;
                Qry.FieldByName('UserField6').AsString := Event.UserField6;
                Qry.FieldByName('UserField7').AsString := Event.UserField7;
                Qry.FieldByName('UserField8').AsString := Event.UserField8;
                Qry.FieldByName('UserField9').AsString := Event.UserField9;
                Qry.Post;
              except
                Qry.Cancel;
                //raise EDBPostError.Create;
              end;
            end;
          end
             else
          begin
            Qry.Close;
            Qry.SQL.Text := 'INSERT INTO '+FEventsTableName+' '
            + '(StartTime, EndTime, ResourceID, Description, Notes, '
            + 'SnoozeTime, Category, DingPath, AllDayEvent, AlarmSet, '
            + 'AlarmAdvance, AlarmAdvanceType, RepeatCode, '
            + 'RepeatRangeEnd, CustomInterval, '
            + 'UserField0, UserField1, UserField2, UserField3, UserField4, '
            + 'UserField5, UserField6, UserField7, UserField8, UserField9) '
            + 'VALUES(:STime, :ETime, :ResID, :Desc, :Notes, :SnTime, '
            + ':Cat, :DPath, :ADEvent, :ASet, :AAdvance, :AAdvanceType, '
            + ':RCode, :RRangeEnd, :CInterval, :UserField0, '
            + ':UserField1, :UserField2, :UserField3, :UserField4, '
            + ':UserField5, :UserField6, :UserField7, :UserField8, '
            + ':UserField9)';

            Qry.ParamByName('STime').AsDateTime       := Event.StartTime;
            Qry.ParamByName('ETime').AsDateTime       := Event.EndTime;
            Qry.ParamByName('ResID').AsInteger        := Resource.ResourceID;
            Qry.ParamByName('Desc').AsString          := Event.Description;
            Qry.ParamByName('Notes').AsString         := Event.Note;
            Qry.ParamByName('SnTime').AsDateTime      := Event.SnoozeTime;
            Qry.ParamByName('Cat').AsInteger          := Event.Category;
            Qry.ParamByName('DPath').AsString         := Event.AlarmWavPath;
            Qry.ParamByName('ADEvent').AsBoolean      := Event.AllDayEvent;
            Qry.ParamByName('ASet').AsBoolean         := Event.AlarmSet;
            Qry.ParamByName('AAdvance').AsInteger     := Event.AlarmAdv;
            Qry.ParamByName('AAdvanceType').AsInteger := ord(Event.AlarmAdvType);
            Qry.ParamByName('RCode').AsInteger        := ord(Event.RepeatCode);
            Qry.ParamByName('RRangeEnd').AsDateTime   := Event.RepeatRangeEnd;
            Qry.ParamByName('CInterval').AsInteger    := Event.CustInterval;
            Qry.ParamByName('UserField0').AsString    := Event.UserField0;
            Qry.ParamByName('UserField1').AsString    := Event.UserField1;
            Qry.ParamByName('UserField2').AsString    := Event.UserField2;
            Qry.ParamByName('UserField3').AsString    := Event.UserField3;
            Qry.ParamByName('UserField4').AsString    := Event.UserField4;
            Qry.ParamByName('UserField5').AsString    := Event.UserField5;
            Qry.ParamByName('UserField6').AsString    := Event.UserField6;
            Qry.ParamByName('UserField7').AsString    := Event.UserField7;
            Qry.ParamByName('UserField8').AsString    := Event.UserField8;
            Qry.ParamByName('UserField9').AsString    := Event.UserField9;

            Qry.ExecSQL;


            qry.Sql.text :='SELECT LAST_INSERT_ID() AS NEWID';
            qry.Open;
            Event.RecordID :=qry.FieldByName ('NEWID').AsInteger;
            qry.Close;
          end;
          Event.Changed := false;
        end;
      end;
      Resource.Schedule.Sort;
      NotifyDependents;
    finally
      Qry.CLose;
      Qry.Free;
    end;
    Resource.EventsDirty := false;
    Resource.Schedule.Sort;

    if not Loading then  NotifyDependents;

    if Assigned(AfterPostEvents) then
      FAfterPostEvents(self);
  end;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PostContacts;
var
  I: Integer;
  Contact: TVpContact;
  Qry: TZQuery;
begin
  if (Resource <> nil) and Resource.ContactsDirty then
  begin
    { Dump this resource's dirty contacts to the DB }
    Qry := TZQuery.Create(self);
    try
      Qry.Connection := FDatabase;
      Qry.ReadOnly   := False;

      for I := pred(Resource.Contacts.Count) downto 0 do
      begin
        Contact := Resource.Contacts.GetContact(I);

        if Contact.Deleted then
        begin
          Qry.SQL.Text := 'DELETE FROM '+FContactsTableName+' '
          + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Contact.RecordID;
          Qry.ExecSQL;
          Contact.Free;
          Continue;
        end

        else if Contact.Changed then
        begin
          Qry.SQL.Text := 'SELECT * FROM '+FContactsTableName+' '
            + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Contact.RecordID;
          Qry.Open;

          if Qry.Locate('RecordID', Contact.RecordID, []) then
          begin
            // existing record found

            if (Qry.FieldByName('ResourceID').AsInteger <> Resource.ResourceID) or
               (Qry.FieldByName('FirstName').AsString <> Contact.FirstName) or
               (Qry.FieldByName('LastName').AsString <> Contact.LastName) or
               (Qry.FieldByName('Title').AsString <> Contact.Title) or
               (Qry.FieldByName('Company').AsString <> Contact.Company) or
               (Qry.FieldByName('Job_Position').AsString <> Contact.Position) or
               (Qry.FieldByName('EMail').AsString <> Contact.EMail) or
               (Qry.FieldByName('Address').AsString <> Contact.Address) or
               (Qry.FieldByName('City').AsString <> Contact.City) or
               (Qry.FieldByName('State').AsString <> Contact.State) or
               (Qry.FieldByName('Zip').AsString <> Contact.Zip) or
               (Qry.FieldByName('Country').AsString <> Contact.Country) or
               (Qry.FieldByName('Note').AsString <> Contact.Note) or
               (Qry.FieldByName('Phone1').AsString <> Contact.Phone1) or
               (Qry.FieldByName('Phone2').AsString <> Contact.Phone2) or
               (Qry.FieldByName('Phone3').AsString <> Contact.Phone3) or
               (Qry.FieldByName('Phone4').AsString <> Contact.Phone4) or
               (Qry.FieldByName('Phone5').AsString <> Contact.Phone5) or
               (Qry.FieldByName('PhoneType1').AsInteger <> Contact.PhoneType1) or
               (Qry.FieldByName('PhoneType2').AsInteger <> Contact.PhoneType2) or
               (Qry.FieldByName('PhoneType3').AsInteger <> Contact.PhoneType3) or
               (Qry.FieldByName('PhoneType4').AsInteger <> Contact.PhoneType4) or
               (Qry.FieldByName('PhoneType5').AsInteger <> Contact.PhoneType5) or
               (Qry.FieldByName('Category').AsInteger <> Contact.Category) or
               (Qry.FieldByName('Custom1').AsString <> Contact.Custom1) or
               (Qry.FieldByName('Custom2').AsString <> Contact.Custom2) or
               (Qry.FieldByName('Custom3').AsString <> Contact.Custom3) or
               (Qry.FieldByName('Custom4').AsString <> Contact.Custom4) or
               (Qry.FieldByName('UserField0').AsString <> Contact.UserField0) or
               (Qry.FieldByName('UserField1').AsString <> Contact.UserField1) or
               (Qry.FieldByName('UserField2').AsString <> Contact.UserField2) or
               (Qry.FieldByName('UserField3').AsString <> Contact.UserField3) or
               (Qry.FieldByName('UserField4').AsString <> Contact.UserField4) or
               (Qry.FieldByName('UserField5').AsString <> Contact.UserField5) or
               (Qry.FieldByName('UserField6').AsString <> Contact.UserField6) or
               (Qry.FieldByName('UserField7').AsString <> Contact.UserField7) or
               (Qry.FieldByName('UserField8').AsString <> Contact.UserField8) or
               (Qry.FieldByName('UserField9').AsString <> Contact.UserField9) then
            begin
              Qry.Edit;
              try
                Qry.FieldByName('ResourceID').AsInteger := Resource.ResourceID;
                Qry.FieldByName('FirstName').AsString := Contact.FirstName;
                Qry.FieldByName('LastName').AsString := Contact.LastName;
                Qry.FieldByName('Title').AsString := Contact.Title;
                Qry.FieldByName('Company').AsString := Contact.Company;
                Qry.FieldByName('Job_Position').AsString := Contact.Position;
                Qry.FieldByName('EMail').AsString := Contact.EMail;
                Qry.FieldByName('Address').AsString := Contact.Address;
                Qry.FieldByName('City').AsString := Contact.City;
                Qry.FieldByName('State').AsString := Contact.State;
                Qry.FieldByName('Zip').AsString := Contact.Zip;
                Qry.FieldByName('Country').AsString := Contact.Country;
                Qry.FieldByName('Note').AsString := Contact.Note;
                Qry.FieldByName('Phone1').AsString := Contact.Phone1;
                Qry.FieldByName('Phone2').AsString := Contact.Phone2;
                Qry.FieldByName('Phone3').AsString := Contact.Phone3;
                Qry.FieldByName('Phone4').AsString := Contact.Phone4;
                Qry.FieldByName('Phone5').AsString := Contact.Phone5;
                Qry.FieldByName('PhoneType1').AsInteger := Contact.PhoneType1;
                Qry.FieldByName('PhoneType2').AsInteger := Contact.PhoneType2;
                Qry.FieldByName('PhoneType3').AsInteger := Contact.PhoneType3;
                Qry.FieldByName('PhoneType4').AsInteger := Contact.PhoneType4;
                Qry.FieldByName('PhoneType5').AsInteger := Contact.PhoneType5;
                Qry.FieldByName('Category').AsInteger := Contact.Category;
                Qry.FieldByName('Custom1').AsString := Contact.Custom1;
                Qry.FieldByName('Custom2').AsString := Contact.Custom2;
                Qry.FieldByName('Custom3').AsString := Contact.Custom3;
                Qry.FieldByName('Custom4').AsString := Contact.Custom4;
                Qry.FieldByName('UserField0').AsString := Contact.UserField0;
                Qry.FieldByName('UserField1').AsString := Contact.UserField1;
                Qry.FieldByName('UserField2').AsString := Contact.UserField2;
                Qry.FieldByName('UserField3').AsString := Contact.UserField3;
                Qry.FieldByName('UserField4').AsString := Contact.UserField4;
                Qry.FieldByName('UserField5').AsString := Contact.UserField5;
                Qry.FieldByName('UserField6').AsString := Contact.UserField6;
                Qry.FieldByName('UserField7').AsString := Contact.UserField7;
                Qry.FieldByName('UserField8').AsString := Contact.UserField8;
                Qry.FieldByName('UserField9').AsString := Contact.UserField9;
                Qry.Post;
              except
                Qry.Cancel;
                //raise EDBPostError.Create;
              end;
            end;
          end
             else
          begin
            Qry.Close;
            Qry.SQL.Text := 'INSERT INTO '+FContactsTableName+' '
            + '(ResourceID, FirstName, LastName, Title, Company, '
            + 'Job_Position, EMail, Address, City, State, Zip, Country, '
            + 'Note, Phone1, Phone2, Phone3, Phone4, Phone5, PhoneType1, '
            + 'PhoneType2, PhoneType3, PhoneType4, PhoneType5, Category, '
            + 'Custom1, Custom2, Custom3, Custom4, UserField0, UserField1, '
            + 'UserField2, UserField3, UserField4, UserField5, UserField6, '
            + 'UserField7, UserField8, UserField9 ) '

            + 'VALUES(:ResourceID, :FirstName, :LastName, :Title, '
            + ':Company, :Job_Position, :EMail, :Address, :City, :State, :Zip, '
            + ':Country, :Note, :Phone1, :Phone2, :Phone3, :Phone4, :Phone5, '
            + ':PhoneType1, :PhoneType2, :PhoneType3, :PhoneType4, :PhoneType5, '
            + ':Category, :Custom1, :Custom2, :Custom3, :Custom4, :UserField0, '
            + ':UserField1, :UserField2, :UserField3, :UserField4, :UserField5, '
            + ':UserField6, :UserField7, :UserField8, :UserField9)';

            Qry.ParamByName('ResourceID').AsInteger := Resource.ResourceID;
            Qry.ParamByName('FirstName').AsString := Contact.FirstName;
            Qry.ParamByName('LastName').AsString := Contact.LastName;
            Qry.ParamByName('Title').AsString := Contact.Title;
            Qry.ParamByName('Company').AsString := Contact.Company;
            Qry.ParamByName('Job_Position').AsString := Contact.Position;
            Qry.ParamByName('EMail').AsString := Contact.EMail;
            Qry.ParamByName('Address').AsString := Contact.Address;
            Qry.ParamByName('City').AsString := Contact.City;
            Qry.ParamByName('State').AsString := Contact.State;
            Qry.ParamByName('Zip').AsString := Contact.Zip;
            Qry.ParamByName('Country').AsString := Contact.Country;
            Qry.ParamByName('Note').AsString := Contact.Note;
            Qry.ParamByName('Phone1').AsString := Contact.Phone1;
            Qry.ParamByName('Phone2').AsString := Contact.Phone2;
            Qry.ParamByName('Phone3').AsString := Contact.Phone3;
            Qry.ParamByName('Phone4').AsString := Contact.Phone4;
            Qry.ParamByName('Phone5').AsString := Contact.Phone5;
            Qry.ParamByName('PhoneType1').AsInteger := Contact.PhoneType1;
            Qry.ParamByName('PhoneType2').AsInteger := Contact.PhoneType2;
            Qry.ParamByName('PhoneType3').AsInteger := Contact.PhoneType3;
            Qry.ParamByName('PhoneType4').AsInteger := Contact.PhoneType4;
            Qry.ParamByName('PhoneType5').AsInteger := Contact.PhoneType5;
            Qry.ParamByName('Category').AsInteger := Contact.Category;
            Qry.ParamByName('Custom1').AsString := Contact.Custom1;
            Qry.ParamByName('Custom2').AsString := Contact.Custom2;
            Qry.ParamByName('Custom3').AsString := Contact.Custom3;
            Qry.ParamByName('Custom4').AsString := Contact.Custom4;
            Qry.ParamByName('UserField0').AsString := Contact.UserField0;
            Qry.ParamByName('UserField1').AsString := Contact.UserField1;
            Qry.ParamByName('UserField2').AsString := Contact.UserField2;
            Qry.ParamByName('UserField3').AsString := Contact.UserField3;
            Qry.ParamByName('UserField4').AsString := Contact.UserField4;
            Qry.ParamByName('UserField5').AsString := Contact.UserField5;
            Qry.ParamByName('UserField6').AsString := Contact.UserField6;
            Qry.ParamByName('UserField7').AsString := Contact.UserField7;
            Qry.ParamByName('UserField8').AsString := Contact.UserField8;
            Qry.ParamByName('UserField9').AsString := Contact.UserField9;

            Qry.ExecSQL;

            qry.Sql.text :='SELECT LAST_INSERT_ID() AS NEWID';
            qry.Open;
            Contact.RecordID :=qry.FieldByName ('NEWID').AsInteger;
            qry.Close;
          end;
          Contact.Changed := false;
        end;
      end;

    finally
      Qry.Free;
    end;
    Resource.ContactsDirty := false;

    if not Loading then NotifyDependents;

    if Assigned(AfterPostContacts) then FAfterPostContacts(self);
  end;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PostTasks;
var
  I: Integer;
  Task: TVpTask;
  Qry : TZQuery;
begin
  if (Resource <> nil) and Resource.TasksDirty then
  begin
    { Dump this resource's dirty contacts to the DB }
    Qry := TZQuery.Create(self);
    try
      Qry.Connection := FDatabase;
      Qry.ReadOnly   := False;

      for I := pred(Resource.Tasks.Count) downto 0 do
      begin
        Task := Resource.Tasks.GetTask(I);
        if Task.Deleted then begin
          Qry.SQL.Text := 'DELETE FROM '+FTasksTableName+' '
          + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Task.RecordID;
          Qry.ExecSQL;
          Task.Free;
          Continue;
        end

        else if Task.Changed then
        begin
          Qry.SQL.Text := 'SELECT * FROM '+FTasksTableName+' '
            + 'WHERE RecordID = :ID';
          Qry.ParamByName('ID').AsInteger := Task.RecordID;
          Qry.Open;

          if Qry.Locate('RecordID', Task.RecordID, []) then
          begin
            { existing record found }

            if (Qry.FieldByName('ResourceID').AsInteger <> Resource.ResourceID) or
               (Qry.FieldByName('Description').AsString <> Task.Description) or
               (Qry.FieldByName('Details').AsString <> Task.Details) or
               (Qry.FieldByName('Complete').AsBoolean <> Task.Complete) or
               (Qry.FieldByName('DueDate').AsDateTime <> Task.DueDate) or
               (Qry.FieldByName('CreatedOn').AsDateTime <> Task.CreatedOn) or
               (Qry.FieldByName('CompletedOn').AsDateTime <> Task.CompletedOn) or
               (Qry.FieldByName('Priority').AsInteger <> Task.Priority) or
               (Qry.FieldByName('Category').AsInteger <> Task.Category) or
               (Qry.FieldByName('UserField0').AsString <> Task.UserField0) or
               (Qry.FieldByName('UserField1').AsString <> Task.UserField1) or
               (Qry.FieldByName('UserField2').AsString <> Task.UserField2) or
               (Qry.FieldByName('UserField3').AsString <> Task.UserField3) or
               (Qry.FieldByName('UserField4').AsString <> Task.UserField4) or
               (Qry.FieldByName('UserField5').AsString <> Task.UserField5) or
               (Qry.FieldByName('UserField6').AsString <> Task.UserField6) or
               (Qry.FieldByName('UserField7').AsString <> Task.UserField7) or
               (Qry.FieldByName('UserField8').AsString <> Task.UserField8) or
               (Qry.FieldByName('UserField9').AsString <> Task.UserField9) then
            begin
              Qry.Edit;
              try
                Qry.FieldByName('ResourceID').AsInteger := Resource.ResourceID;
                Qry.FieldByName('Description').AsString := Task.Description;
                Qry.FieldByName('Details').AsString := Task.Details;
                Qry.FieldByName('Complete').AsBoolean := Task.Complete;
                Qry.FieldByName('DueDate').AsDateTime := Task.DueDate;
                Qry.FieldByName('CreatedOn').AsDateTime := Task.CreatedOn;
                Qry.FieldByName('CompletedOn').AsDateTime := Task.CompletedOn;
                Qry.FieldByName('Priority').AsInteger := Task.Priority;
                Qry.FieldByName('Category').AsInteger := Task.Category;
                Qry.FieldByName('UserField0').AsString := Task.UserField0;
                Qry.FieldByName('UserField1').AsString := Task.UserField1;
                Qry.FieldByName('UserField2').AsString := Task.UserField2;
                Qry.FieldByName('UserField3').AsString := Task.UserField3;
                Qry.FieldByName('UserField4').AsString := Task.UserField4;
                Qry.FieldByName('UserField5').AsString := Task.UserField5;
                Qry.FieldByName('UserField6').AsString := Task.UserField6;
                Qry.FieldByName('UserField7').AsString := Task.UserField7;
                Qry.FieldByName('UserField8').AsString := Task.UserField8;
                Qry.FieldByName('UserField9').AsString := Task.UserField9;
                Qry.Post;
              except
                Qry.Cancel;
                //raise EDBPostError.Create;
              end;
            end;
          end
             else
          begin
            Qry.Close;
            Qry.SQL.Text := 'INSERT INTO '+FTasksTableName+' '
            + '(ResourceID, Description, Details, '
            + 'Complete, DueDate, CreatedOn, CompletedOn, Priority, Category, '
            + 'UserField0, UserField1, UserField2, UserField3, UserField4, '
            + 'UserField5, UserField6, UserField7, UserField8, UserField9) '

            + 'VALUES( :ResourceID, :Description, :Details, '
            + ':Complete, :DueDate, :CreatedOn, :CompletedOn, :Priority, '
            + ':Category, :UserField0, :UserField1, :UserField2, :UserField3, '
            + ':UserField4, :UserField5, :UserField6, :UserField7, '
            + ':UserField8, :UserField9)';

            Qry.ParamByName('ResourceID').AsInteger   := Resource.ResourceID;
            Qry.ParamByName('Description').AsString   := Task.Description;
            Qry.ParamByName('Details').AsString       := Task.Details;
            Qry.ParamByName('Complete').AsBoolean     := Task.Complete;
            Qry.ParamByName('DueDate').AsDateTime     := Task.DueDate;
            Qry.ParamByName('CreatedOn').AsDateTime   := Task.CreatedOn;
            Qry.ParamByName('CompletedOn').AsDateTime := Task.CompletedOn;
            Qry.ParamByName('Priority').AsInteger := Task.Priority;
            Qry.ParamByName('Category').AsInteger := Task.Category;
            Qry.ParamByName('UserField0').AsString := Task.UserField0;
            Qry.ParamByName('UserField1').AsString := Task.UserField1;
            Qry.ParamByName('UserField2').AsString := Task.UserField2;
            Qry.ParamByName('UserField3').AsString := Task.UserField3;
            Qry.ParamByName('UserField4').AsString := Task.UserField4;
            Qry.ParamByName('UserField5').AsString := Task.UserField5;
            Qry.ParamByName('UserField6').AsString := Task.UserField6;
            Qry.ParamByName('UserField7').AsString := Task.UserField7;
            Qry.ParamByName('UserField8').AsString := Task.UserField8;
            Qry.ParamByName('UserField9').AsString := Task.UserField9;
            Qry.ExecSQL;

            qry.Sql.text :='SELECT LAST_INSERT_ID() AS NEWID';
            qry.Open;
            Task.RecordID :=qry.FieldByName ('NEWID').AsInteger;
            qry.Close;
          end;
          Task.Changed := false;
        end
      end;

    finally
      Qry.Free;
    end;

    Resource.TasksDirty := false;

    if not Loading then NotifyDependents;

    if Assigned(AfterPostTasks) then FAfterPostTasks(self);
  end;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PurgeResource(Res: TVpResource);
begin
  Res.Deleted := true;
  PostResources;
  Load;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PurgeEvents(Res: TVpResource);
var
  Qry: TZQuery;
begin
  Qry := TZQuery.Create(self);
  try
    Qry.Connection := FDataBase;
    Qry.ReadOnly   := False;

    Qry.SQL.Text := 'delete from '+FEventsTableName+' where ResourceID = :ResID';
    Qry.ParamByName('ResID').AsInteger := Res.ResourceID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
  Res.Schedule.ClearEvents;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PurgeContacts(Res: TVpResource);
var
  Qry: TZQuery;
begin
  Qry := TZQuery.Create(self);
  try
    Qry.Connection := FDataBase;
    Qry.ReadOnly   := False;

    Qry.SQL.Text := 'delete from '+FContactsTableName+' where ResourceID = :ResID';
    Qry.ParamByName('ResID').AsInteger := Res.ResourceID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
  Res.Contacts.ClearContacts;                                            
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.PurgeTasks(Res: TVpResource);
var
  Qry: TZQuery;
begin
  Qry := TZQuery.Create(self);
  try
    Qry.Connection := FDataBase;
    Qry.ReadOnly   := False;

    Qry.SQL.Text := 'delete from '+FTasksTableName+' where ResourceID = :ResID';
    Qry.ParamByName('ResID').AsInteger := Res.ResourceID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
  Res.Tasks.ClearTasks;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.SetConnected(const Value: boolean);
var
  DBPath : string;
  Str    : string;
begin
  { disconnect if destroying }
  if csDestroying in ComponentState then
  begin
    //FDataBase.Connected := false;
    exit;
  end;

  { Don't connect at designtime }
  if csDesigning in ComponentState then exit;

  { Don't try to connect until we're all loaded up }
  if csLoading in ComponentState then exit;

  if not assigned(FDatabase) then exit;

  if Value=False then
  begin
    FEventsTable.Close;
    FContactsTable.Close;
    FTasksTable.Close;

    exit;
  end;

  // Create / Open Events Table
  FEventsTable.Connection := FDatabase;
  FEventsTable.ReadOnly := False;
  FEventsTable.SQL.Text := 'SELECT * FROM '+FEventsTableName+' '
  + 'WHERE (ResourceID = :ResID) '
  + 'AND ((StartTime >= :STime1 AND EndTime <= :ETime) '
  + 'OR (RepeatCode > 0 AND :STime2 <= RepeatRangeEnd))';


  SetFilterCriteria(FEventsTable,
                    True,
                    //ResourceTable.FieldByName('ResourceID').AsInteger,
                    0,
                    TimeRange.StartTime,
                    TimeRange.EndTime);
  try
    FEventsTable.Open;
  except
  end;

  // Open Contacts Table 
  FContactsTable.Connection := FDatabase;
  FContactsTable.ReadOnly   := False;
  FContactsTable.SQL.Text := 'SELECT * FROM '+FContactsTableName+' '
                           + 'WHERE ResourceID = :ResID';

  SetFilterCriteria(FContactsTable, False,
                    //ResourceTable.FieldByName('ResourceID').AsInteger,
                    0,
                    0, 0);
  try
    FContactsTable.Open;
  except
  end;

  { Open Tasks Table }
  FTasksTable.Connection :=FDatabase;
  FTasksTable.ReadOnly   :=False;
  FTasksTable.SQL.Text := 'SELECT * FROM '+FTasksTableName+' '
                        + 'WHERE ResourceID = :ResID';

  SetFilterCriteria(FTasksTable, False,
                    //ResourceTable.FieldByName('ResourceID').AsInteger,
                    0,
                    0, 0);
  try
    FTasksTable.Open;
  except
  end;

  Load;

  inherited SetConnected(Database.Connected);
end;
//------------------------------------------------------------------------------
{ Called by the ancestor to properly filter the data for each table, }
{ based on the ResourceID, Date and DayBuffer values.                }
{ Each TVpCustomDBDataStore descendant should define their own       }
{ SetFilterCriteria procedure.                                       }
procedure TVpOFDataStore.SetFilterCriteria(aTable :TDataset;
  aUseDateTime: Boolean; aResourceID: Longint; aStartDateTime: TDateTime;
  aEndDateTime: TDateTime);
var
  Qry: TZQuery;
begin
  Qry := (aTable as TZQuery);

  Qry.Close;

  Qry.ParamByName('ResID').AsInteger := aResourceID;

  if Qry = EventsTable then
  begin
    Qry.ParamByName('STime1').AsDateTime := aStartDateTime;
    Qry.ParamByName('ETime').AsDateTime := aEndDateTime;
    Qry.ParamByName('STime2').AsDateTime := aStartDateTime;
  end;

  Qry.Open;
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.CreateIndexDefs(const TableName: string;
  IndexDefs: TIndexDefs);
begin
end;
//------------------------------------------------------------------------------
procedure TVpOFDataStore.CreateFieldDefs(const TableName: string;
    FieldDefs: TFieldDefs);
begin
end;
//------------------------------------------------------------------------------

end.
