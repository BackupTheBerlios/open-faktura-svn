{******************************************************************************}
{         Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org          }
{******************************************************************************}
{ PROJEKT      : OpenFaktura                                                   }
{ BESCHREIBUNG : Datenbankgrid                                                 }
{                                                                              }
{ Dieser Programmcode basiert auf:                                             }
{   Quellen von CAO-Faktura,                                                   }
{   Copyright (C) 2003 Jan Pokrandt / Jan@JP-SOFT.de                           }
{                                                                              }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code based on the sources of CAO-Faktura, see above             }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id:$ }
{                                                                              }
{ History:                                                                     }
{ 14.10.09-ud.  Namensänderung  TCaoDBGrid -> TOFDBGrid                        }
{               Registernamen geändert CAO-Faktura -> Open-Faktura             }
{                                                                              }
{ Todo:                                                                        }
{ -                                                                            }
{                                                                              }
{ Issues, notes:                                                               }
{ -                                                                            }
{******************************************************************************}

unit OFDBGrid;

{$I OFDelVers.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, Grids, DBGrids, JvExDBGrids, JvDBGrid;

type
  TCellAttribute = procedure(Sender: TObject; Field: TField; Canvas: TCanvas;
                             State: TGridDrawState) of object;

type
  TOFDBGrid = class(TJvDBGrid)
  private
    { Private-Deklarationen }
    GCheckWidth       : Integer;
    GCheckHeight      : Integer;

    FFlat             : Boolean;

    FNewDefRowHeight  : Integer;
    FLockedHeight     : Word;
    FRowHeight        : Integer;
    FTitleRowHeight   : Integer;
    FMultiLineTitles  : Boolean;
    FLinesPerRow      : Integer;

    FDisplayMemo      : Boolean;
    FDisplayBool      : Boolean;
    FDisplayDateTime  : Boolean;
    FUseRowColors     : Boolean;
    FShowTextEllipsis : Boolean;
    FShowTitleEllipsis: Boolean;
    FRowSizingAllowed : Boolean;
    FMultiLineRows    : Boolean;
    FExtendedScroll   : Boolean;

    FRowColor1        : TColor;
    FRowColor2        : TColor;
    FEditColor        : TColor;

    FOnApplyCellAttribute: TCellAttribute;

    procedure SendSizeMessage;
    procedure LockHeight;
    procedure UnLockHeight;
    procedure CalcTitleHeight;
    function MaxColIndex: Integer;
    procedure UpdateTitlesHeight;
  protected
    { Protected-Deklarationen }
    FOnColResize: TNotifyEvent;
    FInplaceEdit: TInplaceEdit;

    function CreateEditor: TInplaceEdit; override;
    function GetDefaultRowHeight: Integer;
    procedure SetDefaultRowHeight(Value: Integer);

    procedure LayoutChanged; override;
    procedure RowHeightsChanged; override;

    procedure SetDisplayMemo(value: Boolean);
    procedure SetDisplayBool(Value: Boolean);
    procedure SetDisplayDateTime(Value: Boolean);
    procedure SetRowColor1(Value: TColor);
    procedure SetRowColor2(Value: TColor);
    procedure SetUseRowColors(Value: Boolean);
    procedure SetShowTextEllipsis(Value: Boolean);
    procedure SetShowTitleEllipsis(Value: Boolean);
    procedure SetRowSizingAllowed(Value: Boolean);
    procedure SetMultiLineRows(Value: Boolean);
    procedure SetMultiLineTitles(Value: Boolean);
    procedure SetLinesPerRow(Value: Integer);
    procedure SetExtendedScroll(Value: Boolean);
    procedure SetFlat(Value: Boolean);

    function CanEditShow: Boolean; override;
    procedure ColWidthsChanged; override;

    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure ApplyCellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState);

  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure WMHScroll(var Msg: TWMHScroll); message wm_HScroll;
    procedure WMVScroll(var Msg: TWMVScroll); message wm_VScroll;

  published
    { Published-Deklarationen }
    property DisplayMemo: Boolean read FDisplayMemo write SetDisplayMemo default True;
    property DisplayBoolean: Boolean read FDisplayBool write SetDisplayBool default True;
    property DisplayDateTime: Boolean read FDisplayDateTime write SetDisplayDateTime default True;
    property RowColor1: TColor read FRowColor1 write SetRowColor1;
    property RowColor2: TColor read FRowColor2 write SetRowColor2;
    property UseRowColors: Boolean read FUseRowColors write SetUseRowColors default True;
    property ShowTextEllipsis: Boolean read FShowTextEllipsis write SetShowTextEllipsis default True;
    property ShowTitleEllipsis: Boolean read FShowTitleEllipsis write SetShowTitleEllipsis default False;
    property RowSizingAllowed: Boolean read FRowSizingAllowed write SetRowSizingAllowed default False;
    property MultiLineRows: Boolean read FMultiLineRows write SetMultiLineRows default False;
    property DefaultRowHeight: Integer read GetDefaultRowHeight write SetDefaultRowHeight;
    property MultiLineTitles: Boolean read FMultiLineTitles write SetMultiLineTitles default False;
    property LinesPerRow: Integer read FLinesPerRow write SetLinesPerRow default 1;
    property ExtendedScroll: Boolean read FExtendedScroll write SetExtendedScroll default True;

    property Flat : Boolean read FFlat write SetFlat default True;
    property EditColor: TColor read FEditColor write FEditColor;

    property OnApplyCellAttribute: TCellAttribute read FOnApplyCellAttribute write FOnApplyCellAttribute;
    property OnColumnResize: TNotifyEvent read FOnColResize write FOnColResize;
  end;

  TOFInplaceEditCracker = class(TInplaceEdit)
  public
    property Color;
  end;

  TOFDBGridMod = class(TCustomGrid)
  public
    property Options;
    property RowHeights;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Open-Faktura', [TOFDBGrid]);
end;

constructor TOFDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  DefaultDrawing    := False;
  BorderStyle       := bsSingle;
  FDisplayMemo      := True;
  FDisplayBool      := True;
  FDisplayDateTime  := True;
  FUseRowColors     := True;
  FShowTextEllipsis := True;
  FRowSizingAllowed := False;
  FMultiLineTitles  := False;
  FExtendedScroll   := True;
  FFlat             := True;

  FNewDefRowHeight  := 0;
  FLockedHeight     := 0;
  FRowheight        := 16;
  FTitleRowHeight   := 0;
  FLinesPerRow      := 1;

  FRowColor1        := clWindow;
  FRowColor2        := $00E2E2E2; // hellgrau
  FEditColor        := clWindow;

  //--------------

  with TBitmap.Create do
  try
    Handle := LoadBitmap(0, PChar(32759));
    GCheckWidth := Width div 4;
    GCheckHeight := Height div 3;
  finally
    Free;
  end;
end;

destructor TOFDBGrid.Destroy;
begin
  inherited Destroy;
end;

function TOFDBGrid.CreateEditor: TInplaceEdit;
begin
  Result := inherited CreateEditor;

  TOFInplaceEditCracker(Result).Color := FEditColor;
  FInplaceEdit := Result;
end;

procedure TOFDBGrid.SendSizeMessage;
var Message: TMessage;
begin
  if HandleAllocated and (FNewDefRowHeight <> 0) then
  begin
    Message.Msg      := WM_Size;
    Message.WParam   := SIZE_RESTORED;
    Message.lParamLo := Width;
    Message.lParamHi := Height;
    Perform(Message.Msg, Message.wParam, Message.lParam);
  end;
end;

procedure TOFDBGrid.LockHeight;
begin
  Inc(FLockedHeight);
end;

procedure TOFDBGrid.UnLockHeight;
begin
  Dec(FLockedHeight);
end;

function TOFDBGrid.GetDefaultRowHeight: Integer;
begin
  Result := inherited DefaultRowHeight;
end;

procedure TOFDBGrid.CalcTitleHeight;
var
  ColNo, NewHeight: Integer;
begin
  if dgTitles in Options then
  begin
    if FTitleRowHeight = 0 then
    begin
      if (Columns.Count > 0) and HandleAllocated then
      begin
        for ColNo := 0 to MaxColIndex do
        begin
          {$IFDEF EX_COMPILER_4_UP}
          if Columns[ColNo].Visible then
          {$ENDIF}
          begin
            Canvas.Font.Assign(Columns[ColNo].Title.Font);
            NewHeight := Canvas.TextHeight('Â_');
            if NewHeight > FTitleRowHeight then
              FTitleRowHeight := NewHeight;
          end;
        end;
      end;

      if FTitleRowHeight = 0 then
        FTitleRowHeight := DefaultRowHeight
      else
        Inc(FTitleRowHeight, 4);
    end;
    RowHeights[0] := FTitleRowHeight;
  end;
end;

procedure TOFDBGrid.LayoutChanged;
begin
  inherited;
  if FLockedHeight = 0 then
  begin
    FTitleRowHeight := 0;
    SetDefaultRowHeight(FNewDefRowHeight);
  end;
  SendSizeMessage;
  if FMultiLineTitles then
    UpdateTitlesHeight;
  if MultiLineRows then
    SetDefaultRowHeight(FRowHeight * LinesPerRow);
end;

procedure TOFDBGrid.RowHeightsChanged;
var
  RowNo: Integer;
begin
  if (DataSource <> nil) and (DataSource.DataSet <> nil) and
     (DataSource.Dataset.Active) then
  begin
    for RowNo := 1 to VisibleRowCount+1 do
    begin
      if RowHeights[RowNo] <> DefaultRowHeight then
      begin
        DefaultRowHeight := RowHeights[RowNo];
        SendSizeMessage;
        if not (dgAlwaysShowEditor in TOFDBGrid(Self).Options) then
          inherited;
        Break;
      end;
    end;
  end;
end;

function TOFDBGrid.MaxColIndex: Integer;
begin
  Result := ColCount - 1;
  if dgIndicator in Options then
    Dec(Result);
end;

procedure TOFDBGrid.UpdateTitlesHeight;

  function Max(X, Y: Integer): Integer;
  begin
    if X > Y then
      Result := X
    else
      Result := Y;
  end;

var
  i, MaxHeight: Integer;
  RRect: TRect;
begin
  if FMultiLineTitles then
  begin
    if (dgTitles in Options) then
    begin
      MaxHeight := 0;
      for i := 0 to Columns.Count - 1 do
      begin
        RRect := CellRect(0, 0);
        RRect.Right := Columns[i].Width - 1;
        RRect.Left := 0;

        Canvas.Font := Columns[i].Title.Font;

        MaxHeight := Max(MaxHeight, DrawText(Canvas.Handle,
          PChar(Columns[i].Title.Caption),
          Length(Columns[i].Title.Caption),
          RRect,
          DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK)
        );
      end;

      if (MaxHeight <> 0) then
      begin
        if (dgRowLines in Options) then
          Inc(MaxHeight, 3)
        else
          Inc(MaxHeight, 2);

        RowHeights[0] := MaxHeight;
        if RowHeights[0] < 17 then
          RowHeights[0] := 17;
      end;
    end;
  end else
  begin
    if RowHeights[0] <> 17 then
      RowHeights[0] := 17;
  end;
end;

procedure TOFDBGrid.WMHScroll(var Msg: TWMHScroll);
begin
  BeginUpdate;
  if FExtendedScroll then
  begin
    try
      if Msg.ScrollCode = sb_ThumbTrack then
        Perform(wm_HScroll, MakeLong(sb_ThumbPosition, Msg.Pos), Msg.ScrollBar);
    except
    end;
  end;
  inherited;
  EndUpdate;
end;

procedure TOFDBGrid.WMVScroll(var Msg: TWMVScroll);
begin
  BeginUpdate;
  if FExtendedScroll then
  begin
    try
      if Msg.ScrollCode = sb_ThumbTrack then
        Perform(wm_VScroll, MakeLong(sb_ThumbPosition, Msg.Pos), Msg.ScrollBar);
    except
    end;
  end;
  inherited;
  EndUpdate;
end;

//------------------------------------------------------------------------------
function TOFDBGrid.CanEditShow: Boolean;
begin
  Result := Inherited CanEditShow;
  if (assigned(SelectedField)) and
     (
       (SelectedField.DataType = ftMemo) or
       (SelectedField.DataType = ftFmtMemo) or
       (SelectedField.DataType = ftBytes)
     ) then
  begin
    Result := False;
  end;
end;

procedure TOFDBGrid.SetDefaultRowHeight(Value: Integer);
begin
  if (Value <> FNewDefRowHeight) or (Value <> inherited DefaultRowHeight) then
  begin
    LockHeight;
    try
      if Value = 0 then
      begin
        FNewDefRowHeight := inherited DefaultRowHeight;
      end else
      begin
        FNewDefRowHeight := Value;
        BeginUpdate;
        try
          inherited DefaultRowHeight := Value;
          CalcTitleHeight;
        finally
          EndUpdate;
        end;
      end;
    finally
      UnLockHeight;
    end;
  end;
end;

procedure TOFDBGrid.SetDisplayMemo(value: Boolean);
begin
  if FDisplayMemo <> value then
  begin
    FDisplayMemo := value;
    ColEnter;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetDisplayBool(value: Boolean);
begin
  if FDisplayBool <> value then
  begin
    FDisplayBool := value;
    ColEnter;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetDisplayDateTime(value: Boolean);
begin
  if FDisplayDateTime <> value then
  begin
    FDisplayDateTime := value;
    ColEnter;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetRowColor1(Value: TColor);
begin
  if FRowColor1 <> Value then
  begin
    FRowColor1 := Value;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetRowColor2(Value: TColor);
begin
  if FRowColor2 <> Value then
  begin
    FRowColor2 := Value;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetUseRowColors(Value: Boolean);
begin
  if FUseRowColors <> Value then
  begin
    FUseRowColors := Value;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetShowTextEllipsis(Value: Boolean);
begin
  if FShowTextEllipsis <> Value then
  begin
    FShowTextEllipsis := Value;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetShowTitleEllipsis(Value: Boolean);
begin
  if FShowTitleEllipsis <> Value then
  begin
    FShowTitleEllipsis := Value;
    Invalidate;
  end;
end;


procedure TOFDBGrid.SetRowSizingAllowed(Value: Boolean);
begin
  if Value <> FRowSizingAllowed then
  begin
    FRowSizingAllowed := Value;
    if FRowSizingAllowed then
    begin
      if FMultiLineRows then
        FMultiLineRows := False;
      TOFDBGridMod(Self).Options := TOFDBGridMod(Self).Options +
                                     [goRowSizing, goColSizing,
                                      goThumbTracking, goTabs,
                                      goColMoving, goRowMoving,
                                      goDrawFocusSelected]
    end else
    begin
      TOFDBGridMod(Self).Options := TOFDBGridMod(Self).Options +
                                     [goColSizing, goThumbTracking, goTabs,
                                     goColMoving, goRowMoving,
                                     goDrawFocusSelected] - [goRowSizing];
    end;
  end;
end;

procedure TOFDBGrid.SetMultiLineRows(Value: Boolean);
begin
  if FMultiLineRows <> Value then
  begin
    FMultiLineRows := Value;

    if (FMultiLineRows) and (FRowSizingAllowed) then
      FRowSizingAllowed := False;

    LayoutChanged;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetMultiLineTitles(Value: Boolean);
begin
  if FMultiLineTitles <> Value then
  begin
    FMultiLineTitles := Value;
    Invalidate;
  end;
  UpdateTitlesHeight;
end;

procedure TOFDBGrid.SetLinesPerRow(Value: Integer);
begin
  if FLinesPerRow <> Value then
  begin
    FLinesPerRow := Value;
    LayoutChanged;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetExtendedScroll(Value: Boolean);
begin
  if FExtendedScroll <> Value then
  begin
    FExtendedScroll := Value;
    Invalidate;
  end;
end;

procedure TOFDBGrid.SetFlat(Value: Boolean);
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

//------------------------------------------------------------------------------
procedure TOFDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
                                    Column: TColumn; State: TGridDrawState);
var
  style: UINT;
  TmpRect: TRect;
  Region, OldClipRegion: HRgn;
  ClipRegionExists: Boolean;
  w : Integer;
  vAlignment: TAlignment;
  S : String;
  SL : Integer;
begin
  if Column.FieldName <> '' then
  begin
    BeginUpdate;

    with Canvas do
    begin
      Lock;
      TmpRect := Rect;
      FillRect(Rect);

      if (FUseRowColors = True) and
         (not (gdSelected in State)) and
         (not (gdFixed in State)) then
      begin
        Canvas.Brush.Style := bsSolid;
        if (Assigned (Column.Field)) and
           (Assigned (Column.Field.Dataset)) and
           (Column.Field.Dataset.RecNo and 1 = 1) then
        begin
          Brush.Color := FRowColor2
        end else
        begin
          Brush.Color := FRowColor1;
        end;

        FillRect(Rect);
      end;

      if ((gdSelected in State) or
          (gdFocused in State) or
          ({MultiSelect and} Datalink.Active and SelectedRows.CurrentRowSelected)  //27.06.06-ud.
         ) and (not (gdFixed in State)) then
      begin
        Brush.Color := clHighlight;
        Font.Color  := clHighlightText;
        FillRect(Rect);
      end else
        Font.Color := clWindowText;

      if not (gdFixed in State)and(Column <> nil) and (Column.Field <> nil) then
        ApplyCellAttribute(Column.Field, Canvas, State);

      //-------------------------------------------------------------------
      // MEMO
      //-------------------------------------------------------------------
      if (assigned(Column.Field)) and
         (
           (Column.Field is TMemoField) or
           (Column.Field.DataType = ftFmtMemo) or
           (Column.Field.DataType = ftBytes)
         ) then
      begin
        S :=Column.Field.AsString;
        SL :=length(S);
        S :=S+#0;

        if (FDisplayMemo) then
        begin
          try
            FillRect(Rect);
            TmpRect := Rect;
            Inc(TmpRect.Top, 2);
            Inc(TmpRect.Left, 2);

            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
            else
              DrawText(Canvas.Handle, PChar(S), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
          finally
          end;
        end else
        begin
          FillRect(Rect);
          TmpRect := Rect;
          Inc(TmpRect.Top, 2);
          Inc(TmpRect.Left, 2);
          Inc(TmpRect.Right, -2);
          if (csDesigning in ComponentState) then
          begin
            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
            else
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
          end else
          begin
            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), Length(S), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
            else
              DrawText(Canvas.Handle, PChar(S), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
          end;
        end;
      end else
      //-------------------------------------------------------------------
      // BOOLEAN
      //-------------------------------------------------------------------
      if (Column.Field is TBooleanField)and(FDisplayBool) then
      begin
        FillRect(Rect);

        TmpRect := Rect;
        TmpRect.Left := Rect.Left + (Rect.Right - Rect.Left - GCheckWidth) div 2;
        TmpRect.Right := TmpRect.Left + GCheckWidth;
        TmpRect.Top := Rect.Top + (Rect.Bottom - Rect.Top - GCheckWidth) div 2;
        TmpRect.Bottom := TmpRect.Top + GCheckHeight;

        Region := CreateRectRgnIndirect(TmpRect);
        ExtSelectClipRgn(Handle, Region, RGN_AND);
        DeleteObject(Region);
        InflateRect(TmpRect, 1, 1);

        if Column.Field.AsBoolean = True then
          style := DFCS_CHECKED
        else
          style := DFCS_BUTTONCHECK;


        DrawFrameControl(Canvas.Handle, TmpRect, DFC_BUTTON, style or DFCS_FLAT);

        if (Column.Field.AsBoolean) and
           ((not (gdSelected in State) and (Canvas.Font.Color <> clBlack)) or
           ((gdSelected in State) and (Canvas.Font.Color <> clHighlightText))) then
        begin
          for w := TmpRect.Left + 2 to TmpRect.Right - 2 do
          begin
            if Canvas.Pixels[w, TmpRect.Top + Round((TmpRect.Bottom - TmpRect.Top) / 2)] = clBlack then
            begin
              Canvas.Brush.Color := Canvas.Font.Color;
              Canvas.FloodFill(w, TmpRect.Top + Round((TmpRect.Bottom - TmpRect.Top) / 2), clBlack, fsSurface);
              Break;
            end;
          end;
        end;

        if ClipRegionExists then
          SelectClipRgn(Handle, OldClipRegion)
        else
          SelectClipRgn(Handle, 0);

        DeleteObject(OldClipRegion);
        InflateRect(TmpRect, -1, -1);
        Brush.Color := clGray;
        FrameRect(TmpRect);
      end else
      //-------------------------------------------------------------------
      // DATUM/ZEIT
      //-------------------------------------------------------------------
      if Column.Field is TDateTimeField then
      begin
        if (FDisplayDateTime) then
        begin
          try
            FillRect(Rect);
            TmpRect := Rect;
            Inc(TmpRect.Top, 2);
            Inc(TmpRect.Left, 2);

            if FShowTextEllipsis
              then DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
              else DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
          finally
          end;
        end else
        begin
          FillRect(Rect);
          TmpRect := Rect;
          Inc(TmpRect.Top, 2);
          Inc(TmpRect.Left, 2);
          Inc(TmpRect.Right, -2);

          if FShowTextEllipsis then
            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
          else
            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
        end;
      end else // tDateTimeField
      begin
        vAlignment := Column.Alignment;
        S :=Column.Field.DisplayText;
        SL :=Length(S);
        S :=S+#0;

        case vAlignment of
          taRightJustify:
          begin
            FillRect(Rect);
            TmpRect := Rect;
            Inc(TmpRect.Top, 2);
            Inc(TmpRect.Left, 2);
            Inc(TmpRect.Right, -2);

            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_RIGHT)
            else
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_RIGHT);
          end;
          taLeftJustify:
          begin
            FillRect(Rect);
            TmpRect := Rect;
            Inc(TmpRect.Top, 2);
            Inc(TmpRect.Left, 2);
            Inc(TmpRect.Right, -2);

            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
            else
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
          end;

          taCenter:
          begin
            FillRect(Rect);
            TmpRect := Rect;
            Inc(TmpRect.Top, 2);
            Inc(TmpRect.Left, 2);
            Inc(TmpRect.Right, -2);

            if FShowTextEllipsis then
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
            else
              DrawText(Canvas.Handle, PChar(S), SL, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
          end;
        end; // case Aligment
      end;

      //-------------------------------------------------------------------

      if (dgAlwaysShowSelection in Options) then
      begin
        if (gdSelected in State) then
          if not (dgRowSelect in Options) then
            Canvas.DrawFocusRect(Rect);
      end else
      begin
        if (gdFocused in State) then
        begin
          if not (dgRowSelect in Options) then
            Canvas.DrawFocusRect(Rect);
        end;
      end;

      UnLock;
    end; // with canvas ...

    inherited DrawColumnCell(Rect, DataCol, Column, State);

    EndUpdate;
  end;
end;


procedure TOFDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
const
  AlignFlags: array[TAlignment] of Integer = (
    DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX);
var
  TitleText: string;
  TmpCol, i, j: LongInt;
  TmpRect: TRect;
  OldActive, Comp1, Comp2: Integer;
begin
  if not FFlat then
  begin
    inherited;
    exit;
  end;

  try
    if (gdFixed in AState) and (Ctl3D) and {(ARow >= TitleOffset) and} //27.06.06-ud.
       (ACol >= IndicatorOffset) then
      inherited DrawCell(ACol, ARow, ARect, AState - [gdFixed])
    else
      inherited DrawCell(ACol, ARow, ARect, AState);
  except
    //messagebeep(0);
  end;

  if (dgIndicator in Options) then
    TmpCol := ACol - 1
  else
    TmpCol := ACol;

  with ARect do
  begin
    if (Color = clBtnFace) or (Color = clSilver) then
      Color := clWindow;
    {
    if FTitleCheck then
    begin
      if (ARow = 0) and (ACol = 0) and (dgIndicator in Options) and (dgTitles in Options) then
        begin
          Canvas.Brush.Color := clBlack;
          i := (ARect.Bottom - ARect.Top - 7) div 2;
          j := (ARect.Right - ARect.Left - 7) div 2;
          Canvas.Polygon([Point(ARect.Left + j, ARect.Top + i),
            Point(ARect.Left + j + 7, ARect.Top + i),
              Point(ARect.Left + j + (7 div 2), ARect.Bottom - i)]);
        end;
    end;
    }
    if ARow = 0 then
    begin
      if dgTitles in Options then
      begin
        if FMultiLineTitles then
        begin
          if TmpCol >= 0 then
          begin
            if Assigned(Columns[TmpCol]) then
            begin
              TitleText := Columns[TmpCol].Title.Caption;
              if TitleText <> '' then
              begin
                Canvas.Font := Columns[TmpCol].Title.Font;
                Canvas.Brush.Color := Columns[TmpCol].Title.Color;

                TmpRect := ARect;
                Inc(TmpRect.Top, 2);
                Inc(TmpRect.Left, 2);
                Canvas.FillRect(TmpRect);

                if FShowTitleEllipsis then
                  DrawText(Canvas.Handle, PChar(TitleText), Length(TitleText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or AlignFlags[Columns[TmpCol].Title.Alignment])
                else
                  DrawText(Canvas.Handle, PChar(TitleText), Length(TitleText), TmpRect, DT_WORDBREAK or AlignFlags[Columns[TmpCol].Title.Alignment]);
              end;
            end;
          end;
        end;
        Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
        Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

        Canvas.Pen.Color := clBtnShadow;
        Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
      end else
      begin
        Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
        Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
      end;

      if dgIndicator in Options then
      begin
        if ACol = 0 then
        begin
          Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
          Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

          Canvas.Pen.Color := clBtnShadow;
          Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
        end;
      end;
    end else
    if ARow > 0 then
    begin
      if dgIndicator in Options then
      begin
        if ACol = 0 then
        begin
          Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
          Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);
          Canvas.Pen.Color := clBtnShadow;
          Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
        end else
        begin
          Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
          Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
        end;
      end else
      begin
        Canvas.Pen.Color := TOFDBGrid(Self).FixedColor;
        Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
      end;
    end;
  end;
end;

procedure TOFDBGrid.ApplyCellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if Assigned(FOnApplyCellAttribute) then
    FOnApplyCellAttribute(Self, Field, Canvas, State);
end;

procedure TOFDBGrid.ColWidthsChanged;
begin
  inherited;
  try
    if Assigned(FOnColResize) then
      FOnColResize(TOFDBGrid(Self));
  except
  end;
end;

end.

