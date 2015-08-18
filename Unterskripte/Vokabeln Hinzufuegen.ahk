

VokabelnHinzufügen:
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,ObVokabelnAussprechen,Einstellungen.ini,Einstellungen,Vokabeln aussprechen
iniread,SchonGemerkt,Einstellungen.ini,Allgemein,Schon gemerkt,%a_space%

iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2







Gui, Add, Text, x36 y8 w490 h20 , %Gib_hier_die_Vokabeln_ein%
Gui, Add, Button, gButtonVokabelnImportieren x480 y8 w100 h20 default, %Vokabeln_importieren%
gui, add, checkbox,vobKopiermodus gobKopiermodus x466 y35, %Kopiermodus_aktivieren%
Gui, Add, Text, x36 y40 w70 h20 , %aktuelleListeErsteSprache%
Gui, Add, Text, x36 y230 w70 h20 ,%aktuelleListeZweiteSprache%
Gui, Font, S16 CDefault, Verdana
Gui, Add, Edit, gtext vDeutsch1 limit x36 y70 w570 h30
Gui, Add, Edit, gtext vDeutsch2 limit x36 y105 w570 h30
Gui, Add, Edit, gtext vDeutsch3 limit x36 y140 w570 h30
Gui, Font, S8, Verdana
gui, add, edit, gtext vKommentarDeutsch  x36 y180 w570 r2 limit -vscroll 
Gui, Font, S16 CDefault, Verdana
;~ Gui, Add, Edit, gtext vKommentarDeutsch limit x606 y70 w300 h110 
Gui, Add, Edit, gtext vEnglisch1 limit x36 y260 w570 h30
Gui, Add, Edit, gtext vEnglisch2 limit x36 y295 w570 h30
Gui, Add, Edit, gtext vEnglisch3 limit x36 y330 w570 h30
Gui, Font, S8, Verdana
gui, add, edit, gtext vKommentarEnglisch x36 y370 w570 r2  -vscroll limit 
;~ Gui, Add, Edit, gtext vKommentarEnglisch x36 y230 w300 h110
gui,font, s9 CDefault ,  MS sans serif
Gui, Add, Button, gweiter x35 y410 w110 h40 default, %Vokabel_hinzufüge%
Gui, Add, Button, genden x150 y410 w95 h40 , %Eingabe_beenden%
Gui, Add, Button, gbuttonLeeren x250 y410 w50 h40 +Center, %Leeren_%
gui, add, button, gButtonEinstellungen x305 y410 w80 h40, %Einstellungen_%
gui, add, button, vbuttonLetztesWortBearbeiten gbuttonLetztesWortBearbeiten x390 y410 w100 h40 disabled ,%Das_letzte_Wort_bearbeiten%
gui, add, text, x495 y410 r1 w800 vZuletztEingegebenD,%Letztes_Wort%
gui, add, text, x495 y430 r1 w800 vZuletztEingegebenE,


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
guicontrol,font,Deutsch
guicontrol,font,Englisch

guicontrol,focus,Deutsch1

if ObVokabelnBeimHinzufügenWiederherstellen=ja ;Wenn man in den Einstellungen war, werden die Vokabeln, die davor angezeigt wurden, wiederhergestellt
{
	zahl:=AktuelleVokabel
;~ 	guicontrol,enable,buttonLetztesWortBearbeiten
	guicontrol,,Deutsch1,%Temp2Deutsch1%
	guicontrol,,Deutsch2,%Temp2Deutsch2%
	guicontrol,,Deutsch3,%Temp2Deutsch3%
	guicontrol,,Englisch1,%Temp2Englisch1%
	guicontrol,,Englisch2,%Temp2Englisch2%
	guicontrol,,Englisch3,%Temp2Englisch3%
	guicontrol,,KommentarDeutsch,%Temp2KommentarDeutsch%
	guicontrol,,KommentarEnglisch,%Temp2KommentarEnglisch%
	ObVokabelnBeimHinzufügenWiederherstellen= ;Damit es ein zweites mal, wenn man nicht wiederherstellen will, wiederhergestellt wird
}


zeigen:

Gui, Show,w620 h458 y160,Vokabeln hinzufügen zur Liste "%AktuelleListe%"


;Schon gemerkt
ifnotinstring,SchonGemerkt,Klammern
{
msgbox,,%Schon_gemerkt%,%Klammern_%
SchonGemerkt=%SchonGemerkt%-Klammern-
iniwrite,%SchonGemerkt%,Einstellungen.ini,Allgemein,Schon gemerkt
}

ifnotinstring,SchonGemerkt,Kopiermodus
{
msgbox,,%Schon_gemerkt%,%Kopiermodus_%
SchonGemerkt=%SchonGemerkt%-Kopiermodus-
iniwrite,%SchonGemerkt%,Einstellungen.ini,Allgemein,Schon gemerkt
}


return


buttonLeeren:
guicontrol,,Deutsch1
guicontrol,,Deutsch2
guicontrol,,Deutsch3
guicontrol,,Englisch1
guicontrol,,Englisch2
guicontrol,,Englisch3
guicontrol,,KommentarDeutsch
guicontrol,,KommentarEnglisch
guicontrol,focus,Deutsch1
return


ButtonEinstellungen:
gui,submit
gosub,VokabelnBeiEingabeTemporärSpeichernFürHinzufügen
WelchesLetztesFensterVorEinstellungen=VokabelnHinzufügen ;um nach den Einstellungen wieder zurückzukommen
NächstesFenster=Einstellungen
goto,NächstesFensterÖffnen
return


buttonLetztesWortBearbeiten:
gui,submit
AktuelleVokabel:=zahl

if AktuelleVokabel=Nr. ;bugsuche
	msgbox,Bug in Vokabeln Hinzufügen

iniwrite,%AktuelleVokabel%,Einstellungen.ini,Allgemein,Aktuelle Vokabel
gosub,VokabelnBeiEingabeTemporärSpeichernFürHinzufügen
WelchesLetztesFensterVorBearbeiten=VokabelnHinzufügen
NächstesFenster=VokabelBearbeiten
goto,NächstesFensterÖffnen
exitapp


obKopiermodus:
gui,submit,nohide
if obKopiermodus=1
{
onoff=on
gui,2:+owner
gui,2:+ToolWindow
gui,2:+alwaysontop
;~ gui,2:+autosize
gui,2:+resize
gui,2:add,text, w800 h115 vtexxt, d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
gui,2:show,y0 xcenter na
gui,minimize

}
Else
{
	onoff=off
	gui, 2:destroy
}

hotkey,f5,d1,%onoff%
hotkey,f6,d2,%onoff%
hotkey,f7,d3,%onoff%
hotkey,f8,dk,%onoff%
hotkey,f9,e1,%onoff%
hotkey,f10,e2,%onoff%
hotkey,f11,e3,%onoff%
hotkey,f12,ek,%onoff%
hotkey,f4,entern,%onoff%


return


d1:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Deutsch1,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Deutsch1,%Deutsch1%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
dsprechen1=%Deutsch1%
JetztSprechen("d1")
}
GeradeKnopfGedrückt=nein
return


d2:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Deutsch2,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Deutsch2,%Deutsch2%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
dsprechen1=%Deutsch2%
JetztSprechen("d1")
}
GeradeKnopfGedrückt=nein
return


d3:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Deutsch3,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Deutsch3,%Deutsch3%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
dsprechen1=%Deutsch3%
JetztSprechen("d1")
}
GeradeKnopfGedrückt=nein
return


dk:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,KommentarDeutsch,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,KommentarDeutsch,%KommentarDeutsch%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
dsprechen1=%KommentarDeutsch%
JetztSprechen("d1")
}
GeradeKnopfGedrückt=nein
return


e1:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Englisch1,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Englisch1,%Englisch1%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
esprechen1=%Englisch1%
JetztSprechen("e1")
}
GeradeKnopfGedrückt=nein
return


e2:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Englisch2,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Englisch2,%Englisch2%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
esprechen1=%Englisch2%
JetztSprechen("e1")
}
GeradeKnopfGedrückt=nein
return


e3:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,Englisch3,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,Englisch3,%Englisch3%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
esprechen1=%Englisch3%
JetztSprechen("e1")
}
GeradeKnopfGedrückt=nein
return


ek:
send,^c
sleep,50
GeradeKnopfGedrückt=ja ;Um zu verhindern, dass er nach dem folgenden Befehl beim Text: nichts verändert
guicontrol,,KommentarEnglisch,%clipboard%
clipboard=
gui submit,nohide
gosub,testen
sleep,50
guicontrol,,KommentarEnglisch,%KommentarEnglisch%
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
sleep,50
if ObVokabelnAussprechen=ja
{
esprechen1=%KommentarEnglisch%
JetztSprechen("e1")
}
GeradeKnopfGedrückt=nein
return


entern:
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%
goto,weiter
return

text:
if GeradeKnopfGedrückt=nein
gui submit, nohide
if obKopiermodus=1
guicontrol,2:,texxt,d1: %Deutsch1%`nd2: %Deutsch2%`nd3: %Deutsch3%`ndk: %KommentarDeutsch%`ne1: %Englisch1%`ne2: %Englisch2%`ne3: %Englisch3%`nek: %KommentarEnglisch%

return



weiter:

Gui, Submit,nohide

;Prüfen, Ob Error Vorhanden ist


;Prüfen, ob mehr als zwei Klammern drin sind
stringgetpos,a,englisch1,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}
stringgetpos,a,englisch2,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}
stringgetpos,a,englisch3,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}
stringgetpos,a,deutsch1,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}
stringgetpos,a,deutsch2,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}
stringgetpos,a,deutsch3,(,l3
if errorlevel=0
{
	msgbox,%höchstens_zwei_klammern%
	goto,zeigen
}





etwasFehlt=0
if Englisch1= ;wenn in Englisch 1 nicht eingetragen ist
{
guicontrol,+cff0000,Englisch ;Englisch rot färben

guicontrol,focus,Englisch1 ;Auf Einglisch 1 springen
etwasFehlt=1
}
Else
guicontrol,+c000000,Englisch ;englisch schwarz färben (falls es vorher rot war)


if deutsch1=
{
guicontrol,+cff0000,Deutsch

guicontrol,focus,Deutsch1
etwasFehlt=1
}
Else
guicontrol,+c000000,Deutsch

guicontrol,hide,Englisch ;Guis kurz verstecken und dann zeigen, damit sie die neue Farbe annehmen
guicontrol,show,Englisch
guicontrol,hide,Deutsch
guicontrol,show,Deutsch

if etwasFehlt=1
goto zeigen

gosub,testen



zahl=1
nomol: ;Vokabel speichern
iniread,ebbis,Vokabellisten\%AktuelleListe%.ini,%zahl%,Vokabel
if ebbis =ja
{
zahl++
goto,nomol
}
stringreplace,KommentarDeutsch,KommentarDeutsch,`n,$nächsteZeile$
stringreplace,KommentarEnglisch,KommentarEnglisch,`n,$nächsteZeile$
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
iniwrite,1,Vokabellisten\%AktuelleListe%.ini,%zahl%,Kasten
iniwrite,%zahl%,Vokabellisten\%AktuelleListe%.ini,info,Anzahl


guicontrol,,ZuletztEingegebenD,D: %Deutsch1%`n
guicontrol,,ZuletztEingegebenE,E: %Englisch1%
;msgbox,%Deutsch1%,%Deutsch2%,%Deutsch3%,`n%Englisch1%,%Englisch2%,%Englisch3%
Guicontrol,, Deutsch1
Guicontrol,, Deutsch2
Guicontrol,, Deutsch3
Guicontrol,, KommentarDeutsch
Guicontrol,, Englisch1
Guicontrol,, Englisch2
Guicontrol,, Englisch3
Guicontrol,, KommentarEnglisch
if ObVokabelnAussprechen=ja
{
dsprechen1=Neues Wort
JetztSprechen("d1")
}
guicontrol,enable,buttonLetztesWortBearbeiten
guicontrol,focus,Deutsch1
Return




testen:
entfernt=0
step=1
loop,8 ;Häufige Eingabefehler korrigieren
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
	if step=7
	TestVokabel:=KommentarDeutsch
	if step=8
	TestVokabel:=KommentarEnglisch
	
schritt=1
loop,10
{
	stringreplace,TestVokabel,TestVokabel,etw.,etw
	stringreplace,TestVokabel,TestVokabel,jn.,jn
	stringreplace,TestVokabel,TestVokabel,jm.,jm
	stringreplace,TestVokabel,TestVokabel,jdm.,jm
	stringreplace,TestVokabel,TestVokabel,jdn.,jn
	stringreplace,TestVokabel,TestVokabel,sth.,sth
	stringreplace,TestVokabel,TestVokabel,sb.,sb
	stringreplace,TestVokabel,TestVokabel,s.o.,sb
	stringreplace,TestVokabel,TestVokabel,jds.,jns
	stringleft,a,TestVokabel,1 ;Links ein Leerzeichen finden
	if (a= "#" or a=a_space or a="+" or a="*" or a="'" or a="," or a="." or a="_" or a=";" or a=":")
	stringtrimleft,TestVokabel,TestVokabel,1
	stringright,a,TestVokabel,1 ;Rechts ein Leerzeichen finden
	if (a= "#" or a=a_space or a="+" or a="*" or a="'" or a="," or a="." or a="_" or a=";" or a=":")
	stringtrimright,TestVokabel,TestVokabel,1
	stringreplace,TestVokabel,TestVokabel,%a_space%%a_space%,%a_space% ;Doppeltes Leerzeichen finden
	stringreplace,TestVokabel,TestVokabel,(to),to

	stringreplace,TestVokabel,TestVokabel,·
	if schritt<5
	{
	stringreplace,TestVokabel,TestVokabel,-`n
	stringreplace,TestVokabel,TestVokabel,-`r
	}
	else
	{
	stringreplace,TestVokabel,TestVokabel,`n,%a_space%
	stringreplace,TestVokabel,TestVokabel,`r,%a_space%
	}
	schritt++
}

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
	if step=7
	KommentarDeutsch:=TestVokabel
	if step=8
	KommentarEnglisch:=TestVokabel
	step++
}


return

ButtonVokabelnImportieren:
gui,submit
gosub,VokabelnBeiEingabeTemporärSpeichernFürHinzufügen
WelchesLetztesFensterVorVokabelnHinzufügen=VokabelnHinzufügen ;um nach den Einstellungen wieder zurückzukommen
NächstesFenster=VokabelnImportieren
goto,NächstesFensterÖffnen

return


enden:
NächstesFenster:=WelchesLetztesFensterVorVokabelnHinzufügen
goto,NächstesFensterÖffnen

