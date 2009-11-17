{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : About-Box and some legal mumbo jumbo                              }
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
{ $Id:$ }
{                                                                              }
{ TODO:                                                                        }
{ - Line 99: Add proper License Info                                           }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

unit OF_About;

{$I OF.INC}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF COMPILER_D6_UP}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  Grids, JvGIF, JvComponent, JvRichEdit;

type
  TAboutBox = class(TForm)
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    LicenseRTFEdi: TRichEdit;
    laCopyright: TLabel;
    Panel1: TPanel;
    OKButton: TBitBtn;
    SG1: TStringGrid;
    Image1: TImage;
    DeveloperRTFEdi: TRichEdit;
    SNEdi: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;


implementation

uses
  JvclVer, GNUGetText,
  OF_DM, OF_Backup, ZConnection;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TAboutBox.FormCreate(Sender: TObject);
var
  TempStream: TResourceStream;
begin
  try TranslateComponent (self);
  except
  end;

  laCopyRight.Caption :=
    #13#10+
    '© 2009 - Open-Faktura Team'+#13#10+
    'Dieses Programm ist eine freie Software.'+#13#10+
    'Das Programm sowie der Sourcecodes unterliegen'+#13#10+
    'der GPL v2 Lizenz.';

  //07.10.09-ud. - Resourcen werden nicht mehr eingebunden..
  (*
  TempStream := TResourceStream.Create(hInstance, 'DEVELOPERS_RTF', RT_RCDATA);
  try
    TempStream.Position := 0;
    DeveloperRTFEdi.Lines.LoadFromStream(TempStream);
  finally
    TempStream.Free;
  end;

  TempStream := TResourceStream.Create(hInstance, 'LICENSE_RTF', RT_RCDATA);
  try
    TempStream.Position := 0;
    LicenseRTFEdi.Lines.LoadFromStream(TempStream);
  finally
    TempStream.Free;
  end;
  *)
end;

//------------------------------------------------------------------------------
procedure TAboutBox.FormShow(Sender: TObject);
var
  puffer  : array [0..255] of Char;
  dc      : hdc;
  FarbStr : String;
  m       : double;
  s       : tMEMORYSTATUS;
  ST      : String;
  BackupForm : TBackupForm;
begin
  PC1.ActivePage := PC1.Pages[0];

  SNEdi.Text := DM1.OF_SN;

  s.dwLength := sizeof (s);
  GlobalMemoryStatus(s);

  with SG1 do
  begin
    Cells[0,0] := _('Programm');     Cells[1,0] := Application.Title+' ('+GetProjectVersion+')';
    Cells[0,1] := _('ZEOS-DB');      Cells[1,1] := DM1.DB1.Version;
    Cells[0,2] := _('MySQL-Client'); Cells[1,2] := DM1.DB1.ClientVersionStr; //DM1.Transact1.GetClientInfo;  //17.10.09-ud. ???
    Cells[0,3] := _('MySQL-Server'); Cells[1,3] := DM1.DB1.ServerVersionStr; //DM1.Transact1.GetServerInfo;  //17.10.09-ud. ???
    Cells[0,4] := _('Verbindung');   Cells[1,4] := DM1.DB1.HostName; //DM1.Transact1.GetHostInfo;    //17.10.09-ud. ???
    Cells[0,5] := _('Benutzername'); Cells[1,5] := DM1.CAOSecurity.CurrUser;
    Cells[0,6] := _('Rechnername');  Cells[1,6] := DM1.Comp;

    m := s.dwTotalPhys / 1024;
    Cells[0,7] := _('Phys. Speicher'); Cells[1,7] := formatfloat(',###,##0.00',m) + ' kByte';

    m := s.dwAvailPhys / 1024;
    Cells[0,8] := _('davon frei');     Cells[1,8] := formatfloat(',###,##0.00',m) + ' kByte';

    fillchar(puffer, sizeof(puffer){254}, #0);
    GetWindowsDirectory(@puffer, 255);
    cells[0,9] := _('Windowsverzeichnis'); Cells[1,9] := puffer;

    GetSystemDirectory(@puffer,255);
    cells[0,10] := _('Systemverzeichnis'); Cells[1,10] := puffer;

    Cells[0,11] := _('Festplatte Laufwerk C:'); Cells[1,11] := formatfloat(',#0.00',disksize (3) / 1024 / 1024)+' MByte';
    Cells[0,12] := _('Freier Speicher auf C:'); Cells[1,12] := formatfloat(',#0.00',diskfree (3) / 1024 / 1024)+' MByte';
    Cells[0,13] := _('Zeit');
    Cells[0,14] := _('Zeit seit Systemstart');
    Cells[0,15] := _('Datum');                  Cells[1,15] := formatdatetime('dd.mm.yyyy',now);
    Cells[0,16] := _('Grafikauflösung');        Cells[1,16] := inttostr(screen.width)+'x'+inttostr(screen.height);

    dc := CreateDC('DISPLAY', nil, nil, nil);
    try
      case GetDeviceCaps(DC, BITSPIXEL) of
        1  : Farbstr := _('2 Farben');
        4  : Farbstr := _('16 Farben');
        8  : Farbstr := _('256 Farben');
        16 : Farbstr := _('16 bit Farbtiefe');
        24 : Farbstr := _('24 bit Farbtiefe');
        32 : Farbstr := _('32 bit Farbtiefe');
        else Farbstr := _('unbekannte Anz. Farben');
      end;
      cells[0,17] := _('Farben'); Cells[1,17] := FarbStr;
    finally
      DeleteDC(dc);
    end;
    Cells[0,18] := 'Jedi-VCL';   Cells[1,18] := JVCL_VERSIONSTRING;
    BackupForm := TBackupForm.Create(Self); //???
    try
      Cells[0,19] := 'TZipMaster'; Cells[1,19] := BackupForm.Zip.VersionInfo;
      Str(BackupForm.Zip.ZipVers/100:3:2, ST);
      Cells[0,20] := 'zipdll.dll'; Cells[1,20] := ST;
      Str(BackupForm.Zip.UnzVers/100:3:2, ST);
      Cells[0,21] := 'unzdll.dll'; Cells[1,21] := ST;
    finally
      FreeAndNil(BackupForm);
    end;

  end;
end;

//------------------------------------------------------------------------------
procedure TAboutBox.Timer1Timer(Sender: TObject);
var
  days: integer;
  zeit: tdatetime;
begin
  with SG1 do
  begin
    cells[1,13] := timetostr(time)+' '+_('Uhr');
    days := trunc(gettickcount / 1000 / 24 / 60 / 60);
    zeit :=  frac(gettickcount / 1000 / 24 / 60 / 60);
    cells[1,14] := Inttostr(Days)+' Tag(e), '+
                   formatdatetime(_('h "Stunden", m "Minuten und "s "Sek."'),
                   zeit);
    cells[1,15] := FormatDateTime('dddd, dd.mm.yyyy', now);
  end;
end;

//------------------------------------------------------------------------------
procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  PC1.ActivePage := TabSheet1;
  Close;
end;

//------------------------------------------------------------------------------

end.

