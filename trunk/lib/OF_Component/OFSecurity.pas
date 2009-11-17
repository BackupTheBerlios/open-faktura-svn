{******************************************************************************}
{         Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org          }
{******************************************************************************}
{ PROJEKT      : OpenFaktura                                                   }
{ BESCHREIBUNG : Benutzer- und Rechteverwaltung                                }
{                                                                              }
{ Dieser Programmcode basiert auf:                                             }
{   Quellen von CAO-Faktura,                                                   }
{   Copyright (C) 2003 Jan Pokrandt / Jan@JP-SOFT.de                           }
{                                                                              }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung f¸r irgendeinen Zweck verˆffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code based on the sources of CAO-Faktura, see above             }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}

{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : CAO_SECURITY                                                  }
{ BESCHREIBUNG : Modul / Objekte zur Benutzer- und Rechteverwaltung            }
{ STAND        : 03.10.2004                                                    }
{ VERSION      : 1.3.0.10                                                      }
{ COPYRIGHT    : © 2004 Jan Pokrandt / Jan@JP-Soft.de                          }
{                                                                              }
{ Diese Unit gehˆrt zum Projekt CAO-Faktura und wird unter der                 }
{ GNU General Public License Version 2.0 freigegeben                           }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ This program is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU General Public License                  }
{ as published by the Free Software Foundation; either version 2               }
{ of the License, or any later version.                                        }
{                                                                              }
{ This program is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                }
{ GNU General Public License for more details.                                 }
{                                                                              }
{ You should have received a copy of the GNU General Public License            }
{ along with this program; if not, write to the Free Software                  }
{ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.  }
{                                                                              }
{    ******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************     }
{                                                                              }
{******************************************************************************}
{ WICHTIG :                                                                    }
{ ƒnderungen am Copyright-Block sind nicht zul‰ssig.                           }
{ Wenn Ihr Ver‰nderungen an diesem Source durchf¸hrt, so kˆnnen die weiteren   }
{ Copyrightinformationen am Ende des Copyrightblockes vermerkt werden !        }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ Historie :                                                                   }
{ 28.06.2004 - Unit erstellt Jan Pokrandt                                      }
{ 19.07.2004 - diverse kleine ƒnderungen unf Bugfixes                          }
{ 03.10.2004 - Record-Locking implementiert                                    }
{                                                                              }
{ Todo :                                                                       }
{                                                                              }
{******************************************************************************}


{******************************************************************************}
{ $Id:$ }
{                                                                              }
{ History:                                                                     }
{ 14.10.09-ud.  Namens‰nderung  TCaoSecurity -> TOFSecurity                    }
{                               TZCaoCustomMySqlDataset -> TOFZCustomDataset   }
{                               TZCaoMySqlQuery -> TOFZQuery                   }
{                               TZCaoMySqlTable -> TOFZTable                   }
{               Registernamen ge‰ndert CAO-Faktura -> Open-Faktura             }
{                                                                              }
{ Todo:                                                                        }
{ -                                                                            }
{                                                                              }
{ Issues, notes:                                                               }
{ -                                                                            }
{******************************************************************************}

unit OFSecurity;

{$I OFDelVers.INC}

interface

uses
  Windows, SysUtils, Classes, Dialogs, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

//------------------------------------------------------------------------------
// TOFSecurity
//------------------------------------------------------------------------------

type
  RechteRec = Record
    ModulID      : Integer;
    SubModulID   : Integer;

    ModulName    : String;
    SubModulName : String;

    CanOpenModul : Boolean;
    CanEdit      : Boolean;
    CanInsert    : Boolean;
    CanDelete    : Boolean;
    Rechte       : Word;    // Bitcodiert
    Mask         : Word;    // Bitcodiert
  end;

type
  TFindUserEvent = function(UserName: String; var MA_ID, GRUPPE_ID: Integer): Boolean of object;
  TRecordLockEvent = function(ModulID: String; SatzID: Integer): Boolean of object;
  TLockErrorEvent = procedure(Error: Integer) of object;

type
  TOFSecurity = class(TComponent)
  private
    { Private-Deklarationen }
    FCurrUser: String;
    FCurrGroup: String;
    FCurrUserID: Integer;
    FCurrGroupID: Integer;

    GRechteTab: array of RechteRec;
    URechteTab: array of RechteRec;

    FOnFindUser: TFindUserEvent;
    FOnLoadGruppenRechte: TNotifyEvent;
    FOnLoadUserRechte: TNotifyEvent;

    FOnSetLock: TRecordLockEvent;
    FOnReleaseLock: TRecordLockEvent;
    //FOnIsFreeLock: TRecordLockEvent;
  protected
    procedure SetCurrUser(NewUser: String);
    function GetRechte(ModulID, SubModulID: Integer): Word;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CanOpenModul     (ModulID, SubModulID: Integer): Boolean; //0
    function CanEdit          (ModulID, SubModulID: Integer): Boolean; //1
    function CanInsert        (ModulID, SubModulID: Integer): Boolean; //2
    function CanDelete        (ModulID, SubModulID: Integer): Boolean; //3
    function CanEKView        (ModulID, SubModulID: Integer): Boolean; //8
    function CanEKEdit        (ModulID, SubModulID: Integer): Boolean; //9
    function CanImport        (ModulID, SubModulID: Integer): Boolean; //10
    function CanExport        (ModulID, SubModulID: Integer): Boolean; //11
    function CanFinish        (ModulID, SubModulID: Integer): Boolean; //12
    function CanPrint         (ModulID, SubModulID: Integer): Boolean; //13
    function CanEditPrintForm (ModulID, SubModulID: Integer): Boolean; //14

    Procedure AddGruppenRecht (ModulID, SubModulID: Integer; Rechte: Word);
    Procedure AddUserRecht    (ModulID, SubModulID: Integer; Rechte: Word);

    function SetLock          (ModulID: String; SatzID: Integer): Boolean;
    function ReleaseLock      (ModulID: String; SatzID: Integer): Boolean;
    //function IsFreeLock       (ModulID: String; SatzID: Integer): Boolean;
  published
    property CurrUser: String read FCurrUser write SetCurrUser;
    property CurrGroup: String read FCurrGroup;
    property CurrUserID: Integer read FCurrUserID;
    property CurrGroupID: Integer read FCurrGroupID;

    property OnFindUser: TFindUserEvent read FOnFindUser write FOnFindUser;
    property OnLoadGruppeRechte: TNotifyEvent read FOnLoadGruppenRechte write FOnLoadGruppenRechte;
    property OnLoadUserRechte: TNotifyEvent read FOnLoadUserRechte write FOnLoadUserRechte;
    property OnSetLock: TRecordLockEvent read FOnSetLock write FOnSetLock;
    property OnReleaseLock: TRecordLockEvent read FOnReleaseLock write FOnReleaseLock;
    //property OnIsFreeLock: TRecordLockEvent read FOnIsFreeLock write FOnIsFreeLock;
  end;

//------------------------------------------------------------------------------
// TOFZCustomDataset
//------------------------------------------------------------------------------
type
  TOFZCustomDataset = class(TZAbstractDataset)
  private
    FOFSecurity: TOFSecurity;
    FOFModulID: Integer;
    FOFSubModulID: Integer;

    FUseRecordLock: Boolean;
    FAutoReleaseLock: Boolean;
    FShowLockErrors: Boolean;

    FOnLockError: TLockErrorEvent;
    FLockIDField: String;
  protected
    procedure DoBeforeDelete; override;
    procedure DoBeforeEdit; override;
    procedure DoBeforeInsert; override;
    procedure DoBeforePost; override;

    procedure DoAfterDelete; override;
    procedure DoAfterPost; override;
    procedure DoAfterCancel; override;

    Procedure SetLockIDField(NewLockIDField: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //function IsFreeLock: Boolean;
    function SetLock: Boolean;
    property ReadOnly;
    function ReleaseLock: Boolean;
  published
    property OFSecurity: TOFSecurity read FOFSecurity write FOFSecurity;
    property OFModulID: Integer read FOFModulID write FOFModulID;
    property OFSubModulID: Integer read FOFSubModulID write FOFSubModulID;
    property UseRecordLock: Boolean read FUseRecordLock write FUseRecordLock;
    property ShowLockErrors: Boolean read FShowLockErrors write FShowLockErrors;
    Property LockIDField: String read FLockIDField write SetLockIDField;
    property AutoReleaseLock: Boolean read FAutoReleaseLock write FAutoReleaseLock;
    Property OnLockError: TLockErrorEvent read FOnLockError write FOnLockError;
  end;

  TOFZQuery = class(TOFZCustomDataset)
  private
    function GetParamsCount: Word;
  public
    property ParamCount: Word read GetParamsCount;
  published
    property Active;
    property DataSource;
    property Params;
    property ParamCheck;
    property ReadOnly default False;
    //property RequestLive; //04.10.09-ud. rausgenommen...
    property SQL;

    property ShowRecordTypes;
    property Properties;
    property MasterFields;
    property MasterSource;
    property LinkedFields;
    property IndexFieldNames;
    property UpdateMode;
    property WhereMode;
    property Options;
    property Sequence;
    property SequenceField;
  end;

  { Direct MySql query with descendant of TDataSet }
  TOFZTable = class(TOFZCustomDataset)
  private
    FTableName: string;
    procedure SetTableName(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property TableName: string read FTableName write SetTableName;
    property ReadOnly default False;
    //property DefaultIndex default True; //04.10.09-ud. rausgenommen...
    property Active;
  end;

procedure Register;

implementation

//------------------------------------------------------------------------------
procedure Register;
begin
  RegisterComponents('Open-Faktura', [
    TOFSecurity,
    TOFZQuery,
    TOFZTable
  ]);
end;

//------------------------------------------------------------------------------
// TOFSecurity
//------------------------------------------------------------------------------
constructor TOFSecurity.Create(AOwner: TComponent);
begin
  inherited;
  FCurrUser    := '';
  FCurrGroup   := '';
  FCurrUserID  := -1;
  FCurrGroupID := -1;
  SetLength(GRechteTab, 0);
  SetLength(URechteTab, 0);
end;

//------------------------------------------------------------------------------
destructor TOFSecurity.Destroy;
begin
  SetLength(GRechteTab, 0);
  SetLength(URechteTab, 0);
  inherited;
end;

//------------------------------------------------------------------------------
Procedure TOFSecurity.SetCurrUser(NewUser: String);
var
  NewMaID, NewGruppeID: Integer;
begin
  if NewUser <> FCurrUser then
  begin
    FCurrUser := NewUser;

    SetLength(GRechteTab, 0);
    Setlength(URechteTab, 0);

    if Assigned(OnFindUser) then
    begin
       NewMaID := -1;
       NewGruppeID := -1;
       if OnFindUser(NewUser, NewMaID, NewGruppeID) then
       begin
         FCurrUserID  := NewMaID;
         FCurrGroupID := NewGruppeID;

         if Assigned(OnLoadGruppeRechte) then
           OnLoadGruppeRechte(Self);
         if Assigned(OnLoadUserRechte) then
           OnLoadUserRechte(Self);
       end else
       begin
         FCurrGroupID := -1;
         FCurrUserID  := -1;
       end;
    end else
    begin
      FCurrGroupID := -1;
      FCurrUserID  := -1;
    end;
  end;
end;

//------------------------------------------------------------------------------
Procedure TOFSecurity.AddGruppenRecht(ModulID, SubModulID: Integer; Rechte: Word);
var
  Count: Integer;
begin
  Count := Length(GRechteTab);
  SetLength(GRechteTab, Count+1);

  GRechteTab[Count].ModulID    := ModulID;
  GRechteTab[Count].SubModulID := SubModulID;
  GRechteTab[Count].Rechte     := Rechte;
end;

//------------------------------------------------------------------------------
Procedure TOFSecurity.AddUserRecht(ModulID, SubModulID: Integer; Rechte: Word);
var
  Count: Integer;
begin
  Count := Length(URechteTab);
  SetLength(URechteTab, Count+1);

  URechteTab[Count].ModulID    := ModulID;
  URechteTab[Count].SubModulID := SubModulID;
  URechteTab[Count].Rechte     := Rechte;
end;
//------------------------------------------------------------------------------
function TOFSecurity.GetRechte(ModulID, SubModulID: Integer): Word;
var
  I: Integer;
begin
  Result := 0;

  if CurrGroupID = 1 then // Admin-Gruppe
  begin
    Result := $FFFF; // Die Gruppe Admins darf alles !

    // das kann aber evt. durch die Benutzerrechte eingeschr‰nkt sein ...

    // jetzt Userrechte suchen
    for i := 0 to length(URechteTab)-1 do
    begin
      if (URechteTab[i].ModulID = ModulID) and
         (URechteTab[i].SubModulID = SubModulID) then
      begin
        // gefunden, dann evt, gesetzte Gruppenrechte ¸berschreiben
        Result := URechteTab[i].Rechte;
        Break;
      end;
    end;
  end else
  begin
    // Zun‰chst Rechte der Gruppe lesen
    if length(GRechteTab) > 0 then
    begin
      for i := 0 to length(GRechteTab)-1 do
      begin
        if (GRechteTab[i].ModulID=ModulID) and
           (GRechteTab[i].SubModulID=SubModulID) then
        begin
          // Gurppenrechte laden
          Result := GRechteTab[i].Rechte;
          Break;
        end;
      end;
    end;
    if length(URechteTab) > 0 then
    begin
      // jetzt Userrechte suchen
      for i := 0 to length(URechteTab)-1 do
      begin
        if (URechteTab[i].ModulID = ModulID) and
           (URechteTab[i].SubModulID = SubModulID) then
        begin
          // gefunden, dann evt, gesetzte Gruppenrechte ¸berschreiben
          Result := URechteTab[i].Rechte;
          Break;
        end;
      end;
   end;
  end;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanOpenModul(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 0 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0001 = $0001;
end;
//------------------------------------------------------------------------------
function TOFSecurity.CanEdit(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 1 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0002 = $0002;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanInsert(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 2 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0004 = $0004;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanDelete(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 3 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0008 = $0008;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanEKView(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 3 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0100 = $0100;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanEKEdit(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 3 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0200 = $0200;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanImport(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 10 auswerten
  Result := GetRechte (ModulID, SubModulID) and $0400 = $0400;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanExport(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 11 auswerten
  Result := GetRechte(ModulID, SubModulID) and $0800 = $0800;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanFinish(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 12 auswerten
  Result := GetRechte(ModulID, SubModulID) and $1000 = $1000;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanPrint(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 13 auswerten
  Result := GetRechte(ModulID, SubModulID) and $2000 = $2000;
end;

//------------------------------------------------------------------------------
function TOFSecurity.CanEditPrintForm(ModulID, SubModulID: Integer): Boolean;
begin
  // Muﬂ Bit 14 auswerten
  Result := GetRechte(ModulID, SubModulID) and $4000 = $4000;
end;

//------------------------------------------------------------------------------
// Funktionen zum Record-Locking
//------------------------------------------------------------------------------
function TOFSecurity.SetLock(ModulID: String; SatzID: Integer): Boolean;
begin
  if Assigned (FOnSetLock) then
    Result := FOnSetLock(ModulId, SatzID)
  else
    Result := True;
end;

//------------------------------------------------------------------------------
function TOFSecurity.ReleaseLock(ModulID: String; SatzID: Integer): Boolean;
begin
  if Assigned(FOnReleaseLock) then
    Result := FOnReleaseLock(ModulID, SatzID)
  else
    Result := True;
end;

//------------------------------------------------------------------------------
{
function TOFSecurity.IsFreeLock(ModulID: String; SatzID: Integer): Boolean;
begin
  if Assigned(FOnIsFreeLock) then
    Result := FOnIsFreeLock(ModulID, SatzID)
  else
    Result := True;
end;
}

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// TOFZCustomDataset
//------------------------------------------------------------------------------
constructor TOFZCustomDataset.Create(AOwner: TComponent);
begin
  inherited;

  FOFSecurity    := nil;
  FOFModulID     := 0;
  FOFSubModulID  := 0;
  FUseRecordLock  := False;
  FShowLockErrors := False;
end;

//------------------------------------------------------------------------------
destructor TOFZCustomDataset.Destroy;
begin
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.SetLockIDField (NewLockIDField : String);
begin
  if NewLockIDField <> FLockIDField then
  begin
    try
      if (csLoading in ComponentState) or
         (Assigned(FieldByName(NewLockIDField))) then
      begin
        FLockIDField := NewLockIDField;
      end;
    except
      if not (csdesigning in componentstate) then
        raise;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoBeforeDelete;
begin
  // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
  // wenn nein, Abbruch
  if (Assigned(FOFSecurity)) and (FOFModulID > 0) and
     (not FOFSecurity.CanDelete(FOFModulID, FOFSubModulID)) then
  begin
    Abort;
  end;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoBeforeEdit;
begin
  // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
  // wenn nein, Abbruch
  if (Assigned(FOFSecurity)) and (FOFModulID > 0) and
     (not FOFSecurity.CanEdit(FOFModulID, FOFSubModulID)) then
  begin
    Abort;
  end;

  if (UseRecordLock) and (Assigned(FOFSecurity)) and (Length(LockIDField) > 0) then
  begin
    if FOFSecurity.SetLock('MOD_'+IntToStr(FOFModulID), FieldByName(LockIDField).AsInteger) = False then
    begin
      if (FShowLockErrors) and (Assigned(FOnLockError)) then
        FOnLockError(2);
      Abort;
    end;
  end;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoBeforeInsert;
begin
  // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
  // wenn nein, Abbruch
  if (Assigned(FOFSecurity)) and (FOFModulID > 0) and
     (not FOFSecurity.CanInsert(FOFModulID, FOFSubModulID)) then
  begin
    Abort;
  end;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoBeforePost;
begin
  // jetzt die Masterkomponente fragen ob die aktion erlaubt ist
  // wenn nein, Abbruch
  if (Assigned(FOFSecurity)) and (FOFModulID > 0) and
     (not FOFSecurity.CanEdit(FOFModulID, FOFSubModulID)) then
  begin
    Abort;
  end;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoAfterDelete;
begin
  if AutoReleaseLock then
    ReleaseLock;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoAfterPost;
begin
  if AutoReleaseLock then
    ReleaseLock;
  inherited;
end;

//------------------------------------------------------------------------------
procedure TOFZCustomDataset.DoAfterCancel;
begin
  if AutoReleaseLock then
    ReleaseLock;
  inherited;
end;

//------------------------------------------------------------------------------
function TOFZCustomDataset.ReleaseLock: Boolean;
begin
  if (UseRecordLock) and (Assigned(FOFSecurity)) and (length(LockIDField) > 0) then
  begin
    Result := FOFSecurity.ReleaseLock('MOD_'+IntToStr(FOfModulID),
                                       FieldByName(LockIDField).AsInteger);
  end else
  if UseRecordLock=False then
    Result := True
  else
    Result := False;
end;

//------------------------------------------------------------------------------
{
function TOFZCustomDataset.IsFreeLock: Boolean;
begin
  if (UseRecordLock) and (Assigned(FOfSecurity)) and (length(LockIDField) > 0) then
  begin
    Result := FOFSecurity.IsFreeLock('MOD_'+IntToStr(FOFModulID),
                                      FieldByName(LockIDField).AsInteger);
  end else
    Result := True;
end;
}

//------------------------------------------------------------------------------
function TOFZCustomDataset.SetLock: Boolean;
begin
  if (UseRecordLock) and (Assigned(FOFSecurity)) and (Length(LockIDField) > 0) then
  begin
    {
    if FOfSecurity.IsFreeLock('MOD_'+IntToStr(FOFModulID), FieldByName(LockIDField).AsInteger) then
    begin
      if FOFSecurity.SetLock ('MOD_'+IntToStr(FOFModulID), FieldByName(LockIDField).AsInteger) = False then
      begin
        if (FShowLockErrors) and (Assigned(FOnLockError)) then
          FOnLockError(2);
        Result := False;
      end else
        Result := True;
    end else
    }
    begin
      if FOfSecurity.SetLock('MOD_'+IntToStr(FOFModulID), FieldByName(LockIDField).AsInteger) then
      begin
        Result := True;
      end else
      begin
        if (FShowLockErrors) and (Assigned(FOnLockError)) then
          FOnLockError(1);
        Result := False;
      end;
    end;
  end else
    if UseRecordLock = False then
      Result := True
    else
      Result := False;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// TOFZTable
//------------------------------------------------------------------------------
constructor TOFZTable.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 //DefaultIndex := True;  //04.10.09-ud. rausgenommen...
 ReadOnly := False;
end;

{ TOFZQuery }

function TOFZQuery.GetParamsCount: Word;
begin
  Result := Params.Count;
end;

procedure TOFZTable.SetTableName(const Value: string);
begin
  if FTableName <> Value then
  begin
    FTableName := Value;
    if Value <> '' then
      SQL.Text := Format('SELECT * FROM %s', [FTableName])
    else
      SQL.Text := '';
  end;
end;

end.


{

Rechtetabelle f¸r OF :

select MODUL_ID, SUBMODUL_ID, RECHTE AS MASK
from BENUTZERRECHTE B
where
 GRUPPEN_ID=-1 and
 USER_ID=-1 and
 SUBMODUL_ID >-1

Gruppen :

select GRUPPEN_ID, MODUL_NAME AS GRUPPEN_NAME, RECHTE as GLOB_RECHTE
from BENUTZERRECHTE B
where
 GRUPPEN_ID>-1 and
 USER_ID=-1 and
 MODUL_ID = 0
order by
 GRUPPEN_ID


Gruppenrechte (alle Gruppen):

select GRUPPEN_ID, MODUL_ID, SUBMODUL_ID, RECHTE
from BENUTZERRECHTE B
where
 GRUPPEN_ID>-1 and
 USER_ID=-1 and
 MODUL_ID > 0
order by
 GRUPPEN_ID,
 MODUL_ID,
 SUBMODUL_ID


Gruppenrechte f¸r Gruppe 1 :

select GRUPPEN_ID, MODUL_ID, SUBMODUL_ID, RECHTE
from BENUTZERRECHTE B
where
 GRUPPEN_ID=1 and
 USER_ID=-1 and
 MODUL_ID > 0
order by
 GRUPPEN_ID,
 MODUL_ID,
 SUBMODUL_ID

Benutzerrechte :

select B.GRUPPEN_ID, M.MA_ID, B.MODUL_ID, B.SUBMODUL_ID, B.RECHTE
from BENUTZERRECHTE B, MITARBEITER M
where
 M.MA_ID=1 and 
 B.GRUPPEN_ID=M.GRUPPE_ID and
 M.MA_ID = B.USER_ID and 
 MODUL_ID > 0
order by
 GRUPPEN_ID,
 MODUL_ID,
 SUBMODUL_ID

}
