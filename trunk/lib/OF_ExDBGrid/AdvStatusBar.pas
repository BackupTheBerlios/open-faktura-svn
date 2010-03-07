{
ExDBGrid Component Suite Version 3.9 - TAdvStatusBar

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

unit AdvStatusBar;

interface

uses ComCtrls, Classes, Controls;

type
   TAdvStatusBar = class(TStatusBar)
   public
      constructor Create(AOwner: TComponent); override;
   end;

procedure Register;

implementation

constructor TAdvStatusBar.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
end;

procedure Register;
begin
   RegisterComponents('GJL Software', [TAdvStatusBar]);
end;

end.

