Einstellungen:

;---GUI Aufbauen
Gui, Add, Tab2, vtab x6 y10 w450 h320 , %Allgemein_%|%Aussehen_%|%Aktuelle_Liste%|%TTS_%

gui,add,button, g5buttonOk x10 y340 w60 h30 default ,%OK_%
gui,add,button,g5ButtonÜbernehmen x80 y340 w80 h30 ,%Übernehmen_%
gui,add,button,g5ButtonAbbrechen x170 y340 w70 h30 ,%Abbrechen_%

Gui, Add, GroupBox, x16 y40 w420 h50 , %Sprache_%
gui, add, dropdownlist,vDropDownSprache x26 y60 w180


Gui, Add, GroupBox, x16 y90 w420 h100 , %Abfrage_%
Gui, Add, CheckBox, vcheckObImmerKurzSchlafen x26 y110 , %Die_Tasten_Auswerten_und_Weiter_erst_nach_200ms_Verzögerung_zeigen%
checkObImmerKurzSchlafen_tt=%Die_Tasten_Auswerten_und_Weiter_erst_nach_200ms_Verzögerung_zeigen_Kommentar%
Gui, add, radio,vRadioAbfrageRichtungDnachE x26 y130 w200, %Von___nach___fragen1%%Von___nach___fragen2%%Von___nach___fragen3%
Gui, add, radio,vRadioAbfrageRichtungEnachD x26 y145 w200, %Von___nach___fragen1%%Von___nach___fragen2%%Von___nach___fragen3%
gui, add, CheckBox, vcheckObMausAusDemWegRäumen x26 y165, %Die_Maus_während_der_Abfrage_aus_dem_Weg_räumen%

Gui, Add, GroupBox, x16 y200 w420 h40 , %Update_Check%
Gui, Add, CheckBox, vcheckObAufUpdatesChecken  x26 y220 h20  , %Bei_jedem_Start_auf_Updates_Checken%
checkObAufUpdatesChecken_tt=%Bei_jedem_Start_auf_Updates_Checken_Kommentar%

gui,tab,4
gui,add,button,g5buttonOk x10 y340 w60 h30 ,%OK_%
gui,add,button,g5ButtonÜbernehmen x80 y340 w80 h30 ,%Übernehmen_%
gui,add,button,g5ButtonAbbrechen x170 y340 w70 h30 ,%Abbrechen_%
;~ Gui, Add, GroupBox, x16 y40 w420 h60  , Tastenkürzel
;~ gui, add, checkbox, vcheckSpanischN x26 y60, ñ  mit 'strg + n' schreiben
;~ gui, add, checkbox, vcheckFranzösischC x26 y80, ç mit 'strg + c' schreiben
Gui, Add, GroupBox, x16 y40 w420 h270  , %Aussprache_%
gui, add,checkbox, vradioObVokabelnAussprechen x26 y60 , %Vokabeln_mit_einer_Computerstimme_aussprechen%
radioObVokabelnAussprechen_TT = %Vokabeln_mit_einer_Computerstimme_aussprechen_Kommentar%
gui, add, text,x26 y83 vTextComputerstimmeFürDeutsch w300, %Computerstimme_für__1%%Computerstimme_für__2%
gui, add, dropdownlist,vDropDownDeutschTTS x220 y80 w180
gui, add, text, x66 y105 ,%Lautstärke_%
gui, add, text, x186 y105, %Geschwindigkeit_%
gui, add, text, x306 y105, %Tonhöhe_%
gui, add, slider, vSliderDeutschTTSLautstärke x46 y125 w120 ToolTip, 
gui, add, slider, vSliderDeutschTTSGeschwindigkeit x166 y125 w120 Range-10-10 TickInterval1 ToolTip, 
gui, add, slider, vSliderDeutschTTSTonhöhe x286 y125 w120 Range-10-10 TickInterval1 ToolTip, 


gui, add, text,x26 y173 vTextComputerstimmeFürEnglisch w300, %Computerstimme_für__1%%Computerstimme_für__2%
gui, add, dropdownlist,vDropDownEnglischTTS x220 y170 w180
gui, add, text, x66 y195 ,%Lautstärke_%
gui, add, text, x186 y195, %Geschwindigkeit_%
gui, add, text, x306 y195, %Tonhöhe_%
gui, add, slider, vSliderEnglischTTSLautstärke x46 y215 w120 ToolTip, 
gui, add, slider, vSliderEnglischTTSGeschwindigkeit x166 y215 w120 Range-10-10 TickInterval1 ToolTip, 
gui, add, slider, vSliderEnglischTTSTonhöhe x286 y215 w120 Range-10-10 TickInterval1 ToolTip, 

gui, add, checkbox, vradioObRichtigUndFalschSagen x26 y260 ,%Sound_Richtig_Falsch%
radioObRichtigUndFalschSagen_TT = %Man_kann_auch_eigene_Sounds_speichern%
gui, add, text,x46 y283 ,%Sound_für_richtig_und_falsch_aussuchen%
gui, add, dropdownlist,vDropDownSoundList x240 y280 w180

gui,tab,2
gui,add,button,g5buttonOk x10 y340 w60 h30 ,%OK_%
gui,add,button,g5ButtonÜbernehmen x80 y340 w80 h30 ,%Übernehmen_%
gui,add,button,g5ButtonAbbrechen x170 y340 w70 h30 ,%Abbrechen_%
Gui, Add, GroupBox, x16 y40 w420 h110  , %Farbschemas_%
gui, add, radio, vRadioHintergrundStandard x26 y60, %Standard_%
gui, add, radio, vRadioHintergrundBlau x26 y75, %Blau_%
gui, add, radio, vRadioHintergrundGrün x26 y90, %Grün_%
Gui, Add, GroupBox, x16 y170 w420 h50  , %Buttons_%
gui, add, checkbox, vObZusätzlicheButtonsZumAuswertenAnzeigen x26 y190, %Zusätzliche_Möglichkeiten_zur_Auswertung_anzeigen%

gui,tab,3
gui,add,button,g5buttonOk x10 y340 w60 h30 ,%OK_%
gui,add,button,g5ButtonÜbernehmen x80 y340 w80 h30 ,%Übernehmen_%
gui,add,button,g5ButtonAbbrechen x170 y340 w70 h30 ,%Abbrechen_%
Gui, Add, GroupBox, x16 y40 w420 h120  , %Aktuelle_Liste%
gui,add,text,x26 y60 w150,%Name_der_Vokabelliste%
gui,add,edit,X+5 yp w150 vEditAktuelleListeName,%aktuelleListe%
gui,add,text,x26 Y+15 w150, %Erste_Sprache%
gui,add,edit,X+5 yp w150 vEditErsteSprache,%aktuelleListeErsteSprache%
gui,add,text,x26 Y+10 w150 , %Zweite_Sprache%
gui,add,edit,X+5 yp w150 vEditZweiteSprache,%aktuelleListeZweiteSprache%

Gui, Add, GroupBox, x16 y180 w420 h60  , %_Erweitert_%
gui,add,text,x26 y200 w150,%_Wörter_bei_Auswertung_ignorieren_%
gui,add,edit,X+5 yp w150 vEditZuIgnorierendeWörter
EditZuIgnorierendeWörter_TT=%_Wörter_bei_Auswertung_ignorieren_Erklärung_%

Gui, Add, GroupBox, x16 y260 w420 h60  , %Export_Und_Import%
gui,add,button,x26 y280 w150 gButtonSetVokabelnImportieren vImportierenWörter,%Vokabeln_importieren%
gui,add,button,X+10 y280 w150 gButtonSetVokabelnExportieren vExportierenWörter,%Vokabeln_exportieren%

;---Einstellungen lesen

iniread,ObVokabelnAussprechen,Einstellungen.ini,Einstellungen,Vokabeln aussprechen,ja
if ObVokabelnAussprechen=ja
    guicontrol,,radioObVokabelnAussprechen,1

iniread,ObRichtigOderFalschSagen,Einstellungen.ini,Einstellungen,Sagen ob richtig oder falsch,ja
if ObRichtigOderFalschSagen=ja
    guicontrol,,radioObRichtigUndFalschSagen,1

iniread,ObImmerKurzSchlafen,Einstellungen.ini,Einstellungen,Immer kurz warten
if ObImmerKurzSchlafen=ja
    guicontrol,,checkObImmerKurzSchlafen,1

iniread,checkObAufUpdatesChecken,Einstellungen.ini,Einstellungen,Auf Updates prüfen,1
guicontrol,,checkObAufUpdatesChecken,1

iniread,WelcheAbfrageRichtung,Einstellungen.ini,Einstellungen,Abfragerichtung
if WelcheAbfrageRichtung=EnachD
    guicontrol,,RadioAbfrageRichtungEnachD,1
else,
    guicontrol,,RadioAbfrageRichtungDnachE,1

iniread,ObMausAusDemWegRäumen,Einstellungen.ini,Einstellungen,Maus aus dem Weg räumen
if ObMausAusDemWegRäumen=ja
    guicontrol,,checkObMausAusDemWegRäumen,1


iniread,WelchesFarbSchema,Einstellungen.ini,Einstellungen,Farbschema
if WelchesFarbSchema=error
    guicontrol,,RadioHintergrundStandard,1
iniread,WelchesFarbSchema,Einstellungen.ini,Einstellungen,Farbschema
if WelchesFarbSchema=grün
    guicontrol,,RadioHintergrundGrün,1
iniread,WelchesFarbSchema,Einstellungen.ini,Einstellungen,Farbschema
if WelchesFarbSchema=blau
    guicontrol,,RadioHintergrundBlau,1

iniread,ObZusätzlicheButtonsZumAuswertenAnzeigen,Einstellungen.ini,Einstellungen,ZusätzlicheButtonsZumAuswertenAnzeigen,0
guicontrol,,ObZusätzlicheButtonsZumAuswertenAnzeigen,%ObZusätzlicheButtonsZumAuswertenAnzeigen%

;Sprachlisten laden
Sprachliste=|
loop,Language files\*.ini
{
    stringtrimright,dateiname,A_loopfilename,4
    Sprachliste=%Sprachliste%%dateiname%|
}
iniread,WelcheSprache,Einstellungen.ini,Einstellungen,Sprache,German
stringreplace,Sprachliste,Sprachliste,|%WelcheSprache%|,|%WelcheSprache%||
stringtrimleft,Sprachliste,Sprachliste,1
guicontrol, ,DropDownSprache,%Sprachliste%

;Soundlisten laden
SoundList=|
loop,Sound\Richtig und Falsch\*,2
{
	SoundList=%SoundList%%A_LoopFileName%|
}
iniread,WelcheSounds,Einstellungen.ini,Einstellungen,Sounds für richtig und falsch,Kurze Toene
stringreplace,SoundList,SoundList,|%WelcheSounds%|,|%WelcheSounds%||
stringtrimleft,SoundList,SoundList,1
guicontrol, ,DropDownSoundList,%SoundList%

;Computerstimmen laden
iniread,DeutscheStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme1,%a_space%
iniread,EnglischeStimme,Vokabellisten\%aktuelleListe%.ini,info,Stimme2,%a_space%

gosub StandardstimmeBeimErstenStartSuchen ;Suche alle Verfügbaren Stimmen. Füllt Variable TTSList aus.
;~ msgbox,% TTSList
TTSListDeutsch:=TTSList
TTSLIstEnglisch:=TTSList

stringreplace,TTSListDeutsch,TTSListDeutsch,|%DeutscheStimme%|,|%DeutscheStimme%||
stringreplace,TTSLIstEnglisch,TTSLIstEnglisch,|%EnglischeStimme%|,|%EnglischeStimme%||
stringtrimleft,TTSListDeutsch,TTSListDeutsch,1
stringtrimleft,TTSLIstEnglisch,TTSLIstEnglisch,1
guicontrol, ,DropDownDeutschTTS,%TTSListDeutsch%
guicontrol, ,DropDownEnglischTTS,%TTSLIstEnglisch%


;Einstellungen zur Computerstimme
iniread,DeutscheStimmeLautstärke,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Lautstärke,100
guicontrol, ,SliderDeutschTTSLautstärke,%DeutscheStimmeLautstärke%
iniread,EnglischeStimmeLautstärke,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Lautstärke,100
guicontrol, ,SliderEnglischTTSLautstärke,%EnglischeStimmeLautstärke%
iniread,DeutscheStimmeGeschwindigkeit,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Geschwindigkeit,0
guicontrol, ,SliderDeutschTTSGeschwindigkeit,%DeutscheStimmeGeschwindigkeit%
iniread,EnglischeStimmeGeschwindigkeit,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Geschwindigkeit,0
guicontrol, ,SliderEnglischTTSGeschwindigkeit,%EnglischeStimmeGeschwindigkeit%
iniread,DeutscheStimmeTonhöhe,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Tonhöhe,0
guicontrol, ,SliderDeutschTTSTonhöhe,%DeutscheStimmeTonhöhe%
iniread,EnglischeStimmeTonhöhe,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Tonhöhe,0
guicontrol, ,SliderEnglischTTSTonhöhe,%EnglischeStimmeTonhöhe%


;Listenspezifische Einstellungen
iniread,aktuelleListeErsteSprache,Vokabellisten\%aktuelleListe%.ini,info,Sprache1,%A_space%
guicontrol, ,EditErsteSprache,%aktuelleListeErsteSprache%
iniread,aktuelleListeZweiteSprache,Vokabellisten\%aktuelleListe%.ini,info,Sprache2,%A_space%
guicontrol, ,EditZweiteSprache,%aktuelleListeZweiteSprache%

guicontrol,,RadioAbfrageRichtungDnachE,%Von___nach___fragen1%%aktuelleListeErsteSprache%%Von___nach___fragen2%%aktuelleListeZweiteSprache%%Von___nach___fragen3%
guicontrol,,RadioAbfrageRichtungEnachD,%Von___nach___fragen1%%aktuelleListeZweiteSprache%%Von___nach___fragen2%%aktuelleListeErsteSprache%%Von___nach___fragen3%
guicontrol,,TextComputerstimmeFürDeutsch,%Computerstimme_für__1%%aktuelleListeErsteSprache%%Computerstimme_für__2%
guicontrol,,TextComputerstimmeFürEnglisch,%Computerstimme_für__1%%aktuelleListeZweiteSprache%%Computerstimme_für__2%

iniread,ZuIgnorierendeWörter,Vokabellisten\%AktuelleListe%.ini,info,Wörter ignorieren,to
guicontrol,,EditZuIgnorierendeWörter,%ZuIgnorierendeWörter%

;---Jenachdem welches Fenster die Einstellungen aufgerufen hat, anderen Tab öffnen
if WelchesLetztesFensterVorEinstellungen=Hauptmenü
    guicontrol,choose,tab,3
if WelchesLetztesFensterVorEinstellungen=VokabelnHinzufügen
    guicontrol,choose,tab,4
if WelchesLetztesFensterVorEinstellungen=Vokabelbearbeiten
    guicontrol,choose,tab,4

Gui, Show, w477 h377, Einstellungen
Return

ButtonSetVokabelnExportieren:
gosub,VokabelnExportieren
return

ButtonSetVokabelnImportieren:
gui,submit

if WelchesLetztesFensterVorEinstellungen=Hauptmenü
{
    if (EditAktuelleListeName = "" or EditErsteSprache = "" or EditZweiteSprache = "")
    {
        msgbox,Bitte füllen Sie die leeren Felder aus!
        gui,show
        exit
    }
    fileappend,,Vokabellisten\%EditAktuelleListeName%.ini ;Neue Liste erstellen. 
    if errorlevel
    {
        MsgBox,Die Liste konnte nicht erstellt werden.
        gui,show
        exit
    }
    aktuelleListe=%EditAktuelleListeName%
    iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
}
else
{
    if EditAktuelleListeName
    {
        filemove,Vokabellisten\%aktuelleListe%.ini,Vokabellisten\%EditAktuelleListeName%.ini
        if errorlevel
        {
            MsgBox,Die Liste konnte nicht umbenannt werden.
            gui,show
            exit
        }
        aktuelleListe=%EditAktuelleListeName%
        iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
    }
    
}

if EditErsteSprache
iniwrite,%EditErsteSprache%,Vokabellisten\%aktuelleListe%.ini,info,Sprache1
if EditZweiteSprache
iniwrite,%EditZweiteSprache%,Vokabellisten\%aktuelleListe%.ini,info,Sprache2
iniwrite,%EditZuIgnorierendeWörter%,Vokabellisten\%aktuelleListe%.ini,info,Wörter ignorieren

WelchesLetztesFensterVorVokabelnHinzufügen=Einstellungen ;um nach den Einstellungen wieder zurückzukommen
NächstesFenster=VokabelnImportieren
goto,NächstesFensterÖffnen

return



5buttonOk:
gosub,änderungenÜbernehmen
goto,5ButtonAbbrechen  ;Weil sonst eh nur das gleiche da steht

return

5ButtonÜbernehmen:
gosub,änderungenÜbernehmen

if DropDownSprache<>%WelcheSprache% ;Wenn die Sprache geändert wurde, das Fenster neu generieren
{
    NächstesFenster=Einstellungen
    goto,NächstesFensterÖffnen
}

return



änderungenÜbernehmen:
gui submit,nohide


iniwrite,%DropDownSprache%,Einstellungen.ini,Einstellungen,Sprache


if checkObImmerKurzSchlafen=1
iniwrite,ja,Einstellungen.ini,Einstellungen,Immer kurz warten
Else
iniwrite,nein,Einstellungen.ini,Einstellungen,Immer kurz warten

iniwrite,%checkObAufUpdatesChecken%,Einstellungen.ini,Einstellungen,Auf Updates prüfen


if radioObVokabelnAussprechen=1
iniwrite,ja,Einstellungen.ini,Einstellungen,Vokabeln aussprechen
else
iniwrite,nein,Einstellungen.ini,Einstellungen,Vokabeln aussprechen

if radioObRichtigUndFalschSagen=1
iniwrite,ja,Einstellungen.ini,Einstellungen,Sagen ob richtig oder falsch
else
iniwrite,nein,Einstellungen.ini,Einstellungen,Sagen ob richtig oder falsch

iniwrite,%DropDownSoundList%,Einstellungen.ini,Einstellungen,Sounds für richtig und falsch

if checkObMausAusDemWegRäumen=1
iniwrite,ja,Einstellungen.ini,Einstellungen,Maus aus dem Weg räumen
else
iniwrite,nein,Einstellungen.ini,Einstellungen,Maus aus dem Weg räumen

if RadioAbfrageRichtungEnachD=1
iniwrite,EnachD,Einstellungen.ini,Einstellungen,Abfragerichtung
else,
iniwrite,DnachE,Einstellungen.ini,Einstellungen,Abfragerichtung

if RadioHintergrundStandard=1
iniwrite,error,Einstellungen.ini,Einstellungen,FarbSchema
if RadioHintergrundBlau=1
iniwrite,blau,Einstellungen.ini,Einstellungen,FarbSchema
if RadioHintergrundGrün=1
iniwrite,grün,Einstellungen.ini,Einstellungen,FarbSchema

iniwrite,%ObZusätzlicheButtonsZumAuswertenAnzeigen%,Einstellungen.ini,Einstellungen,ZusätzlicheButtonsZumAuswertenAnzeigen




if WelchesLetztesFensterVorEinstellungen=Hauptmenü
{
    if (EditAktuelleListeName = "" or EditErsteSprache = "" or EditZweiteSprache = "")
    {
        msgbox,Bitte füllen Sie die leeren Felder aus!
        gui,show
        exit
    }
    fileappend,,Vokabellisten\%EditAktuelleListeName%.ini ;Neue Liste erstellen. 
    if errorlevel
    {
        MsgBox,Die Liste konnte nicht erstellt werden.
        gui,show
        exit
    }
    aktuelleListe=%EditAktuelleListeName%
    iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
}
else
{
    if EditAktuelleListeName
    {
        filemove,Vokabellisten\%aktuelleListe%.ini,Vokabellisten\%EditAktuelleListeName%.ini
        if errorlevel
        {
            MsgBox,Die Liste konnte nicht umbenannt werden.
            gui,show
            exit
        }
        aktuelleListe=%EditAktuelleListeName%
        iniwrite,%AktuelleListe%,einstellungen.ini,Allgemein,Aktuelle Liste
    }
    
}
if EditErsteSprache
iniwrite,%EditErsteSprache%,Vokabellisten\%aktuelleListe%.ini,info,Sprache1
if EditZweiteSprache
iniwrite,%EditZweiteSprache%,Vokabellisten\%aktuelleListe%.ini,info,Sprache2
iniwrite,%EditZuIgnorierendeWörter%,Vokabellisten\%aktuelleListe%.ini,info,Wörter ignorieren



iniwrite,%DropDownDeutschTTS%,Vokabellisten\%aktuelleListe%.ini,info,Stimme1
iniwrite,%DropDownEnglischTTS%,Vokabellisten\%aktuelleListe%.ini,info,Stimme2

iniwrite,%SliderDeutschTTSLautstärke%,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Lautstärke
iniwrite,%SliderEnglischTTSLautstärke%,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Lautstärke
iniwrite,%SliderDeutschTTSGeschwindigkeit%,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Geschwindigkeit
iniwrite,%SliderEnglischTTSGeschwindigkeit%,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Geschwindigkeit
iniwrite,%SliderDeutschTTSTonhöhe%,Vokabellisten\%aktuelleListe%.ini,info,Stimme1 Tonhöhe
iniwrite,%SliderEnglischTTSTonhöhe%,Vokabellisten\%aktuelleListe%.ini,info,Stimme2 Tonhöhe



gosub,TTSInitialisieren ;wenn die Stimme geändert wurde

if DropDownSprache<>%WelcheSprache% ;Wenn die Sprache geändert wurde, das Fenster neu generieren
{
    gosub,SprachdateiAuslesen
    goto, NächstesFensterÖffnen
}
return




5ButtonAbbrechen:

;Zurückkehren zum Fenster, von wo die Einstellungen aufgerufen wurden.
if WelchesLetztesFensterVorEinstellungen=VokabelnHinzufügen
{
   ObVokabelnBeimHinzufügenWiederherstellen=ja
    NächstesFenster=VokabelnHinzufügen
    goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorEinstellungen=VokabelBearbeiten
{
    ObVokabelnBeimBearbeitenWiederherstellen=ja
    NächstesFenster=VokabelBearbeiten
    goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorEinstellungen=VokabelnAbfragen
{
    NächstesFenster=VokabelnAbfragen
    goto,NächstesFensterÖffnen
}
else if WelchesLetztesFensterVorEinstellungen=Hauptmenü
{
    NächstesFenster=Hauptmenü
    goto,NächstesFensterÖffnen
}
return