
ListeAnschauen:

gui,6:default
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,AktuelleVokabel,Einstellungen.ini,Allgemein,Aktuelle Vokabel
iniread,Gesamtzahl,Vokabellisten\%AktuelleListe%.ini,info,Anzahl
iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2
gui,6:font,s10


Gui,6:Add, ListView, v4listviewVokabelliste x5 y5 r30 grid h300 w630 , Nr.|%aktuelleListeErsteSprache% 3|%aktuelleListeErsteSprache% 2|%aktuelleListeErsteSprache% 1|%aktuelleListeZweiteSprache% 1|%aktuelleListeZweiteSprache% 2|%aktuelleListeZweiteSprache% 3|%Fach_%

gui,6:font,s8
gui,6:add, button,g6buttonbearbeiten v4buttonbearbeiten x5 Y+10 w120 h30,%Vokabel_bearbeiten%
gui,6:add, button,g6buttonlöschen v4buttonlöschen yp X+10 w120 h30,%Vokabel_löschen%
gui,6:add,button,g6buttonzurück v4buttonzurück yp X+10 w120 h30 default ,%zurück_%

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
iniread,e1,Vokabellisten\%AktuelleListe%.ini,%zahl%,e1
iniread,e2,Vokabellisten\%AktuelleListe%.ini,%zahl%,e2
if e2=error
e2=
iniread,e3,Vokabellisten\%AktuelleListe%.ini,%zahl%,e3
if e3=Error
e3=
iniread,Fach,Vokabellisten\%AktuelleListe%.ini,%zahl%,Kasten
if Fach=Error
Fach=
lv_add("",zahl,d3,d2,d1,e1,e2,e3,Fach)

zahl++
}
else
break
}
progress,off
gui,6:+resize
lv_modifycol(1,30)
lv_modifycol(2,9)
lv_modifycol(3,9)
lv_modifycol(4,282)
lv_modifycol(5,282)
lv_modifycol(6,9)
lv_modifycol(7,9)
lv_modifycol(8,20)

gosub,6guisize

;msgbox,%AktuelleVokabel%
LV_Modify(AktuelleVokabel, "Select") ;Vokabel auswählen

gui 6:show,h500 w692,Vokabelliste "%AktuelleListe%"
sleep,10
LV_Modify(AktuelleVokabel, "vis") ;Vokabel auswählen

return

6GuiSize:  ; Expand or shrink the ListView in response to the user's resizing of the window.
if A_EventInfo = 1  ; The window has been minimized.  No action needed.
    return
; Otherwise, the window has been resized or maximized. Resize the ListView to match.
GuiControl,Move,4listviewVokabelliste, % "W" . (A_GuiWidth - 20) . " H" . (A_GuiHeight - 45)
guicontrol,move,4buttonbearbeiten ,% "y"a_guiheight-35 
guicontrol,move,4buttonlöschen ,% "y"a_guiheight-35 
guicontrol,move,4buttonzurück, % "y"a_guiheight-35 
return

6buttonbearbeiten:
sel:=lv_getnext(0)  ;Rausfinden, was ausgewählt ist
lv_gettext(vokabelchen,sel)
if 0<vokabel<1000000
{
    AktuelleVokabel:=vokabelchen
    if AktuelleVokabel=Nr. ;bugsuche
    msgbox,bug in Liste Anschauen
    iniwrite,%AktuelleVokabel%,Einstellungen.ini,Allgemein,Aktuelle Vokabel
}
WelchesLetztesFensterVorBearbeiten=ListeAnschauen
nächstesFenster=VokabelBearbeiten
goto,NächstesFensterÖffnen

return

6buttonzurück:
sel:=lv_getnext(0)  ;Rausfinden, was ausgewählt ist
lv_gettext(vokabelchen,sel)
if 0<vokabelchen<1000000
{
    AktuelleVokabel:=vokabelchen
;~     msgbox,%vokabelchen%
    if AktuelleVokabel=Nr. ;bugsuche
    msgbox,bug in Liste Anschauen
    iniwrite,%AktuelleVokabel%,Einstellungen.ini,Allgemein,Aktuelle Vokabel
}

nächstesFenster=VokabelnAbfragen
goto,NächstesFensterÖffnen
return

6buttonlöschen:
sel:=lv_getnext(0)
lv_gettext(vokabelchen,sel)
if 0<vokabelchen<1000000 
inidelete,Vokabellisten\%AktuelleListe%.ini,%vokabelchen% ;die Vokabel löschen
iniwrite,Vokabeln anschauen,einstellungen.ini,Allgemein,Letztes Fenster
gui,6:destroy
Gosub,VokabellisteReparieren
goto,nächstesFensterÖffnen
return

6guiclose:
MsgBox, 36, %PABI_Vokabeltrainer%, %Möchten_Sie_Pabi_Wirklich_Beenden%
IfMsgBox,yes
exitapp
else
return

