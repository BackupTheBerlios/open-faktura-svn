{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : Dialog Mandantenauswahl                                           }
{                                                                              }
{ Dieser Programmcode basiert auf Quellen von CAO-Faktura (c) by Jan Pokrandt  }
{ (Jan@JP-Soft.de) und  geh�rt zum Projekt Open-Faktura.                       }
{ Er wird unter der GNU General Public License Version 2 ohne Zusage der       }
{ Eignung f�r irgendeinen Zweck ver�ffentlicht. (siehe Datei GPL-2.0-DE.txt)   }
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
{ -                                                                            }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 09.05.2003 - Unit zum GNU-Source hinzugef�gt }
{ 12.07.2003 - Code zur erstellung eines neuen Mandanten hinzugef�gt }
{            - Layout komplett �berarbeitet }
{ 16.11.2003 - Mandant l�schen hinzugef�gt }
{ 06.11.2004 - Unit f�r Mehrsprachigkeit vorbereitet (GNU-Gettext) }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_MandantAW;

interface

{$I OF.INC}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMandantAWForm = class(TForm)
    MandantLB: TListBox;
    CloseBtn: TBitBtn;
    MandantDelBtn: TBitBtn;
    NeuBtn: TBitBtn;
    PasEdi: TEdit;
    Label4: TLabel;
    UsrEdi: TEdit;
    Label3: TLabel;
    DBEdi: TEdit;
    Label5: TLabel;
    PortEdi: TEdit;
    Label12: TLabel;
    SrvEdi: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    NextMandantLab: TLabel;
    Label1: TLabel;
    AktMandantLab: TLabel;
    procedure FormShow(Sender: TObject);
    procedure MandantCBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NeuBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure MandantDelBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

//var
//  MandantAWForm: TMandantAWForm;

implementation

uses
  GNUGetText,
  OF_DM, OF_Var_Const, OF_Admin_NewMandant;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TMandantAWForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  try 
    TranslateComponent (self);  
  except 
  end;

  if Screen.PixelsPerInch <> 96 then
  begin
    Self.ScaleBy (96, Screen.PixelsPerInch);
    Refresh;
  end;
end;

//------------------------------------------------------------------------------
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

//------------------------------------------------------------------------------
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

//------------------------------------------------------------------------------
procedure TMandantAWForm.NeuBtnClick(Sender: TObject);
var
  NewMandantDlg: TNewMandantDlg;
begin
  NewMandantDlg := TNewMandantDlg.Create(Self);
  try
    // �ffnet den Dialog zur Mandanten-Neuanlage.
    // Gibt TRUE zur�ck, wenn Mandant angelegt werden kann.
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

//------------------------------------------------------------------------------
procedure TMandantAWForm.MandantDelBtnClick(Sender: TObject);
begin
  if dm1.AktMandant = MandantLB.Items[MandantLB.ItemIndex] then
  begin
    MessageDlg (_('Der aktuell geladene Mandant kann nicht gel�scht werden.'),
      mterror, [mbok], 0);
  end else
  begin
    if MessageDlg (_('Wollen Sie diesen Mandant wirklich l�schen ?' + #13#10 +
      'Aus Sicherheitsgr�nden wird die Datenbank ' +
      'nicht gel�scht,' + #13#10 +
      'dies m�ssen Sie per Hand tun.'), mterror, [mbYes, mbNo], 0) = mryes then
    begin
      DM1.DeleteMandant (MandantLB.Items[MandantLB.ItemIndex]);
      MandantLB.Items.Delete (MandantLB.ItemIndex);
      MandantLB.ItemIndex := MandantLB.Items.IndexOf(DM1.AktMandant);
      MandantCBChange (Sender);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMandantAWForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

end.

