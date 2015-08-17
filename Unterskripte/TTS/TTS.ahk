TTSInitialisieren:
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste,%a_space%
if AktuelleListe=
	AktuelleListe=Beispiel-Englisch
;~ msgbox,%aktuelleliste%
gosub,SprechenStoppen ;Falls noch geredet wird
iniread,DeutscheStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme1,%a_space%
iniread,EnglischeStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme2,%a_space%

if (DeutscheStimme="" and EnglischeStimme="")
	gosub,StandardstimmeBeimErstenStartSuchen
iniwrite,%DeutscheStimme%,Einstellungen.ini,Stimme,Deutsche Stimme
iniwrite,%EnglischeStimme%,Einstellungen.ini,Stimme,Englische Stimme

iniread,DeutscheStimmeLautstärke,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Lautstärke,100
iniread,EnglischeStimmeLautstärke,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Lautstärke,100
iniread,DeutscheStimmeGeschwindigkeit,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Geschwindigkeit,0
iniread,EnglischeStimmeGeschwindigkeit,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Geschwindigkeit,0
iniread,DeutscheStimmeTonhöhe,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Tonhöhe,0
iniread,EnglischeStimmeTonhöhe,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Tonhöhe,0





;~ msgbox,%deutscheStimme%
if DeutscheStimme<>
{
	DeVoiceName=%DeutscheStimme%
	DeVoiceRate=%DeutscheStimmeGeschwindigkeit%
	DeVoiceVolume=%DeutscheStimmeLautstärke%
	DeVoicePitch=%DeutscheStimmeTonhöhe%
	DeVoice := TTS_CreateVoice(DeVoiceName, DeVoiceRate, DeVoiceVolume, DeVoicePitch)
}

if EnglischeStimme<>
{
	EnVoiceName=%EnglischeStimme%
	EnVoiceRate=%EnglischeStimmeGeschwindigkeit%
	EnVoiceVolume=%EnglischeStimmeLautstärke%
	EnVoicePitch=%EnglischeStimmeTonhöhe%
	EnVoice := TTS_CreateVoice(EnVoiceName, EnVoiceRate, EnVoiceVolume, EnVoicePitch)
}


return


JetztSprechen(Was)
{
	
	
	global dsprechen1,dsprechen2,dsprechen3,dsprechenk,esprechen1,esprechen2,esprechen3,esprechenk,WelcheAbfrageRichtung,DeVoice,EnVoice,sprecheGeradeNummer
	
	gosub,SprechenStoppen ;Falls noch geredet wird
	
	if WelcheAbfrageRichtung=DnachE
	{

		if Was=d1
		TTS(DeVoice, "Speak", dsprechen1)
		else if was=d2
		TTS(DeVoice, "Speak", dsprechen2)
		else if was=d3
		TTS(DeVoice, "Speak", dsprechen3)
		else if was=dk
		TTS(DeVoice, "Speak", dsprechenk)
		else if was=e1
		TTS(EnVoice, "Speak", esprechen1)
		else if was=e2
		TTS(EnVoice, "Speak", esprechen2)
		else if was=e3
		TTS(EnVoice, "Speak", esprechen3)
		else if was=ek
		TTS(EnVoice, "Speak", esprechenk)
		
		if was=d
		{
			sprecheGeradeNummer=0
			settimer AlleDeDeSprechen,100
			
			
		}
		if was=e
		{
			sprecheGeradeNummer=0
			settimer AlleEnEnSprechen,100
			
			
			
		}
	}
	Else
	{
		if Was=e1
		TTS(DeVoice, "Speak", dsprechen1)
		else if was=e2
		TTS(DeVoice, "Speak", dsprechen2)
		else if was=e3
		TTS(DeVoice, "Speak", dsprechen3)
		else if was=ek
		TTS(DeVoice, "Speak", dsprechenk)
		else if was=d1
		TTS(EnVoice, "Speak", esprechen1)
		else if was=d2
		TTS(EnVoice, "Speak", esprechen2)
		else if was=d3
		TTS(EnVoice, "Speak", esprechen3)
		else if was=dk
		TTS(EnVoice, "Speak", esprechenk)
		
		if was=e
		{
			sprecheGeradeNummer=0
			settimer AlleDeDeSprechen,100
			
			
			
		}
		if was=d
		{
			sprecheGeradeNummer=0
			settimer AlleEnEnSprechen,100
			
			
			
		}
	}
	
}



AlleDeDeSprechen:
;~ msgbox %sprecheGeradeNummer% %ObTTSFertig%
ObTTSFertig:=TTS(DeVoice,"GetStatus")
if (ObTTSFertig="finished" or ObTTSFertig="")
{

	sprecheGeradeNummer++
	if sprecheGeradeNummer=4
		settimer AlleDeDeSprechen,off
	if sprecheGeradeNummer=1
		TTS(DeVoice, "Speak", dsprechen1)
	if sprecheGeradeNummer=2
		TTS(DeVoice, "Speak", dsprechen2)
	if sprecheGeradeNummer=3
		TTS(DeVoice, "Speak", dsprechen3)
	

}

return


AlleEnEnSprechen:
ObTTSFertig:=TTS(EnVoice,"GetStatus")
if (ObTTSFertig="finished" or ObTTSFertig="")
{

	sprecheGeradeNummer++
	if sprecheGeradeNummer=4
		settimer AlleEnEnSprechen,off
	if sprecheGeradeNummer=1
		TTS(EnVoice, "Speak", esprechen1)
	if sprecheGeradeNummer=2
		TTS(EnVoice, "Speak", esprechen2)
	if sprecheGeradeNummer=3
		TTS(EnVoice, "Speak", esprechen3)
	

}
return

SprechenStoppen:
settimer AlleDeDeSprechen,off
settimer AlleEnEnSprechen,off
TTS(DeVoice, "Stop")
TTS(EnVoice, "Stop")
return






StandardstimmeBeimErstenStartSuchen:

TTSList=|%a_space%|
loop,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Speech\Voices\Tokens,1,1 ;Liest die Registry aus um die verfügbaren Stimmen herauszufinden
{
	RegRead, Reginhalt
;~ 	fileappend,subkey:%A_LoopRegSubKey%`nregname:%A_LoopRegName%`nregread:%Reginhalt%`n`n,text.txt ;Alle Registry-Einträge dokumentieren. zum Debuggen
	stringgetpos,a,A_LoopRegName,\,l6
	if errorlevel=1
	if A_LoopRegName=Name
	if Reginhalt<>
    {
        if (DeutscheStimme="" or EnglischeStimme="") ;Wenn man noch keine Stimme gewählt hat, wird automatisch die erste Stimme gewählt
        {
            RegRead, SprachNummer, %A_LoopRegKey%, %A_LoopRegSubKey%,Language  ;Die Sprache herausfinden
            ;~ msgbox,%A_LoopRegSubKey%`n%A_LoopRegName%`nSprachnummer: %SprachNummer%
            IfInString, SprachNummer,407
            if DeutscheStimme=
            DeutscheStimme=%Reginhalt%
            IfInString, SprachNummer,409
            if EnglischeStimme=
            EnglischeStimme=%Reginhalt%
            IfInString, SprachNummer,809
            if EnglischeStimme=
            EnglischeStimme=%Reginhalt%
;~             msgbox,%Reginhalt%
        }
        TTSList=%TTSList%%Reginhalt%|
    }
}


return