{*********************************************************}
{*                    VPSR.INC 1.03                      *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Visual PlanIt                              *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (c) 2002        *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{Visual PlanIt String Resources - To create language specific versions of
 Visual PlanIt controls, translate these strings to the desired language
 and re-compile your application.}

resourcestring
  RSNoneStr                 = '(keine)';
  RSYes                     = 'Y';
  RSNo                      = 'N';
  RSTrue                    = 'T';
  RSFalse                   = 'F';
  RSTallShortChars          = 'Wy';
  RSDelete                  = 'Wollen Sie ';
  RSNotDoneYet              = 'This feature is not implemented at this time.';
  RSNoTimersAvail           = 'keine Window''s-Timer verfügbar.';
  RSBadTriggerHandle        = 'Invalid trigger handle.';
  RSEditingItems            = 'Folder Items Editor.';
  RSEditingFolders          = 'Folder Editor.';
  RSExclusiveEventConflict  = 'Konflikt mit einem anderen exklusivem Termin.';
  RSBackwardTimesError      = 'Die Endzeit kann nich kleiner als die Startzeit sein.';
  RSDBPostError             = 'Fehler posting data to the database.';
  RSMonthConvertError       = 'Fehler converting the month number.';
  RSInvalidDay              = 'Fehler: fehlerhafter Tag.';
  RSInvalidDate             = 'Fehler: fehlerhaftes Datum.';
  RSInvalidMonth            = 'Fehler: fehlerhafter Monat.';
  RSInvalidMonthName        = 'Fehler: fehlerhafter Monatsname.';
  RSInvalidYear             = 'Fehler: fehlerhafters Jahr.';
  RSDayIsRequired           = 'Fehler: Tag wird benötigt.';
  RSMonthIsRequired         = 'Fehler: Monat wird benötigt.';
  RSYearIsRequired          = 'Fehler: Jahr wird benötigt.';
  RSNameIsRequired          = 'Fehler: Name kann nicht leer sein.';
  RSFailToCreateTask        = 'Fehler: Fehler beim erzeugen des Termins.';
  RSFailToCreateEvent       = 'Fehler: Failure while creating Event.';
  RSFailToCreateContact     = 'Fehler: Fehler beim erzeugen des Kontaktes.';
  RSFailToCreateResource    = 'Fehler: Fehler beim erzeugen des Resource.';
  RSDuplicateResource       = 'Fehler: doppelter Eintrag.';
  RSInvalidTableSpecified   = 'Fehler: Invalid table specified.';
  RSUnableToOpen            = 'Fehler: kann nicht Öffnen ';
  RSSQLUpdateError          = 'Fehler: kann nicht aktualisieren ';                {!!.01}

  RSPhoneTypeLabel1         = 'Assistent';
  RSPhoneTypeLabel2         = 'Callback';
  RSPhoneTypeLabel3         = 'Auto';
  RSPhoneTypeLabel4         = 'Firma';
  RSPhoneTypeLabel5         = 'Privat';
  RSPhoneTypeLabel6         = 'Privat Fax';
  RSPhoneTypeLabel7         = 'ISDN';
  RSPhoneTypeLabel8         = 'Mobil';
  RSPhoneTypeLabel9         = 'Andere';
  RSPhoneTypeLabel10        = 'Other Fax';
  RSPhoneTypeLabel11        = 'Pager';
  RSPhoneTypeLabel12        = 'Primary';
  RSPhoneTypeLabel13        = 'Radio';
  RSPhoneTypeLabel14        = 'Telex';
  RSPhoneTypeLabel15        = 'TTY/TDD';
  RSPhoneTypeLabel16        = 'Arbeit';
  RSPhoneTypeLabel17        = 'Arbeit Fax';

  RSCategoryLabel1          = 'Geschäft';
  RSCategoryLabel2          = 'Kunden';
  RSCategoryLabel3          = 'Familie';
  RSCategoryLabel4          = 'Personal';
  RSCategoryLabel5          = 'Andere';

  RSWeekOf                  = 'Woche von';
  RSThrough                 = 'Through';
  RSSunday                  = 'Sonntag';
  RSMonday                  = 'Montag';
  RSTuesday                 = 'Dienstag';
  RSWednesday               = 'Mittwoch';
  RSThursday                = 'Donnerstag';
  RSFriday                  = 'Fritag';
  RSSaturday                = 'Samstag';
  RSASunday                 = 'So';
  RSAMonday                 = 'Mo';
  RSATuesday                = 'Di';
  RSAWednesday              = 'Mi';
  RSAThursday               = 'Do';
  RSAFriday                 = 'Fr';
  RSASaturday               = 'Sa';
  RSLSunday                 = 'So';
  RSLMonday                 = 'Mo';
  RSLTuesday                = 'Di';
  RSLWednesday              = 'Mi';
  RSLThursday               = 'Do';
  RSLFriday                 = 'Fr';
  RSLSaturday               = 'Sa';
  RSNone                    = '-';
  RSDaily                   = 'Täglich';
  RSWeekly                  = 'Wöchentlich';
  RSMonthlyByDay            = 'Monatlich (Wochentag)';
  RSMonthlyByDate           = 'Monatlich (Tag)';
  RSYearlyByDay             = 'Jährlich (Wochentag)';
  RSYearlyByDate            = 'Jährlich (Tag)';
  RSCustom                  = 'Benutzerdefiniert';
  RSMinutes                 = 'Minuten';
  RSHours                   = 'Stunden';
  RSDays                    = 'Tage';

  {WARNINGS}
  RSPermanent               = 'Dieser Vorgang kann nicht rückgängig gemacht werden !';

  {Contact Specific}
  RSFromContactList         = 'aus Ihrer Kontaktliste wirklich löschen ?';
  RSContactPopupAdd         = 'neuer Kontakt ...';
  RSContactPopupEdit        = 'Kontakt bearbeiten ...';
  RSContactPopupDelete      = 'Kontakt löschen ...';

  {Event Specific}
  RSFromSchedule            = 'aus Ihrer Terminplanung wirklich löschen ?';

  {Task Specific}
  RSFromTaskList            = 'aus Ihrer Aufgabenliste wirklich löschen ?';
  RSTaskPopupAdd            = 'Aufgabe hinzufügen ...';
  RSTaskPopupEdit           = 'Aufgabe bearbeiten ...';
  RSTaskPopupDelete         = 'Aufgabe löschen ...';
  RSTaskTitleResource       = 'Aufgabenliste - ';                        {!!.01}
  RSTaskTitleNoResource     = 'Aufgabenliste';                           {!!.01}

  {Month Specific}
  RSMonthPopupToday         = 'Heute';
  RSMonthPopupNextMonth     = 'nächster Monat';
  RSMonthPopupPrevMonth     = 'vorheriger Monat';
  RSMonthPopupNextYear      = 'nächstes Jahr';
  RSMonthPopupPrevYear      = 'vorheriges Jahr';

  {Week Specific}
  RSWeekPopupAdd            = 'neuer Termin ...';
  RSWeekPopupEdit           = 'Termin bearbeiten ...';
  RSWeekPopupDelete         = 'Termin löschen ...';
  RSWeekPopupNav            = 'Datum ändern';
  RSWeekPopupNavToday       = 'Heute';
  RSWeekPopupNavNextWeek    = 'nächste Woche';
  RSWeekPopupNavPrevWeek    = 'vorherige Woche';
  RSWeekPopupNavNextMonth   = 'nächster Monat';
  RSWeekPopupNavPrevMonth   = 'vorheriger Monat';
  RSWeekPopupNavNextYear    = 'nächstes Jahr';
  RSWeekPopupNavPrevYear    = 'vorheriges Jahr';

  { Print Preview Specific }
  RSPrintPrvPrevPage        = 'vorherige Seite';
  RSPrintPrvNextPage        = 'nächste Seite';
  RSPrintPrvFirstPage       = 'erste Seite';
  RSPrintPrvLastPage        = 'letzte Seite';

  { DayView Specific }
  RSDayPopupAdd             = 'neuer Termin ...';
  RSDayPopupEdit            = 'Termin bearbeiten ...';
  RSDayPopupDelete          = 'Termin löschen ...';
  RSDayPopupNav             = 'Datum ändern';
  RSDayPopupNavToday        = 'Heute';
  RSDayPopupNavTomorrow     = 'Morgen';
  RSDayPopupNavYesterday    = 'Gestern';
  RSDayPopupNavNextDay      = 'nächster Tag';
  RSDayPopupNavPrevDay      = 'vorheriger Tag';
  RSDayPopupNavNextWeek     = 'nächste Woche';
  RSDayPopupNavPrevWeek     = 'vorherige Woche';
  RSDayPopupNavNextMonth    = 'nächster Monat';
  RSDayPopupNavPrevMonth    = 'vorheriger Monat';
  RSDayPopupNavNextYear     = 'nächstes Jahr';
  RSDayPopupNavPrevYear     = 'vorheriges Jahr';
  RSHintToday               = 'Heute';                                   {!!.01}
  RSHintTomorrow            = 'Morgen';                                  {!!.01}
  RSHintYesterday           = 'Gestern';                                 {!!.01}
  RSHintNextWeek            = 'nächste Woche';                           {!!.01}
  RSHintPrevWeek            = 'vorherige Woche';                         {!!.01}

  { field names }
  RSPosition                = 'Position';
  RSCompany                 = 'Firma';
  RSTitle                   = 'Titel';
  RSEMail                   = 'E-Mail';
  RSCountry                 = 'Land';
  RSCategory                = 'Beschriftung';
  RSNotes                   = 'Notizen';

  RSCustom1                 = 'Benutzerdefiniert 1';
  RSCustom2                 = 'Benutzerdefiniert 2';
  RSCustom3                 = 'Benutzerdefiniert 3';
  RSCustom4                 = 'Benutzerdefiniert 4';

  { Generic Dialog Captions }
  RSOKBtn                   = 'OK';
  RSCancelBtn               = 'Abbrechen';
  RSCloseBtn                = '&Schließen';
  RSPrintBtn                = '&Drucken';
  RSUntitled                = 'unbenannt';

  {Sound Selection Dialog}
  RSSelectASound            = 'Sound auswählen';
  RSSoundFinder             = 'Sound suchen';
  RSDefaultSound            = 'Default-Sound verwenden';

  { Event Edit Dialog Captions }
  RSDlgEventEdit            = 'Termin';
  RSAppointmentGroupBox     = 'Allgemein';
  RSDescriptionLbl          = 'Betreff:';
  RSCategoryLbl             = 'Kategorie:';
  RSStartTimeLbl            = 'Startzeit:';
  RSEndTimeLbl              = 'Endzeit:';
  RSAlarmSet                = '&Erinnerung';
  RSRecurringLbl            = 'Serienmuster:';
  RSIntervalLbl             = 'Intervall (Tage):';
  RSRecurrenceEndsLbl       = 'Wiederholen bis:';
  RSAllDayEvent             = '&ganztägig';
  RSNotesLbl                = 'Notizen:';

  { Contact Edit Dialog Captions }
  RSDlgContactEdit          = 'Kontakt';
  RSNameLbl                 = 'Name:';
  RSTitleLbl                = 'Titel:';
  RSAddressLbl              = 'Addresse:';
  RSCityLbl                 = 'Ort:';
  RSStateLbl                = 'Staat:';
  RSCountryLbl              = 'Bundeslang:';
  RSZipCodeLbl              = 'PLZ:';
  RSCompanyLbl              = 'Forma:';
  RSPositionLbl             = 'Position:';

  { Print Preview dialog captions }
  RSDlgPrintPreview        = 'Druckvorschau';

  { Task Edit Dialog Captions }
  RSDlgTaskEdit            = 'Aufgabe';
  RSDueDate                = 'fällig bis:';
  RSDetails                = 'Details:';
  RSComplete               = 'erledigt';
  RSDaysOverdue            = ' Tage überfällig';
  RSCreatedOn              = 'Erstellt am';
  RSCompletedOn            = 'Fertig am';

  { Reminder Dialog Captions}
  RSReminder               = 'Erinnerung';
  RSOverdue                = 'ÜBERFÄLLIG!';
  RSSnoozeCaption          = 'erneute &Erinnerung in:';
  RSSubjectCaption         = 'Betreff:';
  RSNotesCaption           = 'Notizen:';
  RSDismissBtn             = '&Schließen';
  RSSnoozeBtn              = '&Erinnerung';
  RSOpenItemBtn            = 'öffne Eintrag';
  RS5Minutes               = '5 Minuten';
  RS10Minutes              = '10 Minuten';
  RS15Minutes              = '15 Minuten';
  RS30Minutes              = '30 Minuten';
  RS45Minutes              = '45 Minuten';
  RS1Hour                  = '1 Stunde';
  RS2Hours                 = '2 Stunden';
  RS3Hours                 = '3 Stunden';
  RS4Hours                 = '4 Stunden';
  RS5Hours                 = '5 Stunden';
  RS6Hours                 = '6 Stunden';
  RS7Hours                 = '7 Stunden';
  RS8Hours                 = '8 Stunden';
  RS1Days                  = '1 Tag';
  RS2Days                  = '2 Tagen';
  RS3Days                  = '3 Tagen';
  RS4Days                  = '4 Tagen';
  RS5Days                  = '5 Tagen';
  RS6Days                  = '6 Tagen';
  RS1Week                  = '1 Woche';

  { Calendar }
  RSCalendarPrevMonth      = 'vorheriger Monat';
  RSCalendarNextMonth      = 'nächster Monat';
  RSCalendarPrevYear       = 'vorheriges Jahr';
  RSCalendarNextYear       = 'nächstes Jahr';
  RSCalendarToday          = 'Heute';
  RSCalendarRevert         = 'Zurück';

  RSCalendarPopupToday     = 'Heute';
  RSCalendarPopupNextMonth = 'nächster Monat';
  RSCalendarPopupPrevMonth = 'vorheriger Monat';
  RSCalendarPopupNextYear  = 'nächstes Jahr';
  RSCalendarPopupPrevYear  = 'vorheriges Jahr';
  RSCalendarPopupRevert    = 'Zurück';

  { XML }
  sIENotInstalled    = 'Cannot open WININET, Microsoft IE required';
  sOpenFileFailed    = 'Unable to open file ';
  sFileNotFound      = 'File %s could not be found';
  sAllocSrcMemFailed = 'Unable to allocate memory for XML source';
  sHttpReadReqFailed = 'Http read request failed';
  sHttpDataNotAvail  = 'Http data not available';
  sHttpReqSendFailed = 'Unable to send http request';
  sHttpReqOpenFailed = 'Unable to open http request';
  sInetConnectFailed = 'Unable to make Internet connection';
  sInetOpenFailed    = 'Unable to open Internet';
  sInvalidFtpLoc     = 'Invalid ftp location';
  sInvalidFtpDir     = 'Invalid ftp directory';
  sFtpReadReqFailed  = 'Ftp read request failed';
  sFtpDataNotAvail   = 'Ftp data not available';
  sFtpOpenFileFailed = 'Unable to open ftp file';
  sFtpPutFileFailed  = 'Could not save file via ftp to %s';
  sSrcLoadFailed     = 'Unable to load source ';
  sInvalidMemPtr     = 'Invalid memory Pointer';
  sFmtErrorMsg       = 'Line: %d Col: %d Error: %s';
  sIndexOutOfBounds  = 'ERROR INDEX OUT OF BOUNDS';
  sExpMarkupDecl     = 'Expected markup declaration, but found: ';
  sIllAttrType       = 'Illegal attribute type: ';
  sIllAttrDefKeyw    = 'Illegal keyword for attribute default value: ';
  sSysIdMissing      = 'System identifier missing ';
  sExtModifMissing   = 'External modifier missing: ';
  sIllCondSectStart  = 'Conditional section must begin with INCLUDE or IGNORE';
  sBadSepInModel     = 'Bad separator in content model: ';
  sExpCommentOrCDATA = 'Expected comment or CDATA section ';
  sUnexpectedEof     = 'Unexpected end of file ';
  sMismatchEndTag    = 'Mismatched end tag: ';
  sIllCharInRef      = 'Illegal character in reference';
  sUndeclaredEntity  = 'Reference to undeclared entity: ';
  sExpectedString    = 'Expected String: ';
  sSpaceExpectedAt   = 'Whitespace expected at byte ';
  sUnexpEndOfInput   = 'End of input while looking for delimiter: ';
  sQuoteExpected     = 'Expected " or ' + Chr (39);
  sInvalidXMLVersion = 'XMLPartner does not support XML specification greater than %s';
  sUnableCreateStr   = 'Unable to create stream for input.';
  sInvalidName       = 'Invalid XML name: ';
  sInvalidCommentText= 'Invalid comment text';
  sCommentBeforeXMLDecl = 'Document cannot start with a comment if it also contains an XML declaration';
  sInvalidCDataSection = 'Invalid characters in CDATA section';
  sRedefinedAttr     = 'Attributes cannot be redefined in a start tag';
  sCircularEntRef    = 'Circular reference to: ';
  sInvAttrChar       = 'Invalid character in attribute value: ';
  sInvPCData         = 'Invalid characters in element''s character data: ';
  sDataAfterValDoc   = 'There is invalid data after valid XML document';
  sNoIntConditional  = 'Conditional sections not allowed in internal subset of document type declaration';
  sNotationNotDeclared = 'Notation not declared: ';
  sInvPubIDChar      = 'Invalid PublicID character: ';
  sNoNDATAInPeDecl   = 'NDATA not allowed in parameter entity declaration';
  sInvStandAloneVal  = 'Standalone value must equal ''yes'' or ''no''';
  sInvEncName        = 'Invalid encoding declaration: ';
  sInvVerNum         = 'Invalid XML version number: ';
  sInvEntityValue    = 'Invalid character in entity value: ';
  sNoCommentInMarkup = 'Comments can not be placed within other markup';
  sNoPEInIntDTD      = 'Parameter entities not allowed in DTD internal subset';
  sXMLDecNotAtBeg   =  'The XML declaration must appear before the first element';
  sInvalidElementName = 'Invalid element name: ';
  sBadParamEntNesting = 'Parameter-entity text must be properly nested: ';
  sInvalidCharEncoding = 'Invalid character encoding specified.';
  sAttrNotNum        = 'Attribute %s of element %s does not have an integer value.';
  sUnknownAxis       = 'Unknown axis specifier: %s';

  {xpchrstm related errors}
  sInvalidXMLChar    = 'Invalid XML Character found';
  sInvalidBEChar     = 'Invalid (big-endian) UTF-16 character encoding';
  sInvalidLEChar     = 'Invalid (little-endian) UTF-16 character encoding';
  sBadUTF8Char       = 'Badly formed UTF-8 character in stream';
  sErrEndOfDocument  = 'Unexpected end of document stream';
  sUCS_ISOConvertErr = 'Cannot convert UCS-4 character to ISO-8859-1';
  sUCS_U16ConvertErr = 'Cannot convert UCS-4 character to UTF-16';
  sUCS_U8ConverErr   = 'Cannot convert UCS-4 character to UTF-8';

  { Misc Exceptions and Errors }

  RSOutOfRange       = 'Out of range';
  RSNotSupported     = 'not supported';
  RSNeedElementName  = 'Please supply an Element Name';
  RSNeedFormatName   = 'FormatName cannot be blank';
  RSPrtControlOwner  = 'Print controller is not owned by a TVpControlLink!';
  RSBadPrintFormat   = 'Invalid print format ';
  RSBadItemType      = 'Invalid item type ';
  RSBadMeasurement   = 'Invalid measurement';
  RSOwnerNotWinCtrl  = 'Owner must be a TWinControl descendent';
  RSNoControlLink    = 'Component must be linked to a TVpControlLink';
  RSNoPrintFormats   = 'No print formats have been defined';             {!!.01}
  RSNoCanvas         = 'TCanvas not assigned';                           {!!.01}
  RSNoLocalizationFile = 'Localization file not found.';                 {!!.02}

  { Misc strings }

  RSCategoryDesc0    = 'Kategorie 0';                                     {!!.01}
  RSCategoryDesc1    = 'Kategorie 1';                                     {!!.01}
  RSCategoryDesc2    = 'Kategorie 2';                                     {!!.01}
  RSCategoryDesc3    = 'Kategorie 3';                                     {!!.01}
  RSCategoryDesc4    = 'Kategorie 4';                                     {!!.01}
  RSCategoryDesc5    = 'Kategorie 5';                                     {!!.01}
  RSCategoryDesc6    = 'Kategorie 6';                                     {!!.01}
  RSCategoryDesc7    = 'Kategorie 7';                                     {!!.01}
  RSCategoryDesc8    = 'Kategorie 8';                                     {!!.01}
  RSCategoryDesc9    = 'Kategorie 9';                                     {!!.01}

  { Print Format Editor }

  RSEditPrintFormat  = 'bearbeite Drucklayout...';

  { Automatic resource adding/selection}                               {!!.01}

  RSAddNewResource   = 'No resources have been defined. Would you ' +  {!!.01}
                       'like to add one now?';                         {!!.01}
  RSSelectResource   = 'No resource has been selected. Would you ' +   {!!.01}
                       'like to select one now?';
