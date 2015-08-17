JetztMöglichstLangeSuchen:
if ObProgrammPrüfModus=ja
msgbox,JetztMöglichstLangeSuchen:
größteZeit=0
test2=1
loop,%zahlverfügbar%
{
	LangSuchVokabel:=VerfügbareVokabel%test2%
	test:=Vokabel%LangSuchVokabel%ZuletztAbgefragt
	if test=
	{
		größteZeit=noch nie
		Break
	}
	
;~ 	msgbox,%test%
	AktuellZeitSeitLetzterAbfrage=%a_now%

	envsub,AktuellZeitSeitLetzterAbfrage,%test%,seconds
;~ 	msgbox,%AktuellZeitSeitLetzterAbfrage%
	if AktuellZeitSeitLetzterAbfrage>%größteZeit%
	größteZeit=%AktuellZeitSeitLetzterAbfrage%
	test2++
;~ 	msgbox,%AktuellZeitSeitLetzterAbfrage%
}
if größteZeit<>noch nie
{
	envmult,größteZeit,0.7 ;zahl mit 0,7 multiplitzieren, damit ein paar Vokabeln übrig bleiben
	Transform,größteZeit,round,%größteZeit%
}
WelcheDatumkontrollezahl=%größteZeit%
guicontrol,,1Editdatumkontrollezahl,%WelcheDatumkontrollezahl%
WelcherZeitmodus=seconds
;~ msgbox,größteZeit: %WelcheDatumkontrollezahl%
if ObProgrammPrüfModus=ja
msgbox,JetztMöglichstLangeSuchen-
return