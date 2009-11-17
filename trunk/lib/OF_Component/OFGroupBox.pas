{******************************************************************************}
{         Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org          }
{******************************************************************************}
{ PROJEKT      : OpenFaktura                                                   }
{ BESCHREIBUNG : Komponente zur OF-Gruppendatstellung                          }
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
{ 14.10.09-ud.  Namensänderung  TCaoGroupBox -> TOFGroupBox                    }
{               Registernamen geändert CAO-Faktura -> Open-Faktura             }
{                                                                              }
{ Todo:                                                                        }
{ -                                                                            }
{                                                                              }
{ Issues, notes:                                                               }
{ -                                                                            }
{******************************************************************************}

unit OFGroupBox;

{$I OFDelVers.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TOFGroupBox = class(TCustomGroupBox)
  private
    FFrameColor: TColor;
    FTitleColor: TColor;
    procedure SetTitleColor(const Value: TColor);
  protected
    procedure Paint; override;
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure ResizeNew(Sender: TObject);
    procedure SetFrameColor(Value: TColor);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property FrameColor : TColor Read FFrameColor Write SetFrameColor Default clSilver;
    property TitleColor : TColor Read FTitleColor Write SetTitleColor Default clBtnFace;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDockDrop;
    property OnDockOver;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
    //property OnResize;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Open-Faktura', [TOFGroupBox]);
end;

constructor TOFGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnResize := ResizeNew;
  FFrameColor := clSilver;
  FTitleColor := clBtnFace;
end;

procedure TOFGroupBox.SetFrameColor (Value: TColor);
begin
  if Value <> FFrameColor then
  begin
    FFrameColor := Value;
    Invalidate;
  end;
end;

procedure TOFGroupBox.AdjustClientRect(var Rect: TRect);
begin
  inherited AdjustClientRect(Rect);

  //Canvas.Font := Font;
  //Inc(Rect.Top, Canvas.TextHeight('0g')+4);

  inc(Rect.Left, 5);

  inc(Rect.Top, 5);

  dec(Rect.Right, 5);
  dec(Rect.Bottom, 5);

  InflateRect(Rect, -1, -1);
  if not Ctl3d then
    InflateRect(Rect, -1, -1);
end;

procedure TOFGroupBox.Paint;
var
  H: Integer;
  W: Integer;
  R: TRect;
  Flags: Longint;
begin
  with Canvas do
  begin
    Pen.Color := FrameColor;
    Brush.Color := FrameColor;
    FillRect(ClientRect);

    Pen.Color := Color;
    Brush.Color := Color;

    Font := Self.Font;
    Font.Style := [fsBold];

    H := TextHeight('0g');

    if Text <> '' then
    begin
      Pen.Color := FTitleColor;
      Brush.Color := FTitleColor;

      W := TextWidth(Text);
      Canvas.Polygon([Point(3,0), Point(3, h+1), Point(5+w+5, h+1), Point(5+w+5+h+1, 0)]);
      Canvas.Polygon([Point(w+15, h+1), Point(w+15+h+1, 0), Point(Width-4, 0), Point(Width-4, h+1)]);

      R := Rect(8, 0, 8+W, H);
      Flags := DrawTextBiDiModeFlags(DT_SINGLELINE);
      DrawText(Handle, PChar(Text), Length(Text), R, Flags or DT_CALCRECT);
      DrawText(Handle, PChar(Text), Length(Text), R, Flags);
    end else
    begin
      Pen.Color := FTitleColor;
      Brush.Color := FTitleColor;

      W := 20;
      Canvas.Polygon([Point(3,0), Point(3, h+1), Point(5+w+5, h+1), Point(5+w+5+h+1, 0)]);
      Canvas.Polygon([Point(w+15, h+1), Point(w+15+h+1, 0), Point(Width-4, 0), Point(Width-4, h+1)]);
    end;

    Pen.Color := Color;
    Brush.Color := Color;
    R := ClientRect;
    inc(R.right, 5);
    inc(R.bottom, 5);
    dec(R.top, 3);
    dec(R.left, 5);
    AdjustClientRect(R);
    FillRect(R);
  end;
end;

procedure TOFGroupBox.ResizeNew(Sender: TObject);
var
  i: integer;
  Temp: TControl;
begin
  if ControlCount > 0 then
  for I := ControlCount-1 downto 0 do
  begin
    Temp := Controls[I];
    if (Temp.Tag > 0) then
      tEdit(Temp).Width := ClientWidth - tEdit(Temp).Left - 8;
  end;
end;

procedure TOFGroupBox.SetTitleColor(const Value: TColor);
begin
  if Value <> FTitleColor then
  begin
    FTitleColor := Value;
    Invalidate;
  end;
end;

end.

