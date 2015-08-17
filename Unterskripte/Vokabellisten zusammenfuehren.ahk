VokabellistenZusammenführen:
liste=|
loop,%a_workindir%Vokabellisten\*
{
	liste=%liste%%A_LoopFileName%|
}
stringreplace,liste,liste,.ini,,all

iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
stringreplace,liste,liste,|%AktuelleListe%|,|%AktuelleListe%||
stringtrimleft,liste,liste,1
Gui, Add, Text, x16 y10 h20 , Welche Vokabellisten sollen zusammengeführt werden?`nDabei werden die Vokabeln aus der rechten Liste in die linke Liste verschoben.
Gui, Add, DropDownList, sort x16 y60 w180 h300 vvoklist1,%liste%
gui, font, bold s16
gui, add, text,x200 y58 w10,<
gui, add, text,x210 y56,——
gui, font, norm s8
Gui, Add, DropDownList, sort x240 y60 w180 h300 vAktuelleListe,%liste%
gui, add, radio,voblöschen x200 y90,Die rechte Liste anschließend löschen.
gui, add, radio,checked vobnichtlöschen x200 y105,Die rechte Liste anschließend nicht löschen.
gui, add, button, vbuttonZusammenführen gbuttonZusammenführen x16 y90 w100 h30 default, Zusammenführen
gui, add, button, gbuttonabbrechen vbuttonabbrechen x120 y90 w70 h30, Abbrechen

gui,show,,Vokabellisten zusamenführen
return

buttonabbrechen:
nächstesFenster=Hauptmenü
goto,nächstesFensterÖffnen
exitapp

buttonZusammenführen:
gui submit

if voklist1=%AktuelleListe%
{
	msgbox,Wie soll ich bitteschön zwei gleiche Listen zusammenführen?
	gui show
	Return
}
if oblöschen=1
UndLöscheAnschließend= %a_space%und lösche "%AktuelleListe%" anschließend
splashtexton,500,100,Zusammenführen...,Verschiebe die Vokabeln aus der Liste "%AktuelleListe%" in die Liste "%voklist1%"%UndLöscheAnschließend%.
zahl=1
Loop
{
iniread,test,Vokabellisten\%voklist1%.ini,%zahl%,Vokabel ;eine Zeile lesen
if test = ja ;wenn die Zeile eine Vokabel enthält
zahl++
else
break
}

zeile=1
loop ;Vokabelliste reparieren
{

iniread,test,Vokabellisten\%AktuelleListe%.ini,%zeile%,Vokabel ;eine Zeile lesen
if test = ja ;wenn die Zeile eine Vokabel enthält
{
	iniread,aktuellvokabel1,Vokabellisten\%AktuelleListe%.ini,%zeile%,d1,%a_space% ;alles einlesen
	iniread,aktuellvokabel2,Vokabellisten\%AktuelleListe%.ini,%zeile%,d2,%a_space%
	iniread,aktuellvokabel3,Vokabellisten\%AktuelleListe%.ini,%zeile%,d3,%a_space%
	iniread,evokabel1,Vokabellisten\%AktuelleListe%.ini,%zeile%,e1,%a_space%
	iniread,evokabel2,Vokabellisten\%AktuelleListe%.ini,%zeile%,e2,%a_space%
	iniread,evokabel3,Vokabellisten\%AktuelleListe%.ini,%zeile%,e3,%a_space%
	iniread,fach,Vokabellisten\%AktuelleListe%.ini,%zeile%,Kasten,%a_space%
	iniread,KommentarEnglisch,Vokabellisten\%AktuelleListe%.ini,%zeile%,KommentarEnglisch,%a_space%
	iniRead,KommentarDeutsch,Vokabellisten\%AktuelleListe%.ini,%zeile%,KommentarDeutsch,%a_space%
	iniread,ZuletztAbgefragt,Vokabellisten\%AktuelleListe%.ini,%zeile%,Zuletzt abgefragt,%a_space%
	iniread,WieOftVokabelRichtigBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl richtig,%a_space%
	iniread,WieOftVokabelFalschBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl falsch,%a_space%
	
	
	iniwrite,ja,Vokabellisten\%voklist1%.ini,%zahl%,Vokabel ;Vokabel speichern
	if aktuellvokabel1<>
	iniwrite,%aktuellvokabel1%,Vokabellisten\%voklist1%.ini,%zahl%,d1
	if aktuellvokabel2<>
	iniwrite,%aktuellvokabel2%,Vokabellisten\%voklist1%.ini,%zahl%,d2
	if aktuellvokabel3<>
	iniwrite,%aktuellvokabel3%,Vokabellisten\%voklist1%.ini,%zahl%,d3
	if evokabel1<>
	iniwrite,%evokabel1%,Vokabellisten\%voklist1%.ini,%zahl%,e1
	if evokabel2<>
	iniwrite,%evokabel2%,Vokabellisten\%voklist1%.ini,%zahl%,e2
	if evokabel3<>
	iniwrite,%evokabel3%,Vokabellisten\%voklist1%.ini,%zahl%,e3
	if KommentarEnglisch<>
	iniwrite,%KommentarEnglisch%,Vokabellisten\%voklist1%.ini,%zahl%,KommentarEnglisch
	if KommentarDeutsch<>
	iniwrite,%KommentarDeutsch%,Vokabellisten\%voklist1%.ini,%zahl%,KommentarDeutsch
	iniwrite,%fach%,Vokabellisten\%voklist1%.ini,%zahl%,Kasten
	if ZuletztAbgefragt<>
	iniwrite,%ZuletztAbgefragt%,Vokabellisten\%voklist1%.ini,%zahl%,Zuletzt abgefragt
	
	if WieOftVokabelRichtigBeantwortet<>
	iniwrite,%WieOftVokabelRichtigBeantwortet%,Vokabellisten\%voklist1%.ini,%zahl%,Anzahl richtig
	if WieOftVokabelFalschBeantwortet<>
	iniwrite,%WieOftVokabelFalschBeantwortet%,Vokabellisten\%voklist1%.ini,%zahl%,Anzahl falsch
	zahl++ ;Zur nächsten Zeile springen
	zeile++
}
Else
break
}
if oblöschen=1
filedelete,Vokabellisten\%AktuelleListe%.ini
inidelete,Vokabellisten\%voklist1%.ini,info,Anzahl
splashtextoff
goto,buttonAbbrechen