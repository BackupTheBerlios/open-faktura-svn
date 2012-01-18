{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    :                                                                   }
{                                                                              }
{ Dieser Programmcode gehört zum Projekt Open-Faktura.                         }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung für irgendeinen Zweck veröffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
{******************************************************************************}
{                                                                              }
{ This program code is part of the Open-Faktura project.                       }
{ You may distribute and/or modify it under the terms of the                   }
{ GNU General Public License version 2. (see GPL-2.0-EN.txt)                   }
{                                                                              }
{       ******* Open-Faktura comes with ABSOLUTELY NO WARRANTY *******         }
{******************************************************************************}
{ $Id$ }
(*******************************************************************************
  TODO:
  -

  ISSUES, NOTES:
  -

  HISTORY:
  dd.mm.yyyy - nn:

*******************************************************************************)

unit frMain;

{$mode objfpc}{$H+}

interface

uses
  Forms,
  Controls,
  Menus,
  ActnList,
  ComCtrls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  OFPanel,
  rxtoolbar,
  rxctrls,
  OFFlatPanel,
  OFFlatTabControl,
  OFPageList, ovcurl;

type

  { TForm1 }

  TForm1 = class(TForm)
    Action1:    TAction;
    Action2:    TAction;
    Action3:    TAction;
    Action4:    TAction;
    ActionList1: TActionList;
    btnAllgemein: TSpeedButton;
    CheckBox1:  TCheckBox;
    CheckBox2:  TCheckBox;
    CheckBox3:  TCheckBox;
    CheckBox4:  TCheckBox;
    CheckBox5:  TCheckBox;
    CheckBox6:  TCheckBox;
    CheckBox7:  TCheckBox;
    CheckBox8:  TCheckBox;
    Label1:     TLabel;
    Label10:    TLabel;
    Label11:    TLabel;
    Label12:    TLabel;
    Label13:    TLabel;
    Label14:    TLabel;
    Label15:    TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label3:     TLabel;
    Label4:     TLabel;
    Label5:     TLabel;
    Label6:     TLabel;
    Label7:     TLabel;
    Label8:     TLabel;
    Label9:     TLabel;
    OFFlatPanel3: TOFFlatPanel;
    OFFlatPanel4: TOFFlatPanel;
    OFFlatPanel5: TOFFlatPanel;
    OFFlatPanel6: TOFFlatPanel;
    OFFlatPanel7: TOFFlatPanel;
    OFFlatPanel8: TOFFlatPanel;
    OvcURL1: TOvcURL;
    plMandant:  TOFPageList;
    paMitarbeiter: TPanel;
    ExtPanel5:  TPanel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Label2:     TLabel;
    btnListe:   TSpeedButton;
    MainMenu1:  TMainMenu;
    MenuItem1:  TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2:  TMenuItem;
    MenuItem3:  TMenuItem;
    MenuItem4:  TMenuItem;
    MenuItem5:  TMenuItem;
    MenuItem6:  TMenuItem;
    MenuItem7:  TMenuItem;
    MenuItem8:  TMenuItem;
    MenuItem9:  TMenuItem;
    OFFlatPanel1: TOFFlatPanel;
    OFFlatPanel2: TOFFlatPanel;
    OFFlatTabControl1: TOFFlatTabControl;
    plMitarbeiter: TOFPageList;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    Splitter1:  TSplitter;
    StatusBar1: TStatusBar;
    ToolPanel1: TToolPanel;
    TopPan:     TOFPanel;
    TreeView1:  TTreeView;
    UNBPage1:   TUNBPage;
    UNBPage2:   TUNBPage;
    UNBPage3:   TUNBPage;
    UNBPage4:   TUNBPage;
    UNBPage5:   TUNBPage;
    UNBPage6:   TUNBPage;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure btnAllgemeinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListeClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure OFFlatTabControl1TabChanged(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Action1Execute(Sender: TObject);
begin
  //
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  //
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  //
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
  //
end;

procedure TForm1.btnAllgemeinClick(Sender: TObject);
begin
  plMitarbeiter.PageIndex := 0;
end;

procedure TForm1.btnListeClick(Sender: TObject);
begin
  plMitarbeiter.PageIndex := 1;
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.OFFlatTabControl1TabChanged(Sender: TObject);
begin
  plMandant.PageIndex := OFFlatTabControl1.ActiveTab;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //
end;

end.

