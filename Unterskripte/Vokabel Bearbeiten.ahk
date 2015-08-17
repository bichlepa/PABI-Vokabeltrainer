VokabelBearbeiten:

iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,zahl,Einstellungen.ini,Allgemein,Aktuelle Vokabel

iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2

iniread,kasten,Vokabellisten\%AktuelleListe%.ini,%zahl%,Kasten
iniread,WieOftVokabelRichtigBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zahl%,Anzahl richtig,%a_space%
iniread,WieOftVokabelFalschBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zahl%,Anzahl falsch,%a_space%
iniread,ZuletztAbgefragt,Vokabellisten\%AktuelleListe%.ini,%zahl%,Zuletzt abgefragt,%a_space%
if ObVokabelnBeimBearbeitenWiederherstellen=ja ;Wenn man in den Einstellungen war, werden die Vokabeln, die davor angezeigt wurden, wiederhergestellt
{

	d1:=TempDeutsch1
	d2:=TempDeutsch2
	d3:=TempDeutsch3
	e1:=TempEnglisch1
	e2:=TempEnglisch2
	e3:=TempEnglisch3
	KommentarDeutsch:=TempKommentarDeutsch
	KommentarEnglisch:=TempKommentarEnglisch
	ObVokabelnBeimBearbeitenWiederherstellen= ;Damit es ein zweites mal, wenn man nicht wiederherstellen will, wiederhergestellt wird
}
Else
{
	iniread,d1,Vokabellisten\%AktuelleListe%.ini,%zahl%,d1,%a_space%
	iniread,d2,Vokabellisten\%AktuelleListe%.ini,%zahl%,d2,%a_space%
	iniread,d3,Vokabellisten\%AktuelleListe%.ini,%zahl%,d3,%a_space%
	iniread,e1,Vokabellisten\%AktuelleListe%.ini,%zahl%,e1,%a_space%
	iniread,e2,Vokabellisten\%AktuelleListe%.ini,%zahl%,e2,%a_space%
	iniread,e3,Vokabellisten\%AktuelleListe%.ini,%zahl%,e3,%a_space%
	iniread,KommentarEnglisch,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarEnglisch,%a_space%
	IniRead,KommentarDeutsch,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarDeutsch,%a_space%
}
stringreplace,KommentarDeutsch,KommentarDeutsch,$nächsteZeile$,`n
stringreplace,KommentarEnglisch,KommentarEnglisch,$nächsteZeile$,`n


Gui, Add, Text, x36 y8 w490 h20 , %Gib_hier_die_Vokabeln_ein%
Gui, Add, Text, x36 y40 w70 h20 , %aktuelleListeErsteSprache%
Gui, Add, Text, x36 y230 w70 h20 , %aktuelleListeZweiteSprache%
Gui, Font, S16 CDefault, Verdana
Gui, Add, Edit, vDeutsch1 limit x36 y70 w570 h30
Gui, Add, Edit, vDeutsch2 limit x36 y105 w570 h30
Gui, Add, Edit, vDeutsch3 limit x36 y140 w570 h30 
Gui, Font, S8, Verdana
gui, add, edit, vKommentarDeutsch  x36 y180 w570 r2 limit -vscroll 
Gui, Font, S16 CDefault, Verdana
Gui, Add, Edit, vEnglisch1 limit x36 y260 w570 h30
Gui, Add, Edit, vEnglisch2 limit x36 y295 w570 h30
Gui, Add, Edit, vEnglisch3 limit x36 y330 w570 h30
Gui, Font, S8, Verdana
gui, add, edit, vKommentarEnglisch x36 y370 w570 r2  -vscroll limit 
gui,font, s9 CDefault ,  MS sans serif
Gui, Add, Button, G7weiter x36 y410 w110 h40 default, %Vokabel_ändern%
Gui, Add, Button, g7enden x156 y410 w120 h40 , %Abbrechen_%
Gui, Add, Button, g7löschen x286 y410 w60 h40 , %Löschen_%
gui, add, button, g7ButtonEinstellungen x355 y410 w100 h40, %Einstellungen_%
gui, add, button, gButtonVertauschen x250 y220 w200 h30,%Inhalte_vertauschen%



Gui, Font, S16 CDefault, Verdana
guicontrol,font,Deutsch1
guicontrol,font,Deutsch2
guicontrol,font,Deutsch3
guicontrol,font,Englisch1
guicontrol,font,Englisch2
guicontrol,font,Englisch3
Gui, Font, S8, Verdana
guicontrol,font,KommentarDeutsch
guicontrol,font,KommentarEnglisch

gui,font, s10 CDefault bold, Verdana
guicontrol,,Deutsch1,%d1%
guicontrol,,Deutsch2,%d2%
guicontrol,,Deutsch3,%d3%
guicontrol,,Englisch1,%e1%
guicontrol,,Englisch2,%e2%
guicontrol,,Englisch3,%e3%
guicontrol,,KommentarDeutsch,%KommentarDeutsch%
guicontrol,,KommentarEnglisch,%KommentarEnglisch%


gui,font, s10 CDefault bold, Verdana
guicontrol,font,Deutsch
guicontrol,font,Englisch



7zeigen:
Gui, Show, ,%Vokabel_bearbeiten%
Return


7löschen:
Gui, Submit  
inidelete,Vokabellisten\%AktuelleListe%.ini,%zahl% ;die Vokabel löschen
gui,destroy
Gosub,VokabellisteReparieren
goto,7enden

7ButtonEinstellungen:
gui,submit
gosub,VokabelnBeiEingabeTemporärSpeichernFürBearbeiten
WelchesLetztesFensterVorEinstellungen=VokabelBearbeiten
NächstesFenster=Einstellungen
goto,NächstesFensterÖffnen
return

ButtonVertauschen:

gui, submit, nohide
guicontrol,,Deutsch1,%Englisch1%
guicontrol,,Deutsch2,%Englisch2%
guicontrol,,Deutsch3,%Englisch3%
guicontrol,,Englisch1,%Deutsch1%
guicontrol,,Englisch2,%Deutsch2%
guicontrol,,Englisch3,%Deutsch3%
guicontrol,,KommentarDeutsch,%KommentarEnglisch%
guicontrol,,KommentarEnglisch,%KommentarDeutsch%
gui, submit, nohide
return

7weiter:

Gui, Submit  



;Prüfen, ob mehr als zwei Klammern drin sind
stringgetpos,a,englisch1,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}
stringgetpos,a,englisch2,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}
stringgetpos,a,englisch3,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}
stringgetpos,a,deutsch1,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}
stringgetpos,a,deutsch2,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}
stringgetpos,a,deutsch3,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,7zeigen
}






if englisch1=
{
guicontrol,+cff0000,Englisch
guicontrol,focus,Englisch1
etwasFehlt=1
}
Else
guicontrol,+c000000,Englisch


if deutsch1=
{
guicontrol,+cff0000,Deutsch
guicontrol,focus,Deutsch1
etwasFehlt=1
}
Else
guicontrol,+c000000,Deutsch

if etwasFehlt=1
goto 7zeigen




step=1
loop,6 ;Häufige Eingabefehler korrigieren
{
	if step=1
	TestVokabel:=Englisch1
	if step=2
	TestVokabel:=Englisch2
	if step=3
	TestVokabel:=Englisch3
	if step=4
	TestVokabel:=Deutsch1
	if step=5
	TestVokabel:=Deutsch2
	if step=6
	TestVokabel:=Deutsch3
		stringleft,bstabe,TestVokabel,1 ;Links ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimleft,TestVokabel,TestVokabel,1
		stringleft,bstabe,TestVokabel,1  ;Links noch ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimleft,TestVokabel,TestVokabel,1
		stringright,bstabe,TestVokabel,1 ;Rechts ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimright,TestVokabel,TestVokabel,1
		stringright,bstabe,TestVokabel,1 ;Rechts eine Raute finden
		if bstabe=#
		stringtrimright,TestVokabel,TestVokabel,1
		stringright,bstabe,TestVokabel,1 ;Rechts ein Plus finden
		if bstabe=+
		stringtrimright,TestVokabel,TestVokabel,1
		stringright,bstabe,TestVokabel,1 ;Rechts noch ein Leerzeichen finden
		if bstabe=%a_space%
		stringtrimright,TestVokabel,TestVokabel,1
		stringreplace,TestVokabel,TestVokabel,%a_space%%a_space%,%a_space% ;Doppeltes Leerzeichen finden
		stringreplace,TestVokabel,TestVokabel,%a_space%%a_space%,%a_space%
	if step=1
	Englisch1:=TestVokabel
	if step=2
	Englisch2:=TestVokabel
	if step=3
	Englisch3:=TestVokabel
	if step=4
	Deutsch1:=TestVokabel
	if step=5
	Deutsch2:=TestVokabel
	if step=6
	Deutsch3:=TestVokabel
	step++
}







stringreplace,KommentarDeutsch,KommentarDeutsch,`n,$nächsteZeile$
stringreplace,KommentarEnglisch,KommentarEnglisch,`n,$nächsteZeile$
;~ msgbox,%KommentarDeutsch%


inidelete,Vokabellisten\%AktuelleListe%.ini,%zahl% ;die Vokabel löschen
;die Vokabel neu eintragen
iniwrite,ja,Vokabellisten\%AktuelleListe%.ini,%zahl%,Vokabel
iniwrite,%Deutsch1%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d1
if Deutsch2<>
iniwrite,%Deutsch2%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d2
if Deutsch3<>
iniwrite,%Deutsch3%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d3
if KommentarEnglisch<>
iniwrite,%KommentarEnglisch%,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarEnglisch
iniwrite,%Englisch1%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e1
if Englisch2<>
iniwrite,%Englisch2%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e2
if Englisch3<>
iniwrite,%Englisch3%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e3
if KommentarDeutsch<>
iniwrite,%KommentarDeutsch%,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarDeutsch

iniwrite,%kasten%,Vokabellisten\%AktuelleListe%.ini,%zahl%,Kasten
if WieOftVokabelRichtigBeantwortet<>
iniwrite,%WieOftVokabelRichtigBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%zahl%,Anzahl richtig
if WieOftVokabelFalschBeantwortet<>
iniwrite,%WieOftVokabelFalschBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%zahl%,Anzahl falsch
if ZuletztAbgefragt<>
iniwrite,%ZuletztAbgefragt%,Vokabellisten\%AktuelleListe%.ini,%zahl%,Zuletzt abgefragt



goto,7enden


7enden:

if WelchesLetztesFensterVorBearbeiten=ListeAnschauen
{
	nächstesFenster=ListeAnschauen
	goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorBearbeiten=VokabelnHinzufügen
{
	ObVokabelnBeimHinzufügenWiederherstellen=ja
	NächstesFenster=VokabelnHinzufügen
	goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorBearbeiten=VokabelnAbfragen
{
	nächstesFenster=VokabelnAbfragen
	goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorBearbeiten=NachDoppeltenVokabelnSuchen
{
	BeimDoppelteVokabelSucheDieseVokabelSchonBearbeitet=ja
	gui,destroy
	return
}
msgbox,,Bug!!!,WelchesLetztesFensterVorBearbeiten=%WelchesLetztesFensterVorBearbeiten%

return


