program of_admin;

{$I OF.INC}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, SysUtils, of_main, of_startup, ofkomponenten, JvXPBarLaz, rx, rxnew,
  imagesforlazarus, zcomponent, uof_mandant, uof_dbserver;

{$R *.res}

//{$IFDEF WINDOWS}{$R manifest.rc}{$ENDIF}

begin
  Application.Initialize;

  // Intro anzeigen....
  SplashScreen.BeginShow;

  Application.CreateForm(TMainForm, MainForm);

  // Intro schliessen...
  SplashScreen.EndShow;

  Application.Run;
end.

