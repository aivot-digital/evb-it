#import "/utils/template.typ": *

// ==========================================
// 1. TEMPLATE INITIALIZATION
// ==========================================

// Here we define all global settings for the contract template.
// Any variable set here will override the defaults in template.typ.
#show: contractTemplate.with(
  outputMode: "template",
  layoutStyle: "standard",
  pageCounterName: "Seite",
  pageCounterNameSeparator: "von",
  contractTitle: "EVB-IT Cloudvertrag",
  contractVersion: "Version 1.0.1",
  contractDate: "(Stand: 01.03.2022)",
  hint: "Die mit * gekennzeichneten Begriffe sind am Ende der EVB-IT Cloud-AGB definiert.",
)

// ==========================================
// 2. VARIABLES FOR THIS CONTRACT
// ==========================================

// Daten des Auftraggebers
#let auftraggeberName = ""
#let auftraggeberStraße = ""
#let auftraggeberHausnummer = ""
#let auftraggeberPostleitzahl = ""
#let auftraggeberOrt = ""

// Daten des Auftragnehmers
#let auftragnehmerName = ""
#let auftragnehmerStraße = ""
#let auftragnehmerHausnummer = ""
#let auftragnehmerPostleitzahl = ""
#let auftragnehmerOrt = ""

// Vertragsgegenstand
#let gegenstandDesVertrages = ""

// Vertragsbestandteile
#let anlagenVertragsbestandteil = (
  (
    bezeichnung: "",
    version: "",
    seitenanzahl: "",
  ),
  (
    bezeichnung: "",
    version: "",
    seitenanzahl: "",
  ),
  (
    bezeichnung: "Kriterienkatalog für Cloudleistungen, inklusive Anlage zur Einbeziehung von auftragnehmerseitigen AGB mit Anhang I und II",
    version: "",
    seitenanzahl: "",
  ),
  (
    bezeichnung: "Vereinbarung zur Auftragsverarbeitung (AVV) inklusive der technischen und organisatorischen Maßnahmen (TOM)",
    version: "",
    seitenanzahl: "",
  ),
)
#let anlagenVertragsbestandteilZellen = for (index, anlage) in anlagenVertragsbestandteil.enumerate() {
  (
    str(index + 1),
    fieldValue(value: anlage.bezeichnung),
    fieldValue(value: anlage.version),
    fieldValue(value: anlage.seitenanzahl),
  )
}

#let kriterienkatalogVersion = ""
#let kriterienkatalogSeitenanzahl = ""

#let tomVersion = ""
#let tomSeitenanzahl = ""

#let checkboxAnlagenReihenfolge = false
#let anlagenReihenfolge = ""

#let checkboxAuftragnehmerseitigeAGB = false
#let anlagenNummerAuftragnehmerseitigeAGB = ""
#let anlagenAuftragnehmerseitigeAGB = (
  (
    bezeichnung: "",
    version: "",
    seitenanzahl: "",
  ),
  (
    bezeichnung: "",
    version: "",
    seitenanzahl: "",
  ),
)
#let anlagenAuftragnehmerseitigeAGBZellen = for (index, anlage) in anlagenAuftragnehmerseitigeAGB.enumerate() {
  (
    fieldValue(value: anlage.bezeichnung),
    fieldValue(value: anlage.version),
    fieldValue(value: anlage.seitenanzahl),
  )
}

#let checkboxAuftragnehmerseitigeAGBGemäßAnlage = false

#let anlagennummerRechteregelung = ""

// Vereinbarte Leistungen
#let checkboxVereinbarteLeistungSetup = false
#let checkboxVereinbarteLeistungSaaSPaaS = false
#let checkboxVereinbarteLeistungIaaS = false
#let checkboxVereinbarteLeistungMCS = false
#let checkboxVereinbarteLeistungVertragsende = false
#let checkboxVereinbarteLeistungSonstiges = false

// Gegenstand der Leistungen
#let leistungen = (
  (
    produkt: "",
    menge: "",
    mindestvertragsdauer: "",
    beginn: "",
    ende: "",
    abweichendeKuendigungsfrist: "",
    automatischeVerlaengerung: "",
    preis: "",
  ),
)
#let leistungenZellen = for (index, leistung) in leistungen.enumerate() {
  (
    str(index + 1),
    fieldValue(value: leistung.produkt, length: 100%),
    fieldValue(value: leistung.menge, length: 100%),
    fieldValue(value: leistung.mindestvertragsdauer, length: 100%),
    fieldValue(value: leistung.beginn, length: 100%),
    fieldValue(value: leistung.ende, length: 100%),
    fieldValue(value: leistung.abweichendeKuendigungsfrist, length: 100%),
    fieldValue(value: leistung.automatischeVerlaengerung, length: 100%),
    fieldValue(value: leistung.preis, length: 100%),
  )
}

// Initiale Leistungen
#let checkboxInitialeLeistungen = false

#let checkboxInitialeLeistungenGemaessAnlage = false
#let initialeLeistungenGemaessAnlage = ""

#let checkboxInitialeLeistungenGemaessGesonderterVertrag = false
#let initialeLeistungenGemaessGesonderterVertrag = ""

#let checkboxInitialeLeistungenWeitereRegelungen = false
#let weitereRegelungenGemaessAnlage = ""

#let checkboxVerguetungInitialeLeistungPauschalpreis = false
#let verguetungInitialeLeistungPauschalpreis = ""

#let checkboxVerguetungInitialeLeistungAufwand = false
#let verguetungInitialeLeistungAufwand = ""
#let checkboxVerguetungInitialeLeistungAufwandObergrenze = false
#let verguetungInitialeLeistungAufwandObergrenze = ""

// Sonstige Leistungen
#let checkboxSonstigeLeistungen = false
#let sonstigeLeistungen = ""

#let checkboxVerguetungSonstigeLeistungenPauschalpreis = false
#let verguetungSonstigeLeistungenPauschalpreis = ""

#let checkboxVerguetungSonstigeLeistungenAufwand = false
#let verguetungSonstigeLeistungenAufwand = ""
#let checkboxVerguetungSonstigeLeistungenAufwandObergrenze = false
#let verguetungSonstigeLeistungenAufwandObergrenze = ""

// Leistungen bei Vertragsende
#let checkboxLeistungenVertragsendeZumutbar = false
#let checkboxLeistungenVertragsendeIndividuell = false
#let leistungenVertragsendeIndividuell = ""

#let checkboxVerguetungLeistungenVertragsendePauschalpreis = false
#let verguetungLeistungenVertragsendePauschalpreis = ""

#let verguetungLeistungenVertragsendeAufwand = ""
#let checkboxVerguetungLeistungenVertragsendeAufwandObergrenze = false
#let verguetungLeistungenVertragsendeAufwandObergrenze = ""

// Leistungen auf Abruf
#let leistungenAufAbrufGemaessNummer = ""

#let checkboxLeistungenAufAbrufMindestvorlaufzeit = false
#let leistungenAufAbrufMindestvorlaufzeit = ""

#let checkboxLeistungenAufAbrufAbnahmemenge = false
#let leistungenAufAbrufAbnahmemenge = ""
#let leistungenAufAbrufAbnahmemengeProZeitraum = ""
#let leistungenAufAbrufAbnahmemengeHoechstwert = ""

#let checkboxLeistungenAufAbrufMindestabnahmemenge = false
#let leistungenAufAbrufMindestabnahmemenge = ""
#let leistungenAufAbrufMindestabnahmemengeProZeitraum = ""

// Ticketsystem
#let checkboxVerwendungTicketsystem = false
#let ticketsystemName = ""
#let checkboxVerwendungTicketsystemAuftragnehmer = false
#let checkboxVerwendungTicketsystemAuftraggeber = false
#let checkboxTicketsystemURL = false
#let ticketsystemURL = ""
#let checkboxTicketsystemBereitstellung = false
#let ticketsystemBereitstellung = ""

// Fälligkeit der Vergütung
#let checkboxFaelligkeitVerguetungQuartalsweise = false

#let checkboxFaelligkeitVerguetungJaehrlich = false
#let faelligkeitVerguetungJaehrlichStichtag = ""

#let checkboxFaelligkeitVerguetungEinmalig = false
#let faelligkeitVerguetungEinmaligStichtag = ""

#let checkboxFaelligkeitVerguetungIndividuell = false
#let faelligkeitVerguetungIndividuell = ""

#let checkboxFaelligkeitVerguetungNachZeitaufwandIndividuell = false
#let faelligkeitVerguetungNachZeitaufwandIndividuell = ""

// Zahlung der Vergütung
#let checkboxFaelligkeitRechnungIndividuell = false
#let faelligkeitRechnungIndividuell = ""

// Rechnungsadresse
#let checkboxERechnung = false
#let eRechnungLeitwegID = ""
#let eRechnungZusatzfelder = ""

#let checkboxRechnungsadresse = false
#let rechnungsadresse = ""

// Preisanpassung
#let checkboxVereinbarungPreisanpassung = false
#let checkboxVereinbarungPreisanpassungCloudAGB = false
#let checkboxVereinbarungPreisanpassungCloudAGBFestpreis = false
#let checkboxVereinbarungPreisanpassungCloudAGBWeitereVerguetungen = false
#let vereinbarungPreisanpassungCloudAGBWeitereVerguetungen = ""

#let checkboxVereinbarungPreisanpassungGemaessAnlage = false
#let vereinbarungPreisanpassungGemaessAnlage = ""

// Preiskategorien auftragnehmerseitig eingesetztes Personal
#let startzeitSamstagZeitraum1 = ""
#let endzeitSamstagZeitraum1 = ""
#let startzeitSamstagZeitraum2 = ""
#let endzeitSamstagZeitraum2 = ""

#let startzeitSonnFeiertagZeitraum1 = ""
#let endzeitSonnFeiertagZeitraum1 = ""
#let startzeitSonnFeiertagZeitraum2 = ""
#let endzeitSonnFeiertagZeitraum2 = ""

#let verguetungenPersonal = (
  (
    bezeichnung: "",
    stundensatz: "",
    tagessatz: "",
    aufschlagWochentageAusserhalbGeschaeftszeiten: "",
    aufschlagSamstagZeitraum1: "",
    aufschlagSamstagZeitraum2: "",
    aufschlagSonnFeiertagZeitraum1: "",
    aufschlagSonnFeiertagZeitraum2: "",
  ),
)
#let verguetungenPersonalZellen = for (index, kategorie) in verguetungenPersonal.enumerate() {
  (
    str(index + 1),
    fieldValue(value: kategorie.bezeichnung, length: 100%),
    fieldValue(value: kategorie.stundensatz, length: 100%),
    fieldValue(value: kategorie.tagessatz, length: 100%),
    fieldValue(value: kategorie.aufschlagWochentageAusserhalbGeschaeftszeiten, length: 100%),
    fieldValue(value: kategorie.aufschlagSamstagZeitraum1, length: 100%),
    fieldValue(value: kategorie.aufschlagSamstagZeitraum2, length: 100%),
    fieldValue(value: kategorie.aufschlagSonnFeiertagZeitraum1, length: 100%),
    fieldValue(value: kategorie.aufschlagSonnFeiertagZeitraum2, length: 100%),
  )
}

#let geschaeftszeitBeginnMoBisDo = ""
#let geschaeftszeitEndeMoBisDo = ""
#let geschaeftszeitBeginnFr = ""
#let geschaeftszeitEndeFr = ""

#let checkboxWeitereVereinbarungenPreiskategorienGemaessAnlage = false
#let weitereVereinbarungenPreiskategorienGemaessAnlage = ""

// Vergütung von Personentagessätzen
#let checkboxPersonentag10Stunden = false

#let checkboxPersonentag10StundenAnteiligAbgerechnet = false

#let checkboxVerguetungTagessaetzeGemaessAnlage = false
#let verguetungTagessaetzeGemaessAnlage = ""

// Besondere Bestimmungen zur Vergütung nach Aufwand
#let checkboxVerguetungAufwandNebenkostenGemaessAnlage = false
#let verguetungAufwandNebenkostenGemaessAnlage = ""

#let checkboxVerguetungAufwandBesondereBestimmungenGemaessAnlage = false
#let verguetungAufwandBesondereBestimmungenGemaessAnlage = ""

// Abweichende Haftungsregelungen
#let checkboxHaftungLeichtFahrlaessigePflichtverletzungGemaessAnlage = false
#let haftungLeichtFahrlaessigePflichtverletzungGemaessAnlage = ""

#let checkboxHaftungEntgangenerGewinn = false

// Beauftragte und Ansprechpartner
#let checkboxBeauftragteAuftragnehmerInformationssicherheit = false
#let beauftragteAuftragnehmerInformationssicherheit = ""

#let checkboxBeauftragteAuftragnehmerDatenschutz = false
#let beauftragteAuftragnehmerDatenschutz = ""

#let checkboxBeauftragteAuftragnehmerGeheimschutz = false
#let beauftragteAuftragnehmerGeheimschutz = ""

#let ansprechpartnerVertragAuftragnehmer = ""

#let ansprechpartnerVertragAuftraggeber = ""

// Besondere Anforderungen an Mitarbeiter des Auftragnehmers
#let checkboxMitarbeiterAuftragnehmerVerpflichtungsgesetz = false
#let mitarbeiterAuftragnehmerVerpflichtungsgesetz = ""

#let checkboxMitarbeiterAuftragnehmerMindestanforderungenGemaessAnlage = false
#let mitarbeiterAuftragnehmerMindestanforderungenGemaessAnlage = ""

// Allgemeine Sicherheitsanforderungen
#let checkboxMitarbeiterVerpflichtungITSicherheitGemaessAnlage = false
#let mitarbeiterVerpflichtungITSicherheitGemaessAnlage = ""

#let checkboxMitarbeiterVerpflichtungGeheimschutzGemaessAnlage = false
#let mitarbeiterVerpflichtungGeheimschutzGemaessAnlage = ""

#let checkboxMitarbeiterVerpflichtungSicherheitEinsatzortGemaessAnlage = false
#let mitarbeiterVerpflichtungSicherheitEinsatzortGemaessAnlage = ""

#let checkboxMitarbeiterVerpflichtungWeitereRegelungen = false
#let mitarbeiterVerpflichtungWeitereRegelungen = ""

// Prüfrechte
#let checkboxPruefungDurchWeitereOrganisationen = false
#let checkboxPruefungDurchAuftraggeber = false
#let checkboxPruefungDurchBSI = false
#let checkboxPruefungDurchBenanntePruefer = false

#let checkboxPruefungGemaessAnlage = false
#let pruefungGemaessAnlage = ""

// Unterauftragnehmer
#let checkboxUnterauftragnehmer = false

// Vertraulichkeit
#let checkboxVertraulichkeitGemaessAnlage = false
#let vertraulichkeitGemaessAnlage = ""

// Haftpflichtversicherung
#let checkboxNachweisHaftpflichtversicherung = false

// Sonstige Vereinbarungen
#let checkboxSonstigeVereinbarungen = false
#let sonstigeVereinbarungen = ""

#let checkboxSonstigeVereinbarungenGemaessAnlage = false
#let sonstigeVereinbarungenGemaessAnlage = ""


// ==========================================
// 3. CONTENT
// ==========================================

#align(center)[
  #heading(outlined: false, bookmarked: false, numbering: none)[Vertrag über Cloudleistungen]
]

Zwischen

#fieldValue(value: auftraggeberName, length: 5cm)\
#fieldValue(value: auftraggeberStraße, length: 5cm) #fieldValue(value: auftraggeberHausnummer)\
#fieldValue(value: auftraggeberPostleitzahl) #fieldValue(value: auftraggeberOrt, length: 5cm)

-- im Folgenden _Auftraggeber_ genannt -- und

#fieldValue(value: auftragnehmerName, length: 5cm)\
#fieldValue(value: auftragnehmerStraße, length: 5cm) #fieldValue(value: auftragnehmerHausnummer)\
#fieldValue(value: auftragnehmerPostleitzahl) #fieldValue(value: auftragnehmerOrt, length: 5cm)

-- im Folgenden _Auftragnehmer_ genannt --

wird folgender Vertrag geschlossen:




= Gegenstand und Bestandteile des Vertrages

== Vertragsgegenstand
Gegenstand des Vertrages sind folgende Cloudleistungen:\
#fieldValue(value: gegenstandDesVertrages)

== Vertragsbestandteile
Es gelten als Vertragsbestandteile:

=== dieser Vertragstext mit den folgenden Anlagen:

#table(
  columns: (auto, 1fr, auto, auto),
  inset: 0.5em,
  align: horizon,
  table.header(
    repeat: true,
    table.cell(colspan: 4, align: center)[*Anlagen zum EVB-IT Cloudvertrag*],
    [*Anlage Nr.*],
    [*Bezeichnung*],
    [*Datum/Version*],
    [*Anzahl Seiten*],
  ),
  ..anlagenVertragsbestandteilZellen.flatten(),
)

#option(checkboxAnlagenReihenfolge)[
  Es gelten die Anlagen in folgender Rangfolge: #fieldValue(value: anlagenReihenfolge).
]

=== die Ergänzenden Vertragsbedingungen für Cloudleistungen (EVB-IT Cloud-AGB) in der bei Bereitstellung der Vergabeunterlagen geltenden Fassung

=== und danach die Allgemeinen Vertragsbedingungen für die Ausführung von Leistungen (VOL/B) in der bei Bereitstellung der Vergabeunterlagen geltenden Fassung

=== und danach

#option(checkboxAuftragnehmerseitigeAGB)[
  die nachfolgenden auftragnehmerseitigen AGB zu Art und Umfang der Cloudleistungen (zusammen Anlage Nr. #fieldValue(value: anlagenNummerAuftragnehmerseitigeAGB)).
  #table(
    columns: (1fr, auto, auto),
    inset: 0.5em,
    align: horizon,
    table.header(
      repeat: true,
      [*Bezeichnung*], [*Datum/Version*], [*Anzahl Seiten*],
    ),
    ..anlagenAuftragnehmerseitigeAGBZellen.flatten(),
  )
]

#option(checkboxAuftragnehmerseitigeAGBGemäßAnlage)[
  die auftragnehmerseitigen AGB gemäß „Anlage zur Einbeziehung auftragnehmerseitiger AGB“, dort „I. Anhang zum EVB-IT Cloudvertrag“
]

Wirksam einbezogen sind die vorgenannten auftragnehmerseitigen AGB\* zu Art und Umfang der Cloudleistungen auch, insoweit sie einen dynamischen Änderungsvorbehalt vorsehen, soweit die Änderungen nicht zum Nachteil des Auftraggebers sind.\
Eine Einbeziehung der auftragnehmerseitigen AGB\* zu Art und Umfang der Cloudleistungen erfolgt nur nachrangig gegenüber allen anderen Regelungen und nur, soweit sie allen anderen vertraglichen Regelungen weder entgegenstehen noch diese beschränken.\
Abweichend hiervon gelten hinsichtlich einzelner konkreter Anforderungen entsprechende auftragnehmerseitige AGB\* -Regelungen zu Art und Umfang der Cloudleistungen vorrangig zu den EVB-IT Cloud AGB, soweit dies in der Anlage zur Einbeziehung von auftragnehmerseitigen AGB\*, dort „II Anhang zum Kriterienkatalog“ in Bezug auf die hier aufgeführte Kategorien ausdrücklich vereinbart ist.\
Weitere auftragnehmerseitige AGB\* sind ausgeschlossen, unabhängig davon, ob sie in diesen Vertrag einbezogen wurden oder nicht.

Die EVB-IT Cloud-AGB stehen unter #link("https://www.cio.bund.de")[www.cio.bund.de] und die VOL/B unter #link("https://www.bmwi.de")[www.bmwi.de] zur Einsichtnahme bereit.\
Für alle in diesem Vertrag genannten Beträge gilt einheitlich der Euro als Währung.
Die vereinbarten Vergütungen verstehen sich zuzüglich der gesetzlichen Umsatzsteuer, soweit Umsatzsteuerpflicht besteht.

=== Rangfolge der Nutzungsrechtsregelungen
Vereinbarte Nutzungsrechte gelten in folgender Rangfolge:
- Rechteregelungen des Auftraggebers gemäß Anlage Nr. #fieldValue(value: anlagennummerRechteregelung)
- Ziffer 14 EVB-IT Cloud-AGB
- die Nutzungsrechtsregelungen aus den auftragnehmerseitigen AGB\* zu Art und Umfang der Cloudleistungen die gemäß Nummer 1.2.4 einbezogen wurden. Diese gelten aber nur, soweit sie den sonstigen vertraglichen Regelungen weder entgegenstehen noch diese beschränken.




= Überblick über die vereinbarten Leistungen

#option(checkboxVereinbarteLeistungSetup)[
  Besondere initiale Leistungen (Setup)
]
#option(checkboxVereinbarteLeistungSaaSPaaS)[
  Software as a Service\* (SaaS\*), Platform as a Service\* (PaaS\*)
]
#option(checkboxVereinbarteLeistungIaaS)[
  Infrastructure as a Service (IaaS\*)
]
#option(checkboxVereinbarteLeistungMCS)[
  Managed Cloud Services (MCS\*)
]
#option(checkboxVereinbarteLeistungVertragsende)[
  Leistungen bei Vertragsende
]
#option(checkboxVereinbarteLeistungSonstiges)[
  Sonstige Leistungen
]




= Gegenstand der Leistungen
Art, Umfang und Termine der zu erbringenden Leistungen ergeben sich aus der folgenden Tabelle (Termin- und Leistungsplan):

== Leistungen gemäß Ziffer 1.1 EVB-IT Cloud-AGB
#block[
  #set text(size: 9pt)

  #table(
    columns: (5%, 20%, 7%, 8%, 10%, 10%, 15%, 13%, 15%),
    inset: 0.5em,
    align: horizon,
    table.header(
      repeat: true,
      [Lfd. Nr.],
      [Produkt / Leistung],
      [Menge],
      [MVD#footnote[MVD = Mindestvertragsdauer]],
      [Beginn#footnote[wenn keine Vorgabe für Beginn, dann Feld leer lassen. In diesem Fall gilt der Vertragsschluss als Beginn]],
      [Ende / Termin#footnote[z.B. festes Datum ggf. mit Uhrzeit oder „nach 48 Monaten“ (wenn Vertrag unbefristet, dann Feld leer lassen)]],
      [Abweichende Kündigungsfrist in Monaten#footnote[Wenn abweichend von Ziffer 20.1 der EVB-IT Cloud-AGB]],
      [Automatische Verlängerung um Anzahl Monate#footnote[Die Leistungsdauer verlängert sich um die vereinbarten Monate, wenn sie nicht mit einer Frist von drei Monaten zum Laufzeitende gekündigt wird]],
      [Monatlicher Preis oder, abweichendes Preismodell gemäß Anlage#footnote[Hier Einbeziehung eines Preisblattes möglich, insbesondere bei abweichendem Preismodell]],
    ),
    ..leistungenZellen.flatten(),
  )
]

== Einmalige Leistungen

=== Initiale Leistungen

==== Art und Umfang der initialen Leistung

#option(checkboxInitialeLeistungen)[
  Der Auftragnehmer schuldet initiale Leistungen zur Herbeiführung der Betriebsbereitschaft\*.
  #option(checkboxInitialeLeistungenGemaessAnlage)[
    Einzelheiten gemäß Anlage Nr. #fieldValue(value: initialeLeistungenGemaessAnlage).
  ]
  #option(checkboxInitialeLeistungenGemaessGesonderterVertrag)[
    Die Leistungen werden nicht auf der Grundlage dieses Vertrages erbracht, sondern im Rahmen eines gesonderten Vertrages gemäß Anlage Nr. #fieldValue(value: initialeLeistungenGemaessGesonderterVertrag).
  ]
]
#option(checkboxInitialeLeistungenWeitereRegelungen)[
  Weitere Regelungen zur initialen Leistung gemäß Anlage Nr. #fieldValue(value: weitereRegelungenGemaessAnlage).
]

==== Vergütung der initialen Leistung
Die initialen Leistungen werden nicht gesondert vergütet, soweit nicht nachfolgend abweichend geregelt:

#option(checkboxVerguetungInitialeLeistungPauschalpreis)[
  Die Vergütung für die initialen Leistungen erfolgt zu einem Pauschalfestpreis in Höhe von #fieldValue(value: verguetungInitialeLeistungPauschalpreis) Euro.
]
#option(checkboxVerguetungInitialeLeistungAufwand)[
  Die Vergütung für die initialen Leistungen erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: verguetungInitialeLeistungAufwand) aus Nummer 5.1
  #option(checkboxVerguetungInitialeLeistungAufwandObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: verguetungInitialeLeistungAufwandObergrenze) Euro.
  ]
]

=== Sonstige einmalige Leistungen

==== Art und Umfang der sonstigen Leistungen

#option(checkboxSonstigeLeistungen)[
  Der Auftragnehmer erbringt die in Anlage Nr. #fieldValue(value: sonstigeLeistungen) beschriebenen sonstigen Leistungen.
]

==== Vergütung der sonstigen Leistungen

#option(checkboxVerguetungSonstigeLeistungenPauschalpreis)[
  Die Vergütung für die sonstigen Leistungen erfolgt zu einem Pauschalfestpreis in Höhe von #fieldValue(value: verguetungSonstigeLeistungenPauschalpreis) Euro.
]
#option(checkboxVerguetungSonstigeLeistungenAufwand)[
  Die Vergütung für die sonstigen Leistungen erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: verguetungSonstigeLeistungenAufwand) aus Nummer 5.1
  #option(checkboxVerguetungSonstigeLeistungenAufwandObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: verguetungSonstigeLeistungenAufwandObergrenze) Euro.
  ]
]

=== Leistungen bei Vertragsende

==== Art und Umfang der Leistungen bei Vertragsende

#option(checkboxLeistungenVertragsendeZumutbar)[
  Der Auftragnehmer ist gemäß Ziffer 13.2 EVB-IT Cloud-AGB im zumutbaren Umfang zur Erbringung von Leistungen verpflichtet, die erforderlich sind, um einen neuen Auftragnehmer oder den Auftraggeber in die Lage zu versetzen, die Leistungen zu übernehmen.
]
#option(checkboxLeistungenVertragsendeIndividuell)[
  Abweichend/ergänzend von bzw. zu Ziffer 13.2 EVB-IT Cloud-AGB schuldet der Auftragnehmer im Zusammenhang mit dem Vertragsende folgende Leistungen: #fieldValue(value: leistungenVertragsendeIndividuell)
]

==== Vergütung der Leistungen bei Vertragsende

#option(checkboxVerguetungLeistungenVertragsendePauschalpreis)[
  Die Vergütung der Leistungen bei Vertragsende erfolgt zu einem Pauschalfestpreis in Höhe von #fieldValue(value: verguetungLeistungenVertragsendePauschalpreis) Euro.
]
#option(checkboxVerguetungSonstigeLeistungenAufwand)[
  Die Vergütung der Leistungen bei Vertragsende erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: verguetungLeistungenVertragsendeAufwand) aus Nummer 5.1
  #option(checkboxVerguetungLeistungenVertragsendeAufwandObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: verguetungLeistungenVertragsendeAufwandObergrenze) Euro.
  ]
]

== Leistungen auf Abruf
Die Leistungen gemäß Nummer #fieldValue(value: leistungenAufAbrufGemaessNummer) werden auf Abruf erbracht.

#option(checkboxLeistungenAufAbrufMindestvorlaufzeit)[
  Der Mindestvorlauf für den Abruf beträgt #fieldValue(value: leistungenAufAbrufMindestvorlaufzeit).
]
#option(checkboxLeistungenAufAbrufAbnahmemenge)[
  Die geschätzte Abnahme beträgt #fieldValue(value: leistungenAufAbrufAbnahmemenge) pro #fieldValue(value: leistungenAufAbrufAbnahmemengeProZeitraum) ; die Höchstmenge bzw. der Höchstwert beträgt #fieldValue(value: leistungenAufAbrufAbnahmemengeHoechstwert).
]
#option(checkboxLeistungenAufAbrufMindestabnahmemenge)[
  Die vereinbarte Mindestabnahme beträgt #fieldValue(value: leistungenAufAbrufMindestabnahmemenge) pro #fieldValue(value: leistungenAufAbrufMindestabnahmemengeProZeitraum).
]

Der Auftraggeber ist nicht zum Abruf verpflichtet. Dies gilt nicht für die hier ggf. vereinbarte Mindestabnahme.

== Ticketsystem

#option(checkboxVerwendungTicketsystem)[
  Für die Meldung, Klassifizierung und Bestätigung von Störungen\*, sonstigen Meldungen und Anfragen sowie die Beobachtung und Überwachung des Bearbeitungsfortschritts verwenden die Parteien das Ticketsystem #fieldValue(value: ticketsystemName)
  #option(checkboxVerwendungTicketsystemAuftragnehmer)[des Auftragnehmers,]
  #option(checkboxVerwendungTicketsystemAuftraggeber)[des Auftraggebers,]
  welches
  #option(checkboxTicketsystemURL)[unter der Web-Adresse #fieldValue(value: ticketsystemURL) erreichbar ist.]
  #option(
    checkboxTicketsystemBereitstellung,
  )[wie folgt zur Verfügung gestellt wird: #fieldValue(value: ticketsystemBereitstellung).]
]




= Fälligkeit und Zahlung der Vergütung

== Fälligkeit der Vergütung
Die Vergütung für wiederkehrende Leistungen ist abweichend von Ziffer 16.1 EVB-IT Cloud-AGB nicht monatlich nachträglich bis zum 15. eines jeden Monats fällig, sondern:

#option(checkboxFaelligkeitVerguetungQuartalsweise)[
  quartalsweise bis zum 15. des zweiten Monats des laufenden Quartals
]
#option(checkboxFaelligkeitVerguetungJaehrlich)[
  jährlich bis zum #fieldValue(value: faelligkeitVerguetungJaehrlichStichtag) des laufenden Jahres
]
#option(checkboxFaelligkeitVerguetungEinmalig)[
  einmalig zum #fieldValue(value: faelligkeitVerguetungEinmaligStichtag)
]
#option(checkboxFaelligkeitVerguetungIndividuell)[
  #fieldValue(value: faelligkeitVerguetungIndividuell)
]

Die Vergütung für Leistungen nach Zeitaufwand ist abweichend von Ziffer 16.2.1 EVB-IT Cloud-AGB nicht monatlich nachträglich bis zum 15. eines jeden Monats fällig, sondern:

#option(checkboxFaelligkeitVerguetungNachZeitaufwandIndividuell)[
  #fieldValue(value: faelligkeitVerguetungNachZeitaufwandIndividuell)
]

== Zahlung der Vergütung

#option(checkboxFaelligkeitRechnungIndividuell)[
  Abweichend von Ziffer 16.3 EVB-IT Cloud-AGB ist eine fällige Vergütung nicht 30 Tage sondern #fieldValue(value: faelligkeitRechnungIndividuell) Tage nach Zugang einer prüffähigen Rechnung zu zahlen.
]

== Rechnungsadresse

#option(checkboxERechnung)[
  Die Rechnung ist nach den Vorgaben der E-Rechnungsverordnung elektronisch einzureichen.\
  In der Rechnung bzw. zur Rechnungserstellung ist die Leitweg-ID #fieldValue(value: eRechnungLeitwegID) anzugeben.
  Zudem müssen bei der Rechnung alle Pflichtfelder sowie die Zusatzfelder #fieldValue(value: eRechnungZusatzfelder) gefüllt sein.\
  Eine Rechnung, die entgegen vorstehender Regelung nicht elektronisch gestellt wird, begründet keinen Verzug nach § 286 Abs. 3 BGB.
]
#option(checkboxRechnungsadresse)[
  Die Rechnungsanschrift ergibt sich aus Anlage Nr. #fieldValue(value: rechnungsadresse).
]

== Preisanpassung

#option(checkboxVereinbarungPreisanpassung)[
  Es wird eine Preisanpassung vereinbart:

  #option(checkboxVereinbarungPreisanpassungCloudAGB)[
    gemäß Ziffer 16.5 EVB-IT-Cloud-AGB:

    #option(checkboxVereinbarungPreisanpassungCloudAGBFestpreis)[
      für den monatlichen Pauschalfestpreis gemäß Nummer 3.1.
    ]
    #option(checkboxVereinbarungPreisanpassungCloudAGBWeitereVerguetungen)[
      für die folgenden weiteren Vergütungen: #fieldValue(value: vereinbarungPreisanpassungCloudAGBWeitereVerguetungen).
    ]
  ]
  #option(checkboxVereinbarungPreisanpassungGemaessAnlage)[
    gemäß Anlage Nr. #fieldValue(value: vereinbarungPreisanpassungGemaessAnlage).
  ]
]




= Ergänzende Vereinbarungen bei Vergütung von Leistungen von Personen nach Aufwand

== Vereinbarung der Preiskategorien bei Vergütung nach Aufwand durch auftragnehmerseitig eingesetztes Personal
#block[
  #set text(size: 9pt)

  #table(
    columns: (4%, 18%, 9%, 9%, 13%, 12%, 12%, 12%, 12%),
    inset: 0.5em,
    align: center + horizon,

    table.header(
      repeat: true,
      // Zeile 1
      table.cell(rowspan: 3)[*Lfd. Nr.*],
      table.cell(rowspan: 3)[*Bezeichnung der Personalkategorie*],
      table.cell(colspan: 2)[*Vergütung für Tätigkeiten innerhalb der Geschäftszeit*],
      table.cell(
        colspan: 5,
      )[*Zuschläge in Prozent auf die Vergütungssätze aus Spalten 3 und 4 für Tätigkeiten innerhalb nachfolgender Zeiten*],

      // Zeile 2 (Startet bei Spalte 3)
      table.cell(rowspan: 2)[*Stunden-satz*],
      table.cell(rowspan: 2)[*Tages-satz*],
      table.cell(rowspan: 2)[*Arbeitstage Montag bis Freitag außerhalb der Geschäftszeit*],
      table.cell(colspan: 2)[*Samstag*],
      table.cell(colspan: 2)[*Sonn- und Feiertage am Erfüllungsort*],

      // Zeile 3 (Startet bei Spalte 6)
      [von #fieldValue(value: startzeitSamstagZeitraum1, length: 50%)\ bis #fieldValue(value: endzeitSamstagZeitraum1, length: 50%)],
      [von #fieldValue(value: startzeitSamstagZeitraum2, length: 50%)\ bis #fieldValue(value: endzeitSamstagZeitraum2, length: 50%)],
      [von #fieldValue(value: startzeitSonnFeiertagZeitraum1, length: 50%)\ bis #fieldValue(value: endzeitSonnFeiertagZeitraum1, length: 50%)],
      [von #fieldValue(value: startzeitSonnFeiertagZeitraum2, length: 50%)\ bis #fieldValue(value: endzeitSonnFeiertagZeitraum2, length: 50%)],
    ),
    ..verguetungenPersonalZellen.flatten(),
  )
]
Festlegung der Geschäftszeiten:

#table(
  columns: (1fr, 1fr),
  inset: 0.5em,
  align: left + horizon,

  table.header(
    repeat: true,
    [*Arbeitstag*], [*Geschäftszeit*],
  ),

  [Montag bis Donnerstag],
  [von #fieldValue(value: geschaeftszeitBeginnMoBisDo) bis #fieldValue(value: geschaeftszeitEndeMoBisDo)],

  [Freitag], [von #fieldValue(value: geschaeftszeitBeginnFr) bis #fieldValue(value: geschaeftszeitEndeFr)],
)

#option(checkboxWeitereVereinbarungenPreiskategorienGemaessAnlage)[
  weitere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: weitereVereinbarungenPreiskategorienGemaessAnlage).
]

== Abweichende Regelungen für die Bestimmung und Vergütung von Personentagessätzen

#option(checkboxPersonentag10Stunden)[
  Abweichend von Ziffer 16.2.3 Satz 2 EVB-IT Cloud-AGB können bei entsprechendem Nachweis für einen Personentag bis zu 10 Stunden abgerechnet werden.
]
#option(checkboxPersonentag10StundenAnteiligAbgerechnet)[
  Abweichend von Ziffer 16.2.3 Sätze 2 und 3 EVB-IT Cloud-AGB kann ein voller Tagessatz nur in Rechnung gestellt werden, wenn mindestens 10 Stunden geleistet wurden.
  Werden weniger als 10 Zeitstunden pro Tag geleistet, sind diese anteilig in Rechnung zu stellen.
]
#option(checkboxVerguetungTagessaetzeGemaessAnlage)[
  weitere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: verguetungTagessaetzeGemaessAnlage).
]

== Besondere Bestimmungen zur Vergütung nach Aufwand

#option(checkboxVerguetungAufwandNebenkostenGemaessAnlage)[
  Abweichend von Ziffer 16.2.1 EVB-IT Cloud-AGB werden Nebenkosten/Reisekosten/Reisezeiten/Materialkosten gemäß Anlage Nr. #fieldValue(value: verguetungAufwandNebenkostenGemaessAnlage) vergütet.
]
#option(checkboxVerguetungAufwandBesondereBestimmungenGemaessAnlage)[
  Weitere besondere Bestimmungen zur Vergütung nach Aufwand sind in Anlage Nr. #fieldValue(value: verguetungAufwandBesondereBestimmungenGemaessAnlage) vereinbart.
]




= Abweichende Haftungsregelungen

#option(checkboxHaftungLeichtFahrlaessigePflichtverletzungGemaessAnlage)[
  Abweichend von Ziffer 19.1 EVB-IT Cloud-AGB gelten für die Haftung bei leicht fahrlässigen Pflichtverletzungen die Regelungen gemäß Anlage Nr. #fieldValue(value: haftungLeichtFahrlaessigePflichtverletzungGemaessAnlage).
]
#option(checkboxHaftungEntgangenerGewinn)[
  Abweichend von Ziffer 19.2 EVB-IT Cloud-AGB haftet der Auftragnehmer auch für entgangenen Gewinn..
]




= Beauftragte und Ansprechpartner

== Beauftragte des Auftragnehmers (Name, Mailadresse)

#option(checkboxBeauftragteAuftragnehmerInformationssicherheit)[
  Informationssicherheit: #fieldValue(value: beauftragteAuftragnehmerInformationssicherheit).
]
#option(checkboxBeauftragteAuftragnehmerDatenschutz)[
  Datenschutz: #fieldValue(value: beauftragteAuftragnehmerDatenschutz).
]
#option(checkboxBeauftragteAuftragnehmerGeheimschutz)[
  Geheimschutz: #fieldValue(value: beauftragteAuftragnehmerGeheimschutz).
]

== Ansprechpartner für Fragen zum Vertrag (Name, Mailadresse)
beim Auftragnehmer: #fieldValue(value: ansprechpartnerVertragAuftragnehmer).

beim Auftraggeber: #fieldValue(value: ansprechpartnerVertragAuftraggeber).




= Weitere Regelungen

== Besondere Anforderungen an Mitarbeiter des Auftragnehmers

#option(checkboxMitarbeiterAuftragnehmerVerpflichtungsgesetz)[
  Für die Aufgaben gemäß Anlage Nr. #fieldValue(value: mitarbeiterAuftragnehmerVerpflichtungsgesetz) ist nur Personal einzusetzen, welches bereit ist, sich aufgrund des Verpflichtungsgesetzes verpflichten zu lassen.
]
#option(checkboxMitarbeiterAuftragnehmerMindestanforderungenGemaessAnlage)[
  Mindestanforderungen an das einzusetzende Personal des Auftragnehmers (z.B. Sicherheitsüberprüfung nach SÜG) ergeben sich aus Anlage Nr. #fieldValue(value: mitarbeiterAuftragnehmerMindestanforderungenGemaessAnlage).
]

== Allgemeine Sicherheitsanforderungen
Der Auftragnehmer verpflichtet sich für die Laufzeit des Vertrages

#option(checkboxMitarbeiterVerpflichtungITSicherheitGemaessAnlage)[
  bei der Erbringung der vertraglichen Leistungen die Regelungen zur IT-Sicherheit gemäß Anlage Nr. #fieldValue(value: mitarbeiterVerpflichtungITSicherheitGemaessAnlage) zu beachten.
]
#option(checkboxMitarbeiterVerpflichtungGeheimschutzGemaessAnlage)[
  der Geheimschutzbetreuung gemäß Anlage Nr. #fieldValue(value: mitarbeiterVerpflichtungGeheimschutzGemaessAnlage) zu unterstellen.
]
#option(checkboxMitarbeiterVerpflichtungSicherheitEinsatzortGemaessAnlage)[
  die Regelungen des Auftraggebers zur Sicherheit am Einsatzort gemäß Anlage Nr. #fieldValue(value: mitarbeiterVerpflichtungSicherheitEinsatzortGemaessAnlage) zu beachten.
]
#option(checkboxMitarbeiterVerpflichtungWeitereRegelungen)[
  folgende weitere Regelungen einzuhalten: #fieldValue(value: mitarbeiterVerpflichtungWeitereRegelungen).
]

== Prüfrechte

#option(checkboxPruefungDurchWeitereOrganisationen)[
  Ergänzend zu Ziffer 6.4 EVB-IT Cloud-AGB und unbeschadet der gesetzlichen Regelungen, sind nicht nur der Auftraggeber und vom Auftraggeber zur Berufsverschwiegenheit verpflichtete Prüfungsgesellschaften, sondern auch

  #option(checkboxPruefungDurchAuftraggeber)[
    die Aufsichtsorgane des Auftraggebers
  ]
  #option(checkboxPruefungDurchBSI)[
    das BSI
  ]
  #option(checkboxPruefungDurchBenanntePruefer)[
    folgende von ihm benannte Prüfer: #fieldValue(value: mitarbeiterVerpflichtungWeitereRegelungen)
  ]

  zur Prüfung der Einhaltung der Maßnahmen berechtigt. Der Auftragnehmer gewährt die dafür notwendigen Zutritts-, Einsichts- und Auskunftsrechte und unterstützt im erforderlichen Ausmaß.
]
#option(checkboxPruefungGemaessAnlage)[
  Ergänzend zu bzw. abweichend von Ziffer 6.4 EVB-IT Cloud-AGB ergeben sich Regelungen zu Prüfrechten aus Anlage Nr. #fieldValue(value: pruefungGemaessAnlage).
]

== Unterauftragnehmer

#option(checkboxUnterauftragnehmer)[
  In Bezug auf den Einsatz von Unterauftragnehmern gilt anstelle von Ziffer 15.1 EVB-IT Cloud-AGB die Ziffer 15.3 EVB-IT Cloud-AGB.
]

== Vertraulichkeit

#option(checkboxVertraulichkeitGemaessAnlage)[
  Ergänzend zu bzw. abweichend von Ziffer 6.3 EVB-IT Cloud-AGB ergeben sich Regelungen zur Vertraulichkeit aus Anlage Nr. #fieldValue(value: vertraulichkeitGemaessAnlage).
]

== Haftpflichtversicherung

#option(checkboxNachweisHaftpflichtversicherung)[
  Der Nachweis einer Haftpflichtversicherung gemäß Ziffer 21 EVB-IT Cloud-AGB wird vereinbart.
]




= Sonstige Vereinbarungen

#option(checkboxSonstigeVereinbarungen)[
  Sonstige Vereinbarungen: #fieldValue(value: sonstigeVereinbarungen).
]
#option(checkboxSonstigeVereinbarungenGemaessAnlage)[
  Die sonstigen Vereinbarungen ergeben sich aus Anlage Nr. #fieldValue(value: sonstigeVereinbarungenGemaessAnlage).
]

// ==========================================
// 4. SIGNATURE SECTION
// ==========================================

#v(3cm)
#grid(
  columns: (1fr, 1fr),
  gutter: 2cm,
  [
    #fieldValue(length: 100%) \
    #text(size: 9pt)[Ort, Datum]
    #v(1.5cm)
    #fieldValue(length: 100%) \
    #text(size: 9pt)[Auftraggeber]
  ],
  [
    #fieldValue(length: 100%) \
    #text(size: 9pt)[Ort, Datum]
    #v(1.5cm)
    #fieldValue(length: 100%) \
    #text(size: 9pt)[Auftragnehmer]
  ],
)
