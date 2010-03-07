{
ExDBGrid Component Suite Version 3.9 - TExDateTimePicker

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

unit ExDateTimePicker;

interface

uses
   Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, Stdctrls,
   extctrls, comctrls;

type
   TExDateTimePicker = class(TDateTimePicker)
   private
      FBorderColor: TColor;
      procedure SetBorderColor(const Value: TColor);
   protected
      procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
   published
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property Align;
      property BorderColor: TColor read FBorderColor write SetBorderColor;
   end;

procedure Register;

implementation

constructor TExDateTimePicker.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ControlStyle := ControlStyle + [csOpaque, csSetCaption];
   FBorderColor := clWhite;
end;

procedure TExDateTimePicker.SetBorderColor(const Value: TColor);
begin
   if FBorderColor <> Value then
      begin
         FBorderColor := Value;
         RecreateWnd;
      end;
end;

procedure TExDateTimePicker.WMPaint(var Msg: TWMPaint);
var
   DC: HDC;
   R: TRect;
   ControlCanvas: TControlCanvas;
begin
   inherited;
   DC := GetWindowDC(Handle);
   try
      ControlCanvas := TControlCanvas.Create;
      try
         ControlCanvas.Lock;
         ControlCanvas.Control := Self;
         ControlCanvas.Handle := DC;
         R := Rect(0, 0, Width, Height);
         Frame3D(ControlCanvas, R, FBorderColor, FBorderColor, 2);
         ControlCanvas.Unlock;
      finally
         ControlCanvas.Free;
      end;
   finally
      ReleaseDC(Handle, DC);
   end;
end;

destructor TExDateTimePicker.Destroy;
begin
   inherited Destroy;
end;

procedure Register;
begin
   RegisterComponents('GJL Software', [TExDateTimePicker]);
end;

end.

