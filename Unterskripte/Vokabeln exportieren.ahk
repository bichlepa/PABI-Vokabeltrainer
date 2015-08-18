VokabelnExportieren:
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,ObVokabelnAussprechen,Einstellungen.ini,Einstellungen,Vokabeln aussprechen
iniread,SchonGemerkt,Einstellungen.ini,Allgemein,Schon gemerkt,%a_space%
iniread,Gesamtzahl,Vokabellisten\%AktuelleListe%.ini,info,Anzahl

iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2


FileSelectFile,toexportfile,S8,,%Speicherort_Für_Den_Export_wählen%, CSV (*.csv)
IfNotInString,toexportfile,.csv
	toexportfile.=".csv"
FileDelete,%toexportfile%

liste=
(
"%aktuelleListeErsteSprache% 1","%aktuelleListeErsteSprache% 2","%aktuelleListeErsteSprache% 3","%aktuelleListeErsteSprache% %Kommentar_%","%aktuelleListeZweiteSprache% 1","%aktuelleListeZweiteSprache% 2","%aktuelleListeZweiteSprache% 3","%aktuelleListeZweiteSprache% %Kommentar_%"
)

zahl=1
loop
{
    ProgressZahl:=100*zahl/Gesamtzahl
    progress,%ProgressZahl%,,%Lade_Vokabeln__von__1%%zahl%%Lade_Vokabeln__von__2%%Gesamtzahl%%Lade_Vokabeln__von__3%
    iniread,vokDa,Vokabellisten\%AktuelleListe%.ini,%zahl%,Vokabel
    if vokDa=ja
    {
        iniread,d1,Vokabellisten\%AktuelleListe%.ini,%zahl%,d1
        iniread,d2,Vokabellisten\%AktuelleListe%.ini,%zahl%,d2
        if d2=error
        d2=
        iniread,d3,Vokabellisten\%AktuelleListe%.ini,%zahl%,d3
        if d3=error
        d3=
        iniread,KommentarDeutsch,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarDeutsch
        if KommentarDeutsch=error
        KommentarDeutsch=
        iniread,e1,Vokabellisten\%AktuelleListe%.ini,%zahl%,e1
        iniread,e2,Vokabellisten\%AktuelleListe%.ini,%zahl%,e2
        if e2=error
        e2=
        iniread,e3,Vokabellisten\%AktuelleListe%.ini,%zahl%,e3
        if e3=Error
        e3=
        iniread,KommentarEnglisch,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarEnglisch
        if KommentarEnglisch=Error
        KommentarEnglisch=
		
		
		
		liste=%liste%`n"%d1%","%d2%","%d3%","%KommentarDeutsch%","%e1%","%e2%","%e3%","%KommentarEnglisch%"
		
        zahl++
    }
    else
    break
}

fileappend,%liste%,%toexportfile%
progress,off
return
