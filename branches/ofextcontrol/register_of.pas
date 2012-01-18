unit register_of;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, LazarusPackageIntf;

procedure Register;

implementation

uses
  ExtCtrls,
  OFPageList, OFFlatTabControl, OFFlatPanel;

procedure RegisterOFPageList;
begin
  RegisterComponents('OF ExtCompo',[TOFPageList]);
  RegisterNoIcon([TUNBPage]);
end;

procedure RegisterOFFlatTabControl;
begin
  RegisterComponents('OF ExtCompo',[TOFFlatTabControl]);
end;

procedure RegisterOFFlatPanel;
begin
  RegisterComponents('OF ExtCompo',[TOFFlatPanel]);
end;

procedure Register;
begin
  //OF
  RegisterUnit('ofpagelist', @RegisterOFPageList);
  RegisterUnit('offlattabcontrol', @RegisterOFFlatTabControl);
  RegisterUnit('offlatpanel', @RegisterOFFlatPanel);
end;

initialization
  {$i ofext.lrs}
end.

