JetztSchonGemerkt()
{
	global
	;~ if WieOftInsgesamtAusgewertet>5
	;~ ifnotinstring,SchonGemerkt,Möglichst Lange Zeit
	;~ {
	;~ msgbox,,Schon Gemerkt?,Du kannst die Zeiteinstellung vom Programm übernehmen lassen. Aktivierte "vor möglichst langer Zeit" und es wird dich immer nach den ältesten Vokabeln fragen. Wobei die Reihenfolge der Vokabeln immer noch variiert.
	;~ SchonGemerkt=%SchonGemerkt%-Möglichst Lange Zeit-
	;~ iniwrite,%SchonGemerkt%,Einstellungen.ini,Allgemein,Schon gemerkt
	;~ }
	;~ if WieOftInsgesamtAngemacht>1
	;~ ifnotinstring,SchonGemerkt,Neue Einstellungen
	;~ {
	;~ msgbox,,Schon Gemerkt?,In den Einstellungen gibt es viele Einstellungen, z.B.`n- Abfrage von englisch nach deutsch`n- Aussprache durch eine beliebige Computerstimme`n- Aktivierung von Tastenkombinationen um Sonderzeichen eingeben zu können.
	;~ SchonGemerkt=%SchonGemerkt%-Neue Einstellungen-
	;~ iniwrite,%SchonGemerkt%,Einstellungen.ini,Allgemein,Schon gemerkt
	;~ }
	;~ if WieOftInsgesamtAusgewertet>20
	;~ ifnotinstring,SchonGemerkt,Enter drücken statt klicken
	;~ {
	;~ msgbox,,Schon Gemerkt?,FALLS du es nicht weißt.`nDu kannst nachdem du die Lösung eingegeben hast, 'enter' drücken um die Vokabel auszuwerten, anstatt mit der Maus auf 'Auswerten' zu klicken.`nWenn du die Lösung nicht weißt, kannst du das Feld leer lassen und einfach 'enter' drücken, anstatt auf 'Keine Ahnung' zu klicken.
	;~ SchonGemerkt=%SchonGemerkt%-Enter drücken statt klicken-
	;~ iniwrite,%SchonGemerkt%,Einstellungen.ini,Allgemein,Schon gemerkt
	;~ }
}