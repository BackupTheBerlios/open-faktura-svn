{*******************************************************}
{                                                       }
{     TCtrlLabel Component for Borland Delphi           }
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

unit OFCtrlLabel;

{$I OFDelVers.INC}

interface

uses
  Messages, Windows, SysUtils, Classes, Controls, StdCtrls;

type
  TAttach = (atNone, atTop, atBottom, atLeft, atRight);

  TOFCtrlLabel = class(TCustomLabel)
  private
    FAttach: TAttach;
    FControl: TControl;
    FMargin: Integer;
    FSpacing: Integer;
    FStretch: Boolean;
    FAdjusting: Boolean;
    procedure AdjustPlacement;
    function GetFocusControl: TControl; //TWinControl;
    procedure SetAttach(Value: TAttach);
    procedure SetFocusControl(Value: TControl{TWinControl});
    procedure SetMargin(Value: Integer);
    procedure SetSpacing(Value: Integer);
    procedure SetStretch(Value: Boolean);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  protected
    procedure Loaded; override;
    procedure Paint; override;
    procedure SetAutoSize(Value: Boolean); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Alignment;
    property Attach: TAttach read FAttach write SetAttach default atLeft;
    property AutoSize;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl: TControl{TWinControl} read GetFocusControl write SetFocusControl;
    property Font;
    property Margin: Integer read FMargin write SetMargin default 3;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property Stretch: Boolean read FStretch write SetStretch;
    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Open-Faktura', [TOFCtrlLabel]);
end;

constructor TOFCtrlLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAttach := atLeft;
  FMargin := 3;
  FSpacing := 4;
end;

procedure TOFCtrlLabel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FocusControl) then
    FControl := nil;
end;

procedure TOFCtrlLabel.AdjustPlacement;
var
  R: TRect;
begin
  if not (csLoading in ComponentState) and Assigned(FControl) and not FAdjusting then
  begin
    FAdjusting := True;
    try
      R := FControl.BoundsRect;
      case Attach of
        atTop:
          if Stretch then
            SetBounds(R.Left, R.Top - Height - Spacing, R.Right - R.Left, Height)
          else
            SetBounds(R.Left + Margin, R.Top - Height - Spacing, Width, Height);
        atBottom:
          if Stretch then
            SetBounds(R.Left, R.Bottom + Spacing, R.Right - R.Left, Height)
          else
            SetBounds(R.Left + Margin, R.Bottom + Spacing, Width, Height);
        atLeft:
          if Stretch then
            SetBounds(R.Left - Width - Spacing, R.Top, Width, R.Bottom - R.Top)
          else
            SetBounds(R.Left - Width - Spacing, R.Top + Margin, Width, Height);
        atRight:
          if Stretch then
            SetBounds(R.Right + Spacing, R.Top, Width, R.Bottom - R.Top)
          else
            SetBounds(R.Right + Spacing, R.Top + Margin, Width, Height);
      end;
    finally
      FAdjusting := False;
    end;
  end;
end;

function TOFCtrlLabel.GetFocusControl: TControl;  //TWinControl;
begin
  //Result := inherited FocusControl;
  Result := FControl;
end;

procedure TOFCtrlLabel.SetAutoSize(Value: Boolean);
begin
  inherited SetAutoSize(Value);
  AdjustPlacement;
end;

procedure TOFCtrlLabel.SetAttach(Value: TAttach);
begin
  if Value <> FAttach then
  begin
    FAttach := Value;
    AdjustPlacement;
  end;
end;

procedure TOFCtrlLabel.SetFocusControl(Value: TControl{TWinControl});
begin
  if FControl <> Value then
  begin
    //inherited FocusControl := Value;
    FControl := Value;
    //FConColor := FControl.Color;
    AdjustPlacement;
  end;
end;

procedure TOFCtrlLabel.SetMargin(Value: Integer);
begin
  if Value <> FMargin then
  begin
    FMargin := Value;
    AdjustPlacement;
  end;
end;

procedure TOFCtrlLabel.SetSpacing(Value: Integer);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    AdjustPlacement;
  end;
end;

procedure TOFCtrlLabel.SetStretch(Value: Boolean);
begin
  if Value <> FStretch then
  begin
    FStretch := Value;
    AdjustPlacement;
  end;
end;

procedure TOFCtrlLabel.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FControl) then FControl.Enabled := Enabled;
end;

procedure TOFCtrlLabel.CMTextChanged(var Message: TMessage);
begin
  inherited;
  AdjustPlacement;
end;

procedure TOFCtrlLabel.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustPlacement;
end;

procedure TOFCtrlLabel.Loaded;
begin
  inherited Loaded;
  AdjustPlacement;
end;

procedure TOFCtrlLabel.Paint;
begin
  inherited Paint;
  AdjustPlacement;
end;

end.

