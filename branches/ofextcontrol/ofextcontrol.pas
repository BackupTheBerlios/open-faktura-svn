{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ofextcontrol; 

interface

uses
    OFPageList, register_of, OFFlatTabControl, OFFlatPanel, LazarusPackageIntf;

implementation

procedure Register; 
begin
  RegisterUnit('register_of', @register_of.Register); 
end; 

initialization
  RegisterPackage('ofextcontrol', @Register); 
end.
