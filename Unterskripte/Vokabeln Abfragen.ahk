VokabelnAbfragen:


	if ObProgrammPrüfModus=ja
		msgbox,Fenster: Vokabeln Abfragen
	
	gosub,JetztIniAuslesen
	gosub,JetztSoundsSuchen
	gosub,JetztFensterAufbauen
	gosub,JetztAlleVokabelnLaden
	gosub,JetztInfosAufDemFensterAktualisieren
	JetztSchonGemerkt()
	
	if ObProgrammPrüfModus<>ja ;Sonst stört der Timer
		settimer,JedeSekundeMachen,1000
	
	if ObAutomatischAlteVokabelnSuchen=ja
		gosub,JetztMöglichstLangeSuchen
	gosub,JetztGuckenObAktuelleVokabelPasst
;~ 	msgbox,,,Vokabel Nr. %welcheAktuelleVokabel% passte %ObAktuelleVokabelPasst%,0.3

	if ObAktuelleVokabelPasst=nein
	{
		gosub,AndereVokabel
	}
	else
	{
		gosub,JetztAktuelleVokabelAuslesen
		gosub,JetztStatistikFürGeöffneteVokabelAktualisieren
		gosub,JetztInfosAufDemFensterAktualisieren
	}
	


return




AndereVokabel:
if ObProgrammPrüfModus=ja
	msgbox,andereVokabel:

if ObAutomatischAlteVokabelnSuchen=ja ;Damit, wenn die Datumkontrollezahl zu groß ist, werden nicht alle Vokabeln beim Prüfen als ungeeignet befunden
	WelcheDatumkontrollezahl=0

gosub,AlleVokabelnPrüfenObSiePassen
if ObAutomatischAlteVokabelnSuchen=ja
{
	gosub,JetztMöglichstLangeSuchen
	gosub,AlleVokabelnPrüfenObSiePassen
}

;~ msgbox,%zahlverfügbar%
if zahlverfügbar<>0
{
	gosub,ZufälligeVokabelAussuchen
	gosub,JetztAktuelleVokabelAuslesen
	gosub,JetztStatistikFürGeöffneteVokabelAktualisieren
}
else
gosub,JetztVokabelAlsNichtVorhandenDeklarieren


gosub,JetztInfosAufDemFensterAktualisieren
if ObProgrammPrüfModus=ja
msgbox,andereVokabel-
return



















BildD1Sprechen:
JetztSprechen("d1")
return
BildD2Sprechen:
JetztSprechen("d2")
return
BildD3Sprechen:
JetztSprechen("d3")
return
BildDkSprechen:
JetztSprechen("dk")
return
BildE1Sprechen:
JetztSprechen("e1")
return
BildE2Sprechen:
JetztSprechen("e2")
return
BildE3Sprechen:
JetztSprechen("e3")
return
BildEkSprechen:
JetztSprechen("ek")
return




1ButtonHilfe:
run,Hilfe\Index.html
return

1ButtonHauptmenü:
NächstesFenster=Hauptmenü
goto,NächstesFensterÖffnen
return

1buttonweitereWörterHinzufügen:
WelchesLetztesFensterVorVokabelnHinzufügen=VokabelnAbfragen
NächstesFenster=VokabelnHinzufügen
goto,NächstesFensterÖffnen
return
1ButtonVokabelBearbeiten:
WelchesLetztesFensterVorBearbeiten=VokabelnAbfragen
NächstesFenster=VokabelBearbeiten
goto,NächstesFensterÖffnen
return
1ButtonEinstellungen:
WelchesLetztesFensterVorEinstellungen=VokabelnAbfragen
NächstesFenster=Einstellungen
goto,NächstesFensterÖffnen
return
1ButtonListeAnschauen:
NächstesFenster=ListeAnschauen
goto,NächstesFensterÖffnen
return






1Radiofachwahl:
if ObProgrammPrüfModus=ja ;Test
	msgbox,1Radiofachwahl:
WelcheFachnrAlt=%WelcheFachnr%
gui submit,nohide
if 1Radiofachwahlnr1=1
WelcheFachnr=1
if 1Radiofachwahlnr2=1
WelcheFachnr=2
if 1Radiofachwahlnr3=1
WelcheFachnr=3
if 1Radiofachwahlnr4=1
WelcheFachnr=4
if 1Radiofachwahlnr5=1
WelcheFachnr=5
iniwrite,%WelcheFachnr%,Einstellungen.ini,Allgemein,Fach
;~ goto,JetztAllesVerstecken
if welchefachnralt<>%welchefachnr%
goto,andereVokabel
return

1CheckDatumkontrolle:
if ObProgrammPrüfModus=ja
msgbox,1CheckDatumkontrolle:
gui,submit,nohide
if 1CheckDatumkontrolleAutomatisch=1
	ObAutomatischAlteVokabelnSuchen=ja
Else
	ObAutomatischAlteVokabelnSuchen=nein
iniwrite,%ObAutomatischAlteVokabelnSuchen%,Einstellungen.ini,Einstellungen,Datum kontrollieren
;~ goto,JetztAllesVerstecken

if ObAutomatischAlteVokabelnSuchen=ja
{
	;~ guicontrol,,1CheckDatumkontrolleAutomatisch,1
	guicontrol,disable,1TextZuletztAbgefragtVorEinstellen
	guicontrol,disable,1Editdatumkontrollezahl
	guicontrol,disable,1RadioZeittagen
	guicontrol,disable,1RadioZeitstunden
	guicontrol,disable,1RadioZeitminuten
	guicontrol,disable,1RadioZeitsekunden
	
}
Else
{
	;~ guicontrol,,1CheckDatumkontrolleManuell,1
	guicontrol,enable,1TextZuletztAbgefragtVorEinstellen
	guicontrol,enable,1Editdatumkontrollezahl
	guicontrol,enable,1RadioZeittagen
	guicontrol,enable,1RadioZeitstunden
	guicontrol,enable,1RadioZeitminuten
	guicontrol,enable,1RadioZeitsekunden
	
	
}
gosub,JetztGuckenObAktuelleVokabelPasst
if ObAktuelleVokabelPasst=nein
goto,andereVokabel
return
1Editdatumkontrollezahl:
if ObProgrammPrüfModus=ja
msgbox,1Editdatumkontrollezahl:
if ObAutomatischAlteVokabelnSuchen=ja ;Wenn der Zeitmodus Möglichst Lange aktiviert ist, muss 1Editdatumkontrollezahl blockert werden, da sonst es startet, wenn die Zahl dort verändert wird.
{
	if ObProgrammPrüfModus=ja
	msgbox,1Editdatumkontrollezahl-geblockt
	Return
}
gui,submit,nohide
WelcheDatumkontrollezahl:=1Editdatumkontrollezahl
iniwrite,%WelcheDatumkontrollezahl%,Einstellungen.ini,Allgemein,Vor welcher Zeit
goto,JetztAllesVerstecken

return
1RadioZeitModus:
if ObProgrammPrüfModus=ja
msgbox,1RadioZeitModus:
gui submit,nohide
if 1RadioZeittagen=1
WelcherZeitmodus=Days
if 1RadioZeitstunden=1
WelcherZeitmodus=Hours
if 1RadioZeitminuten=1
WelcherZeitmodus=Minutes
if 1RadioZeitsekunden=1
WelcherZeitmodus=Seconds
;msgbox,%zeitmodus%
iniwrite,%WelcherZeitmodus%,Einstellungen.ini,Allgemein,Zeitmodus
;~ goto,JetztAllesVerstecken

gosub,JetztGuckenObAktuelleVokabelPasst
	;~ msgbox,%ObAktuelleVokabelPasst%
if ObAktuelleVokabelPasst=nein
{
gosub,AndereVokabel
}

return


1buttonAuslassen:
if ObProgrammPrüfModus=ja
msgbox,1buttonAuslassen:
goto,andereVokabel
return

1buttonKeineAhnung:
if ObProgrammPrüfModus=ja
msgbox,1buttonKeineAhnung:
gosub,JetztVokabelInDenErstenKastenVerschieben
gosub,JetztDatumDerVokabelAnfügen
gosub,JetztLösungFalschAnzeigen
gosub,JetztSoundfalschabspielen
richtig=nein
gosub,JetztStatistikAktualisieren
return

1buttonDasWeißIch:
if ObProgrammPrüfModus=ja
msgbox,1buttonDasWeißIch:
gosub,JetztVokabelInDenNächstenKastenVerschieben
gosub,JetztDatumDerVokabelAnfügen
gosub,JetztLösungRichtigAnzeigen
gosub,JetztSoundRichtigAbspielen
richtig=ja
gosub,JetztStatistikAktualisieren
return


1buttonAuswerten:
if ObProgrammPrüfModus=ja
msgbox,1buttonAuswerten:

GuiControlGet, test, Visible,1buttonAuswerten 
;msgbox,%test%
if test=0
goto,andereVokabel

gui submit,nohide
gosub,JetztVokabelAuswerten
;msgbox,richtig: %richtig%
gosub,JetztDatumDerVokabelAnfügen
if Richtig=ja
{
	gosub,JetztVokabelInDenNächstenKastenVerschieben
	gosub,JetztLösungRichtigAnzeigen
	gosub,JetztSoundRichtigAbspielen
	gosub,JetztStatistikAktualisieren
}
Else
{
	gosub,JetztVokabelInDenErstenKastenVerschieben
	gosub,JetztLösungFalschAnzeigen
	gosub,JetztSoundfalschabspielen
	gosub,JetztStatistikAktualisieren
}
return

1buttonweiter:
if ObProgrammPrüfModus=ja
msgbox,1buttonweiter:
goto,andereVokabel
return







return


