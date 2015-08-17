AlleVokabelnPrüfenObSiePassen:

;~ 	global
	if ObProgrammPrüfModus=ja
	msgbox,AlleVokabelnPrüfenObSiePassen:
	
	WelcheAktuelleVokabel=1
	zahlverfügbar=0


	loop,%anzahlVokabeln%
	{
		zahlverfügbar++
		gosub,JetztGuckenObAktuelleVokabelPasst
	;~ 	msgbox,%ObAktuelleVokabelPasst%
		if ObAktuelleVokabelPasst=ja
		{
		VerfügbareVokabel%zahlverfügbar%:=WelcheAktuelleVokabel
		}
		else
		zahlverfügbar--
;~ 		msgbox,ObAktuelleVokabelPasst: %ObAktuelleVokabelPasst%
		VerfügbareVokabelnr:=VerfügbareVokabel%zahlverfügbar%
		;msgbox,VokabelPasstNicht: %VokabelPasstNicht%`n%WelcheAktuelleVokabel%`n%zahlverfügbar%`nVerfügbareVokabelnr: %VerfügbareVokabelnr%
		WelcheAktuelleVokabel++
	}
;~ 	msgbox,zahlverfügbar: %zahlverfügbar%
;~ 	return,zahlverfügbar
	if ObProgrammPrüfModus=ja
	msgbox,AlleVokabelnPrüfenObSiePassen-
	return
return

