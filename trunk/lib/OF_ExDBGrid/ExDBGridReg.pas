{
ExDBGrid Component Suite Version 3.9 - ExDBGridReg

Copyright (©) 1999, 2000, 2001 & 2002 by GJL Software
Updated 15th April 2002 (15/04/2002)

Email:         ExDBGrid@gjl-software.co.uk
Home Page:     http://www.gjl-software.co.uk
}

{$I EXDBGRID.INC}

unit ExDBGridReg;

interface

uses Classes, ExDBGrid, ExRxDBGrid, ExDBGridProp, ExRxDBGridProp,
   AdvStatusBar, ExDateTimePicker
   {$IFDEF EX_COMPILER_4_UP}
   , ExDBImageEditor, ExUltimDBFooter, ExRxUltimDBFooter
   {$ENDIF}
   {$IFDEF EX_COMPILER_6_UP}
   , DesignIntf, DesignEditors
   {$ELSE}
   , DsgnIntf
   {$ENDIF};

procedure Register;

implementation

procedure Register;
begin
   {$IFDEF EX_COMPILER_3}
   RegisterComponents('GJL Software', [TExDBGrid, TExRxDBGrid, TAdvStatusBar, TExDateTimePicker]);
   {$ELSE}
   RegisterComponents('GJL Software', [TExDBGrid, TExRxDBGrid, TAdvStatusBar, TExDateTimePicker, TExDBFooter, TExRxDBFooter, TExDBImageEditor]);
   {$ENDIF}
   RegisterPropertyEditor(TypeInfo(TExDBGridControls), TExDBGrid, 'Controls', TExDBGridControlsEditor);
   RegisterPropertyEditor(TypeInfo(TExRxDBGridControls), TExRxDBGrid, 'Controls', TExRxDBGridControlsEditor);
   {$IFDEF EX_COMPILER_4_UP}
   RegisterPropertyEditor(TypeInfo(string), TExDBImageEditor, 'PaintProgram', TFilenameProperty);
   {$ENDIF}
end;

end.

