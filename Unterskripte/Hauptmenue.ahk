Hauptmenü:
{

	
	;;; Informationen über verfügbaren Vokballisten sammeln
	liste=|
	loop,%a_workindir%Vokabellisten\*
	{
		liste=%liste%%A_LoopFileName%|
	}
	stringreplace,liste,liste,.ini,,all
	iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste,Beispiel-Englisch
	stringreplace,liste,liste,|%AktuelleListe%|,|%AktuelleListe%||
	stringtrimleft,liste,liste,1
	;msgbox,%liste%
	

	
	;;;Fenster Aufbauen
	Gui, 3:Add, Text, x12 y10 w200 h20 , %Welche_Vokabelliste_möchtest_du_laden%
	Gui, 3:Add, DropDownList, x12 y30 w230  sort g3DropDownVokList v3AktuelleListe,%liste%
	Gui, 3:Add, Text, x12 y60 w200 h20 vTextAnzahlVokabeln, %Anzahl_Vokabeln%  ;Wird später editiert
	Gui, 3:Add, Button, g3buttonOK x12 y180 w230 h40 +default, %OK_%
	Gui, 3:Add, Button, g3buttonNeueListe x12 y80 w110 h20 , %Neue_Liste_erstellen%
	Gui, 3:Add, Button, g3buttonUmbenennen x12 y110 w110 h20 , %Liste_Umbenennen%
	Gui, 3:Add, Button, g3buttonListeLöschen x132 y80 w110 h20 , %Liste_löschen%
	Gui, 3:Add, Button, g3buttonZusammenführen x12 y140 w110 h30 , %Aus_zwei_Listen_eine_machen%
	Gui, 3:Add, Button, g3buttonDoppelteVokabelnSuchen x132 y140 w110 h30 , %Nach_doppelten_Vokabeln_suchen%
	Gui, 3:Add, Button, g3buttonVokabelnHinzufügen x132 y110 w110 h20 , %Vokabeln_hinzufügen%
	
	
		
	;;;Anzanl Vokabeln anzeigen
	AnzahlVokabeln:=3AnzahlDerVorhandenenVokabelnInDerListeErmitteln(AktuelleListe)
	guicontrol,3:,TextAnzahlVokabeln,%Anzahl_Vokabeln% %AnzahlVokabeln%
;~ 	msgbox,% AnzahlVokabeln
	gui, 3:show,,%Titel_Hauptmenü%
	
	return
}

;Funktion: ermittelt die Anzahl der Vokabeln in einer Liste
3AnzahlDerVorhandenenVokabelnInDerListeErmitteln(Vokabelliste)
{
	global unbekannt_
	gui,3:submit,nohide
	iniread,Anzahl,Vokabellisten\%Vokabelliste%.ini,info,Anzahl,%unbekannt_%
;~ 	msgbox,% Anzahl a_space voklist
	return,Anzahl
}




3DropDownVokList: ;Wenn eine neue Liste ausgewählt wird, den TextAnzahlVokabeln aktualisieren
gui,3:submit,nohide
AnzahlVokabeln:=3AnzahlDerVorhandenenVokabelnInDerListeErmitteln(3AktuelleListe)
guicontrol,3:,TextAnzahlVokabeln,%Anzahl_Vokabeln%: %AnzahlVokabeln%
return


3buttonOK:
gui,3:submit,nohide
AktuelleListe:=3AktuelleListe
iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
;~ iniwrite,%FachNummer%,Einstellungen.ini,Allgemein,Fach
gosub,TTSInitialisieren

NächstesFenster=VokabelnAbfragen
goto,NächstesFensterÖffnen


3buttonNeueListe:
gui,3:submit
aktuelleListe=

WelchesLetztesFensterVorEinstellungen=Hauptmenü
NächstesFenster=Einstellungen
goto,NächstesFensterÖffnen
return


3buttonUmbenennen:
gui,3:submit
inputbox,neuname,%Umbenennen_%,%Wie_soll_die_Liste_heißen%,,217,120,,,,,%3AktuelleListe%
if errorlevel=1
goto,NächstesFensterÖffnen
;~ if neuname=error
;~ {
	;~ msgbox,Leider darf aus technischen Gründen die Liste nicht "error" heißen.	
	;~ goto,3buttonUmbenennen ;Neuer Versuch
;~ }
if neuname=
{
	msgbox,%Gib_zuerst_einen_Namen_ein%
	goto,3buttonUmbenennen ;Neuer Versuch
}
filemove,Vokabellisten\%3AktuelleListe%.ini,Vokabellisten\%neuname%.ini ;Datei umbenennen
AktuelleListe:=neuname
iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
goto,NächstesFensterÖffnen
return


3buttonListeLöschen:
gui,3:submit,nohide
msgbox,4,%Sind_Sie_sicher%,%Willst_du_wirklich_die_Liste_löschen1%%3AktuelleListe%%Willst_du_wirklich_die_Liste_löschen2%
IfMsgBox,yes
{
	filedelete,Vokabellisten\%3AktuelleListe%.ini
	goto,NächstesFensterÖffnen
}
return


3buttonZusammenführen:
NächstesFenster=VokabellistenZusammenführen
goto,NächstesFensterÖffnen
return


3buttonDoppelteVokabelnSuchen:
gui,3:submit
AktuelleListe:=3AktuelleListe
iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
gosub,TTSInitialisieren
NächstesFenster=NachDoppeltenVokabelnSuchen
goto,NächstesFensterÖffnen
return


3buttonVokabelnHinzufügen:
gui,3:submit
AktuelleListe:=3AktuelleListe
iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
gosub,TTSInitialisieren
WelchesLetztesFensterVorVokabelnHinzufügen=Hauptmenü
NächstesFenster=VokabelnHinzufügen
goto,NächstesFensterÖffnen


3GuiClose:
MsgBox, 36, %PABI_Vokabeltrainer%, %Möchten_Sie_Pabi_Wirklich_Beenden%
IfMsgBox,yes
exitapp
else
return

