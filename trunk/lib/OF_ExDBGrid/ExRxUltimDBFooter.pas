{
ExDBGrid Component Suite Version 3.9 - ExRxUltimDBFooter

Copyright (©) 2001 by Frederic Leneuf-magaud
Changes are copyright (©) 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExRxUltimDBFooter;

interface

uses
   Windows, Messages, SysUtils, Forms, Classes, Controls, Graphics, CommCtrl, ComCtrls,
   DB, DBGrids, Grids, ExRxDBGrid
   {$IFDEF EX_COMPILER_6_UP}, Variants{$ENDIF};
const
   FTR_ACTIVE = 1;
   FTR_COLWIDTHS = 2;
   FTR_SCROLL = 3;
   FTR_ERROR = '#ERR!';
   FTR_DEFAULTWIDTH = 64;

type
   TExRxDBFooter = class;

   TUltimDataLink = class(TDataLink)
   private
      FFooterCtrl: TExRxDBFooter;
      FRecCount: Integer;
      FUpdateNeeded: Boolean;
   protected
      procedure DataSetChanged; override;
      procedure EditingChanged; override;
   public
      constructor Create(Footer: TExRxDBFooter);
   end;

   TFooterPanelStyle = (psText, psOwnerDraw);
   TFooterPanelBevel = (pbNone, pbLowered, pbRaised);

   TFooterPanel = class(TCollectionItem)
   private
      FText: string;
      FFieldName: string;
      FWidth: Integer;
      FAlignment: TAlignment;
      FBevel: TFooterPanelBevel;
      FBiDiMode: TBiDiMode;
      FParentBiDiMode: Boolean;
      FStyle: TFooterPanelStyle;
      FUpdateNeeded: Boolean;
      procedure SetAlignment(Value: TAlignment);
      procedure SetBevel(Value: TFooterPanelBevel);
      procedure SetBiDiMode(Value: TBiDiMode);
      procedure SetParentBiDiMode(Value: Boolean);
      procedure SetStyle(Value: TFooterPanelStyle);
      procedure SetText(const Value: string);
      procedure SetWidth(Value: Integer);
      function IsBiDiModeStored: Boolean;
   protected
      function GetDisplayName: string; override;
   public
      constructor Create(Collection: TCollection); override;
      procedure Assign(Source: TPersistent); override;
      procedure ParentBiDiModeChanged;
      function UseRightToLeftAlignment: Boolean;
      function UseRightToLeftReading: Boolean;
      property Width: Integer read FWidth write SetWidth;
   published
      property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
      property Bevel: TFooterPanelBevel read FBevel write SetBevel default pbLowered;
      property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
      property FieldName: string read FFieldName write FFieldName;
      property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True;
      property Style: TFooterPanelStyle read FStyle write SetStyle default psText;
      property Text: string read FText write SetText;
   end;

   TFooterPanels = class(TCollection)
   private
      FFooterBar: TExRxDBFooter;
      function GetItem(Index: Integer): TFooterPanel;
      procedure SetItem(Index: Integer; Value: TFooterPanel);
   protected
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
   public
      constructor Create(FooterBar: TExRxDBFooter);
      function Add: TFooterPanel;
      property Items[Index: Integer]: TFooterPanel read GetItem write SetItem; default;
   end;

   TFooterColumnOperation = (coNone, coSum, coCount, coAverage, coMax, coMin);
   TNumType = (ntInteger, ntFixed, ntGeneral, ntScientific, ntCurrency);

   TFooterColumn = class(TCollectionItem)
   private
      FAlignment: TAlignment;
      FBevel: TFooterPanelBevel;
      FFieldName: string;
      FNumPrecision: Byte;
      FNumType: TNumType;
      FOperation: TFooterColumnOperation;
      FTextBefore: string;
      FTextAfter: string;
      FWidthIfNoResize: Integer;
      FFieldNo: Integer;
      FCalcValue: Variant;
      FError: Boolean;
      procedure SetAlignment(Value: TAlignment);
      procedure SetBevel(Value: TFooterPanelBevel);
      procedure SetFieldName(Value: string);
      procedure SetNumPrecision(Value: Byte);
      procedure SetNumType(Value: TNumType);
      procedure SetOperation(Value: TFooterColumnOperation);
      procedure SetTextBefore(Value: string);
      procedure SetTextAfter(Value: string);
      procedure SetWidthIfNoResize(Value: Integer);
   protected
      function GetDisplayName: string; override;
   public
      constructor Create(Collection: TCollection); override;
      procedure Assign(Source: TPersistent); override;
   published
      property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
      property Bevel: TFooterPanelBevel read FBevel write SetBevel default pbLowered;
      property FieldName: string read FFieldName write SetFieldName;
      property NumPrecision: Byte read FNumPrecision write SetNumPrecision;
      property NumType: TNumType read FNumType write SetNumType default ntFixed;
      property Operation: TFooterColumnOperation read FOperation write SetOperation default coNone;
      property TextBefore: string read FTextBefore write SetTextBefore;
      property TextAfter: string read FTextAfter write SetTextAfter;
      property WidthIfNoResize: Integer read FWidthIfNoResize write SetWidthIfNoResize default FTR_DEFAULTWIDTH;
   end;

   TFooterColumns = class(TCollection)
   private
      FFooterBar: TExRxDBFooter;
      function GetItem(Index: Integer): TFooterColumn;
      procedure SetItem(Index: Integer; Value: TFooterColumn);
   protected
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
   public
      constructor Create(FooterBar: TExRxDBFooter);
      function Add: TFooterColumn;
      property Items[Index: Integer]: TFooterColumn read GetItem write SetItem; default;
   end;

   TDrawPanelEvent = procedure(FooterBar: TExRxDBFooter; Panel: TFooterPanel; const Rect: TRect)
      of object;
   TBeforeDisplayTextEvent = procedure(FooterBar: TExRxDBFooter; Column: TFooterColumn;
      const Value: Variant; var Text: string; var Style: TFooterPanelStyle) of object;
   TBeforeReadFieldsEvent = procedure(FooterBar: TExRxDBFooter) of object;
   TReadFieldValueEvent = procedure(FooterBar: TExRxDBFooter; Column: TFooterColumn;
      const Value: Variant) of object;

   TExRxDBFooter = class(TWinControl)
   private
      FPanels: TFooterPanels;
      FColumns: TFooterColumns;
      FCanvas: TCanvas;
      FSizeGrip: Boolean;
      FLeftPanel: Integer;
      FUseSystemFont: Boolean;
      FDataLink: TUltimDataLink;
      FExRxDBGrid: TExRxDBGrid;
      FIgnoreResizing: Boolean;
      FIgnoreScrolling: Boolean;
      FOnDrawPanel: TDrawPanelEvent;
      FOnBeforeDisplayText: TBeforeDisplayTextEvent;
      FOnBeforeReadFields: TBeforeReadFieldsEvent;
      FOnReadFieldValue: TReadFieldValueEvent;
      procedure DoRightToLeftAlignment(var Str: string; AAlignment: TAlignment;
         ARTLAlignment: Boolean);
      function IsFontStored: Boolean;
      procedure SetPanels(Value: TFooterPanels);
      procedure SetColumns(Value: TFooterColumns);
      procedure SetSizeGrip(Value: Boolean);
      procedure SyncToSystemFont;
      procedure UpdatePanel(Index: Integer; Repaint: Boolean);
      procedure UpdatePanels(UpdateRects, UpdateText: Boolean);
      procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
      procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
      procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
      procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
      procedure CMWinIniChange(var Message: TMessage); message CM_WININICHANGE;
      procedure CMSysFontChanged(var Message: TMessage); message CM_SYSFONTCHANGED;
      procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
      procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
      procedure WMSize(var Message: TWMSize); message WM_SIZE;
      procedure SetUseSystemFont(const Value: Boolean);
      procedure SetExRxDBGrid(Value: TExRxDBGrid);
   protected
      procedure ChangeScale(M, D: Integer); override;
      procedure CreateParams(var Params: TCreateParams); override;
      procedure CreateWnd; override;
      procedure DrawPanel(Panel: TFooterPanel; const Rect: TRect); dynamic;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      property Panels: TFooterPanels read FPanels write SetPanels;
      procedure CalcFields; virtual;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function ExecuteAction(Action: TBasicAction): Boolean; override;
      procedure FlipChildren(AllLevels: Boolean); override;
      property Canvas: TCanvas read FCanvas;
      procedure FooterMessage(Msg: Integer); virtual;
      procedure UpdateDataPanels(ReCalc: Boolean); virtual;
   published
      property Action;
      property Align default alNone;
      property Anchors;
      property BiDiMode;
      property BorderWidth;
      property Color default clBtnFace;
      property ExRxDBGrid: TExRxDBGrid read FExRxDBGrid write SetExRxDBGrid default nil;
      property DragCursor;
      property DragKind;
      property DragMode;
      property Enabled;
      property Font stored IsFontStored;
      property IgnoreResizing: Boolean read FIgnoreResizing write FIgnoreResizing default False;
      property IgnoreScrolling: Boolean read FIgnoreScrolling write FIgnoreScrolling default False;
      property Columns: TFooterColumns read FColumns write SetColumns;
      property Constraints;
      property ParentBiDiMode;
      property ParentColor default False;
      property ParentFont default False;
      property ParentShowHint;
      property PopupMenu;
      property ShowHint;
      property SizeGrip: Boolean read FSizeGrip write SetSizeGrip default False;
      property UseSystemFont: Boolean read FUseSystemFont write SetUseSystemFont default True;
      property Visible;
      property OnClick;
      {$IFDEF EX_COMPILER_5_UP}
      property OnContextPopup;
      {$ENDIF}
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property OnDrawPanel: TDrawPanelEvent read FOnDrawPanel write FOnDrawPanel;
      property OnResize;
      property OnStartDock;
      property OnStartDrag;
      property OnBeforeDisplayText: TBeforeDisplayTextEvent read FOnBeforeDisplayText write FOnBeforeDisplayText;
      property OnBeforeReadFields: TBeforeReadFieldsEvent read FOnBeforeReadFields write FOnBeforeReadFields;
      property OnReadFieldValue: TReadFieldValueEvent read FOnReadFieldValue write FOnReadFieldValue;
   end;

implementation

constructor TUltimDataLink.Create(Footer: TExRxDBFooter);
begin
   inherited Create;
   FFooterCtrl := Footer;
   FRecCount := 0;
   FUpdateNeeded := False;
   VisualControl := True;
end;

procedure TUltimDataLink.DataSetChanged;
begin
   if FUpdateNeeded or (FRecCount <> DataSet.RecordCount) then
      begin
         FUpdateNeeded := False;
         FRecCount := DataSet.RecordCount;
         if FFooterCtrl <> nil then
            FFooterCtrl.UpdateDataPanels(True);
      end;
end;

procedure TUltimDataLink.EditingChanged;
begin
   if DataSet.State = dsBrowse then
      FUpdateNeeded := True;
end;

constructor TFooterPanel.Create(Collection: TCollection);
begin
   FWidth := FTR_DEFAULTWIDTH;
   FBevel := pbLowered;
   FParentBiDiMode := True;
   inherited Create(Collection);
   ParentBiDiModeChanged;
end;

procedure TFooterPanel.Assign(Source: TPersistent);
begin
   if Source is TFooterPanel then
      begin
         Alignment := TFooterPanel(Source).Alignment;
         Bevel := TFooterPanel(Source).Bevel;
         Style := TFooterPanel(Source).Style;
         Text := TFooterPanel(Source).Text;
         Width := TFooterPanel(Source).Width;
      end
   else
      inherited Assign(Source);
end;

procedure TFooterPanel.SetBiDiMode(Value: TBiDiMode);
begin
   if Value <> FBiDiMode then
      begin
         FBiDiMode := Value;
         FParentBiDiMode := False;
         Changed(False);
      end;
end;

function TFooterPanel.IsBiDiModeStored: Boolean;
begin
   Result := not FParentBiDiMode;
end;

procedure TFooterPanel.SetParentBiDiMode(Value: Boolean);
begin
   if FParentBiDiMode <> Value then
      begin
         FParentBiDiMode := Value;
         ParentBiDiModeChanged;
      end;
end;

procedure TFooterPanel.ParentBiDiModeChanged;
begin
   if FParentBiDiMode then
      begin
         if GetOwner <> nil then
            begin
               BiDiMode := TFooterPanels(GetOwner).FFooterBar.BiDiMode;
               FParentBiDiMode := True;
            end;
      end;
end;

function TFooterPanel.UseRightToLeftReading: Boolean;
begin
   Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

function TFooterPanel.UseRightToLeftAlignment: Boolean;
begin
   Result := SysLocale.MiddleEast and (BiDiMode = bdRightToLeft);
end;

function TFooterPanel.GetDisplayName: string;
begin
   Result := Text;
   if Result = '' then
      Result := inherited GetDisplayName;
end;

procedure TFooterPanel.SetAlignment(Value: TAlignment);
begin
   if FAlignment <> Value then
      begin
         FAlignment := Value;
         Changed(False);
      end;
end;

procedure TFooterPanel.SetBevel(Value: TFooterPanelBevel);
begin
   if FBevel <> Value then
      begin
         FBevel := Value;
         Changed(False);
      end;
end;

procedure TFooterPanel.SetStyle(Value: TFooterPanelStyle);
begin
   if FStyle <> Value then
      begin
         FStyle := Value;
         Changed(False);
      end;
end;

procedure TFooterPanel.SetText(const Value: string);
begin
   if FText <> Value then
      begin
         FText := Value;
         Changed(False);
      end;
end;

procedure TFooterPanel.SetWidth(Value: Integer);
begin
   if FWidth <> Value then
      begin
         FWidth := Value;
         Changed(True);
      end;
end;

constructor TFooterPanels.Create(FooterBar: TExRxDBFooter);
begin
   inherited Create(TFooterPanel);
   FFooterBar := FooterBar;
end;

function TFooterPanels.Add: TFooterPanel;
begin
   Result := TFooterPanel(inherited Add);
end;

function TFooterPanels.GetItem(Index: Integer): TFooterPanel;
begin
   Result := TFooterPanel(inherited GetItem(Index));
end;

function TFooterPanels.GetOwner: TPersistent;
begin
   Result := FFooterBar;
end;

procedure TFooterPanels.SetItem(Index: Integer; Value: TFooterPanel);
begin
   inherited SetItem(Index, Value);
end;

procedure TFooterPanels.Update(Item: TCollectionItem);
begin
   if Item <> nil then
      FFooterBar.UpdatePanel(Item.Index, False)
   else
      FFooterBar.UpdatePanels(True, False);
end;

constructor TFooterColumn.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   FAlignment := taCenter;
   FBevel := pbLowered;
   FFieldName := '';
   FNumPrecision := 2;
   FNumType := ntFixed;
   FOperation := coNone;
   FTextBefore := '';
   FTextAfter := '';
   FWidthIfNoResize := FTR_DEFAULTWIDTH;
end;

procedure TFooterColumn.Assign(Source: TPersistent);
begin
   if Source is TFooterColumn then
      begin
         Alignment := TFooterColumn(Source).Alignment;
         Bevel := TFooterColumn(Source).Bevel;
         FieldName := TFooterColumn(Source).FieldName;
         NumPrecision := TFooterColumn(Source).NumPrecision;
         NumType := TFooterColumn(Source).NumType;
         Operation := TFooterColumn(Source).Operation;
      end
   else
      inherited Assign(Source);
end;

function TFooterColumn.GetDisplayName: string;
begin
   Result := FieldName;
   if Result = '' then
      Result := inherited GetDisplayName;
end;

procedure TFooterColumn.SetAlignment(Value: TAlignment);
begin
   if FAlignment <> Value then
      begin
         FAlignment := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetBevel(Value: TFooterPanelBevel);
begin
   if FBevel <> Value then
      begin
         FBevel := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetFieldName(Value: string);
begin
   if FFieldName <> Value then
      begin
         FFieldName := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetNumPrecision(Value: Byte);
begin
   if FNumType = ntInteger then
      Value := 0;
   if FNumPrecision <> Value then
      begin
         FNumPrecision := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetNumType(Value: TNumType);
begin
   if FOperation = coCount then
      Value := ntInteger;
   if FNumType <> Value then
      begin
         FNumType := Value;
         if FNumType = ntInteger then
            SetNumPrecision(0);
         Changed(False);
      end;
end;

procedure TFooterColumn.SetOperation(Value: TFooterColumnOperation);
begin
   if FOperation <> Value then
      begin
         FOperation := Value;
         if FOperation = coCount then
            SetNumType(ntInteger);
         Changed(False);
      end;
end;

procedure TFooterColumn.SetTextBefore(Value: string);
begin
   if FTextBefore <> Value then
      begin
         FTextBefore := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetTextAfter(Value: string);
begin
   if FTextAfter <> Value then
      begin
         FTextAfter := Value;
         Changed(False);
      end;
end;

procedure TFooterColumn.SetWidthIfNoResize(Value: Integer);
begin
   if FWidthIfNoResize <> Value then
      begin
         FWidthIfNoResize := Value;
         Changed(True);
      end;
end;

constructor TFooterColumns.Create(FooterBar: TExRxDBFooter);
begin
   inherited Create(TFooterColumn);
   FFooterBar := FooterBar;
end;

function TFooterColumns.Add: TFooterColumn;
begin
   Result := TFooterColumn(inherited Add);
end;

function TFooterColumns.GetOwner: TPersistent;
begin
   Result := FFooterBar;
end;

procedure TFooterColumns.Update(Item: TCollectionItem);
begin
   FFooterBar.UpdateDataPanels(True);
end;

function TFooterColumns.GetItem(Index: Integer): TFooterColumn;
begin
   Result := TFooterColumn(inherited GetItem(Index));
end;

procedure TFooterColumns.SetItem(Index: Integer; Value: TFooterColumn);
begin
   inherited SetItem(Index, Value);
end;

constructor TExRxDBFooter.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks, csOpaque];
   Color := clBtnFace;
   Height := 19;
   Width := 200;
   Align := alNone;
   FPanels := TFooterPanels.Create(Self);
   FColumns := TFooterColumns.Create(Self);
   FCanvas := TControlCanvas.Create;
   TControlCanvas(FCanvas).Control := Self;
   FSizeGrip := False;
   FLeftPanel := -1;
   ParentFont := False;
   FUseSystemFont := True;
   SyncToSystemFont;
   FDataLink := TUltimDataLink.Create(Self);
   FDataLink.DataSource := nil;
   FExRxDBGrid := nil;
   IgnoreResizing := False;
   IgnoreScrolling := False;
end;

destructor TExRxDBFooter.Destroy;
begin
   if FExRxDBGrid <> nil then
      begin
         FExRxDBGrid.UnregisterFooter(Self);
         FExRxDBGrid := nil;
      end;
   FDataLink.FFooterCtrl := nil;
   FDataLink.Free;
   FDataLink := nil;
   FCanvas.Free;
   FColumns.Free;
   FPanels.Free;
   inherited Destroy;
end;

procedure TExRxDBFooter.CreateParams(var Params: TCreateParams);
const
   GripStyles: array[Boolean] of DWORD = (CCS_TOP, SBARS_SIZEGRIP);
begin
   InitCommonControl(ICC_BAR_CLASSES);
   inherited CreateParams(Params);
   CreateSubClass(Params, STATUSCLASSNAME);
   with Params do
      begin
         Style := Style or GripStyles[FSizeGrip and (Parent is TCustomForm) and
            (TCustomForm(Parent).BorderStyle in [bsSizeable, bsSizeToolWin])];
         WindowClass.style := WindowClass.style and not CS_HREDRAW;
      end;
end;

procedure TExRxDBFooter.CreateWnd;
begin
   inherited CreateWnd;
   SendMessage(Handle, SB_SETBKCOLOR, 0, ColorToRGB(Color));
   UpdatePanels(True, False);
end;

procedure TExRxDBFooter.DrawPanel(Panel: TFooterPanel; const Rect: TRect);
begin
   if Assigned(FOnDrawPanel) then
      FOnDrawPanel(Self, Panel, Rect)
   else
      FCanvas.FillRect(Rect);
end;

procedure TExRxDBFooter.SetPanels(Value: TFooterPanels);
begin
   FPanels.Assign(Value);
end;

procedure TExRxDBFooter.DoRightToLeftAlignment(var Str: string;
   AAlignment: TAlignment; ARTLAlignment: Boolean);
begin
   if ARTLAlignment then
      ChangeBiDiModeAlignment(AAlignment);

   case AAlignment of
      taCenter: Insert(#9, Str, 1);
      taRightJustify: Insert(#9#9, Str, 1);
   end;
end;

procedure TExRxDBFooter.CMBiDiModeChanged(var Message: TMessage);
var
   Loop: Integer;
begin
   inherited;
   if HandleAllocated then
      begin
         for Loop := 0 to Panels.Count - 1 do
            if Panels[Loop].ParentBiDiMode then
               Panels[Loop].ParentBiDiModeChanged;
         UpdatePanels(True, True);
      end;
end;

procedure TExRxDBFooter.FlipChildren(AllLevels: Boolean);
var
   Loop, FirstWidth, LastWidth: Integer;
   APanels: TFooterPanels;
begin
   if HandleAllocated and (Panels.Count > 0) then
      begin
         LastWidth := ClientWidth;
         FirstWidth := Panels[0].Width;
         for Loop := 0 to Panels.Count - 2 do
            Dec(LastWidth, Panels[Loop].Width);

         APanels := TFooterPanels.Create(Self);
         try
            for Loop := 0 to Panels.Count - 1 do
               with APanels.Add do
                  Assign(Self.Panels[Loop]);
            for Loop := 0 to Panels.Count - 1 do
               Panels[Loop].Assign(APanels[Panels.Count - Loop - 1]);
         finally
            APanels.Free;
         end;

         if Panels.Count > 1 then
            begin
               Panels[Panels.Count - 1].Width := FirstWidth;
               Panels[0].Width := LastWidth;
            end;
         UpdatePanels(True, True);
      end;
end;

procedure TExRxDBFooter.SetSizeGrip(Value: Boolean);
begin
   if FSizeGrip <> Value then
      begin
         FSizeGrip := Value;
         RecreateWnd;
      end;
end;

procedure TExRxDBFooter.SyncToSystemFont;
begin
   if FUseSystemFont then
      {$IFDEF EX_COMPILER_5_UP}
      Font := Screen.HintFont;
   {$ELSE}
      Font := Screen.ActiveForm.Canvas.Font;
   {$ENDIF}
end;

procedure TExRxDBFooter.UpdatePanel(Index: Integer; Repaint: Boolean);
var
   Flags: Integer;
   S: string;
   PanelRect: TRect;
begin
   if HandleAllocated then
      with Panels[Index] do
         begin
            if not Repaint then
               begin
                  FUpdateNeeded := True;
                  SendMessage(Handle, SB_GETRECT, Index, Integer(@PanelRect));
                  InvalidateRect(Handle, @PanelRect, True);
                  Exit;
               end
            else
               if not FUpdateNeeded then
                  Exit;
            FUpdateNeeded := False;
            Flags := 0;
            case Bevel of
               pbNone: Flags := SBT_NOBORDERS;
               pbRaised: Flags := SBT_POPOUT;
            end;
            if UseRightToLeftReading then
               Flags := Flags or SBT_RTLREADING;
            if Style = psOwnerDraw then
               Flags := Flags or SBT_OWNERDRAW;
            S := Text;
            if UseRightToLeftAlignment then
               DoRightToLeftAlignment(S, Alignment, UseRightToLeftAlignment)
            else
               case Alignment of
                  taCenter: Insert(#9, S, 1);
                  taRightJustify: Insert(#9#9, S, 1);
               end;
            SendMessage(Handle, SB_SETTEXT, Index or Flags, Integer(PChar(S)));
         end;
end;

procedure TExRxDBFooter.UpdatePanels(UpdateRects, UpdateText: Boolean);
const
   MaxPanelCount = 128;
var
   I, Count, PanelPos: Integer;
   PanelEdges: array[0..MaxPanelCount - 1] of Integer;
begin
   if HandleAllocated then
      begin
         Count := Panels.Count;
         if UpdateRects then
            begin
               if Count > MaxPanelCount then
                  Count := MaxPanelCount;
               if Count = 0 then
                  begin
                     PanelEdges[0] := -1;
                     SendMessage(Handle, SB_SETPARTS, 1, Integer(@PanelEdges));
                     SendMessage(Handle, SB_SETTEXT, 0, Integer(PChar('')));
                  end
               else
                  begin
                     PanelPos := 0;
                     for I := 0 to Count - 2 do
                        begin
                           Inc(PanelPos, Panels[I].Width);
                           PanelEdges[I] := PanelPos;
                        end;
                     PanelEdges[Count - 1] := -1;
                     SendMessage(Handle, SB_SETPARTS, Count, Integer(@PanelEdges));
                  end;
            end;
         for I := 0 to Count - 1 do
            UpdatePanel(I, UpdateText);
      end;
end;

procedure TExRxDBFooter.CMWinIniChange(var Message: TMessage);
begin
   inherited;
   if (Message.WParam = 0) or (Message.WParam = SPI_SETNONCLIENTMETRICS) then
      SyncToSystemFont;
end;

procedure TExRxDBFooter.CNDrawItem(var Message: TWMDrawItem);
var
   SaveIndex: Integer;
begin
   with Message.DrawItemStruct^ do
      begin
         SaveIndex := SaveDC(hDC);
         FCanvas.Lock;
         try
            FCanvas.Handle := hDC;
            FCanvas.Font := Font;
            FCanvas.Brush.Color := clBtnFace;
            FCanvas.Brush.Style := bsSolid;
            DrawPanel(Panels[itemID], rcItem);
         finally
            FCanvas.Handle := 0;
            FCanvas.Unlock;
            RestoreDC(hDC, SaveIndex);
         end;
      end;
   Message.Result := 1;
end;

procedure TExRxDBFooter.WMPaint(var Message: TWMPaint);
begin
   UpdatePanels(False, True);
   inherited;
end;

procedure TExRxDBFooter.WMSize(var Message: TWMSize);
begin
   if not (csLoading in ComponentState) then
      Resize;
   Repaint;
end;

function TExRxDBFooter.IsFontStored: Boolean;
begin
   Result := not FUseSystemFont and not ParentFont and not DesktopFont;
end;

procedure TExRxDBFooter.SetUseSystemFont(const Value: Boolean);
begin
   if FUseSystemFont <> Value then
      begin
         FUseSystemFont := Value;
         if Value then
            begin
               if ParentFont then
                  ParentFont := False;
               SyncToSystemFont;
            end;
      end;
end;

procedure TExRxDBFooter.CMColorChanged(var Message: TMessage);
begin
   inherited;
   RecreateWnd;
end;

procedure TExRxDBFooter.CMParentFontChanged(var Message: TMessage);
begin
   inherited;
   if FUseSystemFont and ParentFont then
      FUseSystemFont := False;
end;

function TExRxDBFooter.ExecuteAction(Action: TBasicAction): Boolean;
begin
   Result := inherited ExecuteAction(Action);
end;

procedure TExRxDBFooter.CMSysColorChange(var Message: TMessage);
begin
   inherited;
   RecreateWnd;
end;

procedure TExRxDBFooter.CMSysFontChanged(var Message: TMessage);
begin
   inherited;
   SyncToSystemFont;
end;

procedure TExRxDBFooter.ChangeScale(M, D: Integer);
begin
   if UseSystemFont then
      ScalingFlags := [sfTop];
   inherited;
end;

procedure TExRxDBFooter.SetColumns(Value: TFooterColumns);
begin
   FColumns.Assign(Value);
end;

procedure TExRxDBFooter.Notification(AComponent: TComponent; Operation: TOperation);
begin
   inherited Notification(AComponent, Operation);
   if (Operation = opRemove) and (AComponent = FExRxDBGrid) then
      begin
         FExRxDBGrid := nil;
         FPanels.Clear;
      end;
end;

procedure TExRxDBFooter.SetExRxDBGrid(Value: TExRxDBGrid);
begin
   if FExRxDBGrid <> Value then
      begin
         if Assigned(FExRxDBGrid) then
            FExRxDBGrid.UnregisterFooter(Self);
         FExRxDBGrid := Value;
         FPanels.Clear;
         if Assigned(FExRxDBGrid) then
            FExRxDBGrid.RegisterFooter(Self);
      end;
   if Value <> nil then
      Value.FreeNotification(Self);
end;

procedure TExRxDBFooter.FooterMessage(Msg: Integer);
begin
   case Msg of
      FTR_ACTIVE:
         begin
            FDataLink.DataSource := FExRxDBGrid.DataSource;
            if FDataLink.Active then
               FDataLink.FRecCount := FDataLink.DataSet.RecordCount
            else
               FDataLink.FRecCount := 0;
            UpdateDataPanels(True);
         end;
      FTR_COLWIDTHS:
         begin
            UpdateDataPanels(False);
         end;
      FTR_SCROLL:
         begin
            if FLeftPanel <> FExRxDBGrid.LeftCol then
               UpdateDataPanels(False);
         end;
   end;
end;

procedure TExRxDBFooter.CalcFields;
var
   RecCount: Integer;
   FtrCol: Integer;
   Field: TField;
   FldValue: Variant;
begin
   RecCount := 0;
   for FtrCol := 0 to FColumns.Count - 1 do
      begin
         Field := FDataLink.DataSet.FindField(FColumns[FtrCol].FieldName);
         if Field = nil then
            FColumns[FtrCol].FFieldNo := -1
         else
            FColumns[FtrCol].FFieldNo := Field.Index;
         FColumns[FtrCol].FCalcValue := Null;
         FColumns[FtrCol].FError := False;
      end;
   if Assigned(FOnBeforeReadFields) then
      FOnBeforeReadFields(Self);

   FDataLink.DataSet.DisableControls;
   FExRxDBGrid.SaveGridPosition;
   try
      FDataLink.DataSet.First;
      while not FDataLink.DataSet.EOF do
         begin
            Inc(RecCount);
            for FtrCol := 0 to FColumns.Count - 1 do
               with FColumns[FtrCol] do
                  begin
                     if FFieldNo <> -1 then
                        begin
                           try
                              FldValue := FDataLink.DataSet.Fields[FFieldNo].AsVariant;
                              if Assigned(FOnReadFieldValue) then
                                 FOnReadFieldValue(Self, FColumns[FtrCol], FldValue);
                           except
                              FError := True;
                              if Assigned(FOnReadFieldValue) then
                                 FOnReadFieldValue(Self, FColumns[FtrCol], FTR_ERROR);
                           end;
                           try
                              if not FError and (FldValue <> Null) then
                                 case FOperation of
                                    coSum, coAverage:
                                       if FCalcValue = Null then
                                          FCalcValue := FldValue
                                       else
                                          FCalcValue := FCalcValue + FldValue;
                                    coMax:
                                       if (FCalcValue = Null) or (FldValue > FCalcValue) then
                                          FCalcValue := FldValue;
                                    coMin:
                                       if (FCalcValue = Null) or (FldValue < FCalcValue) then
                                          FCalcValue := FldValue;
                                 end;
                           except
                              FError := True;
                           end;
                        end;
                  end;
            FDataLink.DataSet.Next;
         end;
      for FtrCol := 0 to FColumns.Count - 1 do
         with FColumns[FtrCol] do
            begin
               if not FError then
                  try
                     case FOperation of
                        coAverage: FCalcValue := FCalcValue / RecCount;
                        coCount: FCalcValue := RecCount;
                     end;
                  except
                     FError := True;
                  end;
            end;
   finally
      FExRxDBGrid.RestoreGridPosition;
      FDataLink.DataSet.EnableControls;
   end;
end;

procedure TExRxDBFooter.UpdateDataPanels(ReCalc: Boolean);

   function FormatVariant(VarColumn: TFooterColumn): string;
   var
      Precision: string;
   begin
      try
         if VarColumn.FCalcValue = Null then
            Result := ''
         else
            if VarType(VarColumn.FCalcValue) in [varSmallint..varCurrency] then
               begin
                  Precision := IntToStr(VarColumn.FNumPrecision);
                  case VarColumn.FNumType of
                     ntInteger:
                        Result := Format('%d', [Integer(VarColumn.FCalcValue)]);
                     ntFixed:
                        Result := Format('%.' + Precision + 'n', [Double(VarColumn.FCalcValue)]);
                     ntGeneral:
                        Result := Format('%.' + Precision + 'g', [Double(VarColumn.FCalcValue)]);
                     ntScientific:
                        Result := Format('%.' + Precision + 'e', [Double(VarColumn.FCalcValue)]);
                     ntCurrency:
                        Result := Format('%.' + Precision + 'm', [Currency(VarColumn.FCalcValue)]);
                  else
                     Result := string(VarColumn.FCalcValue);
                  end;
               end
            else
               Result := string(VarColumn.FCalcValue);
         Result := VarColumn.FTextBefore + Result + VarColumn.FTextAfter;
      except
         Result := FTR_ERROR;
      end;
   end;

var
   GridCol: Integer;

   procedure CreatePanels;
   var
      FtrCol: Integer;
      Trouve: Boolean;
      DisplayText: string;
      DrawStyle: TFooterPanelStyle;
   begin
      if FExRxDBGrid.Columns[GridCol].Visible then
         with FPanels.Add do
            begin
               Trouve := False;
               for FtrCol := 0 to FColumns.Count - 1 do
                  if CompareText(FExRxDBGrid.Columns[GridCol].FieldName,
                     FColumns[FtrCol].FieldName) = 0 then
                     begin
                        Alignment := FColumns[FtrCol].FAlignment;
                        Bevel := FColumns[FtrCol].FBevel;
                        FieldName := FColumns[FtrCol].FFieldName;
                        if FColumns[FtrCol].FError then
                           DisplayText := FTR_ERROR
                        else
                           DisplayText := FormatVariant(FColumns[FtrCol]);
                        if Assigned(FOnBeforeDisplayText) then
                           begin
                              DrawStyle := Style;
                              FOnBeforeDisplayText(Self, FColumns[FtrCol], FColumns[FtrCol].FCalcValue,
                                 DisplayText, DrawStyle);
                              Style := DrawStyle;
                           end;
                        Text := DisplayText;
                        if IgnoreResizing then
                           Width := FColumns[FtrCol].FWidthIfNoResize
                        else
                           Width := FExRxDBGrid.Columns[GridCol].Width;
                        Trouve := True;
                        Break;
                     end;
               if not Trouve then
                  begin
                     Bevel := pbNone;
                     FieldName := '';
                     Text := '';
                     Width := FExRxDBGrid.Columns[GridCol].Width;
                  end;
               if dgColLines in FExRxDBGrid.Options then
                  Width := Width + TDrawGrid(FExRxDBGrid).GridLineWidth;
            end;
   end;

var
   MaxCol: Integer;

begin
   FPanels.BeginUpdate;
   try
      FPanels.Clear;
      if (FColumns.Count > 0) and (FExRxDBGrid <> nil) and FDataLink.Active then
         begin
            if ReCalc then
               CalcFields;
            if dgIndicator in FExRxDBGrid.Options then
               with FPanels.Add do
                  begin
                     Bevel := pbNone;
                     FieldName := '';
                     Text := '';
                     Width := IndicatorWidth;
                     if dgColLines in FExRxDBGrid.Options then
                        Width := Width + TDrawGrid(FExRxDBGrid).GridLineWidth;
                  end;
            for GridCol := 0 to FExRxDBGrid.FixedCols - 1 do
               CreatePanels;
            if IgnoreScrolling then
               begin
                  FLeftPanel := FExRxDBGrid.FixedCols + 1;
                  MaxCol := FExRxDBGrid.Columns.Count - 1;
               end
            else
               begin
                  FLeftPanel := FExRxDBGrid.LeftCol;
                  MaxCol := FLeftPanel + FExRxDBGrid.VisibleColCount - 1;
                  if MaxCol >= FExRxDBGrid.Columns.Count then
                     MaxCol := FExRxDBGrid.Columns.Count - 1;
               end;
            for GridCol := FLeftPanel - 1 to MaxCol do
               CreatePanels;
            with FPanels.Add do
               begin
                  Bevel := pbNone;
                  FieldName := '';
                  Text := '';
                  Width := 1;
               end;
         end;
   finally
      FPanels.EndUpdate;
   end;
end;

end.

