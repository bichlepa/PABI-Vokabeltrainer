JetztGuckenObAktuelleVokabelPasst:
;msgbox,JetztGuckenObAktuelleVokabelPasst
ObAktuelleVokabelPasst=ja
if Vokabel%WelcheAktuelleVokabel%existiert=
{
	ObAktuelleVokabelPasst=nein
}
;msgbox,VokabelExistiertnicht: %VokabelExistiertnicht%
if ObAktuelleVokabelPasst=ja
{
	
	if Vokabel%WelcheAktuelleVokabel%Fach<>%WelcheFachnr%
	{
		ObAktuelleVokabelPasst=nein
	}
}
;msgbox,VokabelPasstNicht: %VokabelPasstNicht%,

;msgbox,WelcheAktuelleVokabel: %WelcheAktuelleVokabel%`nd1: %d1%
if ObAktuelleVokabelPasst=ja
{
	
	;wenn nach Datum kontrolliert werden soll
		AktuellZeitSeitLetzterAbfrage=%a_now%
		test:=Vokabel%WelcheAktuelleVokabel%ZuletztAbgefragt
		envsub,AktuellZeitSeitLetzterAbfrage,%test%,%WelcherZeitmodus% ;Zeitunterschied zwische Jetzt und der letzten Abfrage ermitteln
		if AktuellZeitSeitLetzterAbfrage<%WelcheDatumkontrollezahl%
		{
			
			ObAktuelleVokabelPasst=nein
		}
		;msgbox,%WelcheDatumkontrollezahl%
		AktuelleZeitSeitLetzterAbfrageZumAnzeigen=%a_now%
		test:=Vokabel%WelcheAktuelleVokabel%ZuletztAbgefragt
		envsub,AktuelleZeitSeitLetzterAbfrageZumAnzeigen,%test%,Seconds
		
		Vokabel%WelcheAktuelleVokabel%AktuellZeitSeitLetzterAbfrageZumAnzeigen:=AktuelleZeitSeitLetzterAbfrageZumAnzeigen
		;~ msgbox,AktuelleZeitSeitLetzterAbfrageZumAnzeigen: %AktuellZeitSeitLetzterAbfrage%`ntest: %test%`nWelcheDatumkontrollezahl: %WelcheDatumkontrollezahl%`nWelcheAktuelleVokabel: %WelcheAktuelleVokabel%
		if Vokabel%WelcheAktuelleVokabel%ZuletztAbgefragt=
		ObAktuelleVokabelPasst=ja
}
if ObAktuelleVokabelPasst=ja
ObLösungAbfragen=1
return

