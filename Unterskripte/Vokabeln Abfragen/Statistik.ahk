JetztDatumDerVokabelAnfügen:
iniwrite,%A_Now%,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Zuletzt abgefragt
Vokabel%WelcheAktuelleVokabel%ZuletztAbgefragt=%A_Now%
return


JetztVokabelInDenErstenKastenVerschieben:
iniwrite,1,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Kasten
fachweniger:=Vokabel%WelcheAktuelleVokabel%Fach
fach%fachweniger%--
Vokabel%WelcheAktuelleVokabel%Fach=1
fach1++
return

JetztVokabelInDenNächstenKastenVerschieben:
fachweniger:=Vokabel%WelcheAktuelleVokabel%Fach
fach%fachweniger%--
if Vokabel%WelcheAktuelleVokabel%Fach<5
envadd,Vokabel%WelcheAktuelleVokabel%Fach,1
fachmehr:=Vokabel%WelcheAktuelleVokabel%Fach
fach%fachmehr%++
iniwrite,%fachmehr%,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Kasten
return


JetztStatistikFürGeöffneteVokabelAktualisieren:
WieOftVokabelAngeschaut++
WievieleVokabelnHeuteAngeschaut++
iniwrite,%WieOftVokabelAngeschaut%,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl angeschaut
iniwrite,%WievieleVokabelnHeuteAngeschaut%,Einstellungen.ini,Statistik,Wieviele Vokabeln heute aufgerufen
return

JetztStatistikAktualisieren:
if richtig=ja
{
	
	WieOftVokabelRichtigBeantwortet++
	iniwrite,%WieOftVokabelRichtigBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl richtig
	WieOftHeuteRichtigBeantwortet++
}
Else
{
	
	WieOftVokabelFalschBeantwortet++
	iniwrite,%WieOftVokabelFalschBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl falsch
	WieOftHeuteFalschBeantwortet++
}

WieOftInsgesamtAusgewertet++
iniwrite,%WieOftInsgesamtAusgewertet%,Einstellungen.ini,Statistik,Wie oft insgesamt ausgewertet
return

JedeSekundeMachen:

ifwinactive,ahk_id %GuiId%
{
;~ 	listvars
;~ 	msgbox
	wieLangeSchonGelernt++
	wieLangeSchonGelerntminuten=%wieLangeSchonGelernt%
	wieLangeSchonGelerntminuten/=60
	Minuten=%Minuten_%
	if wieLangeSchonGelerntminuten=1
	Minuten=%Minute_%
	wieLangeSchonGelerntSekunden=%wieLangeSchonGelernt%
	wieLangeSchonGelerntSekunden:=wieLangeSchonGelerntSekunden - 60 * wieLangeSchonGelerntminuten
	Sekunden=%Sekunden_%
	if wieLangeSchonGelerntSekunden=1
	Sekunden=%Sekunde_%

;~ 	soundbeep
	guicontrol,,1TextZeit,%Heute_x_Minuten_und_x_Sekunden_gelernt1%%wieLangeSchonGelerntminuten%%Heute_x_Minuten_und_x_Sekunden_gelernt2%%Minuten%%Heute_x_Minuten_und_x_Sekunden_gelernt3%%wieLangeSchonGelerntSekunden%%Heute_x_Minuten_und_x_Sekunden_gelernt4%%Sekunden%%Heute_x_Minuten_und_x_Sekunden_gelernt5%
	iniwrite,%a_now%,einstellungen.ini,statistik,wann das letzte mal gelernt
	iniwrite,%wieLangeSchonGelernt%,einstellungen.ini,Statistik,Wie lange das letzte mal gelernt
	iniwrite,%WieOftHeuteRichtigBeantwortet%,einstellungen.ini,Statistik,Wie oft heute richtig beantwortet
	iniwrite,%WieOftHeuteFalschBeantwortet%,einstellungen.ini,Statistik,Wie oft heute falsch beantwortet
}
return