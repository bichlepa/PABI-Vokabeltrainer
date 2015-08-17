
JetztFensterAufbauen:
{

;~ 	WelchesKnopfSchema=blau
	
	
	if ObProgrammPrüfModus=ja
	msgbox,JetztFensterAufbauen:
	if WelchesFarbSchema=blau
	gui,color,e0f8fe
	if WelchesFarbSchema=grün
	gui,color,f0fcef,f0fcef
	if WelchesFarbSchema=gelb
	gui,color,e0f8fe

	gui,font,c000044 


	Gui, Font, S16 ,
	Gui, Add, Edit, v1EditLösung x164 y258 w560 h30 , ;Eingabe für Lösung
	Gui, Add, Edit, v1EditLösung2 x164 y294 w560 h30 ,
	Gui, Add, Edit, v1EditLösung3 x164 y330 w560 h30 ,
	Gui, Font, S8 , Verdana
	gui,add, text, v1TextAktuellerKommentarEnglisch x166 y365 w560 h30
	

	;~ if WelchesKnopfSchema=blau
	;~ {
		;~ gui, add, picture, g1buttonAuswerten x165 y395 w90 h-1,Bilder\Blue design\ButtonAuswertenU.png
		;~ gui, add, picture, hidden x165 y395,Bilder\Blue design\ButtonAuswertenD.ico
		;~ gui, add, picture, g1buttonKeineAhnung x265 y395 w90 h-1,Bilder\Blue design\ButtonKeineAhnungU.png
		;~ gui, add, picture, g1buttonDasWeißIch x365 y395 w90 h-1,Bilder\Blue design\ButtonDasWeißIchU.png
		;~ gui, add, picture, g1buttonAuslassen x465 y395 w90 h-1,Bilder\Blue design\ButtonAuslassenU.png
		
	;~ }
	;~ else
	;~ {
	if ObZusätzlicheButtonsZumAuswertenAnzeigen=1
	{
		Gui, Add, Button, g1buttonAuswerten v1buttonAuswerten x165 y395 w90 h30 default,%Auswerten_%
		Gui, Add, Button, g1buttonKeineAhnung v1buttonKeineAhnung x265 y395 w90 h30 , %Keine_Ahnung%
		Gui, Add, Button, g1buttonDasWeißIch v1buttonDasWeißIch x365 y395 w90 h30 , %Das_weiß_ich%
		Gui, Add, Button, g1buttonAuslassen v1buttonAuslassen x465 y395 w80 h30 , %Auslassen_%
		
	}
	else
		Gui, Add, Button, g1buttonAuswerten v1buttonAuswertenGroß x154 y395 w520 h30 default,%Auswerten_%
	
	
	
	;~ }
	Gui, Add, picture, gBildD1Sprechen vBildD1Sprechen x145 y115 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildD2Sprechen vBildD2Sprechen x145 y153 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildD3Sprechen vBildD3Sprechen x145 y191 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildDkSprechen vBildDkSprechen x145 y232 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildE1Sprechen vBildE1Sprechen x145 y263 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildE2Sprechen vBildE2Sprechen x145 y299 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildE3Sprechen vBildE3Sprechen x145 y335 , Bilder\Lautsprecher.ico
	Gui, Add, picture, gBildEkSprechen vBildEkSprechen x145 y370 , Bilder\Lautsprecher.ico

	Gui, Add, Button, g1buttonweitereWörterHinzufügen x6 y10 w100 h40 , %Weitere_Wörter_hinzufügen%
	Gui, Add, Button, g1ButtonVokabelBearbeiten v1ButtonVokabelBearbeiten x110 y10 w120 h40 , %Aktuelle_Vokabel_bearbeiten%
	gui, add, button, g1ButtonEinstellungen x235 y10 w100 h40, %Einstellungen_%
	gui, add, button, g1ButtonListeAnschauen x340 y10 w100 h40, %Liste_anschauen%
	gui, add, button, g1ButtonHauptmenü x445 y10 w100 h40, %Hauptmenü_%
	gui, add, button, g1ButtonHilfe x550 y10 w50 h40,%Hilfe_%
	Gui, Add, Button, g1ButtonNeustart x605 y10 w60 h20 , %Neustart_%
	Gui, Add, Button, gLizenzbedingungenÜber x605 y30 w60 h20 , %Über_%

	Gui, Font, S16, Verdana
	Gui, Add, Text, v1TextAktuelleVokabel1 x166 y110 w560 h30
	Gui, Add, Text, v1TextAktuelleVokabel2 x166 y148 w560 h30
	Gui, Add, Text, v1TextAktuelleVokabel3 x166 y186 w560 h30
	Gui, Font, S8, Verdana
	gui, add, text, v1TextAktuellerKommentarDeutsch x166 y227 w560 h30

	Gui, Add, Text, v1TextGesamtzahlVokabeln x6 y60 w170 h20 , %Anzahl_Vokabeln%
	gui, add, text, v1TextVokabelNr x190 y60 w100 h20,%Vokabel_Nr%
	gui, add, text, v1TextZuletztAbgefragtVor x310 y60 w400 h30,Zuletzt beantwortet vor 
	
	
	Gui, Add, Radio, g1Radiofachwahl v1Radiofachwahlnr1 x6 y90  w140  , %fach__wörter1%1%fach__wörter2%%fach1%%fach__wörter3%
	Gui, Add, Radio, g1Radiofachwahl v1Radiofachwahlnr2 x6 Y+10 w140  , %fach__wörter1%2%fach__wörter2%%fach2%%fach__wörter3%
	Gui, Add, Radio, g1Radiofachwahl v1Radiofachwahlnr3 x6 Y+10 w140  , %fach__wörter1%3%fach__wörter2%%fach3%%fach__wörter3%
	Gui, Add, Radio, g1Radiofachwahl v1Radiofachwahlnr4 x6 Y+10 w140  , %fach__wörter1%4%fach__wörter2%%fach4%%fach__wörter3%
	Gui, Add, Radio, g1Radiofachwahl v1Radiofachwahlnr5 x6 Y+10 w140  , %fach__wörter1%5%fach__wörter2%%fach5%%fach__wörter3%
	
	gui,font,underline
	gui, add, text,x6 y240 w130 ,%Abfragereihenfolge_%
	gui, font, normal
	gui, add, radio, v1CheckDatumkontrolleAutomatisch g1CheckDatumkontrolle x16 y260 w110, %Automatisch_%
	gui, add, radio, v1CheckDatumkontrolleManuell g1CheckDatumkontrolle x16 y280 w110, %Manuell_%
	;~ gui, add, checkbox, v1CheckDatumkontrolle g1CheckDatumkontrolle x6 y250 w130 , %Nur_Vokabeln_die_vor_mindestens%
	gui, add, text, v1TextZuletztAbgefragtVorEinstellen x26 y300 w100, %Zuletzt_beantwortet_vor%
	gui, add, edit, number v1Editdatumkontrollezahl g1Editdatumkontrollezahl x26 y330 w100,%WelcheDatumkontrollezahl%
	gui, add, radio, g1RadioZeitModus v1RadioZeittagen x26 y360 w100, %Tagen_%
	gui, add, radio, g1RadioZeitModus v1RadioZeitstunden x26 y375 w100, %Stunden_%
	gui, add, radio, g1RadioZeitModus v1RadioZeitminuten x26 y390 w100, %Minuten_%
	gui, add, radio, g1RadioZeitModus v1RadioZeitsekunden x26 y405 w100, %Sekunden_%
	;~ gui, add, radio, g1RadioZeitModus v1RadioZeitsMöglichstLange x16 y370 w130, %Möglichst_langer_Zeit%
	;~ gui, add, text,v1TextDasLetzteMalAbgefragtWurden x16 y395 w130, %das_letzte_mal_abgefragt_wurden%

	gui, add, text, v1TextZeit x16 y495, %DasLetzeMalMeldung%
	gui, add, text, v1TextHeuteAufgerufen x16 y440 w300, %Heute_Soviele_Vokabeln_aufgerufen1%%WieOftVokabelAngeschaut%%Heute_Soviele_Vokabeln_aufgerufen2%
	gui, add, text, v1TextRichtigBeantwortet x16 y455 w300, %Heute_Soviele_Vokabeln_richtig_beantwortet1%%WieOftHeuteRichtigBeantwortet%%Heute_Soviele_Vokabeln_richtig_beantwortet2%
	gui, add, text, v1TextFalschBeantwortet x16 y470 w300, %Heute_Soviele_Vokabeln_falsch_beantwortet1%%WieOftHeuteFalschBeantwortet%%Heute_Soviele_Vokabeln_falsch_beantwortet2% 
	
	gui, add, text, v1TextVokabelWieOftAufgerufen x320 y440 w300,%Diese_Vokabel_schon_Sooft_aufgerufen1% ? %Diese_Vokabel_schon_Sooft_aufgerufen2%
	gui, add, text, v1TextVokabelRichtigBeantwortet x320 y455 w300,%Diese_Vokabel_schon_Sooft_richtig_beantwortet1% ? %Diese_Vokabel_schon_Sooft_richtig_beantwortet2%
	gui, add, text, v1TextVokabelFalschBeantwortet x320 y470 w300,%Diese_Vokabel_schon_Sooft_falsch_beantwortet1% ? %Diese_Vokabel_schon_Sooft_falsch_beantwortet2%


	;Vorerst verborgene guis
	
	
	
	gui, add, button,v1buttonweiter g1buttonweiter x154 y395 w520 h30,%weiter_%
	guicontrol, hide, 1EditLösung2 
	guicontrol, hide, 1EditLösung3
	guicontrol, hide, 1buttonweiter
	guicontrol, hide, BildD1Sprechen
	guicontrol, hide, BildD2Sprechen
	guicontrol, hide, BildD3Sprechen
	guicontrol, hide, BildDkSprechen
	guicontrol, hide, Bilde1Sprechen
	guicontrol, hide, Bilde2Sprechen
	guicontrol, hide, Bilde3Sprechen
	guicontrol, hide, BildekSprechen

	guicontrol,+c206020,1TextAktuelleVokabel1
	guicontrol,+c206020,1TextAktuelleVokabel2
	guicontrol,+c206020,1TextAktuelleVokabel3
	guicontrol,+c0000d0,1EditLösung
	
	
	if ObAutomatischAlteVokabelnSuchen=ja
	{
		guicontrol,,1CheckDatumkontrolleAutomatisch,1
		guicontrol,disable,1TextZuletztAbgefragtVorEinstellen
		guicontrol,disable,1Editdatumkontrollezahl
		guicontrol,disable,1RadioZeittagen
		guicontrol,disable,1RadioZeitstunden
		guicontrol,disable,1RadioZeitminuten
		guicontrol,disable,1RadioZeitsekunden
		
	}
	Else
	{
		guicontrol,,1CheckDatumkontrolleManuell,1
		guicontrol,enable,1TextZuletztAbgefragtVorEinstellen
		guicontrol,enable,1Editdatumkontrollezahl
		guicontrol,enable,1RadioZeittagen
		guicontrol,enable,1RadioZeitstunden
		guicontrol,enable,1RadioZeitminuten
		guicontrol,enable,1RadioZeitsekunden
		
		
	}
	
	
	

	Gui, Show, w730 h515, %PABI_Vokabeltrainer% v%AppVersion%  "%AktuelleListe%"
	
	gui,+lastfound ;Gui ID bestimmen
	winget,GuiId,ID
	
	
	if ObProgrammPrüfModus=ja
	msgbox,JetztFensterAufbauen-
	return
}


JetztInfosAufDemFensterAktualisieren:
{
;~ 	global
	if ObProgrammPrüfModus=ja
	msgbox,JetztInfosAufDemFensterAktualisieren:
	if ObMausAusDemWegRäumen=ja
	mousemove,690,50,2 ;Maus aus dem Weg räumen

	guicontrol,+c0000d0,1EditLösung ;zurückfärben, nachdem es grün oder rot angefärbt wurde
	guicontrol,+c0000d0,1EditLösung2
	guicontrol,+c0000d0,1EditLösung3

	guicontrol,,1EditLösung,
	guicontrol, hide, 1EditLösung2 
	guicontrol, hide, 1EditLösung3
	guicontrol, hide, 1buttonweiter
	guicontrol,hide, 1TextAktuellerKommentarEnglisch
	if WelcheFachnr=1
	guicontrol,,1Radiofachwahlnr1,1
	if WelcheFachnr=2
	guicontrol,,1Radiofachwahlnr2,1
	if WelcheFachnr=3
	guicontrol,,1Radiofachwahlnr3,1
	if WelcheFachnr=4
	guicontrol,,1Radiofachwahlnr4,1
	if WelcheFachnr=5
	guicontrol,,1Radiofachwahlnr5,1
	
	

	AktuellZeitSeitLetzterAbfrageZumAnzeigen:=Vokabel%WelcheAktuelleVokabel%AktuellZeitSeitLetzterAbfrageZumAnzeigen
;~ 	msgbox,%AktuellZeitSeitLetzterAbfrageZumAnzeigen%
	if WelcherZeitmodus=days
	{
	guicontrol,,1RadioZeittagen,1
	}
	if WelcherZeitmodus=hours
	{
	guicontrol,,1RadioZeitstunden,1
	}
	if WelcherZeitmodus=minutes
	{
	guicontrol,,1RadioZeitminuten,1
	}
	if WelcherZeitmodus=seconds
	{
	guicontrol,,1RadioZeitsekunden,1
	}
	ZumAnzeigenTage:=AktuellZeitSeitLetzterAbfrageZumAnzeigen
	envdiv,ZumAnzeigenTage,86400

	ZumAnzeigenStunden:=AktuellZeitSeitLetzterAbfrageZumAnzeigen
	envsub,ZumAnzeigenStunden,86400*ZumAnzeigenTage
	envdiv,ZumAnzeigenStunden,3600

	ZumAnzeigenMinuten:=AktuellZeitSeitLetzterAbfrageZumAnzeigen
	envsub,ZumAnzeigenMinuten,86400*ZumAnzeigenTage
	envsub,ZumAnzeigenMinuten,3600*ZumAnzeigenStunden
	envdiv,ZumAnzeigenMinuten,60

	ZumAnzeigenSekunden:=AktuellZeitSeitLetzterAbfrageZumAnzeigen
	envsub,ZumAnzeigenSekunden,86400*ZumAnzeigenTage
	envsub,ZumAnzeigenSekunden,3600*ZumAnzeigenStunden
	envsub,ZumAnzeigenSekunden,60*ZumAnzeigenMinuten

	;msgbox,%ZumAnzeigenTage% Tage`n%ZumAnzeigenStunden% Stunden`n%ZumAnzeigenMinuten% Minuten`n%ZumAnzeigenSekunden% Sekunden
	

	
	

	;guicontrol,,1Editdatumkontrollezahl,%WelcheDatumkontrollezahl%

	guicontrol,,1TextAktuelleVokabel1,%d1%
	guicontrol,show,1TextAktuelleVokabel1
	guicontrol,,1TextAktuelleVokabel2,%d2%
	guicontrol,show,1TextAktuelleVokabel2
	guicontrol,,1TextAktuelleVokabel3,%d3%
	guicontrol,show,1TextAktuelleVokabel3
	guicontrol,,1TextAktuellerKommentarDeutsch,%dk%
	guicontrol,show,1TextAktuellerKommentarDeutsch

	if d1<>                                  ;Die Lautsprecher-Bilder anzeigen oder ausblenden
	guicontrol,show,BildD1Sprechen
	else
	guicontrol,hide,BildD1Sprechen
	if d2<>
	guicontrol,show,BildD2Sprechen
	else
	guicontrol,hide,BildD2Sprechen
	if d3<>
	guicontrol,show,BildD3Sprechen
	else
	guicontrol,hide,BildD3Sprechen
	if dk<>
	guicontrol,show,BildDkSprechen
	else
	guicontrol,hide,BildDkSprechen
	guicontrol,hide,BildE1Sprechen
	guicontrol,hide,BildE2Sprechen
	guicontrol,hide,BildE3Sprechen
	guicontrol,hide,BildEkSprechen


	guicontrol,,1TextGesamtzahlVokabeln,%Anzahl_Vokabeln% %anzahlVokabeln%
	guicontrol,,1Radiofachwahlnr1,%fach__wörter1%1%fach__wörter2%%fach1%%fach__wörter3%
	guicontrol,,1Radiofachwahlnr2,%fach__wörter1%2%fach__wörter2%%fach2%%fach__wörter3%
	guicontrol,,1Radiofachwahlnr3,%fach__wörter1%3%fach__wörter2%%fach3%%fach__wörter3%
	guicontrol,,1Radiofachwahlnr4,%fach__wörter1%4%fach__wörter2%%fach4%%fach__wörter3%
	guicontrol,,1Radiofachwahlnr5,%fach__wörter1%5%fach__wörter2%%fach5%%fach__wörter3%
	guicontrol,show%ObLösungAbfragen%,1EditLösung

	if AktuellZeitSeitLetzterAbfrageZumAnzeigen=0
	guicontrol,,1TextZuletztAbgefragtVor,%Noch_nie_abgefragt%
	else
	guicontrol,,1TextZuletztAbgefragtVor,%Zuletzt_abgefragt_vor_x_Tagen_x_Stunden_x_Minuten_und_x_Sekunden1%%ZumAnzeigenTage%%Zuletzt_abgefragt_vor_x_Tagen_x_Stunden_x_Minuten_und_x_Sekunden2%%ZumAnzeigenStunden%%Zuletzt_abgefragt_vor_x_Tagen_x_Stunden_x_Minuten_und_x_Sekunden3%%ZumAnzeigenMinuten%%Zuletzt_abgefragt_vor_x_Tagen_x_Stunden_x_Minuten_und_x_Sekunden4%%ZumAnzeigenSekunden%%Zuletzt_abgefragt_vor_x_Tagen_x_Stunden_x_Minuten_und_x_Sekunden5% 

	guicontrol,show%ObLösungAbfragen%,1TextZuletztAbgefragtVor
	guicontrol,,1TextVokabelNr,%Vokabel_Nr% %WelcheAktuelleVokabel%
	guicontrol,show%ObLösungAbfragen%,1TextVokabelNr

	guicontrol,show%ObLösungAbfragen%,1ButtonVokabelBearbeiten

	guicontrol,focus,1EditLösung
	if ObImmerKurzWarten=ja
	sleep,200
	
	if ObZusätzlicheButtonsZumAuswertenAnzeigen=1
	{
		guicontrol,show%ObLösungAbfragen%,1buttonKeineAhnung
		guicontrol,show%ObLösungAbfragen%,1buttonDasWeißIch
		guicontrol,show%ObLösungAbfragen%,1buttonAuslassen
		guicontrol,show%ObLösungAbfragen%,1buttonAuswerten
		guicontrol,+default,1buttonAuswerten
	}
	else
	{
		guicontrol,show%ObLösungAbfragen%,1buttonAuswertengroß
		guicontrol,+default,1buttonAuswertengroß
	}
	

	guicontrol,, 1TextHeuteAufgerufen,  %Heute_Soviele_Vokabeln_aufgerufen1%%WievieleVokabelnHeuteAngeschaut%%Heute_Soviele_Vokabeln_aufgerufen2%
	guicontrol,, 1TextRichtigBeantwortet,  %Heute_Soviele_Vokabeln_richtig_beantwortet1%%WieOftHeuteRichtigBeantwortet%%Heute_Soviele_Vokabeln_richtig_beantwortet2%
	guicontrol,, 1TextFalschBeantwortet, %Heute_Soviele_Vokabeln_falsch_beantwortet1%%WieOftHeuteFalschBeantwortet%%Heute_Soviele_Vokabeln_falsch_beantwortet2% 
	
	
	guicontrol,,1TextVokabelWieOftAufgerufen,%Diese_Vokabel_schon_Sooft_aufgerufen1%%WieOftVokabelAngeschaut%%Diese_Vokabel_schon_Sooft_aufgerufen2% 
	
	
	if WieOftVokabelRichtigBeantwortet<>
	guicontrol,,1TextVokabelRichtigBeantwortet,%Diese_Vokabel_schon_Sooft_richtig_beantwortet1%%WieOftVokabelRichtigBeantwortet%%Diese_Vokabel_schon_Sooft_richtig_beantwortet2% 
	else
	guicontrol,,1TextVokabelRichtigBeantwortet,%Diese_Vokabel_noch_nie_richtig_beantwortet%
	
	
	if WieOftVokabelFalschBeantwortet<>
	guicontrol,,1TextVokabelFalschBeantwortet,%Diese_Vokabel_schon_Sooft_falsch_beantwortet1%%WieOftVokabelFalschBeantwortet%%Diese_Vokabel_schon_Sooft_falsch_beantwortet2% 
	else
	guicontrol,,1TextVokabelFalschBeantwortet,%Diese_Vokabel_noch_nie_falsch_beantwortet%


	if ObVokabelnAussprechen=ja
	if WelcheAbfrageRichtung=EnachD
	{
		if d1=Keine passende Vokabel vorhanden
		{
			JetztSprechen("e1") ;wird automatisch gedreht
		}
		else
		{
			JetztSprechen("d") ;wird automatisch gedreht
		}
	}
	Else
	{
		
		
		sleep,100
		JetztSprechen("d")
		
	}


	if ObProgrammPrüfModus=ja
	msgbox,JetztInfosAufDemFensterAktualisieren-
	return
}

JetztLösungRichtigAnzeigen:
		guicontrol,+c00dd00,1EditLösung ;grün färben
		guicontrol,+c00dd00,1EditLösung2
		guicontrol,+c00dd00,1EditLösung3
		goto,JetztLösungAnzeigen
JetztLösungFalschAnzeigen:
		guicontrol,+cff0000,1EditLösung ;rot färben
		guicontrol,+cff0000,1EditLösung2
		guicontrol,+cff0000,1EditLösung3
		goto,JetztLösungAnzeigen
JetztLösungAnzeigen:
		guicontrol,hide,1buttonAuswertenGroß
		guicontrol,hide,1buttonKeineAhnung
		guicontrol,hide,1buttonDasWeißIch
		guicontrol,hide,1buttonAuswerten
		guicontrol,hide,1buttonAuslassen
		guicontrol,,1EditLösung,%e1%
		if e2<>
		Guicontrol,,1EditLösung2 , %e2%
		Else
		Guicontrol,,1EditLösung2 , 
		if e3<>
		Guicontrol, , 1EditLösung3, %e3%
		Else
		Guicontrol,,1EditLösung3 , 
		Guicontrol, show, 1EditLösung2
		Guicontrol, show, 1EditLösung3
		guicontrol,,1TextAktuellerKommentarEnglisch,%ek%
		if ek<>
		guicontrol,show, 1TextAktuellerKommentarEnglisch
		if ObImmerKurzWarten=ja
		sleep,200
		guicontrol, show, 1buttonweiter
		guicontrol,+default,1buttonweiter
		
		if e1<>                                  ;Die Lautsprecher-Bilder anzeigen oder ausblenden
		guicontrol,show,BildE1Sprechen
		else
		guicontrol,hide,BildE1Sprechen
		if e2<>
		guicontrol,show,BildE2Sprechen
		else
		guicontrol,hide,BildE2Sprechen
		if e3<>
		guicontrol,show,BildE3Sprechen
		else
		guicontrol,hide,BildE3Sprechen
		if ek<>
		guicontrol,show,BildEkSprechen
		else
		guicontrol,hide,BildEkSprechen
return


JetztAllesVerstecken:
	guicontrol, hide, 1TextAktuelleVokabel1
	guicontrol, hide, 1TextAktuelleVokabel2
	guicontrol, hide, 1TextAktuelleVokabel3
	guicontrol, hide, 1TextAktuellerKommentarDeutsch
	guicontrol, hide, 1EditLösung
	guicontrol, hide, 1EditLösung2
	guicontrol, hide, 1EditLösung3
	guicontrol, hide, 1TextAktuellerKommentarEnglisch
	guicontrol, hide, BildD1Sprechen
	guicontrol, hide, BildD2Sprechen
	guicontrol, hide, BildD3Sprechen
	guicontrol, hide, BildDkSprechen
	guicontrol, hide, Bilde1Sprechen
	guicontrol, hide, Bilde2Sprechen
	guicontrol, hide, Bilde3Sprechen
	guicontrol, hide, BildekSprechen
	guicontrol,hide,1TextZuletztAbgefragtVor
	guicontrol,,1TextVokabelNr,Vokabel Nr. 
	guicontrol,hide,1TextVokabelNr
	guicontrol,hide,1buttonAuswertenGroß
	guicontrol,hide,1buttonAuswerten
	guicontrol,hide,1buttonKeineAhnung
	guicontrol,hide,1buttonDasWeißIch
	guicontrol,hide,1buttonAuslassen
	guicontrol,hide,1ButtonVokabelBearbeiten
	guicontrol, show, 1buttonweiter
	guicontrol,+default,1buttonweiter

	return