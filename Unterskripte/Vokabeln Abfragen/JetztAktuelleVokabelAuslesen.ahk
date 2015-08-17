
JetztAktuelleVokabelAuslesen:
	if ObProgrammPrüfModus=ja
	msgbox,JetztAktuelleVokabelAuslesen:
	if WelcheAbfrageRichtung=EnachD
{
	iniread,d1,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e1,%a_space% ;Vokabel Einlesen
	iniread,d2,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e2,%a_space%
	iniread,d3,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e3,%a_space%
	iniread,e1,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d1,%a_space%
	iniread,e2,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d2,%a_space%
	iniread,e3,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d3,%a_space%
	iniread,dk,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,KommentarEnglisch,%a_space%
	iniread,ek,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,KommentarDeutsch,%a_space%

}
else
{
	iniread,d1,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d1,%a_space% ;Vokabel Einlesen
	iniread,d2,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d2,%a_space%
	iniread,d3,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,d3,%a_space%
	iniread,e1,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e1,%a_space%
	iniread,e2,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e2,%a_space%
	iniread,e3,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,e3,%a_space%
	iniread,dk,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,KommentarDeutsch,%a_space%
	iniread,ek,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,KommentarEnglisch,%a_space%
}
;~ msgbox,%dk%
iniread,WieOftVokabelAngeschaut,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl angeschaut,%a_space%
iniread,WieOftVokabelRichtigBeantwortet,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl richtig,%a_space%
iniread,WieOftVokabelFalschBeantwortet,Vokabellisten\%AktuelleListe%.ini,%WelcheAktuelleVokabel%,Anzahl falsch,%a_space%

stringreplace,dk,dk,$nächsteZeile$,`n
stringreplace,ek,ek,$nächsteZeile$,`n

	;aktuellFach:=Vokabel%WelcheAktuelleVokabel%Fach
	aktuellZuletztAbgefragt:=Vokabel%WelcheAktuelleVokabel%ZuletztAbgefragt
	if WelcheAktuelleVokabel=Nr. ;bugsuche
	msgbox,Bug in JetztAktuelleVokabelAuslesen!
	iniwrite,%WelcheAktuelleVokabel%,Einstellungen.ini,Allgemein,Aktuelle Vokabel

;~ if ObVokabelnAussprechen=ja ; Vokabeln zur Aussprache vorbereiten
if WelcheAbfrageRichtung=EnachD
{
	dsprechen1:=a_space e1 a_space
	dsprechen2:=a_space e2 a_space
	dsprechen3:=a_space e3 a_space
	dsprechenk:=a_space ek a_space
	stringreplace,dsprechen1,dsprechen1,(,,a
	stringreplace,dsprechen2,dsprechen2,(,,a
	stringreplace,dsprechen3,dsprechen3,(,,a
	stringreplace,dsprechen1,dsprechen1,),,a
	stringreplace,dsprechen2,dsprechen2,),,a
	stringreplace,dsprechen3,dsprechen3,),,a
	stringreplace,dsprechen1,dsprechen1,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	esprechen1:=a_space d1 a_space
	esprechen2:=a_space d2 a_space
	esprechen3:=a_space d3 a_space
	esprechenk:=a_space dk a_space
	StringCaseSense, On
	stringreplace,esprechen1,esprechen1,(BE),,a
	stringreplace,esprechen2,esprechen2,(BE),,a
	stringreplace,esprechen3,esprechen3,(BE),,a
	stringreplace,esprechen1,esprechen1,(AE),,a
	stringreplace,esprechen2,esprechen2,(AE),,a
	stringreplace,esprechen3,esprechen3,(AE),,a
	StringCaseSense, off
	stringreplace,esprechen1,esprechen1,(,,a
	stringreplace,esprechen2,esprechen2,(,,a
	stringreplace,esprechen3,esprechen3,(,,a
	stringreplace,esprechen1,esprechen1,),,a
	stringreplace,esprechen2,esprechen2,),,a
	stringreplace,esprechen3,esprechen3,),,a
	stringreplace,esprechen1,esprechen1,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen1,esprechen1,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a	
	stringreplace,esprechen1,esprechen1,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
}
Else
{
	dsprechen1:=a_space d1 a_space
	dsprechen2:=a_space d2 a_space
	dsprechen3:=a_space d3 a_space
	dsprechenk:=a_space dk a_space
	stringreplace,dsprechen1,dsprechen1,(,,a
	stringreplace,dsprechen2,dsprechen2,(,,a
	stringreplace,dsprechen3,dsprechen3,(,,a
	stringreplace,dsprechen1,dsprechen1,),,a
	stringreplace,dsprechen2,dsprechen2,),,a
	stringreplace,dsprechen3,dsprechen3,),,a
	stringreplace,dsprechen1,dsprechen1,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%etw.%a_space%,%a_space%etwas%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jn.%a_space%,%a_space%jemanden%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jm.%a_space%,%a_space%jemandem%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jd.%a_space%,%a_space%jemand%a_space%,a
	stringreplace,dsprechen1,dsprechen1,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	stringreplace,dsprechen2,dsprechen2,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	stringreplace,dsprechen3,dsprechen3,%a_space%jns.%a_space%,%a_space%jemandens%a_space%,a
	esprechen1:=a_space e1 a_space
	esprechen2:=a_space e2 a_space
	esprechen3:=a_space e3 a_space
	esprechenk:=a_space ek a_space
	StringCaseSense, On
	stringreplace,esprechen1,esprechen1,(BE),,a
	stringreplace,esprechen2,esprechen2,(BE),,a
	stringreplace,esprechen3,esprechen3,(BE),,a
	stringreplace,esprechen1,esprechen1,(AE),,a
	stringreplace,esprechen2,esprechen2,(AE),,a
	stringreplace,esprechen3,esprechen3,(AE),,a
	StringCaseSense, off
	stringreplace,esprechen1,esprechen1,(,,a
	stringreplace,esprechen2,esprechen2,(,,a
	stringreplace,esprechen3,esprechen3,(,,a
	stringreplace,esprechen1,esprechen1,),,a
	stringreplace,esprechen2,esprechen2,),,a
	stringreplace,esprechen3,esprechen3,),,a
	stringreplace,esprechen1,esprechen1,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sth.%a_space%,%a_space%something%a_space%,a
	stringreplace,esprechen1,esprechen1,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sb.%a_space%,%a_space%somebody%a_space%,a	
	stringreplace,esprechen1,esprechen1,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
	stringreplace,esprechen2,esprechen2,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
	stringreplace,esprechen3,esprechen3,%a_space%sb's.%a_space%,%a_space%somebodies%a_space%,a
}
	
	
	if ObProgrammPrüfModus=ja
	msgbox,JetztAktuelleVokabelAuslesen-
	return

