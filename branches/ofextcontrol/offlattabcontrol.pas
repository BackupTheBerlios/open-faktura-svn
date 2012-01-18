unit OFFlatTabControl;

interface

{$mode objfpc}{$H+}

uses
  Windows, Messages, Classes, Controls, Forms, Graphics, StdCtrls, SysUtils,
  LMessages;

type

  TFlatTabPosition = (tpTop, tpBottom);

  { TOFFlatTabControl }

  TOFFlatTabControl = class(TCustomControl)
  private
    FTabPosition: TFlatTabPosition;
    FTabs: TStringList;
    FTabsRect: TList;
    FTabHeight: Integer;
    FTabSpacing: Integer;
    FActiveTab: Integer;
    FUnselectedColor: TColor;
    FSelectedColor: TColor;
    FBorderColor: TColor;
    FBackgroundColor: TColor;
    FOnTabChanged: TNotifyEvent;
    FBorderWidth: Integer;
    procedure SetBackgroundColor(const AValue: TColor);
    procedure SetBorderColors(const AValue: TColor);
    procedure SetTabs (Value: TStringList);
    procedure SetTabPosition (Value: TFlatTabPosition);
    procedure SetTabHeight (Value: Integer);
    procedure SetTabSpacing (Value: Integer);
    procedure SetActiveTab (Value: Integer);
    procedure SetTabRect;
    procedure CMDialogChar (var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure SetUnseletedColors(const AValue: TColor);
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure SetBorderWidth(const Value: Integer);
  protected
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    procedure TabsChanged (Sender: TObject);
    procedure FontChanged(Sender: TObject); virtual;
    procedure SetBiDiMode (Value: TBiDiMode); override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure EraseBackground(DC: HDC); override;
  published
    property Align;
    property BorderWidth: Integer read FBorderWidth write SetBorderWidth default 0;
    property ColorBorder: TColor read FBorderColor write SetBorderColors default $008396A0;
    property ColorUnselectedTab: TColor read FUnselectedColor write SetUnseletedColors default $00996633;
    property ColorBackground: TColor read FBackgroundColor write SetBackgroundColor default clBtnFace;
    property Tabs: TStringList read FTabs write SetTabs;
    property TabHeight: Integer read FTabHeight write SetTabHeight default 16;
    property TabSpacing: Integer read FTabSpacing write SetTabSpacing default 4;
    property TabPosition: TFlatTabPosition read FTabPosition write SetTabPosition default tpTop;
    property ActiveTab: Integer read FActiveTab write SetActiveTab default 0;
    property Font;
    property Color default clBtnFace;
    property ParentColor;
    property Enabled;
    property Visible;
    property Cursor;
    property ParentShowHint;
    property ParentFont;
    property ShowHint;
    property TabOrder;
    property TabStop;

    property OnEnter;
    property OnExit;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnTabChanged: TNotifyEvent read FOnTabChanged write FOnTabChanged;
    property Anchors;
    property BiDiMode write SetBidiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  end;

implementation

constructor TOFFlatTabControl.Create (AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  SetBounds(Left, Top, 289, 193);
  FTabs := TStringList.Create;
  FTabs.OnChange := @TabsChanged;
  FTabsRect := TList.Create;
  FTabHeight := 16;
  FTabSpacing := 4;
  FTabPosition := tpTop;
  FActiveTab := 0;

  ParentColor := true;
  ParentFont := true;

  Color := clBtnFace;
  FBorderColor := $008396A0;
  FUnselectedColor := $00996633;
  FSelectedColor := $00E1EAEB;  //nicht mehr verwendet...
  FBackgroundColor := clBtnFace;
end;

destructor TOFFlatTabControl.Destroy;
begin
  FTabs.Free;
  FTabsRect.Free;
  inherited;
end;

procedure TOFFlatTabControl.EraseBackground(DC: HDC);
begin
  // Entfernen Sie den Kommentar um das geerbte Löschen des Hintergrundes zu aktivieren
  //inherited EraseBackground(DC);
end;

procedure TOFFlatTabControl.CMSysColorChange (var Message: TMessage);
begin
  Invalidate;
end;

procedure TOFFlatTabControl.Loaded;
begin
  inherited;
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.WMSize (var Message: TWMSize);
begin
  inherited;
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.CMEnabledChanged (var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TOFFlatTabControl.SetUnseletedColors(const AValue: TColor);
begin
  if FUnselectedColor = AValue then exit;
  FUnselectedColor := AValue;
  Invalidate;
end;

procedure TOFFlatTabControl.SetTabPosition (Value: TFlatTabPosition);
var
  I: Integer;
  r: TRect;
begin
  if Value <> FTabPosition then
  begin
    for I := 0 to ControlCount - 1 do // neu positionieren der client komponenten
    begin
      if Value = tpTop then
        Controls[I].Top := Controls[I].Top + TabHeight
      else
        Controls[I].Top := Controls[I].Top - TabHeight;
    end;
    FTabPosition := Value;
    SetTabRect;
    Invalidate;
    r := ClientRect;
    AlignControls(self, r);
  end;
end;

procedure TOFFlatTabControl.SetActiveTab (Value: Integer);
begin
  if FTabs <> nil then
  begin
    if Value > (FTabs.Count - 1) then
      Value := FTabs.Count - 1
    else
      if Value < 0 then
        Value := 0;

    FActiveTab := Value;
    if Assigned(FOnTabChanged) then
      FOnTabChanged(Self);
    Invalidate;
  end
  else
    FActiveTab := 0;
  if csDesigning in ComponentState then
    if (GetParentForm(self) <> nil) and (GetParentForm(self).Designer <> nil) then
      GetParentForm(self).Designer.Modified;
end;

procedure TOFFlatTabControl.SetTabs(Value: TStringList);
var
  counter: Integer;
begin
  FTabs.Assign(Value);
  if FTabs.Count = 0 then // keine tabs? dann activetab = 0
    FActiveTab := 0
  else
  begin
    if (FTabs.Count - 1) < FActiveTab then // wenn activeTab > last-tab dann activeTab = letzter tab
      FActiveTab := FTabs.Count - 1;
    for counter := 0 to FTabs.Count - 1 do
      FTabs[counter] := Trim(FTabs[counter]); // loesche alle leerzeichen links und rechts
  end;
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.SetBorderColors(const AValue: TColor);
begin
  if FBorderColor = AValue then exit;
  FBorderColor := AValue;
  Invalidate;
end;

procedure TOFFlatTabControl.SetBackgroundColor(const AValue: TColor);
begin
  if FBackgroundColor = AValue then exit;
  FBackgroundColor := AValue;
  Invalidate;
end;

procedure TOFFlatTabControl.SetTabHeight (Value: Integer);
var
  r: TRect;
begin
  if Value < 0 then Value := 0; // tabhoehe darf nich negativ sein
  FTabHeight := Value;
  SetTabRect;
  r := ClientRect;
  AlignControls(self, r);
  Invalidate;
end;

procedure TOFFlatTabControl.SetTabSpacing (Value: Integer);
begin
  if Value < 1 then Value := 1; // minimaler tabspacing = 1
  FTabSpacing := Value;
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.SetTabRect;
var
  TabCount: Integer;
  TabRect: ^TRect;
  position: TPoint;
  CaptionTextWidth: Integer;
  CaptionTextString: string;
begin
  // font setzen und tabrect list loeschen
  Canvas.Font := Font;
  FTabsRect.Clear;

  // setze links/open position auf den ersten tab
  case FTabPosition of
    tpTop:
      if BidiMode = bdRightToLeft then
        position := Point(ClientRect.right, ClientRect.top)
      else
        position := Point(ClientRect.left, ClientRect.top);
    tpBottom:
      if BidiMode = bdRightToLeft then
        position := Point(ClientRect.right, ClientRect.bottom - FTabHeight)
      else
        position := Point(ClientRect.left, ClientRect.bottom - FTabHeight);
  end;

  for TabCount := 0 to (FTabs.Count - 1) do
  begin
    New(TabRect); // erzeuge ein neues tabrect
    if Pos('&', FTabs[TabCount]) <> 0 then // ist ein & im text
    begin
      CaptionTextString := FTabs[TabCount];
      Delete(CaptionTextString, Pos('&', FTabs[TabCount]), 1); // loesche &
      CaptionTextWidth := canvas.TextWidth(CaptionTextString); // berechne die textbreite ohne &
    end
    else // berechne die textbreite
      CaptionTextWidth := canvas.TextWidth(FTabs[TabCount]);

    if BidiMode = bdRightToLeft then
    begin
      case FTabPosition of // setze das rechteck
        tpTop:
          TabRect^ := Rect(position.x - CaptionTextWidth - 20, position.y, position.x, FTabHeight);
        tpBottom:
          TabRect^ := Rect(position.x - CaptionTextWidth - 20, position.y, position.x, position.y + FTabHeight);
      end;
      position := Point(position.x - CaptionTextWidth - 20 - FTabSpacing, position.y); // set left/top position for next rect
    end
    else
    begin
      case FTabPosition of // setze das rechteck
        tpTop:
          TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, FTabHeight);
        tpBottom:
          TabRect^ := Rect(position.x, position.y, position.x + CaptionTextWidth + 20, position.y + FTabHeight);
      end;
      position := Point(position.x + CaptionTextWidth + 20 + FTabSpacing, position.y); // set left/top position for next rect
    end;
    FTabsRect.Add(TabRect); // fuege das tabrect in die tabrect-liste
  end;
end;

procedure TOFFlatTabControl.CMDialogChar (var Message: TCMDialogChar);
var
  currentTab: Integer;
begin
  with Message do
  begin
    if FTabs.Count > 0 then
    begin
      for currentTab := 0 to FTabs.Count - 1 do
      begin
        if IsAccel(CharCode, FTabs[currentTab]) then
        begin
          if (FActiveTab <> currentTab) then
          begin
            SetActiveTab(currentTab);
            SetFocus;
          end;
          Result := 1; 
          break;
        end;
      end;
    end
    else
      inherited;
  end;
end;

procedure TOFFlatTabControl.Paint;
var
  memoryBitmap: TBitmap;
  TabCount: Integer;
  TempRect: ^TRect;
  TS: TTextStyle;
begin
  memoryBitmap := TBitmap.Create; // erzeuge bitmap zur flickerfreien anzeige
  try
    memoryBitmap.Height := ClientRect.Bottom;
    memoryBitmap.Width := ClientRect.Right;
    memoryBitmap.Canvas.Font := Font;

    // loesche den hintergrund
    if FTabs.Count > 0 then
    begin
      //DrawParentImage(Self, memoryBitmap.Canvas);
      memoryBitmap.Canvas.Brush.Color := FBackgroundColor; //?????
      memoryBitmap.Canvas.FillRect(ClientRect);
    end else
    begin
      memoryBitmap.Canvas.Brush.Color := FBackgroundColor;
      memoryBitmap.Canvas.Brush.Style := bsSolid; //?????
      memoryBitmap.Canvas.FillRect(ClientRect);
    end;

    // zeichne rahmen
    if FTabs.Count = 0 then
    begin
      memoryBitmap.canvas.Brush.Color := FBorderColor;
      memoryBitmap.canvas.FrameRect(ClientRect)
    end
    else
    begin
      memoryBitmap.canvas.Pen.Color := FBorderColor;
      TempRect := FTabsRect.Items[FActiveTab];
      if ClientRect.left <> TempRect^.left then // ist das aktive tab nicht das erste, dann __|tab|___
      begin
        case FTabPosition of
          tpTop:
          begin
            memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.top + FTabHeight), Point(TempRect^.Left, ClientRect.top + FTabHeight)]);
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.top + FTabHeight), Point(ClientRect.right, ClientRect.top + FTabHeight)]);
          end;
          tpBottom:
          begin
            memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.bottom - FTabHeight - 1), Point(TempRect^.Left, ClientRect.bottom - FTabHeight - 1)]);
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.right, ClientRect.bottom - FTabHeight - 1)]);
          end;
        end;
      end
      else // sonst |tab|___
        case FTabPosition of
          tpTop:
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.top + FTabHeight), Point(ClientRect.right, ClientRect.top + FTabHeight)]);
          tpBottom:
            memoryBitmap.Canvas.Polyline([Point(TempRect^.Right-1, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.right, ClientRect.bottom - FTabHeight - 1)]);
        end;
      // grenzen
      case FTabPosition of
        tpTop:
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.top + FTabHeight), Point(ClientRect.left, ClientRect.bottom - 1), Point(ClientRect.right - 1, ClientRect.bottom - 1), Point(ClientRect.right - 1, ClientRect.top + FTabHeight)]);
        tpBottom:
          memoryBitmap.Canvas.Polyline([Point(ClientRect.left, ClientRect.bottom - FTabHeight - 1), Point(ClientRect.left, ClientRect.top), Point(ClientRect.right - 1, ClientRect.top), Point(ClientRect.right - 1, ClientRect.bottom - FTabHeight - 1)]);
      end;
    end;

    case FTabPosition of
      tpTop:
        begin
          memoryBitmap.Canvas.Brush.Color := Color;
          memoryBitmap.Canvas.Brush.Style := bsSolid;
          memoryBitmap.Canvas.FillRect(Rect(ClientRect.left + 1, ClientRect.top + FTabHeight + 1, ClientRect.right - 1, ClientRect.bottom - 1));
        end;
      tpBottom:
        begin
          memoryBitmap.canvas.brush.color := Color;
          memoryBitmap.Canvas.Brush.Style := bsSolid;
          memoryBitmap.Canvas.FillRect(Rect(ClientRect.left + 1, ClientRect.top + 1, ClientRect.right - 1, ClientRect.bottom - FTabHeight - 1));
        end;
    end;

    // zeichne tabs
    for TabCount := 0 to FTabs.Count - 1 do
    begin
      TempRect := FTabsRect.Items[TabCount];
      memoryBitmap.canvas.brush.style := bsclear;
      memoryBitmap.canvas.pen.color := clBlack;
      if TabCount = FActiveTab then // ist das aktive tab nicht das erste, dann rahmen |^^^|
      begin
        memoryBitmap.canvas.font.color := Font.Color;
        memoryBitmap.canvas.brush.color := Color;
        memoryBitmap.Canvas.Brush.Style := bsSolid;
        memoryBitmap.canvas.pen.color := FBorderColor;
        case FTabPosition of
          tpTop:
            begin
              memoryBitmap.Canvas.FillRect(Rect(TempRect^.left, TempRect^.top, TempRect^.right - 1, TempRect^.bottom + 1));
              memoryBitmap.Canvas.Polyline([Point(TempRect^.Left, TempRect^.Bottom), Point(TempRect^.Left, TempRect^.Top), Point(TempRect^.Right-1, TempRect^.Top), Point(TempRect^.Right-1, TempRect^.Bottom)]);
            end;
          tpBottom:
            begin
              memoryBitmap.Canvas.FillRect(Rect(TempRect^.left, TempRect^.top - 1, TempRect^.right - 1, TempRect^.bottom));
              memoryBitmap.Canvas.Polyline([Point(TempRect^.Left, TempRect^.top - 1), Point(TempRect^.Left, TempRect^.bottom - 1), Point(TempRect^.Right-1, TempRect^.bottom - 1), Point(TempRect^.Right-1, TempRect^.top - 1)]);
            end;
        end;
      end
      else // sonst fuell das tab
      begin
        memoryBitmap.canvas.Font.Color := Color;
        memoryBitmap.canvas.Brush.Color := FUnselectedColor;
        memoryBitmap.Canvas.Brush.Style := bsSolid;
        memoryBitmap.Canvas.FillRect(TempRect^);
      end;

      memoryBitmap.Canvas.Brush.Style := bsClear;
      TS := memoryBitmap.Canvas.TextStyle;
      TS.Alignment := taCenter;
      TS.Layout := tlCenter;
      TS.Opaque := false;
      TS.Clipping := false;
      TS.ShowPrefix := true;
      //TS.RightToLeft := ??;
      TS.SystemFont := memoryBitmap.Canvas.Font.IsDefault;

      if (TabCount = FActiveTab) and not Enabled then
      begin
        memoryBitmap.Canvas.Font.Color := FUnselectedColor;
        memoryBitmap.Canvas.TextRect(TempRect^, TempRect^.Left, TempRect^.Top, FTabs[TabCount], TS);
      end else
      begin
        memoryBitmap.Canvas.TextRect(TempRect^, TempRect^.Left, TempRect^.Top, FTabs[TabCount], TS);
      end;

    end;
    canvas.CopyRect(ClientRect, memoryBitmap.canvas, ClientRect); // kopiere bitmap auf die oberflaeche
  finally
    memoryBitmap.free; // loesche bitmap
  end;
  //inherited Paint;
end;

procedure TOFFlatTabControl.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  cursorPos: TPoint;
  currentTab: Integer;
  currentRect: ^TRect;
begin
  GetCursorPos(cursorPos);
  cursorPos := ScreenToClient(cursorPos);

  if FTabs.Count > 0 then
  begin
    for currentTab := 0 to FTabs.Count - 1 do
    begin
      currentRect := FTabsRect.Items[currentTab];
      if PtInRect(currentRect^, cursorPos) then
        if (FActiveTab <> currentTab) then // nur aender wenn neues tab gewaehlt
        begin
          SetActiveTab(currentTab);
          SetFocus;
        end;
    end;
  end;
  inherited;
end;

procedure TOFFlatTabControl.AlignControls (AControl: TControl; var Rect: TRect);
begin
  case FTabPosition of
    tpTop:
      SetRect(Rect, clientRect.left + 1 + FBorderWidth, clientRect.top +
        TabHeight + 1 + FBorderWidth, clientRect.right - 1 - FBorderWidth,
        clientRect.bottom - 1 - FBorderWidth);
    tpBottom:
      SetRect(Rect, clientRect.left + 1 + FBorderWidth, clientRect.top + 1 +
        FBorderWidth, clientRect.right - 1 - FBorderWidth, clientRect.bottom -
        TabHeight - 1 - FBorderWidth);
  end;
  inherited;
end;

procedure TOFFlatTabControl.WMMove(var Message: TWMMove);
begin
  inherited;
  Invalidate;
end;

procedure TOFFlatTabControl.SetBiDiMode(Value: TBiDiMode);
begin
  inherited;
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.TabsChanged (Sender: TObject);
begin
  SetTabRect;
  Invalidate;
end;

procedure TOFFlatTabControl.FontChanged(Sender: TObject);
begin
  ParentFont := False;
  Invalidate;
end;

procedure TOFFlatTabControl.SetBorderWidth(const Value: Integer);
var
  r: TRect;
begin
  if Value <> FBorderWidth then
  begin
    FBorderWidth := Value;
    r := ClientRect;
    AlignControls(self, r);
  end;
end;

end.
