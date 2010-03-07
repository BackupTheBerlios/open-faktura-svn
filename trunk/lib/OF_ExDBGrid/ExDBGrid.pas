{
ExDBGrid Component Suite Version 3.9 - TExDBGrid

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk

Description:   ExDBGrid is an Enhanced DBGrid Component that has plenty of new
               features:

               It has the following new Public Properties and Procedures:
               Canvas, Col, Row, FixedCols, FixedRows, TopRow, SelectedRows,
               DataLink, ColCount, RowCount, ColWidths, GridLineWidth,
               InplaceEdit, TitleOffset, OnColumnResize, OptWidth (making the
               'Grid' automatically size itself so that no white space is left
               at the right), VisibleRowCount, VisibleColCount, GridHeight,
               GridWidth, LeftCol, ExportGrid, ExportToFile, GridPreview,
               DataSetPreview, GridPrint, DataSetPrint, SaveToRegistry,
               LoadFromRegistry, CopyToClipboard, CutToClipboard,
               PasteFromClipboard, ShowCustomizeDialog, ShowQueryByForm
               and ShowSortByForm.

               It has the following new Published Properties:
               ScrollBars, EditColor, DefaultRowHeight, RowSizingAllowed,
               DisplayImages, DisplayMemo, DisplayBoolean, GridAutoSize
               (making the columns automatically resize so that they are as wide
               as the row with the widest entry), GridAutoWidth (making the
               columns automatically resize so that no white space is left at
               the right), GridAutoWidthResize, FullSizeMemo, Cells3D
               (when False, the Grid has a Flat look and feel - also the 3D
               Cells can be any color), CellHints (when True and Columns are not
               wide enough for the DisplayText, moving the mouse over a cell
               shows the text in a hint window), RowColor1, RowColor2,
               UseRowColors (using the properties RowColor1 and RowColor2),
               MultiLineTitles, TitleCheck (which places a marker in the top
               left of the grid and enables the grid popup menu when clicked),
               BackgroundPicture, UseBackgroundPicture, ExportDelimiter,
               AllowAutoAppend, DrawFocusRect, EnterAsTab, HighlightColor,
               ImageHighlightColor, HighlightFontColor, ReportCaption, HotTrack,
               HotTrackColor, LockedCols, LockedFont, LockedColor, FlatCheckBox,
               FlatCheckBoxType, MemoViewType, RegistrySaveName,
               ShowTextEllipsis, ShowTitleEllipsis, MultiLineRows, LinesPerRow,
               DisplayDateTime, SearchMode (when True, clicking on the column
               titles will display a search box for the column - Case Sensitive),
               ExMenuOptions, ScrollHints, UseBitmapDrawing (if active, a
               temporary bitmap is used to draw cells within the grid - it
               decreases flickers but draws a cell a bit slowly),
               MemoInplaceEditor, DisplayPopupEditors (when False, memos can
               be edited inplace by single clicking the cell), MaskedColumnDrag,
               ShowTitlesWhenInactive, BoldTitlesWhenCells3D,
               BoldIndicatorsWhenCells3D, Controls, ExtendedScroll, ValueChecked,
               ValueUnChecked and EnableCellRangeSelect.

               It has the following new Methods:
               MoveToRow and CellRect (which is extremely useful if you want to
               drop other controls on the grid i.e. pop a dropdown list over a
               cell when the user enters it).

               It has the following new Events:
               OnColumnResize, OnMouseDown, OnMouseUp, OnMouseMove, OnColEnter,
               OnRightClick, OnApplyCellAttribute (useful when you want to
               change the colour of an individual cell, based on the value in
               that cell or some other particular condition), OnCustomize,
               OnAutoWidthResize, OnIsBooleanField, OnStartCellChanged and
               OnEndCellChanged.

               In addition, it also has the following Features:
               Design Time and Run Time viewing of images, including JPEG
               support, Flat look and feel, Grid Printing, Grid Exporting,
               Enhanced Scrollbar Tracking, Selecting and UnSelecting all
               records, Column Customizing, Drag and Drop implementation,
               QueryByForm and SortByForm implementation (For Paradox and dBASE
               any column names specified in the SortByForm procedure must
               already be indexed. For SQL-based tables, the specified columns
               need not be indexed.)

               It also has built in popup viewers and Inplace Editors for
               Graphic/Memo/RichEdit and Date/Time Fields. To use these and the
               Checkbox, simply click on the Fields or use the Spacebar, F2 or
               Enter Keys.

*PLEASE NOTE*  Before making any bug reports please first verify you are
               using the latest version by checking my home page. And if
               you do report a bug, please, if applicable, include a code
               sample.

               Any suggested enhancements would also be appreciated.

Notes:         I cannot support modified versions of this code. So if you
               encounter a possible bug while using a modified version,
               always first revert back to the original code before making
               an attempt to contact me.

Thanks To:     Del Geist -                 Mail: drgeist@ris.net
               Alberto Doria -             Mail: adoria@arsed.it
               Sergey Pjatakov -           Mail: psg@slav.ucom.dp.ua
               Martin Sedlak -             Mail: sedma@pobox.sk
               Jim Story -                 Mail: jhstory@compuserve.com
               Pierre du Parte -           Mail: pierre@finalfiler.com
               Timothy Kelly -             Mail: tmk198@ecs.soton.ac.uk
               M.Bicak -                   Mail: m.b@okay.net
               J.P. -                      Mail: pcl-software@clix.pt
               Pascal Berger -             Mail: pberger@gmx.net
               Alexandre Machado -         Mail: alexmac@horizontes.net
               Eric van Agthoven -         Mail: eric.van.agthoven@it4mation.nl
               Michele Palmieri -          Mail: mpalmieri@gruppoas.it
               Ali Ramadan -               Mail: ARamadan@League.com.eg
               Željko Frua -               Mail: multiform@si.tel.hr
               Eric Bateman -              Mail: Ebateman242@cs.com
               Guy van den Berg -          Mail: guy@brainwaves.co.za
               Jean-Marc Auligine -        Mail: cleaix@compuserve.com
               Yaroslav V Tatarenko -      Mail: yarik@meta.sebastopol.ua
               Frank van den Bergh -       Mail: frank@bergh.org
               George Tasker -             Mail: gtasker@optusnet.com.au
               Andrea Guidetti -           Mail: andrea.guidetti@galactica.it
               Paolo Pagani -              Mail: ppagani@csc.com
               Roberto Chieregato -        Mail: roberto.chieregato@tin.it
               Elizabeth Gathman -         Mail: carpenteraunt@mailandnews.com
               Reijo Pitkanen -            Mail: reijo.pitkanen@somermatic.com
               Adrian Tarau -              Mail: ady@datagroup.ro
               Stuart -                    Mail: stuart@gsdassociates.co.uk
               Thomas Dingermann -         Mail: thomas@dingermaenner.de
               Marc HAUGUEL -              Mail: marc.hauguel@wanadoo.fr
               Henner Kollmann -           Mail: Henner.Kollmann@gmx.de
               Ales Vaupotic -             Mail: ales.vaupotic@elektro-logistika.com
               Fabio Pedretti -            Mail: fabio.pedretti@libero.it
               Steve Farmer -              Mail: i7tech@btconnect.com
               Jorn Johanesson -           Mail: Jorn_Johanesson@apimo.dk

Special Thanks go to Frederic Leneuf-magaud for all his efforts in improving the
quality and features of the grid.

History:       Version 3.8:
               - ColumnWidthChanged removed because:
                 - event was also fired when you change a row height
                 - event was not fired if the mouse cursor was outside the grid after resizing
               - New rule for DisplayMemo:
                 - when DisplayMemo is false, FullSizeMemo must be false
               - New rules for FullSizeMemo:
                 - when FullSizeMemo is true, DisplayMemo must be true
                 - when FullSizeMemo is true, AutoWidth must be false
                 - when FullSizeMemo is true and AutoSize is false, only memo columns are resized
               - New rules for AutoSize:
                 - if dgColumnResize is false, AutoSize must be false
                 - if AutoSize is true, AutoWidth must be false
                 - if AutoSize is false, no default width is applied (nothing is done)
                 - the widest column must not exceed the client width
                 - fixed/locked columns are redimensioned as other columns
               - Four bugs fixed in AutoSize:
                 - the 1st one: occured when dgIndicator is false
                 - the 2nd one: bad coding in the seeking for the column widest value
                 - the 3rd one: column font type and size not taken in count
                 - the 4th one: invisible columns were considered as visible ones
               - New rules for AutoWidth:
                 - completely re-designed
                 - if dgColumnResize is false, AutoWidth must be false
                 - if AutoWidth is true, AutoSize must be false
                 - if AutoWidth is true, FullSizeMemo must be false
                 - if AutoWidth is false, no default width is applied (nothing is done)
                 - fixed/locked columns are redimensioned as other columns
                 - the remaining space after uniform resizing is distributed among first columns
               - Two bugs fixed in AutoWidth:
                 - the 1st one: occured when dgIndicator is false
                 - the 2nd one: invisible columns were considered as visible ones
               - MouseUp and WMSize cleaned up
               - KeyDown modified:
                 - Clearly separated the ReadOnly part
                 - Removed the useless FUseRowColors part
                 - Simplified what's done when FAllowAutoAppend is true
                 - dgCancelOnExit is no longer added to (or removed from) options
               - One bug fixed in Scroll (RowColors now functions properly)
               - New property Controls added for inserting data-aware TWinControls as Inplace Editors
               - New Grid Footer component added
               - Mouse Wheel scrolling implemented
               - New properties ValueChecked and ValueUnChecked to allow TInteger fields to diplay as checkboxes
                 - Example for IsBooleanField:
                   function TForm1.ExDBGrid1IsBooleanField(const Field: TField): Boolean;
                   begin
                        result:= (field.FullName='x') or (field.FullName='y');
                   end;
               - Support for BDE, ADO, DAO, ADS and IBX DataSets fully implemented

History:       Version 3.9:
               - Added three new properties: EnableCellRangeSelect, OnStartCellChanged and OnEndCellChanged
               - Fixed bug in ExDBGridCtls.pas

This notice may not be removed from or altered in any source distribution.

You are free to use the ExDBGrid Component Suite in compiled form for any
purpose. However, use in commercial or shareware applications requires
registration (see the Registration Documentation for information).

GJL Software products in source code or object form (including but not limited
to .PAS, .DCU, .OBJ), in whole or in part, modified or unmodified, may not be
redistributed for profit or as part of another commercial or shareware software
package without express written permission from me.

This component is provided 'as-is', without any express or implied warranty.
In no event shall the author be held liable for any damages arising from the
use of this component.
}

{$I EXDBGRID.INC}
{$WARNINGS OFF}
{$HINTS OFF}

unit ExDBGrid;

interface

uses
  ShellAPI, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, ClipBrd, Menus, dbctrls
  {$IFDEF USER_QREPORT}, UnitReport{$ENDIF}
  {$IFDEF JPEGGRAPHICS}, Jpeg{$ENDIF},
  extctrls, Registry, ExDateTimePicker, Comctrls, ExDBQbf
  {$IFDEF EX_COMPILER_6_UP}, Variants{$ENDIF}
  {$IFDEF BDE}, DBTables, BDE{$ENDIF}
  {$IFDEF ADS}, AdsData, AdsFunc, AdsTable{$ENDIF}
  {$IFDEF ADO}, AdoDB{$ENDIF}
  {$IFDEF DAO}, DAODatabase, DAOTable, DAOQuery, DAODataSet, DAOMDTable, DAOQueryDef{$ENDIF}
  {$IFDEF IBX}, IBCustomDataSet, IBTable, IBQuery{$ENDIF}
  {$IFDEF CDS}, DBClient{$ENDIF};

type
  TExDBGrid = class;

  TExDBGridControl = class(TCollectionItem)
  private
    FControlName: string;
    FFieldName: string;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property ControlName: string read FControlName write FControlName;
    property FieldName: string read FFieldName write FFieldName;
  end;

  TExDBGridControls = class(TCollection)
  private
    FExDBGrid: TExDBGrid;
    function GetItem(Index: Integer): TExDBGridControl;
    procedure SetItem(Index: Integer; Value: TExDBGridControl);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ExDBGrid: TExDBGrid);
    function Add: TExDBGridControl;
    function ControlByField(FieldName: string): TExDBGridControl;
    property Items[Index: Integer]: TExDBGridControl read GetItem write SetItem;
  end;

  TCellAttribute = procedure(Sender: TObject; Field: TField; Canvas: TCanvas; State: TGridDrawState) of object;

  TExportDelimiter = (Pipe, Comma, Quote);

  TFlatCheckBoxType = (Normal, Bold, None);

  TMemoViewType = (WordWrapOn, ScrollBarsOn);

  TExMenuOptions = set of (exAutoSize, exAutoWidth, exDisplayBoolean,
    exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis,
    exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing,
    exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid,
    exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll,
    exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize,
    exSearchMode, exSaveLayout, exLoadLayout);

  TMemoInplaceEditor = (Memo, RichEdit);

  TAutoWidth = (awNone, awDefault, awProportional, awUniform, awWidestValue, awWidestValueTitle);

  TAutoWidthEvent = procedure(Sender: TObject; var NewValue: TAutoWidth) of object;

  TIsBooleanField = function(const Field: TField): boolean of object;

  TExDBGrid = class(TDBGrid)
  private
    FControls: TExDBGridControls;
    FCurrentControl: TWinControl;
    FOldControlWndProc: TWndMethod;
    FCustomEditor: Boolean;
    FRowSizingAllowed: Boolean;
    FOnApplyCellAttribute: TCellAttribute;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnColEnter: TNotifyEvent;
    FRowHeight: Integer;
    FDisplayImages: Boolean;
    FDisplayMemo: Boolean;
    FDisplayBool: Boolean;
    FDisplayDateTime: Boolean;
    FGridAutoSize: Boolean;
    FGridAutoWidth: TAutoWidth;
    FGridAutoWidthOnResize: Boolean;
    FOnAutoWidthChange: TAutoWidthEvent;
    FLockedHeight: Word;
    FTitleRowHeight: Integer;
    FNewDefRowHeight: Integer;
    FLockedWidth: Boolean;
    FOnRightClick: TNotifyEvent;
    FFullSizeMemo: Boolean;
    FCells3D: Boolean;
    FCellHints: Boolean;
    FHintWnd: THintWindow;
    FRowColor1: TColor;
    FRowColor2: TColor;
    FUseRowColors: Boolean;
    FMultiLineTitles: Boolean;
    FMultiLineRows: Boolean;
    FExDBGridPopUpMenu: TPopUpMenu;
    FTitleCheck: Boolean;
    FBackgroundPicture: TBitmap;
    FUseBackgroundPicture: Boolean;
    FExportDelimiter: TExportDelimiter;
    FAllowAutoAppend: Boolean;
    FDrawFocusRect: Boolean;
    FEnterAsTab: Boolean;
    FHighlightColor: TColor;
    FImageHighlightColor: TColor;
    FHighlightFontColor: TColor;
    FReportCaption: string;
    FHotTrack: Boolean;
    FHotTrackColor: TColor;
    FOrigColor: TColor;
    FLockedCols: Integer;
    FLockedFont: TFont;
    FLockedColor: TColor;
    FFlatCheckBox: Boolean;
    FFlatCheckBoxType: TFlatCheckBoxType;
    FMemoViewType: TMemoViewType;
    FRegistrySaveName: string;
    FShowTextEllipsis: Boolean;
    FShowTitleEllipsis: Boolean;
    FLinesPerRow: Integer;
    FSearchMode: Boolean;
    FExMenuOptions: TExMenuOptions;
    FScrollHints: Boolean;
    FScrollHintWnd: THintWindow;
    FUseBitmapDrawing: Boolean;
    FMemoInplaceEditor: TMemoInplaceEditor;
    FDisplayPopupEditors: Boolean;
    FOnCustomize: TNotifyEvent;
    FCustomColMove: Boolean;
    FDragImages: TImageList;
    FDragTimer: TTimer;
    FFixedCols: Integer;
    FColMove: Integer;
    FShowTitlesWhenInactive: Boolean;
    FBoldTitlesWhenCells3D: Boolean;
    FBoldIndicatorsWhenCells3D: Boolean;
    //FExtendedScroll: Boolean;
    {$IFDEF EX_COMPILER_4_UP}
    FFooter: TWinControl;
    {$ENDIF}
    FValueChecked: integer;
    FValueUnChecked: integer;
    FIsBooleanField: TIsBooleanField;
    FLastXPos, FLastYPos: Integer;
    FEnableCellRangeSelect: Boolean;
    FOnStartCellChanged, FOnEndCellChanged: TNotifyEvent;
    FRangeSelection: TGridRect;
    FStartBookmark, FEndBookMark: TBookmarkStr;
    OldCol, OldRow: Integer;
    function AcquireFocus: Boolean;
    function GetTitleOffset: Byte;
    function CellToCol(Cell: Integer): Integer;
    function MaxFixed: Integer;
    function MaxColIndex: Integer;
    function CanEditField: Boolean;
    function InternalIsBooleanField(const Field: TField): boolean;
    procedure SetControls(Value: TExDBGridControls);
    procedure HideCurrentControl;
    procedure ControlWndProc(var Message: TMessage);
    procedure UpdateTitlesHeight;
    procedure SetRowSizingAllowed(Value: Boolean);
    procedure LockHeight;
    procedure UnLockHeight;
    procedure CalcTitleHeight;
    procedure SetDisplayImages(Value: Boolean);
    procedure SetDisplayMemo(Value: Boolean);
    procedure SetDisplayBool(Value: Boolean);
    procedure SetDisplayDateTime(Value: Boolean);
    procedure SetGridAutoSize(Value: Boolean);
    procedure SetGridAutoWidth(Value: TAutoWidth);
    procedure SetGridAutoWidthOnResize(Value: Boolean);
    procedure SetFullSizeMemo(Value: Boolean);
    procedure SendSizeMessage;
    procedure WMRButtonDown(var Message: TWMRButtonDown); message WM_RBUTTONDOWN;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure SetCells3D(Value: Boolean);
    procedure SetCellHints(Value: Boolean);
    procedure SetRowColor1(Value: TColor);
    procedure SetRowColor2(Value: TColor);
    procedure SetUseRowColors(Value: Boolean);
    procedure SetMultiLineTitles(Value: Boolean);
    procedure SetMultiLineRows(Value: Boolean);
    procedure MnuAutoSizeClick(Sender: TObject);
    procedure MnuAutoWidthClick(Sender: TObject);
    procedure MnuDisplayBooleanClick(Sender: TObject);
    procedure MnuDisplayImagesClick(Sender: TObject);
    procedure MnuDisplayMemoClick(Sender: TObject);
    procedure MnuDisplayDateTimeClick(Sender: TObject);
    procedure MnuShowTextEllipsisClick(Sender: TObject);
    procedure MnuShowTitleEllipsisClick(Sender: TObject);
    procedure MnuFullSizeMemoClick(Sender: TObject);
    procedure MnuAllowRowSizingClick(Sender: TObject);
    procedure MnuCellHintsClick(Sender: TObject);
    procedure MnuMultiLineTitlesClick(Sender: TObject);
    procedure MnuUseRowColors(Sender: TObject);
    procedure MnuFixedColumns(Sender: TObject);
    procedure MnuPrintGrid(Sender: TObject);
    procedure MnuPrintDataSet(Sender: TObject);
    procedure MnuExportGrid(Sender: TObject);
    procedure MnuSelectAll(Sender: TObject);
    procedure MnuUnSelectAll(Sender: TObject);
    procedure MnuQBFClick(Sender: TObject);
    procedure MnuSBFClick(Sender: TObject);
    procedure MnuMemoInplaceEditorMode(Sender: TObject);
    procedure MnuRichEditEditorMode(Sender: TObject);
    procedure MnuCustomize(Sender: TObject);
    procedure MnuSearchModeClick(Sender: TObject);
    procedure MnuSaveLayout(Sender: TObject);
    procedure MnuLoadLayout(Sender: TObject);
    procedure FExDBGridPopUpMenuPopup(Sender: TObject);
    procedure SetTitleCheck(Value: Boolean);
    procedure SetBackgroundPicture(Value: TBitmap);
    procedure PictureChanged(Sender: TObject);
    procedure SetUseBackgroundPicture(Value: Boolean);
    procedure DrawBackground;
    procedure SetAllowAutoAppend(Value: Boolean);
    procedure SetDrawFocusRect(Value: Boolean);
    procedure SetHighlightColor(Value: TColor);
    procedure SetImageHighlightColor(Value: TColor);
    procedure SetHighlightFontColor(Value: TColor);
    procedure SetHotTrackColor(Value: TColor);
    procedure SetLockedCols(Value: Integer);
    procedure SetLockedColor(Value: TColor);
    procedure SetLockedFont(Value: TFont);
    procedure LockedChanged;
    procedure SetFlatCheckBox(Value: Boolean);
    procedure SetFlatCheckBoxType(Value: TFlatCheckBoxType);
    procedure SetMemoViewType(Value: TMemoViewType);
    procedure SetShowTextEllipsis(Value: Boolean);
    procedure SetShowTitleEllipsis(Value: Boolean);
    procedure SetLinesPerRow(Value: Integer);
    procedure SetSearchMode(Value: Boolean);
    procedure SetExMenuOptions(Value: TExMenuOptions);
    procedure SetScrollHints(Value: Boolean);
    procedure WMPaint(var Message: TWMPaint); message WM_Paint;
    procedure SetUseBitmapDrawing(Value: Boolean);
    procedure SetMemoInplaceEditor(Value: TMemoInplaceEditor);
    procedure SetDisplayPopupEditors(Value: Boolean);
    procedure SetShowTitlesWhenInactive(Value: Boolean);
    procedure SetBoldTitlesWhenCells3D(Value: Boolean);
    procedure SetBoldIndicatorsWhenCells3D(Value: Boolean);
    //procedure SetExtendedScroll(Value: Boolean);
    {$IFDEF EX_COMPILER_4_UP}
    procedure SendFooterMsg(Msg: Integer);
    {$ENDIF}
    procedure SetEnableCellRangeSelect(Value: Boolean);
    procedure SetEndCell(const Value: TGridCoord);
    procedure SetStartCell(const Value: TGridCoord);
    procedure UpdateScrollBar;
  protected
    FOnColResize: TNotifyEvent;
    FEditColor: TColor;
    FInplaceEdit: TInplaceEdit;
    {$IFDEF EX_COMPILER_4_UP}
    FSavedBookmark: TBookmarkStr;
    FSavedRowPos: Integer;
    {$ENDIF}
    function CreateEditor: TInplaceEdit; override;
    function GetDefaultRowHeight: Integer;
    function GetOptWidth: Integer;
    function CreateColumns: TDBGridColumns; override;
    function GetMaskedColumnDrag: Boolean;
    function GetFixedCols: Integer;
    function CanEditShow: Boolean; override;
    {$IFDEF EX_COMPILER_4_UP}
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    {$ENDIF}
    procedure PlaceControl(Control: TWinControl; ACol, ARow: Integer); virtual;
    procedure DoHint(X, Y: Integer);
    procedure SetDefaultRowHeight(Value: Integer);
    procedure LayoutChanged; override;
    procedure RowHeightsChanged; override;
    procedure CellClick(Column: TColumn); override;
    procedure DblClick; override;
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure ColWidthsChanged; override;
    procedure ColumnMoved(FromIndex, ToIndex: LongInt); override;
    procedure RowMoved(FromIndex, ToIndex: LongInt); override;
    procedure SetCheckBoxSize;
    procedure ApplyCellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState);
    procedure CellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState); dynamic;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure ColEnter; override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure TitleClick(Column: TColumn); override;
    procedure Paint; override;
    procedure Loaded; override;
    procedure CreateWnd; override;
    procedure SetColumnAttributes; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure Scroll(Distance: Integer); override;
    procedure SetFixedColumns; virtual;
    procedure DrawCustomColumn(Canvas: TCanvas; ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); virtual;
    procedure LinkActive(Value: Boolean); override;
    procedure CreateDragImage(DragCol: Integer); virtual;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;
    procedure DragCanceled; override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;
    procedure DragTimerTimer(Sender: Tobject);
    procedure SetMaskedColumnDrag(Value: Boolean);
    procedure SetFixedCols(Value: Integer);
    procedure TopLeftChanged; override;
    procedure DoStartCellChanged; dynamic;
    procedure DoEndCellChanged; dynamic;
  public
    DBMemo: TDBMemo;
    DBRichEdit: TDBRichEdit;
    DateTimePicker: TExDateTimePicker;
    FSearchEdit: TEdit;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas;
    property Col;
    property Row;
    property FixedCols;
    property FixedRows;
    property TopRow;
    property SelectedRows;
    property DataLink;
    property ColCount;
    property RowCount;
    property ColWidths;
    property GridLineWidth;
    property InplaceEdit: TInplaceEdit read FInplaceEdit;
    property TitleOffset: Byte read GetTitleOffset;
    property OnColumnResize: TNotifyEvent read FOnColResize write FOnColResize;
    property OptWidth: Integer read GetOptWidth;
    property VisibleRowCount;
    property VisibleColCount;
    property GridHeight;
    property GridWidth;
    property LeftCol;
    function CellRect(ACol, ARow: Longint): TRect;
    procedure Invalidate; override;
    {$IFDEF BDE}
    procedure MoveToRow(NewRow: Integer);
    {$ENDIF}
    procedure WMHScroll(var Msg: TWMHScroll); message wm_HScroll;
    procedure WMVScroll(var Msg: TWMVScroll); message wm_VScroll;
    procedure CMMouseEnter(var Msg: TMessage); message cm_MouseEnter;
    procedure CMMouseLeave(var Msg: TMessage); message cm_MouseLeave;
    procedure WMMouseMove(var Msg: TWMMouseMove); message wm_MouseMove;
    procedure OnKeyDBMemo(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnKeyDateTimePicker(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnChangeDateTimePicker(Sender: TObject);
    procedure OnKeyEditUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnKeyEditDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnDBExit(Sender: TObject);
    procedure OnDTPExit(Sender: TObject);
    procedure OnKeyEditExit(Sender: TObject);
    procedure ExportGrid(ExpFileName: string); virtual;
    procedure ExportToFile(ExpFileName: string; Delimiter: Char);
    procedure GridPreview;
    procedure DataSetPreview;
    procedure GridPrint;
    procedure DataSetPrint;
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure ShowCustomizeDialog;
    procedure ShowQueryByForm;
    procedure ShowSortByForm;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    {$IFDEF EX_COMPILER_4_UP}
    procedure SaveGridPosition;
    procedure RestoreGridPosition;
    procedure RegisterFooter(Footer: TWinControl);
    procedure UnregisterFooter(Footer: TWinControl);
    {$ENDIF}
    procedure RefreshGridRect(ARect: TGridRect);
    property StartCell: TGridCoord read FRangeSelection.TopLeft write SetStartCell;
    property EndCell: TGridCoord read FRangeSelection.BottomRight write SetEndCell;
  published
    property Controls: TExDBGridControls read FControls write SetControls;
    property ScrollBars;
    property DefaultDrawing default False;
    property EditColor: TColor read FEditColor write FEditColor;
    property DefaultRowHeight: Integer read GetDefaultRowHeight write SetDefaultRowHeight;
    property RowSizingAllowed: Boolean read FRowSizingAllowed write SetRowSizingAllowed default False;
    property OnApplyCellAttribute: TCellAttribute read FOnApplyCellAttribute write FOnApplyCellAttribute;
    property OnMouseDown read FOnMouseDown write FOnMouseDown;
    property OnMouseUp read FOnMouseUp write FOnMouseUp;
    property OnMouseMove read FOnMouseMove write FOnMouseMove;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property DisplayImages: Boolean read FDisplayImages write SetDisplayImages default True;
    property DisplayMemo: Boolean read FDisplayMemo write SetDisplayMemo default True;
    property DisplayBoolean: Boolean read FDisplayBool write SetDisplayBool default True;
    property DisplayDateTime: Boolean read FDisplayDateTime write SetDisplayDateTime default True;
    property GridAutoSize: Boolean read FGridAutoSize write SetGridAutoSize default False;
    property GridAutoWidth: TAutoWidth read FGridAutoWidth write SetGridAutoWidth default awNone;
    property GridAutoWidthOnResize: Boolean read FGridAutoWidthOnResize write SetGridAutoWidthOnResize default True;
    property OnAutoWidthChange: TAutoWidthEvent read FOnAutoWidthChange write FOnAutoWidthChange;
    property FullSizeMemo: Boolean read FFullSizeMemo write SetFullSizeMemo default False;
    property OnRightClick: TNotifyEvent read FOnRightClick write FOnRightClick;
    property Cells3D: Boolean read FCells3D write SetCells3D default False;
    property CellHints: Boolean read FCellHints write SetCellHints default False;
    property RowColor1: TColor read FRowColor1 write SetRowColor1;
    property RowColor2: TColor read FRowColor2 write SetRowColor2;
    property UseRowColors: Boolean read FUseRowColors write SetUseRowColors default False;
    property MultiLineTitles: Boolean read FMultiLineTitles write SetMultiLineTitles default False;
    property TitleCheck: Boolean read FTitleCheck write SetTitleCheck default False;
    property BackgroundPicture: TBitmap read FBackgroundPicture write SetBackgroundPicture;
    property UseBackgroundPicture: Boolean read FUseBackgroundPicture write SetUseBackgroundPicture default False;
    property ExportDelimiter: TExportDelimiter read FExportDelimiter write FExportDelimiter default Pipe;
    property AllowAutoAppend: Boolean read FAllowAutoAppend write SetAllowAutoAppend default True;
    property DrawFocusRect: Boolean read FDrawFocusRect write SetDrawFocusRect default True;
    property EnterAsTab: Boolean read FEnterAsTab write FEnterAsTab default False;
    property HighlightColor: TColor read FHighlightColor write SetHighlightColor;
    property ImageHighlightColor: TColor read FImageHighlightColor write SetImageHighlightColor;
    property HighlightFontColor: TColor read FHighlightFontColor write SetHighlightFontColor;
    property ReportCaption: string read FReportCaption write FReportCaption;
    property HotTrack: Boolean read FHotTrack write FHotTrack default False;
    property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor;
    property LockedCols: Integer read FLockedCols write SetLockedCols;
    property LockedFont: TFont read FLockedFont write SetLockedFont;
    property LockedColor: TColor read FLockedColor write SetLockedColor;
    property FlatCheckBox: Boolean read FFlatCheckBox write SetFlatCheckBox default True;
    property FlatCheckBoxType: TFlatCheckBoxType read FFlatCheckBoxType write SetFlatCheckBoxType default Normal;
    property MemoViewType: TMemoViewType read FMemoViewType write SetMemoViewType default WordWrapOn;
    property RegistrySaveName: string read FRegistrySaveName write FRegistrySaveName;
    property ShowTextEllipsis: Boolean read FShowTextEllipsis write SetShowTextEllipsis default False;
    property ShowTitleEllipsis: Boolean read FShowTitleEllipsis write SetShowTitleEllipsis default False;
    property MultiLineRows: Boolean read FMultiLineRows write SetMultiLineRows default False;
    property LinesPerRow: Integer read FLinesPerRow write SetLinesPerRow default 1;
    property SearchMode: Boolean read FSearchMode write SetSearchMode default False;
    property ExMenuOptions: TExMenuOptions read FExMenuOptions write SetExMenuOptions;
    property ScrollHints: Boolean read FScrollHints write SetScrollHints default False;
    property UseBitmapDrawing: Boolean read FUseBitmapDrawing write SetUseBitmapDrawing default False;
    property MemoInplaceEditor: TMemoInplaceEditor read FMemoInplaceEditor write SetMemoInplaceEditor default Memo;
    property DisplayPopupEditors: Boolean read FDisplayPopupEditors write SetDisplayPopupEditors default False;
    property OnCustomize: TNotifyEvent read FOnCustomize write FOnCustomize;
    property MaskedColumnDrag: Boolean read GetMaskedColumnDrag write SetMaskedColumnDrag;
    property ShowTitlesWhenInactive: Boolean read FShowTitlesWhenInactive write SetShowTitlesWhenInactive default False;
    property BoldTitlesWhenCells3D: Boolean read FBoldTitlesWhenCells3D write SetBoldTitlesWhenCells3D default False;
    property BoldIndicatorsWhenCells3D: Boolean read FBoldIndicatorsWhenCells3D write SetBoldIndicatorsWhenCells3D default False;
    //property ExtendedScroll: Boolean read FExtendedScroll write SetExtendedScroll default True;
    {$IFDEF EX_COMPILER_4_UP}
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    {$ENDIF}
    property OnIsBooleanField: TIsBooleanField read FIsBooleanField write FIsBooleanField;
    property ValueChecked: integer read FValueChecked write FValueChecked;
    property ValueUnChecked: integer read FValueUnChecked write FValueUnChecked;
    property EnableCellRangeSelect: Boolean read FEnableCellRangeSelect write SetEnableCellRangeSelect default False;
    property OnStartCellChanged: TNotifyEvent read FOnStartCellChanged write FOnStartCellChanged;
    property OnEndCellChanged: TNotifyEvent read FOnEndCellChanged write FOnEndCellChanged;
  end;

  TInplaceEditCracker = class(TInplaceEdit)
  public
    property Color;
  end;

  TExDBGridMod = class(TCustomGrid)
  public
    property Options;
    property RowHeights;
  end;

type
  TMyBookmarks = class(TBookmarkList);

function ExCellsEqual(Cell1, Cell2: TGridCoord): Boolean;
function ExPointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;

const
  TextPasteFields = [ftString, ftSmallint, ftInteger, ftWord, ftFloat,
    ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBoolean, ftAutoInc,
    ftMemo, ftFmtMemo];

  {$IFDEF ENGLISH}
  aMenuItems: array[0..36] of string = ('Auto Size', 'Auto Width', '-', 'Display Boolean', 'Display Images', 'Display Memo',
    'Display Date/Time', '-', 'Show Text Ellipsis', 'Show Title Ellipsis', 'Full Size Memo',
    '-', 'Allow Row Sizing', 'Cell Hints', 'Multi Line Titles', 'Use Row Colors', 'Fixed Columns', '-',
    'Print Grid', 'Print DataSet', '-', 'Export Grid', '-', 'Select All', 'Unselect All',
    '-', 'Query By Form', 'Sort By Form', '-', 'Memo Editor Mode', 'RichEdit Editor Mode',
    '-', 'Customize', 'Search Mode', '-', 'Save Layout', 'Load Layout');
  lsDSNotSupportedByFooter = 'This DataSet is not supported by ExUltimDBFooter.';
  lsError = 'Error';
  {$ENDIF}
  {$IFDEF ITALIAN}
  aMenuItems: array[0..36] of string = ('Dimensionamento Automatico', 'Larghezza Automatica', '-',
    'Visualizzazione Boolean', 'Visualizzazione Immagini', 'Visualizzazione Memo',
    'Visualizzazione Date/Ore', '-', 'Visualizza Puntini del Testo', 'Visualizza Puntini del Titolo',
    'Memo a Dimensione Totale', '-', 'Ridimensionamento Righe', 'Hints sulle Celle',
    'Titoli su più Righe', 'Righe a Due Colori', 'Colonne Fisse', '-', 'Stampa Griglia', 'Stampa DataSet', '-',
    'Esporta Griglia', '-', 'Seleziona Tutto', 'Deseleziona Tutto', '-', 'Interrogazione',
    'Ordinamento', '-', 'Utilizzo Memo come Editor', 'Utilizzo RichEdit come Editor', '-',
    'Personalizza', 'Modalità Ricerca', '-', 'Salvataggio Impostazioni', 'Ripristino Impostazioni');
  lsDSNotSupportedByFooter = 'This DataSet is not supported by ExUltimDBFooter.';
  lsError = 'Error';
  {$ENDIF}
  {$IFDEF PORTUGUESE}
  aMenuItems: array[0..36] of string = ('Dimensionamento Automático', 'Largura Automática', '-',
    'Mostrar Booleano', 'Mostrar Imagem', 'Mostrar Memo',
    'Mostrar Data/Hora', '-', 'Mostrar Elipses no texto', 'Mostrar Elipses no título',
    'Memo de Dimensão Total', '-', 'Redimensionamento de Linhas', 'Hints em Células',
    'Títulos Multi-linhas', 'Usar Cores nas Linhas', 'Colunas Fixas', '-', 'Imprimir Grelha', 'Imprimir Tabela', '-',
    'Exportar Grelha', '-', 'Seleccionar Tudo', 'Anular Selecção', '-', 'Pesquisa',
    'Ordenamento', '-', 'Memo como Editor', 'RichEdit como Editor', '-',
    'Personalizar', 'Modo de Busca', '-', 'Guardar Configuração', 'Abrir Configuração');
  lsDSNotSupportedByFooter = 'This DataSet is not supported by ExUltimDBFooter.';
  lsError = 'Error';
  {$ENDIF}
  {$IFDEF FRENCH}
  aMenuItems: array[0..36] of string = ('Ajustement auto des colonnes', 'Ajustement auto de la grille', '-',
    'Afficher les booléens', 'Afficher les images', 'Afficher les mémos', 'Afficher les dates/heures', '-',
    'Points de suspension dans les textes', 'Points de suspension dans les titres', 'Mémos entiers', '-',
    'Redimensionner les lignes', 'Panneaux d''affichage des cellules', 'Titres sur plusieurs lignes',
    'Colorier les lignes', 'Colonnes figées', '-', 'Imprimer la grille', 'Imprimer l''ensemble de données', '-',
    'Exporter la grille', '-', 'Tout sélectionner', 'Annuler la sélection', '-',
    'Formulaire de requête', 'Formulaire de tri', '-', 'Éditeur de texte brut', 'Éditeur de texte enrichi', '-',
    'Personnaliser', 'Mode recherche', '-', 'Enregistrer la disposition', 'Recharger la disposition');
  lsDSNotSupportedByFooter = 'Cet ensemble de données n''est pas géré par ExUltimDBFooter.';
  lsError = 'Erreur';
  {$ENDIF}
  {$IFDEF GERMAN}
  aMenuItems: array[0..36] of string = ('automatische Größe', 'automatische Breite', '-', 'Wahrheitswerte anzeigen', 'Bilder anzeigen', 'Langtexte anzeigen',
    'Datum/Uhrzeit', '-', 'Show Text Ellipsis', 'Show Title Ellipsis', 'Langetexte in voller Größe',
    '-', 'autom. Zeilenhöhe', 'Spalten-Infos', 'mehrzeilige Titel', 'benutze farbige Zeilen', 'feste Spalten', '-',
    'Gitter drucken', 'ges. Daten drucken', '-', 'Export Gitter', '-', 'Alles markieren', 'Alles demarkieren',
    '-', 'Query By Form', 'Sort By Form', '-', 'Memo Editor Mode', 'RichEdit Editor Mode',
    '-', 'Benutzerdefinierte Einstellungen', 'Suchmodus', '-', 'Layout speichern', 'Layout widerherstellen');
  lsDSNotSupportedByFooter = 'This Dataset is not supported by ExUltimDBFooter.';
  lsError = 'Fehler';
  {$ENDIF}

procedure Register;

implementation

uses ExDBGridCtls, ExColSelect, ExDBGridToWord
  {$IFDEF EX_COMPILER_4_UP}, ExUltimDBFooter{$ENDIF};

var
  GCheckWidth, GCheckHeight: Integer;
  gk: Word;
  BkBmp: TBitmap;

  CellClickCountM: Integer;
  CellClickCountD: Integer;
  OldRectValT, NewRectValT: Integer;
  OldRectValL, NewRectValL: Integer;

function Max(X, Y: Integer): Integer;
begin
  if X > Y then
    Result := X
  else
    Result := Y;
end;

function ExPointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;
begin
  Result := (Col >= Rect.Left) and (Col <= Rect.Right) and (Row >= Rect.Top)
    and (Row <= Rect.Bottom);
end;

function ExCellsEqual(Cell1, Cell2: TGridCoord): Boolean;
begin
  Result := (Cell1.X = Cell2.X) and (Cell1.Y = Cell2.Y);
end;

function NormalizeGridRect(Rect: TGridRect): TGridRect;
begin
  Result := Rect;
  if Result.Right < Result.Left then
    begin
      Result.Right := Result.Left;
      Result.Left := Rect.Right;
    end;
  if Result.Bottom < Result.Top then
    begin
      Result.Bottom := Result.Top;
      Result.Top := Rect.Bottom;
    end;
end;

{ TExDBGridControl }

procedure TExDBGridControl.Assign(Source: TPersistent);
begin
  if Source is TExDBGridControl then
    begin
      ControlName := TExDBGridControl(Source).ControlName;
      FieldName := TExDBGridControl(Source).FieldName;
    end
  else
    inherited Assign(Source);
end;

constructor TExDBGridControls.Create(ExDBGrid: TExDBGrid);
begin
  inherited Create(TExDBGridControl);
  FExDBGrid := ExDBGrid;
end;

function TExDBGridControls.GetOwner: TPersistent;
begin
  Result := FExDBGrid;
end;

function TExDBGridControls.Add: TExDBGridControl;
begin
  Result := TExDBGridControl(inherited Add);
end;

function TExDBGridControls.GetItem(Index: Integer): TExDBGridControl;
begin
  Result := TExDBGridControl(inherited GetItem(Index));
end;

procedure TExDBGridControls.SetItem(Index: Integer; Value: TExDBGridControl);
begin
  inherited SetItem(Index, Value);
end;

function TExDBGridControls.ControlByField(FieldName: string): TExDBGridControl;
var
  Ctrl_Idx: Integer;
begin
  Result := nil;
  for Ctrl_Idx := 0 to Count - 1 do
    {$IFDEF EX_COMPILER_5_UP}
    if SameText(Items[Ctrl_Idx].FieldName, FieldName) then
      {$ELSE}
    if CompareText(Items[Ctrl_Idx].FieldName, FieldName) = 0 then
      {$ENDIF}
      begin
        Result := Items[Ctrl_Idx];
        Break;
      end;
end;

{ TExDBGrid }

constructor TExDBGrid.Create(AOwner: TComponent);
var
  i, k: Integer;
  NewItem, NewSubItem: TMenuItem;
begin
  inherited Create(AOwner);

  DataSource := DataLink.DataSource;
  DefaultDrawing := False;
  ControlStyle := ControlStyle + [csAcceptsControls, csDisplayDragImage, csFramed, csOpaque];
  BorderStyle := bsNone;
  SetCheckBoxSize;
  FControls := TExDBGridControls.Create(Self);
  FCurrentControl := nil;
  FOldControlWndProc := nil;
  FCustomEditor := False;
  FEditColor := clWindow;
  FRowheight := 17;
  FRowSizingAllowed := False;
  FLockedHeight := 0;
  FTitleRowHeight := 0;
  FNewDefRowHeight := 0;
  FLockedWidth := False;
  FDisplayImages := True;
  FDisplayMemo := True;
  FDisplayBool := True;
  FDisplayDateTime := True;
  FGridAutoSize := False;
  FGridAutoWidth := awNone;
  FGridAutoWidthOnResize := True;
  FullSizeMemo := False;
  FCells3D := False;
  FCellHints := False;
  FRowColor1 := $00BAFF6F;
  FRowColor2 := clWindow;
  FUseRowColors := False;
  FMultiLineTitles := False;
  FMultiLineRows := False;
  FTitleCheck := False;
  FBackGroundPicture := TBitmap.Create;
  FBackGroundPicture.OnChange := PictureChanged;
  FUseBackgroundPicture := False;
  BkBmp := nil;
  FExportDelimiter := Pipe;
  FAllowAutoAppend := True;
  FDrawFocusRect := True;
  FHighlightColor := clNavy;
  FImageHighlightColor := clWindow;
  FHighlightFontColor := clWhite;
  FHotTrackColor := clNavy;
  FLockedCols := 0;
  FLockedFont := TFont.Create;
  FLockedColor := clGray;
  FEnterAsTab := False;
  FFlatCheckBox := True;
  FFlatCheckBoxType := Normal;
  FMemoViewType := WordWrapOn;
  FShowTextEllipsis := False;
  FShowTitleEllipsis := False;
  FLinesPerRow := 1;
  FSearchMode := False;
  FExMenuOptions := [exAutoSize, exAutoWidth, exDisplayBoolean,
    exDisplayImages, exDisplayMemo, exDisplayDateTime, exShowTextEllipsis,
    exShowTitleEllipsis, exFullSizeMemo, exAllowRowSizing,
    exCellHints, exMultiLineTitles, exUseRowColors, exFixedColumns, exPrintGrid,
    exPrintDataSet, exExportGrid, exSelectAll, exUnSelectAll,
    exQueryByForm, exSortByForm, exMemoInplaceEditors, exCustomize,
    exSearchMode, exSaveLayout, exLoadLayout];
  FUseBitmapDrawing := False;
  FMemoInplaceEditor := Memo;
  FDisplayPopupEditors := False;
  FDragImages := TImageList.Create(Self);
  FCustomColMove := False;
  FDragTimer := TTimer.Create(Self);
  FDragTimer.Interval := 500;
  FDragTimer.OnTimer := DragTimerTimer;
  FDragTimer.Enabled := False;
  FShowTitlesWhenInactive := False;
  FBoldTitlesWhenCells3D := False;
  FBoldIndicatorsWhenCells3D := False;
  FHintWnd := THintWindow.Create(Self);
  FHintWnd.Color := clInfoBk;
  {$IFDEF EX_COMPILER_5_UP}
  FHintWnd.Font.Color := clInfoText;
  {$ENDIF}
  //FExtendedScroll := True;
  {$IFDEF EX_COMPILER_4_UP}
  FFooter := nil;
  {$ENDIF}
  FValueChecked := ord(True);
  FValueUnChecked := ord(False);
  FEnableCellRangeSelect := False;

  if not (csDesigning in ComponentState) then
    begin
      FExDBGridPopUpMenu := TPopUpMenu.Create(Self);
      FExDBGridPopUpMenu.OnPopup := FExDBGridPopUpMenuPopup;

      for i := 0 to 36 do
        begin
          NewItem := TMenuItem.Create(TExDBGrid(Self));
          NewItem.Caption := aMenuItems[i];
          NewItem.Checked := False;
          case i of
            0: NewItem.OnClick := MnuAutoSizeClick;
            1: NewItem.OnClick := MnuAutoWidthClick;
            3: NewItem.OnClick := MnuDisplayBooleanClick;
            4: NewItem.OnClick := MnuDisplayImagesClick;
            5: NewItem.OnClick := MnuDisplayMemoClick;
            6: NewItem.OnClick := MnuDisplayDateTimeClick;
            8: NewItem.OnClick := MnuShowTextEllipsisClick;
            9: NewItem.OnClick := MnuShowTitleEllipsisClick;
            10: NewItem.OnClick := MnuFullSizeMemoClick;
            12: NewItem.OnClick := MnuAllowRowSizingClick;
            13: NewItem.OnClick := MnuCellHintsClick;
            14: NewItem.OnClick := MnuMultiLineTitlesClick;
            15: NewItem.OnClick := MnuUseRowColors;
            18: NewItem.OnClick := MnuPrintGrid;
            19: NewItem.OnClick := MnuPrintDataSet;
            21: NewItem.OnClick := MnuExportGrid;
            23: NewItem.OnClick := MnuSelectAll;
            24: NewItem.OnClick := MnuUnSelectAll;
            26: NewItem.OnClick := MnuQBFClick;
            27: NewItem.OnClick := MnuSBFClick;
            29: NewItem.OnClick := MnuMemoInplaceEditorMode;
            30: NewItem.OnClick := MnuRichEditEditorMode;
            32: NewItem.OnClick := MnuCustomize;
            33: NewItem.OnClick := MnuSearchModeClick;
            35: NewItem.OnClick := MnuSaveLayout;
            36: NewItem.OnClick := MnuloadLayout;
          end;
          if i = 16 then
            begin
              for k := 0 to 5 do
                begin
                  NewSubItem := TMenuItem.Create(TExDBGrid(Self));
                       {(*}if k = 1 then
                               {$IFDEF ENGLISH}NewSubItem.Caption := '1 Fixed Column'{$ENDIF}
                               {$IFDEF ITALIAN}NewSubItem.Caption := '1 Colonna Fissa'{$ENDIF}
                               {$IFDEF PORTUGUESE}NewSubItem.Caption := '1 Coluna Fixa'{$ENDIF}
                               {$IFDEF FRENCH}NewSubItem.Caption := '1 Colonne Figée'{$ENDIF}
                               {$IFDEF GERMAN}NewSubItem.Caption := '1 Feste Spalte'{$ENDIF}
                           else
                               {$IFDEF ENGLISH}NewSubItem.Caption := IntToStr(k) + ' Fixed Columns';{$ENDIF}
                               {$IFDEF ITALIAN}NewSubItem.Caption := IntToStr(k) + ' Colonne Fisse';{$ENDIF}
                               {$IFDEF PORTUGUESE}NewSubItem.Caption := IntToStr(k) + ' Colunas Fixas';{$ENDIF}
                               {$IFDEF FRENCH}NewSubItem.Caption := IntToStr(k) + ' Colonnes Figées';{$ENDIF}
                               {$IFDEF GERMAN}NewSubItem.Caption := IntToStr(k) + ' feste Spalten';{$ENDIF}{*)}
                  NewSubItem.GroupIndex := 9;
                  NewSubItem.RadioItem := True;
                  NewSubItem.Checked := (k = 0);
                  NewSubItem.Tag := k + 1;
                  NewSubItem.OnClick := MnuFixedColumns;
                  NewItem.Add(NewSubItem);
                end;
            end;
          FExDBGridPopUpMenu.Items.Add(NewItem);
        end;
    end;

  FScrollHintWnd := THintWindow.Create(Self);
  FScrollHintWnd.Color := Application.HintColor;
  FScrollHints := False;
  CellClickCountM := 0;
  CellClickCountD := 0;
  FLastXPos := 0;
  FLastYPos := 0;
end;

{ BEGIN PRIVATE }

function TExDBGrid.CanEditField: Boolean;

  function IsActiveControl: Boolean;
  var
    H: Hwnd;
    ParentForm: TCustomForm;
  begin
    Result := False;
    ParentForm := GetParentForm(Self);
    if Assigned(ParentForm) then
      begin
        if (ParentForm.ActiveControl = Self) then
          Result := True
      end
    else
      begin
        H := GetFocus;
        while IsWindow(H) and (Result = False) do
          begin
            if H = WindowHandle then
              Result := True
            else
              H := GetParent(H);
          end;
      end;
  end;

var
  F: TField;
  Control: TExDBGridControl;
  FOldDisplayBool: Boolean;
  FOldDisplayDateTime: Boolean;
  FOldDisplayMemo: Boolean;
  FOldDisplayPopupEditors: Boolean;
begin
  if not FEnableCellRangeSelect then
    begin
      FCustomEditor := False;
      FOldDisplayBool := False;
      FOldDisplayDateTime := False;
      FOldDisplayMemo := False;
      FOldDisplayPopupEditors := False;

      Result := (dgEditing in Options) and not (csDesigning in ComponentState) and HandleAllocated and (LayoutLock = 0) and ((dgAlwaysShowEditor in Options) or IsActiveControl);
      if not Result then
        Exit;

      Result := (DataLink <> nil) and DataLink.Active and (SelectedIndex >= 0) and (SelectedIndex < Columns.Count);
      if not Result then
        Exit;

      F := SelectedField;
      Result := (F <> nil);
      if not Result then
        Exit;

      if (F.DataType = ftBoolean) then
        begin
          FOldDisplayBool := FDisplayBool;
          FDisplayBool := False;
        end;

      if ((F.DataType = ftDate) or (F.DataType = ftTime) or (F.DataType = ftDateTime)) then
        begin
          FOldDisplayDateTime := FDisplayDateTime;
          FDisplayDateTime := False;
        end;

      if ((F.DataType = ftMemo) or (F.DataType = ftFmtMemo) or (F.DataType = ftBytes)) then
        begin
          FOldDisplayMemo := FDisplayMemo;
          FOldDisplayPopupEditors := FDisplayPopupEditors;
          FDisplayMemo := False;
          FDisplayPopupEditors := False;
        end;

      Control := FControls.ControlByField(F.FieldName);
      Result := (Control <> nil);

      {if not Result then
        begin
          if not (F is TMemoField) and (F.DataType <> ftFmtMemo) and (F.DataType <> ftBytes) and (F is TBlobField) then
            Result := Result and F.CanModify and not F.ReadOnly
          else
            Result := F.CanModify and not F.ReadOnly;
        end
      else
        Result := Result and F.CanModify and not F.ReadOnly;}

      if not Result then
        begin
          if not (F is TMemoField) and (F.DataType <> ftFmtMemo) and (F.DataType <> ftBytes) and (F is TBlobField) then
            Result := Result and F.CanModify and not F.ReadOnly
          else
            if F.Lookup then
              Result := not F.ReadOnly
            else
              Result := F.CanModify and not F.ReadOnly;
        end
      else
        Result := Result and F.CanModify and not F.ReadOnly;

      if not Result then
        Exit;

      if Control <> nil then
        begin
          PlaceControl(TWinControl(Owner.FindComponent(Control.ControlName)), Col, Row);
          FCustomEditor := True;
          Result := True;
        end
      else
        if (F.DataType = ftBoolean) then
          begin
            FDisplayBool := FOldDisplayBool;
            if FDisplayBool then
              Result := False
            else
              Result := True;
          end
        else
          if ((F.DataType = ftDate) or (F.DataType = ftTime) or (F.DataType = ftDateTime)) then
            begin
              FDisplayDateTime := FOldDisplayDateTime;
              if FDisplayDateTime then
                Result := False
              else
                Result := True;
            end
          else
            if ((F.DataType = ftMemo) or (F.DataType = ftFmtMemo) or (F.DataType = ftBytes)) then
              begin
                FDisplayMemo := FOldDisplayMemo;
                FDisplayPopupEditors := FOldDisplayPopupEditors;
                Result := True;
              end;
    end
  else
    begin
      Result := False;
    end;
end;

function TExDBGrid.CanEditShow: Boolean;
begin
  Result := EditorMode and CanEditField;
end;

function TExDBGrid.AcquireFocus: Boolean;
begin
  Result := True;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
    begin
      if not Self.Focused then
        Self.SetFocus;
      Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
    end;
end;

function TExDBGrid.GetTitleOffset: Byte;
begin
  Result := 0;
  if dgTitles in Options then
    Inc(Result);
end;

function TExDBGrid.CellToCol(Cell: Integer): Integer;
begin
  if (dgIndicator in Options) then
    Result := Cell - 1
  else
    Result := Cell;
end;

function TExDBGrid.MaxFixed: Integer;
begin
  if (dgIndicator in Options) then
    Result := FixedCols
  else
    Result := FixedCols - 1;
end;

function TExDBGrid.MaxColIndex: Integer;
begin
  Result := ColCount - 1;
  if dgIndicator in Options then
    Dec(Result);
end;

procedure TExDBGrid.SetControls(Value: TExDBGridControls);
begin
  FControls.Assign(Value);
end;

procedure TExDBGrid.HideCurrentControl;
begin
  if (FCurrentControl <> nil) then
    begin
      FCurrentControl.WindowProc := FOldControlWndProc;
      FCurrentControl.Hide;
      FCurrentControl := nil;
    end;
  FOldControlWndProc := nil;
end;

procedure TExDBGrid.ControlWndProc(var Message: TMessage);
begin
  FOldControlWndProc(Message);
  if Message.Msg = WM_KEYUP then
    case TWMKey(Message).CharCode of
      VK_ESCAPE:
        if not (dgAlwaysShowEditor in Options) then
          begin
            HideCurrentControl;
            if Self.Visible then
              Self.SetFocus;
          end;
    end;
  if Message.Msg = CM_EXIT then
    HideCurrentControl;
end;

procedure TExDBGrid.UpdateTitlesHeight;
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
                DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK));
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
    end
  else
    begin
      if RowHeights[0] <> 17 then
        RowHeights[0] := 17;
    end;
end;

procedure TExDBGrid.SetRowSizingAllowed(Value: Boolean);
begin
  if Value <> FRowSizingAllowed then
    begin
      FRowSizingAllowed := Value;
      if FRowSizingAllowed then
        begin
          if FMultiLineRows then
            FMultiLineRows := False;
          TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goRowSizing, goColSizing, goThumbTracking, goTabs, goColMoving, goRowMoving, goDrawFocusSelected]
        end
      else
        TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goColSizing, goThumbTracking, goTabs, goColMoving, goRowMoving, goDrawFocusSelected] - [goRowSizing];
    end;
end;

procedure TExDBGrid.LockHeight;
begin
  Inc(FLockedHeight);
end;

procedure TExDBGrid.UnLockHeight;
begin
  Dec(FLockedHeight);
end;

procedure TExDBGrid.CalcTitleHeight;
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

          if FTitleRowHeight = 0 then
            FTitleRowHeight := DefaultRowHeight
          else
            Inc(FTitleRowHeight, 4);
        end;
      RowHeights[0] := FTitleRowHeight;
    end;
end;

procedure TExDBGrid.SetDisplayImages(value: Boolean);
begin
  if FDisplayImages <> value then
    begin
      FDisplayImages := value;
      ColEnter;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetDisplayMemo(value: Boolean);
begin
  if FDisplayMemo <> value then
    begin
      FDisplayMemo := value;

      if FDisplayMemo = False then
        SetFullSizeMemo(False);
    end;
end;

procedure TExDBGrid.SetDisplayBool(value: Boolean);
begin
  if FDisplayBool <> value then
    begin
      FDisplayBool := value;
      ColEnter;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetDisplayDateTime(value: Boolean);
begin
  if FDisplayDateTime <> value then
    begin
      FDisplayDateTime := value;

      if FDisplayDateTime = False then
        if Assigned(DateTimePicker) then
          if DateTimePicker.Visible then
            DateTimePicker.Visible := False;

      ColEnter;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetGridAutoSize(value: Boolean);
var
  MaxColNo, ColNo: Integer;
  WidthNew, WidthMax: LongInt;
begin
  if dgColumnResize in Options then
    begin
      FGridAutoSize := Value;
      if FGridAutoSize = True then
        FGridAutoWidth := awNone;
    end
  else
    begin
      FGridAutoSize := False;
      exit;
    end;

  if not (csDesigning in ComponentState) then
    begin
      if (DataLink <> nil) and (DataLink.Active) then
        begin
          BeginUpdate;

          MaxColNo := ColCount - 1;
          if dgIndicator in Options then
            Dec(MaxColNo);

          try
            if FGridAutoSize = True then
              begin
                for ColNo := 0 to MaxColNo do
                  {$IFDEF EX_COMPILER_4_UP}
                  if Columns[ColNo].Visible then
                    {$ENDIF}
                    begin
                      WidthMax := 0;
                      Canvas.Font.Assign(Columns[ColNo].Font);

                      DataLink.DataSet.DisableControls;
                      try
                        DataLink.DataSet.Last;
                        while not DataLink.DataSet.BOF do
                          begin
                            if Fields[ColNo].Value <> Null then
                              begin

                                if FFullSizeMemo = False then
                                  begin
                                    WidthNew := Canvas.TextWidth(Fields[ColNo].DisplayText);
                                  end
                                else
                                  begin
                                    if (Fields[ColNo].DataType = ftMemo) or (Fields[ColNo].DataType = ftFmtMemo) or (Fields[ColNo].DataType = ftBytes) then
                                      WidthNew := Canvas.TextWidth(Fields[ColNo].Value)
                                    else
                                      WidthNew := Canvas.TextWidth(Fields[ColNo].DisplayText);
                                  end;

                                if WidthNew > WidthMax then
                                  WidthMax := WidthNew;

                              end;
                            DataLink.DataSet.Prior;
                          end;
                      finally
                        DataLink.DataSet.EnableControls;
                      end;

                      if WidthMax = 0 then
                        Columns[ColNo].Width := Columns[ColNo].DefaultWidth
                      else
                        begin
                          Inc(WidthMax, 5);
                          if WidthMax > Self.ClientWidth then
                            Columns[ColNo].Width := Self.ClientWidth
                          else
                            Columns[ColNo].Width := WidthMax;
                        end;
                    end;
              end;
          finally
            EndUpdate;
          end;
        end;
    end;
end;

procedure TExDBGrid.SetGridAutoWidth(Value: TAutoWidth);
var
  ColNo, MaxColNo, ColumnCount: Integer;
  NewWidth, MaxWidth: Integer;
  Total, Available, OldAvail: Integer;
begin
  if dgColumnResize in Options then
    begin
      FGridAutoWidth := Value;
      if (FGridAutoWidth <> awNone) and not (csLoading in ComponentState) then
        begin
          FGridAutoSize := False;
          SetFullSizeMemo(False);
        end;
    end
  else
    begin
      FGridAutoWidth := awNone;
      exit;
    end;

  FGridAutoWidth := Value;

  if Assigned(FOnAutoWidthChange) then
    FOnAutoWidthChange(Self, FGridAutoWidth);

  if (FGridAutoWidth <> awNone) and not (csLoading in ComponentState) then
    begin
      if (FGridAutoWidth <> awWidestValue) and (FGridAutoWidth <> awWidestValueTitle) then
        SetFullSizeMemo(False);

      if DataLink.Active then
        begin
          FLockedWidth := True;
          Screen.Cursor := crHourGlass;
          BeginUpdate;
          try
            MaxColNo := MaxColIndex;

            if (FGridAutoWidth = awWidestValue) or (FGridAutoWidth = awWidestValueTitle) then
              begin // Widest value
                for ColNo := 0 to MaxColNo do
                  {$IFDEF EX_COMPILER_4_UP}
                  if Columns[ColNo].Visible then
                    {$ENDIF}
                    begin
                      if FGridAutoWidth = awWidestValue then
                        MaxWidth := 0
                      else
                        begin
                          Canvas.Font.Assign(Columns[ColNo].Title.Font);
                          MaxWidth := Canvas.TextWidth(Columns[ColNo].Title.Caption) + 2;
                        end;
                      Canvas.Font.Assign(Columns[ColNo].Font);
                      DataLink.DataSet.DisableControls;
                      try
                        DataLink.DataSet.Last;
                        while not DataLink.DataSet.BOF do
                          begin
                            if Fields[ColNo].Value <> Null then
                              begin
                                if FFullSizeMemo = False then
                                  NewWidth := Canvas.TextWidth(Fields[ColNo].DisplayText)
                                else
                                  begin
                                    if (Fields[ColNo].DataType = ftMemo) or (Fields[ColNo].DataType = ftFmtMemo) or (Fields[ColNo].DataType = ftBytes) then
                                      NewWidth := Canvas.TextWidth(Fields[ColNo].Value)
                                    else
                                      NewWidth := Canvas.TextWidth(Fields[ColNo].DisplayText);
                                  end;
                                if NewWidth > MaxWidth then
                                  MaxWidth := NewWidth;
                              end;
                            DataLink.DataSet.Prior;
                          end;
                      finally
                        DataLink.DataSet.EnableControls;
                      end;

                      if MaxWidth = 0 then
                        Columns[ColNo].Width := Columns[ColNo].DefaultWidth
                      else
                        begin
                          Inc(MaxWidth, 5);

                          if MaxWidth > Self.ClientWidth then
                            Columns[ColNo].Width := Self.ClientWidth
                          else
                            Columns[ColNo].Width := MaxWidth;
                        end;
                    end;
              end

            else
              if FGridAutoWidth = awDefault then
                begin // Default
                  for ColNo := 0 to MaxColNo do
                    {$IFDEF EX_COMPILER_4_UP}
                    if Columns[ColNo].Visible then
                      {$ENDIF}
                      Columns[ColNo].Width := Columns[ColNo].DefaultWidth;
                end

              else
                begin // Proportional & uniform
                  ColumnCount := 0;
                  Available := Self.ClientWidth;
                  Total := 0;
                  for ColNo := 0 to MaxColNo do
                    {$IFDEF EX_COMPILER_4_UP}
                    if Columns[ColNo].Visible then
                      {$ENDIF}
                      begin
                        Inc(ColumnCount);
                        if dgColLines in Options then
                          Dec(Available, GridLineWidth);
                        Inc(Total, Columns[ColNo].Width);
                      end;

                  if dgIndicator in Options then
                    begin
                      Dec(Available, IndicatorWidth);
                      if dgColLines in Options then
                        Dec(Available, GridLineWidth);
                    end;

                  OldAvail := Available;

                  for ColNo := 0 to MaxColNo do
                    {$IFDEF EX_COMPILER_4_UP}
                    if Columns[ColNo].Visible then
                      {$ENDIF}
                      begin
                        if FGridAutoWidth = awProportional then
                          begin // Proportional
                            NewWidth := Round((Columns[ColNo].Width / Total) * OldAvail);
                            Dec(Available, NewWidth);
                            Dec(ColumnCount);
                            if ColumnCount = 0 then
                              Columns[ColNo].Width := NewWidth + Available
                            else
                              Columns[ColNo].Width := NewWidth;
                          end
                        else
                          begin // Uniform
                            NewWidth := Available div ColumnCount;
                            if ColNo < (Available mod ColumnCount) then
                              Columns[ColNo].Width := NewWidth + 1
                            else
                              Columns[ColNo].Width := NewWidth;
                          end;
                      end;
                end;

          finally
            EndUpdate;
            Screen.Cursor := crDefault;
            FLockedWidth := False;
          end;
        end;
      if not ((csLoading in ComponentState) or FGridAutoWidthOnResize) then
        SetGridAutoWidth(awNone);
    end;
end;

procedure TExDBGrid.SetGridAutoWidthOnResize(Value: Boolean);
begin
  if FGridAutoWidthOnResize <> Value then
    begin
      FGridAutoWidthOnResize := Value;
      if FGridAutoWidthOnResize then
        SetGridAutoWidth(FGridAutoWidth);
    end;
end;

procedure TExDBGrid.SetFullSizeMemo(value: Boolean);
var
  ColNo: Integer;
  NewWidth, MaxWidth: Integer;
begin
  if FFullSizeMemo <> Value then
    begin
      FFullSizeMemo := Value;
      if FFullSizeMemo = True then
        begin
          SetDisplayMemo(True);
          if not (FGridAutoWidth in [awNone, awWidestValue, awWidestValueTitle]) then
            SetGridAutoWidth(awNone);
        end;
      if DataLink.Active then
        begin
          FLockedWidth := True;
          BeginUpdate;
          try
            for ColNo := 0 to MaxColIndex do
              {$IFDEF EX_COMPILER_3}
              if (Fields[ColNo].DataType = ftMemo) or (Fields[ColNo].DataType = ftFmtMemo) or (Fields[ColNo].DataType = ftBytes) then
                {$ELSE}
              if Columns[ColNo].Visible and ((Fields[ColNo].DataType = ftMemo) or (Fields[ColNo].DataType = ftFmtMemo) or (Fields[ColNo].DataType = ftBytes)) then
                {$ENDIF}
                begin
                  Canvas.Font.Assign(Columns[ColNo].Font);

                  if FFullSizeMemo = False then
                    MaxWidth := Canvas.TextWidth(Fields[ColNo].DisplayText)
                  else
                    begin
                      MaxWidth := 0;
                      DataLink.DataSet.DisableControls;
                      try
                        DataLink.DataSet.Last;
                        while not DataLink.DataSet.BOF do
                          begin
                            if Fields[ColNo].Value <> Null then
                              begin
                                NewWidth := Canvas.TextWidth(Fields[ColNo].Value);
                                if NewWidth > MaxWidth then
                                  MaxWidth := NewWidth;
                              end;
                            DataLink.DataSet.Prior;
                          end;
                      finally
                        DataLink.DataSet.EnableControls;
                      end;
                    end;

                  if MaxWidth = 0 then
                    Columns[ColNo].Width := Columns[ColNo].DefaultWidth
                  else
                    begin
                      Inc(MaxWidth, 5);
                      if MaxWidth > Self.ClientWidth then
                        Columns[ColNo].Width := Self.ClientWidth
                      else
                        Columns[ColNo].Width := MaxWidth;
                    end;
                end;
          finally
            EndUpdate;
            FLockedWidth := False;
          end;
        end;
    end;
end;

procedure TExDBGrid.SendSizeMessage;
var
  Message: TMessage;
begin
  Exit;

  if HandleAllocated and (FNewDefRowHeight <> 0) then
    begin
      Message.Msg := WM_Size;
      Message.WParam := SIZE_RESTORED;
      Message.lParamLo := Width;
      Message.lParamHi := Height;
      Perform(Message.Msg, Message.wParam, Message.lParam);
    end;
end;

procedure TExDBGrid.WMRButtonDown(var Message: TWMRButtonDown);
begin
  try
    Windows.SetFocus(Handle);
    inherited;

    if Assigned(FOnRightClick) then
      FOnRightClick(Self);
  except
  end;
end;

procedure TExDBGrid.WMLButtonDown(var Message: TWMLButtonDown);
begin
  try
    Windows.SetFocus(Handle);
    inherited;
  except
  end;
end;

procedure TExDBGrid.SetCells3D(Value: Boolean);
begin
  if FCells3D <> Value then
    begin
      FCells3D := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetCellHints(Value: Boolean);
begin
  if FCellHints <> Value then
    begin
      FCellHints := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetRowColor1(Value: TColor);
begin
  if FRowColor1 <> Value then
    begin
      FRowColor1 := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetRowColor2(Value: TColor);
begin
  if FRowColor2 <> Value then
    begin
      FRowColor2 := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetUseRowColors(Value: Boolean);
begin
  if FUseRowColors <> Value then
    begin
      FUseRowColors := Value;

      if FUseRowColors = True then
        begin
          FUseBackgroundPicture := False;
        end;

      Invalidate;
    end;
end;

procedure TExDBGrid.SetMultiLineTitles(Value: Boolean);
begin
  if FMultiLineTitles <> Value then
    begin
      FMultiLineTitles := Value;
      Invalidate;
    end;

  UpdateTitlesHeight;
end;

procedure TExDBGrid.SetMultiLineRows(Value: Boolean);
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

procedure TExDBGrid.MnuAutoSizeClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[0].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).GridAutoSize := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[0].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).GridAutoSize := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[0].Checked := False;
    end;
end;

procedure TExDBGrid.MnuAutoWidthClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[1].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).GridAutoWidth := awUniform;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[1].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).GridAutoWidth := awNone;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[1].Checked := False;
    end;
end;

procedure TExDBGrid.MnuDisplayBooleanClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[3].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayBoolean := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[3].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayBoolean := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[3].Checked := False;
    end;
end;

procedure TExDBGrid.MnuDisplayImagesClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[4].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayImages := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[4].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayImages := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[4].Checked := False;
    end;
end;

procedure TExDBGrid.MnuDisplayMemoClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[5].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayMemo := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[5].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayMemo := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[5].Checked := False;
    end;
end;

procedure TExDBGrid.MnuDisplayDateTimeClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[6].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayDateTime := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[6].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).DisplayDateTime := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[6].Checked := False;
    end;
end;

procedure TExDBGrid.MnuShowTextEllipsisClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[8].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).ShowTextEllipsis := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[8].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).ShowTextEllipsis := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[8].Checked := False;
    end;
end;

procedure TExDBGrid.MnuShowTitleEllipsisClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[9].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).ShowTitleEllipsis := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[9].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).ShowTitleEllipsis := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[9].Checked := False;
    end;
end;

procedure TExDBGrid.MnuFullSizeMemoClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[10].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).FullSizeMemo := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[10].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).FullSizeMemo := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[10].Checked := False;
    end;
end;

procedure TExDBGrid.MnuAllowRowSizingClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[12].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).RowSizingAllowed := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[12].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).RowSizingAllowed := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[12].Checked := False;
    end;
end;

procedure TExDBGrid.MnuCellHintsClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[13].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).CellHints := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[13].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).CellHints := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[13].Checked := False;
    end;
end;

procedure TExDBGrid.MnuMultiLineTitlesClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[14].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).MultiLineTitles := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[14].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).MultiLineTitles := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[14].Checked := False;
    end;
end;

procedure TExDBGrid.MnuUseRowColors(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[15].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).UseRowColors := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[15].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).UseRowColors := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[15].Checked := False;
    end;
end;

procedure TExDBGrid.MnuFixedColumns(Sender: TObject);
begin
  DataLink.DataSet.DisableControls;
  FLockedCols := TMenuItem(Sender).Tag - 1;
  LockedChanged;
  DataLink.DataSet.EnableControls;
end;

procedure TExDBGrid.MnuPrintGrid(Sender: TObject);
begin
  DataLink.DataSet.DisableControls;
  TExDBGrid(Self).GridPreview;
  TExDBGrid(Self).DataSource.DataSet.First;
  DataLink.DataSet.EnableControls;
end;

procedure TExDBGrid.MnuPrintDataSet(Sender: TObject);
begin
  DataLink.DataSet.DisableControls;
  TExDBGrid(Self).DataSetPreview;
  TExDBGrid(Self).DataSource.DataSet.First;
  DataLink.DataSet.EnableControls;
end;

procedure TExDBGrid.MnuExportGrid(Sender: TObject);
begin
  DataLink.DataSet.DisableControls;
  TExDBGrid(Self).ExportGrid('');
  TExDBGrid(Self).DataSource.DataSet.First;
  DataLink.DataSet.EnableControls;
end;

procedure TExDBGrid.MnuSelectAll(Sender: TObject);
begin
  if not (dgMultiSelect in Options) then
    Options := Options + [dgMultiSelect];

  with TExDBGrid(Self).DataSource.DataSet do
    begin
      DisableControls;
      First;
      while not EOF do
        begin
          SelectedRows.CurrentRowSelected := True;
          Next;
        end;
      EnableControls;
    end;

  if FRowSizingAllowed = True then
    TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goRowSizing];
end;

procedure TExDBGrid.MnuUnSelectAll(Sender: TObject);
begin
  if dgMultiSelect in Options then
    Options := Options - [dgMultiSelect];

  with TExDBGrid(Self).DataSource.DataSet do
    begin
      First;
    end;

  if FRowSizingAllowed = True then
    TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goRowSizing];
end;

procedure TExDBGrid.MnuQBFClick(Sender: TObject);
begin
  Application.CreateForm(TdlgExDBQbf, dlgExDBQbf);
  QueryByForm(TDBGrid(TExDBGrid(Self)));
  dlgExDBQbf.Release;
end;

procedure TExDBGrid.MnuSBFClick(Sender: TObject);
begin
  Application.CreateForm(TdlgExDBQbf, dlgExDBQbf);
  SortByForm(TDBGrid(TExDBGrid(Self)));
  dlgExDBQbf.Release;
end;

procedure TExDBGrid.MnuMemoInplaceEditorMode(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[29].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).MemoInplaceEditor := Memo;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[29].Checked := True;
      FExDBGridPopUpMenu.Items[30].Checked := False;
    end;
end;

procedure TExDBGrid.MnuRichEditEditorMode(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[30].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).MemoInplaceEditor := RichEdit;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[30].Checked := True;
      FExDBGridPopUpMenu.Items[29].Checked := False;
    end;
end;

procedure TExDBGrid.MnuCustomize(Sender: TObject);
begin
  ShowCustomizeDialog;
end;

procedure TExDBGrid.MnuSearchModeClick(Sender: TObject);
begin
  if FExDBGridPopUpMenu.Items[33].Checked = False then
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).SearchMode := True;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[33].Checked := True;
    end
  else
    begin
      DataLink.DataSet.DisableControls;
      TExDBGrid(Self).SearchMode := False;
      DataLink.DataSet.EnableControls;
      FExDBGridPopUpMenu.Items[33].Checked := False;
    end;
end;

procedure TExDBGrid.MnuSaveLayout(Sender: TObject);
begin
  Self.SaveToRegistry;
end;

procedure TExDBGrid.MnuLoadLayout(Sender: TObject);
begin
  Self.LoadFromRegistry;
end;

procedure TExDBGrid.FExDBGridPopUpMenuPopup(Sender: TObject);
var
  k: Integer;
begin
  FExDBGridPopUpMenu.Items[0].Checked := TExDBGrid(Self).GridAutoSize;
  if TExDBGrid(Self).GridAutoWidth <> awNone then
    FExDBGridPopUpMenu.Items[1].Checked := True
  else
    FExDBGridPopUpMenu.Items[1].Checked := False;
  FExDBGridPopUpMenu.Items[3].Checked := TExDBGrid(Self).DisplayBoolean;
  FExDBGridPopUpMenu.Items[4].Checked := TExDBGrid(Self).DisplayImages;
  FExDBGridPopUpMenu.Items[5].Checked := TExDBGrid(Self).DisplayMemo;
  FExDBGridPopUpMenu.Items[6].Checked := TExDBGrid(Self).DisplayDateTime;
  FExDBGridPopUpMenu.Items[8].Checked := TExDBGrid(Self).ShowTextEllipsis;
  FExDBGridPopUpMenu.Items[9].Checked := TExDBGrid(Self).ShowTitleEllipsis;
  FExDBGridPopUpMenu.Items[10].Checked := TExDBGrid(Self).FullSizeMemo;
  FExDBGridPopUpMenu.Items[12].Checked := TExDBGrid(Self).RowSizingAllowed;
  FExDBGridPopUpMenu.Items[13].Checked := TExDBGrid(Self).CellHints;
  FExDBGridPopUpMenu.Items[14].Checked := TExDBGrid(Self).MultiLineTitles;
  FExDBGridPopUpMenu.Items[15].Checked := TExDBGrid(Self).UseRowColors;
  for k := 0 to FExDBGridPopUpMenu.Items[16].Count - 1 do
    begin
      if FExDBGridPopUpMenu.Items[16].Items[k].Tag - 1 = TExDBGrid(Self).LockedCols then
        FExDBGridPopUpMenu.Items[16].Items[k].Checked := True;
    end;
  FExDBGridPopUpMenu.Items[33].Checked := TExDBGrid(Self).SearchMode;
  if TExDBGrid(Self).MemoInplaceEditor = Memo then
    begin
      FExDBGridPopUpMenu.Items[29].Checked := True;
      FExDBGridPopUpMenu.Items[30].Checked := False;
    end
  else
    begin
      FExDBGridPopUpMenu.Items[30].Checked := True;
      FExDBGridPopUpMenu.Items[29].Checked := False;
    end;
end;

procedure TExDBGrid.SetTitleCheck(Value: Boolean);
begin
  if FTitleCheck <> Value then
    begin
      FTitleCheck := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetBackgroundPicture(Value: TBitmap);
begin
  FBackGroundPicture.Assign(Value);

  if (csDesigning in ComponentState) then
    begin
      Refresh;
    end;
end;

procedure TExDBGrid.PictureChanged(Sender: TObject);
begin
  if Assigned(BKBmp) then
    begin
      BkBmp.Free;
      BkBmp := nil;
    end;
end;

procedure TExDBGrid.SetUseBackgroundPicture(Value: Boolean);
begin
  if FUseBackgroundPicture <> Value then
    begin
      FUseBackgroundPicture := Value;

      if FUseBackgroundPicture = True then
        begin
          FUseRowColors := False;
        end;

      Invalidate;
    end;

  if (csDesigning in ComponentState) then
    begin
      Refresh;
    end;
end;

procedure TExDBGrid.DrawBackground;
begin
  if FUseBackgroundPicture = True then
    begin
      if BkBmp = nil then
        begin
          BkBmp := TBitmap.Create;
          BkBmp.Assign(FBackgroundPicture);
        end;
    end
  else
    begin
      if Assigned(BKBmp) then
        begin
          BkBmp.Free;
          BkBmp := nil;
        end;
    end;
end;

procedure TExDBGrid.SetAllowAutoAppend(Value: Boolean);
begin
  if FAllowAutoAppend <> Value then
    begin
      FAllowAutoAppend := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetDrawFocusRect(Value: Boolean);
begin
  if FDrawFocusRect <> Value then
    begin
      FDrawFocusRect := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetHighlightColor(Value: TColor);
begin
  if FHighlightColor <> Value then
    begin
      FHighlightColor := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetImageHighlightColor(Value: TColor);
begin
  if FImageHighlightColor <> Value then
    begin
      FImageHighlightColor := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetHighlightFontColor(Value: TColor);
begin
  if FHighlightFontColor <> Value then
    begin
      FHighlightFontColor := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetHotTrackColor(Value: TColor);
begin
  if FHotTrackColor <> Value then
    begin
      FHotTrackColor := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetLockedCols(Value: Integer);
begin
  if FLockedCols <> Value then
    begin
      FLockedCols := Value;
      LockedChanged;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetLockedColor(Value: TColor);
begin
  if FLockedColor <> Value then
    begin
      FLockedColor := Value;
      LockedChanged;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetLockedFont(Value: TFont);
begin
  if FLockedFont <> Value then
    begin
      FLockedFont.Assign(Value);
      LockedChanged;
      Invalidate;
    end;
end;

procedure TExDBGrid.LockedChanged;
var
  i: Integer;
begin
  if (DataLink <> nil) and (DataLink.Active) then
    with TExDBGrid(Self) do
      begin
        for i := 0 to Columns.Count - 1 do
          with Columns[i] do
            begin
              if not FCells3D then
                begin
                  try
                    //Font := Columns[i].Font;
                    //Color := Columns[i].Color;
                    Font := TExDBGrid(Self).Font;
                    Color := TExDBGrid(Self).Color;
                  except
                    Font := TExDBGrid(Self).Font;
                    Color := TExDBGrid(Self).Color;
                  end;
                end
              else
                begin
                  Font := TExDBGrid(Self).Font;
                  Color := TExDBGrid(Self).FixedColor;
                end;
            end;

        if FLockedCols = 0 then
          begin
            //FixedCols := FLockedCols + IndicatorOffset;
            if (dgIndicator in Options) then
              FixedCols := FLockedCols + IndicatorOffset
            else
              FixedCols := FLockedCols;
            for i := 0 to FLockedCols - 1 do
              with Columns[i] do
                begin
                  if not FCells3D then
                    begin
                      try
                        //Font := Columns[i].Font;
                        //Color := Columns[i].Color;
                        Font := TExDBGrid(Self).Font;
                        Color := TExDBGrid(Self).Color;
                      except
                        Font := TExDBGrid(Self).Font;
                        Color := TExDBGrid(Self).Color;
                      end;
                    end
                  else
                    begin
                      Font := TExDBGrid(Self).Font;
                      Color := TExDBGrid(Self).FixedColor;
                    end;
                end;
          end
        else
          if FLockedCols < (ColCount - 1) - IndicatorOffset then
            begin
              //FixedCols := FLockedCols + IndicatorOffset;
              if (dgIndicator in Options) then
                FixedCols := FLockedCols + IndicatorOffset
              else
                FixedCols := FLockedCols;
              for i := 0 to FLockedCols - 1 do
                with Columns[i] do
                  begin
                    Font := LockedFont;
                    Color := LockedColor;
                  end;
            end;
      end;
end;

procedure TExDBGrid.SetFlatCheckBox(Value: Boolean);
begin
  if FFlatCheckBox <> Value then
    begin
      FFlatCheckBox := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetFlatCheckBoxType(Value: TFlatCheckBoxType);
begin
  if FFlatCheckBoxType <> Value then
    begin
      FFlatCheckBoxType := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetMemoViewType(Value: TMemoViewType);
begin
  if FMemoViewType <> Value then
    begin
      FMemoViewType := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetShowTextEllipsis(Value: Boolean);
begin
  if FShowTextEllipsis <> Value then
    begin
      FShowTextEllipsis := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetShowTitleEllipsis(Value: Boolean);
begin
  if FShowTitleEllipsis <> Value then
    begin
      FShowTitleEllipsis := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetLinesPerRow(Value: Integer);
begin
  if FLinesPerRow <> Value then
    begin
      FLinesPerRow := Value;
      LayoutChanged;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetSearchMode(Value: Boolean);
begin
  if FSearchMode <> Value then
    begin
      FSearchMode := Value;

      if FSearchMode = False then
        if Assigned(FSearchEdit) then
          if FSearchEdit.Visible then
            FSearchEdit.Visible := False;

      LayoutChanged;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetExMenuOptions(Value: TExMenuOptions);
begin
  if FExMenuOptions <> Value then
    begin
      FExMenuOptions := Value;

      if Assigned(FExDBGridPopUpMenu) then
        begin
          FExDBGridPopUpMenu.Items[0].Visible := exAutoSize in Value;
          FExDBGridPopUpMenu.Items[1].Visible := exAutoWidth in Value;
          FExDBGridPopUpMenu.Items[2].Visible := not (exAutoSize in Value) and not (exAutoWidth in Value);
          FExDBGridPopUpMenu.Items[3].Visible := exDisplayBoolean in Value;
          FExDBGridPopUpMenu.Items[4].Visible := exDisplayImages in Value;
          FExDBGridPopUpMenu.Items[5].Visible := exDisplayMemo in Value;
          FExDBGridPopUpMenu.Items[6].Visible := exDisplayDateTime in Value;
          FExDBGridPopUpMenu.Items[7].Visible := not (exDisplayBoolean in Value) and not (exDisplayImages in Value) and not (exDisplayMemo in Value) and not (exDisplayDateTime in Value);
          FExDBGridPopUpMenu.Items[8].Visible := exShowTextEllipsis in Value;
          FExDBGridPopUpMenu.Items[9].Visible := exShowTitleEllipsis in Value;
          FExDBGridPopUpMenu.Items[10].Visible := exFullSizeMemo in Value;
          FExDBGridPopUpMenu.Items[11].Visible := not (exShowTextEllipsis in Value) and not (exShowTitleEllipsis in Value) and not (exFullSizeMemo in Value);
          FExDBGridPopUpMenu.Items[12].Visible := exAllowRowSizing in Value;
          FExDBGridPopUpMenu.Items[13].Visible := exCellHints in Value;
          FExDBGridPopUpMenu.Items[14].Visible := exMultiLineTitles in Value;
          FExDBGridPopUpMenu.Items[15].Visible := exUseRowColors in Value;
          FExDBGridPopUpMenu.Items[16].Visible := exFixedColumns in Value;
          FExDBGridPopUpMenu.Items[17].Visible := not (exAllowRowSizing in Value) and not (exCellHints in Value) and not (exMultiLineTitles in Value) and not (exUseRowColors in Value);
          FExDBGridPopUpMenu.Items[18].Visible := exPrintGrid in Value;
          FExDBGridPopUpMenu.Items[19].Visible := exPrintDataSet in Value;
          FExDBGridPopUpMenu.Items[20].Visible := not (exPrintGrid in Value) and not (exPrintDataSet in Value);
          FExDBGridPopUpMenu.Items[21].Visible := exExportGrid in Value;
          FExDBGridPopUpMenu.Items[22].Visible := not (exExportGrid in Value);
          FExDBGridPopUpMenu.Items[23].Visible := exSelectAll in Value;
          FExDBGridPopUpMenu.Items[24].Visible := exUnSelectAll in Value;
          FExDBGridPopUpMenu.Items[25].Visible := not (exSelectAll in Value) and not (exUnSelectAll in Value);
          FExDBGridPopUpMenu.Items[26].Visible := exQueryByForm in Value;
          FExDBGridPopUpMenu.Items[27].Visible := exSortByForm in Value;
          FExDBGridPopUpMenu.Items[28].Visible := not (exQueryByForm in Value) and not (exSortByForm in Value);
          FExDBGridPopUpMenu.Items[29].Visible := exMemoInplaceEditors in Value;
          FExDBGridPopUpMenu.Items[30].Visible := exMemoInplaceEditors in Value;
          FExDBGridPopUpMenu.Items[31].Visible := exMemoInplaceEditors in Value;
          FExDBGridPopUpMenu.Items[32].Visible := exCustomize in Value;
          FExDBGridPopUpMenu.Items[33].Visible := exSearchMode in Value;
          FExDBGridPopUpMenu.Items[34].Visible := exSaveLayout in Value;
          FExDBGridPopUpMenu.Items[35].Visible := exSaveLayout in Value;
          FExDBGridPopUpMenu.Items[36].Visible := exLoadLayout in Value;
        end;

      Invalidate;
    end;
end;

procedure TExDBGrid.SetScrollHints(Value: Boolean);
begin
  if FScrollHints <> Value then
    begin
      FScrollHints := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.WMPaint(var Message: TWMPaint);
var
  WinDC, MemDC: HDC;
  Bitmap, OldBitmap: HBITMAP;
  PS: TPaintStruct;
  BegunPaint: Boolean;
begin
  if FUseBitmapDrawing then
    begin
      BegunPaint := False;
      WinDC := Message.DC;

      if WinDC = 0 then
        begin
          WinDC := BeginPaint(Handle, PS);
          BegunPaint := True;
        end;

      MemDC := CreateCompatibleDC(Canvas.Handle);
      Bitmap := CreateCompatibleBitmap(Canvas.Handle, Width, Height);
      OldBitmap := SelectObject(MemDC, Bitmap);

      try
        Message.DC := MemDC;
        inherited;

        with Canvas.ClipRect do
          BitBlt(WinDC, Left, Top, Right - Left, Bottom - Top, MemDC, Left, Top, SRCCOPY);
      finally
        SelectObject(MemDC, OldBitmap);
        DeleteObject(Bitmap);
        DeleteDC(MemDC);
        if BegunPaint then
          EndPaint(Handle, PS);
      end;
    end
  else
    begin
      inherited;
    end;
end;

procedure TExDBGrid.SetUseBitmapDrawing(Value: Boolean);
begin
  if FUseBitmapDrawing <> Value then
    begin
      FUseBitmapDrawing := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetMemoInplaceEditor(Value: TMemoInplaceEditor);
begin
  if FMemoInplaceEditor <> Value then
    begin
      FMemoInplaceEditor := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetDisplayPopupEditors(Value: Boolean);
begin
  if FDisplayPopupEditors <> Value then
    begin
      FDisplayPopupEditors := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetShowTitlesWhenInactive(Value: Boolean);
begin
  if FShowTitlesWhenInactive <> Value then
    begin
      FShowTitlesWhenInactive := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetBoldTitlesWhenCells3D(Value: Boolean);
begin
  if FBoldTitlesWhenCells3D <> Value then
    begin
      FBoldTitlesWhenCells3D := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetBoldIndicatorsWhenCells3D(Value: Boolean);
begin
  if FBoldIndicatorsWhenCells3D <> Value then
    begin
      FBoldIndicatorsWhenCells3D := Value;
      Invalidate;
    end;
end;

{procedure TExDBGrid.SetExtendedScroll(Value: Boolean);
begin
   if FExtendedScroll <> Value then
      begin
         FExtendedScroll := Value;
         Invalidate;
      end;
end;}

function TExDBGrid.InternalIsBooleanField(const Field: TField): boolean;
begin
  if assigned(FIsBooleanField) then
    result := FisBooleanField(Field)
  else
    result := Field is tbooleanfield;
end;

procedure TExDBGrid.SetEnableCellRangeSelect(Value: Boolean);
begin
  if FEnableCellRangeSelect <> Value then
    begin
      FEnableCellRangeSelect := Value;
      Invalidate;
    end;
end;

procedure TExDBGrid.SetEndCell(const Value: TGridCoord);
begin
  if not ExCellsEqual(EndCell, Value) then
    begin
      FRangeSelection.BottomRight := Value;
      FEndBookmark := TMyBookmarks(SelectedRows).CurrentRow;
      DoEndCellChanged;
    end;
end;

procedure TExDBGrid.SetStartCell(const Value: TGridCoord);
begin
  if not ExCellsEqual(StartCell, Value) then
    begin
      FRangeSelection.TopLeft := Value;
      FStartBookmark := TMyBookmarks(SelectedRows).CurrentRow;
      DoStartCellChanged;
    end;
end;

procedure TExDBGrid.UpdateScrollBar;
var
  SIOld, SINew: TScrollInfo;
begin
  {$IFNDEF JEDI}
  if RowCount + 1 >= Trunc((Height / DefaultRowHeight) - 1) then //added
    begin //added
      if DataLink.Active and HandleAllocated then
        with DataLink.DataSet do
          begin
            SIOld.cbSize := sizeof(SIOld);
            SIOld.fMask := SIF_ALL;
            GetScrollInfo(Self.Handle, SB_VERT, SIOld);
            SINew := SIOld;
            if IsSequenced then
              begin
                SINew.nMin := 1;
                SINew.nPage := Self.VisibleRowCount;
                SINew.nMax := Integer(DWORD(RecordCount) + SINew.nPage - 1);
                if State in [dsInactive, dsBrowse, dsEdit] then
                  SINew.nPos := RecNo; // else keep old pos
              end
            else
              begin
                SINew.nMin := 0;
                SINew.nPage := 0;
                SINew.nMax := 4;
                if DataLink.BOF then
                  SINew.nPos := 0
                else
                  if DataLink.EOF then
                    SINew.nPos := 4
                  else
                    SINew.nPos := 2;
              end;
            if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
              (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) then
              SetScrollInfo(Self.Handle, SB_VERT, SINew, True);
          end;
    end //added
  else //added
    SetScrollRange(Self.Handle, SB_VERT, 0, 0, True); //added
  {$ENDIF}
end;

{ END PRIVATE }

{ BEGIN PROTECTED }

function TExDBGrid.CreateEditor: TInplaceEdit;
begin
  Result := inherited CreateEditor;

  TInplaceEditCracker(Result).Color := FEditColor;
  FInplaceEdit := Result;
end;

function TExDBGrid.GetDefaultRowHeight: Integer;
begin
  Result := inherited DefaultRowHeight;
end;

function TExDBGrid.GetOptWidth: Integer;
var
  Loop: Integer;
begin
  Result := GetSystemMetrics(sm_CXVScroll);

  if BorderStyle = bsSingle then
    Inc(Result, 2 * GetSystemMetrics(sm_CXBorder));

  for Loop := 0 to Pred(ColCount) do
    Inc(Result, Succ(ColWidths[Loop]));

  if Parent is TForm then
    begin
      if Result > TForm(Parent).ClientWidth then
        Result := TForm(Parent).ClientWidth;
    end
  else
    if Result > Parent.Width then
      Result := Parent.Width;
end;

function TExDBGrid.CreateColumns: TDBGridColumns;
begin
  Result := TDBGridColumns.Create(Self, TColumn);
end;

{$IFDEF EX_COMPILER_4_UP}

function TExDBGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if Assigned(OnMouseWheelDown) then
    OnMouseWheelDown(Self, Shift, MousePos, Result);
  if not Result then
    begin
      if not AcquireFocus then
        Exit;
      if DataLink.Active then
        begin
          Result := DataLink.DataSet.MoveBy(1) <> 0;
        end;
    end;
end;

function TExDBGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := False;
  if Assigned(OnMouseWheelUp) then
    OnMouseWheelUp(Self, Shift, MousePos, Result);
  if not Result then
    begin
      if not AcquireFocus then
        Exit;
      if DataLink.Active then
        begin
          Result := DataLink.DataSet.MoveBy(-1) <> 0;
        end;
    end;
end;
{$ENDIF}

procedure TExDBGrid.PlaceControl(Control: TWinControl; ACol, ARow: Integer);
var
  R: TRect;
  frmParent: TCustomForm;
  OldOptions: TDBGridOptions;
begin
  if not DataLink.Edit then
    Exit;

  if (Control <> FCurrentControl) then
    begin
      HideCurrentControl;
      FCurrentControl := Control;
      FOldControlWndProc := FCurrentControl.WindowProc;
      FCurrentControl.WindowProc := ControlWndProc;
    end;

  if Control.Parent <> Self.Parent then
    Control.Parent := Self.Parent;
  R := CellRect(ACol, ARow);
  R.TopLeft := ClientToScreen(R.TopLeft);
  R.TopLeft := TControl(Control.Parent).ScreenToClient(R.TopLeft);
  R.BottomRight := ClientToScreen(R.BottomRight);
  R.BottomRight := TControl(Control.Parent).ScreenToClient(R.BottomRight);
  Control.BringToFront;
  Control.Show;
  Control.BoundsRect := R;

  frmParent := GetParentForm(Self);
  if (dgCancelOnExit in Options) then
    begin
      OldOptions := Options;
      Options := Options - [dgCancelOnExit];
      if (Self.Visible) and (Control.Visible) and (Self.Parent.Visible) and
        (frmParent.Visible) then
        Control.SetFocus;
      Options := Options + [dgCancelOnExit];
      Options := OldOptions;
    end
  else
    if (Self.Visible) and (Control.Visible) and (Self.Parent.Visible) and
      (frmParent.Visible) then
      Control.SetFocus;
end;

procedure TExDBGrid.DoHint(X, Y: Integer);
const
  TextOffset = 2;
var
  Col, Row, LogCol, LogRow: Longint;
  R, OldR: TRect;
  Pt: TPoint;
  GPt: TGridCoord;
  OldActive: Integer;
  Text: string;
begin
  GPt := MouseCoord(X, Y);
  Col := GPt.X;
  Row := GPt.Y;
  LogCol := Col;
  LogRow := Row;

  if dgTitles in Options then
    Dec(LogRow);

  if dgIndicator in Options then
    Dec(LogCol);

  Text := '';

  if (DataLink.Active) and (LogCol >= 0) and (LogRow >= 0) then
    begin
      OldActive := DataLink.ActiveRecord;
      try
        DataLink.ActiveRecord := LogRow;

        if not (Columns[LogCol].Field is TBooleanField) then
          if not (Columns[LogCol].Field is TGraphicField) then
            begin
              try
                Text := Columns[LogCol].Field.AsString;
              except
                Text := Columns[LogCol].Field.DisplayText;
              end;
            end;
      finally
        DataLink.ActiveRecord := OldActive
      end;

      //Canvas.Font := Font;
      Canvas.Font.Assign(Columns[LogCol].Font);

      if (Text <> '') and not EditorMode and (Canvas.TextWidth(Text) + TextOffset > ColWidths[LogCol]) and
        not (csDesigning in ComponentState) then
        begin
          try
            FHintWnd.Color := Application.HintColor;
            Hint := Text + '|' + GetLongHint(Hint);
            Text := '';

            R := FHintWnd.CalcHintRect(Screen.Width div 2, Hint, FHintWnd);
            //R := FHintWnd.CalcHintRect(Columns[LogCol].Width, Hint, FHintWnd);

            Pt := ClientToScreen(CellRect(Col, Row).TopLeft);
            Dec(Pt.X);
            Dec(Pt.Y);
            OffsetRect(R, Pt.X, Pt.Y);

            if R.Right > Screen.Width then
              OffsetRect(R, Screen.Width - R.Right, 0);
            if R.Bottom > Screen.Height then
              OffsetRect(R, Screen.Height - R.Bottom, 0);

            GetWindowRect(FHintWnd.Handle, OldR);

            if not IsWindowVisible(FHintWnd.Handle) or not ((R.Left = OldR.Left) and (R.Top = OldR.Top)) then
              FHintWnd.ActivateHint(R, GetShortHint(Hint));
          except
          end;
        end
      else
        if Assigned(FHintWnd) then
          FHintWnd.ReleaseHandle;
    end
  else
    if Assigned(FHintWnd) then
      FHintWnd.ReleaseHandle;
end;

procedure TExDBGrid.SetDefaultRowHeight(Value: Integer);
begin
  if (Value <> FNewDefRowHeight) or (Value <> inherited DefaultRowHeight) then
    begin
      LockHeight;
      try
        if Value = 0 then
          FNewDefRowHeight := inherited DefaultRowHeight
        else
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

procedure TExDBGrid.LayoutChanged;
begin
  inherited;

  if FLockedHeight = 0 then
    begin
      FTitleRowHeight := 0;
      SetDefaultRowHeight(FNewDefRowHeight);
    end;

  SendSizeMessage;

  if FMultiLineTitles then
    begin
      UpdateTitlesHeight;
    end;

  if MultiLineRows then
    begin
      SetDefaultRowHeight(FRowHeight * LinesPerRow);
    end;
end;

procedure TExDBGrid.RowHeightsChanged;
var
  RowNo: Integer;
begin
  if DataSource <> nil then
    if DataSource.DataSet <> nil then
      if DataSource.Dataset.Active then
        begin
          for RowNo := 1 to VisibleRowCount + 1 do
            if RowHeights[RowNo] <> DefaultRowHeight then
              begin
                DefaultRowHeight := RowHeights[RowNo];
                Break;
              end;

          SendSizeMessage;

          if not (dgAlwaysShowEditor in TExDBGrid(Self).Options) then
            begin
              inherited;
            end;
        end;
end;

procedure TExDBGrid.CellClick(Column: TColumn);
var
  OldRect, NewRect: TRect;
begin
  if not FEnableCellRangeSelect then
    if not (csDesigning in ComponentState) then
      begin
        if not ReadOnly and DataLink.Active and not DataLink.Readonly then
          begin
            BeginUpdate;

            if Assigned(FSearchEdit) then
              FSearchEdit.Visible := False;

            if (not (dgRowSelect in Options)) and (dgEditing in Options) then
              begin
                if (FDisplayBool) then
                  begin
                    //if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and (Column.Field.DataType = ftBoolean) and (CanEditModify = True) then
                    if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and InternalIsBooleanField(Column.Field) and (CanEditModify = True) then
                      begin
                        {try
                            Column.Field.AsBoolean := not Column.Field.AsBoolean;
                        except
                            Column.Field.Value := NULL;
                        end;}
                        try
                          if not assigned(FIsBooleanField) then
                            begin
                              Column.Field.AsBoolean := not Column.Field.AsBoolean;
                            end
                          else
                            begin
                              if Column.Field.AsInteger = FValueUnchecked then
                                Column.Field.AsInteger := FValueChecked
                              else
                                Column.Field.AsInteger := FValueUnChecked
                            end;
                        except
                          Column.Field.Value := NULL;
                        end;
                      end;
                  end;

                if not (dgAlwaysShowEditor in TExDBGrid(Self).Options) then
                  begin
                    if not FDisplayPopupEditors then
                      if (FDisplayMemo) then
                        begin
                          if not (FFullSizeMemo) then
                            if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and ((Column.Field is TMemoField) or (Column.Field.DataType = ftFmtMemo) or (Column.Field.DataType = ftBytes)) then
                              begin
                                CellClickCountM := CellClickCountM + 1;

                                if CellClickCountM <= 1 then
                                  begin
                                    OldRectValT := 0;
                                    OldRectValL := 0;
                                    if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                                      OldRect := CellRect(Col, Row)
                                    else
                                      OldRect := CellRect(Col, (Row + 1));
                                    OldRectValT := OldRect.Top;
                                    OldRectValL := OldRect.Left;
                                  end;

                                if CellClickCountM > 1 then
                                  begin
                                    NewRectValT := 0;
                                    NewRectValL := 0;
                                    if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                                      NewRect := CellRect(Col, Row)
                                    else
                                      NewRect := CellRect(Col, (Row + 1));
                                    NewRectValT := NewRect.Top;
                                    NewRectValL := NewRect.Left;

                                    if (OldRectValT = NewRectValT) and (OldRectValL = NewRectValL) then
                                      begin
                                        if MemoInplaceEditor = Memo then
                                          begin
                                            with DBMemo do
                                              begin
                                                Application.ProcessMessages;
                                                DataSource := TExDBGrid(Self).DataSource;
                                                DataField := Columns[SelectedIndex].FieldName;
                                                Visible := True;
                                                SetFocus;
                                                Application.ProcessMessages;
                                                DBMemo.SelStart := 0;
                                                DBMemo.SelLength := DBMemo.GetTextLen;
                                              end;
                                          end
                                        else
                                          begin
                                            with DBRichEdit do
                                              begin
                                                Application.ProcessMessages;
                                                DataSource := TExDBGrid(Self).DataSource;
                                                DataField := Columns[SelectedIndex].FieldName;
                                                Visible := True;
                                                SetFocus;
                                                Application.ProcessMessages;
                                                DBRichEdit.SelStart := 0;
                                                DBRichEdit.SelLength := DBRichEdit.GetTextLen;
                                              end;
                                          end;
                                      end;
                                    CellClickCountM := 0;
                                    CellClickCountD := 0;
                                  end;
                              end;
                        end;

                    if (FDisplayDateTime) then
                      begin
                        if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and (Column.Field is TDateTimeField) then
                          begin
                            CellClickCountD := CellClickCountD + 1;

                            if CellClickCountD <= 1 then
                              begin
                                OldRectValT := 0;
                                OldRectValL := 0;
                                if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                                  OldRect := CellRect(Col, Row)
                                else
                                  OldRect := CellRect(Col, (Row + 1));
                                OldRectValT := OldRect.Top;
                                OldRectValL := OldRect.Left;
                              end;

                            if CellClickCountD > 1 then
                              begin
                                NewRectValT := 0;
                                NewRectValL := 0;
                                if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                                  NewRect := CellRect(Col, Row)
                                else
                                  NewRect := CellRect(Col, (Row + 1));
                                NewRectValT := NewRect.Top;
                                NewRectValL := NewRect.Left;

                                if (OldRectValT = NewRectValT) and (OldRectValL = NewRectValL) then
                                  begin
                                    with DateTimePicker do
                                      begin
                                        Application.ProcessMessages;
                                        Visible := True;
                                        try
                                          SetFocus;
                                        except
                                        end;
                                        Application.ProcessMessages;
                                        CellClickCountD := 0;
                                        CellClickCountM := 0;
                                      end;
                                  end;
                                CellClickCountD := 0;
                                CellClickCountM := 0;
                              end;
                          end;
                      end;

                    if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) then
                      if (not (Column.Field is TMemoField)) and
                        (Column.Field.DataType <> ftFmtMemo) and
                        (Column.Field.DataType <> ftBytes) and
                        //(Column.Field.DataType <> ftBoolean) and
                      (not InternalIsBooleanField(Column.Field)) and
                        (not (Column.Field is TDateTimeField)) then
                        begin
                          CellClickCountM := 0;
                          CellClickCountD := 0;
                        end;
                  end
                else
                  begin
                    if not FDisplayPopupEditors then
                      if (FDisplayMemo) then
                        begin
                          if not (FFullSizeMemo) then
                            if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and ((Column.Field is TMemoField) or (Column.Field.DataType = ftFmtMemo) or (Column.Field.DataType = ftBytes)) then
                              begin
                                if MemoInplaceEditor = Memo then
                                  begin
                                    with DBMemo do
                                      begin
                                        Application.ProcessMessages;
                                        DataSource := TExDBGrid(Self).DataSource;
                                        DataField := Columns[SelectedIndex].FieldName;
                                        Visible := True;
                                        SetFocus;
                                        Application.ProcessMessages;
                                        DBMemo.SelStart := 0;
                                        DBMemo.SelLength := DBMemo.GetTextLen;
                                      end;
                                  end
                                else
                                  begin
                                    with DBRichEdit do
                                      begin
                                        Application.ProcessMessages;
                                        DataSource := TExDBGrid(Self).DataSource;
                                        DataField := Columns[SelectedIndex].FieldName;
                                        Visible := True;
                                        SetFocus;
                                        Application.ProcessMessages;
                                        DBRichEdit.SelStart := 0;
                                        DBRichEdit.SelLength := DBRichEdit.GetTextLen;
                                      end;
                                  end;
                              end;
                        end;

                    if (FDisplayDateTime) then
                      begin
                        if (DataLink <> nil) and (DataLink.Active) and Assigned(Column.Field) and (Column.Field is TDateTimeField) then
                          begin
                            with DateTimePicker do
                              begin
                                Application.ProcessMessages;
                                Visible := True;
                                try
                                  SetFocus;
                                except
                                end;
                                Application.ProcessMessages;
                              end;
                          end;
                      end;
                  end;
              end;

            inherited CellClick(Column);

            EndUpdate;
          end;
      end;
end;

procedure TExDBGrid.DblClick;
begin
  if not FEnableCellRangeSelect then
    if not (csDesigning in ComponentState) then
      begin
        if FCellHints = True then
          if Assigned(FHintWnd) then
            begin
              FHintWnd.ReleaseHandle;
            end;

        if FDisplayPopupEditors then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.Readonly then
              begin
                BeginUpdate;

                if (not (dgRowSelect in Options)) and (dgEditing in Options) then
                  begin
                    if (DataLink <> nil) and (DataLink.Active) and Assigned(SelectedField) and (not (SelectedField is TMemoField) and (SelectedField is TBlobField)) then
                      begin
                        ExDBGridCtlsForm := TExDBGridCtlsForm.Create(Self);
                        try
                          ExDBGridCtlsForm.BlobCaption := Format('Field: %s', [SelectedField.DisplayLabel]);
                          ExDBGridCtlsForm.BlobField := SelectedField;
                          ExDBGridCtlsForm.DataSource := DataLink.DataSource;
                          ExDBGridCtlsForm.ShowModal;
                        finally
                          ExDBGridCtlsForm.Free;
                        end;
                      end;

                    if (DataLink <> nil) and DataLink.Active and Assigned(SelectedField) and (SelectedField is TMemoField) then
                      begin
                        ExDBGridCtlsForm := TExDBGridCtlsForm.Create(self);
                        try
                          ExDBGridCtlsForm.BlobCaption := Format('Field: %s', [SelectedField.DisplayLabel]);
                          ExDBGridCtlsForm.BlobField := SelectedField;
                          ExDBGridCtlsForm.DataSource := DataLink.DataSource;
                          ExDBGridCtlsForm.ShowModal;
                        finally
                          ExDBGridCtlsForm.Free;
                        end;
                      end;
                  end;

                EndUpdate;
              end;
          end;

        inherited DblClick;
      end;
end;

procedure TExDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  style: UINT;
  TmpRect: TRect;
  FactorX, FactorY: Double;
  TmpWidth, TmpHeight: Integer;
  CWidth, CHeight: Integer;
  BWidth, BHeight: Integer;
  vAlignment: TAlignment;
  w, h: Integer;
  {$IFDEF JPEGGRAPHICS}
  Photo: TJPEGImage;
  {$ENDIF}
  {$IFDEF OLEGRAPHICS}
  Photo1: TBitmap;
  {$ENDIF}
  Image1: TImage;
  FField: TBlobField;
  {$IFDEF JPEGGRAPHICS}
  {$IFDEF BDE}
  MS: TBlobStream;
  {$ENDIF}
  {$IFDEF ADO}
  MSA: TADOBlobStream;
  {$ENDIF}
  {$IFDEF CDS}
  MSC: TClientBlobStream;
  {$ENDIF}
  {$ENDIF}
  {$IFDEF OLEGRAPHICS}
  MS1: TMemoryStream;
  {$ENDIF}
  TempInfo: Boolean;
  Region, OldClipRegion: HRgn;
  ClipRegionExists: Boolean;
  P: TPoint;
begin
  Image1 := nil;

  {$IFDEF JPEGGRAPHICS}
  {$IFDEF BDE}
  MS := nil;
  {$ENDIF}
  {$IFDEF ADO}
  MSA := nil;
  {$ENDIF}
  {$IFDEF CDS}
  MSC := nil;
  {$ENDIF}
  Photo := nil;
  {$ENDIF}

  {$IFDEF OLEGRAPHICS}
  MS1 := nil;
  Photo1 := nil;
  {$ENDIF}

  if Column.FieldName <> '' then
    begin
      BeginUpdate;

      with Canvas do
        begin
          Lock;

          TmpRect := Rect;

          FillRect(Rect);

          if FUseRowColors = True then
            begin
              if (not (gdSelected in State)) and (not (gdFixed in State)) then
                begin
                  Canvas.Brush.Style := bsSolid;
                  if ((Rect.Top div (Rect.Bottom - Rect.Top + 1)) mod 2) = 0 then
                    Canvas.Brush.Color := FRowColor2
                  else
                    Canvas.Brush.Color := FRowColor1;

                  FillRect(Rect);
                end;
            end
          else
            begin
              if FUseBackgroundPicture = True then
                if (not (gdSelected in State)) and (not (gdFixed in State)) then
                  if Assigned(BKBmp) then
                    begin
                      begin
                        w := Rect.Right - Rect.Left;
                        h := Rect.Bottom - Rect.Top;
                        BitBlt(TExDBGrid(Self).Canvas.Handle, Rect.Left, Rect.Top, w, h,
                          BkBmp.Canvas.Handle, Rect.Left, Rect.Top, SRCCOPY);
                        Brush.Style := bsClear;
                      end;
                    end;
            end;

          if (gdFocused in State) and (not (gdFixed in State)) then
            begin
              Brush.Color := FHighlightColor;
              Font.Color := FHighlightFontColor;

              FillRect(Rect);
            end;

          if (gdSelected in State) and (not (gdFixed in State)) then
            begin
              Brush.Color := FHighlightColor;
              Font.Color := FHighlightFontColor;

              FillRect(Rect);
            end;

          if (not (gdSelected in State)) and (not (gdFixed in State)) then
            begin
              if (not (gdFixed in State)) and (Column <> nil) and (Column.Field <> nil) then
                ApplyCellAttribute(Column.Field, Canvas, State);
            end;

          if not (Column.Field is TMemoField) and (Column.Field.DataType <> ftFmtMemo) and (Column.Field.DataType <> ftBytes) and (Column.Field is TBlobField) then
            begin
              if (FDisplayImages) then
                begin
                  if (gdFocused in State) or (gdSelected in State) then
                    begin
                      Brush.Color := FImageHighlightColor;
                      Font.Color := TExDBGrid(Self).Font.Color;

                      FillRect(Rect);
                    end;

                  try
                    try
                      if Assigned(Column.Field) then
                        begin
                          FField := Column.Field as TBlobField;
                          try
                            try
                              Image1 := TImage.Create(TExDBGrid(Self));
                              with Image1 do
                                begin
                                  AutoSize := True;
                                  Center := True;
                                  Stretch := False;
                                end;

                              Image1.Picture.Assign(FField);
                            except
                              {$IFDEF OLEGRAPHICS}
                              try
                                Photo1 := TBitmap.Create;

                                if Assigned(Image1) then
                                  begin
                                    Image1.Free;
                                    Image1 := nil;
                                  end;

                                MS1 := TMemoryStream.Create;
                                FField.SaveToStream(MS1);
                                MS1.Seek(78, soFromBeginning);

                                Photo1.LoadFromStream(MS1);

                                Image1 := TImage.Create(TExDBGrid(Self));
                                with Image1 do
                                  begin
                                    AutoSize := True;
                                    Center := True;
                                    Stretch := False;
                                  end;

                                Image1.Picture.Graphic := Photo1;
                              finally
                                if Assigned(Photo1) then
                                  Photo.Free;

                                if Assigned(MS1) then
                                  MS1.Free;
                              end;
                              {$ENDIF}
                            end;
                          except
                            {$IFDEF JPEGGRAPHICS}
                            try
                              Photo := TJPEGImage.Create;

                              if Assigned(Image1) then
                                begin
                                  Image1.Free;
                                  Image1 := nil;
                                end;

                              try
                                {$IFDEF BDE}
                                MS := TBlobStream.Create(FField, bmRead);
                                Photo.LoadFromStream(MS);
                                {$ENDIF}
                              except
                                try
                                  {$IFDEF ADO}
                                  MSA := TADOBlobStream.Create(FField, bmRead);
                                  Photo.LoadFromStream(MSA);
                                  {$ENDIF}
                                except
                                  {$IFDEF CDS}
                                  if DataSource.DataSet is TClientDataSet then
                                    begin
                                      MSC := TClientBlobStream.Create(FField, bmRead);
                                      Photo.LoadFromStream(MSC);
                                    end;
                                  {$ENDIF}
                                end;
                              end;

                              Image1 := TImage.Create(TExDBGrid(Self));
                              with Image1 do
                                begin
                                  AutoSize := True;
                                  Center := True;
                                  Stretch := False;
                                end;

                              Image1.Picture.Assign(Photo);
                            finally
                              if Assigned(Photo) then
                                Photo.Free;

                              try
                                {$IFDEF BDE}
                                if Assigned(MS) then
                                  MS.Free;
                                {$ENDIF}
                              except
                                try
                                  {$IFDEF ADO}
                                  if Assigned(MSA) then
                                    MSA.Free;
                                  {$ENDIF}
                                except
                                  {$IFDEF CDS}
                                  if DataSource.DataSet is TClientDataSet then
                                    begin
                                      if Assigned(MSC) then
                                        MSC.Free;
                                    end;
                                  {$ENDIF}
                                end;
                              end;
                            end;
                            {$ENDIF}
                          end;
                        end;

                      CWidth := Rect.Right - Rect.Left + 1 - 1;
                      CHeight := Rect.Bottom - Rect.Top + 1 - 1;

                      BWidth := Image1.Width;
                      BHeight := Image1.Height;

                      try
                        if BWidth = 0 then
                          FactorX := 0
                        else
                          FactorX := CWidth / BWidth;

                        if BHeight = 0 then
                          FactorY := 0
                        else
                          FactorY := CHeight / BHeight;
                      except
                        FactorX := 1;
                        FactorY := 1;
                      end;

                      if FactorY < FactorX then
                        begin
                          TmpWidth := Round(BWidth * FactorY);
                          TmpHeight := CHeight;
                        end
                      else
                        begin
                          TmpHeight := Round(BHeight * FactorX);
                          TmpWidth := CWidth;
                        end;

                      SetRect(TmpRect, 0, 0, TmpWidth, TmpHeight);
                      OffsetRect(TmpRect, Rect.Left + ((CWidth - TmpWidth) div 2), Rect.Top + ((CHeight - TmpHeight) div 2));

                      try
                        {$IFDEF JPEGGRAPHICS}
                        TempInfo := Image1.Picture.Graphic is TJPEGImage;

                        if TempInfo then
                          StretchDraw(TmpRect, TJPEGImage(Image1.Picture.Graphic))
                        else
                          {$ENDIF}
                          StretchDraw(TmpRect, Image1.Picture.Graphic);
                      except
                        if (gdSelected in State) and (not (gdFixed in State)) then
                          begin
                            Brush.Color := FHighlightColor;
                            Font.Color := FHighlightFontColor;

                            FillRect(Rect);
                          end;

                        FillRect(Rect);
                        TmpRect := Rect;
                        Inc(TmpRect.Top, 2);
                        Inc(TmpRect.Left, 2);
                        Inc(TmpRect.Right, -2);

                        if (csDesigning in ComponentState) then
                          begin
                            if FShowTextEllipsis then
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                            else
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                          end
                        else
                          begin
                            if FShowTextEllipsis then
                              DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                            else
                              //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                              DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                          end;
                      end;
                    except
                      if (gdSelected in State) and (not (gdFixed in State)) then
                        begin
                          Brush.Color := FHighlightColor;
                          Font.Color := FHighlightFontColor;

                          FillRect(Rect);
                        end;

                      FillRect(Rect);
                      TmpRect := Rect;
                      Inc(TmpRect.Top, 2);
                      Inc(TmpRect.Left, 2);
                      Inc(TmpRect.Right, -2);

                      if (csDesigning in ComponentState) then
                        begin
                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                          else
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                        end
                      else
                        begin
                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                          else
                            //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                            DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                        end;
                    end;
                  finally
                    if Assigned(Image1) then
                      Image1.Free;
                  end;
                end
              else
                begin
                  FillRect(Rect);
                  TmpRect := Rect;
                  Inc(TmpRect.Top, 2);
                  Inc(TmpRect.Left, 2);
                  Inc(TmpRect.Right, -2);

                  if (csDesigning in ComponentState) then
                    begin
                      if FShowTextEllipsis then
                        DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                      else
                        DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                    end
                  else
                    begin
                      if FShowTextEllipsis then
                        DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                      else
                        //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                        DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                    end;
                end;
            end
          else
            if (Column.Field is TMemoField) or (Column.Field.DataType = ftFmtMemo) or (Column.Field.DataType = ftBytes) then
              begin
                if (FDisplayMemo) then
                  begin
                    try
                      FillRect(Rect);
                      TmpRect := Rect;
                      Inc(TmpRect.Top, 2);
                      Inc(TmpRect.Left, 2);

                      if FShowTextEllipsis then
                        DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                      else
                        //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                        DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);

                      if not (csDesigning in ComponentState) then
                        begin
                          if (gdFocused in State) then
                            begin
                              if MemoInplaceEditor = Memo then
                                begin
                                  if DBMemo = nil then
                                    DBMemo := TDBMemo.Create(TExDBGrid(Self));

                                  with DBMemo do
                                    begin
                                      Visible := False;
                                      AutoDisplay := True;
                                      BorderStyle := bsNone;
                                      ControlStyle := ControlStyle + [csOpaque];
                                      Parent := GetParentForm(Self);
                                      DataSource := nil;
                                      DataField := '';
                                      OnKeyDown := OnKeyDBMemo;
                                      OnExit := OnDBExit;
                                      Top := TmpRect.Top - 2;
                                      Left := TmpRect.Left - 2;
                                      Height := (TmpRect.Bottom - TmpRect.Top + 2);
                                      Width := (TmpRect.Right - TmpRect.Left + 2);
                                      P := Self.ClientToScreen(Point(Left, Top));
                                      P := Parent.ScreenToClient(P);
                                      Top := P.y;
                                      Left := P.x;
                                      ParentFont := True;
                                      ParentColor := False;
                                      Color := TExDBGrid(Self).EditColor;
                                      ReadOnly := False;
                                      if FMemoViewType = WordWrapOn then
                                        begin
                                          ScrollBars := ssNone;
                                          WordWrap := True;
                                        end
                                      else
                                        if FMemoViewType = ScrollBarsOn then
                                          begin
                                            WordWrap := False;
                                            ScrollBars := ssBoth;
                                          end;
                                      if not Self.Focused then
                                        Self.SetFocus;
                                    end;
                                end
                              else
                                begin
                                  if DBRichEdit = nil then
                                    DBRichEdit := TDBRichEdit.Create(TExDBGrid(Self));

                                  with DBRichEdit do
                                    begin
                                      Visible := False;
                                      AutoDisplay := True;
                                      PlainText := False;
                                      BorderStyle := bsNone;
                                      ControlStyle := ControlStyle + [csOpaque];
                                      Parent := GetParentForm(Self);
                                      DataSource := nil;
                                      DataField := '';
                                      OnKeyDown := OnKeyDBMemo;
                                      OnExit := OnDBExit;
                                      Top := TmpRect.Top - 2;
                                      Left := TmpRect.Left - 2;
                                      Height := (TmpRect.Bottom - TmpRect.Top + 2);
                                      Width := (TmpRect.Right - TmpRect.Left + 2);
                                      P := Self.ClientToScreen(Point(Left, Top));
                                      P := Parent.ScreenToClient(P);
                                      Top := P.y;
                                      Left := P.x;
                                      ParentFont := True;
                                      ParentColor := False;
                                      Color := TExDBGrid(Self).EditColor;
                                      ReadOnly := False;
                                      if FMemoViewType = WordWrapOn then
                                        begin
                                          ScrollBars := ssNone;
                                          WordWrap := True;
                                        end
                                      else
                                        if FMemoViewType = ScrollBarsOn then
                                          begin
                                            WordWrap := False;
                                            ScrollBars := ssBoth;
                                          end;
                                      if not Self.Focused then
                                        Self.SetFocus;
                                    end;
                                end;
                            end;
                        end;
                    finally
                    end;
                  end
                else
                  begin
                    FillRect(Rect);
                    TmpRect := Rect;
                    Inc(TmpRect.Top, 2);
                    Inc(TmpRect.Left, 2);
                    Inc(TmpRect.Right, -2);

                    if (csDesigning in ComponentState) then
                      begin
                        if FShowTextEllipsis then
                          DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                        else
                          DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                      end
                    else
                      begin
                        if FShowTextEllipsis then
                          DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                        else
                          //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                          DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                      end;
                  end;
              end
            else
              //if Column.Field is TBooleanField then
              if InternalIsBooleanField(Column.Field) then
                begin
                  if (FDisplayBool) then
                    begin
                      FillRect(Rect);

                      if FFlatCheckBox then
                        if (FFlatCheckBoxType = Normal) or (FFlatCheckBoxType = None) then
                          begin
                            OldClipRegion := 0;
                            ClipRegionExists := False;
                            try
                              OldClipRegion := CreateRectRgn(0, 0, 0, 0);
                            except
                            end;
                            ClipRegionExists := GetClipRgn(Handle, OldClipRegion) = 1;
                          end;

                      TmpRect := Rect;
                      TmpRect.Left := Rect.Left + (Rect.Right - Rect.Left - GCheckWidth) div 2;
                      TmpRect.Right := TmpRect.Left + GCheckWidth;
                      TmpRect.Top := Rect.Top + (Rect.Bottom - Rect.Top - GCheckWidth) div 2;
                      TmpRect.Bottom := TmpRect.Top + GCheckHeight;

                      if FFlatCheckBox then
                        if (FFlatCheckBoxType = Normal) or (FFlatCheckBoxType = None) then
                          begin
                            Region := CreateRectRgnIndirect(TmpRect);
                            ExtSelectClipRgn(Handle, Region, RGN_AND);
                            DeleteObject(Region);
                            InflateRect(TmpRect, 1, 1);
                          end;

                      {if Column.Field.AsBoolean = True then
                          style := DFCS_CHECKED
                      else
                          style := DFCS_BUTTONCHECK;}
                      if not assigned(FIsBooleanField) then
                        if Column.Field.AsBoolean = True then
                          style := DFCS_CHECKED
                        else
                          style := DFCS_BUTTONCHECK
                      else
                        if Column.Field.AsInteger = FValueUnChecked then
                          style := DFCS_BUTTONCHECK
                        else
                          style := DFCS_CHECKED;

                      if FFlatCheckBox then
                        DrawFrameControl(Canvas.Handle, TmpRect, DFC_BUTTON, style or DFCS_FLAT)
                      else
                        DrawFrameControl(Canvas.Handle, TmpRect, DFC_BUTTON, style);

                      if (Column.Field.AsBoolean) and
                        ((not (gdSelected in State) and (Canvas.Font.Color <> clBlack)) or
                        ((gdSelected in State) and (Canvas.Font.Color <> FHighlightFontColor))) then
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

                      if FFlatCheckBox then
                        if (FFlatCheckBoxType = Normal) or (FFlatCheckBoxType = None) then
                          begin
                            if ClipRegionExists then
                              SelectClipRgn(Handle, OldClipRegion)
                            else
                              SelectClipRgn(Handle, 0);

                            DeleteObject(OldClipRegion);
                            InflateRect(TmpRect, -1, -1);
                            if FFlatCheckBoxType = Normal then
                              Brush.Color := clGray
                            else
                              Brush.Color := Canvas.Brush.Color;
                            FrameRect(TmpRect);
                          end;
                    end
                  else
                    begin
                      vAlignment := Column.Field.Alignment;

                      case vAlignment of
                        taRightJustify:
                          begin
                            FillRect(Rect);
                            TmpRect := Rect;
                            Inc(TmpRect.Top, 2);
                            Inc(TmpRect.Left, 2);
                            Inc(TmpRect.Right, -2);

                            if FShowTextEllipsis then
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_RIGHT)
                            else
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_RIGHT);
                          end;

                        taLeftJustify:
                          begin
                            FillRect(Rect);
                            TmpRect := Rect;
                            Inc(TmpRect.Top, 2);
                            Inc(TmpRect.Left, 2);
                            Inc(TmpRect.Right, -2);

                            if FShowTextEllipsis then
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                            else
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                          end;

                        taCenter:
                          begin
                            FillRect(Rect);
                            TmpRect := Rect;
                            Inc(TmpRect.Top, 2);
                            Inc(TmpRect.Left, 2);
                            Inc(TmpRect.Right, -2);

                            if FShowTextEllipsis then
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                            else
                              DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                          end;
                      end;
                    end;
                end
              else
                if Column.Field is TDateTimeField then
                  begin
                    if (FDisplayDateTime) then
                      begin
                        try
                          FillRect(Rect);
                          TmpRect := Rect;
                          Inc(TmpRect.Top, 2);
                          Inc(TmpRect.Left, 2);

                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                          else
                            //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                            DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);

                          if not (csDesigning in ComponentState) then
                            begin
                              if (gdFocused in State) then
                                begin
                                  if DateTimePicker = nil then
                                    DateTimePicker := TExDateTimePicker.Create(TExDBGrid(Self));

                                  with DateTimePicker do
                                    begin
                                      Visible := False;
                                      DateMode := dmComboBox;
                                      if (not (Column.Field.DataType = ftTime)) and ((Column.Field.DataType = ftDate) or (Column.Field.DataType = ftDateTime)) then
                                        Kind := (dtkDate)
                                      else
                                        Kind := (dtkTime);
                                      BorderStyle := bsNone;
                                      ControlStyle := ControlStyle + [csOpaque];
                                      Parent := GetParentForm(Self);
                                      OnKeyDown := OnKeyDateTimePicker;
                                      OnChange := OnChangeDateTimePicker;
                                      OnExit := OnDTPExit;
                                      Top := TmpRect.Top - 2;
                                      Left := TmpRect.Left - 2;
                                      Height := (TmpRect.Bottom - TmpRect.Top + 2);
                                      Width := (TmpRect.Right - TmpRect.Left + 2);
                                      P := Self.ClientToScreen(Point(Left, Top));
                                      P := Parent.ScreenToClient(P);
                                      Top := P.y;
                                      Left := P.x;
                                      ParentFont := True;
                                      ParentColor := False;
                                      Color := TExDBGrid(Self).EditColor;
                                      BorderColor := TExDBGrid(Self).EditColor;
                                      if Column.Field.IsNull then
                                        DateTimePicker.Date := Date
                                      else
                                        DateTimePicker.Date := Column.Field.AsDateTime;
                                      if not Self.Focused then
                                        Self.SetFocus;
                                    end;
                                end;
                            end;
                        finally
                        end;
                      end
                    else
                      begin
                        FillRect(Rect);
                        TmpRect := Rect;
                        Inc(TmpRect.Top, 2);
                        Inc(TmpRect.Left, 2);
                        Inc(TmpRect.Right, -2);

                        if FShowTextEllipsis then
                          DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                        else
                          //DrawText(Canvas.Handle, PChar(Column.Field.AsString), Length(Column.Field.AsString), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                          DrawText(Canvas.Handle, PChar(Column.Field.AsString), -1, TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                      end;
                  end
                else
                  begin
                    vAlignment := Column.Alignment;

                    case vAlignment of
                      taRightJustify:
                        begin
                          FillRect(Rect);
                          TmpRect := Rect;
                          Inc(TmpRect.Top, 2);
                          Inc(TmpRect.Left, 2);
                          Inc(TmpRect.Right, -2);

                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_RIGHT)
                          else
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_RIGHT);
                        end;

                      taLeftJustify:
                        begin
                          FillRect(Rect);
                          TmpRect := Rect;
                          Inc(TmpRect.Top, 2);
                          Inc(TmpRect.Left, 2);
                          Inc(TmpRect.Right, -2);

                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_LEFT)
                          else
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_LEFT);
                        end;

                      taCenter:
                        begin
                          FillRect(Rect);
                          TmpRect := Rect;
                          Inc(TmpRect.Top, 2);
                          Inc(TmpRect.Left, 2);
                          Inc(TmpRect.Right, -2);

                          if FShowTextEllipsis then
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_SINGLELINE or DT_END_ELLIPSIS or DT_NOPREFIX or DT_CENTER)
                          else
                            DrawText(Canvas.Handle, PChar(Column.Field.DisplayText), Length(Column.Field.DisplayText), TmpRect, DT_WORDBREAK or DT_NOPREFIX or DT_CENTER);
                        end;
                    end;
                  end;

          if FCells3D = False then
            if FDrawFocusRect then
              if (dgAlwaysShowSelection in Options) then
                begin
                  if (gdSelected in State) then
                    if not (dgRowSelect in Options) then
                      Canvas.DrawFocusRect(Rect);
                end
              else
                begin
                  if (gdFocused in State) then
                    begin
                      if not (dgRowSelect in Options) then
                        Canvas.DrawFocusRect(Rect);
                    end
                  else
                    begin
                      if (not (gdFocused in State)) and (gdSelected in State) then
                        if not (dgRowSelect in Options) then
                          if not FEnableCellRangeSelect then
                            begin
                              Canvas.Brush.Color := clYellow;
                              Canvas.FrameRect(Rect);
                            end;
                    end;
                end;
          Unlock;
        end;

      inherited DrawColumnCell(Rect, DataCol, Column, State);

      EndUpdate;
    end;
end;

procedure TExDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
const
  AlignFlags: array[TAlignment] of Integer =
  (DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX);
var
  TitleText: string;
  TmpCol, i, j: LongInt;
  TmpRect: TRect;
  OldActive, Comp1, Comp2: Integer;
begin
  if not FShowTitlesWhenInactive then
    begin
      if (not (csDesigning in ComponentState)) and ((DataLink = nil) or (not DataLink.Active)) then
        begin
          Canvas.Brush.Color := Color;
          InflateRect(ARect, 1, 1);
          Canvas.FillRect(ARect);
          Exit;
        end;
    end;

  if FEnableCellRangeSelect then
    begin
      if Assigned(DataLink) and DataLink.Active then
        begin
          if ARow > 0 then
            begin
              OldActive := DataLink.ActiveRecord;
              try
                DataLink.ActiveRecord := ARow - 1;
                Comp1 := TMyBookmarks(SelectedRows).Compare(TMyBookmarks(SelectedRows).CurrentRow, FStartBookmark);
                Comp2 := TMyBookmarks(SelectedRows).Compare(TMyBookmarks(SelectedRows).CurrentRow, FEndBookmark);
                if ((Comp1 >= 0) and (Comp2 <= 0)) or
                  ((Comp1 <= 0) and (Comp2 >= 0)) then
                  begin
                    if ((ACol >= StartCell.X) and (ACol <= EndCell.X)) or
                      ((ACol <= StartCell.X) and (ACol >= EndCell.X)) then
                      AState := AState + [gdSelected];
                  end;
              finally
                DataLink.ActiveRecord := OldActive;
              end;
            end;
        end;
    end;

  if (gdFixed in AState) and (Ctl3D) and (ARow >= TitleOffset) and (ACol >= IndicatorOffset) then
    inherited DrawCell(ACol, ARow, ARect, AState - [gdFixed])
  else
    inherited DrawCell(ACol, ARow, ARect, AState);

  if (dgIndicator in Options) then
    TmpCol := ACol - 1
  else
    TmpCol := ACol;

  if (FCells3D = True) and ([dgRowLines, dgColLines] * Options = [dgRowLines, dgColLines]) then
    begin
      with ARect do
        begin
          if (Color = clWhite) or (Color = clWindow) then
            Color := TExDBGrid(Self).FixedColor;

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
                    end
                  else
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
                                    DrawText(Canvas.Handle, PChar(TitleText), Length(TitleText), TmpRect, DT_SINGLELINE or AlignFlags[Columns[TmpCol].Title.Alignment]);
                                end;
                            end;
                        end;
                    end;

                  if not FBoldTitlesWhenCells3D then
                    begin
                      Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                      Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                      Canvas.Pen.Color := clBtnShadow;
                      Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)])
                    end;
                end
              else
                begin
                  Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                  Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                  Canvas.Pen.Color := clBtnShadow;
                  Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                end;

              if not FBoldIndicatorsWhenCells3D then
                if dgIndicator in Options then
                  begin
                    if ACol = 0 then
                      begin
                        Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                        Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                        Canvas.Pen.Color := clBtnShadow;
                        Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                      end;
                  end;
            end
          else
            if ARow > 0 then
              begin
                if not FBoldIndicatorsWhenCells3D then
                  if dgIndicator in Options then
                    begin
                      if ACol = 0 then
                        begin
                          Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                          Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                          Canvas.Pen.Color := clBtnShadow;
                          Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                        end;
                    end;
              end;

          Canvas.Pen.Color := clHighLightText;
          Canvas.PolyLine([Point(Left, Bottom - 1), Point(Left, Top), Point(Right, Top)]);
        end;
    end
  else
    begin
      with ARect do
        begin
          if (Color = clBtnFace) or (Color = clSilver) then
            Color := clWindow;

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
                    end
                  else
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
                                    DrawText(Canvas.Handle, PChar(TitleText), Length(TitleText), TmpRect, DT_SINGLELINE or AlignFlags[Columns[TmpCol].Title.Alignment]);
                                end;
                            end;
                        end;
                    end;

                  Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                  Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                  Canvas.Pen.Color := clBtnShadow;
                  Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                end
              else
                begin
                  Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                  Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                end;

              if dgIndicator in Options then
                begin
                  if ACol = 0 then
                    begin
                      Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                      Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                      Canvas.Pen.Color := clBtnShadow;
                      Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                    end;
                end;
            end
          else
            if ARow > 0 then
              begin
                if dgIndicator in Options then
                  begin
                    if ACol = 0 then
                      begin
                        Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                        Canvas.PolyLine([Point(Left + 1, Bottom - 1), Point(Right - 1, Bottom - 1), Point(Right - 1, Top)]);

                        Canvas.Pen.Color := clBtnShadow;
                        Canvas.PolyLine([Point(Left - 1, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                      end
                    else
                      begin
                        Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                        Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                      end;
                  end
                else
                  begin
                    Canvas.Pen.Color := TExDBGrid(Self).FixedColor;
                    Canvas.PolyLine([Point(Left, Bottom), Point(Right, Bottom), Point(Right, Top - 1)]);
                  end;
              end;
        end;
    end;
end;

procedure TExDBGrid.ColWidthsChanged;
begin
  inherited;
  try
    if Assigned(FOnColResize) then
      FOnColResize(TExDBGrid(Self));

    if (FixedCols > 0) then
      SetFixedColumns;

    SendSizeMessage;

    {$IFDEF EX_COMPILER_4_UP}
    SendFooterMsg(FTR_COLWIDTHS);
    {$ENDIF}
  except
  end;
end;

procedure TExDBGrid.ColumnMoved(FromIndex, ToIndex: LongInt);
begin
  inherited ColumnMoved(FromIndex, ToIndex);
  Perform(WM_HSCROLL, 0, 0);
end;

procedure TExDBGrid.RowMoved(FromIndex, ToIndex: Longint);
begin
  inherited RowMoved(FromIndex, ToIndex);
  Perform(WM_HSCROLL, 0, 0);
end;

procedure TExDBGrid.SetCheckBoxSize;
begin
  with TBitmap.Create do
    try
      Handle := LoadBitmap(0, PChar(32759));
      GCheckWidth := Width div 4;
      GCheckHeight := Height div 3;
    finally
      Free;
    end;
end;

procedure TExDBGrid.ApplyCellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  if Assigned(FOnApplyCellAttribute) then
    FOnApplyCellAttribute(Self, Field, Canvas, State);
end;

procedure TExDBGrid.CellAttribute(Field: TField; Canvas: TCanvas; State: TGridDrawState);
begin
  ApplyCellAttribute(Field, Canvas, State);
end;

procedure TExDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CursorPos: TPoint;
  Cell: TGridCoord;
  TempCell: TGridCoord;
  FOldSelection: TGridRect;
begin
  if FEnableCellRangeSelect then
    begin
      TempCell := MouseCoord(X, Y);
      if (X > 0) and (Y > 0) then
        if (TempCell.X <> Col) or (TempCell.Y <> Row) then
          begin
            inherited;
            FOldSelection := FRangeSelection;
            StartCell := TempCell;
            EndCell := TempCell;
            RefreshGridRect(FOldSelection);
            MouseCapture := True;
            OldCol := StartCell.X;
            OldRow := StartCell.Y;
          end
        else
          begin
            MouseCapture := False;
            inherited;
          end;
    end
  else
    begin
      if Button = mbRight then
        begin
          // Assigned(PopupMenu) then
          Cell := MouseCoord(X, Y);
          if Assigned(PopupMenu) and not ((Cell.X = 0) or (Cell.Y = 0)) then
            if not Assigned(FOnRightClick) then
              begin
                GetCursorPos(CursorPos);
                PopupMenu.PopupComponent := Self;
                PopupMenu.Popup(CursorPos.X, CursorPos.Y);
                Exit;
              end;
        end;

      if FSearchMode = False then
        if Button = mbLeft then
          begin
            Cell := MouseCoord(X, Y);
            if (Cell.Y = 0) and not ((dgIndicator in Options) and (Cell.X = 0)) and (GetCursor = Screen.Cursors[Cursor]) then
              begin
                if (dgColumnResize in Options) then
                  begin
                    if (dgColumnResize in Options) then
                      begin
                        FCustomColMove := True;
                        FColMove := Cell.X;
                        BeginDrag(False);

                        if not AcquireFocus then
                          Exit;

                        if Assigned(FOnMouseDown) then
                          FOnMouseDown(Self, Button, Shift, X, Y);

                        Exit;
                      end;
                  end
                else
                  begin
                    if not AcquireFocus then
                      Exit;

                    if Assigned(FOnMouseDown) then
                      FOnMouseDown(Self, Button, Shift, X, Y);

                    inherited MouseDown(Button, Shift, X, Y);
                  end;
              end;
          end;

      if not AcquireFocus then
        Exit;

      if Assigned(FOnMouseDown) then
        FOnMouseDown(Self, Button, Shift, X, Y);

      inherited MouseDown(Button, Shift, X, Y);
    end;
end;

procedure TExDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  PopCoord: TPoint;
  TempCell: TGridCoord;
  FOldSelection: TGridRect;
begin
  if FEnableCellRangeSelect then
    begin
      if MouseCapture and (Button = mbLeft) then
        begin
          MouseCapture := False;
          TempCell := MouseCoord(X, Y);
          if (X > 0) and (Y > 0) then
            if not ExCellsEqual(TempCell, EndCell) then
              begin
                inherited MouseDown(mbLeft, Shift, X, Y);
                FOldSelection := FRangeSelection;
                EndCell := TempCell;
                RefreshGridRect(FRangeSelection);
                RefreshGridRect(FOldSelection);
              end;
        end
      else
        inherited;
    end
  else
    begin
      if FCustomColMove = False then
        begin
          if Assigned(FOnMouseUp) then
            FOnMouseUp(Self, Button, Shift, X, Y);

          inherited MouseUp(Button, Shift, X, Y);

          if not (csDesigning in ComponentState) then
            begin
              Cell := MouseCoord(X, Y);

              if FTitleCheck then
                if (dgTitles in Options) and (dgIndicator in Options) then
                  if DataLink.Active then
                    if (Cell.X = 0) and (Cell.Y = 0) then
                      begin
                        PopCoord := ClientToScreen(Point(X, Y));
                        FExDBGridPopUpMenu.Popup(PopCoord.X, PopCoord.Y);
                      end;

              if (Cell.Y < TitleOffset) then
                LockedChanged;
            end;
        end;
    end;
end;

procedure TExDBGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  TempCell: TGridCoord;
  FOldSelection: TGridRect;
begin
  if FEnableCellRangeSelect then
    begin
      if MouseCapture then
        begin
          TempCell := MouseCoord(X, Y);
          if (X > 0) and (Y > 0) then
            if not ExCellsEqual(TempCell, EndCell) then
              begin
                inherited MouseDown(mbLeft, Shift, X, Y);
                FOldSelection := FRangeSelection;
                EndCell := TempCell;
                RefreshGridRect(FRangeSelection);
                RefreshGridRect(FOldSelection);
              end;
        end
      else
        inherited;
    end
  else
    begin
      if Assigned(FOnMouseMove) then
        FOnMouseMove(Self, Shift, X, Y);

      inherited MouseMove(Shift, X, Y);

      if FCellHints = True then
        DoHint(X, Y);
    end;
end;

procedure TExDBGrid.ColEnter;
begin
  if Col <= FixedCols then
    begin
      LeftCol := FixedCols;
      Col := FixedCols;
    end;

  if SelectedIndex = -1 then
    begin
      if FlockedCols > FFixedCols then
        SelectedIndex := FlockedCols
      else
        SelectedIndex := FFixedCols;
    end;

  if not (csDesigning in ComponentState) then
    begin
      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
        begin
          with Columns[SelectedIndex] do
            //if (Field is TBooleanField) or
            if InternalIsBooleanField(Field) or
              (Field is TBlobField) or
              (Field is TMemoField) or
              (Field.DataType = ftBytes) or
              ((Field is TDateTimeField) and (FDisplayDateTime)) then
              begin
                if (goEditing in TExDBGridMod(Self).Options) then
                  begin
                    BeginUpdate;
                    TExDBGridMod(Self).Options := TExDBGridMod(Self).Options - [goEditing];
                    EndUpdate;
                  end;
              end
            else
              begin
                if not (goEditing in TExDBGridMod(Self).Options) then
                  begin
                    BeginUpdate;
                    TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goEditing];
                    EndUpdate;
                  end;
              end;

          if Assigned(TExDBGrid(Self).SelectedField) then
            begin
              if TExDBGrid(Self).SelectedField.Lookup = True then
                begin
                  if GetActiveWindow = Self.Handle then
                    begin
                      TExDBGrid(Self).EditorMode := True;
                      keybd_event(VK_MENU, MapVirtualKey(VK_MENU, 0), 0, 0);
                      keybd_event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), 0, 0);
                      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
                      keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    end;
                end;
            end;

          if Assigned(FOnColEnter) then
            FOnColEnter(Self);
        end
      else
        if ReadOnly or DataLink.ReadOnly or (Assigned(DataLink.DataSet) and (not DataLink.DataSet.CanModify)) then
          begin
            if (goEditing in TExDBGridMod(Self).Options) then
              begin
                BeginUpdate;
                TExDBGridMod(Self).Options := TExDBGridMod(Self).Options - [goEditing];
                EndUpdate;
              end;

            if Assigned(FOnColEnter) then
              FOnColEnter(Self);
          end;
    end;
end;

procedure TExDBGrid.WMSize(var Message: TWMSize);
begin
  inherited;

  if not FLockedWidth then
    begin
      try
        if (FGridAutoWidth <> awNone) and FGridAutoWidthOnResize then
          SetGridAutoWidth(FGridAutoWidth);
      except
      end;

      if FCurrentControl <> nil then
        if FCurrentControl.Visible then
          PlaceControl(FCurrentControl, Col, Row);
    end;
end;

procedure TExDBGrid.CMFontChanged(var Message: TMessage);
var
  h: Integer;
begin
  inherited;

  Canvas.Font.Assign(font);
  h := Canvas.TextHeight('Wg');

  if FRowHeight < h then
    SetDefaultRowHeight(h);

  if (csdesigning in componentstate) then
    Invalidate;
end;

procedure TExDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
const
  vk_c = $43;
  vk_v = $56;
begin
  if FEnterAsTab then
    if Key = VK_RETURN then
      Key := VK_TAB;

  if FCellHints = True then
    if Assigned(FHintWnd) then
      begin
        FHintWnd.ReleaseHandle;
      end;

  inherited KeyDown(Key, Shift);

  if not FEnableCellRangeSelect then
    if not (csDesigning in ComponentState) then
      begin
        if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
          begin
            BeginUpdate;
            try
              if not (ReadOnly or DataLink.ReadOnly) then
                begin

                  if Shift = [ssCtrl] then
                    begin
                      if key = vk_v then
                        Shift := [ssShift];
                      if (key = vk_c) or (key = vk_v) then
                        begin
                          gk := Key;
                          key := 0;
                        end;
                    end;

                  if (Key = 32) or (Key = VK_RETURN) then
                    begin
                      if (not (dgRowSelect in Options)) and (dgEditing in Options) then
                        begin
                          Key := 0;
                          //if Columns[SelectedIndex].Field is TBooleanField then
                          if InternalIsBooleanField(Columns[SelectedIndex].Field) then
                            begin
                              if (FDisplayBool) then
                                begin
                                  if Columns[SelectedIndex].Field.CanModify then
                                    CellClick(Columns[SelectedIndex]);
                                end
                              else
                                begin
                                  if not (goEditing in TExDBGridMod(Self).Options) then
                                    begin
                                      BeginUpdate;
                                      TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goEditing];
                                      EndUpdate;
                                    end;
                                end;
                            end;

                          if FDisplayPopupEditors then
                            if not (Columns[SelectedIndex].Field.DataType = ftMemo) and (Columns[SelectedIndex].Field.DataType <> ftFmtMemo) and (Columns[SelectedIndex].Field.DataType <> ftBytes) and (Columns[SelectedIndex].Field is TBlobField) then
                              begin
                                DblClick;
                              end;

                          if (FDisplayMemo) then
                            begin
                              if not (FFullSizeMemo) then
                                if (Columns[SelectedIndex].Field.DataType = ftMemo) or (Columns[SelectedIndex].Field.DataType = ftFmtMemo) or (Columns[SelectedIndex].Field.DataType = ftBytes) then
                                  begin
                                    if MemoInplaceEditor = Memo then
                                      begin
                                        with DBMemo do
                                          begin
                                            Application.ProcessMessages;
                                            DataSource := TExDBGrid(Self).DataSource;
                                            DataField := Columns[SelectedIndex].FieldName;
                                            Visible := True;
                                            SetFocus;
                                            Application.ProcessMessages;
                                            DBMemo.SelStart := 0;
                                            DBMemo.SelLength := DBMemo.GetTextLen;
                                          end;
                                      end
                                    else
                                      begin
                                        with DBRichEdit do
                                          begin
                                            Application.ProcessMessages;
                                            DataSource := TExDBGrid(Self).DataSource;
                                            DataField := Columns[SelectedIndex].FieldName;
                                            Visible := True;
                                            SetFocus;
                                            Application.ProcessMessages;
                                            DBRichEdit.SelStart := 0;
                                            DBRichEdit.SelLength := DBRichEdit.GetTextLen;
                                          end;
                                      end;
                                  end;
                            end
                          else
                            begin
                              if FDisplayPopupEditors then
                                if (Columns[SelectedIndex].Field is TMemoField) or (Columns[SelectedIndex].Field.DataType = ftFmtMemo) or (Columns[SelectedIndex].Field.DataType = ftBytes) then
                                  begin
                                    DblClick;
                                  end;
                            end;

                          if (FDisplayDateTime) then
                            begin
                              if Columns[SelectedIndex].Field is TDateTimeField then
                                begin
                                  with DateTimePicker do
                                    begin
                                      Application.ProcessMessages;
                                      Visible := True;
                                      try
                                        SetFocus;
                                      except
                                      end;
                                      Application.ProcessMessages;
                                    end;
                                end;
                            end;
                        end;
                    end;

                  if (Key = VK_F2) then
                    begin
                      if (not (dgRowSelect in Options)) and (dgEditing in Options) then
                        begin
                          //if Columns[SelectedIndex].Field is TBooleanField then
                          if InternalIsBooleanField(Columns[SelectedIndex].Field) then
                            begin
                              if (FDisplayBool) then
                                begin
                                  if Columns[SelectedIndex].Field.CanModify then
                                    CellClick(Columns[SelectedIndex]);
                                end
                              else
                                begin
                                  if not (goEditing in TExDBGridMod(Self).Options) then
                                    begin
                                      BeginUpdate;
                                      TExDBGridMod(Self).Options := TExDBGridMod(Self).Options + [goEditing];
                                      EndUpdate;
                                    end;
                                end;
                            end;

                          if FDisplayPopupEditors then
                            if not (Columns[SelectedIndex].Field is TMemoField) and (Columns[SelectedIndex].Field.DataType <> ftFmtMemo) and (Columns[SelectedIndex].Field.DataType <> ftBytes) and (Columns[SelectedIndex].Field is TBlobField) then
                              begin
                                DblClick;
                              end;

                          if (FDisplayMemo) then
                            begin
                              if not (FFullSizeMemo) then
                                if (Columns[SelectedIndex].Field is TMemoField) or (Columns[SelectedIndex].Field.DataType = ftFmtMemo) or (Columns[SelectedIndex].Field.DataType = ftBytes) then
                                  begin
                                    if MemoInplaceEditor = Memo then
                                      begin
                                        with DBMemo do
                                          begin
                                            Application.ProcessMessages;
                                            DataSource := TExDBGrid(Self).DataSource;
                                            DataField := Columns[SelectedIndex].FieldName;
                                            Visible := True;
                                            SetFocus;
                                            Application.ProcessMessages;
                                            DBMemo.SelStart := DBMemo.GetTextLen;
                                            DBMemo.SelLength := 0;
                                          end;
                                      end
                                    else
                                      begin
                                        with DBRichEdit do
                                          begin
                                            Application.ProcessMessages;
                                            DataSource := TExDBGrid(Self).DataSource;
                                            DataField := Columns[SelectedIndex].FieldName;
                                            Visible := True;
                                            SetFocus;
                                            Application.ProcessMessages;
                                            DBRichEdit.SelStart := DBRichEdit.GetTextLen;
                                            DBRichEdit.SelLength := 0;
                                          end;
                                      end;
                                  end;
                            end
                          else
                            begin
                              if FDisplayPopupEditors then
                                if (Columns[SelectedIndex].Field is TMemoField) or (Columns[SelectedIndex].Field.DataType = ftFmtMemo) or (Columns[SelectedIndex].Field.DataType = ftBytes) then
                                  begin
                                    DblClick;
                                  end;
                            end;

                          if (FDisplayDateTime) then
                            begin
                              if Columns[SelectedIndex].Field is TDateTimeField then
                                begin
                                  with DateTimePicker do
                                    begin
                                      Application.ProcessMessages;
                                      Visible := True;
                                      try
                                        SetFocus;
                                      except
                                      end;
                                      Application.ProcessMessages;
                                    end;
                                end;
                            end;
                        end;
                    end;

                  if (Key = VK_DOWN) or (Key = VK_NEXT) or (Key = VK_TAB) then
                    if DataLink.DataSet.EOF and (DataLink.DataSet.State = dsInsert) then
                      if FAllowAutoAppend = False then
                        begin
                          Key := 0;
                          DataLink.DataSet.Cancel;
                        end;
                end;
            finally
              EndUpdate;
            end;
          end;
      end;
end;

procedure TExDBGrid.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if FEnterAsTab then
    if Key = VK_RETURN then
      Key := VK_TAB;

  inherited KeyUp(Key, Shift);
end;

procedure TExDBGrid.KeyPress(var Key: Char);
const
  vk_c = $43;
  vk_v = $56;
begin
  if FCellHints = True then
    if Assigned(FHintWnd) then
      begin
        FHintWnd.ReleaseHandle;
      end;

  if not EditorMode then
    if FEnterAsTab and (Key = #13) then
      Key := #9;

  inherited KeyPress(Key);

  if not (csDesigning in ComponentState) then
    begin
      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
        begin
          BeginUpdate;

          if gk <> 0 then
            begin
              Key := chr(0);
              if gk = vk_c then
                ClipBoard.AsText := Columns[SelectedIndex].Field.AsString;
              if gk = vk_v then
                begin
                  if (DataLink.DataSet.State = dsEdit) or (DataLink.DataSet.State = dsInsert) then
                    Columns[SelectedIndex].Field.AsString := ClipBoard.AsText
                  else
                    MessageBeep(0);
                end;
              gk := 0;
            end;

          EndUpdate;
        end;
    end;
end;

procedure TExDBGrid.Paint;
begin
  DrawBackground;

  UpdateScrollBar;

  inherited;
end;

procedure TExDBGrid.Loaded;
var
  Ctrl_Idx: Integer;
  WinControl: TWinControl;
begin
  DBMemo := nil;
  DBRichEdit := nil;
  DateTimePicker := nil;
  FSearchEdit := nil;

  FOrigColor := Font.Color;

  try
    ColEnter;
  except
  end;

  inherited Loaded;

  for Ctrl_Idx := 0 to FControls.Count - 1 do
    begin
      WinControl := TWinControl(Owner.FindComponent(FControls.Items[Ctrl_Idx].ControlName));
      if WinControl <> nil then
        WinControl.Visible := False;
    end;
end;

procedure TExDBGrid.CreateWnd;
begin
  inherited CreateWnd;

  SetLockedCols(FLockedCols);
end;

procedure TExDBGrid.SetColumnAttributes;
begin
  inherited SetColumnAttributes;

  LockedChanged;
  Invalidate;
end;

procedure TExDBGrid.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
end;

procedure TExDBGrid.Scroll(Distance: Integer);
begin
  if FUseRowColors then
    Invalidate;

  inherited Scroll(Distance);

  if FCellHints and Assigned(FHintWnd) then
    FHintWnd.ReleaseHandle;
end;

procedure TExDBGrid.TitleClick(Column: TColumn);
var
  K: Integer;
  TempIndex: string;
  {$IFDEF BDE}
  SearchTable: TTable;
  {$ENDIF}
  {$IFDEF ADS}
  SearchTableAds: TAdsTable;
  {$ENDIF}
  {$IFDEF ADO}
  SearchTableADO: TADOTable;
  {$ENDIF}
  {$IFDEF DAO}
  SearchTableDAO: TDAOTable;
  {$ENDIF}
  {$IFDEF IBX}
  SearchTableIBX: TIBTable;
  {$ENDIF}
  {$IFDEF CDS}
  SearchTableClient: TClientDataSet;
  {$ENDIF}
  TmpRect: TRect;
  SaveCursor: TCursor;
begin
  if not (csDesigning in ComponentState) then
    begin
      if FSearchMode then
        begin
          if dgIndicator in Options then
            TmpRect := CellRect((Column.Index + 1), 0)
          else
            TmpRect := CellRect(Column.Index, 0);

          if FSearchEdit = nil then
            FSearchEdit := TEdit.Create(TExDBGrid(Self));

          with FSearchEdit do
            begin
              Visible := False;
              BorderStyle := bsNone;
              ControlStyle := ControlStyle + [csOpaque];
              Parent := TExDBGrid(Self);
              OnKeyUp := OnKeyEditUp;
              OnKeyDown := OnKeyEditDown;
              OnExit := OnKeyEditExit;
              Top := TmpRect.Top;
              Left := TmpRect.Left;
              Height := (TmpRect.Bottom - TmpRect.Top);
              Width := (TmpRect.Right - TmpRect.Left);
              ParentFont := True;
              ParentColor := False;
              Color := TExDBGrid(Self).EditColor;
            end;

          {$IFDEF BDE}
          SearchTable := nil;
          {$ENDIF}
          {$IFDEF ADS}
          SearchTableAds := nil;
          {$ENDIF}
          {$IFDEF ADO}
          SearchTableADO := nil;
          {$ENDIF}
          {$IFDEF DAO}
          SearchTableDAO := nil;
          {$ENDIF}
          {$IFDEF IBX}
          SearchTableIBX := nil;
          {$ENDIF}
          {$IFDEF CDS}
          SearchTableClient := nil;
          {$ENDIF}

          if (Assigned(TExDBGrid(Self).DataSource)) and (TExDBGrid(Self).DataSource.DataSet <> nil) then
            begin
              SaveCursor := Screen.Cursor;
              Screen.Cursor := crHourGlass;

              {$IFDEF BDE}
              if TExDBGrid(Self).DataSource.DataSet is TTable then
                SearchTable := TTable(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}
              {$IFDEF ADS}
              if TExDBGrid(Self).DataSource.DataSet is TAdsTable then
                SearchTableAds := TAdsTable(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}
              {$IFDEF ADO}
              if TExDBGrid(Self).DataSource.DataSet is TADOTable then
                SearchTableADO := TADOTable(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}
              {$IFDEF DAO}
              if TExDBGrid(Self).DataSource.DataSet is TDAOTable then
                SearchTableDAO := TDAOTable(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}
              {$IFDEF IBX}
              if TExDBGrid(Self).DataSource.DataSet is TIBTable then
                SearchTableIBX := TIBTable(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}
              {$IFDEF CDS}
              if TExDBGrid(Self).DataSource.DataSet is TClientDataSet then
                SearchTableClient := TClientDataSet(TExDBGrid(Self).DataSource.DataSet);
              {$ENDIF}

              {$IFDEF BDE}
              if Assigned(SearchTable) then
                begin
                  TempIndex := '';

                  with Columns[Column.Index] do
                    begin
                      SearchTable.IndexDefs.Update;
                      for K := 0 to SearchTable.IndexDefs.Count - 1 do
                        if SearchTable.IndexDefs.Items[K].Fields = Columns[Column.Index].Field.FieldName then
                          begin
                            TempIndex := SearchTable.IndexDefs.Items[K].Fields;
                          end;
                    end;

                  if TempIndex = '' then
                    FSearchEdit.Visible := True
                  else
                    begin
                      with TTable(TExDBGrid(Self).DataSource.DataSet) do
                        begin
                          IndexFieldNames := TempIndex;
                          First;
                          TTable(TExDBGrid(Self).DataSource.DataSet).Refresh;
                        end;
                      FSearchEdit.Visible := True;
                    end;
                end
              else
                FSearchEdit.Visible := False;
              {$ENDIF}
              {$IFDEF ADS}
              if Assigned(SearchTableAds) then
                begin
                  TempIndex := '';

                  with Columns[Column.Index] do
                    begin
                      SearchTableAds.IndexDefs.Update;
                      for K := 0 to SearchTableAds.IndexDefs.Count - 1 do
                        if SearchTableAds.IndexDefs.Items[K].Fields = Columns[Column.Index].Field.FieldName then
                          begin
                            TempIndex := SearchTableAds.IndexDefs.Items[K].Fields;
                          end;
                    end;

                  if TempIndex = '' then
                    FSearchEdit.Visible := True
                  else
                    begin
                      with TAdsTable(TExDBGrid(Self).DataSource.DataSet) do
                        begin
                          IndexFieldNames := TempIndex;
                          First;
                          TAdsTable(TExDBGrid(Self).DataSource.DataSet).Refresh;
                        end;
                      FSearchEdit.Visible := True;
                    end;
                end
              else
                FSearchEdit.Visible := False;
              {$ENDIF}
              {$IFDEF ADO}
              if Assigned(SearchTableADO) then
                begin
                  TempIndex := '';

                  with Columns[Column.Index] do
                    begin
                      SearchTableADO.IndexDefs.Update;
                      for K := 0 to SearchTableADO.IndexDefs.Count - 1 do
                        if SearchTableADO.IndexDefs.Items[K].Fields = Columns[Column.Index].Field.FieldName then
                          begin
                            TempIndex := SearchTableADO.IndexDefs.Items[K].Fields;
                          end;
                    end;

                  if TempIndex = '' then
                    FSearchEdit.Visible := True
                  else
                    begin
                      with TADOTable(TExDBGrid(Self).DataSource.DataSet) do
                        begin
                          IndexFieldNames := TempIndex;
                          First;
                          TADOTable(TExDBGrid(Self).DataSource.DataSet).Refresh;
                        end;
                      FSearchEdit.Visible := True;
                    end;
                end
              else
                FSearchEdit.Visible := False;
              {$ENDIF}
              {$IFDEF DAO}
              if Assigned(SearchTableDAO) then
                begin
                  TempIndex := '';

                  with Columns[Column.Index] do
                    begin
                      SearchTableDAO.IndexDefs.Update;
                      for K := 0 to SearchTableDAO.IndexDefs.Count - 1 do
                        if SearchTableDAO.IndexDefs.Items[K].Fields = Columns[Column.Index].Field.FieldName then
                          begin
                            TempIndex := SearchTableDAO.IndexDefs.Items[K].Fields;
                          end;
                    end;

                  if TempIndex = '' then
                    FSearchEdit.Visible := True
                  else
                    begin
                      with TDAOTable(TExDBGrid(Self).DataSource.DataSet) do
                        begin
                          IndexFieldNames := TempIndex;
                          First;
                          TDAOTable(TExDBGrid(Self).DataSource.DataSet).Refresh;
                        end;
                      FSearchEdit.Visible := True;
                    end;
                end
              else
                FSearchEdit.Visible := False;
              {$ENDIF}
              {$IFDEF IBX}
              if Assigned(SearchTableIBX) then
                begin
                  TempIndex := '';

                  with Columns[Column.Index] do
                    begin
                      SearchTableIBX.IndexDefs.Update;
                      for K := 0 to SearchTableIBX.IndexDefs.Count - 1 do
                        if SearchTableIBX.IndexDefs.Items[K].Fields = Columns[Column.Index].Field.FieldName then
                          begin
                            TempIndex := SearchTableIBX.IndexDefs.Items[K].Fields;
                          end;
                    end;

                  if TempIndex = '' then
                    FSearchEdit.Visible := True
                  else
                    begin
                      with TIBTable(TExDBGrid(Self).DataSource.DataSet) do
                        begin
                          IndexFieldNames := TempIndex;
                          First;
                          TIBTable(TExDBGrid(Self).DataSource.DataSet).Refresh;
                        end;
                      FSearchEdit.Visible := True;
                    end;
                end
              else
                FSearchEdit.Visible := False;
              {$ENDIF}
              {$IFDEF CDS}
              if Assigned(SearchTableClient) then
                begin
                  with TClientDataSet(TExDBGrid(Self).DataSource.DataSet) do
                    begin
                      IndexFieldNames := Columns[Column.Index].Field.FieldName;
                      First;
                      TClientDataSet(TExDBGrid(Self).DataSource.DataSet).Refresh;
                    end;
                end;
              FSearchEdit.Visible := True;
              {$ENDIF}

              Screen.Cursor := SaveCursor;
            end
          else
            FSearchEdit.Visible := False;

          if FSearchEdit.Visible then
            begin
              FSearchEdit.Text := '';
              FSearchEdit.SetFocus;
            end;
        end;

      inherited TitleClick(column);
    end;
end;

procedure TExDBGrid.SetFixedColumns;
var
  Value: Integer;
begin
  //Value := FLockedCols + IndicatorOffset;
  if (dgIndicator in Options) then
    Value := FFixedCols + IndicatorOffset
  else
    Value := FFixedCols;
  if DataSource <> nil then
    if DataSource.DataSet <> nil then
      if DataSource.DataSet.Active then
        inherited FixedCols := Value;
end;

procedure TExDBGrid.SetFixedCols(Value: Integer);
begin
  FFixedCols := Value;
  SetFixedColumns;
end;

function TExDBGrid.GetFixedCols: Integer;
begin
  Result := FFixedCols;
end;

procedure TExDBGrid.DrawCustomColumn(Canvas: TCanvas; ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
const
  AlignFlags: array[TAlignment] of Integer =
  (DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX);
var
  Value: string;
  R: TRect;
  TopColor, BottomColor: TColor;
  A: TAlignment;
  Column: TColumn;
  Flags: Integer;
begin
  R := ARect;
  with Canvas do
    begin
      Column := Columns.Items[CellToCol(ACol)];
      Value := Column.Title.Caption;
      Font.Assign(Column.Title.Font);
      Brush.Color := Column.Title.Color;
      FillRect(R);
      if (gdFixed in AState) then
        begin
          BottomColor := clBtnHighlight;
          TopColor := clBtnShadow;
        end
      else
        begin
          TopColor := clBtnHighlight;
          BottomColor := clBtnShadow;
        end;
      Frame3d(Canvas, R, TopColor, BottomColor, 1);
      A := Column.Title.Alignment;
      case A of
        taRightJustify: Dec(R.Right, 2);
        taLeftJustify: Inc(R.Left, 1);
      end;
      inc(R.Left, 2);
      Brush.Style := bsClear;
      Flags := 0;
      DrawText(Handle, PChar(Value), Length(Value), R, Flags + AlignFlags[A]);
      Font.Assign(Self.Font);
    end;
end;

procedure TExDBGrid.LinkActive(Value: Boolean);
begin
  inherited LinkActive(Value);
  SetFixedColumns;
  RowHeightsChanged;

  {$IFDEF EX_COMPILER_4_UP}
  SendFooterMsg(FTR_ACTIVE);
  {$ENDIF}
end;

procedure TExDBGrid.CreateDragImage(DragCol: Integer);
var
  BM: TBitmap;
  R: TRect;
begin
  FDragImages.Clear;
  BM := TBitmap.Create;
  try
    BM.Height := RowHeights[0];
    BM.Width := ColWidths[DragCol];
    R := Rect(0, 0, BM.Width, BM.Height);
    DrawCustomColumn(BM.Canvas, DragCol, 0, R, [gdFixed]);
    FDragImages.Height := BM.Height;
    FDragImages.Width := BM.Width;
    FDragImages.Add(BM, nil);
  finally
    BM.Free;
  end;
end;

procedure TExDBGrid.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  P: TPoint;
begin
  if FCustomColMove then
    begin
      GetCursorPos(P);
      P := ScreenToClient(P);
      Accept := (Source = Self);
      P.Y := 0;
      if P.X < CellRect(LeftCol, 0).Left - 5 then
        FDragTimer.Enabled := True;
      if P.X > ClientWidth - 5 then
        FDragTimer.Enabled := True;
      if Accept then
        FDragImages.DragMove(P.X, P.Y)
      else
        FDragImages.DragMove(-200, -200);
    end
  else
    inherited;
end;

procedure TExDBGrid.DragCanceled;
begin
  inherited;
end;

procedure TExDBGrid.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  if FCustomColMove then
    begin
      FCustomColMove := False;
      FDragImages.EndDrag;
      FDragImages.DragUnlock;
      FDragTimer.Enabled := False;
      DragCursor := crDefault;
    end;
  inherited DoEndDrag(Target, X, Y);
end;

procedure TExDBGrid.DoStartDrag(var DragObject: TDragObject);
var
  R: TRect;
begin
  inherited DoStartDrag(DragObject);
  if FCustomColMove then
    begin
      DragCursor := -1;
      CreateDragImage(FColMove);
      FDragImages.SetDragImage(0, 0, 0);
      FDragImages.DragLock(Handle, -100, -100);
      FDragImages.BeginDrag(Handle, -100, -100);
      R.TopLeft := ClientToScreen(Point(MaxFixed, 0));
      R.BottomRight := ClientToScreen(Point(ClientWidth - 1, RowHeights[0]));
    end;
end;

procedure TExDBGrid.SetMaskedColumnDrag(Value: Boolean);
begin
  FDragImages.Masked := Value;
end;

function TExDBGrid.GetMaskedColumnDrag: Boolean;
begin
  Result := FDragImages.Masked;
end;

procedure TExDBGrid.DragTimerTimer(Sender: Tobject);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  FDragImages.HideDragImage;
  try
    if P.X < CellRect(LeftCol, 0).Left - 5 then
      Perform(WM_HSCROLL, SB_LINELEFT, 0)
    else
      if P.X > ClientWidth - 5 then
        Perform(WM_HSCROLL, SB_LINERIGHT, 0)
      else
        FDragTimer.Enabled := False;
  finally
    FDragImages.ShowDragImage;
  end;
end;

procedure TExDBGrid.TopLeftChanged;
begin
  inherited;

  {$IFDEF EX_COMPILER_4_UP}
  SendFooterMsg(FTR_SCROLL);
  {$ENDIF}
end;

procedure TExDBGrid.DoStartCellChanged;
begin
  if Assigned(FOnStartCellChanged) then
    FOnStartCellChanged(Self);
end;

procedure TExDBGrid.DoEndCellChanged;
begin
  if Assigned(FOnEndCellChanged) then
    FOnEndCellChanged(Self);
end;

{ END PROTECTED }

{ BEGIN PUBLIC }

function TExDBGrid.CellRect(ACol, ARow: Longint): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

procedure TExDBGrid.Invalidate;
begin
  if (FCurrentControl <> nil) and (DataLink <> nil) and (DataLink.Active) and not (DataLink.DataSet.State in [dsEdit, dsInsert]) then
    HideCurrentControl;

  if FRowSizingAllowed and not (goRowSizing in TDrawGrid(Self).Options) then
    TDrawGrid(Self).Options := TDrawGrid(Self).Options + [goRowSizing];

  inherited;
end;

{$IFDEF BDE}

procedure TExDBGrid.MoveToRow(NewRow: Integer);
var
  Mark: TBookmarkStr;
begin
  Mark := DataLink.DataSet.Bookmark;
  DataLink.ActiveRecord := NewRow;
  DataLink.DataSet.Bookmark := Mark;
  //DbiSetToBookmark(TDBDataSet(DataLink.DataSet).Handle, Pointer(Mark));
  DataLink.DataSet.Resync([rmExact]);
end;
{$ENDIF}

procedure TExDBGrid.WMHScroll(var Msg: TWMHScroll);
begin
  BeginUpdate;

  {if FExtendedScroll then
     begin
        try
           if Msg.ScrollCode = sb_ThumbTrack then
              Perform(wm_HScroll, MakeLong(sb_ThumbPosition, Msg.Pos), Msg.ScrollBar);
        except
        end;
     end;}

  inherited;

  if FUseBackgroundPicture then
    Invalidate;

  EndUpdate;
end;

procedure TExDBGrid.WMVScroll(var Msg: TWMVScroll);
var
  SHintText: string;
  SHintPoint: TPoint;
  SRHint: TRect;
begin
  BeginUpdate;

  {if FExtendedScroll then
     begin
        try
           if Msg.ScrollCode = sb_ThumbTrack then
              Perform(wm_VScroll, MakeLong(sb_ThumbPosition, Msg.Pos), Msg.ScrollBar);
        except
        end;
     end;}

  inherited;

  if not (csDesigning in ComponentState) then
    begin
      if FScrollHints and (not (DataLink.DataSource.State = dsInactive)) and Assigned(DataLink.DataSource) then
        begin
          FScrollHintWnd.ReleaseHandle;

          SHintText := ' ' + IntToStr(DataLink.DataSource.DataSet.RecNo) + ' of ' +
            IntToStr(DataLink.DataSource.DataSet.RecordCount) + ' ';

          GetCursorPos(SHintPoint);

          SRHint := FScrollHintWnd.CalcHintRect(100, SHintText, nil);

          OffsetRect(SRHint, SHintPoint.x + GetSystemMetrics(SM_CXCURSOR) div 2,
            SHintPoint.y + GetSystemMetrics(SM_CYCURSOR) div 2);

          if (GetKeystate(VK_LBUTTON) and $80) = $80 then
            FScrollHintWnd.ActivateHint(SRHint, SHintText)
          else
            FScrollHintWnd.ReleaseHandle;
        end;
    end;

  EndUpdate;
end;

procedure TExDBGrid.CMMouseEnter(var Msg: TMessage);
begin
  if not FEnableCellRangeSelect then
    if FHotTrack = True then
      begin
        Font.Color := FHotTrackColor;
      end;
end;

procedure TExDBGrid.CMMouseLeave(var Msg: TMessage);
begin
  inherited;

  if not FEnableCellRangeSelect then
    begin
      if FCellHints and Assigned(FHintWnd) then
        FHintWnd.ReleaseHandle;

      if FHotTrack = True then
        begin
          Font.Color := FOrigColor;
        end;

      if FCustomColMove then
        FDragImages.DragMove(-200, -200);
    end;
end;

procedure TExDBGrid.WMMouseMove(var Msg: TWMMouseMove);
begin
  inherited;

  if not FEnableCellRangeSelect then
    if FCellHints = True then
      begin
        if (Msg.XPos <> FLastXPos) or (Msg.YPos <> FLastYPos) then
          begin
            FLastXPos := Msg.XPos;
            FLastYPos := Msg.YPos;
            DoHint(Msg.XPos, Msg.YPos);
          end;
      end;
end;

procedure TExDBGrid.OnKeyDBMemo(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      if MemoInplaceEditor = Memo then
        begin
          with DBMemo do
            begin
              Visible := False;
              if TExDBGrid(Self).DataSource.DataSet.State = dsEdit then
                TExDBGrid(Self).DataSource.DataSet.Cancel;
              DataSource := nil;
              DataField := '';
              if not Self.Focused then
                Self.SetFocus;
            end;
        end
      else
        begin
          with DBRichEdit do
            begin
              Visible := False;
              if TExDBGrid(Self).DataSource.DataSet.State = dsEdit then
                TExDBGrid(Self).DataSource.DataSet.Cancel;
              DataSource := nil;
              DataField := '';
              if not Self.Focused then
                Self.SetFocus;
            end;
        end;
    end;
end;

procedure TExDBGrid.OnKeyDateTimePicker(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_TAB, VK_RETURN:
      begin
        with DateTimePicker do
          begin
            Key := 0;
            Visible := False;
            {$IFDEF BDE}
            if (TExDBGrid(Self).DataSource.DataSet is TTable) then
              begin
                if (TTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end
            else
              if (TExDBGrid(Self).DataSource.DataSet is TQuery) then
                begin
                  if (TQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
                    begin
                      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                        if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                          TExDBGrid(Self).DataSource.DataSet.Edit;
                    end;
                end;
            {$ENDIF}
            {$IFDEF ADS}
            if (TExDBGrid(Self).DataSource.DataSet is TAdsTable) then
              begin
                if (TAdsTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end
            else
              if (TExDBGrid(Self).DataSource.DataSet is TAdsQuery) then
                begin
                  if (TAdsQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
                    begin
                      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                        if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                          TExDBGrid(Self).DataSource.DataSet.Edit;
                    end;
                end;
            {$ENDIF}
            {$IFDEF ADO}
            if (TExDBGrid(Self).DataSource.DataSet is TADOTable) then
              begin
                if (TADOTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end
            else
              if (TExDBGrid(Self).DataSource.DataSet is TADOQuery) then
                begin
                  if (TADOQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
                    begin
                      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                        if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                          TExDBGrid(Self).DataSource.DataSet.Edit;
                    end;
                end;
            {$ENDIF}
            {$IFDEF DAO}
            if (TExDBGrid(Self).DataSource.DataSet is TDAOTable) then
              begin
                if not (TDAOTable(TExDBGrid(Self).DataSource.DataSet).Parameters = [db_ReadOnly]) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end
            else
              if (TExDBGrid(Self).DataSource.DataSet is TDAOQuery) or (TExDBGrid(Self).DataSource.DataSet is TDAOQueryDef) then
                begin
                  if (TDAOQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) or (TDAOQueryDef(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
                    begin
                      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                        if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                          TExDBGrid(Self).DataSource.DataSet.Edit;
                    end;
                end;
            {$ENDIF}
            {$IFDEF IBX}
            if (TExDBGrid(Self).DataSource.DataSet is TIBTable) then
              begin
                if (TIBTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end
            else
              if (TExDBGrid(Self).DataSource.DataSet is TIBQuery) then
                begin
                  if (TIBQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
                    begin
                      if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
                        if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                          TExDBGrid(Self).DataSource.DataSet.Edit;
                    end;
                end;
            {$ENDIF}
            {$IFDEF CDS}
            if (TExDBGrid(Self).DataSource.DataSet is TClientDataSet) then
              begin
                if (TClientDataSet(TExDBGrid(Self).DataSource.DataSet).CanModify) then
                  begin
                    if not ReadOnly and DataLink.Active and not DataLink.Readonly then
                      if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                        TExDBGrid(Self).DataSource.DataSet.Edit;
                  end;
              end;
            {$ENDIF}
            Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
            TExDBGrid(Self).DataSource.DataSet.Post;
            if not Self.Focused then
              Self.SetFocus;
          end;
      end;

    VK_ESCAPE:
      begin
        with DateTimePicker do
          begin
            Visible := False;
            if TExDBGrid(Self).DataSource.DataSet.State = dsEdit then
              TExDBGrid(Self).DataSource.DataSet.Cancel;
            if not Self.Focused then
              Self.SetFocus;
          end;
      end;
  end;
end;

procedure TExDBGrid.OnChangeDateTimePicker(Sender: TObject);
begin
  {$IFDEF BDE}
  if (TExDBGrid(Self).DataSource.DataSet is TTable) then
    begin
      if (TTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end
  else
    if (TExDBGrid(Self).DataSource.DataSet is TQuery) then
      begin
        if (TQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                  begin
                    TExDBGrid(Self).DataSource.DataSet.Edit;
                    Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                  end;
          end;
      end;
  {$ENDIF}
  {$IFDEF ADS}
  if (TExDBGrid(Self).DataSource.DataSet is TAdsTable) then
    begin
      if (TAdsTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end
  else
    if (TExDBGrid(Self).DataSource.DataSet is TAdsQuery) then
      begin
        if (TAdsQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                  begin
                    TExDBGrid(Self).DataSource.DataSet.Edit;
                    Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                  end;
          end;
      end;
  {$ENDIF}
  {$IFDEF ADO}
  if (TExDBGrid(Self).DataSource.DataSet is TADOTable) then
    begin
      if (TADOTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end
  else
    if (TExDBGrid(Self).DataSource.DataSet is TADOQuery) then
      begin
        if (TADOQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                  begin
                    TExDBGrid(Self).DataSource.DataSet.Edit;
                    Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                  end;
          end;
      end;
  {$ENDIF}
  {$IFDEF DAO}
  if (TExDBGrid(Self).DataSource.DataSet is TDAOTable) then
    begin
      if not (TDAOTable(TExDBGrid(Self).DataSource.DataSet).Parameters = [db_ReadOnly]) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end
  else
    if (TExDBGrid(Self).DataSource.DataSet is TDAOQuery) or (TExDBGrid(Self).DataSource.DataSet is TDAOQueryDef) then
      begin
        if (TDAOQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) or (TDAOQueryDef(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                  begin
                    TExDBGrid(Self).DataSource.DataSet.Edit;
                    Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                  end;
          end;
      end;
  {$ENDIF}
  {$IFDEF IBX}
  if (TExDBGrid(Self).DataSource.DataSet is TIBTable) then
    begin
      if (TIBTable(TExDBGrid(Self).DataSource.DataSet).ReadOnly = False) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end
  else
    if (TExDBGrid(Self).DataSource.DataSet is TIBQuery) then
      begin
        if (TIBQuery(TExDBGrid(Self).DataSource.DataSet).CanModify = True) then
          begin
            if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
                if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                  begin
                    TExDBGrid(Self).DataSource.DataSet.Edit;
                    Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                  end;
          end;
      end;
  {$ENDIF}
  {$IFDEF CDS}
  if (TExDBGrid(Self).DataSource.DataSet is TClientDataSet) then
    begin
      if (TClientDataSet(TExDBGrid(Self).DataSource.DataSet).CanModify) then
        begin
          if not ReadOnly and DataLink.Active and not DataLink.Readonly then
            if TExDBGrid(Self).DataSource.DataSet.State <> dsInsert then
              if TExDBGrid(Self).DataSource.DataSet.State <> dsEdit then
                begin
                  TExDBGrid(Self).DataSource.DataSet.Edit;
                  Columns[SelectedIndex].Field.AsDateTime := DateTimePicker.Date;
                end;
        end;
    end;
  {$ENDIF}
end;

procedure TExDBGrid.OnKeyEditUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (TExDBGrid(Self).DataSource <> nil) and (TExDBGrid(Self).DataSource.DataSet <> nil) then
    begin
      {$IFDEF BDE}
      if TExDBGrid(Self).DataSource.DataSet is TTable then
        begin
          with TTable(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                begin
                  try
                    FindNearest([FSearchEdit.Text]);
                  except
                    Locate(Columns[SelectedIndex].FieldName, FSearchEdit.Text, [loCaseInsensitive, loPartialKey]);
                  end;
                end;
            end;
        end;
      {$ENDIF}
      {$IFDEF ADS}
      if TExDBGrid(Self).DataSource.DataSet is TAdsTable then
        begin
          with TAdsTable(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                begin
                  try
                    FindNearest([FSearchEdit.Text]);
                  except
                    Locate(Columns[SelectedIndex].FieldName, FSearchEdit.Text, [loCaseInsensitive, loPartialKey]);
                  end;
                end;
            end;
        end;
      {$ENDIF}
      {$IFDEF ADO}
      if TExDBGrid(Self).DataSource.DataSet is TADOTable then
        begin
          with TADOTable(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                Locate(Columns[SelectedIndex].FieldName, FSearchEdit.Text, [loCaseInsensitive, loPartialKey]);
            end;
        end;
      {$ENDIF}
      {$IFDEF DAO}
      if TExDBGrid(Self).DataSource.DataSet is TDAOTable then
        begin
          with TDAOTable(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                FindNearest([FSearchEdit.Text]);
            end;
        end;
      {$ENDIF}
      {$IFDEF IBX}
      if TExDBGrid(Self).DataSource.DataSet is TIBTable then
        begin
          with TIBTable(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                Locate(Columns[SelectedIndex].FieldName, FSearchEdit.Text, [loCaseInsensitive, loPartialKey]);
            end;
        end;
      {$ENDIF}
      {$IFDEF CDS}
      if TExDBGrid(Self).DataSource.DataSet is TClientDataSet then
        begin
          with TClientDataSet(TExDBGrid(Self).DataSource.DataSet) do
            begin
              if FSearchEdit.Text <> '' then
                begin
                  try
                    FindNearest([FSearchEdit.Text]);
                  except
                    Locate(Columns[SelectedIndex].FieldName, FSearchEdit.Text, [loCaseInsensitive, loPartialKey]);
                  end;
                end;
            end;
        end;
      {$ENDIF}
    end;
end;

procedure TExDBGrid.OnKeyEditDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (Key = VK_RETURN) then
    with FSearchEdit do
      begin
        Key := 0;
        Visible := False;
        if not Self.Focused then
          Self.SetFocus;
      end;
end;

procedure TExDBGrid.OnDBExit(Sender: TObject);
begin
  if MemoInplaceEditor = Memo then
    begin
      if DBMemo.Visible then
        begin
          with DBMemo do
            begin
              Visible := False;
              DataSource := nil;
              DataField := '';
              if not Self.Focused then
                Self.SetFocus;
            end;
        end;
    end
  else
    begin
      if DBRichEdit.Visible then
        begin
          with DBRichEdit do
            begin
              Visible := False;
              DataSource := nil;
              DataField := '';
              if not Self.Focused then
                Self.SetFocus;
            end;
        end;
    end;
end;

procedure TExDBGrid.OnDTPExit(Sender: TObject);
begin
  if DateTimePicker.Visible then
    begin
      with DateTimePicker do
        begin
          Visible := False;
          if TExDBGrid(Self).DataSource.DataSet.State = dsEdit then
            TExDBGrid(Self).DataSource.DataSet.Cancel;
          if not Self.Focused then
            Self.SetFocus;
        end;
    end;
end;

procedure TExDBGrid.OnKeyEditExit(Sender: TObject);
begin
  if FSearchEdit.Visible then
    begin
      with FSearchEdit do
        begin
          Visible := False;
          if not Self.Focused then
            Self.SetFocus;
        end;
    end;
end;

procedure TExDBGrid.ExportGrid(ExpFileName: string);
begin
  if ExpFileName = '' then
    ExpFileName := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + 'DataExport.Dat';

  if FExportDelimiter = Pipe then
    ExportToFile(ExpFileName, '|')
  else
    if FExportDelimiter = Comma then
      ExportToFile(ExpFileName, ',')
    else
      if FExportDelimiter = Quote then
        ExportToFile(ExpFileName, '"');

  MessageDlg('Exported To File: ' + ExpFileName, mtInformation, [mbOk], 0);
end;

procedure TExDBGrid.ExportToFile(ExpFileName: string; Delimiter: Char);
var
  slst: TStringList;
  strRow: string;
  j: Integer;
begin
  DataLink.DataSet.DisableControls;
  DataLink.DataSet.First;

  slst := TStringList.Create;
  try
    while not DataLink.DataSet.EOF do
      begin
        strRow := '';
        if dgIndicator in Options then
          begin
            for j := 0 to ColCount - 2 do
              if strRow = '' then
                begin
                  strRow := TExDBGrid(Self).Columns[j].Field.DisplayText;
                end
              else
                begin
                  strRow := strRow + Delimiter + TExDBGrid(Self).Columns[j].Field.DisplayText;
                end;
            slst.Add(strRow);
          end
        else
          begin
            for j := 0 to ColCount - 1 do
              if strRow = '' then
                begin
                  strRow := TExDBGrid(Self).Columns[j].Field.DisplayText;
                end
              else
                begin
                  strRow := strRow + Delimiter + TExDBGrid(Self).Columns[j].Field.DisplayText;
                end;
            slst.Add(strRow);
          end;
        DataLink.DataSet.Next;
      end;

    if (ExpFileName <> '') then
      slst.SaveToFile(ExpFileName);
  finally
    slst.Free;
  end;

  DataLink.DataSet.First;
  DataLink.DataSet.EnableControls;
end;

procedure TExDBGrid.GridPreview;
begin
  {$IFDEF USER_QREPORT}
  if ReportCaption <> '' then
    ShowReportByGrid(TExDBGrid(Self), ReportCaption, paPreview)
  else
    ShowReportByGrid(TExDBGrid(Self), 'Data Printout', paPreview);
  {$ENDIF}
end;

procedure TExDBGrid.DataSetPreview;
begin
  {$IFDEF USER_QREPORT}
  if ReportCaption <> '' then
    ShowReportByDataSet(TExDBGrid(Self).DataSource.DataSet, ReportCaption, paPreview)
  else
    ShowReportByDataSet(TExDBGrid(Self).DataSource.DataSet, 'Data Printout', paPreview);
  {$ENDIF}
end;

procedure TExDBGrid.GridPrint;
begin
  {$IFDEF USER_QREPORT}
  if ReportCaption <> '' then
    ShowReportByGrid(TExDBGrid(Self), ReportCaption, paPrint)
  else
    ShowReportByGrid(TExDBGrid(Self), 'Data Printout', paPrint);
  {$ENDIF}
end;

procedure TExDBGrid.DataSetPrint;
begin
  {$IFDEF USER_QREPORT}
  if ReportCaption <> '' then
    ShowReportByDataSet(TExDBGrid(Self).DataSource.DataSet, ReportCaption, paPrint)
  else
    ShowReportByDataSet(TExDBGrid(Self).DataSource.DataSet, 'Data Printout', paPrint);
  {$ENDIF}
end;

procedure TExDBGrid.SaveToRegistry;
var
  TempReg: TRegistry;
  I: Integer;
  RegStr: string;
begin
  (*   TempReg := TRegistry.Create;
     try
        TempReg.RootKey := HKEY_CURRENT_USER;

        if RegistrySaveName = '' then
           RegistrySaveName := 'ExDBGrid';

        TempReg.OpenKey('\Software\' + RegistrySaveName, True);

        for I := 0 to Columns.Count - 1 do
           begin
              TempReg.WriteString('Column' + IntToStr(I), DataLink.DataSource.DataSet.Fields[I].FieldName + ',' + IntToStr(Columns.Items[I].Width));
           end;

        for i := Columns.Count to 100 do
           TempReg.DeleteValue('Column' + IntToStr(I));
     finally
        TempReg.Free;
     end;*)

  TempReg := TRegistry.Create;
  try
    TempReg.RootKey := HKEY_CURRENT_USER;

    if RegistrySaveName = '' then
      RegistrySaveName := 'ExDBGrid';

    TempReg.OpenKey('\Software\' + RegistrySaveName, True);

    for I := 0 to Columns.Count - 1 do
      begin
        if DataLink.DataSource.DataSet.Fields[I].Visible then
          RegStr := 'True|'
        else
          RegStr := 'False|';

        TempReg.WriteString('Column' + IntToStr(I), RegStr + DataLink.DataSource.DataSet.Fields[I].FieldName + ',' + IntToStr(Columns.Items[I].Width));
      end;

    for i := Columns.Count to 100 do
      TempReg.DeleteValue('Column' + IntToStr(I));
  finally
    TempReg.Free;
  end;
end;

procedure TExDBGrid.LoadFromRegistry;
var
  TempReg: TRegistry;
  I: Integer;
  RegString: string;
  TheField: TField;
  PosComma: Integer;
  PosPipe: Integer;
  TheFieldName: string;
  TheFieldWidth: Integer;
  TheFieldVisible: string;
begin
  (*TempReg := TRegistry.Create;
  try
     if FGridAutoSize then
        FGridAutoSize := False;

     if FGridAutoWidth <> awNone then
        FGridAutoWidth := awNone;

     TempReg.RootKey := HKEY_CURRENT_USER;

     if RegistrySaveName = '' then
        RegistrySaveName := 'ExDBGrid';

     if not TempReg.OpenKey('\Software\' + RegistrySaveName, False) then
        exit;

     for i := 0 to DataLink.DataSource.DataSet.FieldCount - 1 do
        DataLink.DataSource.DataSet.Fields[i].Visible := False;
     i := 0;
     repeat
        RegString := TempReg.ReadString('Column' + IntToStr(I));
        PosComma := pos(',', RegString);
        if PosComma > 0 then
           begin
              TheFieldName := Copy(RegString, 1, PosComma - 1);
              TheFieldWidth := StrToInt(copy(RegString, PosComma + 1, 20));
              if TheFieldName > '' then
                 begin
                    TheField := DataLink.DataSource.DataSet.FindField(TheFieldName);
                    if TheField <> nil then
                       begin
                          TheField.Index := I;
                          TheField.Visible := True;
                          Columns.Items[I].Width := TheFieldWidth;
                       end;
                 end;
           end;
        inc(i);
        RegString := TempReg.ReadString('Column' + IntToStr(I));
     until RegString = '';
  finally
     TempReg.Free;
  end;*)

  TempReg := TRegistry.Create;
  try
    if FGridAutoSize then
      FGridAutoSize := False;

    if FGridAutoWidth <> awNone then
      FGridAutoWidth := awNone;

    TempReg.RootKey := HKEY_CURRENT_USER;

    if RegistrySaveName = '' then
      RegistrySaveName := 'ExDBGrid';

    if not TempReg.OpenKey('\Software\' + RegistrySaveName, False) then
      exit;

    for i := 0 to DataLink.DataSource.Dataset.FieldCount - 1 do
      DataLink.DataSource.Dataset.Fields[i].Visible := False;
    i := 0;
    repeat
      RegString := TempReg.ReadString('Column' + IntToStr(I));
      PosComma := pos(',', RegString);
      PosPipe := pos('|', RegString);
      if (PosComma > 0) and (PosPipe > 0) then
        begin
          TheFieldVisible := Copy(RegString, 1, PosPipe - 1);
          TheFieldName := Copy(RegString, PosPipe + 1, PosComma - (PosPipe + 1));
          TheFieldWidth := StrToInt(copy(RegString, PosComma + 1, 20));
          if TheFieldName > '' then
            begin
              TheField := DataLink.DataSource.Dataset.FindField(TheFieldName);
              if TheField <> nil then
                begin
                  TheField.Index := I;
                  TheField.Visible := TheFieldVisible = 'True';
                  if TheField.Visible then
                    Columns.Items[Columns.Count - 1].Width := TheFieldWidth;
                  {If a previous column is not visible then using [I]
                  causes a index out of bounds as the column has not
                  been created, but as they are all being created in
                  order if it is visible we can safely asssume it is
                  the last column we are dealing with ... }
                end;
            end;
        end
      else {Using Old Registry Entries}
        if (PosComma > 0) then
          begin
            TheFieldName := Copy(RegString, 1, PosComma - 1);
            TheFieldWidth := StrToInt(copy(RegString, PosComma + 1, 20));
            if TheFieldName > '' then
              begin
                TheField := DataLink.DataSource.Dataset.FindField(TheFieldName);
                if TheField <> nil then
                  begin
                    TheField.Index := I;
                    TheField.Visible := True;
                    Columns.Items[I].Width := TheFieldWidth;
                  end;
              end;
          end;
      inc(i);
      RegString := TempReg.ReadString('Column' + IntToStr(I));
    until RegString = '';
  finally
    TempReg.Free;
  end;
end;

procedure TExDBGrid.CopyToClipboard;
var
  Field: TField;
  Picture: TPicture;
  Stream: TStream;
begin
  if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
    begin
      Field := SelectedField;

      if not Assigned(Field) then
        exit;
      if Field.IsNull then
        exit;

      if EditorMode then
        InplaceEditor.CopyToClipboard
      else
        begin
          if Field.DataType in TextPasteFields then
            Clipboard.AsText := Field.AsString
          else
            if Field.DataType = ftGraphic then
              begin
                Picture := TPicture.Create;
                try
                  try
                    Picture.Assign(Field);
                    Clipboard.Assign(Picture);
                  except
                    Stream := nil;
                    try
                      Stream := TMemoryStream.Create;
                      TGraphicField(Field).SaveToStream(Stream);
                      Stream.Seek(0, 0);
                      Picture.Graphic.LoadFromStream(Stream);
                      Clipboard.Assign(Picture);
                    finally
                      Stream.Free;

                    end;
                  end;
                finally
                  Picture.Free;
                end;
              end;
        end;
    end;
end;

procedure TExDBGrid.CutToClipboard;
var
  Field: TField;
  Picture: TPicture;
  Stream: TStream;
begin
  if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
    begin
      Field := SelectedField;

      if not Assigned(Field) then
        exit;
      if Field.IsNull then
        exit;

      if EditorMode then
        InplaceEditor.CutToClipboard
      else
        begin
          if Field.DataType in TextPasteFields then
            begin
              Clipboard.AsText := Field.AsString;
              Field.Clear;
            end
          else
            if Field.DataType = ftGraphic then
              begin
                Picture := TPicture.Create;
                try
                  try
                    Picture.Assign(Field);
                    Clipboard.Assign(Picture);
                  except
                    Stream := nil;
                    try
                      Stream := TMemoryStream.Create;
                      TGraphicField(Field).SaveToStream(Stream);
                      Stream.Seek(0, 0);
                      Picture.Graphic.LoadFromStream(Stream);
                      Clipboard.Assign(Picture);
                    finally
                      Stream.Free;

                    end;
                  end;
                finally
                  Picture.Free;
                end;
                Field.Clear;
              end;
        end;
    end;
end;

procedure TExDBGrid.PasteFromClipboard;
var
  Field: TField;
  Bitmap: TBitmap;
  Stream: TStream;
begin
  if not ReadOnly and DataLink.Active and not DataLink.ReadOnly and DataLink.DataSet.CanModify then
    begin
      Field := SelectedField;

      if not Assigned(Field) then
        exit;

      if EditorMode then
        InplaceEditor.PasteFromClipboard
      else
        begin
          if Field.DataType in TextPasteFields then
            Field.AsString := Clipboard.AsText
          else
            if Field.DataType = ftGraphic then
              begin
                if not Clipboard.HasFormat(CF_BITMAP) then
                  exit;
                Stream := nil;
                Bitmap := TBitmap.Create;
                try
                  Stream := TMemoryStream.Create;
                  Bitmap.Assign(Clipboard);
                  Bitmap.SaveToStream(Stream);
                  Stream.Seek(0, 0);
                  TGraphicField(Field).LoadFromStream(Stream);
                finally
                  Bitmap.Free;
                  Stream.Free;
                end;
              end;
        end;
    end;
end;

procedure TExDBGrid.ShowCustomizeDialog;
var
  Res: Integer;
begin
  Application.CreateForm(TExColSelectFrm, ExColSelectFrm);
  try
    ExColSelectFrm.ExDBGrid := TExDBGrid(Self);
    ExColSelectFrm.DataSource := DataLink.DataSource;
    Res := ExColSelectFrm.ShowModal;
  finally
    ExColSelectFrm.Release;
  end;

  if FGridAutoSize then
    SetGridAutoSize(FGridAutoSize);

  if FGridAutoWidth <> awNone then
    SetGridAutoWidth(FGridAutoWidth);

  ColEnter;

  Invalidate;

  if (Res = mrOK) and (Assigned(FOnCustomize)) then
    FOnCustomize(Self);
end;

procedure TExDBGrid.ShowQueryByForm;
begin
  Application.CreateForm(TdlgExDBQbf, dlgExDBQbf);
  QueryByForm(TDBGrid(TExDBGrid(Self)));
  dlgExDBQbf.Release;
end;

procedure TExDBGrid.ShowSortByForm;
begin
  Application.CreateForm(TdlgExDBQbf, dlgExDBQbf);
  SortByForm(TDBGrid(TExDBGrid(Self)));
  dlgExDBQbf.Release;
end;

procedure TExDBGrid.DragDrop(Source: TObject; X, Y: Integer);
var
  Cell: TGridCoord;
  ACol, ARow: LongInt;
begin
  if (FCustomColMove) then
    begin
      ACol := Col;
      ARow := Row;
      Cell := MouseCoord(X, 0);
      if (Cell.X < 0) then
        Cell.X := ColCount - 1
      else
        if (Cell.X = 0) and (dgIndicator in Options) then
          begin
            Cell.X := FixedCols;
            Repaint;
          end;

      MoveColumn(FColMove, Cell.X);
      SetFixedColumns;
      if ACol <> FColMove then
        Col := ACol
      else
        Col := Cell.X;
      Row := ARow;
      InvalidateEditor;
      UpdateDesigner;
    end
  else
    inherited;
end;

{$IFDEF EX_COMPILER_4_UP}

procedure TExDBGrid.RegisterFooter(Footer: TWinControl);
begin
  if Footer is TExDBFooter then
    begin
      FFooter := TExDBFooter(Footer);
      if (DataSource <> nil) and (DataSource.DataSet <> nil) and DataSource.DataSet.Active then
        TExDBFooter(FFooter).FooterMessage(FTR_ACTIVE);
    end
  else
    FFooter := nil;
end;

procedure TExDBGrid.UnregisterFooter(Footer: TWinControl);
begin
  FFooter := nil;
end;

procedure TExDBGrid.SendFooterMsg(Msg: Integer);
begin
  if FFooter <> nil then
    TExDBFooter(FFooter).FooterMessage(Msg);
end;

procedure TExDBGrid.SaveGridPosition;
begin
  FSavedBookmark := DataLink.DataSet.Bookmark;
  FSavedRowPos := DataLink.ActiveRecord;
end;

procedure TExDBGrid.RestoreGridPosition;
var
  Bookmark: TBookmark;
begin
  {$IFDEF ADO}
  if DataLink.DataSet is TCustomADODataSet then
    begin
      DataLink.ActiveRecord := FSavedRowPos;
      BookMark := Pointer(FSavedBookmark);
      if DataLink.DataSet.BookmarkValid(Bookmark) then
        TCustomADODataSet(DataLink.DataSet).Recordset.Bookmark := POleVariant(Bookmark)^;
    end
  else
    {$ENDIF}
    {$IFDEF BDE}
    if DataLink.DataSet is TBDEDataSet then
      begin
        DataLink.ActiveRecord := FSavedRowPos;
        BookMark := Pointer(FSavedBookmark);
        if DataLink.DataSet.BookmarkValid(Bookmark) then
          Check(DbiSetToBookmark(TBDEDataSet(DataLink.DataSet).Handle, Bookmark));
      end
    else
      {$ENDIF}
      begin
        Application.MessageBox(lsDSNotSupportedByFooter, lsError, MB_ICONSTOP);
        Exit;
      end;
  try
    DataLink.DataSet.Resync([rmExact]);
  except
  end;
end;
{$ENDIF}

procedure TExDBGrid.RefreshGridRect(ARect: TGridRect);
var
  Rect: TRect;
begin
  if not HandleAllocated then
    Exit;
  ARect := NormalizeGridRect(ARect);
  Rect := BoxRect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
  InvalidateRect(Handle, @Rect, False);
end;

{ END PUBLIC }

destructor TExDBGrid.Destroy;
begin
  HideCurrentControl;

  FControls.Free;

  FHintWnd.Free;

  FDragImages.Free;

  FExDBGridPopUpMenu.Free;

  FLockedFont.Free;
  FLockedFont := nil;

  if Assigned(FSearchEdit) then
    begin
      FSearchEdit.Free;
      FSearchEdit := nil;
    end;

  if Assigned(BkBmp) then
    begin
      BkBmp.Free;
      BkBmp := nil;
    end;

  if Assigned(FBackGroundPicture) then
    begin
      FBackGroundPicture.Free;
      FBackGroundPicture := nil;
    end;

  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('GJL Software', [TExDBGrid]);
end;

end.

