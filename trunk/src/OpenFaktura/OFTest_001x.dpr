{******************************************************************************}
{        Copyright (c) 2009 Open-Faktura Team / www.open-faktura.org           }
{******************************************************************************}
{ PROJEKT  : Open-Faktura                                                      }
{ MODUL    : <Delphi Project File>                                             }
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
{ - IFDEF ALPHA entfernen                                                      }
{ - Application.Name  := 'CAO'                                                 }
{ - "Open-Faktura v0.1" als Konstante hinterlegen                              }
{ - Splash-Screen nicht modal                                                  }
{                                                                              }
{ ISSUES, NOTES:                                                               }
{ -                                                                            }
{                                                                              }
{ HISTORY:                                                                     }
{ 30.10.2009 - UD: Initiale Version (CAO Fork by Open-Faktura Projekt)         }
{                                                                              }
{******************************************************************************}

{$I OF.INC}

{$DESCRIPTION 'freie Warenwirtschaft Open-Faktura'}

program OFTest_001x;

uses
  Forms,
  Dialogs,
  Controls,
  Sysutils,
  Graphics,
  ActnList,
  ExtCtrls,
  VolDBEdit,
  ShDocVW,
  DB,
  DBCtrls,
  ZDataset,
  ZSQLUpdate,
  ZSQLProcessor,
  ZConnection,
  OFSecurity,
  JvStringHolder,
  FR_DBSet,
  FR_Desgn,
  FR_Class,
  FR_Rich,
  FR_ChBox,
  FR_Shape,
  FR_BarC,
  FR_Chart,
  FR_E_TNPDF,
  OF_MAIN in 'OF_Main.pas' {MainForm},
  OF_DM in 'OF_DM.pas' {DM1: TDataModule},
  OF_Var_Const in 'OF_Var_Const.pas',
  OF_Logging in 'OF_Logging.pas' {LogForm},
  OF_DBGrid_Layout in 'OF_DBGrid_Layout.pas' {VisibleSpaltenForm},
  OF_Tool1 in 'OF_Tool1.pas',
  OF_About in 'OF_About.pas' {AboutBox},
  OF_KUNDE in 'Of_KUNDE.pas' {AdressForm},
  OF_ARTIKEL1 in 'OF_ARTIKEL1.pas' {ArtikelForm},
  OF_KFZ1 in 'OF_KFZ1.pas' {KFZForm},
  OF_Info in 'OF_Info.pas' {InfoForm},
  OF_PLZ in 'OF_PLZ.pas' {PLZForm},
  OF_BLZ in 'OF_BLZ.pas' {BLZForm},
  OF_FreePrintRech in 'OF_FreePrintRech.pas' {PrintRechForm},
  OF_FibuKassenbuch in 'OF_FibuKassenbuch.pas' {KassenBuchForm},
  OF_ZahlungseingangDlg in 'OF_ZahlungseingangDlg.pas' {ZEForm},
  OF_Journal_EKRE in 'OF_Journal_EKRE.pas' {JournalEKREForm},
  OF_Journal_VKKASSE in 'OF_Journal_VKKASSE.pas' {JournalVKKasseForm},
  OF_Journal_VKAGB in 'OF_Journal_VKAGB.pas' {JournalVKAGBForm},
  OF_Journal_VKLIEF in 'OF_Journal_VKLIEF.pas' {JournalVKLiefForm},
  OF_Journal_VKRE in 'OF_Journal_VKRE.pas' {JournalVKREForm},
  OF_Journal_EKBEST in 'OF_Journal_EKBEST.pas' {JournalEKBestForm},
  OF_MakeEKRech in 'OF_MakeEKRech.pas' {MakeEKReForm},
  OF_MakeVKRech in 'OF_MakeVKRech.pas' {MakeVKReForm},
  OF_MakeEKRech_FertigDlg in 'OF_MakeEKRech_FertigDlg.pas' {EKRechFertigDlg},
  OF_MakeEKPreisAnfrage in 'OF_MakeEKPreisAnfrage.pas' {MakeEKPreisForm},
  OF_MakeEKBest in 'OF_MakeEKBest.pas' {MakeEKBestForm},
  OF_SN_Erfassen in 'OF_SN_Erfassen.pas' {SNErfassenForm},
  OF_SN_Auswahl in 'OF_SN_Auswahl.pas' {SNAuswahlForm},
  OF_StartUp in 'OF_StartUp.pas',
  OF_MakeVertragRech in 'OF_MakeVertragRech.pas' {MakeVertragReForm},
  OF_Export in 'OF_Export.pas' {ExportForm},
  OF_Mitarbeiter in 'OF_Mitarbeiter.pas' {MitarbeiterForm},
  OF_Progress in 'OF_Progress.pas' {ProgressForm},
  OF_ShopImageUpload in 'OF_ShopImageUpload.pas' {FileUpload},
  OF_TeillieferDlg in 'OF_TeillieferDlg.pas' {TeilLieferForm},
  OF_Link in 'OF_Link.pas' {LinkForm},
  OF_pim in 'OF_pim.pas' {PimForm},
  OF_Vertreter in 'OF_Vertreter.pas' {VertreterForm},
  OF_Adressen_Lief in 'OF_Adressen_Lief.pas' {AdressenLiefForm},
  OF_Shoptrans in 'OF_Shoptrans.pas' {ShopTransForm},
  OF_Admin_NewMandant in 'OF_Admin_NewMandant.pas' {NewMandantDlg},
  OF_Anrufe in 'OF_Anrufe.pas' {AnrufeForm},
  OF_Journal_VKAuftrag in 'OF_Journal_VKAuftrag.pas' {JournalVKAuftragForm},
  OF_Journal_VKGS in 'OF_Journal_VKGS.pas' {JournalVKAuftragForm},
  OF_Browser in 'OF_Browser.pas' {frmBrowser},
  gnugettext in 'gnugettext.pas',
  OF_Register in 'OF_Register.pas',
  OF_Inventur in 'OF_Inventur.pas' {InventurForm},
  OF_ZahlungsEingangList in 'OF_ZahlungsEingangList.pas' {ZahlForm},
  OF_ZahlungsAusgangList in 'OF_ZahlungsAusgangList.pas' {ZahlAusForm},
  OF_Wartung in 'OF_Wartung.pas' {WartungsForm},
  OF_MahnlaufDlg in 'OF_MahnlaufDlg.pas' {MahnForm};

{$R *.RES}
//{$R ZipMsgDe.RES}  //17.10.09-ud. ???.

Var
  Splash: Boolean;
  I: Integer;

begin
  TP_GlobalIgnoreClassProperty(TAction, 'Category');
  TP_GlobalIgnoreClassProperty(TControl, 'HelpKeyword');
  TP_GlobalIgnoreClassProperty(TNotebook, 'Pages');

  TP_GlobalIgnoreClassProperty(TControl, 'ImeName');
  TP_GlobalIgnoreClass(TFont);

  TP_GlobalIgnoreClassProperty(TField, 'DefaultExpression');
  TP_GlobalIgnoreClassProperty(TField, 'FieldName');
  TP_GlobalIgnoreClassProperty(TField, 'KeyFields');
  TP_GlobalIgnoreClassProperty(TField, 'DisplayName');
  TP_GlobalIgnoreClassProperty(TField, 'LookupKeyFields');
  TP_GlobalIgnoreClassProperty(TField, 'LookupResultField');
  TP_GlobalIgnoreClassProperty(TField, 'Origin');
  TP_GlobalIgnoreClass(TParam);
  TP_GlobalIgnoreClassProperty(TFieldDef, 'Name');

  TP_GlobalIgnoreClassProperty(TDBComboBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBCheckBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBEdit, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBImage, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBListBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'KeyField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'ListField');
  TP_GlobalIgnoreClassProperty(TDBMemo, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBRadioGroup, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBRichEdit, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBText, 'DataField');
  //Zeos
  TP_GlobalIgnoreClassProperty(TZQuery, 'Sql');
  TP_GlobalIgnoreClassProperty(TZQuery, 'Params');
  TP_GlobalIgnoreClassProperty(TZQuery, 'Filter');
  TP_GlobalIgnoreClassProperty(TZQuery, 'LinkFields');
  TP_GlobalIgnoreClassProperty(TZQuery, 'IndexFieldNames');
  TP_GlobalIgnoreClassProperty(TZQuery, 'Macros');
  //TP_GlobalIgnoreClass(TZQuery);
  TP_GlobalIgnoreClass(TZUpdateSQL);
  TP_GlobalIgnoreClass(TZSQLProcessor);
  TP_GlobalIgnoreClass(TZConnection);

  TP_GlobalIgnoreClassProperty(TOFZQuery, 'Sql');
  TP_GlobalIgnoreClassProperty(TOFZQuery, 'Params');
  TP_GlobalIgnoreClassProperty(TOFZQuery, 'Filter');
  TP_GlobalIgnoreClassProperty(TOFZQuery, 'LinkFields');
  TP_GlobalIgnoreClassProperty(TOFZQuery, 'IndexFieldNames');
  TP_GlobalIgnoreClassProperty(TOFZQuery, 'Macros');

  //Jedi
  TP_GlobalIgnoreClassProperty(TJvStrHolder, 'Macros');
  TP_GlobalIgnoreClassProperty(TJvStrHolder, 'MacroChar');
  TP_GlobalIgnoreClassProperty(TJvStrHolder, 'KeyString');
  TP_GlobalIgnoreClassProperty(TJvStrHolder, 'Strings');

  //Volga
  TP_GlobalIgnoreClassProperty(TVolgaDBEdit, 'ComboValues');
  TP_GlobalIgnoreClassProperty(TVolgaDBEdit, 'DataField');

  //TWebbrowser
  TP_GlobalIgnoreClass(TWebbrowser);

  //FreeReport
  //TP_GlobalIgnoreClass(TPrintRechForm);
  TP_GlobalIgnoreClass(TfrDBDataSet);
  TP_GlobalIgnoreClass(TfrDesigner);
  TP_GlobalIgnoreClass(TfrReport);
  TP_GlobalIgnoreClass(TfrRichObject);
  TP_GlobalIgnoreClass(TfrCheckBoxObject);
  TP_GlobalIgnoreClass(TfrShapeObject);
  TP_GlobalIgnoreClass(TfrBarCodeObject);
  TP_GlobalIgnoreClass(TfrChartObject);
  TP_GlobalIgnoreClass(TfrTNPDFExportFilter);


  //----------------------------------------------------------------------------

  Splash := True;
  for i := 0 to ParamCount do
   if Uppercase(ParamStr(i)) = 'NOSPLASH' then
     Splash := False;

  Application.Initialize;
  Application.Name  := 'OF';
  Application.Title := 'Open-Faktura 0.0.0';
  Screen.Cursor := crHourGlass;

  SScreen := tStartBox.Create(nil);
  if Splash then SScreen.Visible := True;
  if Splash then SScreen.PBar.Maximum := 43;
  if Splash then SScreen.PBar.Position := 1;
  if Splash then SScreen.PBar.Visible := True;
  if Splash then SScreen.Invalidate;
  if Splash then SScreen.Show;

  //Allgemein
  Application.CreateForm(TMainForm, MainForm);
  if Splash then begin SScreen.PBar.Position := 2;  SScreen.Update; end;

  Application.CreateForm(TProgressForm, ProgressForm);
  if Splash then begin SScreen.PBar.Position := 3;  SScreen.Update; end;
  Application.CreateForm(TDM1, DM1);
  if Splash then begin SScreen.PBar.Position := 4;  SScreen.Update; end;

  Application.CreateForm(TLinkForm, LinkForm);
  if Splash then begin SScreen.PBar.Position := 5;  SScreen.Update; end;

  //
  if Splash then begin SScreen.PBar.Position := 7;  SScreen.Update; end;
  Application.CreateForm(TVisibleSpaltenForm, VisibleSpaltenForm);
  if Splash then begin SScreen.PBar.Position := 8;  SScreen.Update; end;
  Application.CreateForm(TAboutBox, AboutBox);
  if Splash then begin SScreen.PBar.Position := 9;  SScreen.Update; end;
  Application.CreateForm(TExportForm, ExportForm);
  if Splash then begin SScreen.PBar.Position := 10;  SScreen.Update; end;
  Application.CreateForm(TFileUpload, FileUpload);
  if Splash then begin SScreen.PBar.Position := 11;  SScreen.Update; end;

  // Stammdaten
  Application.CreateForm(TAdressForm, AdressForm);
  if Splash then begin SScreen.PBar.Position := 12;  SScreen.Update; end;
  Application.CreateForm(TArtikelForm, ArtikelForm);
  if Splash then begin SScreen.PBar.Position := 13;  SScreen.Update; end;
  Application.CreateForm(TKFZForm, KFZForm);
  if Splash then begin SScreen.PBar.Position := 14;  SScreen.Update; end;
  Application.CreateForm(TInfoForm, InfoForm);
  if Splash then begin SScreen.PBar.Position := 15;  SScreen.Update; end;
  Application.CreateForm(TPLZForm, PLZForm);
  if Splash then begin SScreen.PBar.Position := 16;  SScreen.Update; end;
  Application.CreateForm(TMitarbeiterForm, MitarbeiterForm);
  if Splash then begin SScreen.PBar.Position := 17;  SScreen.Update; end;

  //FIBU
  Application.CreateForm(TKassenBuchForm, KassenBuchForm);
  if Splash then begin SScreen.PBar.Position := 18;  SScreen.Update; end;
  Application.CreateForm(TZEForm, ZEForm);
  if Splash then begin SScreen.PBar.Position := 19;  SScreen.Update; end;

  //Journale
  Application.CreateForm(TJournalEKREForm, JournalEKREForm);
  if Splash then begin SScreen.PBar.Position := 20;  SScreen.Update; end;
  Application.CreateForm(TJournalVKKasseForm, JournalVKKasseForm);
  if Splash then begin SScreen.PBar.Position := 21;  SScreen.Update; end;
  Application.CreateForm(TJournalVKAGBForm, JournalVKAGBForm);
  if Splash then begin SScreen.PBar.Position := 22;  SScreen.Update; end;
  Application.CreateForm(TJournalVKLiefForm, JournalVKLiefForm);
  if Splash then begin SScreen.PBar.Position := 23;  SScreen.Update; end;
  Application.CreateForm(TJournalVKREForm, JournalVKREForm);
  if Splash then begin SScreen.PBar.Position := 24;  SScreen.Update; end;
  Application.CreateForm(TJournalEKBestForm, JournalEKBestForm);
  if Splash then begin SScreen.PBar.Position := 24;  SScreen.Update; end;

  {$IFDEF ALPHA}
  Application.CreateForm(TJournalVKGSForm, JournalVKGSForm);
  {$ENDIF}

  // Belege
  Application.CreateForm(TMakeVKReForm, MakeVKReForm);
  if Splash then begin SScreen.PBar.Position := 26;  SScreen.Update; end;
  Application.CreateForm(TMakeEKReForm, MakeEKReForm);
  if Splash then begin SScreen.PBar.Position := 27;  SScreen.Update; end;
  Application.CreateForm(TSNErfassenForm, SNErfassenForm);
  if Splash then begin SScreen.PBar.Position := 28;  SScreen.Update; end;
  Application.CreateForm(TSNAuswahlForm, SNAuswahlForm);
  if Splash then begin SScreen.PBar.Position := 29;  SScreen.Update; end;
  Application.CreateForm(TMakeVertragReForm, MakeVertragReForm); //NEU
  if Splash then begin SScreen.PBar.Position := 31;  SScreen.Update; end;
  Application.CreateForm(TMakeVKReForm, MakeAGBForm);
  if Splash then begin SScreen.PBar.Position := 32;  SScreen.Update; end;
  Application.CreateForm(TMakeEKBestForm, MakeEKBestForm);

  {$IFDEF ALPHA}
  Application.CreateForm(TMakeEKPreisForm, MakeEKPreisForm);
  {$ENDIF}

  if Splash then begin SScreen.PBar.Position := 33;  SScreen.Update; end;
  Application.CreateForm(TEKRechFertigDlg, EKRechFertigDlg);
  if Splash then begin SScreen.PBar.Position := 34;  SScreen.Update; end;
  {$IFDEF WITH_REPORT}
  Application.CreateForm(TPrintRechForm, PrintRechForm);
  if Splash then begin SScreen.PBar.Position := 35;  SScreen.Update; end;
  {$ENDIF}
  Application.CreateForm(TBLZForm, BLZForm);
  if Splash then begin SScreen.PBar.Position := 37;  SScreen.Update; end;

  Application.CreateForm(TVertreterForm, VertreterForm);
  if Splash then begin SScreen.PBar.Position := 38;  SScreen.Update; end;

  Application.CreateForm(TPimForm, PimForm);
  if Splash then begin SScreen.PBar.Position := 39;  SScreen.Update; end;
  Application.CreateForm(TAdressenLiefForm, AdressenLiefForm);
  if Splash then begin SScreen.PBar.Position := 41;  SScreen.Update; end;
  Application.CreateForm(TShopTransForm, ShopTransForm);
  if Splash then begin SScreen.PBar.Position := 42;  SScreen.Update; end;
  Application.CreateForm(TTeilLieferForm, TeilLieferForm);
  if Splash then begin SScreen.PBar.Position := 43;  SScreen.Update; end;
  Application.CreateForm(TLogForm, LogForm);

  {$IFDEF ALPHA}
  Application.CreateForm(TAnrufeForm, AnrufeForm);
  //Application.CreateForm(TMakeVKAuftragForm, MakeVKAuftragForm);
  Application.CreateForm(TMakeVKReForm, MakeVKAuftragForm);
  Application.CreateForm(TJournalVKAuftragForm, JournalVKAuftragForm);
  Application.CreateForm(TMakeVKGSForm, MakeVKGSForm);
  Application.CreateForm(TSNAuswahlGSForm, SNAuswahlGSForm);
  {$ENDIF}
  Application.CreateForm(TfrmBrowser, frmBrowser);

  Screen.Cursor := crDefault;

  Application.Run;

  {
  // Unübersetztes in ein Log schreiben
  DefaultInstance.SaveUntranslatedMsgids (ExtractFilePath(Paramstr(0))+
                                          'cao_untranslated_'+
                                          getcurrenttextdomain()+
                                          '.log');
  }
end.

//------------------------------------------------------------------------------

