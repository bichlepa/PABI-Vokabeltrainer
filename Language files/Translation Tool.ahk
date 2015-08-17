#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

neuname=nix


;Standardmäßig Deutsch und Englisch auswählen
SpracheGewählt1=English
SpracheGewählt2=Deutsch
SpracheGewählt3=
SpracheGewählt4=
SpracheGewählt5=


gui, add, dropdownlist,vDropDownSprache x10 y10 w70 
gui, add, button, gSpracheHinzufügen yp X+10,Edit language
gui, add, button, gSpracheEntfernen yp X+10, Close language
gui, add, button, gSpracheNeueSprache yp X+10, Add new language
gui, add, button, gNeustart yp X+50,Neustart
gui, add, TreeView ,gAktion x10 y40 w250 h400

Gui, Add, ListView,gAktion AltSubmit nosort grid yp X+10 w450 h100,Sprache|Text
gui,font,s12
gui, add, edit,gEditFeld vEditFeld xp Y+10 h290 w450 
gui,font,s8

gui,add,button,gNeuerEintrag x10 Y+10,New Entry
gui,add,button,gEintragLöschen yp X+10,Delete Entry
gui,add,button,gNeueKategorie yp X+10,New Category
gui,add,button,gKategorieLöschen yp X+10,Delete Category

lv_add("",SpracheGewählt1,"")
lv_add("",SpracheGewählt2,"")
LV_Modify(2, "Select") ;Zweite Sprache auswählen

SprachlisteNeuLaden:
Sprachliste=|
loop,*.ini
{
    stringtrimright,dateiname,A_loopfilename,4
    Sprachliste=%Sprachliste%%dateiname%|
}
iniread,WelcheSprache,Einstellungen.ini,Einstellungen,Sprache
if Welchesprache=error
    WelcheSprache=English
stringreplace,Sprachliste,Sprachliste,|%WelcheSprache%|,|%WelcheSprache%||
;~ stringtrimleft,Sprachliste,Sprachliste,1
guicontrol, ,DropDownSprache,%Sprachliste%

Gosub TreeViewBefüllen


gui,+resize
gui, show


return

SpracheEntfernen:
gui, submit,nohide

;Danach suchen
Loop,4
{
	if SpracheGewählt%a_index%=%DropDownSprache%
	{
		SpracheGewählt%a_index%= ;Sprache löschen
		LV_Delete(a_index)
		;~ ;Andere Sprachen nachschieben
		zahl1=%a_index%
		zahl2=%a_index%
		zahl2++
		if (zahl2>4)
			break
		SpracheGewählt%zahl1%:=SpracheGewählt%zahl2%
		zahl1++
		zahl2++
		if (zahl2>4)
			break
		SpracheGewählt%zahl1%:=SpracheGewählt%zahl2%
		zahl1++
		zahl2++
		if (zahl2>4)
			break
		SpracheGewählt%zahl1%:=SpracheGewählt%zahl2%
		break
	}
	else continue
	
}
gosub,Aktion
return





SpracheHinzufügen:
gui, submit,nohide

SpracheHinzufügenWennNeu:
;Gucken, ob nicht schon da
Loop,4
{
	if SpracheGewählt%a_index%=%DropDownSprache%
	{
		msgbox, Diese Sprache ist schon ausgewählt!
		return
		
	}
	
	if a_index=4
	{
		if SpracheGewählt%a_index%
		{
			msgbox,Schon vier Sprachen gewählt. Mehr geht nicht
			return
		}
	}
	
}

;~ ;Am Ende einfügen
Loop,4
{
	if SpracheGewählt%a_index%=
	{
		SpracheGewählt%a_index%=%DropDownSprache%
		lv_add("",DropDownSprache,"")
		gosub,Aktion
		;~ msgbox,% SpracheGewählt1 SpracheGewählt2 SpracheGewählt3 SpracheGewählt4
		return
	}
	
	
}



;~ msgbox,% SpracheGewählt1 SpracheGewählt2 SpracheGewählt3 SpracheGewählt4
return

SpracheNeueSprache:
inputbox,neuname,New Language, Enter the language
if errorlevel=1
	return
if neuname=
	return

iniwrite,%a_space%,%neuname%.ini,Allgemein,OK_
Gosub,SprachlisteNeuLaden
DropDownSprache=%neuname%
gosub,SpracheHinzufügenWennNeu

return



TreeViewBefüllen:
TV_Delete()

KategorieCounter=0
ItemCounter=0
loop,read,english.ini
{
	
	ifinstring,a_loopreadline,[
		ifinstring,a_loopreadline,]
		{
			
			KategorieCounter++
			stringtrimleft,Kategorie%KategorieCounter%,a_loopreadline,1
			StringTrimRight,Kategorie%KategorieCounter%,Kategorie%KategorieCounter%,1
			IDKategorie%KategorieCounter%:=TV_Add(Kategorie%KategorieCounter%)
		}
	
	ifinstring,a_loopreadline,=
	{
		
		ItemCounter++
		stringgetpos,pos,a_loopreadline,=
		stringleft,Item%ItemCounter%,a_loopreadline,%pos%
		stringright,temp,Item%ItemCounter%,1
		if (temp=1 or temp=2 or temp=3)
		{
			msgbox,0,hmmm,% Item%ItemCounter% ;hier muss code rein, ich weiß nicht wie. ... Jetzt weiß ich auch nicht mehr wozu :-)
			
		}
		else
		{
			IDItem%ItemCounter%:=TV_Add(Item%ItemCounter%,IDKategorie%KategorieCounter%)
			if (neuname=Item%ItemCounter%) ;Für den Fall, dass man ein neues Item einfügt
			{
				neuname=nix
				neuItemID:=IDItem%ItemCounter%
			}
			
		}
		
	}
	
}


return


Aktion:


;Gucken, was gewählt ist
gewähltNr:=TV_GetSelection()
TV_GetText(gewähltItem, gewähltNr)
gewähltKategorie:=TV_GetParent(gewähltNr)
TV_GetText(gewähltKategorie, gewähltKategorie)

if A_GuiEvent=DoubleClick
{
	iniread,temp,english.ini,%gewähltKategorie%,%gewähltItem%
	clipboard=iniread,%gewähltItem%,Language files\`%WelcheSprache`%.ini,%gewähltKategorie%,%gewähltItem%,%temp%`n
	ifinstring,temp,``n
		Clipboard=%clipboard%stringreplace,%gewähltItem%,%gewähltItem%,````n,``n,all`n
	ifinstring,temp,_
		clipboard=%clipboard%stringsplit,%gewähltItem%,%gewähltItem%,_`n
}
if A_GuiEvent=D ;Drag
{
	
	iniread,temp,english.ini,%gewähltKategorie%,%gewähltItem%
	
	stringreplace,temp,temp,_,_,UseErrorLevel
	
	if errorlevel
	{
		clipboard=`%%gewähltItem%1`%
		Loop %errorlevel%
		{
			zahl:=a_index + 1
			clipboard=%clipboard%`%%gewähltItem%%zahl%`%
			
		}
	}
	else
		clipboard=`%%gewähltItem%`%
		
}
;~ msgbox,%gewähltNr%`n%gewähltItem%`n%gewähltKategorie%


if gewähltKategorie ;Wenn ein Item gewählt ist
{
	Loop 4
	{
		
		
		if SpracheGewählt%a_index%
		{
			tempsprache:=SpracheGewählt%a_index%
			iniread,TextSprache%a_index%,%tempsprache%.ini,%gewähltKategorie%,%gewähltItem%,%a_space%
			
			LV_Modify(a_index,"",SpracheGewählt%a_index%,textsprache%a_index%)
			
		}
		else
		{
			
			
			;~ LV_delete(a_index)
		}
		
		
		
	}
	
}
else ;Wenn eine Kategorie gewählt ist
	Loop 4
	{
		
		
		if SpracheGewählt%a_index%<>
		{
			tempsprache:=SpracheGewählt%a_index%
			textsprache%a_index%=
			LV_Modify(a_index,"",SpracheGewählt%a_index%,"")
		}
		else
		{
			
			
			;~ LV_delete(a_index)
		}
		
		
		
		
	}


gewählteSpracheNr:=LV_Getnext(0) ;Welche Reihe ist gewählt
gewählteSpracheInListView:=SpracheGewählt%gewählteSpracheNr%
LV_Gettext(temptext,gewählteSpracheNr,2) 
;~ temptext:=textsprache%gewählteSpracheNr%
StringReplace,temptext,temptext,``n,`n,all
guicontrol,,EditFeld,%temptext%

return

EditFeld:
gui,submit,NoHide

stringreplace,EditFeldKorrigiert,EditFeld,`n,``n,all
iniwrite,%EditFeldKorrigiert%,%gewählteSpracheInListView%.ini,%gewähltKategorie%,%gewähltItem%
;~ LV_Modify(gewählteSpracheNr,"",SpracheGewählt%gewählteSpracheNr%,EditFeld)

return




NeuerEintrag:
;~ msgbox,%gewähltKategorie%`n%gewähltItem%

;Wenn ein Eintrag gewählt wurde, dann ist gewählteKategorie gefüllt
;Wenn eine Kategorie gewählt wurde, dann ist gewählteKategorie leer, stattdessen enthält gewähltItem den Namen der Kategorie
if not gewähltKategorie 
{
	if gewähltItem
		gewähltKategorie=%gewähltItem%
	else
		return
	
}


INputbox,neuname,Neuer Eintrag,Gib Namen ein,,217,120
if errorlevel=1
	return
if neuname=
{
	msgbox,Gib zuerst einen Namen ein
	goto,NeuerEintrag ;Neuer Versuch
}
stringreplace,neuname,neuname,%a_space%,_,a
stringreplace,neuname,neuname,`,,_,a
stringreplace,neuname,neuname,-,_,a
stringreplace,neuname,neuname,.,_,a
stringleft,temp,neuname,1
if temp<>_
	neuname=_%neuname%
stringright,temp,neuname,1
if temp<>_
	neuname=%neuname%_

iniwrite,%a_space%,English.ini,%gewähltKategorie%,%neuname%
gosub,TreeViewBefüllen
TV_Modify(neuItemID,"select")


return

EintragLöschen:

if not gewähltKategorie 
{
	Msgbox,,Fehler, Kein Eintrag ausgewählt
	return
}

msgbox,4,Sicher?,%gewähltKategorie% -> %gewähltItem% löschen?
ifmsgbox,yes
{
	inidelete,English.ini,%gewähltKategorie%,%gewähltItem%
	gosub,TreeViewBefüllen
}

return


NeueKategorie:

INputbox,neuname,Neuer Eintrag,Gib Namen ein,,217,120
if errorlevel=1
	return
if neuname=
{
	msgbox,Gib zuerst einen Namen ein
	goto,NeueKategorie ;Neuer Versuch
}
stringreplace,neuname,neuname,%a_space%,_,a
stringreplace,neuname,neuname,`,,_,a
stringreplace,neuname,neuname,-,_,a
stringreplace,neuname,neuname,.,_,a

iniwrite,%a_space%,English.ini,%neuname%
gosub,TreeViewBefüllen
;~ TV_Modify(neuItemID,"select")

return

KategorieLöschen:

;Wenn ein Eintrag gewählt wurde, dann ist gewählteKategorie gefüllt
;Wenn eine Kategorie gewählt wurde, dann ist gewählteKategorie leer, stattdessen enthält gewähltItem den Namen der Kategorie
if not gewähltKategorie 
{
	if gewähltItem
		gewähltKategorie=%gewähltItem%
	else
		return
	
}
msgbox,4,Sicher?,%gewähltKategorie% löschen?
ifmsgbox,yes
{
	inidelete,English.ini,%gewähltKategorie%
	gosub,TreeViewBefüllen
}

return

return







Neustart:
Reload
return

Guiclose:
exitapp