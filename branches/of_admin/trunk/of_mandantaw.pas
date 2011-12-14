{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Mandantenauswahl                                           }
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
{ $Id: of_mandantaw.pas 36 2011-12-02 13:03:44Z chris $ }
{                                                                              }
{ OLDTODO:                                                                     }
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 09.05.2003 - Unit zum GNU-Source hinzugefügt }
{ 12.07.2003 - Code zur erstellung eines neuen Mandanten hinzugefügt }
{            - Layout komplett überarbeitet }
{ 16.11.2003 - Mandant löschen hinzugefügt }
{ 06.11.2004 - Unit für Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit of_mandantaw;

{$I OF.INC}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TMandantAWForm }

  TMandantAWForm = class(TForm)
    AktMandantLab: TLabel;
    CloseBtn: TBitBtn;
    DBEdi: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MandantDelBtn: TBitBtn;
    MandantLB: TListBox;
    NeuBtn: TBitBtn;
    NextMandantLab: TLabel;
    PasEdi: TEdit;
    PortEdi: TEdit;
    SrvEdi: TEdit;
    UsrEdi: TEdit;
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MandantCBChange(Sender: TObject);
    procedure MandantDelBtnClick(Sender: TObject);
    procedure NeuBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MandantAWForm: TMandantAWForm;

implementation

uses
    of_dm, of_var_const, of_admin_newmandant;

{ TMandantAWForm }

procedure TMandantAWForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  MandantLB.Items.Clear;
  if length(dm1.mandanttab) = 0 then
  begin
    NeuBtnClick(Sender);
    exit;
  end;

  for i := 0 to Length(dm1.mandanttab)-1 do
    MandantLB.Items.Add (dm1.mandanttab[i].Name);

  for i := 0 to MandantLB.Items.Count-1 do
  begin
    if uppercase(MandantLB.Items[i]) = uppercase(dm1.AktMandant) then
    begin
      MandantLB.ItemIndex := I;
      break;
    end;
  end;

  AktMandantLab.Caption := DM1.AktMandant;

  MandantCBChange(Sender);
end;

procedure TMandantAWForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

procedure TMandantAWForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMandantAWForm.MandantCBChange(Sender: TObject);
var
  Mandant: TMandantRec;
begin
  MandantDelBtn.Enabled := (MandantLB.ItemIndex >= 0) and (MandantLB.items.count > 0);

  if (MandantLB.ItemIndex < 0) or (MandantLB.ItemIndex > MandantLB.items.count-1) then
    exit;

  if DM1.GetMandant(MandantLB.Items[MandantLB.ItemIndex], Mandant) then
  begin
    SrvEdi.Text  := Mandant.Server;
    DBEdi.Text   := Mandant.DB;
    UsrEdi.Text  := Mandant.User;
    PasEdi.Text  := Mandant.Pass;
    PortEdi.Text := IntToStr(Mandant.Port);
    NextMandantLab.Caption := Mandant.Name;
  end;
end;

procedure TMandantAWForm.MandantDelBtnClick(Sender: TObject);
begin
  if dm1.AktMandant = MandantLB.Items[MandantLB.ItemIndex] then
  begin
    MessageDlg ('Der aktuell geladene Mandant kann nicht gelöscht werden.',
      mterror, [mbok], 0);
  end else
  begin
    if MessageDlg ('Wollen Sie diesen Mandant wirklich löschen ?' + #13#10 +
      'Aus Sicherheitsgründen wird die Datenbank ' +
      'nicht gelöscht,' + #13#10 +
      'dies müssen Sie per Hand tun.', mterror, [mbYes, mbNo], 0) = mryes then
    begin
      DM1.DeleteMandant (MandantLB.Items[MandantLB.ItemIndex]);
      MandantLB.Items.Delete (MandantLB.ItemIndex);
      MandantLB.ItemIndex := MandantLB.Items.IndexOf(DM1.AktMandant);
      MandantCBChange (Sender);
    end;
  end;
end;

procedure TMandantAWForm.NeuBtnClick(Sender: TObject);
var
  NewMandantDlg: TNewMandantDlg;
begin
  NewMandantDlg := TNewMandantDlg.Create(Self);
  try
    // Öffnet den Dialog zur Mandanten-Neuanlage.
    // Gibt TRUE zurück, wenn Mandant angelegt werden kann.
    if NewMandantDlg.AddMandant then
    begin
      if (DM1.AktMandant <> '') and (DM1.MandantOK) then
      begin
        DM1.InitMandantAfterOpen;
      end;
    end;
  finally
    NewMandantDlg.Free;
  end;

  FormShow(self);
end;



{$R *.lfm}

end.

