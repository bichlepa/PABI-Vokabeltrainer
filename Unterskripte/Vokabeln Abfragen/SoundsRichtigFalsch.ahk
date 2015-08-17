JetztSoundsSuchen:

;~ 	global
	if ObProgrammPrüfModus=ja
	msgbox,JetztSoundsSuchen:
	soundzahlfalsch=1 ;Sounds für "falsch" suchen
	loop,Sound\Richtig und Falsch\%WelcheSounds%\falsch*
	{
		
		soundfalsch%soundzahlfalsch%=%a_loopfilename%
		soundzahlfalsch++
	}
	soundzahlfalsch--	

	soundzahlrichtig=1 ;Sounds für "richtig" suchen
	loop,Sound\Richtig und Falsch\%WelcheSounds%\richtig*
	{
		
		soundrichtig%soundzahlrichtig%=%a_loopfilename%
		soundzahlrichtig++
	}
	soundzahlrichtig--	
	if ObProgrammPrüfModus=ja
	msgbox,JetztSoundsSuchen-
return

JetztSoundRichtigAbspielen:
gosub,SprechenStoppen ;Falls noch geredet wird

loop,Sound\Englische Aussprachen\%e3%*
soundfile=%a_loopfilename%
loop,Sound\Englische Aussprachen\%e2%*
soundfile=%a_loopfilename%
loop,Sound\Englische Aussprachen\%e1%*
soundfile=%a_loopfilename%
;msgbox,%soundfile%
soundplay,Sound\Englische Aussprachen\%soundfile%
if errorlevel=1
{
	if ObRichtigOderFalschSagen=ja
	{
		random,zufallsound,1,%soundzahlrichtig%
		soundfile:=soundrichtig%zufallsound%
		soundplay,Sound\Richtig und Falsch\%WelcheSounds%\%soundfile%,wait
	}
	
	if ObVokabelnAussprechen=ja
	{
		GuiControlGet, test, Visible,1buttonWeiter ;Verhindern, dass die Lösung ausgesprochen wird, wenn man schnell auf "Weiter" klickt
		;~ msgbox,%test%
		if test=0
			return
		JetztSprechen("e") ;Spricht die Antwort aus
		
	}
	

}
return


JetztSoundFalschAbspielen:
gosub,SprechenStoppen ;Falls noch geredet wird

loop,Sound\Englische Aussprachen\%e3%*
soundfile=%a_loopfilename%
loop,Sound\Englische Aussprachen\%e2%*
soundfile=%a_loopfilename%
loop,Sound\Englische Aussprachen\%e1%*
soundfile=%a_loopfilename%
;msgbox,%soundfile%
soundplay,Sound\Englische Aussprachen\%soundfile%

if errorlevel=1
{
	if ObRichtigOderFalschSagen=ja
	{
		random,zufallsound,1,%soundzahlfalsch% ;ein Sound für falsch abspielen
		soundfile:=soundfalsch%zufallsound%
		soundplay,Sound\Richtig und Falsch\%WelcheSounds%\%soundfile%,wait
	}
	if ObVokabelnAussprechen=ja
	{
		GuiControlGet, test, Visible,1buttonWeiter ;Verhindern, dass die Lösung ausgesprochen wird, wenn man schnell auf "Weiter" klickt
		;~ msgbox,%test%
		if test=0
			return
		JetztSprechen("e") ;Spricht die Antwort aus
	}
	
	
}


return