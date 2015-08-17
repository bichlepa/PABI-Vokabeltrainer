VokabellisteReparieren:
splashtexton,200,40,%Reparieren_%, %Repariere_Vokabelliste_nach_Löschen_einer_Vokabel%
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,WelchesLetztesFenster,einstellungen.ini,Allgemein,Letztes Fenster
AnzahlVokabelnReparieren=0
zeile=1
fehl=0
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
	iniread,WieOftVokabelRichtigBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl richtig,%a_space%
	iniread,WieOftVokabelFalschBeantwortet,Vokabellisten\%AktuelleListe%.ini,%zeile%,Anzahl falsch,%a_space%
	iniread,ZuletztAbgefragt,Vokabellisten\%AktuelleListe%.ini,%zeile%,Zuletzt abgefragt,%a_space%
	
	inidelete,Vokabellisten\%AktuelleListe%.ini,%zeile% ;Vokabel löschen
	zahll:=zeile - fehl ;die Vokabelnummer um der fehlender Nummer verringern
	iniwrite,ja,Vokabellisten\%AktuelleListe%.ini,%zahll%,Vokabel ;Vokabel speichern
	if aktuellvokabel1<>
	iniwrite,%aktuellvokabel1%,Vokabellisten\%AktuelleListe%.ini,%zahll%,d1
	if aktuellvokabel2<>
	iniwrite,%aktuellvokabel2%,Vokabellisten\%AktuelleListe%.ini,%zahll%,d2
	if aktuellvokabel3<>
	iniwrite,%aktuellvokabel3%,Vokabellisten\%AktuelleListe%.ini,%zahll%,d3
	if evokabel1<>
	iniwrite,%evokabel1%,Vokabellisten\%AktuelleListe%.ini,%zahll%,e1
	if evokabel2<>
	iniwrite,%evokabel2%,Vokabellisten\%AktuelleListe%.ini,%zahll%,e2
	if evokabel3<>
	iniwrite,%evokabel3%,Vokabellisten\%AktuelleListe%.ini,%zahll%,e3
	if KommentarEnglisch<>
	iniwrite,%KommentarEnglisch%,Vokabellisten\%AktuelleListe%.ini,%zahll%,KommentarEnglisch
	if KommentarDeutsch<>
	iniwrite,%KommentarDeutsch%,Vokabellisten\%AktuelleListe%.ini,%zahll%,KommentarDeutsch
	if WieOftVokabelRichtigBeantwortet<>
	iniwrite,%WieOftVokabelRichtigBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%zahll%,Anzahl richtig
	if WieOftVokabelFalschBeantwortet<>
	iniwrite,%WieOftVokabelFalschBeantwortet%,Vokabellisten\%AktuelleListe%.ini,%zahll%,Anzahl falsch
	if ZuletztAbgefragt<>
	iniwrite,%ZuletztAbgefragt%,Vokabellisten\%AktuelleListe%.ini,%zahll%,Zuletzt abgefragt
	iniwrite,%fach%,Vokabellisten\%AktuelleListe%.ini,%zahll%,Kasten
	AnzahlVokabelnReparieren++
	zeile++ ;Zur nächsten Zeile springen
}
Else
{
	fehl++ ;Anzahl fehlender erhöhen
	zeile++ ;Zur nächsten Zeile springen
}
if fehl >1000 ;Wenn schon zehn mal keine Vokabel, dann gibt es wohl keine mehr
break
}
;~ msgbox,%AnzahlVokabelnReparieren%
iniwrite,%AnzahlVokabelnReparieren%,Vokabellisten\%AktuelleListe%.ini,info,Anzahl
splashtextoff
return