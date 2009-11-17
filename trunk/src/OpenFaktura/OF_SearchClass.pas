{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : [[ add description here! ]]                                       }
{                                                                              }
{ Dieser Programmcode  gehört zum Projekt Open-Faktura.                        }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code is part of the Open-Faktura project. You may distribute    }
{ and/or modify it under the terms of the GNU General Public License version 2.}
{ (see GPL-2.0-EN.txt)                                                         }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id$ }
{                                                                              }
{ TODO:                                                                        }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 20.09.2003 - JP: Bug bei Suche nach "and" oder "or" beseitigt                }
{ 17.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext)             }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

{*********************************************************}
{* AASearchParser                                        *}
{* Copyright (c) Julian M Bucknall 2002                  *}
{* All rights reserved.                                  *}
{*********************************************************}
{* Algorithms Alfresco: Search expression parser         *}
{*********************************************************}
{Note: this unit is released as freeware. In other words, you are free
       to use this unit in your own applications, however I retain all
       copyright to the code. JMB}
{*********************************************************}

{_$DEFINE ENGLISH}
{$DEFINE GERMAN}

unit OF_SearchClass;

interface

uses
  SysUtils, Classes;

type
  TaaRPNNode = class  // a base node that helps form an RPN string
    private
      FNext : TaaRPNNode;
    public
      destructor Destroy; override;
      procedure Append(aNode : TaaRPNNode);
      property Next : TaaRPNNode read FNext;
  end;

  TaaRPNWord = class(TaaRPNNode)  // an RPN node for a word
    private
      FWord : string;
    public
      constructor Create(const aPhraseWord : string);
      property PhraseWord : string read FWord;
  end;

  TaaRPN_AND = class(TaaRPNNode); // an RPN node for the AND operator
  TaaRPN_OR = class(TaaRPNNode);  // an RPN node for the OR operator
  TaaRPN_NOT = class(TaaRPNNode); // an RPN node for the NOT operator

  TaaSearchParser = class  // a parser for search phrases
    private
      FCurWord : string;
      FPhrase  : string;
      FPosn    : integer;
      FRPN     : TaaRPNNode;
    protected
      function spGetRPN : TaaRPNNode;
      procedure spSetPhrase(const aPhrase : string);

      function spParseExpr : TaaRPNNode;
      function spParseFactor : TaaRPNNode;
      function spParseTerm : TaaRPNNode;
      procedure spParsePhrase;

      procedure spGetNextWord;
    public
      constructor Create(const aPhrase : string);
      destructor Destroy; override;

      property Phrase : string read FPhrase write spSetPhrase;
      property RPN : TaaRPNNode read spGetRPN;
  end;

  type
  TaaStack = class
    private
      FStack : TList;
      FSP    : integer;
    protected
    public
      constructor Create;
      destructor Destroy; override;

      function Count : integer;
      function IsEmpty : boolean;
      function Pop : pointer;
      procedure Push(aItem : pointer);
  end;

  TaaQueue = class
    private
      FHead  : integer;
      FQueue : TList;
      FTail  : integer;
    protected
      function qGetItem(aIndex : integer) : pointer;
      procedure qGrow;
    public
      constructor Create;
      destructor Destroy; override;

      function Count : integer;
      function Dequeue : pointer;
      procedure Enqueue(aItem : pointer);
      function IsEmpty : boolean;
      property Items[aIndex : integer] : pointer
                  read qGetItem;
  end;

  TaaStringStack = class
    private
      FStack : TStringList;
      FSP    : integer;
    protected
      procedure ssGrow(aNewSize : integer);
    public
      constructor Create;
      destructor Destroy; override;

      function Count : integer;
      function IsEmpty : boolean;
      function Pop : string;
      procedure Push(const aItem : string);
  end;

implementation

const

{$IFDEF ENGLISH}
  Err1 : String ='TaaSearchParser: missing close parenthesis in phrase';
  Err2 : String ='TaaSearchParser: missing final search word';
  Err3 : String ='TaaSearchParser: operator used as search word';
  Err4 : String ='TaaQueue.Dequeue pre-condition: the queue cannot be empty';
  Err5 : String ='TaaQueue.Enqueue pre-condition: the item cannot be nil';
  Err6 : String ='TaaQueue.qGetItem pre-condition: the index must be in range';

  Msg1 : String ='TaaQueue.Count post-condition: count should be in range';
  Msg2 : String ='TaaQueue.Dequeue post-condition: count should be decremented';
  Msg3 : String ='TaaQueue.Dequeue post-condition: the result should be the first item in the queue';
  Msg4 : String ='TaaQueue.Dequeue post-condition: order of the items has been altered';
  Msg5 : String ='TaaQueue.Enqueue post-condition: count should be incremented';
  Msg6 : String ='TaaQueue.Enqueue post-condition: order of the items has been altered';
  Msg7 : String ='TaaQueue.Enqueue post-condition: the item should be at the end of the queue';
  Msg8 : String ='TaaQueue.IsEmpty post-condition: result should mirror Count = 0';
{$ENDIF}


{$IFDEF GERMAN}
  Err1 : String ='SuchEngine: letzter Suchbegriff fehlt';
  Err2 : String ='SuchEngine: 1. Suchbegriff fehlt';
  Err3 : String ='SuchEngine: Suchoperator als Suchwort verwendet';
  
  Err4 : String ='TaaQueue.Dequeue pre-condition: the queue cannot be empty';
  Err5 : String ='TaaQueue.Enqueue pre-condition: the item cannot be nil';
  Err6 : String ='TaaQueue.qGetItem pre-condition: the index must be in range';

  Msg1 : String ='TaaQueue.Count post-condition: count should be in range';
  Msg2 : String ='TaaQueue.Dequeue post-condition: count should be decremented';
  Msg3 : String ='TaaQueue.Dequeue post-condition: the result should be the first item in the queue';
  Msg4 : String ='TaaQueue.Dequeue post-condition: order of the items has been altered';
  Msg5 : String ='TaaQueue.Enqueue post-condition: count should be incremented';
  Msg6 : String ='TaaQueue.Enqueue post-condition: order of the items has been altered';
  Msg7 : String ='TaaQueue.Enqueue post-condition: the item should be at the end of the queue';
  Msg8 : String ='TaaQueue.IsEmpty post-condition: result should mirror Count = 0';
{$ENDIF}

{===TaaRPNNode=======================================================}
destructor TaaRPNNode.Destroy;
begin
  Next.Free; // recursively destroys the linked list of nodes
  inherited Destroy;
end;
{--------}
procedure TaaRPNNode.Append(aNode: TaaRPNNode);
var
  Walker : TaaRPNNode;
begin
  Walker := Self;
  while (Walker.Next <> nil) do
    Walker := Walker.Next;
  Walker.FNext := aNode;
end;
{====================================================================}

{====================================================================}
constructor TaaRPNWord.Create(const aPhraseWord: string);
begin
  inherited Create;
  FWord := aPhraseWord;
end;
{====================================================================}

{===TaaSearchParser==================================================}
constructor TaaSearchParser.Create(const aPhrase: string);
begin
  inherited Create;
  Phrase := aPhrase;
end;
{--------}
destructor TaaSearchParser.Destroy;
begin
  FRPN.Free;
  inherited Destroy;
end;
{--------}
procedure TaaSearchParser.spGetNextWord;
var
  Walker    : PAnsiChar;
  WordStart : PAnsiChar;
begin
  {advance past the current word}
  inc(FPosn, length(FCurWord));
  FCurWord := '';

  {skip past the white space}
  Walker := @FPhrase[FPosn];
  while (Walker^ = ' ') do 
	begin
    inc(FPosn);
    inc(Walker);
  end;

  {check for the parentheses first; if found, copy them to the
   internal field}
  if (Walker^ = '(') then
    FCurWord := '('
  else 
	if (Walker^ = ')') then
    FCurWord := ')'

  {otherwise search for the end of the current word (it'll end with
   the end of the string, with white space, or with parentheses);
   copy the word to the internal field}
  else 
	begin
    WordStart := Walker;
    while (Walker^ <> #0) and (Walker^ <> ' ') and
          (Walker^ <> '(') and (Walker^ <> ')') do
      inc(Walker);
    FCurWord := Copy(FPhrase, FPosn, Walker - WordStart);
  end;
end;
{--------}
function TaaSearchParser.spGetRPN : TaaRPNNode;
begin
  if (FRPN = nil) then
    spParsePhrase;
  Result := FRPN;
end;
{--------}
function TaaSearchParser.spParseExpr : TaaRPNNode;
begin
  Result := spParseFactor;
  spGetNextWord;
  if (FCurWord = 'and') then
  begin
    spGetNextWord;
    Result.Append(spParseExpr);
    Result.Append(TaaRPN_AND.Create);
  end else 
	if (FCurWord = 'or') then
  begin
    spGetNextWord;
    Result.Append(spParseExpr);
    Result.Append(TaaRPN_OR.Create);
  end else 
	if (FCurWord <> '') and (FCurWord <> ')') then 
	begin
    Result.Append(spParseExpr);
    Result.Append(TaaRPN_AND.Create);
  end;
end;
{--------}
function TaaSearchParser.spParseFactor : TaaRPNNode;
begin
  if (FCurWord <> 'not') then
    Result := spParseTerm
  else 
	begin
    spGetNextWord;
    Result := spParseFactor;
    Result.Append(TaaRPN_NOT.Create);
  end;
end;
{--------}
procedure TaaSearchParser.spParsePhrase;
begin
  if (FPhrase <> '') then
  begin
    FPosn := 1;
    spGetNextWord;
    if (FCurWord <> '') then FRPN := spParseExpr;
  end;
end;
{--------}
function TaaSearchParser.spParseTerm : TaaRPNNode;
begin
  if (FCurWord = '(') then
  begin
    spGetNextWord;
    Result := spParseExpr;
    if (FCurWord <> ')') then
      raise Exception.Create(Err1);
  end else
  begin
    if (FCurWord = '') then
      raise Exception.Create(Err2);
//    if (FCurWord = 'and') or (FCurWord = 'or') or (FCurWord = 'not') then
//      raise Exception.Create(Err3);
    Result := TaaRPNWord.Create(FCurWord);
  end;
end;
{--------}
procedure TaaSearchParser.spSetPhrase(const aPhrase : string);
begin
  FPhrase := LowerCase(aPhrase);
  FRPN.Free;
  FRPN := nil;
end;
{====================================================================}
{====================================================================}
constructor TaaStack.Create;
begin
  inherited Create;
  FStack := TList.Create;
  FStack.Count := 16;
end;
{--------}
destructor TaaStack.Destroy;
begin
  FStack.Free;
  inherited Destroy;
end;
{--------}
function TaaStack.Count : integer;
begin
  Result := FSP;
end;
{--------}
function TaaStack.IsEmpty : boolean;
begin
  Result := FSP = 0;
end;
{--------}
function TaaStack.Pop : pointer;
begin
  if (FSP = 0) then
    Result := nil
  else begin
    dec(FSP);
    Result := FStack.List[FSP];
  end;
end;
{--------}
procedure TaaStack.Push(aItem : pointer);
begin
  if (FSP = FStack.Count) then
    FStack.Count := 2 * FStack.Count;
  FStack.List[FSP] := aItem;
  inc(FSP);
end;
{====================================================================}

{====================================================================}
constructor TaaQueue.Create;
begin
  inherited Create;
  FQueue := TList.Create;
  FQueue.Count := 16;
end;
{--------}
destructor TaaQueue.Destroy;
begin
  FQueue.Free;
  inherited Destroy;
end;
{--------}
function TaaQueue.Count : integer;
begin
  //---REQUIRES---
  // nothing

  //---BODY---
  if (FHead <= FTail) then
    Result := FTail - FHead
  else
    Result := FQueue.Count - (FHead - FTail);

  {$IFOPT C+}
  //---ENSURES---
  Assert((0 <= Result) and (Result < FQueue.Count),Msg1);
  {$ENDIF}
end;
{--------}
function TaaQueue.Dequeue : pointer;
{$IFOPT C+}
//---FOR SNAPSHOT
var
  OldCount : integer;
  OldList  : TList;
  i        : integer;
{$ENDIF}
begin
  //---REQUIRES---
  if (Count = 0) then
    raise Exception.Create(Err4);

  {$IFOPT C+}
  //---TAKE SNAPSHOT
  OldCount := Count;
  OldList := TList.Create;
  try
    for i := 0 to pred(OldCount) do
      OldList.Add(Items[i]);
  {$ENDIF}

    //---BODY---
    if (FHead = FTail) then
      Result := nil
    else begin
      Result := FQueue.List[FHead];
      inc(FHead);
      if (FHead >= FQueue.Count) then
        FHead := 0;
    end;

  {$IFOPT C+}
    //---ENSURES---
    Assert(Count = OldCount-1,Msg2);
    Assert(Result = OldList[0],Msg3);

    for i := 0 to pred(Count) do
      Assert(OldList[i+1] = Items[i],Msg4);
  finally
    OldList.Free;
  end;
  {$ENDIF}
end;
{--------}
procedure TaaQueue.Enqueue(aItem : pointer);
{$IFOPT C+}
//---FOR SNAPSHOT
var
  OldCount : integer;
  OldList  : TList;
  i        : integer;
{$ENDIF}
begin
  //---REQUIRES---
  if (aItem = nil) then
    raise Exception.Create(Err5);

  {$IFOPT C+}
  //---TAKE SNAPSHOT
  OldCount := Count;
  OldList := TList.Create;
  try
    for i := 0 to pred(OldCount) do
      OldList.Add(Items[i]);
  {$ENDIF}

    //---BODY---
    FQueue.List[FTail] := aItem;
    inc(FTail);
    if (FTail >= FQueue.Count) then
      FTail := 0;
    if (FHead = FTail) then
      qGrow;

  {$IFOPT C+}
  //---ENSURES---
    Assert(Count = OldCount + 1,Msg5);
    for i := 0 to pred(OldCount) do
      Assert(OldList[i] = Items[i],Msg6);
    Assert(aItem = Items[pred(Count)],Msg7);
  finally
    OldList.Free;
  end;
  {$ENDIF}
end;
{--------}
function TaaQueue.IsEmpty : boolean;
begin
  //---REQUIRES---
  // nothing

  //---BODY---
  Result := FHead = FTail;

  {$IFOPT C+}
  //---ENSURES---
  Assert(Result = (Count = 0),Msg8);
  {$ENDIF}
end;
{--------}
function TaaQueue.qGetItem(aIndex : integer) : pointer;
var
  Walker : integer;
  i      : integer;
begin
  //---REQUIRES---
  if not ((0 <= aIndex) and (aIndex < Count)) then
    raise Exception.Create(Err6);

  //---BODY---
  Walker := FHead;
  if (aIndex > 0) then
    for i := 1 to aIndex do
      Walker := (Walker + 1) mod FQueue.Count;
  Result := FQueue[Walker];

  //---ENSURES---
  // nothing
end;
{--------}
procedure TaaQueue.qGrow;
var
  OldCount : integer;
  FromInx  : integer;
  ToInx    : integer;
begin
  OldCount := FQueue.Count;
  FQueue.Count := OldCount * 2;
  if (FHead = 0) then
    FTail := OldCount
  else 
	begin
    ToInx := FQueue.Count;
    for FromInx := pred(OldCount) downto FHead do 
		begin
      dec(ToInx);
      FQueue.List[ToInx] := FQueue.List[FromInx];
    end;
    FHead := ToInx;
  end;
end;
{====================================================================}

{====================================================================}
constructor TaaStringStack.Create;
begin
  inherited Create;
  FStack := TStringList.Create;
  ssGrow(16);
end;
{--------}
destructor TaaStringStack.Destroy;
begin
  FStack.Free;
  inherited Destroy;
end;
{--------}
function TaaStringStack.Count : integer;
begin
  Result := FSP;
end;
{--------}
function TaaStringStack.IsEmpty : boolean;
begin
  Result := FSP = 0;
end;
{--------}
function TaaStringStack.Pop : string;
begin
  if (FSP = 0) then
    Result := ''
  else 
	begin
    dec(FSP);
    Result := FStack[FSP];
    FStack[FSP] := '';
  end;
end;
{--------}
procedure TaaStringStack.Push(const aItem : string);
begin
  if (FSP = FStack.Count) then
    ssGrow(2 * FStack.Count);
  FStack[FSP] := aItem;
  inc(FSP);
end;
{--------}
procedure TaaStringStack.ssGrow(aNewSize : integer);
var
  i : integer;
begin
  FStack.Capacity := aNewSize;
  for i := succ(FStack.Count) to aNewSize do
    FStack.Add('');
end;
{====================================================================}


end.
