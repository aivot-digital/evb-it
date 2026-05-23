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
  contractTitle: "EVB-IT Pflegevertrag S (Langfassung)",
  contractVersion: "Version 3.0.0",
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

// Vertragsgegenstand
#let vertragsgegenstaendigeStandardsoftware = ""

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

#let checkboxAnlagenVertragsbestandteileReihenfolge = false
#let anlagenVertragsbestandteileReihenfolge = ""

// Vereinbarte Leistungen
#let checkboxVereinbarteLeistungenUeberlassung = false

#let checkboxVereinbarteLeistungenStoerungsbeseitigung = false

#let checkboxVereinbarteLeistungenHotline = false

#let checkboxVereinbarteLeistungenSonstigePflegeleistungen = false

// Standardsoftware die Gegenstand der Pflegeleistung ist
#let zuPflegendeStandardsoftware = (
  (
    bezeichnung: "",
    lizenzartUndAnzahl: "",
  ),
)
#let zuPflegendeStandardsoftwareZeilen = for (index, software) in zuPflegendeStandardsoftware.enumerate() {
  (
    str(index + 1),
    fieldValue(value: software.bezeichnung, length: 100%),
    fieldValue(value: software.lizenzartUndAnzahl, length: 100%),
  )
}

// Beginn / Dauer der Pflegeleistungen
#let checkboxBeginnPflegeleistungDatum = false
#let beginnPflegeleistungDatum = ""

#let checkboxBeginnPflegeleistungTagNachLieferung = false

#let checkboxBeginnPflegeleistungGemaessAnlage = false
#let beginnPflegeleistungGemaessAnlage = ""

#let checkboxDauerPflegeleistungUnbefristet = false
#let checkboxDauerPflegeleistungUnbefristetMindestdauer = false
#let dauerPflegeleistungUnbefristetMindestdauer = ""

#let checkboxDauerPflegeleistungInMonaten = false
#let dauerPflegeleistungInMonaten = ""

#let checkboxDauerPflegeleistungGemaessAnlage = false
#let dauerPflegeleistungGemaessAnlage = ""

// Kündigung von Pflegeleistungen
#let checkboxKuendigungPflegeleistungAbweichendEVBAGBFristInMonaten = false
#let kuendigungPflegeleistungAbweichendEVBAGBFristInMonaten = ""
#let kuendigungPflegeleistungAbweichendEVBAGBFristInMonatenKuendigungZum = ""

#let checkboxKuendigungPflegeleistungAbweichendEVBAGBKeineTeilkuendigung = false

#let checkboxKuendigungPflegeleistungAbweichendEVBAGBAusserbetriebnahme = false
#let kuendigungPflegeleistungAbweichendEVBAGBAusserbetriebnahmeAnlage = ""

#let checkboxKuendigungPflegeleistungAbweichendEVBAGBSonderkuendigung = false
#let kuendigungPflegeleistungAbweichendEVBAGBSonderkuendigungAnlage = ""

// Vergütung für die Pflegeleistungen
#let checkboxVerguetungPauschalfestpreisMonatlich = false
#let verguetungPauschalfestpreisMonatlich = ""
#let checkboxVerguetungPauschalfestpreisMonatlichAbweichenderZeitraum = false
#let verguetungPauschalfestpreisMonatlichAbweichenderZeitraumDatum = ""
#let verguetungPauschalfestpreisMonatlichAbweichenderZeitraumPreis = ""
#let checkboxVerguetungPauschalfestpreisMonatlichBisEndeSachmaengelansprueche = false
#let verguetungPauschalfestpreisMonatlichBisEndeSachmaengelansprueche = ""

#let checkboxVerguetungPauschalfestpreisSummeEinzelnePflegeleistungen = false
#let pflegeleistungenVerguetungen = (
  (
    softwareReferenz: "",
    verguetungsanteil: "",
    reduzierungVerguetungBisVerjaehrung: "",
    reduzierungVerguetungBisDatumStart: "",
    reduzierungVerguetungBisDatumEnde: "",
    reduzierungVerguetungBisDatum: "",
  ),
)
#let pflegeleistungenVerguetungenZeilen = for (index, verguetung) in pflegeleistungenVerguetungen.enumerate() {
  (
    str(index + 1),
    fieldValue(value: verguetung.softwareReferenz, length: 100%),
    fieldValue(value: verguetung.verguetungsanteil, length: 100%),
    fieldValue(value: verguetung.reduzierungVerguetungBisVerjaehrung, length: 100%),
    [
      Zeitraum von #fieldValue(value: verguetung.reduzierungVerguetungBisDatumStart, length: 1.5cm) bis #fieldValue(value: verguetung.reduzierungVerguetungBisDatumEnde, length: 1.5cm)\
      Vergütungsanteil: #fieldValue(value: verguetung.reduzierungVerguetungBisDatum)
    ],
  )
}

#let checkboxVerguetungPauschalfestpreisEinmalig = false
#let verguetungPauschalfestpreisEinmalig = ""

#let checkboxVerguetungPauschalfestpreisLeistungenAusgenommen = false

#let checkboxVerguetungGemaessAnlage = false
#let verguetungGemaessAnlage = ""

// Preisanpassung
#let checkboxPreisanpassung = false
#let checkboxPreisanpassungGemaessEVBAGB = false
#let checkboxPreisanpassungGemaessEVBAGBMonatlichePflegepauschale = false
#let checkboxPreisanpassungGemaessEVBAGBPreiskategorien = false
#let checkboxPreisanpassungGemaessAnlage = false
#let preisanpassungGemaessAnlage = ""

// Fälligkeit und Zahlung
#let checkboxFaelligkeitQuartalsweise = false

#let checkboxFaelligkeitJaehrlich = false
#let faelligkeitJaehrlich = ""

#let checkboxFaelligkeitEinmalig = false
#let faelligkeitEinmalig = ""

#let checkboxFaelligkeitGemaessAnlage = false
#let faelligkeitGemaessAnlage = ""

#let checkboxZahlungsfristAbweichendEVBAGB = false
#let zahlungsfristAbweichendEVBAGB = ""

// Rechnungsadresse
#let checkboxRechnungsadresseVerordnungBund = false

#let checkboxRechnungsadresseVerordnungLand = false
#let rechnungsadresseVerordnungLand = ""

#let rechnungsadresseLeitwegID = ""
#let rechnungsadresseZusatzfelder = ""
#let rechnungsadresseAnlageNr = ""

#let checkboxRechnungsadresseAbweichend = false
#let rechnungsadresseAbweichendRegelung = ""

// Servicezeiten für die Pflegeleistung
#let servicezeitenStoerungsbeseitigungMoBisDoStart = ""
#let servicezeitenStoerungsbeseitigungMoBisDoEnde = ""
#let servicezeitenStoerungsbeseitigungFrStart = ""
#let servicezeitenStoerungsbeseitigungFrEnde = ""
#let servicezeitenStoerungsbeseitigungSaStart = ""
#let servicezeitenStoerungsbeseitigungSaEnde = ""
#let servicezeitenStoerungsbeseitigungSoStart = ""
#let servicezeitenStoerungsbeseitigungSoEnde = ""
#let servicezeitenStoerungsbeseitigungFeiertagStart = ""
#let servicezeitenStoerungsbeseitigungFeiertagEnde = ""

#let servicezeitenHotlineMoBisDoStart = ""
#let servicezeitenHotlineMoBisDoEnde = ""
#let servicezeitenHotlineFrStart = ""
#let servicezeitenHotlineFrEnde = ""
#let servicezeitenHotlineSaStart = ""
#let servicezeitenHotlineSaEnde = ""
#let servicezeitenHotlineSoStart = ""
#let servicezeitenHotlineSoEnde = ""
#let servicezeitenHotlineFeiertagStart = ""
#let servicezeitenHotlineFeiertagEnde = ""

#let servicezeitenSonstigePflegeleistungMoBisDoStart = ""
#let servicezeitenSonstigePflegeleistungMoBisDoEnde = ""
#let servicezeitenSonstigePflegeleistungFrStart = ""
#let servicezeitenSonstigePflegeleistungFrEnde = ""
#let servicezeitenSonstigePflegeleistungSaStart = ""
#let servicezeitenSonstigePflegeleistungSaEnde = ""
#let servicezeitenSonstigePflegeleistungSoStart = ""
#let servicezeitenSonstigePflegeleistungSoEnde = ""
#let servicezeitenSonstigePflegeleistungFeiertagStart = ""
#let servicezeitenSonstigePflegeleistungFeiertagEnde = ""

// Überlassung neuer Programmstände der Standardsoftware
#let checkboxUeberlassungProgrammstaende = false

#let ueberlassungProgrammstaendeUmsetzungGesetzesaenderungAnlage = ""
#let ueberlassungProgrammstaendeSoftware = (
  (
    softwareReferenz: "",
    patchUndUpdate: "",
    upgrade: "",
    release: "",
    umsetzungGesetzesaenderungen: "",
    exportkontrollvorschriften: "",
    installationDurchAuftragnehmer: "",
  ),
)
#let ueberlassungProgrammstaendeSoftwareZeilen = for (
  index,
  software,
) in ueberlassungProgrammstaendeSoftware.enumerate() {
  (
    str(index + 1),
    fieldValue(value: software.softwareReferenz, length: 100%),
    fieldValue(value: software.patchUndUpdate, length: 100%),
    fieldValue(value: software.upgrade, length: 100%),
    fieldValue(value: software.release, length: 100%),
    fieldValue(value: software.umsetzungGesetzesaenderungen, length: 100%),
    fieldValue(value: software.exportkontrollvorschriften, length: 100%),
    fieldValue(value: software.installationDurchAuftragnehmer, length: 100%),
  )
}
#let ueberlassungProgrammstaendeSoftwareEXPIndividuell = ""

#let checkboxUeberlassungProgrammstaendeInstallationAuftragnehmerGemaessAnlage = false
#let ueberlassungProgrammstaendeInstallationAuftragnehmerGemaessAnlage = ""

#let checkboxUeberlassungProgrammstaendeAbnahmeInstallationGemaessAnlage = false
#let ueberlassungProgrammstaendeAbnahmeInstallationGemaessAnlage = ""

// Überlassung neuer Programmstände - Art der Lieferung der zu überlassenden Programmstände
#let checkboxArtDerLieferungDatentraeger = false
#let artDerLieferungDatentraegerSoftwarereferenz = ""
#let artDerLieferungDatentraegerTyp = ""
#let artDerLieferungDatentraegerKennzeichnung = ""

#let checkboxArtDerLieferungAndereForm = false
#let artDerLieferungAndereFormSoftwarereferenz = ""
#let artDerLieferungAndereForm = ""

#let checkboxArtDerLieferungGemaessAnlage = false
#let artDerLieferungGemaessAnlageSoftwarereferenz = ""
#let artDerLieferungGemaessAnlage = ""

// Überlassung neuer Programmstände - Vergütung
#let checkboxVerguetungInstallationNeuerProgrammstaende = false
#let verguetungInstallationNeuerProgrammstaendeAufwandKategorie = ""
#let checkboxVerguetungInstallationNeuerProgrammstaendeObergrenze = false
#let verguetungInstallationNeuerProgrammstaendeObergrenzeBetrag = ""
#let verguetungInstallationNeuerProgrammstaendeObergrenzeEinheit = ""

// Störungsbeseitigung - Leistungsumfang
#let checkboxLeistungsumfangStoerungsbeseitigung = false
#let leistungsumfangStoerungsbeseitigungAusgenommeneSoftware = ""

#let checkboxLeistungsumfangUmgehungsloesungQuellcode = false

#let checkboxLeistungsumfangUmgehungsloesung = false

#let checkboxLeistungsumfangStoerungsbeseitigungNeuerProgrammstand = false

#let checkboxLeistungsumfangGemaessAnlage = false
#let leistungsumfangGemaessAnlage = ""

// Störungsbeseitigung - Störungsmeldung durch den Auftraggeber
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

#let checkboxStoerungsmeldungMeldeformular = false

#let checkboxStoerungsmeldungMeldeformularGemaessAnlage = false
#let stoerungsmeldungMeldeformularGemaessAnlage = ""

#let checkboxStoerungsmeldungFormlos = false

#let checkboxStoerungsmeldungTicketsystem = false
#let checkboxStoerungsmeldungTicketsystemAuftragnehmer = false
#let checkboxStoerungsmeldungTicketsystemAuftraggeber = false
#let checkboxStoerungsmeldungTicketsystemErreichbarWebAdresse = false
#let checkboxStoerungsmeldungTicketsystemErreichbarAnderweitig = false
#let stoerungsmeldungTicketsystemErreichbarAnderweitig = ""

// Störungsbeseitigung - Anderweitige Kenntniserlangung von Störungen
#let checkboxKenntniserlangungStoerungenAuftragnehmerMonitoring = false
#let kenntniserlangungStoerungenAuftragnehmerMonitoringSystem = ""
#let kenntniserlangungStoerungenAuftragnehmerMonitoringAnforderungenAnlage = ""

#let checkboxKenntniserlangungStoerungenAuftragnehmerGemaessAnlage = false
#let kenntniserlangungStoerungenAuftragnehmerGemaessAnlage = ""

// Störungsbeseitigung - Reaktions- und Wiederherstellungszeiten
#let checkboxReaktionsWiederherstellungszeiten = false
#let reaktionszeitSchwerwiegendeStoerung = ""
#let wiederherstellungszeitSchwerwiegendeStoerung = ""
#let reaktionszeitErheblicheStoerung = ""
#let wiederherstellungszeitErheblicheStoerung = ""
#let reaktionszeitLeichteStoerung = ""
#let wiederherstellungszeitLeichteStoerung = ""

#let checkboxReaktionszeitAbweichendFuerKlassen = false
#let reaktionszeitAbweichendFuerKlassen = ""
#let checkboxReaktionszeitAbweichendFuerKlassenAusserhalbServicezeiten = false
#let checkboxReaktionszeitAbweichendFuerKlassenInnerhalbZeiten = false
#let reaktionszeitAbweichendFuerKlassenInnerhalbZeiten = ""

#let checkboxReaktionszeitAbweichendEVBAGB = false
#let reaktionszeitAbweichendEVBAGB = ""

#let checkboxReaktionszeitAbweichendGemaessAnlage = false
#let reaktionszeitAbweichendGemaessAnlage = ""

// Störungsbeseitigung - Vergütung
#let checkboxStoerungsbeseitigungVerguetungNichtGesondert = false

#let checkboxStoerungsbeseitigungVerguetungNachAufwand = false
#let stoerungsbeseitigungVerguetungNachAufwandKategorien = ""
#let checkboxStoerungsbeseitigungVerguetungNachAufwandObergrenze = false
#let stoerungsbeseitigungVerguetungNachAufwandObergrenzeBetrag = ""
#let stoerungsbeseitigungVerguetungNachAufwandObergrenzeEinheit = ""
#let checkboxStoerungsbeseitigungVerguetungNachAufwandObergrenzeFesteLaufzeit = false
#let stoerungsbeseitigungVerguetungNachAufwandObergrenzeFesteLaufzeit = ""

// Hotline - Umfang der Leistung
#let checkboxHotlineLeistung = false

#let checkboxHotlineLeistungAbweichendEVBAGBPersonal = false
#let checkboxHotlineLeistungAbweichendEVBAGBPersonalKomplexeFragen = false
#let checkboxHotlineLeistungAbweichendEVBAGBPersonalIndividuellQualifiziert = false
#let hotlineLeistungAbweichendEVBAGBPersonalIndividuellQualifiziert = ""

#let checkboxHotlineLeistungFragenStandardsoftware = false

#let checkboxHotlineLeistungStoerungenTeleservice = false

#let checkboxHotlineLeistungAbweichendEVBAGBPersonenekreis = false
#let hotlineLeistungAbweichendEVBAGBPersonenekreis = ""

#let checkboxHotlineLeistungAbweichendEVBAGBSprache = false
#let hotlineLeistungAbweichendEVBAGBSprache = ""

#let checkboxHotlineLeistungAbweichendEVBAGBAutomation = false

#let checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomation = false
#let checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationKennzeichen = false
#let checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationAuswahlen = false
#let hotlineLeistungAbweichendEVBAGBBegrenzteAutomationAuswahlen = ""
#let checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonEbene = false
#let hotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonEbene = ""
#let checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonZeit = false
#let hotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonZeit = ""

#let checkboxHotlineLeistungAbweichendEVBAGBAnsprechpartner = false

#let checkboxHotlineLeistungAbweichendEVBAGBRufnummer = false
#let hotlineLeistungAbweichendEVBAGBRufnummer = ""

#let checkboxHotlineLeistungWeitereRegelungenGemaessAnlage = false
#let hotlineLeistungWeitereRegelungenGemaessAnlage = ""

// Hotline - Vergütung
#let checkboxHotlineVerguetungNichtGesondert = false

#let checkboxHotlineVerguetungNachAufwand = false
#let hotlineVerguetungNachAufwandKategorien = ""
#let checkboxHotlineVerguetungNachAufwandObergrenze = false
#let hotlineVerguetungNachAufwandObergrenzeBetrag = ""
#let hotlineVerguetungNachAufwandObergrenzeEinheit = ""
#let checkboxHotlineVerguetungNachAufwandObergrenzeFesteLaufzeit = false
#let hotlineVerguetungNachAufwandObergrenzeFesteLaufzeit = ""

// Sonstige Pflegeleistungen
#let checkboxSonstigePflegeleistungenGemaessAnlage = false
#let sonstigePflegeleistungenGemaessAnlage = ""
#let checkboxSonstigePflegeleistungenVerguetungNichtGesondert = false
#let checkboxSonstigePflegeleistungenVerguetungMonatlichePauschale = false
#let sonstigePflegeleistungenVerguetungMonatlichePauschale = ""
#let checkboxSonstigePflegeleistungenVerguetungNachAufwand = false
#let sonstigePflegeleistungenVerguetungNachAufwandKategorien = ""
#let checkboxSonstigePflegeleistungenVerguetungNachAufwandObergrenze = false
#let sonstigePflegeleistungenVerguetungNachAufwandObergrenzeBetrag = ""
#let sonstigePflegeleistungenVerguetungNachAufwandObergrenzeEinheit = ""
#let checkboxSonstigePflegeleistungenVerguetungNachAufwandObergrenzeFesteLaufzeit = false
#let sonstigePflegeleistungenVerguetungNachAufwandObergrenzeFesteLaufzeit = ""

#let checkboxSonstigePflegeleistungenInstallationVerantwortung = false

// Pflege von Open Source Software
#let checkboxPflegeOpenSourceLizenzbestandsaufnahme = false

#let checkboxPflegeOpenSourceLizenzbestandsaufnahmeFrist = false
#let pflegeOpenSourceLizenzbestandsaufnahmeTage = ""

#let checkboxPflegeOpenSourceLizenzbestandsaufnahmeAbgegolten = false

#let checkboxPflegeOpenSourceLizenzbestandsaufnahmeAufwand = false
#let pflegeOpenSourceLizenzbestandsaufnahmeKategorien = ""

#let checkboxPflegeOpenSourceLizenzbestandsaufnahmeObergrenze = false
#let pflegeOpenSourceLizenzbestandsaufnahmeObergrenzeEuro = ""

#let checkboxPflegeOpenSourceLizenzbestandsaufnahmePauschalfestpreis = false
#let pflegeOpenSourceLizenzbestandsaufnahmePauschalfestpreisEuro = ""

#let checkboxPflegeOpenSourceNeueProgrammstaende = false

#let checkboxPflegeOpenSourceNeueProgrammstaendeTypA = false

#let checkboxPflegeOpenSourceNeueProgrammstaendeLizenzliste = false

#let checkboxPflegeOpenSourceTestumgebung = false

#let checkboxPflegeOpenSourceTestumgebungAuftraggeber = false

#let checkboxPflegeOpenSourceKenntnisnahme = false

#let checkboxPflegeOpenSourceErgebnissePlattform = false

#let checkboxPflegeOpenSourceErgebnissePlattformManuell = false
#let pflegeOpenSourcePlattform = ""

#let checkboxPflegeOpenSourceErgebnissePlattformOpenCode = false

// Preiskategorien bei Vergütung nach Aufwand
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

// Reisekosten/Nebenkosten
#let checkboxReisekostenNichtGesondert = false

#let checkboxReisekostenGemaessAnlage = false
#let reisekostenGemaessAnlage = ""

#let checkboxNebenkostenNichtGesondert = false

#let checkboxNebenkostenGemaessAnlage = false
#let nebenkostenGemaessAnlage = ""

#let checkboxReisezeitenNichtGesondert = false

#let checkboxReisezeitenAnteiligArbeitszeit = false

#let checkboxReisezeitenGemaessAnlage = false
#let reisezeitenGemaessAnlage = ""

// Besondere Bestimmungen zur Vergütung nach Aufwand.
#let checkboxBesondereBestimmungenVerguetungAufwandGemaessAnlage = false
#let besondereBestimmungenVerguetungAufwandGemaessAnlage = ""

// Abnahme
#let checkboxAbnahmeGemaessAnlage = false
#let abnahmeLeistungNummer = ""
#let abnahmeGemaessAnlage = ""

// Mängelhaftung
#let checkboxMaengelhaftungAbweichendeVerjaehrungsfrist = false
#let maengelhaftungAbweichendeVerjaehrungsfrist = ""

#let checkboxMaengelhaftungAbweichendeVerjaehrungsfristGemaessAnlage = false
#let maengelhaftungAbweichendeVerjaehrungsfristGemaessAnlage = ""

#let checkboxMaengelhaftungSachmaengelAusschluss = false

#let checkboxMaengelhaftungSachmaengelVerguetung = false

#let checkboxMaengelhaftungSachmaengelObergrenze = false
#let maengelhaftungSachmaengelObergrenzeEuro = ""
#let maengelhaftungSachmaengelObergrenzePro = ""

#let checkboxMaengelhaftungRechtsmaengelAusschluss = false

#let checkboxMaengelhaftungRechtsmaengelVerguetung = false

#let checkboxMaengelhaftungRechtsmaengelObergrenze = false
#let maengelhaftungRechtsmaengelObergrenzeEuro = ""
#let maengelhaftungRechtsmaengelObergrenzePro = ""

#let checkboxMaengelhaftungAusschlussPatentverletzung = false

#let checkboxMaengelhaftungWeitereVereinbarungenGemaessAnlage = false
#let maengelhaftungWeitereVereinbarungenGemaessAnlage = ""

// Haftungsregelungen
#let checkboxHaftungsregelungAbweichendEVBAGBMultiple = false
#let haftungsregelungAbweichendEVBAGBMultiple = ""

#let checkboxHaftungsregelungAbweichendEVBAGObergrenze = false
#let checkboxHaftungsregelungAbweichendEVBAGBObergrenzeProSchadensfall = false
#let haftungsregelungAbweichendEVBAGBObergrenzeProSchadensfall = ""
#let checkboxHaftungsregelungAbweichendEVBAGBObergrenzeVetrag = false
#let haftungsregelungAbweichendEVBAGBObergrenzeVertrag = ""
#let checkboxHaftungsregelungAbweichendEVBAGBGemaessAnlage = false
#let haftungsregelungAbweichendEVBAGBGemaessAnlage = ""

#let checkboxHaftungsregelungEntgangenerGewinn = false

// Vertragsstrafen - Reaktionszeiten
#let checkboxVertragsstrafenReaktionszeitenEVBAGB = false
#let vertragsstrafenReaktionszeiten = (
  (
    leistungsart: "",
    ueberschreitung: "",
    vertragsstrafe: "",
  ),
)
#let vertragsstrafenReaktionszeitenMaximal = ""
#let vertragsstrafenReaktionszeitenZeilen = ()
#for strafe in vertragsstrafenReaktionszeiten {
  vertragsstrafenReaktionszeitenZeilen += (
    fieldValue(value: strafe.leistungsart, length: 100%),
    [#fieldValue(value: strafe.ueberschreitung, length: 2.5cm)%],
    fieldValue(value: strafe.vertragsstrafe, length: 100%),
  )
}

#let checkboxVertragsstrafenReaktionszeitenGemaessAnlage = false
#let vertragsstrafenReaktionszeitenGemaessAnlage = ""

// Vertragsstrafen - Wiederherstellungszeiten
#let checkboxVertragsstrafenWiederherstellungszeitenEVBAGB = false

#let vertragsstrafenWiederherstellungszeiten = (
  (
    leistungsart: "",
    ueberschreitung: "",
    vertragsstrafe: "",
  ),
)
#let vertragsstrafenWiederherstellungszeitenMaximal = ""
#let vertragsstrafenWiederherstellungszeitenZeilen = ()
#for strafe in vertragsstrafenWiederherstellungszeiten {
  vertragsstrafenWiederherstellungszeitenZeilen += (
    fieldValue(value: strafe.leistungsart, length: 100%),
    [#fieldValue(value: strafe.ueberschreitung, length: 2.5cm)%],
    fieldValue(value: strafe.vertragsstrafe, length: 100%),
  )
}

#let checkboxVertragsstrafenWiederherstellungszeitenGemaessAnlage = false
#let vertragsstrafenWiederherstellungszeitenGemaessAnlage = ""

// Vertragsstrafen - Sonstige Vertragsstrafen
#let checkboxVertragsstrafenSonstige = false
#let vertragsstrafenSonstige = ""

// Ansprechpartner
#let ansprechpartnerAuftraggeber = ""

#let ansprechpartnerAuftragnehmer = ""

// Weitere Regelungen - Besondere Anforderungen an Mitarbeiter des Auftragnehmers
#let checkboxBesondereAnforderungenMitarbeiterMindestanforderungen = false
#let besondereAnforderungenMitarbeiter = (
  (
    position: "",
    fachlicheQualifikation: "",
    sicherheitsueberpruefung: "",
    sonstigeAnforderungen: "",
  ),
)
#let besondereAnforderungenMitarbeiterZeilen = for (
  index,
  mitarbeiter,
) in besondereAnforderungenMitarbeiter.enumerate() {
  (
    str(index + 1),
    fieldValue(value: mitarbeiter.position, length: 100%),
    fieldValue(value: mitarbeiter.fachlicheQualifikation, length: 100%),
    fieldValue(value: mitarbeiter.sicherheitsueberpruefung, length: 100%),
    fieldValue(value: mitarbeiter.sonstigeAnforderungen, length: 100%),
  )
}

#let checkboxBesondereAnforderungenMitarbeiterAbweichend = false
#let besondereAnforderungenMitarbeiterAbweichendAnlage = ""

#let checkboxBesondereAnforderungenMitarbeiterAnlage = false
#let besondereAnforderungenMitarbeiterAnlage = ""

// Weitere Regelungen - Allgemeine Sicherheitsandforderungen
#let checkboxAllgemeineSicherheitsanforderungenITSicherheit = false
#let allgemeineSicherheitsanforderungenITSicherheitAnlage = ""

#let checkboxAllgemeineSicherheitsanforderungenGeheimschutz = false
#let allgemeineSicherheitsanforderungenGeheimschutzAnlage = ""

#let checkboxAllgemeineSicherheitsanforderungenEinsatzort = false
#let allgemeineSicherheitsanforderungenEinsatzortAnlage = ""

#let checkboxAllgemeineSicherheitsanforderungenWeitere = false
#let allgemeineSicherheitsanforderungenWeitereRegelungen = ""

// Weitere Regelungen - Besondere technische Merkmale
#let checkboxBesondereTechnischeMerkmaleKeineSperren = false

#let checkboxBesondereTechnischeMerkmaleMitSperren = false
#let besondereTechnischeMerkmaleMitSperrenText = ""
#let besondereTechnischeMerkmaleMitSperrenAnlage = ""

#let checkboxBesondereTechnischeMerkmaleNichtMerkmale = false
#let besondereTechnischeMerkmaleNichtMerkmaleText = ""
#let besondereTechnischeMerkmaleNichtMerkmaleAnlage = ""

// Weitere Regelungen - Haftpflichtversicherung
#let checkboxHaftpflichtversicherungNachweis = false

// Weitere Regelungen - Teleservice
#let checkboxTeleserviceGrundlage = false
#let teleserviceAnlageNr = ""
#let teleserviceVerfahren = ""
#let teleserviceAnforderungenAnlageNr = ""

// Weitere Regelungen - Datenschutz
#let checkboxDatenschutzGeheimhaltung = false
#let datenschutzGeheimhaltungAnlage = ""

#let checkboxDatenschutzAuftragsdatenverarbeitung = false
#let datenschutzAuftragsdatenverarbeitungAnlage = ""

#let checkboxDatenschutzSonstige = false
#let datenschutzSonstigeAnlage = ""

// Weitere Regelungen - Dokumentation und SBOM
#let checkboxDokumentationAbweichend = false
#let dokumentationAbweichendSprache = ""

#let checkboxSBOMAktualisierung = false

#let checkboxSBOMAbweichend = false
#let sbomAbweichendFormat = ""

// Weitere Regelungen - Erfüllungsort
#let erfuellungsort = ""

// Sonstige Vereinbarungen
#let checkboxSonstigeVereinbarungen = false
#let sonstigeVereinbarungen = ""

#let checkboxSonstigeVereinbarungenGemaessAnlage = false
#let sonstigeVereinbarungenGemaessAnlage = ""

// ==========================================
// 4. CONTENT
// ==========================================

#align(center)[
  #heading(outlined: false, bookmarked: false, numbering: none)[Vertrag über Pflegeleistungen für Standardsoftware\*]
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
Gegenstand des Vertrages sind Pflegeleistungen für die vereinbarte Standardsoftware\* #fieldValue(value: vertragsgegenstaendigeStandardsoftware).

== Vertragsbestandteile
Es gelten als Vertragsbestandteile:

===
#context {
  let endOfContract = query(<ende-vertrag>).first().location()
  let lastPage = counter(page).at(endOfContract).at(0)

  [dieser Vertragstext bestehend aus den Seiten 1 bis #lastPage und den folgenden Anlagen:]
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

#option(checkboxAnlagenVertragsbestandteileReihenfolge)[
  Es gelten die Anlagen in folgender Rangfolge: #fieldValue(value: anlagenVertragsbestandteileReihenfolge).
]

===
die Ergänzenden Vertragsbedingungen für IT Pflege S (EVB-IT Pflege S-AGB) in der bei Versand der Vergabeunterlagen geltenden Fassung einschließlich der Muster 1 und 2

===
sowie nachrangig die Allgemeinen Vertragsbedingungen für die Ausführung von Leistungen (VOL/B) in der bei Versand der Vergabeunterlagen geltenden Fassung.

Die EVB-IT Pflege S-AGB stehen unter #link("https://evb-it.gov.de")[evb-it.gov.de] zur Einsichtnahme bereit.
Die VOL/B wurde im Bundesanzeiger AT Nr. 178a vom 23. September 2003 veröffentlicht.

Soweit Allgemeine Geschäftsbedingungen im Sinne von § 305 BGB in den hier referenzierten Dokumenten des Auftragnehmers bzw. den sonstigen vom Auftragnehmer beigefügten Anlagen zu diesem Vertrag Regelungen in den EVB-IT Pflege S-AGB widersprechen, sind sie ausgeschlossen, soweit nicht eine anderweitige Vereinbarung in den EVB-IT Pflege S-AGB zugelassen ist.
Eine Einbeziehung von Lizenzbedingungen an Standardsoftware\* erfolgt ausschließlich hinsichtlich der Nutzungsrechtsregelungen, unabhängig davon, ob und in welcher Rangfolge diese als Anlage in Tabelle aus Nummer 1.2.1 aufgelistet werden.

Weitere Geschäftsbedingungen sind ausgeschlossen, soweit in diesem Vertrag nichts anderes vereinbart ist.

Für alle in diesem Vertrag genannten Beträge gilt einheitlich der Euro als Währung.
Die vereinbarten Vergütungen verstehen sich zuzüglich der gesetzlichen Umsatzsteuer, soweit Umsatzsteuerpflicht besteht.

Die mit \* gekennzeichneten Begriffe sind am Ende der EVB-IT Pflege S-AGB definiert.




= Überblick über die vereinbarten Leistungen

#option(checkboxVereinbarteLeistungenUeberlassung)[
  Dauerhafte Überlassung neuer Programmstände\*
]
#option(checkboxVereinbarteLeistungenStoerungsbeseitigung)[
  Störungsbeseitigung
]
#option(checkboxVereinbarteLeistungenHotline)[
  Hotline
]
#option(checkboxVereinbarteLeistungenSonstigePflegeleistungen)[
  Sonstige Pflegeleistungen
]




= Beschreibung der Standardsoftware\*, die Gegenstand der Pflegeleistungen ist

#table(
  columns: (6%, 70%, 24%),
  inset: 0.5em,
  align: center + horizon,
  table.header(
    repeat: true,
    [*Lfd. Nr.*],
    [*Produktbezeichnung und -beschreibung, Produkt-Nr., ggf. zugrundeliegender Vertrag zur Überlassung der Standardsoftware\**],
    [*Lizenzart und Anzahl*],
  ),
  ..zuPflegendeStandardsoftwareZeilen.flatten(),
)




= Beginn / Dauer / Kündigung der Pflegeleistungen

== Beginn / Dauer der Pflegeleistungen
Der Auftragnehmer verpflichtet sich, beginnend mit

#option(checkboxBeginnPflegeleistungDatum)[
  folgendem Datum: #fieldValue(value: beginnPflegeleistungDatum)
]
#option(checkboxBeginnPflegeleistungTagNachLieferung)[
  dem Tag nach der Lieferung der Standardsoftware\*
]
#option(checkboxBeginnPflegeleistungGemaessAnlage)[
  zu den in Anlage Nr. #fieldValue(value: beginnPflegeleistungGemaessAnlage) vereinbartem/n Zeitpunkt(en)
]

jeweils

#option(checkboxDauerPflegeleistungUnbefristet)[
  unbefristet
  #option(checkboxDauerPflegeleistungUnbefristetMindestdauer)[
    mindestens jedoch für die Dauer von #fieldValue(value: dauerPflegeleistungUnbefristetMindestdauer) Monaten (Mindestvertragsdauer)
  ]
]
#option(checkboxDauerPflegeleistungInMonaten)[
  für die Dauer von #fieldValue(value: dauerPflegeleistungInMonaten) Monaten
]
#option(checkboxDauerPflegeleistungGemaessAnlage)[
  für den/die in Anlage Nr. #fieldValue(value: dauerPflegeleistungGemaessAnlage) vereinbarten Zeitraum/Zeiträume
]

die vereinbarten Pflegeleistungen zu erbringen.

== Kündigung von Pflegeleistungen

#option(checkboxKuendigungPflegeleistungAbweichendEVBAGBFristInMonaten)[
  Abweichend von Ziffer 15.1 EVB-IT Pflege S-AGB beträgt die Kündigungsfrist #fieldValue(value: kuendigungPflegeleistungAbweichendEVBAGBFristInMonaten) Monat(e) zum Ablauf eines #fieldValue(value: kuendigungPflegeleistungAbweichendEVBAGBFristInMonatenKuendigungZum).
]
#option(checkboxKuendigungPflegeleistungAbweichendEVBAGBKeineTeilkuendigung)[
  Abweichend von Ziffer 15.1 EVB-IT Pflege S-AGB ist der Auftraggeber nicht zur Teilkündigung berechtigt.
]
#option(checkboxKuendigungPflegeleistungAbweichendEVBAGBAusserbetriebnahme)[
  Abweichend von Ziffer 15.2 EVB-IT Pflege S-AGB ergeben sich die Ansprüche des Auftragnehmers bei einer Kündigung gemäß Ziffer 15.2 EVB-IT Pflege S-AGB (dauerhafte Außerbetriebnahme von Standardsoftware\*) aus Anlage Nr. #fieldValue(value: kuendigungPflegeleistungAbweichendEVBAGBAusserbetriebnahmeAnlage).
]
#option(checkboxKuendigungPflegeleistungAbweichendEVBAGBSonderkuendigung)[
  Abweichend von Ziffer 15.2 EVB-IT Pflege S-AGB wird bei vereinbarter fester Laufzeit ein Sonderkündigungsrecht gem. Anlage Nr. #fieldValue(value: kuendigungPflegeleistungAbweichendEVBAGBSonderkuendigungAnlage) vereinbart.
]




= Vergütung

== Vergütung für die Pflegeleistungen

#option(checkboxVerguetungPauschalfestpreisMonatlich)[
  Der Pauschalfestpreis\* für die Pflegeleistungen (Pflegepauschale) beträgt monatlich #fieldValue(value: verguetungPauschalfestpreisMonatlich) Euro.
  #option(checkboxVerguetungPauschalfestpreisMonatlichAbweichenderZeitraum)[
    Für den Zeitraum bis zum #fieldValue(value: verguetungPauschalfestpreisMonatlichAbweichenderZeitraumDatum) wird eine abweichende monatliche Pflegepauschale in Höhe von #fieldValue(value: verguetungPauschalfestpreisMonatlichAbweichenderZeitraumPreis) Euro vereinbart.
  ]

  oder

  #option(checkboxVerguetungPauschalfestpreisMonatlichBisEndeSachmaengelansprueche)[
    Für den Zeitraum bis zum Ablauf der Verjährungsfrist der Sachmängelansprüche für die Standardsoftware aus dem in Nummer 3 bezeichneten Vertrag zur Überlassung der Standardsoftware\* wird eine abweichende monatliche  Pflegepauschale  in Höhe von #fieldValue(value: verguetungPauschalfestpreisMonatlichBisEndeSachmaengelansprueche) Euro vereinbart.
  ]
]
#option(checkboxVerguetungPauschalfestpreisSummeEinzelnePflegeleistungen)[
  Der Pauschalfestpreis\* für die Pflegeleistungen (Pflegepauschale) ist die Summe der nachfolgend für die jeweiligen Zeiträume gültigen Vergütungsanteile:

  #block[
    #set text(size: 9pt)

    #table(
      columns: (6%, 18%, 20%, 28%, 28%),
      inset: 0.5em,
      align: center + horizon,
      table.header(
        repeat: true,
        [*Lfd.\ Nr.*],
        [*Standardsoftware aus Nummer 3, lfd. Nr.*],
        [*Vergütungsanteil an der monatlichen Pflegepauschale*],
        [*ggf. reduzierter Vergütungsanteil an der monatlichen Pflegepauschale bis zum Ablauf der Verjährungsfrist für Mängelansprüche aus dem zugrundeliegenden Vertrag zur Überlassung der Standardsoftware\**],
        [*ggf. reduzierter Vergütungsanteil an der monatlichen Pflegepauschale für einen bestimmten Zeitraum*],
      ),
      ..pflegeleistungenVerguetungenZeilen.flatten(),
    )
  ]
]
#option(checkboxVerguetungPauschalfestpreisEinmalig)[
  Der Pauschalfestpreis\* für die Pflegeleistungen (Pflegepauschale) bei fester Laufzeit beträgt einmalig #fieldValue(value: verguetungPauschalfestpreisEinmalig) Euro.
]
#option(checkboxVerguetungPauschalfestpreisLeistungenAusgenommen)[
  Ausgenommen von der jeweiligen Pflegepauschale sind einzelne Leistungen, die gesondert nach Aufwand vergütet und in diesem Vertrag gesondert ausgewiesen werden.
]
#option(checkboxVerguetungGemaessAnlage)[
  Die Vergütung erfolgt gemäß Anlage Nr. #fieldValue(value: verguetungGemaessAnlage).
]

== Preisanpassung
#option(checkboxPreisanpassung)[
  Es wird eine Preisanpassung vereinbart:
  #option(checkboxPreisanpassungGemaessEVBAGB)[
    gemäß Ziffer 8.5 EVB-IT-Pflege-AGB:

    #option(checkboxPreisanpassungGemaessEVBAGBMonatlichePflegepauschale)[
      für die monatliche Pflegepauschale gemäß Nummer 5.1.
    ]
    #option(checkboxPreisanpassungGemaessEVBAGBPreiskategorien)[
      für die Preiskategorien gemäß Nummer 9.1.
    ]
  ]
  #option(checkboxPreisanpassungGemaessAnlage)[
    gemäß Anlage Nr. #fieldValue(value: preisanpassungGemaessAnlage).
  ]
]

== Fälligkeit und Zahlung
Die Pflegepauschale ist abweichend von Ziffer 8.3 EVB-IT Pflege S-AGB nicht monatlich nachträglich bis zum 15. eines jeden Monats fällig, sondern

#option(checkboxFaelligkeitQuartalsweise)[
  quartalsweise bis zum 15. des zweiten Monats des laufenden Quartals.
]
#option(checkboxFaelligkeitJaehrlich)[
  jährlich bis zum #fieldValue(value: faelligkeitJaehrlich) des laufenden Jahres.
]
#option(checkboxFaelligkeitEinmalig)[
  einmalig zum #fieldValue(value: faelligkeitEinmalig).
]
#option(checkboxFaelligkeitGemaessAnlage)[
  gemäß Anlage Nr. #fieldValue(value: faelligkeitGemaessAnlage).
]

#option(checkboxZahlungsfristAbweichendEVBAGB)[
  Die Pflegepauschale ist abweichend von Ziffer 8.4 EVB-IT Pflege S-AGB nicht 30 Tage sondern #fieldValue(value: zahlungsfristAbweichendEVBAGB) Tage nach Zugang einer prüffähigen Rechnung zu zahlen.
]

== Rechnungsadresse
Die Rechnung ist nach den Vorgaben der folgenden E-Rechnungsverordnung elektronisch einzureichen:

#option(checkboxRechnungsadresseVerordnungBund)[
  E-Rechnungsverordnung des Bundes - ERechV
]
#option(checkboxRechnungsadresseVerordnungLand)[
  #fieldValue(value: rechnungsadresseVerordnungLand)
]

Dabei ist folgende Leitweg-ID *#fieldValue(value: rechnungsadresseLeitwegID)* zu verwenden.
Zudem müssen alle Pflichtfelder sowie die Zusatzfelder #fieldValue(value: rechnungsadresseZusatzfelder) gefüllt sein.
Weitere Details ergeben sich aus Anlage Nr. #fieldValue(value: rechnungsadresseAnlageNr).

Eine Rechnung, die entgegen vorstehender Regelung nicht elektronisch gestellt wird, begründet keinen Verzug nach § 286 Abs. 3 BGB.

#option(checkboxRechnungsadresseAbweichend)[
  Für die Rechnungsstellung gilt abweichend davon die folgende Regelung: #fieldValue(value: rechnungsadresseAbweichendRegelung).
]




= Servicezeiten\* für die Pflegeleistungen

#table(
  columns: (25%, 25%, 25%, 25%),
  inset: 0.5em,
  align: left + horizon,
  table.header(
    repeat: true,
    table.cell(align: center)[*Zeitpunkt der Erbringung*],
    table.cell(align: center)[*Störungsbeseitigung gemäß Nummer 7.2*],
    table.cell(align: center)[*Hotline gemäß Nummer 7.3*],
    table.cell(align: center)[*ggf. sonstige Pflegeleistungen gemäß Nummer 7.4*],
  ),
  [an Arbeitstagen\ Mo-Do],
  [von #fieldValue(value: servicezeitenStoerungsbeseitigungMoBisDoStart)\ bis #fieldValue(value: servicezeitenStoerungsbeseitigungMoBisDoEnde)],
  [von #fieldValue(value: servicezeitenHotlineMoBisDoStart)\ bis #fieldValue(value: servicezeitenHotlineMoBisDoEnde)],
  [von #fieldValue(value: servicezeitenSonstigePflegeleistungMoBisDoStart)\ bis #fieldValue(value: servicezeitenSonstigePflegeleistungMoBisDoEnde)],

  [an Arbeitstagen Fr],
  [von #fieldValue(value: servicezeitenStoerungsbeseitigungFrStart)\ bis #fieldValue(value: servicezeitenStoerungsbeseitigungFrEnde)],
  [von #fieldValue(value: servicezeitenHotlineFrStart)\ bis #fieldValue(value: servicezeitenHotlineFrEnde)],
  [von #fieldValue(value: servicezeitenSonstigePflegeleistungFrStart)\ bis #fieldValue(value: servicezeitenSonstigePflegeleistungFrEnde)],

  [an Samstagen],
  [von #fieldValue(value: servicezeitenStoerungsbeseitigungSaStart)\ bis #fieldValue(value: servicezeitenStoerungsbeseitigungSaEnde)],
  [von #fieldValue(value: servicezeitenHotlineSaStart)\ bis #fieldValue(value: servicezeitenHotlineSaEnde)],
  [von #fieldValue(value: servicezeitenSonstigePflegeleistungSaStart)\ bis #fieldValue(value: servicezeitenSonstigePflegeleistungSaEnde)],

  [an Sonntagen],
  [von #fieldValue(value: servicezeitenStoerungsbeseitigungSoStart)\ bis #fieldValue(value: servicezeitenStoerungsbeseitigungSoEnde)],
  [von #fieldValue(value: servicezeitenHotlineSoStart)\ bis #fieldValue(value: servicezeitenHotlineSoEnde)],
  [von #fieldValue(value: servicezeitenSonstigePflegeleistungSoStart)\ bis #fieldValue(value: servicezeitenSonstigePflegeleistungSoEnde)],

  [an Feiertagen am\ Erfüllungsort],
  [von #fieldValue(value: servicezeitenStoerungsbeseitigungFeiertagStart)\ bis #fieldValue(value: servicezeitenStoerungsbeseitigungFeiertagEnde)],
  [von #fieldValue(value: servicezeitenHotlineFeiertagStart)\ bis #fieldValue(value: servicezeitenHotlineFeiertagEnde)],
  [von #fieldValue(value: servicezeitenSonstigePflegeleistungFeiertagStart)\ bis #fieldValue(value: servicezeitenSonstigePflegeleistungFeiertagEnde)],
)




= Art und Umfang der Pflegeleistungen

== Überlassung neuer Programmstände\* der Standardsoftware\*

#option(checkboxUeberlassungProgrammstaende)[
  Der Auftragnehmer verpflichtet sich in nachfolgendem Umfang zur Überlassung folgender neuer Programmstände\* für die aufgeführte Standardsoftware\*.

  #block[
    #set text(size: 9pt)

    #table(
      columns: (5%, 12%, 9%, 9%, 10%, 28%, 6%, 22%),
      inset: 0.5em,
      align: center + horizon,
      table.header(
        repeat: true,
        [*Lfd. Nr.*],
        [*Standardsoftware\**\ aus Nummer 3, lfd. Nr.],
        [*Patch\*, Update\**],
        [*Upgrade\**],
        [*Release / Version\**],
        [*Umsetzung von in Anlage Nr.\ #fieldValue(value: ueberlassungProgrammstaendeUmsetzungGesetzesaenderungAnlage) genannten Gesetzes- und sonstigen Normänderungen (gemäß Ziffer 2.1.2 EVB-IT Pflege-AGB)*],
        [*EXP*#footnote[
            US = Programmstände\* unterliegen US-amerikanischen Exportkontrollvorschriften\
            EU = Programmstände\* unterliegen EU-Exportkontrollvorschriften\
            DT = Programmstände\* unterliegen deutschen Exportkontrollvorschriften\
            S = Programmstände\* unterliegen #fieldValue(value: ueberlassungProgrammstaendeSoftwareEXPIndividuell) Exportkontrollvorschriften
          ]],
        [*Installation durch den Auftragnehmer*\ (Abweichend von Ziffer 2.1.2 EVB-IT Pflege-AGB)],
      ),
      ..ueberlassungProgrammstaendeSoftwareZeilen.flatten(),
    )
  ]
]
#option(checkboxUeberlassungProgrammstaendeInstallationAuftragnehmerGemaessAnlage)[
  Besondere Vereinbarung zur Installation der Programmstände\* durch den Auftragnehmer gemäß Anlage Nr. #fieldValue(value: ueberlassungProgrammstaendeInstallationAuftragnehmerGemaessAnlage).
]
#option(checkboxUeberlassungProgrammstaendeAbnahmeInstallationGemaessAnlage)[
  Regelung zur Abnahme der Installation der Programmstände\* gemäß Anlage Nr. #fieldValue(value: ueberlassungProgrammstaendeAbnahmeInstallationGemaessAnlage).
]

=== Art der Lieferung der zu überlassenden Programmstände\*
Der Auftragnehmer liefert die Programmstände wie folgt:

#option(checkboxArtDerLieferungDatentraeger)[
  gemäß Tabelle in Nummer 7.1 lfd. Nr. #fieldValue(value: artDerLieferungDatentraegerSoftwarereferenz) auf Datenträger: Typ: #fieldValue(value: artDerLieferungDatentraegerTyp), Kennzeichnung: #fieldValue(value: artDerLieferungDatentraegerKennzeichnung).
]
#option(checkboxArtDerLieferungAndereForm)[
  gemäß Tabelle in Nummer 7.1 lfd. Nr. #fieldValue(value: artDerLieferungAndereFormSoftwarereferenz) in folgender Form: #fieldValue(value: artDerLieferungAndereForm).
]
#option(checkboxArtDerLieferungGemaessAnlage)[
  gemäß Tabelle in Nummer 7.1 lfd. Nr. #fieldValue(value: artDerLieferungGemaessAnlageSoftwarereferenz), wie in Anlage Nr. #fieldValue(value: artDerLieferungGemaessAnlage) beschrieben.
]

=== Vergütung
Es erfolgt keine gesonderte Vergütung; die Vergütung für die Leistungen dieser Nummer 7.1 ist in der Pflegepauschale enthalten.

#option(checkboxVerguetungInstallationNeuerProgrammstaende)[
  Ausgenommen hiervon ist die Installation der neuen Programmstände\* die nach Aufwand gemäß Kategorie(n) #fieldValue(value: verguetungInstallationNeuerProgrammstaendeAufwandKategorie) aus Nummer 9.1

  #option(checkboxVerguetungInstallationNeuerProgrammstaendeObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: verguetungInstallationNeuerProgrammstaendeObergrenzeBetrag) pro #fieldValue(value: verguetungInstallationNeuerProgrammstaendeObergrenzeEinheit)
  ]

  gesondert zu vergüten ist.
]

== Störungsbeseitigung

=== Leistungsumfang

#option(checkboxLeistungsumfangStoerungsbeseitigung)[
  Der Auftragnehmer verpflichtet sich, Störungen\* der Standardsoftware\* mit Ausnahme der Standardsoftware\* gemäß Nummer 3 lfd. Nr. #fieldValue(value: leistungsumfangStoerungsbeseitigungAusgenommeneSoftware) zu beseitigen.
]
#option(checkboxLeistungsumfangUmgehungsloesungQuellcode)[
  Der Auftragnehmer ist abweichend von Ziffer 2.2 EVB-IT Pflege S-AGB verpflichtet, soweit erforderlich, im Rahmen der Pflicht zur Bereitstellung einer Umgehungslösung auch Eingriffe in deren Objekt- bzw. Quellcode vorzunehmen.
]
#option(checkboxLeistungsumfangUmgehungsloesung)[
  Der Auftragnehmer ist abweichend von Ziffer 2.2 EVB-IT Pflege S-AGB nicht berechtigt, eine Störung\* zunächst durch Bereitstellung einer Umgehungslösung zu beseitigen.
]
#option(checkboxLeistungsumfangStoerungsbeseitigungNeuerProgrammstand)[
  Der Auftraggeber ist abweichend von Ziffer 2.2.2 EVB-IT Pflege S-AGB zur Übernahme eines neuen Programmstandes\* im Rahmen der Störungsbeseitigung nicht verpflichtet.
]
#option(checkboxLeistungsumfangGemaessAnlage)[
  Weitere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: leistungsumfangGemaessAnlage).
]

=== Kenntniserlangung von Störungen\*

==== Störungsmeldung durch den Auftraggeber
Die Störungsmeldung erfolgt an folgende Adresse:

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
      #option(checkboxAdresseStoerungsmeldungWeb)[Web-Adresse des Ticketsystems:]
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
      [Art des Kontakts], [Kontaktdaten],
    ),
    ..kontaktZellen,
  )
}

wie folgt:

#option(checkboxStoerungsmeldungMeldeformular)[
  auf dem Störungsmeldeformular gemäß Muster 1 (siehe auch Ziffer 10.2 EVB-IT Pflege S-AGB).
]
#option(checkboxStoerungsmeldungMeldeformularGemaessAnlage)[
  auf einem Störungsmeldeformular gemäß Anlage Nr. #fieldValue(value: stoerungsmeldungMeldeformularGemaessAnlage).
]
#option(checkboxStoerungsmeldungFormlos)[
  formlos.
]
#option(checkboxStoerungsmeldungTicketsystem)[
  mit Ticketsystem\*

  #option(checkboxStoerungsmeldungTicketsystemAuftragnehmer)[
    des Auftragnehmers,
  ]
  #option(checkboxStoerungsmeldungTicketsystemAuftraggeber)[
    des Auftraggebers,
  ]

  welches

  #option(checkboxStoerungsmeldungTicketsystemErreichbarWebAdresse)[
    unter der oben angegebenen Web-Adresse erreichbar ist.
  ]
  #option(checkboxStoerungsmeldungTicketsystemErreichbarAnderweitig)[
    wie folgt zur Verfügung gestellt wird: #fieldValue(value: stoerungsmeldungTicketsystemErreichbarAnderweitig).
  ]
]

==== Anderweitige Kenntniserlangung von Störungen\*

#option(checkboxKenntniserlangungStoerungenAuftragnehmerMonitoring)[
  Der Auftragnehmer ist zur Feststellung von Störungen\* (Monitoring) mit Hilfe des Überwachungssystems #fieldValue(value: kenntniserlangungStoerungenAuftragnehmerMonitoringSystem) verpflichtet.
  Dieses Überwachungssystem muss neben den Anforderungen aus Ziffer 1.4 EVB-IT Pflege S-AGB auch den Anforderungen aus der Anlage Nr. #fieldValue(value: kenntniserlangungStoerungenAuftragnehmerMonitoringAnforderungenAnlage) genügen.
]
#option(checkboxKenntniserlangungStoerungenAuftragnehmerGemaessAnlage)[
  Der Auftragnehmer ist verpflichtet, sich in dem in Anlage Nr. #fieldValue(value: kenntniserlangungStoerungenAuftragnehmerGemaessAnlage) genannten Umfang selbst Kenntnis von Störungen\* zu verschaffen.
]

=== Reaktions- und Wiederherstellungszeiten\*

#option(checkboxReaktionsWiederherstellungszeiten)[
  Es werden folgende Reaktions- und Wiederherstellungszeiten\* vereinbart:

  #table(
    columns: (40%, 30%, 30%),
    inset: 0.5em,
    align: (left + horizon, center + horizon, center + horizon),
    table.header(
      repeat: true,
      [Störungsklasse], [Reaktionszeit\* in Stunden], [Wiederherstellungszeit\* in Stunden],
    ),
    [Betriebsverhindernde Störung\*],
    [#fieldValue(value: reaktionszeitSchwerwiegendeStoerung)],
    [#fieldValue(value: wiederherstellungszeitSchwerwiegendeStoerung)],

    [Betriebsbehindernde Störung\*],
    [#fieldValue(value: reaktionszeitErheblicheStoerung)],
    [#fieldValue(value: wiederherstellungszeitErheblicheStoerung)],

    [Leichte Störung\*],
    [#fieldValue(value: reaktionszeitLeichteStoerung)],
    [#fieldValue(value: wiederherstellungszeitLeichteStoerung)],
  )
]

Reaktions- und Wiederherstellungszeiten\* beginnen mit dem Zugang der entsprechenden Störungsmeldung, innerhalb der in Nummer 6 oder Ziffer 4.1 EVB-IT Pflege S-AGB  für die Störungsbeseitigung vereinbarten Servicezeiten\* und laufen ausschließlich während dieser Zeiten.
Geht eine Störungsmeldung außerhalb der vereinbarten Servicezeiten\* ein, beginnt die Reaktionszeit\* mit Beginn der nächsten Servicezeit\*.
Der Störungsmeldung gleichgestellt ist der Zeitpunkt, an dem der Auftragnehmer Kenntnis von der Störung\* erlangt hat oder hätte gemäß Nummer 7.2.2.2 erlangen können.

#option(checkboxReaktionszeitAbweichendFuerKlassen)[
  Abweichend davon beginnen und laufen die Reaktions- und Wiederherstellungszeiten\* für Störungen\* der Klassen #fieldValue(value: reaktionszeitAbweichendFuerKlassen)

  #option(checkboxReaktionszeitAbweichendFuerKlassenAusserhalbServicezeiten)[
    auch außerhalb der vereinbarten Servicezeiten\*.
  ]
  #option(checkboxReaktionszeitAbweichendFuerKlassenInnerhalbZeiten)[
    auch innerhalb der folgenden Zeiten: #fieldValue(value: reaktionszeitAbweichendFuerKlassenInnerhalbZeiten).
  ]
]
#option(checkboxReaktionszeitAbweichendEVBAGB)[
  Die Reaktionszeiten\* und Wiederherstellungszeiten\* werden abweichend von den Definitionen in den EVB-IT Pflege S-AGB wie folgt definiert: #fieldValue(value: reaktionszeitAbweichendEVBAGB).
]
#option(checkboxReaktionszeitAbweichendGemaessAnlage)[
  Die Reaktions-\* und Wiederherstellungszeiten\* werden in Anlage Nr. #fieldValue(value: reaktionszeitAbweichendGemaessAnlage) für die dort abweichend von Ziffer 3 EVB-IT Pflege S-AGB definierten Störungsklassen festgelegt.
]

=== Vergütung

#option(checkboxStoerungsbeseitigungVerguetungNichtGesondert)[
  Keine gesonderte Vergütung; die Vergütung für die Störungsbeseitigung ist in der Pflegepauschale enthalten.
]
#option(checkboxStoerungsbeseitigungVerguetungNachAufwand)[
  Die Vergütung für die Störungsbeseitigung erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: stoerungsbeseitigungVerguetungNachAufwandKategorien) aus Nummer 9.1

  #option(checkboxStoerungsbeseitigungVerguetungNachAufwandObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: stoerungsbeseitigungVerguetungNachAufwandObergrenzeBetrag) Euro pro #fieldValue(value: stoerungsbeseitigungVerguetungNachAufwandObergrenzeEinheit).
  ]
  #option(checkboxStoerungsbeseitigungVerguetungNachAufwandObergrenzeFesteLaufzeit)[
    bei fester Laufzeit mit einer Obergrenze in Höhe von insgesamt #fieldValue(value: stoerungsbeseitigungVerguetungNachAufwandObergrenzeFesteLaufzeit) Euro.
  ]
]

== Hotline

=== Umfang der Leistung

#option(checkboxHotlineLeistung)[
  Der Auftragnehmer gewährt Hotline-Service gemäß Ziffer 2.3 der EVB-IT Pflege S-AGB zu den in Nummer 6 vereinbarten Servicezeiten\*.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBPersonal)[
  Abweichend von Ziffer 2.3.3 der EVB-IT Pflege S-AGB, darf der Auftragnehmer für die Hotline nur Personal einsetzen,

  #option(checkboxHotlineLeistungAbweichendEVBAGBPersonalKomplexeFragen)[
    das sachlich und fachlich so qualifiziert ist, dass auch komplexere Fragen zur Nutzung und Störungsmeldungen gelöst werden können.
  ]
  #option(checkboxHotlineLeistungAbweichendEVBAGBPersonalIndividuellQualifiziert)[
    das gemäß Anlage Nr. #fieldValue(value: hotlineLeistungAbweichendEVBAGBPersonalIndividuellQualifiziert) qualifiziert ist.
  ]
]
#option(checkboxHotlineLeistungFragenStandardsoftware)[
  Im Rahmen der Hotline werden auch Fragen zur Nutzung der Standardsoftware\* beantwortet.
]
#option(checkboxHotlineLeistungStoerungenTeleservice)[
  Der Auftragnehmer ist verpflichtet, im Rahmen der Hotline Störungen\*, soweit möglich, auch durch Teleservice\* zu beseitigen.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBPersonenekreis)[
  Abweichend von Ziffer 2.3.2 EVB-IT Pflege S-AGB ist lediglich der in Anlage Nr. #fieldValue(value: hotlineLeistungAbweichendEVBAGBPersonenekreis) aufgeführte Personenkreis berechtigt, die Hotline in Anspruch zu nehmen.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBSprache)[
  Abweichend von Ziffer 2.3.3 EVB-IT Pflege S-AGB erfolgt die Hotline zu folgenden Zeiten #fieldValue(value: hotlineLeistungAbweichendEVBAGBSprache) in englischer Sprache.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBAutomation)[
  Abweichend von Ziffer 2.3.4 EVB-IT Pflege S-AGB ist der Auftragnehmer nicht berechtigt, im Rahmen der Hotline automatisierte Sprachdialogsysteme einzusetzen.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomation)[
  Abweichend von Ziffer 2.3.4 EVB-IT Pflege S-AGB ist der Auftragnehmer nur in nachfolgendem Umfang berechtigt, im Rahmen der Hotline automatisierte Sprachdialogsysteme für die Entgegennahme und Zuordnung von Anrufen einzusetzen,

  #option(checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationKennzeichen)[
    soweit nur ein einheitliches Kennzeichen zur Identifizierung verwendet wird.
  ]
  #option(checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationAuswahlen)[
    nicht mehr als #fieldValue(value: hotlineLeistungAbweichendEVBAGBBegrenzteAutomationAuswahlen) Auswahlalternativen pro Ebene abgefragt werden.
  ]
  #option(checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonEbene)[
    der Kontakt zu einer natürlichen Person spätestens auf der #fieldValue(value: hotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonEbene) Ebene erfolgt.
  ]
  #option(checkboxHotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonZeit)[
    der Kontakt zu einer natürlichen Person spätestens nach #fieldValue(value: hotlineLeistungAbweichendEVBAGBBegrenzteAutomationPersonZeit) Minuten erfolgt.
  ]
]
#option(checkboxHotlineLeistungAbweichendEVBAGBAnsprechpartner)[
  Abweichend von Ziffer 2.3.5 EVB-IT Pflege S-AGB hat der Auftragnehmer die Bearbeitung eines Vorgangs durchgängig durch denselben Mitarbeiter zu gewährleisten.
]
#option(checkboxHotlineLeistungAbweichendEVBAGBRufnummer)[
  Abweichend von Ziffer 2.3.6 EVB-IT Pflege S-AGB ist der Auftragnehmer berechtigt, die Hotline über #fieldValue(value: hotlineLeistungAbweichendEVBAGBRufnummer) anzubieten.
]
#option(checkboxHotlineLeistungWeitereRegelungenGemaessAnlage)[
  Weitere Regelungen zur Hotline ergeben sich aus Anlage Nr. #fieldValue(value: hotlineLeistungWeitereRegelungenGemaessAnlage).
]

=== Vergütung

#option(checkboxHotlineVerguetungNichtGesondert)[
  Keine gesonderte Vergütung; die Vergütung für die Hotline ist in der Pflegepauschale enthalten.
]
#option(checkboxHotlineVerguetungNachAufwand)[
  Die Vergütung für die Hotline erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: hotlineVerguetungNachAufwandKategorien) aus Nummer 9.1

  #option(checkboxHotlineVerguetungNachAufwandObergrenze)[
    mit einer Obergrenze in Höhe von #fieldValue(value: hotlineVerguetungNachAufwandObergrenzeBetrag) Euro pro #fieldValue(value: hotlineVerguetungNachAufwandObergrenzeEinheit).
  ]
  #option(checkboxHotlineVerguetungNachAufwandObergrenzeFesteLaufzeit)[
    bei fester Laufzeit mit einer Obergrenze in Höhe von insgesamt #fieldValue(value: hotlineVerguetungNachAufwandObergrenzeFesteLaufzeit) Euro.
  ]
]

== Sonstige Pflegeleistungen

#option(checkboxSonstigePflegeleistungenGemaessAnlage)[
  Der Auftragnehmer erbringt die in Anlage Nr. #fieldValue(value: sonstigePflegeleistungenGemaessAnlage) konkret beschriebenen sonstigen Pflegeleistungen.

  #option(checkboxSonstigePflegeleistungenVerguetungNichtGesondert)[
    Keine gesonderte Vergütung für die sonstigen Pflegeleistungen; die Vergütung für die sonstigen Pflegeleistungen ist in der Pflegepauschale enthalten.
  ]
  #option(checkboxSonstigePflegeleistungenVerguetungMonatlichePauschale)[
    Die gesonderte monatliche Pauschale für die sonstigen Pflegeleistungen beträgt #fieldValue(value: sonstigePflegeleistungenVerguetungMonatlichePauschale).
  ]
  #option(checkboxSonstigePflegeleistungenVerguetungNachAufwand)[
    Die Vergütung für die sonstigen Pflegeleistungen erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: sonstigePflegeleistungenVerguetungNachAufwandKategorien) aus Nummer 9.1

    #option(checkboxSonstigePflegeleistungenVerguetungNachAufwandObergrenze)[
      mit einer Obergrenze in Höhe von #fieldValue(value: sonstigePflegeleistungenVerguetungNachAufwandObergrenzeBetrag) Euro pro #fieldValue(value: sonstigePflegeleistungenVerguetungNachAufwandObergrenzeEinheit).
    ]
    #option(checkboxSonstigePflegeleistungenVerguetungNachAufwandObergrenzeFesteLaufzeit)[
      bei fester Laufzeit mit einer Obergrenze in Höhe von insgesamt #fieldValue(value: sonstigePflegeleistungenVerguetungNachAufwandObergrenzeFesteLaufzeit) Euro.
    ]
  ]
]
#option(checkboxSonstigePflegeleistungenInstallationVerantwortung)[
  Schuldet der Auftragnehmer nur die Installation oder ähnliche Leistungen im Hinblick auf neue Programmstände\*, nicht jedoch deren Überlassung, ist er abweichend von Ziffer 2.1.3 Satz 1 EVB-IT Pflege S-AGB auch nicht dafür verantwortlich, dass durch die neuen Programmstände keine Einschränkungen technischer, organisatorischer oder rechtlicher Art entstehen.
]




= Regelungen für die Pflege von Open Source Software

#option(checkboxPflegeOpenSourceLizenzbestandsaufnahme)[
  Der Auftragnehmer ist verpflichtet, hinsichtlich der pflegegegenständlichen Standardsoftware\* eine Lizenzbestandsaufnahme durchzuführen, deren Ergebnis eine vollständige Software Bill of Materials (SBOM\*) ist. Die Lizenzbestandsaufnahme ist unverzüglich nach Vertragsschluss durchzuführen.

  #option(checkboxPflegeOpenSourceLizenzbestandsaufnahmeFrist)[
    Die Lizenzbestandsaufnahme ist spätestens binnen #fieldValue(value: pflegeOpenSourceLizenzbestandsaufnahmeTage) Kalendertagen abzuschließen.
  ]
  #option(checkboxPflegeOpenSourceLizenzbestandsaufnahmeAbgegolten)[
    Die Vergütung für die Lizenzbestandsaufnahme ist mit der Pflegepauschale abgegolten.
  ]
  #option(checkboxPflegeOpenSourceLizenzbestandsaufnahmeAufwand)[
    Die Vergütung für die Lizenzbestandsaufnahme erfolgt nach Aufwand gemäß Kategorie(n) #fieldValue(value: pflegeOpenSourceLizenzbestandsaufnahmeKategorien) aus Nummer 9.1

    #option(checkboxPflegeOpenSourceLizenzbestandsaufnahmeObergrenze)[
      mit einer Obergrenze in Höhe von #fieldValue(value: pflegeOpenSourceLizenzbestandsaufnahmeObergrenzeEuro) Euro.
    ]
  ]
  #option(checkboxPflegeOpenSourceLizenzbestandsaufnahmePauschalfestpreis)[
    Die Vergütung für die Lizenzbestandsaufnahme erfolgt zu einem gesonderten Pauschalfestpreis in Höhe von #fieldValue(value: pflegeOpenSourceLizenzbestandsaufnahmePauschalfestpreisEuro) Euro.
  ]

  Die SBOM\* ist gemäß Ziffer 5.2 der EVB-IT Pflege S-AGB zu pflegen.
]
#option(checkboxPflegeOpenSourceNeueProgrammstaende)[
  Neue Programmstände\* von Standardsoftware\* bzw. Softwarekomponenten müssen stets

  #option(checkboxPflegeOpenSourceNeueProgrammstaendeTypA)[
    Open Source Software gemäß Definition der EVB-IT Überlassung-AGB (Typ A)\* sein,
  ]
  #option(checkboxPflegeOpenSourceNeueProgrammstaendeLizenzliste)[
    Open Source Software gemäß „Open Source Lizenzliste“ (verfügbar unter #link("https://evb-it.gov.de")[evb-it.gov.de]) sein,
  ]
  soweit die Parteien nicht im Einzelfall ausdrücklich etwas anderes vereinbaren.
]
#option(checkboxPflegeOpenSourceTestumgebung)[
  Der Auftragnehmer überlässt dem Auftraggeber neue Programmstände\* von Standardsoftware\* oder Softwarekomponenten nur, nachdem er diese in einer von ihm bereitgehaltenen, geeigneten Testumgebung auf Funktionalität und Eignung für die Zwecke des Auftraggebers erfolgreich getestet hat.

  #option(checkboxPflegeOpenSourceTestumgebungAuftraggeber)[
    Abweichend von Satz 1 stellt der Auftraggeber eine hierfür geeignete Umgebung zur Verfügung.
  ]
]
#option(checkboxPflegeOpenSourceKenntnisnahme)[
  Ist die Störungsbeseitigung oder die Überlassung neuer Programmstände\* vereinbart, so setzt der Auftragnehmer den Auftraggeber über das Erscheinen neuer Programmstände\* in Kenntnis und berät ihn dazu, wann ein neuer Programmstand\* übernommen werden sollte.
]
#option(checkboxPflegeOpenSourceErgebnissePlattform)[
  Der Auftragnehmer stellt die Ergebnisse der Pflegeleistungen zusätzlich zur Überlassung an den Auftraggeber auf derjenigen öffentlichen Plattform für Softwareentwicklungsprojekte zur Verfügung, auf der die gepflegte Standardsoftware\* bzw. Softwarekomponente hauptsächlich entwickelt und verwaltet wird.
  Die Zurverfügungstellung der Ergebnisse der Pflegeleistungen umfasst jeweils, soweit dort für frühere Programmstände\* vorhanden, auch den ausführbaren Code, die Pflege der Dokumentation, der Software Bill of Materials (SBOM)\* und eines Verzeichnisses verwendeter Softwarekomponenten.

  Zusätzlich erfolgt die Bereitstellung durch den Auftragnehmer wie folgt:

  #option(checkboxPflegeOpenSourceErgebnissePlattformManuell)[
    auf der folgenden öffentlichen Plattform für Softwareentwicklungsprojekte: #fieldValue(value: pflegeOpenSourcePlattform)
  ]
  #option(checkboxPflegeOpenSourceErgebnissePlattformOpenCode)[
    auf openCode\*
  ]
]




= Ergänzende Vereinbarungen bei Vergütung nach Aufwand

== Vereinbarung der Preiskategorien bei Vergütung nach Aufwand
#block[
  #set text(size: 9pt)

  #table(
    columns: (4%, 16%, 10%, 10%, 12%, 12%, 12%, 12%, 12%),
    inset: 0.5em,
    align: center + horizon,
    table.header(
      repeat: true,
      [*Lfd. Nr.*],
      [*Bezeichnung der Kategorie*],
      [*Stundensatz für Tätigkeiten innerhalb der Geschäftszeit*],
      [*Tagessatz für Tätigkeiten innerhalb der Geschäftszeit*],
      [*Zuschläge in Prozent auf die Stunden- und Tagessätze Montag bis Freitag (Arbeitstage) außerhalb der Geschäftszeit*],
      [*Zuschläge in Prozent auf die Stunden- und Tagessätze Samstag von #fieldValue(value: startzeitSamstagZeitraum1, length: 1.5cm) bis #fieldValue(value: endzeitSamstagZeitraum1, length: 1.5cm)*],
      [*Zuschläge in Prozent auf die Stunden- und Tagessätze Samstag von #fieldValue(value: startzeitSamstagZeitraum2, length: 1.5cm) bis #fieldValue(value: endzeitSamstagZeitraum2, length: 1.5cm)*],
      [*Zuschläge in Prozent auf die Stunden- und Tagessätze Sonn- und Feiertage von #fieldValue(value: startzeitSonnFeiertagZeitraum1, length: 1.5cm) bis #fieldValue(value: endzeitSonnFeiertagZeitraum1, length: 1.5cm)*],
      [*Zuschläge in Prozent auf die Stunden- und Tagessätze Sonn- und Feiertage von #fieldValue(value: startzeitSonnFeiertagZeitraum2, length: 1.5cm) bis #fieldValue(value: endzeitSonnFeiertagZeitraum2, length: 1.5cm)*],
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
  Abweichend von 8.2.4 Satz 2 EVB-IT Pflege S-AGB können bei entsprechendem Nachweis für einen Personentag bis zu 10 Stunden abgerechnet werden.
]
#option(checkboxPersonentag10StundenAnteiligAbgerechnet)[
  Abweichend von Ziffer 8.2.4 Sätze 2 und 3 EVB-IT Pflege S-AGB kann ein voller Tagessatz nur in Rechnung gestellt werden, wenn mindestens 10 Stunden geleistet wurden.
  Werden weniger als 10 Zeitstunden pro Tag geleistet, sind diese anteilig in Rechnung zu stellen.
]
#option(checkboxVerguetungTagessaetzeGemaessAnlage)[
  weitere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: verguetungTagessaetzeGemaessAnlage).
]

== Reisekosten/Nebenkosten\*/Reisezeiten

#option(checkboxReisekostenNichtGesondert)[
  Reisekosten werden nicht gesondert vergütet.
]
#option(checkboxReisekostenGemaessAnlage)[
  Reisekosten werden vergütet gemäß Anlage Nr. #fieldValue(value: reisekostenGemaessAnlage).
]
#option(checkboxNebenkostenNichtGesondert)[
  Nebenkosten\* werden nicht gesondert vergütet.
]
#option(checkboxNebenkostenGemaessAnlage)[
  Nebenkosten\* werden vergütet gemäß Anlage Nr. #fieldValue(value: nebenkostenGemaessAnlage).
]
#option(checkboxReisezeitenNichtGesondert)[
  Reisezeiten werden nicht gesondert vergütet.
]
#option(checkboxReisezeitenAnteiligArbeitszeit)[
  Reisezeiten werden zu 50% als Arbeitszeiten vergütet.
]
#option(checkboxReisezeitenGemaessAnlage)[
  Reisezeiten werden vergütet gemäß Anlage Nr. #fieldValue(value: reisekostenGemaessAnlage).
]

== Besondere Bestimmungen zur Vergütung nach Aufwand

#option(checkboxBesondereBestimmungenVerguetungAufwandGemaessAnlage)[
  Besondere Bestimmungen zur Vergütung nach Aufwand sind in Anlage Nr. #fieldValue(value: besondereBestimmungenVerguetungAufwandGemaessAnlage) vereinbart.
]




= Abnahme

#option(checkboxAbnahmeGemaessAnlage)[
  Regelung zur Abnahme für die Leistungen gemäß Nummer(n) #fieldValue(value: abnahmeLeistungNummer) ergeben sich aus Anlage Nr. #fieldValue(value: abnahmeGemaessAnlage).
]




= Mängelhaftung (Gewährleistung)

#option(checkboxMaengelhaftungAbweichendeVerjaehrungsfrist)[
  Es gilt Ziffer 11.1 EVB-IT Pflege S-AGB mit der Maßgabe, dass für Sach- und Rechtsmängel die Verjährungsfrist statt 12 Monate #fieldValue(value: maengelhaftungAbweichendeVerjaehrungsfrist) Monate beträgt.
]
#option(checkboxMaengelhaftungAbweichendeVerjaehrungsfristGemaessAnlage)[
  Die Verjährungsfristen für Sach- und Rechtsmängel ergeben sich aus Anlage Nr. #fieldValue(value: maengelhaftungAbweichendeVerjaehrungsfristGemaessAnlage).
]
#option(checkboxMaengelhaftungSachmaengelAusschluss)[
  Sofern es sich bei der pflegegegenständlichen Standardsoftware\* vollständig um Open Source Software\* handelt, ist die verschuldensunabhängige Haftung für Sachmängel bei Überlassung neuer Programmstände\* ausgeschlossen.

  #option(checkboxMaengelhaftungSachmaengelVerguetung)[
    Auf Wunsch des Auftraggebers wird der Auftragnehmer gleichwohl den Sachmangel gegen Vergütung nach Aufwand gemäß Kategorie(n) aus Nummer 9.1

    #option(checkboxMaengelhaftungSachmaengelObergrenze)[
      mit einer Obergrenze in Höhe von #fieldValue(value: maengelhaftungSachmaengelObergrenzeEuro) Euro pro #fieldValue(value: maengelhaftungSachmaengelObergrenzePro)
    ]

    beseitigen.
  ]
]
#option(checkboxMaengelhaftungRechtsmaengelAusschluss)[
  Sofern es sich bei der pflegegegenständlichen Standardsoftware\* vollständig um Open Source Software\* handelt, ist die verschuldensunabhängige Haftung für Rechtsmängel bei Überlassung neuer Programmstände\* ausgeschlossen.

  #option(checkboxMaengelhaftungRechtsmaengelVerguetung)[
    Auf Wunsch des Auftraggebers wird der Auftragnehmer gleichwohl den Rechtsmangel gegen Vergütung nach Aufwand gemäß Kategorie(n) aus Nummer 9.1

    #option(checkboxMaengelhaftungRechtsmaengelObergrenze)[
      mit einer Obergrenze in Höhe von #fieldValue(value: maengelhaftungRechtsmaengelObergrenzeEuro) Euro pro #fieldValue(value: maengelhaftungRechtsmaengelObergrenzePro)
    ]

    beseitigen.
  ]
]
#option(checkboxMaengelhaftungAusschlussPatentverletzung)[
  Der Ausschluss der Rechtsmängelhaftung wegen Patentverletzungen, die Dritte gegen den Auftraggeber wegen einer Nutzung außerhalb von EU und EFTA geltend machen (Ziffer 11.2 EVB-IT Pflege-AGB), gilt nicht.
]
#option(checkboxMaengelhaftungWeitereVereinbarungenGemaessAnlage)[
  Weitere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: maengelhaftungWeitereVereinbarungenGemaessAnlage).
]




= Haftungsregelungen

== Haftungsobergrenze bei leicht fahrlässiger Pflichtverletzung

#option(checkboxHaftungsregelungAbweichendEVBAGBMultiple)[
  Abweichend von Ziffer 14.1 Satz 2 EVB-IT Pflege S-AGB beträgt die Haftungsobergrenze bei leicht fahrlässiger Pflichtverletzungen maximal das #fieldValue(value: haftungsregelungAbweichendEVBAGBMultiple)fache (statt des Doppelten), der bis zum Tag der Geltendmachung als Durchschnittswert pro Vertragsjahr geschuldeten Vergütung, wobei etwaige Reduktionen der Vergütung für das erste Vertragsjahr wegen Mängelansprüchen außer Betracht bleiben.
]
#option(checkboxHaftungsregelungAbweichendEVBAGObergrenze)[
  Abweichend von Ziffer 14.1 EVB-IT Pflege S-AGB beträgt die Haftungsobergrenze bei leicht fahrlässigen Pflichtverletzungen

  #option(checkboxHaftungsregelungAbweichendEVBAGBObergrenzeProSchadensfall)[
    pro Schadensfall #fieldValue(value: haftungsregelungAbweichendEVBAGBObergrenzeProSchadensfall) Euro.
  ]
  #option(checkboxHaftungsregelungAbweichendEVBAGBObergrenzeVetrag)[
    insgesamt für diesen Vertrag #fieldValue(value: haftungsregelungAbweichendEVBAGBObergrenzeVertrag) Euro.
  ]
]
#option(checkboxHaftungsregelungAbweichendEVBAGBGemaessAnlage)[
  Abweichend von Ziffer 14.1 EVB-IT Pflege S-AGB gelten für die Haftung bei leicht fahrlässigen Pflichtverletzungen die Regelungen gemäß Anlage Nr. #fieldValue(value: haftungsregelungAbweichendEVBAGBGemaessAnlage).
]

== Haftung für entgangenen Gewinn

#option(checkboxHaftungsregelungEntgangenerGewinn)[
  Abweichend von Ziffer 14.3 EVB-IT Pflege S-AGB haftet der Auftragnehmer auch für entgangenen Gewinn.
]




= Vertragsstrafen

== Nichteinhaltung von vereinbarten Reaktionszeiten\*
#option(checkboxVertragsstrafenReaktionszeitenEVBAGB)[
  Ziffer 9.2 der EVB-IT Pflege S-AGB gilt mit der Maßgabe, dass für die Nichteinhaltung von Reaktionszeiten\* folgende Vertragsstrafen vereinbart werden:

  #table(
    columns: (33.3%, 33.3%, 33.4%),
    inset: 0.5em,
    align: center + horizon,
    table.header(
      repeat: true,
      [*Leistungsart Nummer*], [*Überschreitung um*], [*Vertragsstrafe*],
    ),
    ..vertragsstrafenReaktionszeitenZeilen,
    table.cell(colspan: 2, align: left)[insgesamt pro Vertragsjahr jedoch maximal],
    fieldValue(value: vertragsstrafenReaktionszeitenMaximal, length: 100%),
  )
]
#option(checkboxVertragsstrafenReaktionszeitenGemaessAnlage)[
  Hinsichtlich der Nichteinhaltung von Reaktionszeiten\* gelten die Regelungen in Anlage Nr. #fieldValue(value: vertragsstrafenReaktionszeitenGemaessAnlage).
]

== Nichteinhaltung von vereinbarten Wiederherstellungszeiten\*

#option(checkboxVertragsstrafenWiederherstellungszeitenEVBAGB)[
  Ziffer 9.2 EVB-IT Pflege S-AGB gilt mit der Maßgabe, dass für die Nichteinhaltung von Wiederherstellungszeiten\* folgende Vertragsstrafen vereinbart werden:

  #table(
    columns: (33.3%, 33.3%, 33.4%),
    inset: 0.5em,
    align: center + horizon,
    table.header(
      repeat: true,
      [*Leistungsart Nummer*], [*Überschreitung um*], [*Vertragsstrafe*],
    ),
    ..vertragsstrafenWiederherstellungszeitenZeilen,
    table.cell(colspan: 2, align: left)[insgesamt pro Vertragsjahr jedoch maximal],
    fieldValue(value: vertragsstrafenWiederherstellungszeitenMaximal, length: 100%),
  )
]

#option(checkboxVertragsstrafenWiederherstellungszeitenGemaessAnlage)[
  Hinsichtlich der Nichteinhaltung von Wiederherstellungszeiten\* gelten die Regelungen in Anlage Nr. #fieldValue(value: vertragsstrafenWiederherstellungszeitenGemaessAnlage).
]

== Sonstige Vertragsstrafen

#option(checkboxVertragsstrafenSonstige)[
  Für jeden Verstoß gegen Ziffer 1.4 oder Ziffer 1.5 der EVB-IT Pflege S-AGB wird eine Vertragsstrafe in Höhe von #fieldValue(value: vertragsstrafenSonstige) Euro vereinbart.
  Dies gilt nicht, wenn der Auftragnehmer den Verstoß nicht zu vertreten hat.
]




= Ansprechpartner
Ansprechpartner des Auftraggebers:

#fieldValue(value: ansprechpartnerAuftraggeber)

Ansprechpartner des Auftragnehmers:

#fieldValue(value: ansprechpartnerAuftragnehmer)




= Weitere Regelungen

== Besondere Anforderungen an Mitarbeiter des Auftragnehmers

#option(checkboxBesondereAnforderungenMitarbeiterMindestanforderungen)[
  Mindestanforderungen an das einzusetzende Personal des Auftragnehmers:

  #table(
    columns: (6%, 22%, 28%, 18%, 26%),
    inset: 0.5em,
    align: center + horizon,
    table.header(
      repeat: true,
      [*Lfd. Nr.*],
      [*Position*],
      [*Fachliche Qualifikation*],
      [*Sicherheitsüberprüfung Ü 1, 2 oder 3*#footnote[Stufen der Sicherheitsüberprüfung gemäß Sicherheitsüberprüfungsgesetz]],
      [*Sonstige Anforderungen*],
    ),
    ..besondereAnforderungenMitarbeiterZeilen.flatten(),
  )
]
#option(checkboxBesondereAnforderungenMitarbeiterAbweichend)[
  Abweichend von Ziffer 7.1 EVB-IT Pflege S-AGB ist der Auftragnehmer nicht verpflichtet, für die Aufgaben gemäß Anlage Nr. #fieldValue(value: besondereAnforderungenMitarbeiterAbweichendAnlage) nur Personal einzusetzen, welches bereit ist, sich aufgrund des Verpflichtungsgesetzes verpflichten zu lassen.
]
#option(checkboxBesondereAnforderungenMitarbeiterAnlage)[
  Mindestanforderungen an das einzusetzende Personal des Auftragnehmers ergeben sich aus Anlage Nr. #fieldValue(value: besondereAnforderungenMitarbeiterAnlage).
]

== Allgemeine Sicherheitsanforderungen
Der Auftragnehmer verpflichtet sich für die Laufzeit des Vertrages

#option(checkboxAllgemeineSicherheitsanforderungenITSicherheit)[
  bei der Erbringung der vertraglichen Leistungen die Regelungen zur IT-Sicherheit gemäß Anlage Nr. #fieldValue(value: allgemeineSicherheitsanforderungenITSicherheitAnlage) zu beachten.
]
#option(checkboxAllgemeineSicherheitsanforderungenGeheimschutz)[
  der Geheimschutzbetreuung gemäß Anlage Nr. #fieldValue(value: allgemeineSicherheitsanforderungenGeheimschutzAnlage) zu unterstellen.
]
#option(checkboxAllgemeineSicherheitsanforderungenEinsatzort)[
  die Regelungen des Auftraggebers zur Sicherheit am Einsatzort gemäß Anlage Nr. #fieldValue(value: allgemeineSicherheitsanforderungenEinsatzortAnlage) zu beachten.
]
#option(checkboxAllgemeineSicherheitsanforderungenWeitere)[
  folgende weitere Regelungen einzuhalten: #fieldValue(value: allgemeineSicherheitsanforderungenWeitereRegelungen)
]

== Kopier- oder Nutzungssperre\* / besondere technische Merkmale

#option(checkboxBesondereTechnischeMerkmaleKeineSperren)[
  Die Leistungen des Auftragnehmers weisen keine Kopier- oder Nutzungssperren\* auf.
]
#option(checkboxBesondereTechnischeMerkmaleMitSperren)[
  Die Leistungen des Auftragnehmers weisen folgende Kopier- oder Nutzungssperren\* auf: #fieldValue(value: besondereTechnischeMerkmaleMitSperrenText).
  Näheres siehe Anlage Nr. #fieldValue(value: besondereTechnischeMerkmaleMitSperrenAnlage).
]
#option(checkboxBesondereTechnischeMerkmaleNichtMerkmale)[
  Die Leistungen des Auftragnehmers weisen folgende technische Merkmale *nicht* auf: #fieldValue(value: besondereTechnischeMerkmaleNichtMerkmaleText).
  Näheres siehe Anlage Nr. #fieldValue(value: besondereTechnischeMerkmaleNichtMerkmaleAnlage).
]

== Haftpflichtversicherung

#option(checkboxHaftpflichtversicherungNachweis)[
  Der Nachweis einer Haftpflichtversicherung gemäß Ziffer 17 EVB-IT Pflege S-AGB wird vereinbart.
]

== Teleservice\*
#option(checkboxTeleserviceGrundlage)[
  Soweit der Auftragnehmer zur Leistung durch Teleservice\* berechtigt ist, wird er diesen ausschließlich aufgrund der Teleservicevereinbarung gemäß Anlage Nr. #fieldValue(value: teleserviceAnlageNr) erbringen und darf dabei ausschließlich folgendes automatisiertes Verfahren einsetzen: #fieldValue(value: teleserviceVerfahren).
  Dieses Verfahren muss neben den Anforderungen aus Ziffer 1.4 EVB-IT Pflege S-AGB auch den Anforderungen aus der Anlage Nr. #fieldValue(value: teleserviceAnforderungenAnlageNr) genügen.
]

== Datenschutz, Geheimhaltung und Sicherheit

#option(checkboxDatenschutzGeheimhaltung)[
  Ergänzend zu bzw. abweichend von Ziffer 18 EVB-IT Pflege S-AGB ergeben sich Regelungen zur Geheimhaltung bzw. zur Sicherheit aus Anlage Nr. #fieldValue(value: datenschutzGeheimhaltungAnlage).
]
#option(checkboxDatenschutzAuftragsdatenverarbeitung)[
  Da durch den Auftragnehmer personenbezogene Daten im Auftrag des Auftraggebers verarbeitet werden sollen (Auftragsdatenverarbeitung), treffen die Parteien in Anlage Nr. #fieldValue(value: datenschutzAuftragsdatenverarbeitungAnlage) eine schriftliche Vereinbarung, die zumindest die gesetzlichen Mindestanforderungen beinhaltet.
]
#option(checkboxDatenschutzSonstige)[
  Die Parteien treffen sonstige Vereinbarungen zum Datenschutz gemäß Anlage Nr. #fieldValue(value: datenschutzSonstigeAnlage).
]

== Dokumentation und Software Bill of Materials

#option(checkboxDokumentationAbweichend)[
  Abweichend von Ziffer 5 EVB-IT Pflege S-AGB dokumentiert der Auftragnehmer die Pflegeleistungen nicht in deutscher, sondern in #fieldValue(value: dokumentationAbweichendSprache) Sprache.
]
#option(checkboxSBOMAktualisierung)[
  Der Auftragnehmer aktualisiert die Software Bill(s) of Materials (SBOM)\* der zu pflegenden Standardsoftware\* wie in Ziffer 5.2 EVB-IT Pflege S-AGB geregelt.

  #option(checkboxSBOMAbweichend)[
    Abweichend von Ziffer 5.2 EVB-IT Pflege S-AGB erfolgt die Bereitstellung der Software Bill of Materials (SBOM)\* gemäß BSI TR-03183-2 in folgendem Format: #fieldValue(value: sbomAbweichendFormat).
  ]
]

== Erfüllungsort
Erfüllungsort ist #fieldValue(value: erfuellungsort).




= Sonstige Vereinbarungen

#option(checkboxSonstigeVereinbarungen)[
  Sonstige Vereinbarungen: #fieldValue(value: sonstigeVereinbarungen).
]
#option(checkboxSonstigeVereinbarungenGemaessAnlage)[
  Die sonstigen Vereinbarungen ergeben sich aus Anlage Nr. #fieldValue(value: sonstigeVereinbarungenGemaessAnlage).
]

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
