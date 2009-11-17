//------------------------------------------------------------------------
// TJvBTRichPopUpMenu
// (JvDB-)JvxRichedit formatting component
// Copyright 2000 Betasoft
// changed: KoBraSoft
// Ported to use with JediVCL tJvxRichEdit ©2004 Jan Pokrandt (Jan@JP-Soft.de)
//------------------------------------------------------------------------

//  15.10.09-ud.
//    Registernamen geändert CAO-Faktura -> Open-Faktura


unit btJvxRichPopup; //changed: KoBraSoft

interface

uses
  Classes,  // RegisterComponents
  Graphics, // TFont
  Dialogs,  // TFontDialog
  menus,    // TPopupmenu
  ComCtrls, // TCustomRichEdit;
  JvRichEdit; // TJvCustomRichEdit;
const
  BTJvxRichPopUpMenuVersion = '$Revision: 1.1 $';

type
  {:Supported languages in TBTRichPopUpMenu}
  TLanguage = (roEnglish, roGerman);
  TBTJvxRichPopUpMenuOption = (rpShowShortcuts);
  {:Options for TBTRichPopUpMenu}
  TBTJvxRichPopUpMenuOptions = set of TBTJvxRichPopUpMenuOption;

  TBTJvxRichPopUpMenu = class(TPopUpMenu)
  private
    { Private-Deklarationen }
     FRichEdit           : TJvCustomRichEdit;
     FFontDialog         : TFontDialog;
     FLanguage           : TLanguage;
     FOptions            : TBTJvxRichPopUpMenuOptions;
     SavedStyle          : TFont;
     SavedParagraph      : TJvParaAttributes;

     procedure Undo(Sender: TObject);
     procedure Cut(Sender: TObject);
     procedure Copy(Sender: TObject);
     procedure Paste(Sender: TObject);
     procedure DoClear(Sender: TObject);
     procedure SelectAll(Sender: TObject);

     procedure FormatChar(Sender: TObject);
     procedure Bold(Sender: TObject);
     procedure Underlined(Sender: TObject);
     procedure Italic(Sender: TObject);
     procedure Left(Sender: TObject);
     procedure Center(Sender: TObject);
     procedure Right(Sender: TObject);
     procedure Bullet(Sender: TObject);

     {:Additional OnPopUp-handler enables/disables the menu items. }
     procedure MyPopup(Sender: TObject);

  public
     miUndo,
     miCut, miCopy, miPaste, miClear,
     miSelectAll,
     miSepEdit,
     miFont,
     miSepFont,
     miLeft, miCenter, miRight,
     miSepAlign,
     miBold, miUnderlined, miItalic,
     miSepBUI,
     miBullet : tMenuItem;

     {:In this method, the BTRichPop menu items are created.}
     procedure Loaded; override;
     procedure Popup(X, Y: Integer); override;
     //:RichEdit component
     property RichEdit: TJvCustomRichEdit read FRichEdit write FRichEdit;
   published
     { Published-Deklarationen }
     {:If FontDialog is assigned, a new menu entry will appear.}
     property FontDialog: TFontdialog read FFontDialog write FFontDialog;
     {:Select roEnglish or roGerman.}
     property Language: TLanguage read FLanguage write FLanguage;
  end;

  procedure CharAttr(RichEdit: TJvCustomRichEdit; const newStyle: TFontStyle);
  procedure PrepEdit(RichEdit: TJvCustomRichEdit);

procedure Register;

implementation

uses
  JvDBRichEdit, dbctrls, db, clipbrd, windows, Messages, jpeg, JvGIF;

procedure Register;
begin
  //RegisterComponents('CAO-Faktura', [TBTJvxRichPopUpMenu]);
  RegisterComponents('Open-Faktura', [TBTJvxRichPopUpMenu]);  //15.10.09-ud.
end;

procedure CharAttr;
begin
  if Assigned(RichEdit) then
  begin
    PrepEdit(RichEdit);
    with Richedit.SelAttributes do
    begin
      if not (newStyle in Richedit.SelAttributes.style) then
        Style := Style + [newStyle]
      else
        Style := Style - [newStyle];
    end;
  end;
end;

procedure PrepEdit;
var
  SelStartMemo, SelEndMemo: integer;
begin
  {$IFNDEF VER90}
  if RichEdit is TJvDBRichEdit then
    with TJvDBRichEdit(RichEdit) do
      if DataSource.DataSet.State <> dsEdit then
      begin
        SelStartMemo := SelStart;
        SelEndMemo := SelLength;
        DataSource.DataSet.Edit;
        SelStart := SelStartMemo;
        SelLength := SelEndMemo;
      end;
  {$ENDIF}
end;

//---------------------------------------------------------
//  TJvBTRichPopUpMenu
//---------------------------------------------------------
procedure TBTJvxRichPopUpMenu.Loaded;
var
  mi : TMenuItem;
  cCaptionUndo, cCaptionCut, cCaptionCopy, cCaptionPaste, cCaptionDelete,
  cCaptionSelectAll, cCaptionFont, cCaptionBold, cCaptionUnderlined,
  cCaptionItalic, cCaptionAlignLeft, cCaptionAlignCentered,
  cCaptionAlignRight, cCaptionBullet: string;
begin
  inherited Loaded;
  if not (csDesigning in Componentstate) then
  begin
    case Language of
      roEnglish: begin
                   cCaptionUndo          := 'Undo';
                   cCaptionCut           := 'Cut';
                   cCaptionCopy          := 'Copy';
                   cCaptionPaste         := 'Paste';
                   cCaptionDelete        := 'Delete';
                   cCaptionSelectAll     := 'Select all';
                   cCaptionFont          := 'Font...';
                   cCaptionBold          := 'Bold';
                   cCaptionUnderlined    := 'Underlined';
                   cCaptionItalic        := 'Italic';
                   cCaptionAlignLeft     := 'Align left';
                   cCaptionAlignCentered := 'Centered';
                   cCaptionAlignRight    := 'Align Right';
                   cCaptionBullet        := 'Bullet';
                 end;
      roGerman:  begin
                   cCaptionUndo          := 'Rückgängig';
                   cCaptionCut           := 'Ausschneiden';
                   cCaptionCopy          := 'Kopieren';
                   cCaptionPaste         := 'Einfügen';
                   cCaptionDelete        := 'Löschen';
                   cCaptionSelectAll     := 'Alles markieren';
                   cCaptionFont          := 'Schriftart...';
                   cCaptionBold          := 'Fett';
                   cCaptionUnderlined    := 'Unterstrichen';
                   cCaptionItalic        := 'Kursiv';
                   cCaptionAlignLeft     := 'Linksbündig';
                   cCaptionAlignCentered := 'Zentriert';
                   cCaptionAlignRight    := 'Rechtsbündig';
                   cCaptionBullet        := 'Aufzählung';
                 end;
    end {case};

    SavedStyle := TFont.Create;
    SavedParagraph := TJvParaAttributes.Create(Richedit);  //changed: KoBraSoft

    miUndo := TMenuItem.Create(self);
    with miUndo do
    begin
      Caption := cCaptionUndo;
      OnClick := Undo;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('Z'), [ssCtrl]);
    end;
    items.Add(miUndo);

    mi := TMenuItem.Create(self);
    mi.Caption := '-';
    items.Add(mi);

    miCut := TMenuItem.Create(self);
    with miCut do
    begin
      Caption := cCaptionCut;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('X'), [ssCtrl]);
      OnClick := Cut;
    end;
    items.Add(miCut);

    miCopy := TMenuItem.Create(self);
    with miCopy do
    begin
      Caption := cCaptionCopy;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('C'), [ssCtrl]);
      OnClick := Copy;
    end;
    items.Add(miCopy);

    miPaste := TMenuItem.Create(self);
    with miPaste do
    begin
      Caption := cCaptionPaste;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('V'), [ssCtrl]);
      OnClick := Paste;
    end;
    items.Add(miPaste);

    miClear := TMenuItem.Create(self);
    with miClear do
    begin
      Caption := cCaptionDelete;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word(VK_DELETE), []);
      OnClick := DoClear;
    end;
    items.Add(miClear);

    miSelectAll := TMenuItem.Create(self);
    with miSelectAll do
    begin
      Caption := cCaptionSelectAll;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('A'), [ssCtrl]);
      OnClick := SelectAll;
    end;
    items.Add(miSelectAll);

    miSepEdit := TMenuItem.Create(self);
    miSepEdit.Caption := '-';
    items.Add(miSepEdit);

    if not Assigned(FontDialog) then
      FontDialog := TFontDialog.Create(self);

    if Assigned(FontDialog) then
    begin
      miFont := TMenuItem.Create(self);
      with miFont do
      begin
        Caption := cCaptionFont;
        OnClick := FormatChar;
      end;
      items.Add(miFont);
      miSepFont := TMenuItem.Create(self);
      miSepFont.Caption := '-';
      items.Add(miSepFont);
    end;

    miBold := TMenuItem.Create(self);
    with miBold do
    begin
      Caption := cCaptionBold;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('B'), [ssCtrl]);
      OnClick := Bold;
    end;
    items.Add(miBold);

    miUnderlined := TMenuItem.Create(self);
    with miUnderlined do
    begin
      Caption := cCaptionUnderlined;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('U'), [ssCtrl]);
      OnClick := Underlined;
    end;
    items.Add(miUnderlined);

    miItalic := TMenuItem.Create(self);
    with miItalic do
    begin
      Caption := cCaptionItalic;
      if rpShowShortcuts in FOptions then
        ShortCut := menus.ShortCut(Word('I'), [ssCtrl]);
      OnClick := Italic;
    end;
    items.Add(miItalic);

    miSepBUI := TMenuItem.Create(self);
    miSepBUI.Caption := '-';
    items.Add(miSepBUI);

    miLeft := TMenuItem.Create(self);
    with miLeft do
    begin
      Caption := cCaptionAlignLeft;
      OnClick := Left;
      RadioItem := true;
      Checked := true;
      GroupIndex := 1;
    end;
    items.Add(miLeft);

    miCenter := TMenuItem.Create(self);
    with miCenter do
    begin
      Caption := cCaptionAlignCentered;
      OnClick := Center;
      RadioItem := true;
      GroupIndex := 1;
    end;
    items.Add(miCenter);

    miRight := TMenuItem.Create(self);
    with miRight do
    begin
      Caption := cCaptionAlignRight;
      OnClick := Right;
      RadioItem := true;
      GroupIndex := 1;
    end;
    items.Add(miRight);

    miSepAlign := TMenuItem.Create(self);
    miSepAlign.Caption := '-';
    items.Add(miSepAlign);

    miBullet := TMenuItem.Create(self);
    with miBullet do
    begin
      Caption := cCaptionBullet;
      OnClick := Bullet;
    end;
    items.Add(miBullet);
  end;
end;

procedure TBTJvxRichPopUpMenu.Popup;
begin
  if Assigned(OnPopUp) then
    OnPopUp(Self);
  MyPopup(Self);
  inherited Popup(X, Y);
end;

procedure TBTJvxRichPopUpMenu.MyPopup;
var
  {$IFNDEF VER90}
  SelStartMemo, SelEndMemo: integer;
  {$ENDIF}
  canEdit: boolean;
begin
  canEdit := true;

  {$IFNDEF VER90}
  (*
  if PopupComponent is TJvDBRichEdit then
    RichEdit := TJvDBRichEdit(PopupComponent)
  else
    RichEdit := TJvxRichEdit(PopupComponent);
  *)
  if PopupComponent is TJvDBRichEdit then
    RichEdit := TJvDBRichEdit(PopupComponent);

  if RichEdit is TJvDBRichEdit then
  begin
    with TJvDBRichEdit(RichEdit) do
    begin
      canEdit := ReadOnly = false;
      if canEdit and (DataSource.DataSet.State <> dsEdit) then
      begin
        SelStartMemo := SelStart;
        SelEndMemo := SelLength;
        DataSource.DataSet.Edit;
        SelStart := SelStartMemo;
        SelLength := SelEndMemo;
      end;
      miBold.enabled := not Plaintext and canEdit;
      miUnderlined.enabled := not Plaintext and canEdit;
      miItalic.enabled := not Plaintext and canEdit;
      miLeft.enabled := not Plaintext and canEdit;
      miCenter.enabled := not Plaintext and canEdit;
      miRight.enabled := not Plaintext and canEdit;
      miBullet.enabled := not Plaintext and canEdit;
      if Assigned(miFont) then
        miFont.enabled := not Plaintext and canEdit;
      miSepEdit.visible := canEdit;
      miBold.Visible := canEdit;
      miUnderlined.Visible := canEdit;
      miItalic.Visible := canEdit;
      miSepBUI.visible := canEdit;
      if Assigned(miFont) then
        miSepFont.visible := canEdit;
      miLeft.Visible := canEdit;
      miCenter.Visible := canEdit;
      miRight.Visible := canEdit;
      miSepAlign.visible := canEdit;
      miBullet.Visible := canEdit;
    end;
  end;
  {$ELSE}
  if not Assigned(RichEdit) then
    RichEdit := TJvxRichEdit(PopupComponent);
  {$ENDIF}

  miUndo.enabled  := (Richedit.Perform(EM_CANUNDO, 0, 0)>0) and canEdit;
  miCut.enabled   := (RichEdit.SelLength>0) and canEdit;
  miCopy.enabled  :=  RichEdit.SelLength>0;
  miClear.enabled := (RichEdit.SelLength>0) and canEdit;
  miPaste.enabled := ClipBoard.HasFormat(CF_TEXT) and canEdit;
  miSelectAll.enabled := Length(RichEdit.text)>RichEdit.SelLength;

  with RichEdit.SelAttributes do
  begin
    miBold.checked        := fsBold in Style;
    miUnderlined.checked  := fsUnderline in Style;
    miItalic.checked      := fsItalic in Style;
  end;

  with RichEdit.Paragraph do
  begin
    miLeft.Checked      := Alignment = paLeftJustify;
    miCenter.Checked    := Alignment = paCenter;
    miRight.Checked     := Alignment = paRightJustify;
    miBullet.Checked    := Numbering <> nsNone;
  end;
end;

procedure TBTJvxRichPopUpMenu.Undo;
begin
  Richedit.Perform(WM_UNDO, 0, 0);
end;

procedure TBTJvxRichPopUpMenu.Cut;
begin
  RichEdit.Perform(WM_CUT, 0, 0);
end;

procedure TBTJvxRichPopUpMenu.Copy;
begin
  Richedit.Perform(WM_COPY, 0, 0);
end;

procedure TBTJvxRichPopUpMenu.Paste;
begin
  Richedit.Perform(WM_PASTE, 0, 0);
end;

procedure TBTJvxRichPopUpMenu.DoClear;
begin
  Richedit.Perform(WM_CLEAR, 0, 0);
end;

procedure TBTJvxRichPopUpMenu.SelectAll;
begin
  Richedit.SelectAll;
end;

procedure TBTJvxRichPopUpMenu.Bold;
begin
  CharAttr(RichEdit, fsBold);
end;

procedure TBTJvxRichPopUpMenu.Underlined;
begin
  CharAttr(RichEdit, fsUnderline);
end;

procedure TBTJvxRichPopUpMenu.Italic;
begin
  CharAttr(RichEdit, fsItalic);
end;

procedure TBTJvxRichPopUpMenu.FormatChar;
begin
  if Assigned(FontDialog) then
  begin
    with FontDialog do
    begin
      Font := TFont(Richedit.SelAttributes);
      if execute then
        RichEdit.SelAttributes := TJvTextAttributes(Font);
    end;
  end;
end;

procedure TBTJvxRichPopUpMenu.Bullet;
begin
  with Richedit.Paragraph do
  begin
    if Numbering = nsNone then
      Numbering := nsBullet
    else
      Numbering := nsNone
  end;
end;

procedure TBTJvxRichPopUpMenu.Left;
begin
  Richedit.Paragraph.Alignment := paLeftJustify;
  miLeft.Checked := true;
end;

procedure TBTJvxRichPopUpMenu.Center;
begin
  Richedit.Paragraph.Alignment := paCenter;
  miCenter.Checked := true;
end;

procedure TBTJvxRichPopUpMenu.Right;
begin
  Richedit.Paragraph.Alignment := paRightJustify;
  miRight.Checked := true;
end;

end.

