SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
;msgbox,%a_workingdir%
SetBatchLines,-1
msgbox,4,Vokabeltrainer zum Export vorbereiten,Wirklich zum Export vorbereiten?
IfMsgBox,no
exitapp





SplashTexton,200,60,Zum Export vorbereiten...,Entfernen der Benutzerstatistiken aus den Vokabellisten


loop,%a_workingdir%\*,,1
{

	if a_loopfileext=ini
	{
		
		
		zeile=1
		fehl=0
		loop ;Vokabelliste reparieren
		{
			
			iniread,test,%A_LoopFileFullPath%,%zeile%,Vokabel ;eine Zeile lesen
			if test = ja ;wenn die Zeile eine Vokabel enthält
			{
				iniread,aktuellvokabel1,%A_LoopFileFullPath%,%zeile%,d1,%a_space% ;alles einlesen
				iniread,aktuellvokabel2,%A_LoopFileFullPath%,%zeile%,d2,%a_space%
				iniread,aktuellvokabel3,%A_LoopFileFullPath%,%zeile%,d3,%a_space%
				iniread,evokabel1,%A_LoopFileFullPath%,%zeile%,e1,%a_space%
				iniread,evokabel2,%A_LoopFileFullPath%,%zeile%,e2,%a_space%
				iniread,evokabel3,%A_LoopFileFullPath%,%zeile%,e3,%a_space%
				iniread,KommentarEnglisch,%A_LoopFileFullPath%,%zeile%,KommentarEnglisch,%a_space%
				iniRead,KommentarDeutsch,%A_LoopFileFullPath%,%zeile%,KommentarDeutsch,%a_space%
				inidelete,%A_LoopFileFullPath%,%zeile% ;Vokabel löschen
				iniwrite,ja,%A_LoopFileFullPath%,%zeile%,Vokabel ;Vokabel speichern
				if aktuellvokabel1<>
				iniwrite,%aktuellvokabel1%,%A_LoopFileFullPath%,%zeile%,d1
				if aktuellvokabel2<>
				iniwrite,%aktuellvokabel2%,%A_LoopFileFullPath%,%zeile%,d2
				if aktuellvokabel3<>
				iniwrite,%aktuellvokabel3%,%A_LoopFileFullPath%,%zeile%,d3
				if evokabel1<>
				iniwrite,%evokabel1%,%A_LoopFileFullPath%,%zeile%,e1
				if evokabel2<>
				iniwrite,%evokabel2%,%A_LoopFileFullPath%,%zeile%,e2
				if evokabel3<>
				iniwrite,%evokabel3%,%A_LoopFileFullPath%,%zeile%,e3
				if KommentarEnglisch<>
				iniwrite,%KommentarEnglisch%,%A_LoopFileFullPath%,%zeile%,KommentarEnglisch
				if KommentarDeutsch<>
				iniwrite,%KommentarDeutsch%,%A_LoopFileFullPath%,%zeile%,KommentarDeutsch
				iniwrite,1,%A_LoopFileFullPath%,%zeile%,Kasten
				zeile++ ;Zur nächsten Zeile springen
			}
			Else
			break
		}
	}
}



