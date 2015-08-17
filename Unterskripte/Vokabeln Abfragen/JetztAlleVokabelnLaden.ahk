
JetztAlleVokabelnLaden:
{
;~ 	global 
	if ObProgrammPrüfModus=ja
	msgbox,JetztAlleVokabelnLaden:
	
;~ 	local zeile,fehl
	
	zeile=1 
	AnzahlVokabeln=0
	fehl=0
	fach1=0
	fach2=0
	fach3=0
	fach4=0
	fach5=0
	
	
	
	loop ;rausfinden,wieviele Vokabeln da sind
	{

	iniread,Vokabel%zeile%existiert,Vokabellisten\%AktuelleListe%.ini,%zeile%,Vokabel ;eine Zeile lesen
	;msgbox,test: %test%
	if Vokabel%zeile%existiert = ja ;wenn die Zeile eine Vokabel enthält
	{
		AnzahlVokabeln++ ;Anzahl vorhandener erhöhen
		
		
		iniread,Vokabel%zeile%ZuletztAbgefragt,Vokabellisten\%AktuelleListe%.ini,%zeile%,Zuletzt abgefragt,%a_space%
		iniread,Vokabel%zeile%Fach,Vokabellisten\%AktuelleListe%.ini,%zeile%,Kasten
		
		
		;d1:=Vokabel%zeile%deutsch1
		;msgbox,%d1%
		
		fach:=Vokabel%zeile%Fach
		;msgbox,fach: %fach%
		envadd,fach%fach%,1
		guicontrol,,1TextGesamtzahlVokabeln,Gesamtzahl Vokabeln: %AnzahlVokabeln%
		guicontrol,,1Radiofachwahlnr1,1. Fach: %fach1% Wörter
		guicontrol,,1Radiofachwahlnr2,2. Fach: %fach2% Wörter
		guicontrol,,1Radiofachwahlnr3,3. Fach: %fach3% Wörter
		guicontrol,,1Radiofachwahlnr4,4. Fach: %fach4% Wörter
		guicontrol,,1Radiofachwahlnr5,5. Fach: %fach5% Wörter
		zeile++ ;Zur nächsten Zeile springen
	}
	Else
		break
	}
	
	iniwrite,%AnzahlVokabeln%,Vokabellisten\%AktuelleListe%.ini,info,Anzahl ;speichern, wieviele Vokabeln in der Liste sind

	if ObProgrammPrüfModus=ja
	msgbox,JetztAlleVokabelnLaden-
	return
}

