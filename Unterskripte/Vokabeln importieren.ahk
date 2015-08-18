VokabelnImportieren:
iniread,AktuelleListe,einstellungen.ini,Allgemein,Aktuelle Liste
iniread,ObVokabelnAussprechen,Einstellungen.ini,Einstellungen,Vokabeln aussprechen
iniread,SchonGemerkt,Einstellungen.ini,Allgemein,Schon gemerkt,%a_space%

iniread,aktuelleListeErsteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache1
iniread,aktuelleListeZweiteSprache,Vokabellisten\%AktuelleListe%.ini,info,Sprache2


Gui, Add, Text, x10 y8 w490 h20 , %Wähle_Eine_Datei_Mit_Vokabeln%
Gui, Add, Edit, vVokabelImportierenPfad x10 Y+10 w470
Gui, Add, button, gVokabelImportierenAuswählen vVokabelImportierenAuswählen x10 Y+10 w150 h30,%Datei_Auswählen%
Gui, Add, button, gVokabelImportierenEinlesen vVokabelImportierenEinlesen Default X+10 yp w150 h30,%Datei_Einlesen%

Gui, Add, Button, gVokabelImportierenZurück x10 Y+10 w95 h40 , %zurück_%

gui,show


return
VokabelImportierenAuswählen:
FileSelectFile,datei,1,,%Datei_Auswählen%, CSV (*.csv)
GuiControl,,VokabelImportierenPfad,%datei%
return

VokabelImportierenEinlesen:
gui,submit,nohide
FileRead,VokabelnImportierenDateiInhalt,*t %VokabelImportierenPfad%

if errorlevel
{
	MsgBox, 16, %Vokabeln_importieren%, %Datei_Konnte_Nicht_Gelesen_Werden%
	return
}
;~ MsgBox %VokabelnImportierenDateiInhalt%

ImportierenWasGefunden:=false
ImportierenFehlerAufgetreten:=false
ImportierenAlleEingeleseneWörter:=object()
ImportierenLetzterIndex=
loop,parse,VokabelnImportierenDateiInhalt,`n
{
	if A_LoopField=
		continue
	wortindex:=A_Index
	
	if a_index=1
		continue
	
	ImportierenEinWort:=object()
	if ImportierenLetzterIndex between 2 and 5
	{
		
		ImportierenFehlerAufgetreten:=true
		break
		
	}
	loop,parse,a_loopfield,csv
	{
		;~ MsgBox % a_index ": "  a_loopfield
		if (A_Index=1 or a_index=5)
		{
			if a_loopfield=
			{
				
				ImportierenFehlerAufgetreten:=true
				break
			}
			
			
		}
		
		
		ImportierenEinWort[a_index]:=A_LoopField
		ImportierenLetzterIndex:=a_index
	}
	if ImportierenFehlerAufgetreten
	{
		ImportierenFehlerAufgetreten:=false
		continue
		break
	}
	ImportierenAlleEingeleseneWörter.push(ImportierenEinWort)
	ImportierenWasGefunden:=true
}
if ImportierenLetzterIndex between 2 and 5
{
	
	ImportierenFehlerAufgetreten:=true
}
if not ImportierenWasGefunden
{
	MsgBox, 20, %Vokabeln_importieren%, %Keine_Vokabel_Gefunden% `n`n %Soll_Eine_Vorlage_Erstellt_Werden%
	ifmsgbox,yes
	{
		gosub VokabelnImportierenTemplateErstellen
	}
	return
	return
}

if ImportierenFehlerAufgetreten
{
	MsgBox, 20, %Vokabeln_importieren%, %Das_Format_Ist_nicht_Korrekt% `n`n %Soll_Eine_Vorlage_Erstellt_Werden%
	ifmsgbox,yes
	{
		gosub VokabelnImportierenTemplateErstellen
	}
	return
}

gui,hide
gui,6:font,s10
gui,6:default


Gui,6:Add, ListView, v4listviewVokabelliste x5 y5 r30 grid h300 w630 , Nr.|%aktuelleListeErsteSprache% 1|%aktuelleListeErsteSprache% 2|%aktuelleListeErsteSprache% 3|%aktuelleListeZweiteSprache% 1|%aktuelleListeZweiteSprache% 2|%aktuelleListeZweiteSprache% 3

gui,6:font,s8
gui,6:add,button,g6Importierenbuttonzurück v4buttonzurück yp x5 w120 h30 ,%zurück_%
gui,6:add,button,g6ImportierenbuttonImportieren v4buttonbearbeiten yp X+5 w120 h30 default ,%importieren_%


for index, importWort in ImportierenAlleEingeleseneWörter
{
	lv_add("",index,importWort[1],importWort[2],importWort[3],importWort[5],importWort[6],importWort[7])
	;~ MsgBox % importWort[1] "---" importWort[5]
}

gui,6:+resize
lv_modifycol(1,30)
lv_modifycol(2,200)
lv_modifycol(3,100)
lv_modifycol(4,100)
lv_modifycol(5,200)
lv_modifycol(6,100)
lv_modifycol(7,100)

gosub,6guisize


gui 6:show,h500 w855,Vokabelliste "%AktuelleListe%"
sleep,10
LV_Modify(AktuelleVokabel, "vis") ;Vokabel auswählen



return


6ImportierenbuttonImportieren:
zahl=1
nomole: ;Vokabel speichern
iniread,ebbis,Vokabellisten\%AktuelleListe%.ini,%zahl%,Vokabel
if ebbis =ja
{
zahl++
goto,nomole
}


for index, importWort in ImportierenAlleEingeleseneWörter
{
	Deutsch1:=importWort[1]
	Deutsch2:=importWort[2]
	Deutsch3:=importWort[3]
	KommentarDeutsch:=importWort[4]
	Englisch1:=importWort[5]
	Englisch2:=importWort[6]
	Englisch3:=importWort[7]
	KommentarEnglisch:=importWort[8]
	;~ MsgBox % importWort[1] "---" importWort[5]
	stringreplace,KommentarDeutsch,KommentarDeutsch,`n,$nächsteZeile$
	stringreplace,KommentarEnglisch,KommentarEnglisch,`n,$nächsteZeile$
	iniwrite,ja,Vokabellisten\%AktuelleListe%.ini,%zahl%,Vokabel
	iniwrite,%Deutsch1%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d1
	if Deutsch2<>
	iniwrite,%Deutsch2%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d2
	if Deutsch3<>
	iniwrite,%Deutsch3%,Vokabellisten\%AktuelleListe%.ini,%zahl%,d3
	if KommentarEnglisch<>
	iniwrite,%KommentarEnglisch%,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarEnglisch
	iniwrite,%Englisch1%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e1
	if Englisch2<>
	iniwrite,%Englisch2%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e2
	if Englisch3<>
	iniwrite,%Englisch3%,Vokabellisten\%AktuelleListe%.ini,%zahl%,e3
	if KommentarDeutsch<>
	iniwrite,%KommentarDeutsch%,Vokabellisten\%AktuelleListe%.ini,%zahl%,KommentarDeutsch
	iniwrite,1,Vokabellisten\%AktuelleListe%.ini,%zahl%,Kasten
	iniwrite,%zahl%,Vokabellisten\%AktuelleListe%.ini,info,Anzahl
	zahl++
}
NächstesFenster:=WelchesLetztesFensterVorVokabelnHinzufügen
goto,NächstesFensterÖffnen

return



VokabelnImportierenTemplateErstellen:

FileSelectFile,template,S8,,%Speicherort_Für_Die_Vorlage_wählen%, CSV (*.csv)
IfNotInString,template,.csv
	template.=".csv"
FileDelete,%template%
fileappend,
(
"%aktuelleListeErsteSprache% 1","%aktuelleListeErsteSprache% 2","%aktuelleListeErsteSprache% 3","%aktuelleListeErsteSprache% %Kommentar_%","%aktuelleListeZweiteSprache% 1","%aktuelleListeZweiteSprache% 2","%aktuelleListeZweiteSprache% 3","%aktuelleListeZweiteSprache% %Kommentar_%"
Delete this line and write here: First word (required), first synonym, second synonym, example, translation (required), first synonym, second synonym, example
),%template%
return



VokabelImportierenZurück:
NächstesFenster:=WelchesLetztesFensterVorVokabelnHinzufügen
goto,NächstesFensterÖffnen


6Importierenbuttonzurück:
gui,1:default
gui,show
gui,6:destroy
return

return