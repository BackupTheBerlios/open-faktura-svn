{*******************************************************}
{                                                       }
{   TValueComboBox Component for Borland Delphi         }
{                                                       }
{       Copyright (c) 1998-2009 Udo Dembeck             }
{                                                       }
{*******************************************************}
{  This library is free software; you can redistribute  }
{  it and/or modify it under the terms of the           }
{  GNU General Public License as published by the       }
{  Free Software Foundation; either version 2 of the    }
{  License, or (at your option) any later version.      }
{*******************************************************}

unit OFValueComboBox;

//26.05.09-ud.

{$I OFDelVers.INC}

interface

uses
  Windows, Messages, Classes, Controls,
  {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} StdCtrls;

type
  TOFValueComboBox = class(TComboBox)
  private
    FValues: TStrings;
    FEnableValues: Boolean;
    function GetItemValue: Variant;
    function GetText: TCaption;
    procedure SetItemValue(Value: Variant);
    procedure SetText(const Value: TCaption);
    procedure SetEnableValues(Value: Boolean);
    procedure SetValues(Value: TStrings);
  protected
    procedure SetStyle(Value: TComboBoxStyle); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Add(const S: string; Value: Variant);
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Insert(Index: Integer; const S: string; Value: Variant);
    property ItemValue: Variant read GetItemValue write SetItemValue;
  published
    property EnableValues: Boolean read FEnableValues write SetEnableValues default True;
    property Values: TStrings read FValues write SetValues;
    property Text: TCaption read GetText write SetText;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Open-Faktura', [TOFValueComboBox]);
end;

constructor TOFValueComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FValues := TStringList.Create;
  EnableValues := True;
end;

destructor TOFValueComboBox.Destroy;
begin
  FValues.Free;
  inherited Destroy;
end;

function TOFValueComboBox.GetItemValue: Variant;
begin
  if (ItemIndex < 0) or (ItemIndex >= Values.Count) then
    VarClear(Result)
  else
    Result := Values[ItemIndex];
end;

function TOFValueComboBox.GetText: TCaption;
begin
  if EnableValues then
  begin
    if (ItemIndex < 0) or (ItemIndex >= Values.Count) then
      Result := ''
    else
      Result := Values[ItemIndex];
  end else
    Result := inherited Text;
end;

procedure TOFValueComboBox.SetItemValue(Value: Variant);
var
  I: Integer;
begin
  if not VarIsEmpty(Value) then I := Values.IndexOf(Value) else I := -1;
  if I >= Items.Count then I := -1;
  if (I < 0) and (not FEnableValues) then //26.05.09-ud.
    I := Items.IndexOf(Value);
  if I <> ItemIndex then
  begin
    ItemIndex := I;
    Change;
  end;
end;

procedure TOFValueComboBox.SetText(const Value: TCaption);
begin
  if Text <> Value then
  begin
    if EnableValues then
      ItemValue := Value
    else
      inherited Text := Value;
  end;
end;

procedure TOFValueComboBox.SetEnableValues(Value: Boolean);
begin
  if FEnableValues <> Value then
  begin
    if Value and (Style in [csDropDown, csSimple]) then
      Style := csDropDownList;
    FEnableValues := Value;
  end;
end;

procedure TOFValueComboBox.SetValues(Value: TStrings);
begin
  FValues.Assign(Value);
end;

procedure TOFValueComboBox.SetStyle(Value: TComboBoxStyle);
begin
  if EnableValues and (Value in [csSimple, csDropDown]) then
    Value := csDropDownList;
  inherited SetStyle(Value);
end;

procedure TOFValueComboBox.Add(const S: string; Value: Variant);
begin
  Items.Add(S);
  Values.Add(VarAsType(Value, varString));
end;

procedure TOFValueComboBox.Clear;
begin
  inherited Clear;
  Values.Clear;
end;

procedure TOFValueComboBox.Delete(Index: Integer);
begin
  Items.Delete(Index);
  Values.Delete(Index);
end;

procedure TOFValueComboBox.Insert(Index: Integer; const S: string; Value: Variant);
begin
  Items.Insert(Index, S);
  Values.Insert(Index, VarAsType(Value, varString));
end;

end.

