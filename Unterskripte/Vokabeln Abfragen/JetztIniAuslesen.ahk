
JetztIniAuslesen:

if ObProgrammPrüfModus=ja
msgbox,JetztIniAuslesen:

iniread,SchonGemerkt,Einstellungen.ini,Allgemein,Schon gemerkt,%a_space%
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste,Beispiel-Englisch
iniread,ObAutomatischAlteVokabelnSuchen,Einstellungen.ini,Einstellungen,Datum kontrollieren,ja
iniread,WelcherZeitmodus,Einstellungen.ini,Allgemein,Zeitmodus,Hours
iniread,WelcheDatumkontrollezahl,Einstellungen.ini,Allgemein,Vor welcher Zeit,0
iniread,WelcheFachnr,Einstellungen.ini,allgemein,fach,1
iniread,WelcheAktuelleVokabel,Einstellungen.ini,Allgemein,Aktuelle Vokabel
if WelcheAktuelleVokabel=Nr.
	WelcheAktuelleVokabel=1
iniread,Obimmerkurzwarten,Einstellungen.ini,Einstellungen,Immer kurz warten
iniread,ObVokabelnAussprechen,Einstellungen.ini,Einstellungen,Vokabeln aussprechen,ja
iniread,ObRichtigOderFalschSagen,Einstellungen.ini,Einstellungen,Sagen ob richtig oder falsch
if ObRichtigOderFalschSagen=error
	ObRichtigOderFalschSagen=ja
iniread,WelcheAbfrageRichtung,Einstellungen.ini,Einstellungen,Abfragerichtung
if WelcheAbfrageRichtung=error
	WelcheAbfrageRichtung=DnachE
iniread,ObMausAusDemWegRäumen,Einstellungen.ini,Einstellungen,Maus aus dem Weg räumen
iniread,ObSpanischN,Einstellungen.ini,Sprachen,strg + n für ñ
iniread,ObFranzösischC,Einstellungen.ini,Sprachen,strg + c für ç
iniread,WelchesFarbSchema,Einstellungen.ini,Einstellungen,Farbschema
iniread,ObZusätzlicheButtonsZumAuswertenAnzeigen,Einstellungen.ini,Einstellungen,ZusätzlicheButtonsZumAuswertenAnzeigen,%a_space%
iniread,WelcheSounds,Einstellungen.ini,Einstellungen,Sounds für richtig und falsch,Kurze Toene
iniread,WieOftInsgesamtAngemacht,einstellungen.ini,statistik,Wie oft insgesamt angemacht,%a_space%
iniread,WieOftInsgesamtAusgewertet,Einstellungen.ini,Statistik,Wie oft insgesamt ausgewertet,0
iniread,WieLangeDasLetzteMalGelernt,einstellungen.ini,Statistik,Wie lange das letzte mal gelernt,0
iniread,WievieleVokabelnHeuteAngeschaut,Einstellungen.ini,Statistik,Wieviele Vokabeln heute aufgerufen,0
iniread,WannDasLetzteMalGelernt,einstellungen.ini,statistik,wann das letzte mal gelernt,%a_space%

jetzt=%a_now%
envsub,jetzt,%WannDasLetzteMalGelernt%,minutes
;msgbox,%WannDasLetzteMalGelernt%`n%jetzt%
if jetzt<10
{
wieLangeSchonGelernt=%WieLangeDasLetzteMalGelernt%	
IniRead,WieOftHeuteRichtigBeantwortet,einstellungen.ini,Statistik,Wie oft heute richtig beantwortet,%a_space%
iniread,WieOftHeuteFalschBeantwortet,einstellungen.ini,Statistik,Wie oft heute falsch beantwortet,%a_space%
iniread,WievieleVokabelnHeuteAngeschaut,Einstellungen.ini,Statistik,Wieviele Vokabeln heute aufgerufen,0
DasLetzeMalMeldung=%Das_letzte_mal_vor_x_Minuten_gelernt1%%jetzt%%Das_letzte_mal_vor_x_Minuten_gelernt2% %Die_Zeitrechnung_wird_fortgesetzt%
}
Else
{
DasLetzeMalMeldung=%Das_letzte_mal_vor_x_Minuten_gelernt1%%jetzt%%Das_letzte_mal_vor_x_Minuten_gelernt2%
WieOftHeuteRichtigBeantwortet=0
WieOftHeuteFalschBeantwortet=0
WievieleVokabelnHeuteAngeschaut=0
}

WieOftInsgesamtAngemacht++
iniwrite,%WieOftInsgesamtAngemacht%,einstellungen.ini,statistik,Wie oft insgesamt angemacht



;Vokabellistenspezifische Einstellungen
iniread,ZuIgnorierendeWörter,Vokabellisten\%AktuelleListe%.ini,info,Wörter ignorieren,to





if ObProgrammPrüfModus=ja
msgbox,JetztIniAuslesen-

;versuchen, das passende TTS-Stimmen einzustellen, wenn es noch keine gibt
iniread,DeutscheStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme1
iniread,EnglischeStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme2
if (DeutscheStimme="error" or EnglischeStimme="error")
	loop,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Speech\Voices\Tokens,1,1 ;Liest die Registry aus um die verfügbaren Stimmen herauszufinden
	{
		RegRead, Reginhalt
		;~ fileappend,subkey:%A_LoopRegSubKey%`nregname:%A_LoopRegName%`nregread:%Reginhalt%`n`n,text.txt ;Alle Registry-Einträge dokumentieren. zum Debuggen
		stringgetpos,a,A_LoopRegName,\,l6
		if errorlevel=1
		if A_LoopRegName=Name
		if Reginhalt<>
		{

			RegRead, SprachNummer, %A_LoopRegKey%, %A_LoopRegSubKey%,Language  ;Die Sprache herausfinden
            ;~ msgbox,%A_LoopRegSubKey%`n%A_LoopRegName%`nSprachnummer: %SprachNummer%
            IfInString, SprachNummer,407
            if DeutscheStimme=error
            DeutscheStimme=%Reginhalt%
            IfInString, SprachNummer,409
            if EnglischeStimme=error
            EnglischeStimme=%Reginhalt%
            IfInString, SprachNummer,809
            if EnglischeStimme=error
            EnglischeStimme=%Reginhalt%
			
			
		}
	iniwrite,%DeutscheStimme%,Vokabellisten\%aktuelleListe%.ini,info,Stimme1
	iniwrite,%EnglischeStimme%,Vokabellisten\%aktuelleListe%.ini,info,Stimme2
	}

return

