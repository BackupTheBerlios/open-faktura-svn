unit OFFlatPanel;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, LMessages, LResources;

type
  { TOFFlatPanel }

  TglSide = (fsdLeft, fsdTop, fsdRight, fsdBottom);
  TglSides = set of TglSide;

  TOFFlatPanel = class(TCustomPanel)
  private
    FTransparent: Boolean;
    FBevelSides: TglSides;
    FColorHighlight: TColor;
    FColorShadow: TColor;
    function GetBevelSides: TglSides;
    procedure SetBevelSides(Value: TglSides);
    procedure SetColorHighlight(const AValue: TColor);
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged (var Message: TWmNoParams); message CM_TEXTCHANGED;
    procedure SetColorShadow(const AValue: TColor);
    procedure SetTransparent (const Value: Boolean);
    procedure DrawBorder(aCanvas: TCanvas; Rect: TRect);
  protected
    procedure Paint; override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property AutoSize;
    property Anchors;
    property BiDiMode;
    property BevelSides: TglSides read GetBevelSides write SetBevelSides default [fsdLeft, fsdTop, fsdRight, fsdBottom];
    property BorderWidth default 0;
    property Caption;
    property Constraints;
    property Color;
    property ColorHighLight: TColor read FColorHighlight write SetColorHighlight default $008396A0;
    property ColorShadow: TColor read FColorShadow write SetColorShadow default $008396A0;
    property Cursor;
    property DragKind;
    property DragMode;
    property DragCursor;
    property DockSite;
    property Enabled;
    property Font;
    property Hint;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Transparent: Boolean read FTransparent write SetTransparent default false;
    property ParentBiDiMode;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property UseDockManager;
    property Visible;

    property OnEndDock;
    property OnStartDock;
    property OnConstrainedResize;
    property OnDockDrop;
    property OnDockOver;
    property OnGetSiteInfo;
    property OnUnDock;
    property OnContextPopup;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPaint;
    property OnResize;
    property OnStartDrag;
  end;

implementation

constructor TOFFlatPanel.Create (AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  SetBounds(0, 0, 185, 41);

  FBevelSides := [fsdLeft, fsdTop, fsdRight, fsdBottom];
  FColorHighLight := $008396A0;
  FColorShadow := $008396A0;
  ParentColor := True;
  ParentFont := True;
end;

procedure TOFFlatPanel.SetBevelSides(Value: TglSides);
begin
  if FBevelSides <> Value then
  begin
    FBevelSides := Value;
    Invalidate;
  end;
end;

function TOFFlatPanel.GetBevelSides: TglSides;
begin
  result := FBevelSides;
end;

procedure TOFFlatPanel.SetColorHighlight(const AValue: TColor);
begin
  if FColorHighlight = AValue then exit;
  FColorHighlight := AValue;
  Invalidate;
end;

procedure TOFFlatPanel.Paint;
var
  memoryBitmap: TBitmap;
  textBounds: TRect;
  TS: TTextStyle;
begin
  textBounds := ClientRect;

  memoryBitmap := TBitmap.Create; // erzeuge bitmap zur flickerfreien anzeige
  try
    // setze groesse
    memoryBitmap.Height := ClientRect.Bottom;
    memoryBitmap.Width := ClientRect.Right;


    // zeichne hintergrund
    if FTransparent then
    begin
      //DrawParentImage(Self, memoryBitmap.Canvas)
      memoryBitmap.Canvas.Brush.Color := Parent.Color;
      memoryBitmap.Canvas.FillRect(ClientRect);
    end else
    begin
      memoryBitmap.Canvas.Brush.Color := Self.Color;
      memoryBitmap.Canvas.FillRect(ClientRect);
    end;


    // zeichne rahmen
    DrawBorder(memoryBitmap.Canvas, ClientRect);


    // zeichne text
    InflateRect(textBounds, -BorderWidth, -BorderWidth);
    memoryBitmap.Canvas.Font := Self.Font;
    memoryBitmap.Canvas.Brush.Style := bsClear;

    TS := memoryBitmap.Canvas.TextStyle;
    TS.Alignment := Alignment;
    TS.Layout := tlCenter;
    TS.Opaque := false;
    TS.Clipping := false;
    TS.SystemFont := memoryBitmap.Canvas.Font.IsDefault;

    if not Enabled then
    begin
      OffsetRect(textBounds, 1, 1);
      memoryBitmap.Canvas.Font.Color := clBtnHighlight;
      memoryBitmap.Canvas.TextRect(textBounds, textBounds.Left, textBounds.Top, Caption, TS);

      OffsetRect(textBounds, -1, -1);
      memoryBitmap.Canvas.Font.Color := clBtnShadow;
      memoryBitmap.Canvas.TextRect(textBounds, textBounds.Left, textBounds.Top, Caption, TS);
    end else
    begin
      memoryBitmap.Canvas.TextRect(textBounds, textBounds.Left, textBounds.Top, Caption, TS);
    end;

    // kopiere memoryBitmap auf die oberflaeche
    canvas.CopyRect(ClientRect, memoryBitmap.canvas, ClientRect);
  finally
    memoryBitmap.free; // loesche bitmap
  end;

  if Assigned(OnPaint) then
    OnPaint(Self);
end;

procedure TOFFlatPanel.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TOFFlatPanel.CMTextChanged(var Message: TWmNoParams);
begin
  inherited;
  Invalidate;
end;

procedure TOFFlatPanel.SetColorShadow(const AValue: TColor);
begin
  if FColorShadow = AValue then exit;
  FColorShadow := AValue;
  Invalidate;
end;

procedure TOFFlatPanel.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

procedure TOFFlatPanel.DrawBorder(aCanvas: TCanvas; Rect: TRect);
var
  TopRight, BottomLeft: TPoint;

  procedure DrawLeft;
  begin
    aCanvas.Pen.Color := FColorHighlight;
    aCanvas.MoveTo(BottomLeft);
    aCanvas.LineTo(Rect.TopLeft);
  end;

  procedure DrawTop;
  begin
    aCanvas.Pen.Color := FColorHighlight;
    aCanvas.MoveTo(Rect.TopLeft);
    aCanvas.LineTo(TopRight);
  end;

  procedure DrawRight;
  begin
    aCanvas.Pen.Color := FColorShadow;
    aCanvas.MoveTo(TopRight);
    aCanvas.LineTo(Rect.BottomRight);
  end;

  procedure DrawBottom;
  begin
    aCanvas.Pen.Color := FColorShadow;
    aCanvas.MoveTo(Rect.BottomRight);
    aCanvas.LineTo(BottomLeft.x-1, BottomLeft.y);
  end;

begin
  aCanvas.Pen.Width := 1;
  Dec(Rect.Bottom);
  Dec(Rect.Right);
  TopRight.x := Rect.Right;
  TopRight.y := Rect.Top;
  BottomLeft.x := Rect.Left;
  BottomLeft.y := Rect.Bottom;

  if fsdLeft in FBevelSides then
    DrawLeft;

  if fsdTop in FBevelSides then
    DrawTop;

  if fsdRight in FBevelSides then
    DrawRight;

  if fsdBottom in FBevelSides then
    DrawBottom;
end;

end.

