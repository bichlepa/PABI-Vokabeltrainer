


if 1=VokabelnAbfragen
NächstesFenster=VokabelnAbfragen

#Include %A_ScriptDir%


;Unwichtige Einstellungen>>>
setbatchlines,-1
FileEncoding,UTF-8

;<<<Unwichtige Einstellungen
if 1=Programmprüfmodus
	ObProgrammPrüfModus=1



;Alles includen>>>
goto,IncludeÜberspringen ;Damit das Includen nicht alle Skripte ausführt

#Include Unterskripte\TTS\tts.ahk                    ; Für das Sagen
#Include Unterskripte\TTS\tts by learning one.ahk                    ; Für das Sagen



#include Unterskripte\Vokabeln Abfragen.ahk 	;Hauptfenster
#include Unterskripte\Hauptmenue.ahk  		;Fenster Nr.3
#include Unterskripte\Vokabeln hinzufuegen.ahk  		
#include Unterskripte\Einstellungen.ahk  		
#include Unterskripte\Liste Anschauen.ahk  	;Fenster Nr.6
#include Unterskripte\Vokabel Bearbeiten.ahk	;Fenster Nr.7	
#include Unterskripte\Vokabelliste reparieren.ahk
#include Unterskripte\Vokabellisten zusammenfuehren.ahk
#include Unterskripte\Nach doppelten Vokabeln suchen.ahk ;Fenster Nr.8
#include Unterskripte\Sprache.ahk
#include Unterskripte\ToolTips.ahk
#include Unterskripte\Vokabeln importieren.ahk
#include Unterskripte\Vokabeln exportieren.ahk

#include Unterskripte\VariablenLoeschen.ahk

#include Unterskripte\Vokabeln Abfragen\JetztAlleVokabelnLaden.ahk
#include Unterskripte\Vokabeln Abfragen\JetztIniAuslesen.ahk
#include Unterskripte\Vokabeln Abfragen\SoundsRichtigFalsch.ahk
#include Unterskripte\Vokabeln Abfragen\Fenster.ahk
#include Unterskripte\Vokabeln Abfragen\SchonGemerkt.ahk
#include Unterskripte\Vokabeln Abfragen\JetztGuckenObAktuelleVokabelPasst.ahk
#include Unterskripte\Vokabeln Abfragen\JetztAktuelleVokabelAuslesen.ahk
#include Unterskripte\Vokabeln Abfragen\AlleVokabelnPruefenObSiePassen.ahk
#include Unterskripte\Vokabeln Abfragen\JetztVokabelAlsNichtVorhandenDeklarieren.ahk
#include Unterskripte\Vokabeln Abfragen\ZufaelligeVokabelAussuchen.ahk
#include Unterskripte\Vokabeln Abfragen\Statistik.ahk
#include Unterskripte\Vokabeln Abfragen\Auswerten.ahk
#include Unterskripte\Vokabeln Abfragen\JetztMoeglichstLangeSuchen.ahk

#include Unterskripte\Vokabeln Eingeben\Vokabeln temporaer speichern.ahk
;<<<Alles includen




IncludeÜberspringen: ;Damit das Includen nicht alle Skripte ausführt
;~ gosub,TTSInitialisieren
gosub,SprachdateiAuslesen
OnMessage(0x200, "WM_MOUSEMOVE") ;Funktion zum Anzeigen von ToolTips

if not NächstesFenster  ;Wenn ich nicht einen anderen Skript testen will
	NächstesFenster=Hauptmenü ;Beim ersten Start wird Hauptmenü geöffnet

NächstesFensterÖffnen:
gosub,VariablenLöschen

if NächstesFenster=Hauptmenü
goto,Hauptmenü
else if NächstesFenster=VokabelnAbfragen
goto,VokabelnAbfragen
if NächstesFenster=VokabelnHinzufügen
goto,VokabelnHinzufügen
if NächstesFenster=VokabelBearbeiten
goto,VokabelBearbeiten
if NächstesFenster=Einstellungen
goto,Einstellungen
if NächstesFenster=ListeAnschauen
goto,ListeAnschauen
if NächstesFenster=VokabellistenZusammenführen
goto,VokabellistenZusammenführen
if NächstesFenster=NachDoppeltenVokabelnSuchen
goto,NachDoppeltenVokabelnSuchen
if NächstesFenster=VokabelnImportieren
goto,VokabelnImportieren

;oben sollten alle möglichen Fenster aufgelistet sein.
Msgbox,Fehler. Ich weiß nicht, welches Fenster ich öffnen soll.
exitapp
return









LizenzbedingungenÜber: ;Damit Lizenzbedingungen nachträglich implementiert werden
return




1ButtonNeustart:
;~ Break::
reload
return

guiclose:
MsgBox, 36, %PABI_Vokabeltrainer%, %Möchten_Sie_Pabi_Wirklich_Beenden%
IfMsgBox,yes
exitapp
else
return