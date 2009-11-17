{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Browsermodul (Windows Internet Explorer)                          }
{            - zum Anzeigen von HTTP Requests im Programm (HTML, PHP, ...)     }
{              Internet, Intranet etc.                                         }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  gehört zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code ( based on the sources of CAO-Faktura, see above ) is part }
{ of the Open-Faktura project. You may distribute and/or modify it under       }
{ the terms of the GNU General Public License version 2. (see GPL-2.0-EN.txt)  }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id$ }
{                                                                              }
{ TODO:                                                                        }
{ - Anpassung der Combobox für Adressen (History usw.)                         }
{ - Beschreibung der Implementierung in das Projekt checken/korrigieren        }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 17.02.2005 - Thomas Sauerland: Version 1.0.0.1 released }
{ 30.03.2005 - Thomas Sauerland: Version 1.0.0.2 released }
{            - Änderung der benutzten Komponenten nach Hinweis von Jan P. }
{ 24.03.2005 - Einbau der Googlesuche }
{            - Änderung der Combobox - Gehe zu Adresse nach Auswahl aus der Liste }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

(* Anleitung zur Implementierung (lexa 30.10.2009: ungetestet!):
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

of_browser.pas zum Projekt hinzufügen...

in File: OF_MAIN:

uses of_browser;

while i <= MainPanel.ControlCount-1 do begin
   with MainPanel.Controls[i] do
      if owner <> self then begin
         // Für den Browser
         if Owner=frmBrowser then begin
            frmBrowser.FormDeactivate(Sender);
            frmBrowser.OnUpdateStatusBar := nil;
         end;


...und...

if Modul>0 then begin
   if DM1.CaoSecurity.CanOpenModul (Modul,0) then begin
      ActiveModul :=Modul;
      case Modul of
      // Für den Browser
         1990: //Neue ID!!!
            begin
               frmBrowser.OnUpdateStatusBar := OnUpdateStatusBar;
               frmBrowser.pnlBrowse.Parent := MainPanel;
               frmBrowser.FormActivate (Sender);
               LastMenu :=frmBrowser.Mainmenu1;
            end;
}

*)

unit OF_Browser;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, Menus, ImgList, OleCtrls, SHDocVw, ComCtrls,
  StdCtrls, ToolWin, ExtCtrls, ActiveX, MSHTML, OF_Var_Const, JvMenus;

//Die Glyphs sind von http://www.glyfx.com/ dort gibt es einen Freeware Teil
//zum downloaden !!!


type
  TfrmBrowser = class(TForm)
    pnlBrowse: TPanel;
    BrowserBar: TToolBar;
    Label1: TLabel;
    ToolButton2: TToolButton;
    btnBack: TToolButton;
    btnNext: TToolButton;
    btnCancel: TToolButton;
    btnRefresh: TToolButton;
    ToolButton8: TToolButton;
    btnHome: TToolButton;
    BrowserStatBar: TStatusBar;
    imgBrowser: TImageList;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    btnPrint: TToolButton;
    btnPrintPreview: TToolButton;
    btnCAO: TToolButton;
    ToolButton1: TToolButton;
    MainMenu1: TJvMainMenu;
    ToolButton4: TToolButton;
    btnSpoof: TToolButton;
    btnLoginForm: TToolButton;
    ToolButton6: TToolButton;
    caoBrowse: TWebBrowser;
    cmbAddress: TComboBox;
    ToolButton3: TToolButton;
    edSearch: TEdit;
    lblSearc: TLabel;
    btnSearch: TToolButton;
    Extras1: TMenuItem;
    procedure cmbAdressKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintPreviewClick(Sender: TObject);
    procedure caoBrowseDocumentComplete(Sender: TObject;
    const pDisp: IDispatch; var URL: OleVariant);
    procedure caoBrowseStatusTextChange(Sender: TObject;
    const Text: WideString);
    procedure caoBrowseTitleChange(Sender: TObject;
    const Text: WideString);
    procedure caoBrowseDownloadComplete(Sender: TObject);
    procedure btnCAOClick(Sender: TObject);
    procedure favMenuURLSelected(Sender: TObject; Url: String);
    procedure btnSpoofClick(Sender: TObject);
    procedure btnLoginFormClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edSearchKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure cmbAddressClick(Sender: TObject);
    procedure caoBrowseCommandStateChange(Sender: TObject;
    Command: Integer; Enable: WordBool);
  private
    { Private-Deklarationen }
    app: String;
    FOleInPlaceActiveObject: IOleInPlaceActiveObject;
    procedure MsgHandler(var Msg: TMsg; var Handled: Boolean);
    procedure Navi2Page(URL: String);
    procedure Wait;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar: TOnUpdateStatusBar;
    defAdresse, actAdresse: String;
  end;
    
    function VariantIsObject(const value: OleVariant): boolean;
    procedure WB_GetObjectView(TV: TTreeView; WB: TWebBrowser);
    
var
  frmBrowser: TfrmBrowser;
  
implementation

uses
  gnugettext,
  OF_DM, OFSecurity;

{$R *.dfm}

Const
  ModulID: Integer = 1990;

function VariantIsObject(const value: OleVariant): boolean;
begin
  result := (VarType(value) = varDispatch);
end;

procedure WB_GetObjectView(TV: TTreeView; WB: TWebBrowser);
var
  i, j, k: Integer;
  FormItem, Element, SubElement: OleVariant;
  root: TTreeNodes;
  child, child2, child3: TTreeNode;
  s_type: string;
begin
  root := TV.Items;
  root.Clear;
  TV.Items.BeginUpdate;
  try
    // count forms on document
    for I := 0 to WB.OleObject.Document.forms.Length-1 do
    begin
      FormItem := WB.OleObject.Document.forms.Item(I);

      if VariantIsObject(FormItem.Name) then
        child := root.AddChild(nil, 'Form' + IntToStr(i) + ': ' + FormItem.Name.Name)
      else
        child := root.AddChild(nil, 'Form' + IntToStr(i) + ': ' + FormItem.Name);

      child.ImageIndex := 3;
      child.SelectedIndex := 3;

      for j := 0 to FormItem.Length-1 do
      begin
        try
          Element := FormItem.Item(j);
          // when the fieldname is found, try to fill out
          child2 := root.AddChild(child, Element.Name + ' = ' + Element.Value);
          s_type := Element.Type;

          if s_type = 'submit' then
            child2.ImageIndex := 1
          else 
          if s_type = 'text' then
            child2.ImageIndex := 0
          else 
          if s_type = 'file' then
            child2.ImageIndex := 2
          else 
          if s_type = 'hidden' then
            child2.ImageIndex := 4
          else 
          if s_type = 'checkbox' then
            child2.ImageIndex := 5
          else 
          if s_type = 'radio' then
            child2.ImageIndex := 6
          else 
          if s_type = 'select-one' then
            child2.ImageIndex := 7
          else
            child2.ImageIndex := -1;

          child2.SelectedIndex := child2.ImageIndex;

          child3 := root.AddChild(child2, s_type);
          child3.ImageIndex := -1;
          child3.SelectedIndex := -1;

          if s_type = 'text' then
          begin
            child3 := root.AddChild(child2, 'MaxLen=' + IntToStr(Element.maxLength));
            child3.ImageIndex := -1;
            child3.SelectedIndex := -1;
          end else 
          if s_type = 'select-one' then
          begin
            for k := 0 to Element.Options.Length-1 do
            begin
              SubElement := Element.Options.Item(k);
              child3 := root.AddChild(child2, SubElement.Text + ' = <' + SubElement.Value + '>');
              child3.ImageIndex := -1;
              child3.SelectedIndex := -1;
            end;
          end;
        except
          on E: Exception do
            root.AddChild(child, E.Message);
        end;
      end;
    end;
    if root.Count > 0 then
      root.GetFirstNode.Expand(True);
  finally
    TV.Items.EndUpdate;
  end;
end;

function FillForm(WebBrowser: TWebBrowser; FieldName: string; Value: string): Boolean;
var
  i, j: Integer;
  FormItem: Variant;
begin
  Result := False;
  //no form on document
  if WebBrowser.OleObject.Document.all.tags('FORM').Length = 0 then
  begin
    Exit;
  end;
  //count forms on document
  for I := 0 to WebBrowser.OleObject.Document.forms.Length-1 do
  begin
    FormItem := WebBrowser.OleObject.Document.forms.Item(I);
    for j := 0 to FormItem.Length-1 do
    begin
      try
        //when the fieldname is found, try to fill out
        if FormItem.Item(j).Name = FieldName then
        begin
          FormItem.Item(j).Value := Value;
          Result := True;
        end;
      except
        Exit;
      end;
    end;
  end;
end;

// Zum behandeln der Entertaste im Browser!
// Default: Entertaste wird nicht unterstützt!
procedure TfrmBrowser.MsgHandler(var Msg: TMsg; var Handled: Boolean);
const
  StdKeys = [VK_BACK, VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT];
var 
  IOIPAO: IOleInPlaceActiveObject;
  Dispatch: IDispatch;
begin
  if caoBrowse = nil then
  begin
    Handled := False;
    Exit;
  end;
  Handled := (IsDialogMessage(caoBrowse.Handle, Msg) = True);
  if (Handled) and (not caoBrowse.Busy) then
  begin
    if FOleInPlaceActiveObject = nil then
    begin
      Dispatch := caoBrowse.Application;
      if Dispatch <> nil then
      begin
        Dispatch.QueryInterface(IOleInPlaceActiveObject, IOIPAO);
        if IOIPAO <> nil then FOleInPlaceActiveObject := IOIPAO;
      end;
    end;
    if FOleInPlaceActiveObject <> nil then
    begin
      if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP)) and (Msg.wParam in StdKeys) then
        //nothing  -  do not pass on Backspace, Left, Right, Up, Down arrows
      else 
        FOleInPlaceActiveObject.TranslateAccelerator(Msg);
    end;
  end;
end;

procedure TfrmBrowser.Navi2Page(URL: String);
begin
  caoBrowse.Navigate(URL);
  Wait;
end;

procedure TfrmBrowser.Wait;
begin
  while caoBrowse.ReadyState <> READYSTATE_COMPLETE do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
  while caoBrowse.Busy = True do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
end;

procedure TfrmBrowser.cmbAdressKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    caoBrowse.Navigate(cmbAddress.Text);
end;

procedure TfrmBrowser.FormActivate(Sender: TObject);
var 
  Url: String;
begin
  if actAdresse <> '' then
    caoBrowse.Navigate(actAdresse)
  else
  begin
    //caoBrowse.Navigate(defAdresse);
    URL := DM1.ReadStringU ('', 'WebBrowser-Url', '');
    if length(URL) > 0 then 
      caoBrowse.Navigate(URL)
    else 
      caobrowse.goHome;
  end;
end;

procedure TfrmBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Do nothing
end;

procedure TfrmBrowser.FormCloseQuery(Sender: TObject;
var
  CanClose: Boolean);
begin
  //cmbAddress.Items.SaveToFile(app+'adr.dat');
  //JP28072005
  DM1.WriteLongStringU ('', 'WebBrowser-Historie', cmbAddress.Items.CommaText);
end;

procedure TfrmBrowser.FormCreate(Sender: TObject);
begin
  try
    TranslateComponent(self);
  except
  end;

  //JP05082005
  btnSpoof.Visible     := False;
  btnLoginForm.Visible := False;

  // Zunächst Navi-Buttons deaktivieren
  BtnBack.Enabled      := False;
  BtnNext.Enabled      := False;

  app := ExtractFilePath(Application.Exename);
  Application.OnMessage := MsgHandler;
  //OnUpdateStatusBar :=nil;

  //cmbAddress.Items.LoadFromFile(app+'adr.dat');
  //JP28072005
  cmbAddress.Items.CommaText := DM1.ReadLongStringU ('', 'WebBrowser-Historie', '');

  defAdresse := 'http://www.open-faktura.org/';
  actAdresse := '';
end;

procedure TfrmBrowser.FormShow(Sender: TObject);
begin
  //Do nothing
end;

procedure TfrmBrowser.FormDeactivate(Sender: TObject);
begin
  actAdresse := cmbAddress.Text;
end;

procedure TfrmBrowser.btnBackClick(Sender: TObject);
begin
  caoBrowse.GoBack;
end;

procedure TfrmBrowser.btnNextClick(Sender: TObject);
begin
  caoBrowse.GoForward;
end;

procedure TfrmBrowser.btnCancelClick(Sender: TObject);
begin
  caoBrowse.Stop;
end;

procedure TfrmBrowser.btnRefreshClick(Sender: TObject);
begin
  caoBrowse.Refresh;
end;

procedure TfrmBrowser.btnHomeClick(Sender: TObject);
begin
  caoBrowse.GoHome;
end;

procedure TfrmBrowser.btnPrintClick(Sender: TObject);
var
  vaIn, vaOut: OleVariant;
begin
  caoBrowse.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER,
  vaIn, vaOut);
end;

procedure TfrmBrowser.btnPrintPreviewClick(Sender: TObject);
var
  vaIn, vaOut: OleVariant;
begin
  caoBrowse.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
  OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
end;

// Technologietest ;-)

procedure TfrmBrowser.caoBrowseDocumentComplete(Sender: TObject;
const pDisp: IDispatch; var URL: OleVariant);
var
  WebDoc: HTMLDocument;
  WebBody: HTMLBody;
  CurWebrowser: IWebBrowser;
  TopWebBrowser: IWebBrowser;
  WebDocument: OleVariant;
  WindowName: string;
begin
  CurWebrowser := pDisp as IWebBrowser;
  TopWebBrowser := (Sender as TWebBrowser).DefaultInterface;
  if CurWebrowser = TopWebBrowser then
  begin
    BrowserStatBar.Panels[0].Text := 'Dokument wurde vollständig geladen';
  end else
  begin
    WebDocument := CurWebrowser.Document;
    WindowName := WebDocument.ParentWindow.Name;
    BrowserStatBar.Panels[0].Text := Format('Frame "%s" wurde geladen', [WindowName]);
  end;
  {$IFDEF TECHTEST}
  WebDoc := caoBrowse.Document as HTMLDocument;
  WebBody := WebDoc.body as HTMLBody;
  WebBody.insertAdjacentHTML('BeforeEnd', '<div align="center"><font face="Tahoma">Visited with Open-Faktura</font></div>');
  {$ENDIF}
  //BrowserStatBar.Panels[0].Text := 'Bereit';

  //JP28072005
  //cmbAddress.Items.Add(URL);
  // nur hinzufügen wenn noch nicht vorhanden
  if cmbAddress.Items.IndexOf (URL) = -1 then
  begin
    cmbAddress.Items.Insert(0, URL);  //an erster Stelle einfügen
    while cmbAddress.Items.Count > 100 do  // max. 100 URL's merken
      cmbAddress.Items.Delete (cmbAddress.Items.Count-1);
  end;

  cmbAddress.ItemIndex := cmbAddress.Items.IndexOf (URL);

  //WB_GetObjectView(TreeView1, caoBrowse);
end;

procedure TfrmBrowser.caoBrowseStatusTextChange(Sender: TObject;
const 
  Text: WideString);
begin
  BrowserStatBar.Panels[0].Text := Text;
end;

procedure TfrmBrowser.caoBrowseTitleChange(Sender: TObject;
const 
  Text: WideString);
begin
  BrowserStatBar.Panels[1].Text := Text;
end;

procedure TfrmBrowser.caoBrowseDownloadComplete(Sender: TObject);
begin
  BrowserStatBar.Panels[0].Text := 'Download beendet!';
end;

procedure TfrmBrowser.btnCAOClick(Sender: TObject);
begin
  caoBrowse.Navigate(defAdresse);
end;

procedure TfrmBrowser.favMenuURLSelected(Sender: TObject;
Url: String);
begin

end;

// Diese Sache kommt eigentlich aus dem sogenannten Spoofing,
// allerdings ist es auch bei einigen meiner Lieferanten ganz
// nützlich ;-) - Ganz legal!!!
procedure TfrmBrowser.btnSpoofClick(Sender: TObject);
var
  Flags, Headers, TargetFrameName, PostData: OLEVariant;
  Url, Ref: string;
begin
  Flags := '1';
  TargetFrameName := '';
  PostData := '';

  Url := InputBox(_('Target eingeben...'), _('URL:'), '');
  Ref := InputBox(_('Referer eingeben...'), _('Url:'), '');

  Headers := _('Referer:') + ' ' + Ref + #10#13;
  caoBrowse.Navigate(Url, Flags, TargetFrameName, PostData, Headers);
end;

// Das soll später automatisiert sein, wenn es denn ins CAO übernommen wird... (Lieferanten-DB usw.)
procedure TfrmBrowser.btnLoginFormClick(Sender: TObject);
var
  sPage, sUser, sPass: String;
begin
  //Geht auf die Website
  sPage := InputBox(_('Adresse eingeben'), _('URL:'), '');
  Navi2Page(sPage);
  //Gibt die Benutzerinfos in die Felder ein
  sUser := InputBox(_('Benutzername eingeben'), _('Name:'), '');
  sPass := InputBox(_('Passwort eingeben'), _('Passwort:'), '');
  // Das sollte natürlich Seitenabhängig sein, die Namen wählt ja jeder Webmaster selber!!!
  // Ich stelle mir einen einmaligen Aufruf vor, der die Seite parst und in einer Tabelle
  // dann Adresse, Benutzername, Passwort und die Feldnamen speichert!
  FillForm(caoBrowse, 'usrname', sUser);
  FillForm(caoBrowse, 'pass', sPass);
  //Schickt das ganze an den Server
  caoBrowse.OleObject.Document.forms.item(1).submit;
end;

procedure TfrmBrowser.FormDestroy(Sender: TObject);
begin
  FOleInPlaceActiveObject := nil;
end;

procedure TfrmBrowser.btnSearchClick(Sender: TObject);
const
  GOOGLE_QUERY = 'http://www.google.com/search?ie=ISO-8859-1&hl=de&q=';
var
  sQuery: string;
begin
  sQuery := GOOGLE_QUERY + edSearch.Text;
  Navi2Page(sQuery);
end;

procedure TfrmBrowser.edSearchKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearchClick(self);
end;

procedure TfrmBrowser.cmbAddressClick(Sender: TObject);
begin
  caoBrowse.Navigate(cmbAddress.Text);
end;

procedure TfrmBrowser.caoBrowseCommandStateChange(Sender: TObject;
Command: Integer; Enable: WordBool);
begin
  case Command of
    CSC_NAVIGATEBACK:    BtnBack.Enabled := Enable;
    CSC_NAVIGATEFORWARD: BtnNext.Enabled := Enable;
  end;
end;

initialization
  OleInitialize(nil);

finalization
  OleUninitialize;
  
end.

