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
  contractTitle: "EVB-IT Überlassungsvertrag Typ B",
  contractVersion: "Version 1.0.1",
  contractDate: "(Stand: 01.03.2026)",
)

// ==========================================
// 2. HELPER FUNCTIONS
// ==========================================

// Checks a list of variables.
// Returns 'true' if a boolean is 'true' OR a string is not empty.
#let isRowActive(vars) = {
  let listOfVariables = if type(vars) != array { (vars,) } else { vars }
  listOfVariables.any(var => {
    if type(var) == bool { return var }
    if type(var) == str { return var.trim() != "" }
    return false
  })
}

// ==========================================
// 3. VARIABLES FOR THIS CONTRACT
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

// Vertragsgegenstand und Vergütung
#let vertragsgegenstandMonatlicheVerguetung = ""

// Vertragsbestandteile
#let anlagenVertragsbestandteil = (
  (
    bezeichnung: "",
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

// Überlassung Standardsoftware
#let ueberlasseneStandardsoftware = (
  (
    bezeichnung: "",
    anzahl: "",
    liefertermin: "",
    mindestvertragsdauer: "",
    ueberlassungBeginn: "",
    ueberlassungEnde: "",
    ausnahmeNacherfuellungspflicht: "",
    exportkontrollvorschriften: "",
    monatlicheVerguetungEinzelpreis: "",
    monatlicheVerguetungGesamt: "",
  ),
)
#let ueberlasseneStandardsoftwareZeilen = for (index, software) in ueberlasseneStandardsoftware.enumerate() {
  (
    str(index + 1),
    fieldValue(value: software.bezeichnung, length: 100%),
    fieldValue(value: software.anzahl, length: 100%),
    fieldValue(value: software.liefertermin, length: 100%),
    fieldValue(value: software.mindestvertragsdauer, length: 100%),
    fieldValue(value: software.ueberlassungBeginn, length: 100%),
    fieldValue(value: software.ueberlassungEnde, length: 100%),
    fieldValue(value: software.ausnahmeNacherfuellungspflicht, length: 100%),
    fieldValue(value: software.exportkontrollvorschriften, length: 100%),
    fieldValue(value: software.monatlicheVerguetungEinzelpreis, length: 100%),
    fieldValue(value: software.monatlicheVerguetungGesamt, length: 100%),
  )
}
#let ueberlasseneStandardsoftwareGesamtpreisMonatlichNetto = ""

// Rechnungsstellung
#let checkboxRechnungsstellungMonatlich = false
#let checkboxRechnungsstellungQuartalsweise = false
#let checkboxRechnungsstellungJährlich = false
#let rechnungsstellungJährlichZum = ""
#let checkboxRechnungsstellungEinmalig = false
#let rechnungsstellungEinmaligZum = ""
#let checkboxRechnungsstellungIndividuell = false
#let rechnungsstellungIndividuell = ""

// Vergütungsvorbehalt
#let checkboxVerguetungsvorbehaltGemaessEVBAGB = false

#let checkboxVerguetungsvorbehaltGemaessAnlage = false
#let verguetungsvorbehaltGemaessAnlage = ""

// Ergänzende Beschreibung des Vertragsgegenstandes
#let checkboxVertragsgegenstandAngebotAuftragnehmer = false
#let vertragsgegenstandAngebotAuftragnehmerDatum = ""
#let vertragsgegenstandAngebotAuftragnehmerAnlageNr = ""

#let checkboxVertragsgegenstandLeistungsbeschreibungAuftraggeber = false
#let vertragsgegenstandLeistungsbeschreibungAuftraggeberDatum = ""
#let vertragsgegenstandLeistungsbeschreibungAuftraggeberAnlageNr = ""

#let checkboxVertragsgegenstandWeitereDokumente = false
#let vertragsgegenstandWeitereDokumenteBezeichnungen = ""
#let vertragsgegenstandWeitereDokumenteAnlageNr = ""

#let checkboxVertragsgegenstandReihenfolgeObige = false
#let checkboxVertragsgegenstandReihenfolgeFestlegung = false
#let vertragsgegenstandReihenfolgeFestlegung = ""
#let checkboxVertragsgegenstandReihenfolgeGemaessAnlage = false
#let vertragsgegenstandReihenfolgeGemaessAnlage = ""

// Zugesicherte Eigenschaften
#let checkboxZugesicherteEigenschaftenAuftragnehmer = false
#let zugesicherteEigenschaftenAuftragnehmer = ""

#let checkboxZugesicherteEigenschaftenGemaessAnlage = false
#let zugesicherteEigenschaftenGemaessAnlage = ""

// Dokumentation
#let dokumentationSpracheForm = ""

#let checkboxDokumentationVervielfaeltigungAnzahl = false
#let dokumentationVervielfaeltigungAnzahlVerweisAnlage = ""
#let dokumentationVervielfaeltigungAnzahl = ""

#let checkboxDokumentationVervielfaeltigungGemaessAnlage = false
#let dokumentationVervielfaeltigungGemaessAnlage = ""

// Lieferanschrift
#let lieferanschriftOrganisationName = ""
#let lieferanschriftStraße = ""
#let lieferanschriftHausnummer = ""
#let lieferanschriftPostleitzahl = ""
#let lieferanschriftOrt = ""

#let erfuellungsortOrganisationName = ""
#let erfuellungsortStraße = ""
#let erfuellungsortHausnummer = ""
#let erfuellungsortPostleitzahl = ""
#let erfuellungsortOrt = ""

// Besondere Nutzungsvereinbarungen - Mehrfachnutzung
#let checkboxMehrfachnutzungGleichzeitigAnzahl = false
#let mehrfachnutzungGleichzeitigAnzahlVerweisAnlage = ""
#let mehrfachnutzungGleichzeitigAnzahl = ""

#let checkboxMehrfachnutzungGemaessAnlage = false
#let mehrfachnutzungGemaessAnlage = ""

// Besondere Nutzungsvereinbarungen - Systemumgebung
#let checkboxSystemumgebungSpezifischeUmgebung = false
#let systemumgebungSpezifischeUmgebungVerweisAnlage = ""
#let systemumgebungSpezifischeUmgebungBeschreibung = ""

#let checkboxSystemumgebungBeliebigeUmgebung = false
#let systemumgebungBeliebigeUmgebungVerweisAnlage = ""

#let checkboxSystemumgebungGemaessAnlage = false
#let systemumgebungGemaessAnlage = ""

// Besondere Nutzungsvereinbarungen - Anderweitige Nutzungsvereinbarungen
#let checkboxAnderweitigeNutzungsvereinbarungGemaessAnlage = false
#let anderweitigeNutzungsvereinbarungGemaessAnlage = ""

// Kopier- oder Nutzungssperren
#let checkboxKopierNutzungssperrenBekannt = false
#let kopierNutzungssperrenBekanntGemaessAnlage = ""

// Kündigung
#let checkboxAbweichendeKuendigungsfrist = false
#let abweichendeKuendigungsfrist = ""

// Kopie zu Prüf- und Archivierungszwecken bei Kündigung
#let checkboxKopieErlaubtOrdentlicheKuendigung = false
#let checkboxKopieErlaubtOrdentlicheKuendigungGegenVerguetung = false
#let kopieErlaubtOrdentlicheKuendigungGegenVerguetungGemaessAnlage = ""
#let checkboxKopieErlaubtOrdentlicheKuendigungOhneVerguetung = false

#let checkboxKopieErlaubtAusserordentlicheKuendigung = false
#let checkboxKopieErlaubtAusserordentlicheKuendigungGegenVerguetung = false
#let kopieErlaubtAusserordentlicheKuendigungGegenVerguetungGemaessAnlage = ""
#let checkboxKopieErlaubtAusserordentlicheKuendigungOhneVerguetung = false

// Ansprechpartner
#let ansprechpartnerAuftraggeber = ""

#let ansprechpartnerAuftragnehmer = ""

// Störungsmeldung
#let adresseStoerungsmeldungOrganisation = ""

#let adresseStoerungsmeldungOrganisationseinheit = ""

#let checkboxAdresseStoerungsmeldungPostanschrift = false
#let adresseStoerungsmeldungPostanschrift = ""

#let checkboxAdresseStoerungsmeldungTelefon = false
#let adresseStoerungsmeldungTelefon = ""

#let checkboxAdresseStoerungsmeldungFax = false
#let adresseStoerungsmeldungFax = ""

#let checkboxAdresseStoerungsmeldungMail = false
#let adresseStoerungsmeldungMail = ""

#let checkboxAdresseStoerungsmeldungWeb = false
#let adresseStoerungsmeldungWeb = ""

#let stoerungsmeldungAnnahmeGeschaeftszeiten = ""

#let checkboxBereitschaftszeitenGemaessAnlage = false
#let bereitschaftszeitenGemaessAnlage = ""

// Telefonische Unterstützung
#let checkboxTelefonischeUnterstuetzungAuftraggeberGemaessAnlage = false
#let telefonischeUnterstuetzungAuftraggeberGemaessAnlage = ""

// Versicherung
#let versicherungNachweis = false

// Sonstige Vereinbarungen
#let sonstigeVereinbarungen = (
  (
    ueberschrift: "",
    text: "",
  ),
)

// ==========================================
// 4. CONTENT
// ==========================================

#align(center)[
  #heading(
    outlined: false,
    bookmarked: false,
    numbering: none,
  )[Vertrag über die zeitlich befristete Überlassung von Standardsoftware]
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




= Vertragsgegenstand und Vergütung

==
Zeitlich befristete Überlassung von Standardsoftware\* gemäß Nummer 3.

==
Für alle in diesem Vertrag genannten Beträge gilt einheitlich der Euro als Währung.

==
Die Leistungen des Auftragnehmers werden gegen monatliche Vergütung gemäß Nummer 3.1 in Höhe von #fieldValue(value: vertragsgegenstandMonatlicheVerguetung) zuzüglich der jeweils gültigen Umsatzsteuer vergütet.




= Vertragsbestandteile

==
Es gelten nacheinander als Vertragsbestandteile:
- #context {
    let endOfContract = query(<ende-vertrag>).first().location()
    let lastPage = counter(page).at(endOfContract).at(0)

    [dieser Vertrag (Seite 1 bis #lastPage) mit Anlage(n):]
  }

#table(
  columns: (auto, 1fr, auto, auto),
  inset: 0.5em,
  align: horizon,
  table.header(
    repeat: true,
    [*Anlage Nr.*], [*Bezeichnung*], [*Datum/Version*], [*Anzahl Seiten*],
  ),
  ..anlagenVertragsbestandteilZellen.flatten(),
)

- Ergänzende Vertragsbedingungen für die zeitlich befristete Überlassung von Standardsoftware\* (EVB-IT Überlassung Typ B) in der bei Bereitstellung der Vergabeunterlagen geltenden Fassung einschließlich des Musters 1
- Verdingungsordnung für Leistungen -- ausgenommen Bauleistungen -- Teil B (VOL/B) in der bei Bereitstellung der Vergabeunterlagen geltenden Fassung.

EVB-IT Überlassung Typ B-AGB stehen unter #link("https://evb-it.gov.de")[evb-it.gov.de] zur Einsichtnahme bereit.
Die VOL/B wurde im Bundesanzeiger AT Nr. 178a vom 23. September 2003 veröffentlicht.

Die mit \* gekennzeichneten Begriffe sind am Ende der EVB-IT Überlassung Typ B definiert.

==
Weitere Geschäftsbedingungen sind ausgeschlossen, soweit in diesem Vertrag nichts anderes vereinbart ist.




= Zeitlich befristete Überlassung von Standardsoftware

==
Der Auftragnehmer überlässt zeitlich befristet dem Auftraggeber nachstehend aufgeführte Standardsoftware\* gegen monatliche Vergütung:

#block[
  #set text(size: 8pt)

  #table(
    columns: (4%, 25%, 6%, 8%, 6%, 8%, 8%, 5%, 5%, 12%, 15%),
    inset: 0.5em,
    align: center + horizon,
    table.header(
      repeat: true,
      [*Lfd. Nr.*],
      [*Produktbezeichnung und -beschreibung\ Produkt-Nr.*],
      [*Anzahl*],
      [*Lieferzeitraum/ -termin*],
      [*MVD#footnote[Mindestvertragsdauer\*, gerechnet ab vereinbartem Beginn der Überlassungsdauer.] in Monaten*],
      [*Überlassungsdauer Beginn*],
      [*Überlassungsdauer Ende*],
      [*KNV#footnote[Keine Nacherfüllungsverpflichtung; die mit „x“ gekennzeichnete Standardsoftware\* ist von der Verpflichtung zur Nacherfüllung gemäß Ziffer 7.6 EVB-IT Überlassung Typ B ausgenommen. Ansprüche auf Herabsetzung der Vergütung, Kündigung und ggf. Schadensersatz gemäß Ziffer 7.5.2 EVB-IT Überlassung Typ B bleiben unberührt.]*],
      [*EXP#footnote[Die mit „x“ gekennzeichnete Standardsoftware\* unterliegt US-amerikanischen Exportkontrollvorschriften gemäß Ziffer 4.3 EVB-IT Überlassung Typ B.]*],
      [*Monatlicher Einzelpreis (netto)*],
      [*Summe der monatlichen Vergütung*],
    ),
    ..ueberlasseneStandardsoftwareZeilen.flatten(),
    table.cell(colspan: 10, align: right)[*Gesamtpreis monatlich (netto)*],
    [#fieldValue(value: ueberlasseneStandardsoftwareGesamtpreisMonatlichNetto, length: 100%)],
  )
]

== Rechnungsstellung
Die Rechnungsstellung erfolgt

#option(checkboxRechnungsstellungMonatlich)[
  monatlich (zahlbar bis zum 15. eines jeden Monats)
]
#option(checkboxRechnungsstellungQuartalsweise)[
  quartalsweise (zahlbar bis zum 15. des zweiten Quartalsmonats)
]
#option(checkboxRechnungsstellungJährlich)[
  jährlich (zahlbar bis zum #fieldValue(value: rechnungsstellungJährlichZum))
]
#option(checkboxRechnungsstellungEinmalig)[
  einmalig zum #fieldValue(value: rechnungsstellungEinmaligZum)
]
#option(checkboxRechnungsstellungIndividuell)[
  #fieldValue(value: rechnungsstellungIndividuell)
]

== Vergütungsvorbehalt
Es wird ein Vergütungsvorbehalt vereinbart

#option(checkboxVerguetungsvorbehaltGemaessEVBAGB)[
  gemäß Ziffer 5.2 EVB-IT Überlassung Typ B.
]
#option(checkboxVerguetungsvorbehaltGemaessAnlage)[
  anderweitige Vereinbarung gemäß Anlage Nr. #fieldValue(value: verguetungsvorbehaltGemaessAnlage).
]

== Ergänzende Beschreibung des Vertragsgegenstandes
Die Beschreibung der Standardsoftware\* ergibt sich ergänzend aus

#option(checkboxVertragsgegenstandAngebotAuftragnehmer)[
  folgenden Teilen des Angebotes des Auftragnehmers vom #fieldValue(value: vertragsgegenstandAngebotAuftragnehmerDatum), Anlage(n) Nr. #fieldValue(value: vertragsgegenstandAngebotAuftragnehmerAnlageNr).
]
#option(checkboxVertragsgegenstandLeistungsbeschreibungAuftraggeber)[
  folgenden Teilen der Leistungsbeschreibung des Auftraggebers vom #fieldValue(value: vertragsgegenstandLeistungsbeschreibungAuftraggeberDatum), Anlage(n) Nr. #fieldValue(value: vertragsgegenstandLeistungsbeschreibungAuftraggeberAnlageNr).
]
#option(checkboxVertragsgegenstandWeitereDokumente)[
  folgenden weiteren Dokumenten: #fieldValue(value: vertragsgegenstandWeitereDokumenteBezeichnungen), Anlage(n) Nr. #fieldValue(value: vertragsgegenstandWeitereDokumenteAnlageNr).
]

Es gelten die Dokumente in

#option(checkboxVertragsgegenstandReihenfolgeObige)[
  obiger Reihenfolge.
]
#option(checkboxVertragsgegenstandReihenfolgeFestlegung)[
  folgender Reihenfolge: #fieldValue(value: vertragsgegenstandReihenfolgeFestlegung).
]
#option(checkboxVertragsgegenstandReihenfolgeGemaessAnlage)[
  Anderweitige Vereinbarung gemäß Anlage Nr. #fieldValue(value: vertragsgegenstandReihenfolgeGemaessAnlage).
]




= Zugesicherte Eigenschaften

#option(checkboxZugesicherteEigenschaftenAuftragnehmer)[
  Folgende Eigenschaften werden vom Auftragnehmer zugesichert:\ #fieldValue(value: zugesicherteEigenschaftenAuftragnehmer)
]
#option(checkboxZugesicherteEigenschaftenGemaessAnlage)[
  Ergänzende Vereinbarung gemäß Anlage Nr. #fieldValue(value: zugesicherteEigenschaftenGemaessAnlage)
]




= Dokumentation

== Sprache / Form
ergänzend / abweichend von Ziffer 2.2 EVB-IT Überlassung Typ B.

#fieldValue(value: dokumentationSpracheForm)

== Vervielfältigungsrecht

#option(checkboxDokumentationVervielfaeltigungAnzahl)[
  Die Dokumentation der Standardsoftware\* gemäß Nummer 3.1 lfd. Nr. #fieldValue(value: dokumentationVervielfaeltigungAnzahlVerweisAnlage) kann #fieldValue(value: dokumentationVervielfaeltigungAnzahl)fach vervielfältigt werden.
]
#option(checkboxDokumentationVervielfaeltigungGemaessAnlage)[
  Ergänzende Vereinbarung gemäß Anlage Nr. #fieldValue(value: dokumentationVervielfaeltigungGemaessAnlage).
]




= Lieferanschrift
#fieldValue(value: lieferanschriftOrganisationName, length: 5cm)\
#fieldValue(value: lieferanschriftStraße, length: 5cm) #fieldValue(value: lieferanschriftHausnummer)\
#fieldValue(value: lieferanschriftPostleitzahl) #fieldValue(value: lieferanschriftOrt, length: 5cm)

*Erfüllungsort* (falls abweichend von der Lieferanschrift):

#fieldValue(value: erfuellungsortOrganisationName, length: 5cm)\
#fieldValue(value: erfuellungsortStraße, length: 5cm) #fieldValue(value: erfuellungsortHausnummer)\
#fieldValue(value: erfuellungsortPostleitzahl) #fieldValue(value: erfuellungsortOrt, length: 5cm)




= Besondere Nutzungsvereinbarungen
gemäß Ziffer 3.2 EVB-IT Überlassung Typ B.

== Mehrfachnutzung

#option(checkboxMehrfachnutzungGleichzeitigAnzahl)[
  Die Standardsoftware\* gemäß Nummer 3.1 lfd. Nr. #fieldValue(value: mehrfachnutzungGleichzeitigAnzahlVerweisAnlage) darf bis zu #fieldValue(value: mehrfachnutzungGleichzeitigAnzahl)fach gleichzeitig genutzt werden.
]
#option(checkboxMehrfachnutzungGemaessAnlage)[
  Ergänzende Vereinbarung gemäß Anlage Nr. #fieldValue(value: mehrfachnutzungGemaessAnlage).
]

== Systemumgebung

#option(checkboxSystemumgebungSpezifischeUmgebung)[
  Die Standardsoftware\* gemäß Nummer 3.1 lfd. Nr. #fieldValue(value: systemumgebungSpezifischeUmgebungVerweisAnlage) wird zur Nutzung in folgender Systemumgebung\* freigegeben: #fieldValue(value: systemumgebungSpezifischeUmgebungBeschreibung).
]
#option(checkboxSystemumgebungBeliebigeUmgebung)[
  Die Standardsoftware\* gemäß Nummer 3.1 lfd. Nr. #fieldValue(value: systemumgebungBeliebigeUmgebungVerweisAnlage) wird zur Nutzung in einer beliebigen Systemumgebung\* freigegeben.
]
#option(checkboxSystemumgebungGemaessAnlage)[
  Ergänzende Vereinbarung gemäß Anlage Nr. #fieldValue(value: systemumgebungGemaessAnlage).
]

== Anderweitige Nutzungsvereinbarungen

#option(checkboxAnderweitigeNutzungsvereinbarungGemaessAnlage)[
  Gemäß Anlage Nr. #fieldValue(value: anderweitigeNutzungsvereinbarungGemaessAnlage).
]




= Kopier- oder Nutzungssperren
gemäß Ziffer 3.7 EVB-IT Überlassung Typ B.

#option(checkboxKopierNutzungssperrenBekannt)[
  Dem Auftragnehmer sind Kopier- oder Nutzungssperren in der Standardsoftware\* bekannt.
  Einzelheiten siehe Anlage Nr. #fieldValue(value: kopierNutzungssperrenBekanntGemaessAnlage).
]




= Kündigung
abweichend von Ziffer 4.1 EVB-IT Überlassung Typ B.

#option(checkboxAbweichendeKuendigungsfrist)[
  Es wird eine Kündigungsfrist von #fieldValue(value: abweichendeKuendigungsfrist) Monaten vereinbart.
]




= Kopie zu Prüf- und Archivierungszwecken
#option(checkboxKopieErlaubtOrdentlicheKuendigung)[
  Der Auftraggeber ist berechtigt, nach dem Ende der Überlassungsdauer (wegen Zeitablauf, wegen Kündigung durch den Auftraggeber oder ordentlicher Kündigung durch den Auftragnehmer) eine Kopie der Standardsoftware\* einschließlich der Dokumentation zu Prüf- und Archivierungszwecken

  #option(checkboxKopieErlaubtOrdentlicheKuendigungGegenVerguetung)[
    gegen gesonderte Vergütung gemäß Anlage Nr. #fieldValue(value: kopieErlaubtOrdentlicheKuendigungGegenVerguetungGemaessAnlage)
  ]
  #option(checkboxKopieErlaubtOrdentlicheKuendigungOhneVerguetung)[
    ohne gesonderte Vergütung
  ]

  zu behalten.
]
#option(checkboxKopieErlaubtAusserordentlicheKuendigung)[
  Der Auftraggeber ist berechtigt, nach dem Ende der Überlassungsdauer (wegen außerordentlicher Kündigung durch den Auftragnehmer) eine Kopie der Standardsoftware\* einschließlich der Dokumentation zu Prüf- und Archivierungszwecken

  #option(checkboxKopieErlaubtAusserordentlicheKuendigungGegenVerguetung)[
    gegen gesonderte Vergütung gemäß Anlage Nr. #fieldValue(value: kopieErlaubtAusserordentlicheKuendigungGegenVerguetungGemaessAnlage)
  ]
  #option(checkboxKopieErlaubtAusserordentlicheKuendigungOhneVerguetung)[
    ohne gesonderte Vergütung
  ]

  zu behalten.
]




= Verantwortlicher Ansprechpartner
des Auftraggebers: #fieldValue(value: ansprechpartnerAuftraggeber)

des Auftragnehmers: #fieldValue(value: ansprechpartnerAuftragnehmer)




= Störungsmeldung und Nacherfüllung

== Adresse für Störungsmeldung
gemäß Ziffer 7.4 EVB-IT Überlassung Typ B.

Die Störungsmeldung erfolgt auf einem Formular entsprechend Muster 1 zu EVB-IT Überlassung Typ B -- Störungsmeldeformular -- an:

#let kontaktdatenDaten = (
  (
    active: isRowActive(
      (
        adresseStoerungsmeldungOrganisation
      ),
    ),
    kontakt: "Name / Firma:",
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungOrganisation, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        adresseStoerungsmeldungOrganisationseinheit
      ),
    ),
    kontakt: "Organisationseinheit / Abteilung:",
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungOrganisationseinheit, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        checkboxAdresseStoerungsmeldungPostanschrift
      ),
    ),
    kontakt: [
      #option(checkboxAdresseStoerungsmeldungPostanschrift)[Postanschrift:]
    ],
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungPostanschrift, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        checkboxAdresseStoerungsmeldungTelefon
      ),
    ),
    kontakt: [
      #option(checkboxAdresseStoerungsmeldungTelefon)[Telefon:]
    ],
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungTelefon, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        checkboxAdresseStoerungsmeldungFax
      ),
    ),
    kontakt: [
      #option(checkboxAdresseStoerungsmeldungFax)[Fax:]
    ],
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungFax, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        checkboxAdresseStoerungsmeldungMail
      ),
    ),
    kontakt: [
      #option(checkboxAdresseStoerungsmeldungMail)[E-Mail:]
    ],
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungMail, length: 100%)
    ],
  ),
  (
    active: isRowActive(
      (
        checkboxAdresseStoerungsmeldungWeb
      ),
    ),
    kontakt: [
      #option(checkboxAdresseStoerungsmeldungWeb)[Web-Adresse:]
    ],
    kontaktdaten: [
      #fieldValue(value: adresseStoerungsmeldungWeb, length: 100%)
    ],
  ),
)

#context {
  let currentMode = modeState.get()

  let rowsToBeShown = if currentMode == "template" {
    kontaktdatenDaten
  } else {
    kontaktdatenDaten.filter(zeile => zeile.active == true)
  }

  let kontaktZellen = ()

  for zeile in rowsToBeShown {
    kontaktZellen += (
      zeile.kontakt,
      zeile.kontaktdaten,
    )
  }

  table(
    columns: (40%, 60%),
    inset: 0.5em,
    align: left + horizon,
    table.header(
      repeat: true,
      [*Art des Kontakts*], [*Kontaktdaten*],
    ),
    ..kontaktZellen,
  )
}

== Annahme der Störungsmeldung, Ergänzende Vereinbarungen zu Bereitschafts- und Reaktionszeiten
Die Störungsmeldung wird während folgender üblicher Geschäftszeit des Auftragnehmers angenommen: #fieldValue(value: stoerungsmeldungAnnahmeGeschaeftszeiten)

#option(checkboxBereitschaftszeitenGemaessAnlage)[
  Ergänzende Vereinbarung zu Bereitschafts- und Reaktionszeiten gemäß Anlage Nr. #fieldValue(value: bereitschaftszeitenGemaessAnlage).
]




= Telefonische Unterstützung

#option(checkboxTelefonischeUnterstuetzungAuftraggeberGemaessAnlage)[
  Telefonische Unterstützung des Auftraggebers erfolgt nach gesonderter Vereinbarung gemäß Anlage Nr. #fieldValue(value: telefonischeUnterstuetzungAuftraggeberGemaessAnlage).
]




= Versicherung

#option(versicherungNachweis)[
  Der Auftragnehmer weist nach, dass die Haftungshöchstsummen gemäß Ziffer 9.2.1 EVB-IT Überlassung Typ B durch eine Versicherung abgedeckt sind, die im Rahmen und Umfang einer marktüblichen deutschen Industriehaftpflichtversicherung oder einer vergleichbaren Versicherung aus einem Mitgliedsstaat der EU entspricht.
]




= Sonstige Vereinbarungen
#for (index, klausel) in sonstigeVereinbarungen.enumerate() {
  if klausel.ueberschrift != "" and klausel.text != "" {
    [== #klausel.ueberschrift]
    klausel.text
  }
}

// ==========================================
// 5. SIGNATURE SECTION
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

<ende-vertrag>
