{*******************************************************}
{                                                       }
{       OF_Function - Collection                        }
{                                                       }
{       Copyright (c) 1995 Udo Dembeck                  }
{                                                       }
{*******************************************************}

unit OF_Function;

{$D+}

interface

uses
  Windows, Registry, ShellAPI, Messages, Classes, Graphics;

type
  Float = Extended;    { our type for float arithmetic }

  Int_  = Integer;     { our type for integer functions, Int_ is ever 32 bit }

const
  { several important ASCII codes }
  NULL            =  #0;
  BACKSPACE       =  #8;
  TAB             =  #9;
  LF              = #10;
  CR              = #13;
  EOF_            = #26;    { 30.07.96 sb }
  ESC             = #27;
  BLANK           = #32;
  SPACE           = BLANK;

  { digits as chars }
  ZERO   = '0';  ONE  = '1';  TWO    = '2';  THREE  = '3';  FOUR  = '4';
  FIVE   = '5';  SIX  = '6';  SEVEN  = '7';  EIGHT  = '8';  NINE  = '9';

  { special codes }
  SLASH           = '\';     { used in filenames }
  HEX_PREFIX      = '$';     { prefix for hexnumbers }

  CRLF            : PChar = CR+LF;

  { common computer sizes }
  KBYTE           = Sizeof(Byte) shl 10;
  MBYTE           = KBYTE        shl 10;
  GBYTE           = MBYTE        shl 10;

  { Low floating point value }
  FLTZERO         : Float = 0.00000001;


{ String functions }
function  strAddSlash(const S: String): String;
function  strDelSlash(const S: String): String;
function  strMake(C: Char; Len: Integer): String;
function  strSpace(Len: Integer): String;
function  strLastCh(const S: String): Char;

function  strToken(var S: String; Seperator: Char): String;
function  strTokenCount(S: String; Seperator: Char): Integer;
function  strTokenAt(const S:String; Seperator: Char; At: Integer): String;
function  strTokenInStr(const T, S:String; Seperator: Char): Boolean; { 19.05.1999 ud }
procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
function  strTokenFromStrings(Seperator: Char; List: TStrings): String;

{ SQL convert functions }
function sqlStringToSQL(Value: string): string;
function sqlToString(Value: string): string;
function sqlFloatToStr(Value: Double): string;
function sqlFormatDate(Value: TDateTime): string;
function sqlFormatTime(Value: TDateTime): string;
function sqlDateTimeToSqlDate(Value: TDateTime): string;
function sqlDateTimeToSqlDateEx(Value: TDateTime): string;

{ Floatingpoint functions }
function  fltAdd(P1, P2: Float; Decimals: Integer): Float;
function  fltDiv(P1, P2: Float; Decimals: Integer): Float;
function  fltEqual(P1, P2: Float; Decimals: Integer): Boolean;
function  fltEqualZero(P: Float): Boolean;
function  fltGreaterZero(P: Float): Boolean;
function  fltLessZero(P: Float): Boolean;
function  fltNeg(P: Float; Negate: Boolean): Float;
function  fltMul(P1,P2: Float; Decimals: Integer): Float;
function  fltRound(P: Float; Decimals: Integer): Float;
function  fltSub(P1,P2: Float; Decimals: Integer): Float;
function  fltUnEqualZero(P: Float): Boolean;
function  fltCalc(const Expr: String): Float;
function  fltPower(a,n: Float): Float;
function  fltPositiv(Value: Float): Float;
function  fltNegativ(Value: Float): Float;

{ date functions }
function dateLeapYear(ADate: TDateTime): Boolean;
function dateIsLeapYear(AYear: Integer): Boolean;
function dateDaysPerMonth(AYear, AMonth: Integer): Integer;

implementation

uses
  SysUtils, Controls, Forms, {Consts,} Dialogs;

{ string methods }

function strAddSlash(const S: String): String;
begin
  Result := S;
  if strLastCh(Result) <> SLASH then
    Result := Result + SLASH;
end;

function strDelSlash(const S: String): String;
begin
  Result := S;
  if strLastCh(Result) = SLASH then
    Delete(Result, Length(Result), 1);
end;

function strMake(C: Char; Len: Integer): String;
begin
  Result := '';
  while Length(Result) < Len do
    Result := C + Result;
end;

function strSpace(Len: Integer): String;
begin
  Result := StrMake(BLANK, Len);
end;

function strLastCh(const S: String): Char;
begin
  Result := S[Length(S)];
end;

function strToken(var S: String; Seperator: Char): String;
var
  i: Word;
begin
  I := Pos(Seperator, S);
  if I <> 0 then
  begin
    Result := System.Copy(S, 1, i-1);
    System.Delete(S, 1, i);
  end else
  begin
    Result := S;
    S := '';
  end;
end;

function strTokenCount(S: String; Seperator: Char): Integer;
begin
  Result := 0;
  while S <> '' do             { 29.10.96 sb }
  begin
    StrToken(S, Seperator);
    Inc(Result);
  end;
end;

function strTokenAt(const S: String; Seperator: Char; At: Integer): String;
var
  j, i: Integer;
begin
  Result := '';
  j := 1;
  i := 0;
  while (i <= At ) and (j <= Length(S)) do
  begin
    if S[j] = Seperator then
      Inc(i)
    else
    if i = At then
      Result := Result+S[j];
    Inc(j);
  end;
end;

 { 19.05.1999 ud }
function strTokenInStr(const T, S: String; Seperator: Char): Boolean;
var
  i: Integer;
  c: Integer;
begin
  Result := False;
  c := strTokenCount(s, Seperator);
  for i := 0 to c do
  begin
    if T = strTokenAt(s, Seperator, i) then
    begin
      Result := True;
      exit;
    end;
  end;
end;

procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
var
  Token: String;
begin
  List.Clear;
  Token := strToken(S, Seperator);
  while Token <> '' do
  begin
    List.Add(Token);
    Token := strToken(S, Seperator);
  end;
end;

function strTokenFromStrings(Seperator: Char; List: TStrings): String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to List.Count-1 do
    if Result <> '' then
      Result := Result + Seperator + List[i]
    else
      Result := List[i];
end;


{ SQL convert functions }

{ Convert string to escaped Ansi SQL string }
function sqlStringToSQL(Value: string): string;
var
  I, Add, Len: Integer;
  Ptr: PChar;
begin
  Add := 0;
  Len := Length(Value);
  for I := 1 to Len do
    if Value[I] in ['''', '"', '\', #26, #10, #13, #0] then
      Inc(Add);
  SetLength(Result, Len + Add);
  Ptr := PChar(Result);
  for I := 1 to Len do
  begin
    if Value[I] in ['''', '"', '\', #26, #10, #13, #0] then
    begin
      Ptr^ := '\';
      Inc(Ptr);
      case Value[I] of
        #26: Ptr^ := 'Z';
        #10: Ptr^ := 'n';
        #13: Ptr^ := 'r';
        #0: Ptr^ := '0';
        else Ptr^ := Value[I];
      end;
    end else
      Ptr^ := Value[I];
    Inc(Ptr);
  end;
end;

{ Convert string to escaped Ansi SQL string }
function sqlToString(Value: string): string;
var
  N: Integer;
  Ptr1, Ptr2: PChar;
begin
  SetLength(Result, Length(Value) + 1);
  Ptr1 := PChar(Value);
  Ptr2 := PChar(Result);
  N := 0;
  while Ptr1^ <> #0 do
  begin
    if Ptr1^ <> '\' then
      Ptr2^ := Ptr1^
    else
    begin
      Inc(Ptr1);
      if Ptr1 = #0 then Break;
      case Ptr1^ of
        'n': Ptr2^ := #10;
        'r': Ptr2^ := #13;
        'Z': Ptr2^ := #26;
        '0': Ptr2^ := #0;
        else Ptr2^ := Ptr1^;
      end;
    end;
    Inc(N);
    Inc(Ptr1);
    Inc(Ptr2);
  end;
  SetLength(Result, N);
end;

{ Convert float value to string with '.' delimiter }
function sqlFloatToStr(Value: Double): string;
var
  Temp: Integer;
begin
  Result := FloatToStr(Value);
  if DecimalSeparator <> '.' then
  begin
    Temp := AnsiPos(DecimalSeparator,Result);
    if Temp <> 0 then Result[Temp] := '.';
  end;
end;

{ Form number with leading zeros }
function FormatNumber(Value, Width: Word): string;
begin
  Result := IntToStr(Value);
  while Length(Result) < Width do
    Result := '0' + Result;
end;

{ Format date in ISO format }
function sqlFormatDate(Value: TDateTime): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  Result :=
    FormatNumber(Year, 4) + '-' +
    FormatNumber(Month, 2) + '-' +
    FormatNumber(Day, 2);
end;

{ Format time in ISO format }
function sqlFormatTime(Value: TDateTime): string;
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Value, Hour, Min, Sec, MSec);
  Result :=
    FormatNumber(Hour, 2) + ':' +
    FormatNumber(Min, 2) + ':' +
    FormatNumber(Sec, 2);
end;

{ Convert TDateTime to SQL Ansi-92 Date }
function sqlDateTimeToSqlDate(Value: TDateTime): string;
begin
  Result := '';
  if Trunc(Value) <> 0 then
    Result := sqlFormatDate(Value);
  if Frac(Value) <> 0 then
  begin
    if Result <> '' then
      Result := Result + ' ';
    Result := Result + sqlFormatTime(Value);
  end;
end;

{ Convert TDateTime to SQL Ansi-92 Date with constant date part}
function sqlDateTimeToSqlDateEx(Value: TDateTime): string;
begin
  if Trunc(Value) <> 0 then
    Result := sqlFormatDate(Value)
  else
    Result := '0000-00-00';
  if Frac(Value) <> 0 then
  begin
    if Result <> '' then
      Result := Result + ' ';
    Result := Result + sqlFormatTime(Value);
  end;
end;


{ Floating point stuff }

function FltAdd(P1,P2: Float; Decimals: Integer): Float;
begin
  P1 := fltRound(P1, Decimals);
  P2 := fltRound(P2, Decimals);
  Result := fltRound(P1+P2, Decimals);
end;

function FltDiv(P1, P2: Float; Decimals: Integer): Float;
begin
  P1 := fltRound(P1, Decimals);
  P2 := fltRound(P2, Decimals);
  if P2 = 0.0 then
    P2 := FLTZERO;       { provide division by zero }
  Result := fltRound(P1/P2, Decimals);
end;

function FltEqual(P1,P2: Float; Decimals: Integer): Boolean;
var
  Diff: Float;
begin
  Diff := fltSub(P1, P2, Decimals);
  Result := fltEqualZero(Diff);
end;

function FltEqualZero(P: Float): Boolean;
begin
  Result := (P >= -FLTZERO) and (P <= FLTZERO);          { 29.10.96 sb }
end;

function FltGreaterZero(P: Float): Boolean;
begin
  Result := P > FLTZERO;
end;

function FltLessZero(P: Float): Boolean;
begin
  Result := P < -FLTZERO;
end;

function FltNeg(P: Float; Negate: Boolean): Float;
begin
  if Negate then
    Result := -P
  else
    Result := P;
end;

function FltMul(P1, P2: Float; Decimals: Integer): Float;
begin
  P1 := fltRound(P1, Decimals);
  P2 := fltRound(P2, Decimals);
  Result:= fltRound(P1*P2, Decimals);
end;

function IntPow(Base, Expo: Integer): Int_;
var
  Loop: Word;
begin
  Result := 1;
  for Loop := 1 to Expo do
    Result := Result * Base;
end;

function IntPow10(Exponent: Integer): Int_;
begin
  Result := IntPow(10, Exponent);
end;

function FltRound(P: Float; Decimals: Integer): Float;
var
  Factor  : LongInt;
  Help    : Float;
begin
  Factor := IntPow10(Decimals);
  if P < 0 then
    Help := -0.5
  else
    Help := 0.5;
  {19.04.1999 ud}
  {Result := Int(P * Factor + Help) / Factor;}
  Result := Int(P * Factor + Help);
  Result := Result / Factor;
  if fltEqualZero(Result) then
    Result := 0.00;
end;

function FltSub(P1, P2: Float; Decimals: Integer): Float;
begin
  P1 := fltRound(P1, Decimals);
  P2 := fltRound(P2, Decimals);
  Result := fltRound(P1-P2, Decimals);
end;

function FltUnEqualZero(P: Float): Boolean;
begin
  Result := (P < -FLTZERO) or (P > FLTZERO)
end;

function FltCalc(const Expr: String): Float;
const
  STACKSIZE = 10;
var
  Stack: array [0..STACKSIZE] of Float;    { 29.10.96 sb }
  oStack: array [0..STACKSIZE] of char;
  z, n: Float;
  i, j, m: integer;
  Bracket: boolean;
begin
  Bracket := False;
  j := 0;
  n := 1;
  z := 0;
  m := 1;
  for i := 1 to Length(Expr) do
  begin
    if not Bracket  then
       case Expr[i] of
         '0' .. '9': begin
                       z := z*10+ord(Expr[i])-ord('0');
                       n := n*m;
                     end;
         ',',#46   : m := 10;
         '('       : Bracket := True; {hier Klammeranfang merken, Zähler!!}
         '*','x',
         'X',
         '/','+'   : begin
                       Stack[j] := z/n;
                       oStack[j] := Expr[i];
                       Inc(j);
                       m := 1;
                       z := 0;
                       n := 1;
                     end;
       end {case}
    else
       Bracket := Expr[i] <> ')'; {hier Rekursiver Aufruf, Zähler !!};
  end;
  Stack[j] := z/n;
  for i := 1 to j do
    case oStack[i-1] of
      '*','x','X' :  Stack[i]:= Stack[i-1]*Stack[i];
      '/'         :  Stack[i]:= Stack[i-1]/Stack[i];
      '+'         :  Stack[i]:= Stack[i-1]+Stack[i];
    end;
  Result:= Stack[j];
end;

function fltPower(a, n: Float): Float;
begin
  Result := Exp(n * Ln(a));
end;

function fltPositiv(Value: Float): Float;
begin
  Result := Value;
  if Value < 0.0 then
    Result := 0.0;
end;

function fltNegativ(Value: Float): Float;
begin
  Result := Value;
  if Value > 0.0 then
    Result := 0.0;
end;


{ date functions }
function dateLeapYear(ADate: TDateTime): Boolean;
var
  Year, Month, Day: Word;
begin
  DecodeDate(ADate, Year, Month, Day);
  Result := dateIsLeapYear(Year);
end;

function dateIsLeapYear(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function dateDaysPerMonth(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and IsLeapYear(AYear) then
    Inc(Result); { leap-year Feb is special }
end;


{ other stuff }

function ExtractName(const Filename: String): String;
var
  aExt: String;
  aPos: Integer;
begin
  aExt := ExtractFileExt(Filename);
  Result := ExtractFileName(Filename);
  if aExt <> '' then
  begin
    aPos := Pos(aExt,Result);
    if aPos > 0 then
       Delete(Result, aPos, Length(aExt));
  end;
end;

{
// CM Keine Implementation
function MsgBox(const aTitle, aMsg: String; aFlag: Integer): Integer;
var
  ActiveWindow : hWnd;
  WindowList   : Pointer;
  TmpA         : array[0..200] of char;
  TmpB         : array[0..100] of char;
begin
  ActiveWindow := GetActiveWindow;
  WindowList := DisableTaskWindows(0);
  try
    StrPCopy(TmpB, aTitle);
    StrPCopy(TmpA, aMsg);
    Result := Windows.MessageBox(Application.Handle, TmpA, TmpB, aFlag);
  finally
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
  end;
end;  }

function Question(const aMsg: String):Boolean;
begin
  Result := MessageDlg(aMsg, mtConfirmation, [mbYes,mbNo], 0) = mrYes;
end;

procedure Information(const aMsg: String);
begin
  messageDlg(aMsg, mtInformation,[mbOk], 0);
end;

procedure ErrorDlg(const aMsg: String);
begin
  MessageDlg(aMsg, mtError, [mbOk], 0);
end;

function Confirmation(const aMsg: String): Word;
begin
  Result := MessageDlg(aMsg, mtConfirmation, [mbYes,mbNo,mbCancel], 0);
end;

initialization

finalization

end.

