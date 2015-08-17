binBeiDerEntwicklungDesAuswertens=ja  ;die folgenden Zeilen bis "JetztVokabelAuswerten:" können zu Testzwecken beliebig gefüllt werden. Sie haben später keine Auswirkungen auf das Programm


e1=to here
;~ e3=ja;nein
1EditLösung=here
ZuIgnorierendeWörter=to;the


JetztVokabelAuswerten:

richtig=nein

EingegebeneLösung:=1EditLösung
;Tippfehler in der Eingabe korrigeren und komische Zeichen entfernen
stringleft,bstabe,EingegebeneLösung,1 ;Links ein Leerzeichen finden
if bstabe=%a_space%
stringtrimleft,EingegebeneLösung,EingegebeneLösung,1
stringleft,bstabe,EingegebeneLösung,1  ;Links noch ein Leerzeichen finden
if bstabe=%a_space%
stringtrimleft,EingegebeneLösung,EingegebeneLösung,1
stringright,bstabe,EingegebeneLösung,1 ;Rechts ein Leerzeichen finden
if bstabe=%a_space%
stringtrimright,EingegebeneLösung,EingegebeneLösung,1
stringright,bstabe,EingegebeneLösung,1 ;Rechts eine Raute finden
if bstabe=#
stringtrimright,EingegebeneLösung,EingegebeneLösung,1
stringright,bstabe,EingegebeneLösung,1 ;Rechts ein Plus finden
if bstabe=+
stringtrimright,EingegebeneLösung,EingegebeneLösung,1
stringright,bstabe,EingegebeneLösung,1 ;Rechts noch ein Leerzeichen finden
if bstabe=%a_space%
stringtrimright,EingegebeneLösung,EingegebeneLösung,1
stringreplace,EingegebeneLösung,EingegebeneLösung,%a_space%%a_space%,%a_space%,a ;Doppeltes Leerzeichen finden
stringreplace,EingegebeneLösung,EingegebeneLösung,%a_space%%a_space%,%a_space%,a
stringreplace,EingegebeneLösung,EingegebeneLösung,.,,a
stringreplace,EingegebeneLösung,EingegebeneLösung,`,,,a









Loop 3 ;Da es drei Felder gibt.
{
	if richtig=ja
		break
	StringSplit, AusAktuellemFeldVokabelnr, e%a_index%,;,%A_Space%%A_Tab%  ;Vokabel spalten, Wenn mehrere Bedeutungen durch Semikolon eingegeben wurden
	;~ msgbox,%AusAktuellemFeldVokabelnr0% ;debugging
	loop,%AusAktuellemFeldVokabelnr0% ;Die Anzahl der durch Semikolon getrennten Vokabeln
	{
		if richtig=ja
			break
		AusAktuellemFeldAktuelleVokabel:=AusAktuellemFeldVokabelnr%a_index%
		;~ msgbox,%AusAktuellemFeldAktuelleVokabel% ;debugging
		
		
		;komische Zeichen aus der Bedeutung entfernen
		stringreplace,AusAktuellemFeldAktuelleVokabel,AusAktuellemFeldAktuelleVokabel,.,,a
		stringreplace,AusAktuellemFeldAktuelleVokabel,AusAktuellemFeldAktuelleVokabel,`,,,a
		
		
		tempEingegebeneLösung:= EingegebeneLösung 
		AusAktuellemFeldAktuelleVokabelTemp:= AusAktuellemFeldAktuelleVokabel
		;Wenn ein zu ignorierendes Wort in der Bedeutung am Anfang steht, dann, wenn in der Eingabe vergessen, einfügen
		StringSplit,AktuellesZuIgnorierendeWortNr,ZuIgnorierendeWörter,; `,,%A_Space%%A_Tab%
		Loop %AktuellesZuIgnorierendeWortNr0%
		{
			AktuellesZuIgnorierendeWort:=AktuellesZuIgnorierendeWortNr%a_index%
			
			stringleft,temp,AusAktuellemFeldAktuelleVokabelTemp,3
			if temp=to%a_space%
			{
				stringleft,temp,tempEingegebeneLösung,3
				if not (temp="to ")
					tempEingegebeneLösung=to %tempEingegebeneLösung%
			}
			;~ msgbox,%AktuellesZuIgnorierendeWort%`n%AusAktuellemFeldAktuelleVokabelTemp%`n%tempEingegebeneLösung% ;debugging
			
		}
		
		
		;In Klammern gesetzte Wörter in der Bedeutung löschen und falls in der Eingabe vorhanden auch löschen
		stringsplit,tempNr,AusAktuellemFeldAktuelleVokabelTemp,(,%A_Space%%A_Tab% ;nur um Anzahl der Klammern zu ermitteln
		Loop % tempNr0 -1
		{
			;position der Klammern finden
			stringgetpos,posLinkeKlammer,AusAktuellemFeldAktuelleVokabelTemp,(
			stringgetpos,posRechteKlammer,AusAktuellemFeldAktuelleVokabelTemp,)
			
			;Wort in der Klammer extrahieren
			stringmid,tempWortInKlammern,AusAktuellemFeldAktuelleVokabelTemp,(posLinkeKlammer + 2),(posRechteKlammer - posLinkeKlammer -1),
			
			
			;Buchstaben davor und dahinter holen
			stringmid,tempBuchstabeVorKlammer,AusAktuellemFeldAktuelleVokabelTemp,(posLinkeKlammer),1
			stringmid,tempBuchstabeNachKlammer,AusAktuellemFeldAktuelleVokabelTemp,(posRechteKlammer + 2),1
			;~ msgbox,Bedeutung: %AusAktuellemFeldAktuelleVokabelTemp%`nEingegeben: %tempEingegebeneLösung%`nLinke Klammer: %posLinkeKlammer%`nRechte Klammer: %posRechteKlammer%`nWort in Klammern: %tempWortInKlammern%`nBuchstaben daneben: '%tempBuchstabeVorKlammer%' '%tempBuchstabeNachKlammer%' ;debugging
			
			;Schauen, ob der Inhalt der Klammern in der Lösung vorhanden ist.
			ifinstring,tempEingegebeneLösung,%tempBuchstabeVorKlammer%%tempWortInKlammern%%tempBuchstabeNachKlammer%
			{
				;Nuer klammern löschen
				stringreplace,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,(
				stringreplace,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,)
				
				
			}
			else
			{
				;Klammer mit Inhalt aus der Bedeutung löschen
				stringreplace,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,(%tempWortInKlammern%),	
				
			}
			
			
			
			
		}
		
		
		stringreplace,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,%a_space%%a_space%,%a_space%,a ;Doppeltes Leerzeichen finden
		stringreplace,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,%a_space%%a_space%,%a_space%,a
		stringleft,bstabe,AusAktuellemFeldAktuelleVokabelTemp,1 ;Links ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimleft,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,1
		stringright,bstabe,AusAktuellemFeldAktuelleVokabelTemp,1 ;Rechts ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimright,AusAktuellemFeldAktuelleVokabelTemp,AusAktuellemFeldAktuelleVokabelTemp,1
		
		stringreplace,tempEingegebeneLösung,tempEingegebeneLösung,%a_space%%a_space%,%a_space%,a ;Doppeltes Leerzeichen finden
		stringreplace,tempEingegebeneLösung,tempEingegebeneLösung,%a_space%%a_space%,%a_space%,a
		stringleft,bstabe,tempEingegebeneLösung,1 ;Links ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimleft,tempEingegebeneLösung,tempEingegebeneLösung,1
		stringright,bstabe,tempEingegebeneLösung,1 ;Rechts ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimright,tempEingegebeneLösung,tempEingegebeneLösung,1
		
		
		
		
		if tempEingegebeneLösung=%AusAktuellemFeldAktuelleVokabelTemp%
		{
			richtig=ja
			
		}
		
		
		
		
		
		
	}
	
	
}

if binBeiDerEntwicklungDesAuswertens=ja
{
	if richtig=ja
		msgbox,richtig
	else
		MsgBox,falsch
}
return

