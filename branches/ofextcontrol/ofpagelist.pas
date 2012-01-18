unit OFPageList;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Types, Classes, LResources, LCLIntf, LCLType,
  LMessages, Graphics, Controls, Forms, StdCtrls, ExtCtrls;

type

  { TOFCustomPageList }

  TOFCustomPageList = class(TUntabbedNotebook)
  private
    function GetPageCount: integer;
  protected
    procedure Paint; override;
    property PageCount: integer read GetPageCount;
  end;

  { TOFPageList }

  TOFPageList = class(TOFCustomPageList)
  public
    property PageCount;
  end;

implementation

{ TOFCustomPageList }

function TOFCustomPageList.GetPageCount: integer;
begin
  result := Pages.Count;
end;

procedure TOFCustomPageList.Paint;
begin
  //inherited Paint;
  //if (csDesigning in ComponentState) and (GetPageCount = 0) then
  if (csDesigning in ComponentState) then
  begin
    with Canvas do
    begin
      Pen.Color := clBlack;
      Pen.Style := psDot;
      Brush.Style := bsClear;
      Rectangle(ClientRect);
    end;
  end;
end;

end.
