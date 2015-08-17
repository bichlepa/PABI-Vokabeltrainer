
NachDoppeltenVokabelnSuchen:
DoppelteVokabelSucheAbbrechen=
;~ msgbox,Dieses Programmchen ist noch nicht ausgereift. Du kannst aber schon damit experimentieren.
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,Gesamtzahl,Vokabellisten\%AktuelleListe%.ini,info,Anzahl
iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2
stringleft,aktuelleListeErsteSpracheErsterBuchstabe,aktuelleListeErsteSprache,1
stringleft,aktuelleListeZweiteSpracheErsterBuchstabe,aktuelleListeZweiteSprache,1

hotkey,~del,8ButtonVokabel2Löschen
ListBoxVariable=___%komplett_identisch%___________|___%sehr_ähnlich%_____________|___%teilweise_gleich%____________|___%etwas_ähnlich%__________________|___%Kaum_ähnlich%_______________
if GleichInProzent=100
WieGroßDieÄhnlichkeit=komplett
if GleichInProzent<100
WieGroßDieÄhnlichkeit=ziemlich
if GleichInProzent<70
WieGroßDieÄhnlichkeit=teilweise
if GleichInProzent<40
WieGroßDieÄhnlichkeit=etwas
if GleichInProzent<20
WieGroßDieÄhnlichkeit=ein bisschen
Gui, Add, Text, vTextÜberDenProgressBalken x6 y15 w300 h20 , Text
Gui, Add, Progress, vProgressBalken x6 y35 w895 h20 -smooth,
Gui, Add, Text, x6 y70 w150, %Liste_doppelter_Vokabeln%
Gui, Add, ListBox, g8ListBoxGleicheVokabeln vListBoxGleicheVokabeln x6 y90 w150 h193 0x100 ,%ListBoxVariable%
Gui, Add, Text, x166 y70, %Vorschau_der_Vokabeln%
gui,font,s13
Gui, Add, ListView, g8ListView x166 y90 w735 h210 ReadOnly grid nosort NoSortHdr , 
gui,font,s8
Gui, Add, Button, g8Fertig x506 y310 w150 h30 default , %Abbrechen_%
Gui, Add, Button, g8ButtonVokabel1Bearbeiten v8ButtonVokabel1Bearbeiten x166 y310 w150 h30 , %Vokabel__bearbeiten1%???%Vokabel__bearbeiten2%
Gui, Add, Button, g8ButtonVokabel2Bearbeiten v8ButtonVokabel2Bearbeiten x326 y310 w170 h30 ,%Vokabel__bearbeiten1%???%Vokabel__bearbeiten2%
Gui, Add, Button, g8ButtonVokabel1Löschen v8ButtonVokabel1Löschen x166 y345 w150 h30 , %Vokabel__löschen1%???%Vokabel__löschen2%
Gui, Add, Button, g8ButtonVokabel2Löschen v8ButtonVokabel2Löschen x326 y345 w170 h30 , %Vokabel__löschen1%???%Vokabel__löschen2% (%Entf_%)
gui, add, button, g8AlleKomplettGleichenLöschen x166 y380 w150, %Alle_komplett_gleichen_löschen%
Gui, Add, Text, x6 y290 h30 w150 , %Aufgabenplaner_%`n%Stornieren_mit_Doppelklick%
Gui, Add, ListBox, g8AufgabenPlaner v8AufgabenPlaner x6 y317 w150 h110 ,%8AufgabenPlanerVariable%
8VariableAufgabenPlaner=
Gui, Add, Button, g8Ausführen v8Ausführen x506 y345 w150 h30 , %Alle_Aufgaben_Ausführen%

Gui, Show, w908 h434, %Nach_doppelten_Vokabeln_suchen%
gosub,VokabelnAuslesen
;Alles mit allem vergleichen

zahl=1
anzahlGeprüft=1
guicontrol,, TextÜberDenProgressBalken, %Vergleiche_Vokabeln%
loop,%anzahl%
{
	guicontrol,, TextÜberDenProgressBalken, %Vergleiche_Vokabeln__von__1%%anzahlGeprüft%%Vergleiche_Vokabeln__von__2%%anzahl%%Vergleiche_Vokabeln__von__3%
	if DoppelteVokabelSucheAbbrechen=ja
	return
	progressWert:=100 * anzahlGeprüft / anzahl
	guicontrol,,ProgressBalken,%progressWert%
	
	anzahlGeblieben:=anzahl-anzahlGeprüft
	VergleichsvokabelNr:=anzahlGeprüft+1
	loop,%anzahlGeblieben%
	{
		AnzahlGleicherWörter=0
		AnzahlGleicherWörterAuchOhneInhalt=0
		gosub,VokabelZahlMitVergleichsVokabelVergleichen
		if AnzahlGleicherWörter>0
		gosub,GefundeneVokabelAnzeigen
		VergleichsvokabelNr++
	}
	anzahlGeprüft++	
}

guicontrol,, TextÜberDenProgressBalken, %Fertig_%


return




VokabelnAuslesen:
zahl=1
zeile=1
anzahl=


loop 
{
if DoppelteVokabelSucheAbbrechen=ja
	return
progressWert:=100*zeile/Gesamtzahl
guicontrol,,ProgressBalken,%progressWert%
guicontrol, ,TextÜberDenProgressBalken,%Lade_Vokabeln__von__1%%zeile%%Lade_Vokabeln__von__2%%Gesamtzahl%%Lade_Vokabeln__von__3%

iniread,test,Vokabellisten\%AktuelleListe%.ini,%zeile%,Vokabel ;eine Zeile lesen
if test = ja ;wenn die Zeile eine Vokabel enthält
{
	iniread,Vokabel%zahl%d1,Vokabellisten\%AktuelleListe%.ini,%zeile%,d1,%a_space% ;alles einlesen
	iniread,vokabel%zahl%d2,Vokabellisten\%AktuelleListe%.ini,%zeile%,d2,%a_space%
	iniread,vokabel%zahl%d3,Vokabellisten\%AktuelleListe%.ini,%zeile%,d3,%a_space%
	iniread,vokabel%zahl%e1,Vokabellisten\%AktuelleListe%.ini,%zeile%,e1,%a_space%
	iniread,vokabel%zahl%e2,Vokabellisten\%AktuelleListe%.ini,%zeile%,e2,%a_space%
	iniread,vokabel%zahl%e3,Vokabellisten\%AktuelleListe%.ini,%zeile%,e3,%a_space%
	iniread,fach,Vokabellisten\%AktuelleListe%.ini,%zeile%,Kasten,%a_space%
	iniread,vokabel%zahl%ek,Vokabellisten\%AktuelleListe%.ini,%zeile%,KommentarEnglisch,%a_space%
	iniRead,vokabel%zahl%dk,Vokabellisten\%AktuelleListe%.ini,%zeile%,KommentarDeutsch,%a_space%
	iniread,ZuletztAbgefragt,Vokabellisten\%AktuelleListe%.ini,%zeile%,Zuletzt abgefragt,%a_space%
	iniread,WieOftVokabelRichtigBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl richtig,%a_space%
	iniread,WieOftVokabelFalschBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl falsch,%a_space%
	
	
	zeile++
	zahl++ ;Zur nächsten Zeile springen
	anzahl++
}
Else
break
}



return







VokabelZahlMitVergleichsVokabelVergleichen:


Vergleichsvokabel:=vokabel%VergleichsvokabelNr%d1
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%d2
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%d3
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%dk
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%e1
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%e2
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%e3
gosub,DieseVokabelMitDenAnderenVergleichen
Vergleichsvokabel:=vokabel%VergleichsvokabelNr%ek
gosub,DieseVokabelMitDenAnderenVergleichen
return




DieseVokabelMitDenAnderenVergleichen:
HierSchonGleichesGefunden=
ifequal vokabel%anzahlGeprüft%d1,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%d2,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%d3,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%dk,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%e1,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%e2,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%e3,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
if not HierSchonGleichesGefunden
ifequal vokabel%anzahlGeprüft%ek,%Vergleichsvokabel%
{
	if Vergleichsvokabel<>
	{
		AnzahlGleicherWörter++
	}
	AnzahlGleicherWörterAuchOhneInhalt++
	HierSchonGleichesGefunden=ja
}
return







GefundeneVokabelAnzeigen:
ld1:=vokabel%anzahlGeprüft%d1
ld2:=vokabel%anzahlGeprüft%d2
ld3:=vokabel%anzahlGeprüft%d3
ldk:=vokabel%anzahlGeprüft%dk
le1:=vokabel%anzahlGeprüft%e1
le2:=vokabel%anzahlGeprüft%e2
le3:=vokabel%anzahlGeprüft%e3
lek:=vokabel%anzahlGeprüft%ek
rd1:=vokabel%VergleichsvokabelNr%d1
rd2:=vokabel%VergleichsvokabelNr%d2
rd3:=vokabel%VergleichsvokabelNr%d3
rdk:=vokabel%VergleichsvokabelNr%dk
re1:=vokabel%VergleichsvokabelNr%e1
re2:=vokabel%VergleichsvokabelNr%e2
re3:=vokabel%VergleichsvokabelNr%e3
rek:=vokabel%VergleichsvokabelNr%ek

AnzahlUnterschiedlicherWörter:=8-AnzahlGleicherWörterAuchOhneInhalt
GleichInProzent:=100 / (AnzahlGleicherWörter + AnzahlUnterschiedlicherWörter) * AnzahlGleicherWörter


WieGroßDieÄhnlichkeit=ziemlich
if GleichInProzent<70
WieGroßDieÄhnlichkeit=teilweise
if GleichInProzent<40
WieGroßDieÄhnlichkeit=etwas
if GleichInProzent<20
WieGroßDieÄhnlichkeit=ein bisschen

if WieGroßDieÄhnlichkeit=ziemlich
{
	if ld1=%rd1%
	if ld2=%rd2%
	if ld3=%rd3%
	if ldk=%rdk%
	if le1=%re1%
	if le2=%re2%
	if le3=%re3%
	if lek=%rek%
	WieGroßDieÄhnlichkeit=komplett
}


else AnzahlGleicherWörterAuchOhneInhalt=%AnzahlGleicherWörterAuchOhneInhalt% mal
progress,off

;~ soundbeep,,10
;~ msgbox,,Ähnliche Vokabeln gefunden! %AnzahlGleicherWörter% bzw. %AnzahlGleicherWörterAuchOhneInhalt% mal gleich!,%AnzahlGleicherWörter% gleicher Wörter`nbzw. %AnzahlGleicherWörterAuchOhneInhalt% gleich`nDemnach %AnzahlUnterschiedlicherWörter% Unterschiede`nDemnach zu %GleichInProzent%`% gleich`nDemnach %WieGroßDieÄhnlichkeit% gleich`n`nDie Vokabel Nr. %anzahlGeprüft%:`n`n%ld1%`n%ld2%`n%ld3%`n%ldk%`n`n%le1%`n%le2%`n%le3%`n%lek%`n`nähnelt der Vokabel Nr. %VergleichsvokabelNr%:`n`n%rd1%`n%rd2%`n%rd3%`n%rdk%`n`n%re1%`n%re2%`n%re3%`n%rek%`n


if WieGroßDieÄhnlichkeit=komplett
{
stringgetpos,position,ListBoxVariable,___%sehr_ähnlich%
stringleft,templeft,ListBoxVariable,%position%
stringtrimleft,tempright,ListBoxVariable,%position%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
ListBoxVariable=%templeft%%anzahlGeprüft%,%VergleichsvokabelNr%|%tempright%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
guicontrol,,ListBoxGleicheVokabeln,|%ListBoxVariable%
}
else if WieGroßDieÄhnlichkeit=ziemlich
{
stringgetpos,position,ListBoxVariable,___%teilweise_gleich%
stringleft,templeft,ListBoxVariable,%position%
stringtrimleft,tempright,ListBoxVariable,%position%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
ListBoxVariable=%templeft%%anzahlGeprüft%,%VergleichsvokabelNr%|%tempright%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
guicontrol,,ListBoxGleicheVokabeln,|%ListBoxVariable%
}
else if WieGroßDieÄhnlichkeit=teilweise
{
stringgetpos,position,ListBoxVariable,___%etwas_ähnlich%
stringleft,templeft,ListBoxVariable,%position%
stringtrimleft,tempright,ListBoxVariable,%position%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
ListBoxVariable=%templeft%%anzahlGeprüft%,%VergleichsvokabelNr%|%tempright%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
guicontrol,,ListBoxGleicheVokabeln,|%ListBoxVariable%
}
else if WieGroßDieÄhnlichkeit=etwas
{
stringgetpos,position,ListBoxVariable,___%Kaum_ähnlich%
stringleft,templeft,ListBoxVariable,%position%
stringtrimleft,tempright,ListBoxVariable,%position%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
ListBoxVariable=%templeft%%anzahlGeprüft%,%VergleichsvokabelNr%|%tempright%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
guicontrol,,ListBoxGleicheVokabeln,|%ListBoxVariable%
}
else if WieGroßDieÄhnlichkeit=ein bisschen
{
ListBoxVariable=%ListBoxVariable%|%anzahlGeprüft%,%VergleichsvokabelNr%
;~ msgbox,ListBoxVariable: %ListBoxVariable%`ntempleft: %templeft%`n temprigh: %tempright%`n
guicontrol,,ListBoxGleicheVokabeln,|%ListBoxVariable%
}



return




8ListBoxGleicheVokabeln:
gui, submit,nohide

;>>>ListView löschen
loop,5
{
	
	LV_DeleteCol(1)
	LV_Delete()
}

;<<<ListView löschen

loop,parse,ListBoxGleicheVokabeln,CSV
{
	DoppelteVokabel%A_Index%:=A_loopfield
;~ 	msgbox,%A_loopfield%
}
;~ msgbox, %DoppelteVokabel1% %DoppelteVokabel2%
ifnotinstring,ListBoxGleicheVokabeln,_
{
	
;~ 	msgbox,%ListBoxGleicheVokabeln%
	LV_insertCol(1,"300",DoppelteVokabel2)
	LV_insertCol(1,"300",DoppelteVokabel1)
	LV_insertCol(1,"130",Vokabel_Nr)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%d1
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%d1
	LV_Add("",aktuelleListeErsteSprache " 1",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%d2
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%d2
	LV_Add("",aktuelleListeErsteSprache " 2",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%d3
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%d3
	LV_Add("",aktuelleListeErsteSprache " 3",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%dk
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%dk
	LV_Add("",aktuelleListeErsteSpracheErsterBuchstabe ". " Kommentar_,DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%e1
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%e1
	LV_Add("",aktuelleListeZweiteSprache " 1",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%e2
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%e2
	LV_Add("",aktuelleListeZweiteSprache " 2",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%e3
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%e3
	LV_Add("",aktuelleListeZweiteSprache " 3",DoppelteVokabel1d1,DoppelteVokabel1d2)
	DoppelteVokabel1d1:=Vokabel%DoppelteVokabel1%ek
	DoppelteVokabel1d2:=Vokabel%DoppelteVokabel2%ek
	LV_Add("",aktuelleListeZweiteSpracheErsterBuchstabe ". " Kommentar_,DoppelteVokabel1d1,DoppelteVokabel1d2)
	
	guicontrol,,8ButtonVokabel1Bearbeiten,%Vokabel__bearbeiten1%%DoppelteVokabel1%%Vokabel__bearbeiten2%
	guicontrol,,8ButtonVokabel2Bearbeiten,%Vokabel__bearbeiten1%%DoppelteVokabel2%%Vokabel__bearbeiten2%
	guicontrol,,8ButtonVokabel1Löschen,%Vokabel__löschen1%%DoppelteVokabel1%%Vokabel__löschen2%
	guicontrol,,8ButtonVokabel2Löschen,%Vokabel__löschen1%%DoppelteVokabel2%%Vokabel__löschen2% (%Entf_%)

	
}
else
{
	guicontrol,,8ButtonVokabel1Bearbeiten,%Vokabel__bearbeiten1%???%Vokabel__bearbeiten2%
	guicontrol,,8ButtonVokabel2Bearbeiten,%Vokabel__bearbeiten1%???%Vokabel__bearbeiten2%
	guicontrol,,8ButtonVokabel1Löschen,%Vokabel__löschen1%???%Vokabel__löschen2%
	guicontrol,,8ButtonVokabel2Löschen,%Vokabel__löschen1%???%Vokabel__löschen2% (%Entf_%)
}
	



return


8ListView:
;~ splashtexton,,,%A_guiEvent%
;~ sleep,100
;~ splashtextoff
Return


8ButtonVokabel1Bearbeiten:
if DoppelteVokabel1=
return
ifinstring,DoppelteVokabel1,_
return

IfNotInString,8VariableAufgabenPlaner,%Bearbeiten__% %DoppelteVokabel1%.
{
	IfNotInString,8VariableAufgabenPlaner,%Löschen__% %DoppelteVokabel1%.
	{
		8VariableAufgabenPlaner=%8VariableAufgabenPlaner%|%Bearbeiten__% %DoppelteVokabel1%.
		guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
	}
	Else
	{
		MsgBox, 262144, %Achtung_%, %Das_willst_du_doch_schon_löschen%
	}
}
guicontrol,focus,ListBoxGleicheVokabeln
return
8ButtonVokabel2Bearbeiten:
if DoppelteVokabel1=
return
ifinstring,DoppelteVokabel1,_
return
IfNotInString,8VariableAufgabenPlaner,%Bearbeiten__% %DoppelteVokabel2%.
{
	IfNotInString,8VariableAufgabenPlaner,%Löschen__% %DoppelteVokabel2%.
	{
		8VariableAufgabenPlaner=%8VariableAufgabenPlaner%|%Bearbeiten__% %DoppelteVokabel2%.
		guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
	}
	Else
	{
		MsgBox, 262144, %Achtung_%, %Das_willst_du_doch_schon_löschen%
	}
}
guicontrol,focus,ListBoxGleicheVokabeln
return
8ButtonVokabel1Löschen:
if DoppelteVokabel1=
return
ifinstring,DoppelteVokabel1,_
return
IfNotInString,8VariableAufgabenPlaner,%Löschen__% %DoppelteVokabel1%.
{
	IfNotInString,8VariableAufgabenPlaner,%Bearbeiten__% %DoppelteVokabel1%.
	{
		8VariableAufgabenPlaner=%8VariableAufgabenPlaner%|%Löschen__% %DoppelteVokabel1%.
		guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
	}
	Else
	{
		MsgBox, 262144, %Achtung_%,%Das_willst_du_doch_scon_bearbeiten%
	}
}
guicontrol,focus,ListBoxGleicheVokabeln
return
8ButtonVokabel2Löschen:
if DoppelteVokabel1=
return
ifinstring,DoppelteVokabel1,_
return
IfNotInString,8VariableAufgabenPlaner,%Löschen__% %DoppelteVokabel2%.
{
	IfNotInString,8VariableAufgabenPlaner,%Bearbeiten__% %DoppelteVokabel2%.
	{
		8VariableAufgabenPlaner=%8VariableAufgabenPlaner%|%Löschen__% %DoppelteVokabel2%.
		guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
	}
	Else
	{
		MsgBox, 262144, %Achtung_%,%Das_willst_du_doch_scon_bearbeiten%
	}
}
guicontrol,focus,ListBoxGleicheVokabeln

return

8AufgabenPlaner:
if a_guievent=doubleclick
{
stringgetpos,pos1,8VariableAufgabenPlaner,|,% "L" A_EventInfo
if pos1<>-1
{
	stringgetpos,pos2,8VariableAufgabenPlaner,|,% "L" A_EventInfo + 1
	stringleft,Teil1,8VariableAufgabenPlaner,%pos1%
	if pos2<>-1
	stringtrimleft,Teil2,8VariableAufgabenPlaner,%pos2%
	else
	Teil2=
	;~ msgbox,%A_EventInfo%,`n%pos1%, %pos2%`n%8VariableAufgabenPlaner%`n%teil1%, %Teil2%
	8VariableAufgabenPlaner=%teil1%%Teil2%
}
Else ;den einzigen Eintrag löschen
{
	8VariableAufgabenPlaner=
	guicontrol,,8AufgabenPlaner,|
}

guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
}
return


8Ausführen:
loop,parse,8VariableAufgabenPlaner,|
{
;~ 	msgbox,%A_loopfield%
	ifinstring,A_loopfield,%Löschen__%
	{
		FeldVokabel=%A_loopfield%
		stringreplace,FeldVokabel,FeldVokabel,%Löschen__%%a_space%
		stringtrimright,FeldVokabel,FeldVokabel,1
		BeimDoppelteVokabelSucheGelöscht=ja
		
;~ 		msgbox,%FeldVokabel% soll gelöscht werden
		inidelete,Vokabellisten\%AktuelleListe%.ini,%FeldVokabel% ;die Vokabel löschen
	}
	ifinstring,A_loopfield,%Bearbeiten__%
	{
		gui,destroy
		BeimDoppelteVokabelSucheDieseVokabelSchonBearbeitet=
		FeldVokabel=%A_loopfield%
		stringreplace,FeldVokabel,FeldVokabel,%Bearbeiten__%%a_space%
		stringtrimright,FeldVokabel,FeldVokabel,1
		;~ msgbox,%FeldVokabel% soll bearbeitet werden
		AktuelleVokabel:=FeldVokabel
		iniwrite,%AktuelleVokabel%,Einstellungen.ini,Allgemein,Aktuelle Vokabel
		WelchesLetztesFensterVorBearbeiten=NachDoppeltenVokabelnSuchen
;~ 		NächstesFenster=VokabelBearbeiten
		gosub,VokabelBearbeiten
		guckenObVokabelBearbeitet:
		if BeimDoppelteVokabelSucheDieseVokabelSchonBearbeitet=ja
			sleep,100
		else
			goto,guckenObVokabelBearbeitet
		
		
	}
	
}



if BeimDoppelteVokabelSucheGelöscht=ja
Gosub,VokabellisteReparieren

goto,8fertig

return


8AlleKomplettGleichenLöschen:
loop,parse,ListBoxVariable,|
{
;~ 	msgbox,%A_loopfield%
	if a_index=1 ;am Anfang ist kommt die Überschrift der ersten Kategorie
	Continue
	ifnotinstring,A_loopfield,_ ;wenn man noch nicht bei der nächsten Kategorie angelangt ist
	{
		TestVokabel=%A_loopfield%
		loop,parse,TestVokabel,CSV
		{
			DoppelteVokabel%A_Index%:=A_loopfield
;~ 		 	msgbox,%A_loopfield%
			if a_index=2 ;Jeweils die zweite vokabel mit der höheren Nummer wird gelöscht
			{
				IfNotInString,8VariableAufgabenPlaner,%Löschen__% %DoppelteVokabel2%.
				{
					IfNotInString,8VariableAufgabenPlaner,%Bearbeiten__% %DoppelteVokabel2%.
					{
						8VariableAufgabenPlaner=%8VariableAufgabenPlaner%|%Löschen__% %DoppelteVokabel2%.
						guicontrol,,8AufgabenPlaner,%8VariableAufgabenPlaner%
					}
				}
			}
			
		}
		
		
		
		
		
		
	}
	Else
	break
	
	
}

return







8Fertig:
hotkey,del,8ButtonVokabel2Löschen,off
DoppelteVokabelSucheAbbrechen=ja
nächstesFenster=Hauptmenü
goto,nächstesFensterÖffnen
