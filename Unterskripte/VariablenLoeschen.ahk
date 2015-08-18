
VariablenLöschen:
gui,1:default
gui,destroy
gui,2:destroy
gui,3:destroy
gui,6:destroy
gosub,SprechenStoppen
settimer,JedeSekundeMachen,off ;Falls Timer an war, ausmachen

zeile=1 ;Alle Infos über vorhandene Vokabeln löschen, (nötig, wenn man eine Vokabel löscht)
loop
{
	if Vokabel%zeile%existiert=ja
	{
		Vokabel%zeile%ZuletztAbgefragt=
		Vokabel%zeile%Fach=
		Vokabel%zeile%existiert=
	}
	else
	break
	zeile++
}

	
AnzahlVokabeln=
	
e1=
e2=
e3=
ek=
d1=
d2=
d3=
dk=
Deutsch1=
Deutsch2=
Deutsch3=
KommentarDeutsch=
Englisch1=
Englisch2=
Englisch3=
KommentarEnglisch=
anzahlDerLösungenIne1=
anzahlDerLösungenIne2=
anzahlDerLösungenIne3=

zahl=1
loop,%AnzahlDerNötigenDurchgängeUmAlleVokabelnZuPrüfen%
{
	e1vokabelnr%zahl%=
	e2vokabelnr%zahl%=
	e3vokabelnr%zahl%=
}
AnzahlDerNötigenDurchgängeUmAlleVokabelnZuPrüfen=
DurchgangDerVokabelPrüfung=

zahl=
zeile=
vokabel=

;Kopiermodus abschalten
obKopiermodus=0
onoff=off
hotkey,f5,d1,%onoff%
hotkey,f6,d2,%onoff%
hotkey,f7,d3,%onoff%
hotkey,f8,dk,%onoff%
hotkey,f9,e1,%onoff%
hotkey,f10,e2,%onoff%
hotkey,f11,e3,%onoff%
hotkey,f12,ek,%onoff%
hotkey,f4,entern,%onoff%





;Doppelte Vokabel Suche:
BeimDoppelteVokabelSucheGelöscht=


return
