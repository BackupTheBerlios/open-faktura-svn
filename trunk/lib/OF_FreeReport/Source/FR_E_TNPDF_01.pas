unit FR_E_TNPDF;

interface

{$I FR.inc}

uses
SysUtils, Windows, Messages, Classes, Graphics, Forms, StdCtrls, FR_BarC,
FR_Class, PdfDoc, PdfTypes, PdfFonts, PReport, Dialogs, Controls, ZLibEx;

type
// TfrTNPDFExport = class(TComponent) // fake component
// end;

TfrTNPDFExportFilter = class(TfrExportFilter)
private
NewPage: Boolean;
PDF: TPReport;
PPage: TPRPage;
PRPanel: TPRPanel;
FOutline: TPROutLineEntry;
FPageNo : Integer;
DummyControl: TForm;
public
//constructor Create(AStream: TStream); override;
constructor Create(AOwner: TComponent); override;
destructor Destroy; override;
procedure OnBeginPage; override;
procedure OnEndPage; override;
procedure ShowBackGround(View: TfrView; x, y, h, w: integer);
procedure Frame(View: TfrView; x, y, h, w: integer);
procedure ShowFrame(View: TfrView; x, y, h, w: integer);
procedure ShowBarCode(View: TfrBarCodeView; x, y, h, w: integer);
procedure ShowPicture(View: TfrPictureView; x, y, h, w: integer);
//procedure OnText(X, Y: Integer; const Text: string; View: TfrView); override;
procedure OnText(DrawRect: TRect; x, y: Integer; const text: String; FrameTyp: Integer; View: TfrView); override;
procedure OnData(x, y: Integer; View: TfrView); override;
end;

implementation

uses FR_Const;

type
TfrMemoView_ = class(TfrMemoView);
TPRText_ = class(TPRText);

const
PDFEscx = 0.8;
PDFEscy = 0.8;

constructor TfrTNPDFExportFilter.Create(AStream: TStream);
//constructor TfrTNPDFExportFilter.Create(AOwner: TComponent);
begin
  //inherited Create(AOwner);
  inherited Create(AStream);
frRegisterExportFilter(Self, 'Adobe Acrobat PDF ' + ' (*.pdf)', '*.pdf');
PDF := TPReport.Create(nil);
PDF.CompressionMethod := cmFlateDecode;
PDF.UseOutlines := True;
PDF.PageLayout := plOneColumn;
PDF.BeginDoc;
DummyControl := TForm.Create(nil);
NewPage := False;
FPageNo := 0;
end;

destructor TfrTNPDFExportFilter.Destroy;
begin
PDF.GetPdfDoc.SaveToStream(Stream);
PDF.Free;
DummyControl.Free;
FreeAndNil(DummyControl);
inherited;
end;

procedure TfrTNPDFExportFilter.OnBeginPage;
begin
{Add New Page}
Inc(FPageNo);

PPage := TPRPage.Create(PDF);
PPage.Parent := DummyControl;
PPage.MarginBottom := 0;
PPage.MarginTop := 0;
PPage.MarginLeft := 0;
PPage.MarginRight := 0;

PPage.Height := trunc(CurReport.EMFPages[FPageNo - 1].PrnInfo.Pgh*PDFEscy);
PPage.Width := trunc(CurReport.EMFPages[FPageNo - 1].PrnInfo.Pgw*PDFEscx);

PRPanel := TPRPanel.Create(PPage);
PRPanel.Parent := PPage;
PRPanel.Left := 0;
PRPanel.Top := 0;
PRPanel.Width := PPage.Width;
PRPanel.Height := PPage.Height;
end;

procedure TfrTNPDFExportFilter.OnEndPage;
begin
PDF.Print(PPage);

FOutline := PDF.OutlineRoot.AddChild;
FOutline.Dest := PDF.CreateDestination;
FOutline.Dest.Top := 0;
FOutline.Title := 'Page ' + IntToStr(FPageNo);

FreeAndNil(PPage);
end;

procedure TfrTNPDFExportFilter.ShowBackGround(View: TfrView; x, y, h, w:
integer);
var
PRRect: TPRRect;
begin
PRRect := TPRRect.Create(PRPanel);
PRRect.Parent := PRPanel;
PRRect.FillColor := View.FillColor;
PRRect.LineColor := clNone;
PRRect.LineStyle := psSolid;
PRRect.Left := x;
PRRect.Top := y;
PRRect.Height := h;
PRRect.Width := w;
end;

procedure TfrTNPDFExportFilter.Frame(View: TfrView; x, y, h, w: integer);
var
PRRect: TPRRect;
begin
PRRect := TPRRect.Create(PRPanel);
PRRect.Parent := PRPanel;
PRRect.FillColor := clNone;

PRRect.Left := x;
PRRect.Top := y;
PRRect.Height := h;
PRRect.Width := w;

PRRect.LineStyle := TPenStyle(View.FrameStyle);
PRRect.LineWidth := View.FrameWidth - 0.5;
PRRect.LineColor := View.FrameColor;
end;

procedure TfrTNPDFExportFilter.ShowFrame(View: TfrView; x, y, h, w: integer);
begin
if ((View.FrameTyp and $F) = $F) and (View.FrameStyle = 0) then
begin
Frame(View, x, y, h, w);
end
else
begin
if (View.FrameTyp and $1) <> 0 then
Frame(View, x + w - 1, y, h, 0); //Right
if (View.FrameTyp and $4) <> 0 then
Frame(View, x, y, h, 0); //Left
if (View.FrameTyp and $2) <> 0 then
Frame(View, x, y + h - 1, 0, w); //Botton
if (View.FrameTyp and $8) <> 0 then
Frame(View, x, y, 0, w); //Top
end;
end;

procedure TfrTNPDFExportFilter.ShowBarCode(View: TfrBarCodeView; x, y, h, w:
integer);
var
Bitmap: TBitmap;
PRImage: TPRImage;
oldX, oldY: Integer;
begin
oldX := View.x;
oldy := View.y;
View.x := 0;
View.y := 0;
Bitmap := TBitmap.Create;
try
PRImage := TPRImage.Create(PRPanel);
PRImage.Parent := PRPanel;
PRImage.Stretch := True;
PRImage.SharedImage := False;
PRImage.Left := x;
PRImage.Top := y;
PRImage.Height := h;
PRImage.Width := w;

Bitmap.Height := View.dy;
Bitmap.Width := View.dx;

TfrBarCodeView(View).Draw(Bitmap.Canvas);

PRImage.Picture.Bitmap := Bitmap;
finally
FreeAndNil(Bitmap);
end;
View.x := oldX;
View.y := oldY;
end;

procedure TfrTNPDFExportFilter.ShowPicture(View: TfrPictureView; x, y, h,
w: integer);
var
Bitmap: TBitmap;
PRImage: TPRImage;
begin
Bitmap := TBitmap.Create;
try
PRImage := TPRImage.Create(PRPanel);
PRImage.Parent := PRPanel;
PRImage.Stretch := True;
PRImage.SharedImage := False;
PRImage.Left := x;
PRImage.Top := y;
PRImage.Height := h;
PRImage.Width := w;
Bitmap.Height := View.Picture.Height;
Bitmap.Width := View.Picture.Width;
Bitmap.Canvas.Draw(0, 0, View.Picture.Graphic);
PRImage.Picture.Bitmap := Bitmap;
finally
FreeAndNil(Bitmap);
end;
end;

procedure TfrTNPDFExportFilter.OnData(x, y: Integer; View: TfrView);
var
nx, ny, ndx, ndy: Integer;
begin
nx := Round(x * PDFEscx);
ny := Round(y * PDFEscy);
ndx := Round((View.dx) * PDFEscx + 1) ;
ndy := Round((View.dy) * PDFEscy + 1) ;

if View.FillColor <> clNone then
ShowBackGround(View, nx, ny, ndy, ndx);

if View is TfrBarCodeView then
ShowBarCode(TfrBarCodeView(View), nx, ny, ndy, ndx)
else if View is TfrPictureView then
ShowPicture(TfrPictureView(View), nx, ny, ndy, ndx);
// For debugging only
// else if not View is TfrMemoView then
// MessageDlg(View.ClassName, mtWarning, [mbOK], 0);

if ((View.FrameTyp and $F) <> 0) and not (View is TfrBarCodeView) then
ShowFrame(View, nx, ny, ndy, ndx);
end;

//procedure TfrTNPDFExportFilter.OnText(X, Y: Integer; const Text: string;
// View: TfrView);
procedure TfrTNPDFExportFilter.OnText(DrawRect: TRect; x, y: Integer;
const text: String; FrameTyp: Integer; View: TfrView);
var
PRTLabel: TPRText;
nx, ny,
ndx, ndy: Integer;
begin
nx := Round(x * PDFEscx) + 1;
ny := Round(y * PDFEscy) + 1;
ndx := Round(View.dx * PDFEscx);
ndy := Round(View.dy * PDFEscy);

PRTLabel := TPRText.Create(PRPanel);
PRTLabel.Parent := PRPanel;
try
PRTLabel.Text := Text;
PRTLabel.Left := nx;
PRTLabel.Top := ny;
PRTLabel.Width := ndx;
PRTLabel.Height := ndy;
if View is TfrMemoView then
begin
if Pos('Arial', TfrMemoView_(View).Font.Name) > 0 then
PRTLabel.FontName := fnArial
else if Pos('Courier', TfrMemoView_(View).Font.Name) > 0 then
PRTLabel.FontName := fnFixedWidth
else if Pos('Times', TfrMemoView_(View).Font.Name) > 0 then
PRTLabel.FontName := fnTimesRoman;
PRTLabel.FontSize := TfrMemoView_(View).Font.Size;
PRTLabel.FontBold := fsBold in TfrMemoView_(View).Font.Style;
PRTLabel.FontItalic := fsItalic in TfrMemoView_(View).Font.Style;
PRTLabel.FontColor := TfrMemoView_(View).Font.Color;
end;

finally
end;
end;

initialization
{
procedure frRegisterExportFilter(Filter: TfrExportFilter;
const FilterDesc, FilterExt: String);
frRegisterExportFilter(TfrTNPDFExportFilter, 'Adobe Acrobat PDF ' + ' (*.pdf)',
'*.pdf');
}
// frRegisterExportFilter(TfrTNPDFExportFilter, 'Adobe Acrobat PDF ' + ' (*.pdf)', '*.pdf');
// RegisterComponents('FastReport', [TfrTNPDFExportFilter]);

end.


