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
  contractTitle: "Kriterienkatalog für Cloudleistungen",
  contractVersion: "Version 1.0.1",
  contractDate: "(Stand: 01.03.2022)",
  hint: "Die mit * gekennzeichneten Begriffe sind am Ende der EVB-IT Cloud-AGB definiert.",
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

// Anlagennummerierung und Cloudvertrag-Referenz
#let nummerAnlage = ""
#let referenzCloudvertrag = ""
#let gueltigkeitsbereichFuerLeistungen = ""

// Kriterien-Tabelle - Art der Cloud
#let checkboxPublicCloud = false

#let checkboxPrivateCloud = false
#let privateCloudGemaessAnlage = ""

// Kriterien-Tabelle - Managed Cloud Services
#let checkboxAuftragnehmerErgaenzendeLeistungen = false
#let checkboxAuftragnehmerErgaenzendeLeistungenAdministrationGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenAdministrationGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenHotlineGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenHotlineGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenKapazitaetsmanagementGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenKapazitaetsmanagementGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenAutomatisierungGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenAutomatisierungGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenProblemmanagementGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenProblemmanagementGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenReleasemanagementGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenReleasemanagementGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenBeratungGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenBeratungGemaessAnlage = ""
#let checkboxAuftragnehmerErgaenzendeLeistungenIndividuellGemaessAnlage = false
#let auftragnehmerErgaenzendeLeistungenIndividuellBezeichnung = ""
#let auftragnehmerErgaenzendeLeistungenIndividuellGemaessAnlage = ""

#let checkboxAuftragnehmerMitwirkungsleistungenGemaessAnlage = false
#let auftragnehmerMitwirkungsleistungenGemaessAnlage = ""

// Kriterien-Tabelle - Leistungsort
#let checkboxDatenverarbeitungStaatenMitAngemessenheitsbeschluss = false

#let checkboxDatenverarbeitungOhneOertlicheBeschraenkungen = false

#let checkboxDatenverarbeitungOhneOertlicheBeschraenkungenGemaessAnlage = false
#let datenverarbeitungOhneOertlicheBeschraenkungenGemaessAnlage = ""

#let checkboxDatenverarbeitungDeutschland = false

#let checkboxDatenverarbeitungInRechenzentren = false
#let datenverarbeitungInRechenzentren = ""

#let checkboxDatenverarbeitungSupportzwecke = false
#let checkboxDatenverarbeitungSupportzweckeIndividuell = false
#let datenverarbeitungSupportzweckeIndividuell = ""
#let checkboxDatenverarbeitungSupportzweckeAusserhalbEU = false

#let checkboxDatenverarbeitungMetadatenEU = false

#let checkboxDatenverarbeitungAuftragnehmerAGB = false

#let checkboxDatenverarbeitungIndividuell = false
#let datenverarbeitungIndividuell = ""

// Kriterien-Tabelle - Georedundanz
#let checkboxGeoredundanz = false

// Kriterien-Tabelle - Übergabepunkt
#let checkboxUebergabepunktAuftragnehmerAGB = false

#let checkboxUebergabepunktIndividuell = false
#let uebergabepunktIndividuell = ""

// Kriterien-Tabelle - Bereitstellungszeitpunkt
#let checkboxBereitstellungVertragsbeginn = false

#let checkboxBereitstellungStartzeitpunkt = false
#let bereitstellungStartzeitpunkt = ""

#let checkboxBereitstellungAufAnforderung = false
#let bereitstellungAufAnforderung = ""

// Kriterien-Tabelle - Nutzer
#let checkboxNutzerGleichzeitigeNutzer = false
#let nutzerGleichzeitigeNutzer = ""

#let checkboxNutzerBenannteNutzer = false
#let nutzerBenannteNutzer = ""
#let checkboxNutzerBenannteNutzerImmerAustauschbar = false
#let checkboxNutzerBenannteNutzerMitGrundAustauschbar = false
#let nutzerBenannteNutzerMitGrundAustauschbar = ""

#let checkboxNutzerGemaessAuftragnehmerAGB = false

#let checkboxNutzerGemaessAnlage = false
#let nutzerGemaessAnlage = ""

// Kriterien-Tabelle - Nutzerkreis
#let checkboxNutzerkreisOhneBeschraenkung = false

#let checkboxNutzerkreisIndividuell = false
#let nutzerkreisIndividuell = ""

// Kriterien-Tabelle - Nutzungsort
#let checkboxNutzungsortEU = false

// Kriterien-Tabelle - IDM
#let checkboxSelfServiceZugangsberechtigungen = false

#let checkboxVerhinderungLeistungsbuchung = false

// Kriterien-Tabelle - Nutzungsumfang
#let checkboxNutzungGeraetemetrik = false
#let nutzungGeraetemetrik = ""

#let checkboxNutzungAndereMetrikGemaessAnlage = false
#let nutzungAndereMetrikGemaessAnlage = ""

#let checkboxNutzungErweiterungReduzierung = false

#let checkboxNutzungAuftragnehmerAGB = false

#let checkboxNutzungIndividuell = false
#let nutzungIndividuell = ""

// Kriterien-Tabelle - Zugang
#let checkboxZugangWebbasiert = false

#let checkboxZugangWebbasiertMobiloptimiert = false

#let checkboxZugangNichtUnterstuetzteBrowser = false
#let zugangNichtUnterstuetzteBrowser = ""
#let checkboxZugangWebbasiertKeinePlugins = false
#let checkboxZugangWebbasiertZugelassenePlugins = false
#let zugangWebbasiertZugelassenePlugins = ""
#let checkboxZugangWebbasiertEinstellungen = false
#let zugangWebbasiertEinstellungen = ""

#let checkboxZugangTerminalserver = false
#let zugangTerminalserver = ""

#let checkboxZugangVPN = false
#let checkboxZugangVPNAnforderungen = false
#let zugangVPNAnforderungen = ""

#let checkboxZugangAPI = false
#let checkboxZugangAPIAnforderungen = false
#let zugangAPIAnforderungen = ""

#let ZugangZugriffssoftwareName = ""

#let checkboxZugangZugriffssoftwarePC = false
#let checkboxZugangZugriffssoftwarePCWindows = false
#let zugangZugriffssoftwarePCWindows = ""
#let checkboxZugangZugriffssoftwarePCAndere = false
#let zugangZugriffssoftwarePCAndere = ""

#let checkboxZugangZugriffssoftwareMobil = false
#let checkboxZugangZugriffssoftwareMobilIOS = false
#let zugangZugriffssoftwareMobilIOS = ""
#let checkboxZugangZugriffssoftwareMobilAndroid = false
#let zugangZugriffssoftwareMobilAndroid = ""
#let checkboxZugangZugriffssoftwareMobilAndere = false
#let zugangZugriffssoftwareMobilAndere = ""

#let checkboxZugangZugriffssoftwareSystemvoraussetzungen = false
#let zugangZugriffssoftwareSystemvoraussetzungen = ""

#let checkboxZugangZugriffssoftwareTechnischeAnforderungen = false
#let zugangZugriffssoftwareTechnischeAnforderungen = ""

#let checkboxZugangZugriffssoftwareInstallationshilfe = false

#let checkboxZugangZugriffssoftwareGemaessAuftragnehmerAGB = false

#let checkboxZugangZugriffssoftwareIndividuell = false
#let zugangZugriffssoftwareIndividuell = ""

// Kriterien-Tabelle - Speichergröße
#let checkboxSpeicherKeineSpeicherung = false

#let checkboxSpeicherSpeicherung = false
#let checkboxSpeicherFesteGroesse = false
#let speicherFesteGroesse = ""
#let checkboxSpeicherDynamischeGroesse = false
#let speicherDynamischeGroesseMin = ""
#let speicherDynamischeGroesseMax = ""
#let checkboxSpeicherDynamischeAnpassung = false
#let checkboxSpeicherKeineLimitierung = false

// Kriterien-Tabelle - Art der Anbindung
#let checkboxAnbindungMPLS = false
#let checkboxAnbindungMPLSDSL = false
#let anbindungMPLSDSL = ""
#let checkboxAnbindungMPLSEthernet = false
#let anbindungMPLSEthernet = ""

#let checkboxAnbindungIPSec = false
#let anbindungIPSec = ""

#let checkboxAnbindungDirektverbindung = false
#let anbindungDirektverbindung = ""

#let checkboxAnbindungSDWAN = false
#let anbindungSDWAN = ""

#let checkboxAnbindungTLS = false
#let anbindungTLS = ""

#let checkboxAnbindungGemaessAnlage = false
#let anbindungGemaessAnlage = ""

#let checkboxAnbindungRedundanz = false

// Kriterien-Tabelle - Bandbreite Internet
#let checkboxBandbreiteMbits = false
#let bandbreiteMbits = ""

#let checkboxBandbreiteasync = false
#let checkboxBandbreiteAsyncUplink = false
#let bandbreiteAsyncUplink = ""
#let checkboxBandbreiteAsyncDownlink = false
#let bandbreiteAsyncDownlink = ""

#let checkboxBandbreiteDynamisch = false
#let bandbreiteDynamischMin = ""
#let bandbreiteDynamischMax = ""

#let checkboxBandbreiteIndividuell = false
#let bandbreiteIndividuell = ""

// Kriterien-Tabelle - Datensicherung
#let checkboxDatensicherungBackupPflicht = false

#let checkboxDatensicherungBackupGegenstand = false
#let checkboxDatensicherungBackupGegenstandImage = false
#let checkboxDatensicherungBackupGegenstandDaten = false
#let datensicherungBackupGegenstandDaten = ""
#let checkboxDatensicherungBackupGegenstandIndividuell = false
#let datensicherungBackupGegenstandIndividuell = ""

#let checkboxDatensicherungBackupFormat = false
#let datensicherungBackupFormat = ""

#let checkboxDatensicherungBackupZeitpunkte = false
#let datensicherungBackupZeitpunkte = ""

#let checkboxDatensicherungBackupOrt = false
#let datensicherungBackupOrt = ""
#let datensicherungBackupOrtMedium = ""

#let checkboxDatensicherungBackupKopieOrt = false
#let datensicherungBackupKopieOrt = ""
#let datensicherungBackupKopieOrtMedium = ""

#let checkboxDatensicherungBackupLoeschung = false
#let checkboxDatensicherungBackupLoeschungFruehestens = false
#let datensicherungBackupLoeschungFruehestens = ""
#let checkboxDatensicherungBackupLoeschungGemaessAnlage = false
#let datensicherungBackupLoeschungGemaessAnlage = ""

#let checkboxDatensicherungBackupLoeschungWeitereRegelungenGemaessAnlage = false
#let datensicherungBackupLoeschungWeitereRegelungenGemaessAnlage = ""

#let checkboxDatensicherungBackupRegelungenGemaessAnlage = false
#let datensicherungBackupRegelungenGemaessAnlage = ""

#let checkboxDatensicherungBackupWiederherstellungGesamterStand = false

#let checkboxDatensicherungBackupWiederherstellungGesonderteBereitstellung = false

#let checkboxDatensicherungBackupWiederherstellungstestsInfo = false

#let checkboxDatensicherungGemaessAuftragnehmerAGB = false

#let checkboxDatensicherungIndividuell = false
#let datensicherungIndividuell = ""

#let checkboxDatensicherungDurchAuftraggeber = false
#let datensicherungDurchAuftraggeber = ""

// Kriterien-Tabelle - Datenexport / Datenimport
#let checkboxDatenExportImportZusatzEVBAGB = false
#let checkboxDatenExportImportZusatzDatenexport = false
#let datenExportImportZusatzDatenexportLeistungen = ""
#let datenExportImportZusatzDatenexportTurnus = ""
#let datenExportImportZusatzDatenexportFormat = ""
#let datenExportImportZusatzDatenexportOrt = ""
#let datenExportImportZusatzDatenexportMedium = ""
#let checkboxDatenExportImportZusatzDatenimport = false
#let datenExportImportZusatzDatenimportLeistungen = ""
#let datenExportImportZusatzDatenimportTurnus = ""
#let datenExportImportZusatzDatenimportFormat = ""
#let datenExportImportZusatzDatenimportOrt = ""
#let datenExportImportZusatzDatenimportMedium = ""

#let checkboxDatenExportImportStandardAuftragnehmer = false
#let datenExportImportStandardAuftragnehmer = ""

#let checkboxDatenExportImportStandardAuftraggeber = false
#let datenExportImportStandardAuftraggeber = ""

// Kriterien-Tabelle - IT-Sicherheit
#let checkboxITSicherheitAlleC5Zusatzkriterien = false

#let checkboxITSicherheitAuswahlC5Zusatzkriterien = false
#let checkboxITSicherheitAuswahlC5ZusatzkriterienCRY03 = false
#let checkboxITSicherheitAuswahlC5ZusatzkriterienAM05 = false
#let checkboxITSicherheitAuswahlC5ZusatzkriterienOPS22 = false

#let checkboxITSicherheitAbweichungenITSicherheit = false
#let checkboxITSicherheitAbweichungenITSicherheitISO27001 = false
#let checkboxITSicherheitAbweichungenITSicherheitNotfallmanagement = false
#let checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementBSI = false
#let checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementISO22301 = false
#let checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementIndividuell = false
#let iTSicherheitAbweichungenITSicherheitNotfallmanagementIndividuell = ""
#let checkboxITSicherheitAbweichungenITSicherheitVereinbarungenGemaessAnlage = false
#let iTSicherheitAbweichungenITSicherheitVereinbarungenGemaessAnlage = ""
#let checkboxITSicherheitAbweichungenITSicherheitNachweis = false
#let checkboxITSicherheitAbweichungenITSicherheitNachweisZertifikate = false
#let checkboxITSicherheitAbweichungenITSicherheitNachweisSpezifischeZertifikate = false
#let iTSicherheitAbweichungenITSicherheitNachweisSpezifischeZertifikate = ""
#let checkboxITSicherheitAbweichungenITSicherheitNachweisIndividuell = false
#let iTSicherheitAbweichungenITSicherheitNachweisIndividuell = ""
#let checkboxITSicherheitAbweichungenITSicherheitVerschluesselung = false

#let checkboxITSicherheitAbweichungenC5GemaessAnlage = false
#let iTSicherheitAbweichungenC5GemaessAnlage = ""

#let checkboxITSicherheitMonitoringSchnittstelle = false

#let checkboxITSicherheitSchutzbedarfGemaessAnlage = false
#let iTSicherheitSchutzbedarfGemaessAnlage = ""

#let checkboxITSicherheitCERTGemaessAnlage = false
#let iTSicherheitCERTGemaessAnlage = ""

#let checkboxITSicherheitPenetrationstest = false

#let checkboxITSicherheitPruefkostenuebernahmeAuftraggeber = false
#let iTSicherheitPruefkostenuebernahmeAuftraggeber = ""

#let checkboxITSicherheitAnlassunabhaengigePruefung = false
#let iTSicherheitAnlassunabhaengigePruefung = ""

// Kriterien-Tabelle - Verfügbarkeit
#let checkboxVerfuegbarkeitAbweichendEVBAGB = false
#let checkboxVerfuegbarkeitVerfuegbarkeitsklasse = false
#let verfuegbarkeitVerfuegbarkeitsklasse = ""
#let checkboxVerfuegbarkeitVerfuegbarkeitsklasseBezugszeitraum = false
#let verfuegbarkeitVerfuegbarkeitsklasseBezugszeitraum = ""
#let checkboxVerfuegbarkeitVerfuegbarkeitsklasseZeitangaben = false
#let verfuegbarkeitVerfuegbarkeitsklasseZeitangaben = ""
#let checkboxVerfuegbarkeitBetriebszeit = false
#let verfuegbarkeitBetriebszeitWochentagBeginn = ""
#let verfuegbarkeitBetriebszeitWochentagEnde = ""
#let verfuegbarkeitBetriebszeitUhrzeitBeginn = ""
#let verfuegbarkeitBetriebszeitUhrzeitEnde = ""
#let checkboxVerfuegbarkeitKernbetriebszeit = false
#let verfuegbarkeitKernbetriebszeitUhrzeitBeginn = ""
#let verfuegbarkeitKernbetriebszeitUhrzeitEnde = ""
#let verfuegbarkeitKernbetriebszeitLeistungsmerkmaleGemaessAnlage = ""
#let checkboxVerfuegbarkeitWartungsarbeiten = false
#let verfuegbarkeitWartungsarbeitenUhrzeitBeginn = ""
#let verfuegbarkeitWartungsarbeitenUhrzeitEnde = ""
#let verfuegbarkeitWartungsarbeitenWochentag = ""

#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeit = false
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitEineStunde = false
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitEinTag = false
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitIndividuell = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitIndividuell = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktion = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktionBezeichnung = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktionZeit = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatz = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzUebergabepunkt = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzMenge = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzZeit = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerung = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungStart = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungZiel = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungZeit = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitRTD = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitRTDZeit = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrate = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrateZeiteinheit = ""
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrateVerlust = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitNutzer = false
#let verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitNutzer = ""

#let checkboxVerfuegbarkeitErsetzendEVBAGBGemaessAnlage = false
#let verfuegbarkeitErsetzendEVBAGBGemaessAnlage = ""

#let checkboxVerfuegbarkeitErgaenzendEVBAGBStoerung = false
#let checkboxVerfuegbarkeitErgaenzendEVBAGBStoerungBetriebsverhindernd = false
#let verfuegbarkeitErgaenzendEVBAGBStoerungBetriebsverhindernd = ""
#let checkboxVerfuegbarkeitErgaenzendEVBAGBStoerungBetriebsbehindernd = false
#let verfuegbarkeitErgaenzendEVBAGBStoerungBetriebsbehindernd = ""

// Kriterien-Tabelle - Gutschrift Nichtverfügbarkeit
#let checkboxGutschriftNichtverfuegbarkeitTabelle = false
#let gutschriftNichtverfuegbarkeitTabelleUnterschreitung01 = ""
#let gutschriftNichtverfuegbarkeitTabelleUnterschreitung12 = ""
#let gutschriftNichtverfuegbarkeitTabelleUnterschreitung23 = ""
#let gutschriftNichtverfuegbarkeitTabelleUnterschreitung34 = ""
#let gutschriftNichtverfuegbarkeitTabelleUnterschreitung4 = ""

#let checkboxGutschriftNichtverfuegbarkeitAuftragnehmerAGB = false

#let checkboxGutschriftNichtverfuegbarkeitIndividuell = false
#let gutschriftNichtverfuegbarkeitIndividuell = ""

#let checkboxGutschriftNichtverfuegbarkeitMesspunkte = false
#let gutschriftNichtverfuegbarkeitMesspunkte = ""

// Kriterien-Tabelle - Reaktions- und Wiederherstellungszeiten
#let checkboxReaktionsWiederherstellungszeiten = false
#let reaktionszeitSchwerwiegendeStoerung = ""
#let wiederherstellungszeitSchwerwiegendeStoerung = ""
#let reaktionszeitErheblicheStoerung = ""
#let wiederherstellungszeitErheblicheStoerung = ""
#let reaktionszeitLeichteStoerung = ""
#let wiederherstellungszeitLeichteStoerung = ""

// Kriterien-Tabelle - Protokollierung
#let checkboxProtokollierungZugriffAuftraggeberLeistungen = false

#let checkboxProtokollierungZugriffInfrastrukturkomponenten = false

#let checkboxProtokollierungSicherheitsstatusCloudmanagement = false

#let checkboxProtokollierungDatensicherung = false

#let checkboxProtokollierungAufbewahrungDauer = false
#let checkboxProtokollierungAufbewahrungDauer6Monate = false
#let checkboxProtokollierungAufbewahrungDauerIndividuell = false
#let protokollierungAufbewahrungDauerIndividuell = ""

#let checkboxProtokollierungAufbewahrungRevisionssicher = false

#let checkboxProtokollierungGemaessAuftragnehmerAGB = false

// Kriterien-Tabelle - Aktualisierung
#let checkboxAktualisierungRegulaereProgrammstaende = false

#let checkboxAktualisierungSpezifischeProgrammstaende = false
#let checkboxAktualisierungSpezifischeProgrammstaendeUpdates = false
#let checkboxAktualisierungSpezifischeProgrammstaendeUpgrades = false
#let checkboxAktualisierungSpezifischeProgrammstaendeReleases = false
#let checkboxAktualisierungSpezifischeProgrammstaendeFirmware = false

#let checkboxAktualisierungUmsetzungRechtsvorschriftenGemaessAnlage = false
#let aktualisierungUmsetzungRechtsvorschriftenGemaessAnlag = ""

// Kriterien-Tabelle - Reporting
#let checkboxReportingAbweichendEVBAGB = false
#let checkboxReportingAbweichendEVBAGBTaeglich = false
#let checkboxReportingAbweichendEVBAGBWoechentlich = false
#let checkboxReportingAbweichendEVBAGBQuartalsweise = false

#let checkboxReportingErgaenzendEVBAGB = false
#let checkboxReportingErgaenzendEVBAGBNeueProgrammstaende = false
#let checkboxReportingErgaenzendEVBAGBNutzungsstatistik = false
#let checkboxReportingErgaenzendEVBAGBNutzungsstatistikNutzer = false
#let checkboxReportingErgaenzendEVBAGBNutzungsstatistikFallzahlen = false
#let checkboxReportingErgaenzendEVBAGBNutzungsstatistikBackupzugriff = false
#let checkboxReportingErgaenzendEVBAGBNutzungsstatistikGemaessAnlage = false
#let reportingErgaenzendEVBAGBNutzungsstatistikGemaessAnlage = ""
#let checkboxReportingErgaenzendEVBAGBSicherheitsvorfaelle = false
#let checkboxReportingErgaenzendEVBAGBBackups = false
#let checkboxReportingErgaenzendEVBAGBWeiteresGemaessAnlage = false
#let reportingErgaenzendEVBAGBWeiteresGemaessAnlage = ""

#let checkboxReportingZusaetzlichEVBAGB = false

#let checkboxReportingGemaessAuftragnehmerAGB = false

// Kriterien-Tabelle - Mitwirkungsleistungen Auftraggeber
#let checkboxMitwirkungAuftraggeberAbweichendEVBAGB = false
#let checkboxMitwirkungAuftraggeberAbweichendEVBAGBIndividuell = false
#let mitwirkungAuftraggeberAbweichendEVBAGBIndividuell = ""
#let checkboxMitwirkungAuftraggeberAbweichendEVBAGBGemaessAnlage = false
#let mitwirkungAuftraggeberAbweichendEVBAGBGemaessAnlage = ""

// Sonderkriterien IaaS und PaaS - Lfd. 1 Anzahl gleicher Systeme
#let anzahlGleicherSystemeFest = ""
#let anzahlGleicherSystemeMinimal = ""
#let anzahlGleicherSystemeMaximal = ""

// Sonderkriterien IaaS und PaaS - Lfd. 1 Rechenleistung
#let rechenleistungCPUAnzahl = ""
#let rechenleistungVCPUAnzahl = ""
#let rechenleistungLeistungsklasse = ""

// Sonderkriterien IaaS und PaaS - Lfd. 1 Speicher
#let checkboxSpeicherArbeitsspeicherFesteGroesse = false
#let speicherArbeitsspeicherFesteGroesse = ""

#let checkboxSpeicherArbeitsspeicherDynamischeGroesse = false
#let speicherArbeitsspeicherDynamischeGroesseMin = ""
#let speicherArbeitsspeicherDynamischeGroesseMax = ""

#let checkboxSpeicherArbeitsspeicherIndividuell = false
#let speicherArbeitsspeicherIndividuell = ""

#let checkboxSpeicherArbeitsspeicherDynamischOhneNeustart = false

#let checkboxSpeicherFestplattenspeicherFesteGroesse = false
#let speicherFestplattenspeicherFesteGroesse = ""

#let checkboxSpeicherFestplattenspeicherDynamischeGroesse = false
#let speicherFestplattenspeicherDynamischeGroesseMin = ""
#let speicherFestplattenspeicherDynamischeGroesseMax = ""

#let checkboxSpeicherFestplattenspeicherDynamischOhneNeustart = false

#let checkboxSpeicherFestplattenspeicherTypSATA = false
#let checkboxSpeicherFestplattenspeicherTypSSD = false
#let checkboxSpeicherFestplattenspeicherTypSAS = false
#let checkboxSpeicherFestplattenspeicherTypSharedStorage = false
#let checkboxSpeicherFestplattenspeicherTypIndividuell = false
#let speicherFestplattenspeicherTypIndividuell = ""

#let checkboxSpeicherFestplattenspeicherLeistungIOPS = false
#let speicherFestplattenspeicherLeistungIOPS = ""
#let checkboxSpeicherFestplattenspeicherLeistungDatenrate = false
#let speicherFestplattenspeicherLeistungDatenrate = ""
#let checkboxSpeicherFestplattenspeicherLeistungLatenz = false
#let speicherFestplattenspeicherLeistungLatenz = ""

// Sonderkriterien IaaS und PaaS - Lfd. 1 Betriebssystem
#let betriebssystemBezeichnung = ""

#let checkboxBetriebssystemInstallationStandard = false
#let checkboxBetriebssystemInstallationKundenspezifischGemaessAnlage = false
#let betriebssystemInstallationKundenspezifischGemaessAnlage = ""

#let betriebssystemInstallationAuftraggeberTreiber = ""

// Sonderkriterien IaaS und PaaS - Lfd. 1 Virtualisierung
#let virtualisierungsumgebungen = ""

// Sonderkriterien IaaS und PaaS - Lfd. 2 Kommunikationssicherheit
#let checkboxKommunikationssicherheitNetze = false

// Erweiterung und Reduzierung der Leistung
#let checkboxBereitstellungWeiteresSystem = false
#let bereitstellungWeiteresSystem = ""

#let checkboxDeaktivierungWeiteresSystem = false
#let deaktivierungWeiteresSystem = ""

// ==========================================
// 4. CONTENT
// ==========================================

#align(center)[
  #heading(outlined: false, bookmarked: false, numbering: none)[
    Kriterienkatalog für Cloudleistungen\
    Anlage #fieldValue(value: nummerAnlage) zum EVB-IT Cloudvertrag #fieldValue(value: referenzCloudvertrag)
  ]
]

Katalog gilt für folgende Leistungen: #fieldValue(value: gueltigkeitsbereichFuerLeistungen)




= Kriterien
#let kriterienTabelle = (
  // Zeile 1
  (
    active: isRowActive(
      (
        checkboxPublicCloud,
        checkboxPrivateCloud,
      ),
    ),
    kriterium: "Art der Cloud",
    auspraegung: [
      #option(checkboxPublicCloud)[
        Public Cloud (Ressourcen werden für eine Vielzahl nicht näher bestimmter Kunden bereitgestellt)
      ]
      #option(checkboxPrivateCloud)[
        Private Cloud bzw. sonstige Cloud gemäß Anlage Nr. #fieldValue(value: privateCloudGemaessAnlage).
      ]
    ],
  ),
  // Zeile 2
  (
    active: isRowActive(
      (
        checkboxAuftragnehmerErgaenzendeLeistungen,
        checkboxAuftragnehmerMitwirkungsleistungenGemaessAnlage,
      ),
    ),
    kriterium: "Managed Cloud Services (MCS)*",
    auspraegung: [
      #option(checkboxAuftragnehmerErgaenzendeLeistungen)[
        Der Auftragnehmer erbringt folgende ergänzende Leistungen (Managed Cloud Services\*):

        #option(checkboxAuftragnehmerErgaenzendeLeistungenAdministrationGemaessAnlage)[
          Zugangsverwaltung/Administration gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenAdministrationGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenHotlineGemaessAnlage)[
          ServiceDesk/Hotline gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenHotlineGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenKapazitaetsmanagementGemaessAnlage)[
          Kapazitätsmanagement gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenKapazitaetsmanagementGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenAutomatisierungGemaessAnlage)[
          Automatisierung von Routineaufgaben gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenAutomatisierungGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenProblemmanagementGemaessAnlage)[
          Incident- und Problemmanagement gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenProblemmanagementGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenReleasemanagementGemaessAnlage)[
          Release- und Patchmanagement gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenReleasemanagementGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenBeratungGemaessAnlage)[
          Beratungsleistungen gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenBeratungGemaessAnlage).
        ]
        #option(checkboxAuftragnehmerErgaenzendeLeistungenIndividuellGemaessAnlage)[
          #fieldValue(value: auftragnehmerErgaenzendeLeistungenIndividuellBezeichnung) gemäß Anlage Nr. #fieldValue(value: auftragnehmerErgaenzendeLeistungenIndividuellGemaessAnlage).
        ]

      ]
      #option(checkboxAuftragnehmerMitwirkungsleistungenGemaessAnlage)[
        Erbringung der Mitwirkungsleistungen die der Auftraggeber aus dem Vertrag/den Verträgen gemäß Anlage Nr. #fieldValue(value: auftragnehmerMitwirkungsleistungenGemaessAnlage) schuldet.
      ]
    ],
  ),
  // Zeile 3
  (
    active: isRowActive(
      (
        checkboxDatenverarbeitungStaatenMitAngemessenheitsbeschluss,
        checkboxDatenverarbeitungOhneOertlicheBeschraenkungen,
        checkboxDatenverarbeitungOhneOertlicheBeschraenkungenGemaessAnlage,
        checkboxDatenverarbeitungDeutschland,
        checkboxDatenverarbeitungInRechenzentren,
        checkboxDatenverarbeitungSupportzwecke,
        checkboxDatenverarbeitungMetadatenEU,
        checkboxDatenverarbeitungAuftragnehmerAGB,
        checkboxDatenverarbeitungIndividuell,
      ),
    ),
    kriterium: "Leistungsort",
    auspraegung: [
      Abweichend von Ziffer 4 EVB-IT Cloud-AGB erfolgt die Verarbeitung von Daten des Auftraggebers durch den Auftragnehmer nicht beschränkt auf die EU und den EWR sowie, sofern ein Angemessenheitsbeschluss gem. Art. 45 DSGVO besteht, die Schweiz, sondern

      #option(checkboxDatenverarbeitungStaatenMitAngemessenheitsbeschluss)[
        zusätzlich in Staaten mit Angemessenheitsbeschluss gem. Art. 45 DSGVO.
      ]
      #option(checkboxDatenverarbeitungOhneOertlicheBeschraenkungen)[
        ohne örtliche Beschränkung (sofern keine personenbezogenen Daten verarbeitet werden).
      ]
      #option(checkboxDatenverarbeitungOhneOertlicheBeschraenkungenGemaessAnlage)[
        ohne örtliche Beschränkung, sofern die Anforderungen aus Anlage Nr. #fieldValue(value: datenverarbeitungOhneOertlicheBeschraenkungenGemaessAnlage) für die Verarbeitung personenbezogener Daten erfüllt sind.
      ]
      #option(checkboxDatenverarbeitungDeutschland)[
        nur innerhalb der Bundesrepublik Deutschland
      ]
      #option(checkboxDatenverarbeitungInRechenzentren)[
        nur in den folgenden vereinbarten Rechenzentren: #fieldValue(value: datenverarbeitungInRechenzentren)
      ]
      #option(checkboxDatenverarbeitungSupportzwecke)[
        ausschließlich für Support- und Wartungszwecke

        #option(checkboxDatenverarbeitungSupportzweckeIndividuell)[
          auch in #fieldValue(value: datenverarbeitungSupportzweckeIndividuell)
        ]
        #option(checkboxDatenverarbeitungSupportzweckeAusserhalbEU)[
          auch außerhalb von EU und EWR, jedoch nicht in Staaten der Staatenliste im Sinne von § 13 Absatz 1 Nummer 17 SÜG und § 32 SÜG;
        ]

        wobei für personenbezogene Supportdaten die Regelungen zur Verarbeitung personenbezogener Daten vorrangig gelten.
      ]
      #option(checkboxDatenverarbeitungMetadatenEU)[
        Abweichend von Ziffer 4 EVB-IT Cloud-AGB dürfen Metadaten im Sinne des Anforderungskataloges C 5 (in Version 2020: OPS 11) nur in der EU und im EWR verarbeitet werden.
      ]
      #option(checkboxDatenverarbeitungAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Leistungsort.
      ]
      #option(checkboxDatenverarbeitungIndividuell)[
        #fieldValue(value: datenverarbeitungIndividuell)
      ]
    ],
  ),
  // Zeile 4
  (
    active: isRowActive(
      (
        checkboxGeoredundanz
      ),
    ),
    kriterium: "Georedundanz",
    auspraegung: [
      #option(checkboxGeoredundanz)[
        Abweichend vom C5 Basiskriterium PS-02 erfolgt die Bereitstellung des Cloud-Dienstes aus mehr als zwei zueinander georedundanten Standorten.
        Bei einem zeitgleichen Ausfall zweier Standorte steht mindestens ein dritter Standort weiterhin zur Verfügung, um einen Totalausfall zu verhindern.
        Die Georedundanz ist so ausgelegt, dass die vereinbarten Verfügbarkeitsanforderungen eingehalten werden.
        Die Funktionsfähigkeit der Redundanz wird mindestens jährlich durch geeignete Tests und Übungen überprüft (vgl. BCM-04 -- Verifizierung, Aktualisierung und Test der Betriebskontinuität).
      ]
    ],
  ),
  // Zeile 5
  (
    active: isRowActive(
      (
        checkboxUebergabepunktAuftragnehmerAGB,
        checkboxUebergabepunktIndividuell,
      ),
    ),
    kriterium: "Übergabepunkt",
    auspraegung: [
      Abweichend von Ziffer 5.1. der AGB ergibt sich der Übergabepunkt aus

      #option(checkboxUebergabepunktAuftragnehmerAGB)[
        Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Übergabepunkt.
      ]
      #option(checkboxUebergabepunktIndividuell)[
        #fieldValue(value: uebergabepunktIndividuell)
      ]
    ],
  ),
  // Zeile 6
  (
    active: isRowActive(
      (
        checkboxBereitstellungVertragsbeginn,
        checkboxBereitstellungStartzeitpunkt,
        checkboxBereitstellungAufAnforderung,
      ),
    ),
    kriterium: "Bereitstellungszeitpunkt",
    auspraegung: [
      #option(checkboxBereitstellungVertragsbeginn)[
        ab Vertragsbeginn
      ]
      #option(checkboxBereitstellungStartzeitpunkt)[
        ab dem #fieldValue(value: bereitstellungStartzeitpunkt)
      ]
      #option(checkboxBereitstellungAufAnforderung)[
        innerhalb von #fieldValue(value: bereitstellungAufAnforderung) nach Anforderung durch den Auftraggeber
      ]
    ],
  ),
  // Zeile 7
  (
    active: isRowActive(
      (
        checkboxNutzerGleichzeitigeNutzer,
        checkboxNutzerBenannteNutzer,
        checkboxNutzerGemaessAuftragnehmerAGB,
        checkboxNutzerGemaessAnlage,
      ),
    ),
    kriterium: "Nutzer",
    auspraegung: [
      #option(checkboxNutzerGleichzeitigeNutzer)[
        max. Anzahl gleichzeitiger Nutzer (concurrent user)\*: #fieldValue(value: nutzerGleichzeitigeNutzer)
      ]
      #option(checkboxNutzerBenannteNutzer)[
        max. Anzahl benannter Nutzer (named user\*): #fieldValue(value: nutzerBenannteNutzer)

        #option(checkboxNutzerBenannteNutzerImmerAustauschbar)[
          Diese sind jederzeit austauschbar
        ]
        #option(checkboxNutzerBenannteNutzerMitGrundAustauschbar)[
          Dies sind nur aus wichtigen Grund jederzeit austauschbar, ohne wichtigen Grund alle #fieldValue(value: nutzerBenannteNutzerMitGrundAustauschbar) Tage.
        ]

      ]
      #option(checkboxNutzerGemaessAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Nutzer.
      ]
      #option(checkboxNutzerGemaessAnlage)[
        gemäß Anlage Nr. #fieldValue(value: nutzerGemaessAnlage)
      ]
    ],
  ),
  // Zeile 8
  (
    active: isRowActive(
      (
        checkboxNutzerkreisOhneBeschraenkung,
        checkboxNutzerkreisIndividuell,
      ),
    ),
    kriterium: "Nutzerkreis",
    auspraegung: [
      #option(checkboxNutzerkreisOhneBeschraenkung)[
        Keine Beschränkung
      ]
      #option(checkboxNutzerkreisIndividuell)[
        #fieldValue(value: nutzerkreisIndividuell)
      ]
    ],
  ),
  // Zeile 9
  (
    active: isRowActive(
      (
        checkboxNutzungsortEU
      ),
    ),
    kriterium: "Nutzungsort",
    auspraegung: [
      #option(checkboxNutzungsortEU)[
        Abweichend von Ziffer 14.1 EVB-IT Cloud-AGB ist das Recht zur Nutzung der Leistung örtlich auf das Gebiet der Vertragsstaaten der EU und des EWR sowie der Schweiz beschränkt.
      ]
    ],
  ),
  // Zeile 10
  (
    active: isRowActive(
      (
        checkboxSelfServiceZugangsberechtigungen,
        checkboxVerhinderungLeistungsbuchung,
      ),
    ),
    kriterium: "Identitäts- und Berechtigungsmanagement (IDM)",
    auspraegung: [
      #option(checkboxSelfServiceZugangsberechtigungen)[
        C5 Zusatzkriterium IDM-02: Der Auftragnehmer bietet dem Auftraggeber einen Self-Service an, mit welchem diese Zugangs- und Zugriffsberechtigungen eigenständig vergeben und ändern können.
      ]
      #option(checkboxVerhinderungLeistungsbuchung)[
        Der Auftragnehmer sorgt durch technische Maßnahmen dafür, dass die Nutzer keine Leistungen beauftragen können, welche nicht vom Leistungsumfang des Vertrages umfasst sind.
      ]
    ],
  ),
  // Zeile 11
  (
    active: isRowActive(
      (
        checkboxNutzungGeraetemetrik,
        checkboxNutzungAndereMetrikGemaessAnlage,
        checkboxNutzungErweiterungReduzierung,
        checkboxNutzungAuftragnehmerAGB,
        checkboxNutzungIndividuell,
      ),
    ),
    kriterium: "Sonstiger Nutzungsumfang / Lizenzmetrik",
    auspraegung: [
      #option(checkboxNutzungGeraetemetrik)[
        Gerätemetrik #fieldValue(value: nutzungGeraetemetrik)
      ]
      #option(checkboxNutzungAndereMetrikGemaessAnlage)[
        Andere Metrik gemäß Anlage Nr. #fieldValue(value: nutzungAndereMetrikGemaessAnlage)
      ]
      #option(checkboxNutzungErweiterungReduzierung)[
        Eine Erweiterung/Reduzierung des Nutzungsumfangs ist jederzeit möglich.
      ]
      #option(checkboxNutzungAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Sonstiger Nutzungsumfang/Lizenzmetrik.
      ]
      #option(checkboxNutzungIndividuell)[
        #fieldValue(value: nutzungIndividuell)
      ]
    ],
  ),
  // Zeile 12
  (
    active: isRowActive(
      (
        checkboxZugangWebbasiert,
        checkboxZugangWebbasiertMobiloptimiert,
        checkboxZugangNichtUnterstuetzteBrowser,
        checkboxZugangTerminalserver,
        checkboxZugangVPN,
        checkboxZugangAPI,
        ZugangZugriffssoftwareName,
        checkboxZugangZugriffssoftwarePC,
        checkboxZugangZugriffssoftwareMobil,
        checkboxZugangZugriffssoftwareSystemvoraussetzungen,
        checkboxZugangZugriffssoftwareTechnischeAnforderungen,
        checkboxZugangZugriffssoftwareInstallationshilfe,
        checkboxZugangZugriffssoftwareGemaessAuftragnehmerAGB,
        checkboxZugangZugriffssoftwareIndividuell,
      ),
    ),
    kriterium: "Endgeräte / Zugang",
    auspraegung: [
      #option(checkboxZugangWebbasiert)[
        webbasiert
      ]
      #option(checkboxZugangWebbasiertMobiloptimiert)[
        webbasiert optimiert für mobile Endgeräte
      ]
      #option(checkboxZugangNichtUnterstuetzteBrowser)[
        nicht unterstützte Browser: #fieldValue(value: zugangNichtUnterstuetzteBrowser)

        #underline[Anforderungen an webbasierten Zugang:]

        #option(checkboxZugangWebbasiertKeinePlugins)[
          keine Plug-Ins, Add-Ons
        ]
        #option(checkboxZugangWebbasiertZugelassenePlugins)[
          zugelassene Plug-Ins, Add-Ons: #fieldValue(value: zugangWebbasiertZugelassenePlugins)
        ]
        #option(checkboxZugangWebbasiertEinstellungen)[
          sonstige Sicherheitseinstellungen: #fieldValue(value: zugangWebbasiertEinstellungen)
        ]
      ]
      #option(checkboxZugangTerminalserver)[
        Terminalserver/ graphischer Remote Zugriff (zum Beispiel RDS oder RDP): #fieldValue(value: zugangTerminalserver)
      ]
      #option(checkboxZugangVPN)[
        VPN

        #option(checkboxZugangVPNAnforderungen)[
          VPN-Anforderungen: #fieldValue(value: zugangVPNAnforderungen)
        ]
      ]
      #option(checkboxZugangAPI)[
        API

        #option(checkboxZugangAPIAnforderungen)[
          API-Anforderungen: #fieldValue(value: zugangAPIAnforderungen)
        ]
      ]

      *Über native Zugriffssoftware #fieldValue(value: ZugangZugriffssoftwareName) für*

      #option(checkboxZugangZugriffssoftwarePC)[
        PC/Notebooks

        #option(checkboxZugangZugriffssoftwarePCWindows)[
          Windows ab Version #fieldValue(value: zugangZugriffssoftwarePCWindows)
        ]
        #option(checkboxZugangZugriffssoftwarePCAndere)[
          andere: #fieldValue(value: zugangZugriffssoftwarePCAndere)
        ]
      ]
      #option(checkboxZugangZugriffssoftwareMobil)[
        mobile Geräte (Apps)

        #option(checkboxZugangZugriffssoftwareMobilIOS)[
          iOS ab Version #fieldValue(value: zugangZugriffssoftwareMobilIOS)
        ]
        #option(checkboxZugangZugriffssoftwareMobilAndroid)[
          Android ab Version #fieldValue(value: zugangZugriffssoftwareMobilAndroid)
        ]
        #option(checkboxZugangZugriffssoftwareMobilAndere)[
          andere mobile OS (Bezeichnung) #fieldValue(value: zugangZugriffssoftwareMobilAndere)
        ]
      ]
      #option(checkboxZugangZugriffssoftwareSystemvoraussetzungen)[
        besondere Systemvoraussetzungen beim Auftraggeber #fieldValue(value: zugangZugriffssoftwareSystemvoraussetzungen)
      ]
      #option(checkboxZugangZugriffssoftwareTechnischeAnforderungen)[
        technische Anforderungen für den Zugang gemäß Anlage #fieldValue(value: zugangZugriffssoftwareTechnischeAnforderungen)
      ]
      #option(checkboxZugangZugriffssoftwareInstallationshilfe)[
        Der Auftragnehmer wird den Auftraggeber auf dessen Anforderung bei deren Installation durch telefonische Anleitung und, soweit durch den Auftraggeber der Zugang ermöglicht wird, durch Remoteservice unterstützen.
        Dies gilt auch für neue Programmstände der Zugriffssoftware.
      ]
      #option(checkboxZugangZugriffssoftwareGemaessAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Endgeräte/Zugang.
      ]
      #option(checkboxZugangZugriffssoftwareIndividuell)[
        #fieldValue(value: zugangZugriffssoftwareIndividuell)
      ]
    ],
  ),
  // Zeile 13
  (
    active: isRowActive(
      (
        checkboxSpeicherKeineSpeicherung,
        checkboxSpeicherSpeicherung,
      ),
    ),
    kriterium: "Speichergröße (für Speicherung von Auftraggeberdaten)",
    auspraegung: [
      #option(checkboxSpeicherKeineSpeicherung)[
        Keine Speicherung beim Auftragnehmer
      ]
      #option(checkboxSpeicherSpeicherung)[
        Speicherung beim Auftragnehmer

        #option(checkboxSpeicherFesteGroesse)[
          feste Größe: #fieldValue(value: speicherFesteGroesse) GB
        ]
        #option(checkboxSpeicherDynamischeGroesse)[
          dynamisch: mind. #fieldValue(value: speicherDynamischeGroesseMin) GB bis maximal: #fieldValue(value: speicherDynamischeGroesseMax) GB
        ]
        #option(checkboxSpeicherDynamischeAnpassung)[
          dynamische Anpassung im laufenden Betrieb (kein Neustart)
        ]
        #option(checkboxSpeicherKeineLimitierung)[
          keine Limitierung des Speicherumfangs
        ]
      ]
    ],
  ),
  // Zeile 14
  (
    active: isRowActive(
      (
        checkboxAnbindungMPLS,
        checkboxAnbindungIPSec,
        checkboxAnbindungDirektverbindung,
        checkboxAnbindungSDWAN,
        checkboxAnbindungTLS,
        checkboxAnbindungGemaessAnlage,
        checkboxAnbindungRedundanz,
      ),
    ),
    kriterium: "Art der Anbindung",
    auspraegung: [
      #option(checkboxAnbindungMPLS)[
        MPLS

        #option(checkboxAnbindungMPLSDSL)[
          xDSL: #fieldValue(value: anbindungMPLSDSL)
        ]
        #option(checkboxAnbindungMPLSEthernet)[
          Ethernet Connect #fieldValue(value: anbindungMPLSEthernet)
        ]
      ]
      #option(checkboxAnbindungIPSec)[
        IPSec: #fieldValue(value: anbindungIPSec)
      ]
      #option(checkboxAnbindungDirektverbindung)[
        Direktverbindung: #fieldValue(value: anbindungDirektverbindung)
      ]
      #option(checkboxAnbindungSDWAN)[
        SD-WAN: #fieldValue(value: anbindungSDWAN)
      ]
      #option(checkboxAnbindungTLS)[
        TLS-Version #fieldValue(value: anbindungTLS)
      ]
      #option(checkboxAnbindungGemaessAnlage)[
        gemäß Anlage Nr. #fieldValue(value: anbindungGemaessAnlage)
      ]
      #option(checkboxAnbindungRedundanz)[
        Redundante Anbindung
      ]
    ],
  ),
  // Zeile 15
  (
    active: isRowActive(
      (
        checkboxBandbreiteMbits,
        checkboxBandbreiteasync,
        checkboxBandbreiteDynamisch,
        checkboxBandbreiteIndividuell,
      ),
    ),
    kriterium: "Bandbreite der Anbindung des Auftragnehmers an das Internet, die für den Auftraggeber zur Verfügung steht",
    auspraegung: [
      #option(checkboxBandbreiteMbits)[
        #fieldValue(value: bandbreiteMbits) Mbit/s
      ]
      #option(checkboxBandbreiteasync)[
        asynchron

        #option(checkboxBandbreiteAsyncUplink)[
          Uplink: #fieldValue(value: bandbreiteAsyncUplink) Mbit/s
        ]
        #option(checkboxBandbreiteAsyncDownlink)[
          Downlink: #fieldValue(value: bandbreiteAsyncDownlink) Mbit/s
        ]
      ]
      #option(checkboxBandbreiteDynamisch)[
        dynamisch: mind. #fieldValue(value: bandbreiteDynamischMin) Mbit/s bis maximal: #fieldValue(value: bandbreiteDynamischMax) Mbit/s
      ]
      #option(checkboxBandbreiteIndividuell)[
        #fieldValue(value: bandbreiteIndividuell)
      ]
    ],
  ),
  // Zeile 16
  (
    active: isRowActive(
      (
        checkboxDatensicherungBackupPflicht,
        checkboxDatensicherungBackupGegenstand,
        checkboxDatensicherungBackupFormat,
        checkboxDatensicherungBackupZeitpunkte,
        checkboxDatensicherungBackupOrt,
        checkboxDatensicherungBackupKopieOrt,
        checkboxDatensicherungBackupLoeschung,
        checkboxDatensicherungBackupLoeschungWeitereRegelungenGemaessAnlage,
        checkboxDatensicherungBackupWiederherstellungGesamterStand,
        checkboxDatensicherungBackupWiederherstellungGesonderteBereitstellung,
        checkboxDatensicherungBackupWiederherstellungstestsInfo,
        checkboxDatensicherungGemaessAuftragnehmerAGB,
        checkboxDatensicherungIndividuell,
        checkboxDatensicherungDurchAuftraggeber,
      ),
    ),
    kriterium: "Datensicherung*",
    auspraegung: [
      Ergänzend zu Ziffer 7 EVB-IT Cloud-AGB gilt Folgendes:

      #option(checkboxDatensicherungBackupPflicht)[
        Der Auftragnehmer ist zur Erstellung von Backups der Daten des Auftraggebers verpflichtet.
      ]
      #option(checkboxDatensicherungBackupGegenstand)[
        Gegenstand des Backups

        #option(checkboxDatensicherungBackupGegenstandImage)[
          ist das Image Backup (komplettes Image der virtuellen Maschinen)
        ]
        #option(checkboxDatensicherungBackupGegenstandDaten)[
          sind folgende Daten #fieldValue(value: datensicherungBackupGegenstandDaten)
        ]
        #option(checkboxDatensicherungBackupGegenstandIndividuell)[
          sind #fieldValue(value: datensicherungBackupGegenstandIndividuell)
        ]
      ]
      #option(checkboxDatensicherungBackupFormat)[
        Das Backup erfolgt in folgendem Format: #fieldValue(value: datensicherungBackupFormat).
      ]
      #option(checkboxDatensicherungBackupZeitpunkte)[
        Das Backup erfolgt #fieldValue(value: datensicherungBackupZeitpunkte).
      ]
      #option(checkboxDatensicherungBackupOrt)[
        Das Backup erfolgt an folgendem Ort #fieldValue(value: datensicherungBackupOrt) auf #fieldValue(value: datensicherungBackupOrtMedium).
      ]
      #option(checkboxDatensicherungBackupKopieOrt)[
        Eine Kopie des Backups erfolgt an folgendem Ort #fieldValue(value: datensicherungBackupKopieOrt) auf #fieldValue(value: datensicherungBackupKopieOrtMedium).
      ]
      #option(checkboxDatensicherungBackupLoeschung)[
        Eine Löschung des Backups erfolgt

        #option(checkboxDatensicherungBackupLoeschungFruehestens)[
          frühestens nach #fieldValue(value: datensicherungBackupLoeschungFruehestens)
        ]
        #option(checkboxDatensicherungBackupLoeschungGemaessAnlage)[
          gemäß Anlage Nr. #fieldValue(value: datensicherungBackupLoeschungGemaessAnlage)
        ]
      ]
      #option(checkboxDatensicherungBackupLoeschungWeitereRegelungenGemaessAnlage)[
        Weitere Regelungen zur Datenlöschung gelten gemäß Anlage Nr. #fieldValue(value: datensicherungBackupLoeschungWeitereRegelungenGemaessAnlage) (während der Vertragslaufzeit) oder nach Vertragsende wenn vereinbart.
      ]
      #option(checkboxDatensicherungBackupLoeschungGemaessAnlage)[
        Eine Löschung des Backups erfolgt gemäß Anlage Nr. #fieldValue(value: datensicherungBackupLoeschungGemaessAnlage)
      ]
      #option(checkboxDatensicherungBackupRegelungenGemaessAnlage)[
        Regelungen zum Backup gemäß Anlage Nr. #fieldValue(value: datensicherungBackupRegelungenGemaessAnlage)
      ]
      #option(checkboxDatensicherungBackupWiederherstellungGesamterStand)[
        Abweichend von Ziffer 7.2 EVB-IT Cloud-AGB ist der Auftragnehmer  nicht verpflichtet, einzelne vom Auftraggeber zuvor gelöschten Dateien wiederherzustellen, sondern lediglich den Datenbestand insgesamt auf den vorherigen und soweit vorhanden und vom Auftraggeber gewünscht, auf die davor liegenden Stände wiederherzustellen.
      ]
      #option(checkboxDatensicherungBackupWiederherstellungGesonderteBereitstellung)[
        Der wiederhergestellte Stand wird dem Auftraggeber auf dessen Wunsch gesondert zur Verfügung gestellt wird.
      ]
      #option(checkboxDatensicherungBackupWiederherstellungstestsInfo)[
        Zusätzlich zum C5 Basiskriterium OPS-08 ist der Auftragnehmer verpflichtet, den Auftraggeber auf dessen Anforderung über die Ergebnisse der durchgeführten Wiederherstellungstests zu informieren. Wiederherstellungstests sind in das Notfallmanagement des Auftragnehmers eingebettet.
      ]
      #option(checkboxDatensicherungBackupLoeschungWeitereRegelungenGemaessAnlage)[
        Weitere Regelungen zur Datenlöschung gemäß Anlage Nr. #fieldValue(value: datensicherungBackupLoeschungWeitereRegelungenGemaessAnlage) während der Vertragslaufzeit oder nach Vertragsende).
      ]
      #option(checkboxDatensicherungGemaessAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Datensicherung\*.
      ]
      #option(checkboxDatensicherungIndividuell)[
        #fieldValue(value: datensicherungIndividuell)
      ]
      #option(checkboxDatensicherungDurchAuftraggeber)[
        Der Auftraggeber ist für folgende Datensicherungen\* selbst verantwortlich, wobei der Auftragnehmer  die dazu erforderlichen Funktionalitäten zur Verfügung stellt: #fieldValue(value: datensicherungDurchAuftraggeber)
      ]
    ],
  ),
  // Zeile 17
  (
    active: isRowActive(
      (
        checkboxDatenExportImportZusatzEVBAGB,
        checkboxDatenExportImportStandardAuftragnehmer,
        checkboxDatenExportImportStandardAuftraggeber,
      ),
    ),
    kriterium: "Datenexport / Datenimport",
    auspraegung: [
      #option(checkboxDatenExportImportZusatzEVBAGB)[
        Zusätzlich zu Ziffer 7.3 EVB-IT Cloud-AGB gilt:

        #option(checkboxDatenExportImportZusatzDatenexport)[
          Für folgende Teile der Leistung #fieldValue(value: datenExportImportZusatzDatenexportLeistungen) erfolgt unabhängig von einem ggf. vereinbarten Backup ein Datenexport durch den Auftragnehmer.\
          Der Datenexport erfolgt #fieldValue(value: datenExportImportZusatzDatenexportTurnus) in folgendem Format #fieldValue(value: datenExportImportZusatzDatenexportFormat) an folgendem Ort #fieldValue(value: datenExportImportZusatzDatenexportOrt) auf #fieldValue(value: datenExportImportZusatzDatenexportMedium).
        ]
        #option(checkboxDatenExportImportZusatzDatenimport)[
          Für folgende Teile der Leistung #fieldValue(value: datenExportImportZusatzDatenimportLeistungen) erfolgt unabhängig von einem ggf. vereinbarten Backup ein Datenimport durch den Auftragnehmer.\
          Der Datenimport erfolgt #fieldValue(value: datenExportImportZusatzDatenimportTurnus) in folgendem Format #fieldValue(value: datenExportImportZusatzDatenimportFormat) von folgendem Ort #fieldValue(value: datenExportImportZusatzDatenimportOrt) von #fieldValue(value: datenExportImportZusatzDatenimportMedium).
        ]
      ]
      #option(checkboxDatenExportImportStandardAuftragnehmer)[
        Für den Datenexport bzw. Datenimport verwendet der Auftragnehmer folgenden Standard #fieldValue(value: datenExportImportStandardAuftragnehmer).
      ]
      #option(checkboxDatenExportImportStandardAuftraggeber)[
        Dem Auftraggeber stehen für den eigenen Datenimport und Datenexport folgende Möglichkeiten zur Verfügung: #fieldValue(value: datenExportImportStandardAuftraggeber).
      ]
    ],
  ),
  // Zeile 18
  (
    active: isRowActive(
      (
        checkboxITSicherheitAlleC5Zusatzkriterien,
        checkboxITSicherheitAuswahlC5Zusatzkriterien,
        checkboxITSicherheitAbweichungenITSicherheit,
        checkboxITSicherheitAbweichungenC5GemaessAnlage,
        checkboxITSicherheitMonitoringSchnittstelle,
        checkboxITSicherheitSchutzbedarfGemaessAnlage,
        checkboxITSicherheitCERTGemaessAnlage,
        checkboxITSicherheitPenetrationstest,
        checkboxITSicherheitPruefkostenuebernahmeAuftraggeber,
        checkboxITSicherheitAnlassunabhaengigePruefung,
      ),
    ),
    kriterium: "IT Sicherheit",
    auspraegung: [
      #option(checkboxITSicherheitAlleC5Zusatzkriterien)[
        Abweichend von Ziffer 1.2 EVB-IT Cloud-AGB ist nicht nur die Einhaltung der C5 Basiskriterien, sondern auch der C5 Zusatzkriterien geschuldet.
      ]
      #option(checkboxITSicherheitAuswahlC5Zusatzkriterien)[
        Abweichend von Ziffer 1.2 EVB-IT Cloud-AGB ist nicht nur die Einhaltung der C5 Basiskriterien, sondern auch der folgenden C5 Zusatzkriterien geschuldet:

        #option(checkboxITSicherheitAuswahlC5ZusatzkriterienCRY03)[
          CRY-03: Die für die Verschlüsselung verwendeten privaten Schlüssel sind ausschließlich und ohne Ausnahme dem Kunden nach geltenden rechtlichen und regulatorischen Verpflichtungen und Anforderungen bekannt.
        ]
        #option(checkboxITSicherheitAuswahlC5ZusatzkriterienAM05)[
          AM-05: Physische Assets der internen und externen Mitarbeiter unterliegen einer zentralen Verwaltung.
          Die zentrale Verwaltung ermöglicht eine Software-, Daten- und Richtlinienverteilung sowie eine Remote-Deaktivierung, -Löschung, oder -Sperrung.
        ]
        #option(checkboxITSicherheitAuswahlC5ZusatzkriterienOPS22)[
          OPS-22: Sicherheitspatches werden ab dem Zeitpunkt ihrer Verfügbarkeit\* in Abhängigkeit des nach der jüngsten Version des Common Vulnerability Scoring Systems (CVSS) eingeordneten Schweregrades der dadurch adressierten Schwachstellen eingespielt:\
          - Kritisch (CVSS = 9.0 - 10.0): 3 Stunden
          - Hoch (CVSS = 7.0 - 8.9): 3 Tage
          - Mittel (CVSS = 4.0 - 6.9): 1 Monat
          - Niedrig (CVSS = 0.1 - 3.9): 3 Monate
        ]
      ]
      #option(checkboxITSicherheitAbweichungenITSicherheit)[
        Abweichend bzw. ergänzend zu Ziffer 6.2 EVB-IT Cloud-AGB wird vereinbart, dass

        #option(checkboxITSicherheitAbweichungenITSicherheitISO27001)[
          das vom Auftragnehmer implementierte Sicherheitskonzept und sein ISMS auf ISO 27001 und BSI IT-Grundschutz in der jeweils geltenden Fassung basiert.
        ]
        #option(checkboxITSicherheitAbweichungenITSicherheitNotfallmanagement)[
          das Notfall-Management gemäß

          #option(checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementBSI)[
            BSI-Standard 100-4 bzw. nach dessen Inkrafttreten BSI Standard 200-4
          ]
          #option(checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementISO22301)[
            ISO 22301
          ]
          #option(checkboxITSicherheitAbweichungenITSicherheitNotfallmanagementIndividuell)[
            #fieldValue(value: iTSicherheitAbweichungenITSicherheitNotfallmanagementIndividuell)
          ]

          erfolgt.
        ]
        #option(checkboxITSicherheitAbweichungenITSicherheitVereinbarungenGemaessAnlage)[
          die Parteien für den Not- und Krisenfall besondere Vereinbarungen gemäß Anlage Nr. #fieldValue(value: iTSicherheitAbweichungenITSicherheitVereinbarungenGemaessAnlage) treffen, die auch die erforderliche Beteiligung des BSI einschließen.
        ]
        #option(checkboxITSicherheitAbweichungenITSicherheitNachweis)[
          der Auftragnehmer die Umsetzung der Vorgaben zur IT-Sicherheit

          #option(checkboxITSicherheitAbweichungenITSicherheitNachweisZertifikate)[
            durch entsprechende Zertifikate
          ]
          #option(checkboxITSicherheitAbweichungenITSicherheitNachweisSpezifischeZertifikate)[
            durch folgende Zertifikate #fieldValue(value: iTSicherheitAbweichungenITSicherheitNachweisSpezifischeZertifikate)
          ]
          #option(checkboxITSicherheitAbweichungenITSicherheitNachweisIndividuell)[
            durch #fieldValue(value: iTSicherheitAbweichungenITSicherheitNachweisIndividuell)
          ]

          nachweisen muss.
        ]
        #option(checkboxITSicherheitAbweichungenITSicherheitVerschluesselung)[
          der Auftragnehmer auf Anforderung des Auftraggebers die verwendeten Verschlüsselungs- und Authentifikationsmechanismen offenlegt.
        ]
      ]
      #option(checkboxITSicherheitAbweichungenC5GemaessAnlage)[
        Abweichend von Ziffer 1.2 EVB-IT Cloud-AGB wird vereinbart, dass die aus Anlage Nr. #fieldValue(value: iTSicherheitAbweichungenC5GemaessAnlage) ersichtlichen C5 Basiskriterien nicht geschuldet werden. Soweit nicht in der Anlage konkrete Alternativen vorgesehen sind, sieht der Auftragnehmer angemessene Alternativen zur Erfüllung der entsprechenden Anforderungen vor.
      ]
      #option(checkboxITSicherheitMonitoringSchnittstelle)[
        Dem Auftraggeber ist eine Schnittstelle zum Monitoring\* der Leistungen und der Cloud-Infrastruktur zur Verfügung zu stellen.
      ]
      #option(checkboxITSicherheitSchutzbedarfGemaessAnlage)[
        Der Schutzbedarf der vertragsgegenständlichen Daten des Auftraggebers ergibt sich aus Anlage Nr. #fieldValue(value: iTSicherheitSchutzbedarfGemaessAnlage).
      ]
      #option(checkboxITSicherheitCERTGemaessAnlage)[
        Ein CERT des Auftraggebers kann angebunden werden gemäß Anlage Nr. #fieldValue(value: iTSicherheitCERTGemaessAnlage).
      ]
      #option(checkboxITSicherheitPenetrationstest)[
        Zusätzlich zum C5 Basiskriterium OPS-19 finden Penetrationstests nicht nur einmal jährlich, sondern halbjährlich statt. Diese müssen darüber hinaus zwingend durch unabhängige Externe durchgeführt werden. Internes Personal für Penetrationstests darf die externen Dienstleister dabei unterstützen.
      ]
      #option(checkboxITSicherheitPruefkostenuebernahmeAuftraggeber)[
        Ergibt das Prüfungsergebnis gemäß Ziffer 6.4.2 EVB-IT Cloud AGB keine oder nur unwesentliche Beanstandungen, trägt der Auftraggeber  die beim Auftragnehmer anfallenden notwendigen  Kosten des Auftragnehmers (auch interne Kosten) und etwaiger Unterauftragnehmer bis zu einem Höchstbetrag von #fieldValue(value: iTSicherheitPruefkostenuebernahmeAuftraggeber) Euro netto je Prüfung.
      ]
      #option(checkboxITSicherheitAnlassunabhaengigePruefung)[
        Dem Auftraggeber steht das Prüfungsrecht gemäß Ziffer 6.4.2 EVB-IT Cloud AGB anlassunabhängig zu. Ergibt das Prüfungsergebnis keine Beanstandungen, trägt der Auftraggeber  die beim Auftragnehmer anfallenden notwendigen Kosten bis zu einem Höchstbetrag von #fieldValue(value: iTSicherheitAnlassunabhaengigePruefung) Euro netto.
      ]
    ],
  ),
  // Zeile 19
  (
    active: isRowActive(
      (
        checkboxVerfuegbarkeitAbweichendEVBAGB,
        checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeit,
        checkboxVerfuegbarkeitErsetzendEVBAGBGemaessAnlage,
        checkboxVerfuegbarkeitErgaenzendEVBAGBStoerung,
      ),
    ),
    kriterium: "Verfügbarkeit*",
    auspraegung: [
      #option(checkboxVerfuegbarkeitAbweichendEVBAGB)[
        Abweichend von Ziffer 8 EVB-IT Cloud-AGB

        #option(checkboxVerfuegbarkeitVerfuegbarkeitsklasse)[
          schuldet der Auftragnehmer während der Betriebszeit\* eine Verfügbarkeit\* von mindestens der Verfügbarkeitsklasse\* #fieldValue(value: verfuegbarkeitVerfuegbarkeitsklasse) im Bezugszeitraum,

          #option(checkboxVerfuegbarkeitVerfuegbarkeitsklasseBezugszeitraum)[
            ist der Bezugszeitraum\* der #fieldValue(value: verfuegbarkeitVerfuegbarkeitsklasseBezugszeitraum)
          ]
          #option(checkboxVerfuegbarkeitVerfuegbarkeitsklasseZeitangaben)[
            verstehen sich alle Zeitangaben als Angaben statt nach mitteleuropäischer Zeit (MEZ) bzw. Sommerzeit (MESZ) nach #fieldValue(value: verfuegbarkeitVerfuegbarkeitsklasseZeitangaben)
          ]
        ]
        #option(checkboxVerfuegbarkeitBetriebszeit)[
          ist die Betriebszeit\* die Zeit von #fieldValue(value: verfuegbarkeitBetriebszeitWochentagBeginn) bis #fieldValue(value: verfuegbarkeitBetriebszeitWochentagEnde) von #fieldValue(value: verfuegbarkeitBetriebszeitUhrzeitBeginn) bis #fieldValue(value: verfuegbarkeitBetriebszeitUhrzeitEnde) Uhr;
        ]
        #option(checkboxVerfuegbarkeitKernbetriebszeit)[
          besteht in der Zeit von #fieldValue(value: verfuegbarkeitKernbetriebszeitUhrzeitBeginn) bis #fieldValue(value: verfuegbarkeitKernbetriebszeitUhrzeitEnde) Uhr eine Kernbetriebszeit\* den besonderen Leistungsmerkmalen gemäß Anlage Nr. von #fieldValue(value: verfuegbarkeitKernbetriebszeitLeistungsmerkmaleGemaessAnlage)
        ]
        #option(checkboxVerfuegbarkeitWartungsarbeiten)[
          ist die Zeit von #fieldValue(value: verfuegbarkeitWartungsarbeitenUhrzeitBeginn) bis #fieldValue(value: verfuegbarkeitWartungsarbeitenUhrzeitEnde) Uhr am #fieldValue(value: verfuegbarkeitWartungsarbeitenWochentag) Zeit geplanter Nichtverfügbarkeit und wird bei der Berechnung der Verfügbarkeit\* nicht berücksichtigt,
        ]
      ]
      #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeit)[
        In Ergänzung zu Ziffer 8 der EVB-IT Cloud-AGB und der Definition zur Verfügbarkeit\* gilt die Leistung auch dann als nicht verfügbar, wenn im

        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitEineStunde)[
          Durchschnitt einer Stunde in der Betriebszeit
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitEinTag)[
          Durchschnitt für die Betriebszeit eines Tages
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitIndividuell)[
          #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitIndividuell)
        ]

        folgendes gegeben ist:

        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktion)[
          Das Antwortzeitverhalten der Funktion #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktionBezeichnung) ist schlechter als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitFunktionZeit).
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatz)[
          Der Datendurchsatz am Übergabepunkt #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzUebergabepunkt) beträgt weniger als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzMenge), pro #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitDatendurchsatzZeit).
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerung)[
          Die Paketverzögerung (der Zeitbedarf, um ein IP-Paket von #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungStart) nach #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungZiel) zu senden) beträgt mehr als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverzoegerungZeit).
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitRTD)[
          Der Round Trip Delay (RTD) beträgt mehr als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitRTDZeit) Millisekunden.
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrate)[
          Die Paketverlustrate (die Zahl der IÜ-Pakete, die pro #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrateZeiteinheit) Zeiteinheit verloren gehen, weil sie nicht rechtzeitig an ihren Bestimmungsort gelangen) beträgt mehr als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitPaketverlustrateVerlust).
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitNutzer)[
          Weniger als #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBNichtverfuegbarkeitNutzer) Nutzer können gleichzeitig die Leistung vollumfänglich nutzen.
        ]
      ]
      #option(checkboxVerfuegbarkeitErsetzendEVBAGBGemaessAnlage)[
        Anstelle der Verfügbarkeitsregelung in Ziffer 8 EVB-IT Cloud-AGB und der Definition zur Verfügbarkeit\* gilt Anlage Nr. #fieldValue(value: verfuegbarkeitErsetzendEVBAGBGemaessAnlage).
      ]
      #option(checkboxVerfuegbarkeitErgaenzendEVBAGBStoerung)[
        Ergänzend zu Ziffer 8 EVB-IT Cloud-AGB liegt eine die Verfügbarkeit\* ausschließende

        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBStoerungBetriebsverhindernd)[
          betriebsverhindernde Störung\* insbesondere auch vor, wenn #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBStoerungBetriebsverhindernd),
        ]
        #option(checkboxVerfuegbarkeitErgaenzendEVBAGBStoerungBetriebsbehindernd)[
          betriebsbehindernde Störung\* insbesondere auch vor, wenn #fieldValue(value: verfuegbarkeitErgaenzendEVBAGBStoerungBetriebsbehindernd).
        ]
      ]
    ],
  ),
  // Zeile 20
  (
    active: isRowActive(
      (
        checkboxGutschriftNichtverfuegbarkeitTabelle,
        checkboxGutschriftNichtverfuegbarkeitAuftragnehmerAGB,
        checkboxGutschriftNichtverfuegbarkeitIndividuell,
        checkboxGutschriftNichtverfuegbarkeitMesspunkte,
      ),
    ),
    kriterium: "Gutschriften bei Nichtverfügbarkeit",
    auspraegung: [
      #option(checkboxGutschriftNichtverfuegbarkeitTabelle)[
        Für den Fall der Nichteinhaltung der vereinbarten Verfügbarkeit\* die folgende Gutschrift zugunsten des Auftraggebers vereinbart:

        #table(
          columns: (15%, 15%, 70%),
          inset: 0.5em,
          align: center + horizon,
          table.header(
            repeat: true,
            table.cell(colspan: 2)[Unterschreitung in Prozentpunkten],
            [Gutschrift in Prozent der für den vereinbarten Bezugszeitraum geschuldeten Vergütung],
          ),
          [> 0], [< 1], [#fieldValue(value: gutschriftNichtverfuegbarkeitTabelleUnterschreitung01)],
          [>= 1], [< 2], [#fieldValue(value: gutschriftNichtverfuegbarkeitTabelleUnterschreitung12)],
          [>= 2], [< 3], [#fieldValue(value: gutschriftNichtverfuegbarkeitTabelleUnterschreitung23)],
          [>= 3], [< 4], [#fieldValue(value: gutschriftNichtverfuegbarkeitTabelleUnterschreitung34)],
          table.cell(colspan: 2)[>= 4], [#fieldValue(value: gutschriftNichtverfuegbarkeitTabelleUnterschreitung4)],
        )
      ]
      #option(checkboxGutschriftNichtverfuegbarkeitAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Gutschriften bei Nichtverfügbarkeit\*.
      ]
      #option(checkboxGutschriftNichtverfuegbarkeitIndividuell)[
        #fieldValue(value: gutschriftNichtverfuegbarkeitIndividuell).
      ]
      #option(checkboxGutschriftNichtverfuegbarkeitMesspunkte)[
        Messpunkte für die Feststellung der Verfügbarkeit\* sind die folgenden: #fieldValue(value: gutschriftNichtverfuegbarkeitMesspunkte).
      ]
    ],
  ),
  // Zeile 21
  (
    active: isRowActive(
      (
        checkboxReaktionsWiederherstellungszeiten
      ),
    ),
    kriterium: "Reaktions- und Wiederherstellungszeiten*",
    auspraegung: [
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
          [Schwerwiegende Störung\*],
          [#fieldValue(value: reaktionszeitSchwerwiegendeStoerung)],
          [#fieldValue(value: wiederherstellungszeitSchwerwiegendeStoerung)],

          [Erhebliche Störung\*],
          [#fieldValue(value: reaktionszeitErheblicheStoerung)],
          [#fieldValue(value: wiederherstellungszeitErheblicheStoerung)],

          [Leichte Störung\*],
          [#fieldValue(value: reaktionszeitLeichteStoerung)],
          [#fieldValue(value: wiederherstellungszeitLeichteStoerung)],
        )
      ]
    ],
  ),
  // Zeile 22
  (
    active: isRowActive(
      (
        checkboxProtokollierungZugriffAuftraggeberLeistungen,
        checkboxProtokollierungZugriffInfrastrukturkomponenten,
        checkboxProtokollierungSicherheitsstatusCloudmanagement,
        checkboxProtokollierungDatensicherung,
        checkboxProtokollierungAufbewahrungDauer,
        checkboxProtokollierungAufbewahrungRevisionssicher,
        checkboxProtokollierungGemaessAuftragnehmerAGB,
      ),
    ),
    kriterium: "Protokollierung",
    auspraegung: [
      Der Auftragnehmer führt folgende Protokolle:

      #option(checkboxProtokollierungZugriffAuftraggeberLeistungen)[
        Protokolle über die Zugriffe auf die vom Auftraggeber genutzten Leistungen einschließlich der entsprechenden Daten und Datensicherungen\*.
        Protokolliert werden muss dabei mindestens, durch wen, wann, wie und wie lange ein Zugriff erfolgte.
      ]
      #option(checkboxProtokollierungZugriffInfrastrukturkomponenten)[
        Protokolle über sämtliche Zugriffe auf Infrastrukturkomponenten.
        Protokolliert werden müssen dabei insbesondere: An- und Abmeldungen, Installation, Deinstallation und Modifikation von Anwendungen, Änderungen von Berechtigungen und Änderungen im Benutzermanagement.
        Die Erfassung und Protokollierung weiterer Daten (auch Metadaten) erfolgt in dem im Vertrag vereinbarten Umfang.
      ]
      #option(checkboxProtokollierungSicherheitsstatusCloudmanagement)[
        Protokolle über den Sicherheitsstatus des Cloud-Managementsystems (Vollständigkeit, Verfügbarkeit\*, Integrität und Vertraulichkeit der verarbeiteten Daten).
      ]
      #option(checkboxProtokollierungDatensicherung)[
        Protokolle über Art und Zeitpunkte der durchgeführten Datensicherungsmaßnahmen und Rücksicherungen.
      ]

      Der Auftraggeber hat das jederzeitige Recht, diese Protokolle einzusehen und in elektronisch bearbeitbarer Form abrufen zu können.

      #option(checkboxProtokollierungAufbewahrungDauer)[
        Die Protokolle sind mindestens:

        #option(checkboxProtokollierungAufbewahrungDauer6Monate)[
          sechs Monate aufzubewahren.
        ]
        #option(checkboxProtokollierungAufbewahrungDauerIndividuell)[
          #fieldValue(value: protokollierungAufbewahrungDauerIndividuell) Monate aufzubewahren.
        ]
      ]
      #option(checkboxProtokollierungAufbewahrungRevisionssicher)[
        Die Protokolle sind revisionssicher aufzubewahren.
      ]
      #option(checkboxProtokollierungGemaessAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Protokollierung.
      ]
    ],
  ),
  // Zeile 23
  (
    active: isRowActive(
      (
        checkboxAktualisierungRegulaereProgrammstaende,
        checkboxAktualisierungSpezifischeProgrammstaende,
        checkboxAktualisierungUmsetzungRechtsvorschriftenGemaessAnlage,
      ),
    ),
    kriterium: "Aktualisierung",
    auspraegung: [
      #option(checkboxAktualisierungRegulaereProgrammstaende)[
        Die Leistungen sind mit jeweils allgemein verfügbaren und vom Hersteller regulär supporteten Programmständen\* zu erbringen.
        Der Auftragnehmer ist zu deren Bereitstellung verpflichtet.
      ]
      #option(checkboxAktualisierungSpezifischeProgrammstaende)[
        Der Auftragnehmer ist verpflichtet, folgende Programmstände\* zu installieren und zu integrieren, sobald verfügbar:

        #option(checkboxAktualisierungSpezifischeProgrammstaendeUpdates)[
          Updates\*
        ]
        #option(checkboxAktualisierungSpezifischeProgrammstaendeUpgrades)[
          Upgrades\*
        ]
        #option(checkboxAktualisierungSpezifischeProgrammstaendeReleases)[
          neue Releases/Versionen\*
        ]
        #option(checkboxAktualisierungSpezifischeProgrammstaendeFirmware)[
          neue Firmwarestände
        ]
      ]
      #option(checkboxAktualisierungUmsetzungRechtsvorschriftenGemaessAnlage)[
        Der Auftragnehmer ist verpflichtet, Programmstände\* zur Umsetzung von Änderungen solcher Rechtsvorschriften und technischer Normen gemäß Anlage Nr. #fieldValue(value: aktualisierungUmsetzungRechtsvorschriftenGemaessAnlag) zu installieren und zu integrieren.
        Der Auftragnehmer stellt die geschuldeten Programmstände\* innerhalb angemessener Zeit vor, spätestens aber mit dem Inkrafttreten der jeweiligen Vorschrift oder Norm bzw. dem Zeitpunkt der vorgesehenen Änderung bzw. Anpassung.
        Erfolgt dies nicht spätestens zu diesen Terminen, ist der Auftragnehmer unbeschadet davon verpflichtet, dem Auftraggeber eine Übergangslösung bereitzustellen.
        Soweit ihm beides zu diesen Terminen zeitlich nicht zumutbar ist, haben sie innerhalb einer angemessenen Frist zu erfolgen.
      ]
    ],
  ),
  // Zeile 24
  (
    active: isRowActive(
      (
        checkboxReportingAbweichendEVBAGB,
        checkboxReportingErgaenzendEVBAGB,
        checkboxReportingZusaetzlichEVBAGB,
        checkboxReportingGemaessAuftragnehmerAGB,
      ),
    ),
    kriterium: "Reporting",
    auspraegung: [
      #option(checkboxReportingAbweichendEVBAGB)[
        Abweichend von Ziffer 9.1 EVB-IT Cloud-AGB erfolgt das Reporting nicht monatlich, sondern

        #option(checkboxReportingAbweichendEVBAGBTaeglich)[
          täglich
        ]
        #option(checkboxReportingAbweichendEVBAGBWoechentlich)[
          wöchentlich
        ]
        #option(checkboxReportingAbweichendEVBAGBQuartalsweise)[
          quartalsweise
        ]
      ]
      #option(checkboxReportingErgaenzendEVBAGB)[
        Ergänzend zu Ziffer 9 EVB-IT Cloud-AGB hat das Reporting folgende Inhalte:

        #option(checkboxReportingErgaenzendEVBAGBNeueProgrammstaende)[
          die durchgeführten Einspielungen neuer Programmstände\*
        ]
        #option(checkboxReportingErgaenzendEVBAGBNutzungsstatistik)[
          eine Nutzungsstatistik

          #option(checkboxReportingErgaenzendEVBAGBNutzungsstatistikNutzer)[
            über die max. Anzahl der gleichzeitigen Nutzer, der Nutzer und der Zugriffe insgesamt
          ]
          #option(checkboxReportingErgaenzendEVBAGBNutzungsstatistikFallzahlen)[
            über die Fallzahlen des Systems, soweit vergütungsrelevant
          ]
          #option(checkboxReportingErgaenzendEVBAGBNutzungsstatistikBackupzugriff)[
            über erfolgte Zugriffe auf Backup-Daten (insbesondere Nutzer, Zeitpunkt und Umfang des Zugriffs)
          ]
          #option(checkboxReportingErgaenzendEVBAGBNutzungsstatistikGemaessAnlage)[
            gemäß Anlage Nr. #fieldValue(value: reportingErgaenzendEVBAGBNutzungsstatistikGemaessAnlage)
          ]
        ]
        #option(checkboxReportingErgaenzendEVBAGBSicherheitsvorfaelle)[
          sämtliche für die Leistungen relevante Sicherheitsvorfälle (Zeitpunkt, Art, und Umfang des Vorfalls) und die vom Auftragnehmer getroffenen Maßnahmen zu deren Beseitigung.
        ]
        #option(checkboxReportingErgaenzendEVBAGBBackups)[
          die durchgeführten Backups und Datenexporte sowie ihre erfolgreiche Verifikation.
        ]
        #option(checkboxReportingErgaenzendEVBAGBWeiteresGemaessAnlage)[
          weitere Angaben gemäß Anlage #fieldValue(value: reportingErgaenzendEVBAGBWeiteresGemaessAnlage).
        ]
      ]
      #option(checkboxReportingZusaetzlichEVBAGB)[
        Zusätzlich zu Ziffer 9 EVB-IT Cloud-AGB ist für den Auftraggeber während der Nutzung der Leistung in Echtzeit einsehbar, wie viele Cloud-Ressourcen (Virtueller Speicher, Virtuelles Netzwerk, Virtuelle CPU Last, Virtuelles Storage) aktuell in Gebrauch sind (d.h. eine Darstellung der Auslastung der aktuell sich in Gebrauch befindlichen Cloud-Ressourcen).
      ]
      #option(checkboxReportingGemaessAuftragnehmerAGB)[
        Gemäß Anlage zur Einbeziehung auftragnehmerseitiger AGB, dort Anhang II. zur Kategorie Reporting.
      ]
    ],
  ),
  // Zeile 25
  (
    active: isRowActive(
      (
        checkboxMitwirkungAuftraggeberAbweichendEVBAGB
      ),
    ),
    kriterium: "Mitwirkungsleistungen des Auftraggebers",
    auspraegung: [
      #option(checkboxMitwirkungAuftraggeberAbweichendEVBAGB)[
        Zusätzlich zu bzw. abweichend von Ziffer 17 EVB-IT Cloud-AGB werden folgende Mitwirkungsleistungen des Auftraggebers vereinbart:

        #option(checkboxMitwirkungAuftraggeberAbweichendEVBAGBIndividuell)[
          #fieldValue(value: mitwirkungAuftraggeberAbweichendEVBAGBIndividuell)
        ]
        #option(checkboxMitwirkungAuftraggeberAbweichendEVBAGBGemaessAnlage)[
          gemäß Anlage Nr. #fieldValue(value: mitwirkungAuftraggeberAbweichendEVBAGBGemaessAnlage).
        ]
      ]
    ],
  ),
)

#context {
  let currentMode = modeState.get()

  let rowsToBeShown = if currentMode == "template" {
    kriterienTabelle
  } else {
    kriterienTabelle.filter(zeile => zeile.active == true)
  }

  let kriterienZellen = ()
  for (index, zeile) in rowsToBeShown.enumerate() {
    kriterienZellen += (
      str(index + 1),
      zeile.kriterium,
      zeile.auspraegung,
    )
  }

  table(
    columns: (6%, 24%, 70%),
    inset: 0.5em,
    align: horizon,
    table.header(
      repeat: true,
      [*Nr.*], [*Kriterium*], [*Ausprägung*],
    ),
    ..kriterienZellen,
  )
}




= Sonderkriterien für IaaS\* und PaaS\*
#table(
  columns: (5%, 20%, 25%, 50%),
  inset: 0.5em,
  align: (center + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    repeat: true,
    [*Lfd.*], [*Anzahl gleicher Systeme*], [*Parameter*], [*Ausprägung*],
  ),
  // =====================
  // LAUFENDE NUMMER 1
  // =====================
  table.cell(rowspan: 15)[1],
  table.cell(rowspan: 15)[
    fest: #fieldValue(value: anzahlGleicherSystemeFest)\
    minimal: #fieldValue(value: anzahlGleicherSystemeMinimal)\
    maximal: #fieldValue(value: anzahlGleicherSystemeMaximal)
  ],
  // Zeile 1 von 15
  table.cell(colspan: 2)[*Rechenleistung*],

  // Zeile 2 von 15
  [CPU-Anzahl / vCPU-Anzahl],
  [#fieldValue(value: rechenleistungCPUAnzahl) / #fieldValue(value: rechenleistungVCPUAnzahl)],

  // Zeile 3 von 15
  [Leistungsklasse bzw. nähere Beschreibung], [#fieldValue(value: rechenleistungLeistungsklasse)],

  // Zeile 4 von 15
  table.cell(colspan: 2)[*Speicher*],

  // Zeile 5 von 15
  [Arbeitsspeicher],
  [
    #option(
      checkboxSpeicherArbeitsspeicherFesteGroesse,
    )[feste Größe: #fieldValue(value: speicherArbeitsspeicherFesteGroesse) GB]
    #option(
      checkboxSpeicherArbeitsspeicherDynamischeGroesse,
    )[dynamisch: mind. #fieldValue(value: speicherArbeitsspeicherDynamischeGroesseMin) GB bis maximal: #fieldValue(value: speicherArbeitsspeicherDynamischeGroesseMax) GB]
    #option(checkboxSpeicherArbeitsspeicherIndividuell)[#fieldValue(value: speicherArbeitsspeicherIndividuell)]
    #option(
      checkboxSpeicherArbeitsspeicherDynamischOhneNeustart,
    )[dynamische Anpassung im laufenden Betrieb (kein Neustart)]
  ],

  // Zeile 6 von 15
  [(Festplatten-) Speichergröße],
  [
    #option(
      checkboxSpeicherFestplattenspeicherFesteGroesse,
    )[feste Größe: #fieldValue(value: speicherFestplattenspeicherFesteGroesse) GB]
    #option(
      checkboxSpeicherFestplattenspeicherDynamischeGroesse,
    )[dynamisch: mind. #fieldValue(value: speicherFestplattenspeicherDynamischeGroesseMin) GB bis maximal: #fieldValue(value: speicherFestplattenspeicherDynamischeGroesseMin) GB]
    #option(
      checkboxSpeicherFestplattenspeicherDynamischOhneNeustart,
    )[dynamische Anpassung im laufenden Betrieb (kein Neustart)]
  ],

  // Zeile 7 von 15
  [(Festplatten-) Speichertyp],
  [
    #option(checkboxSpeicherFestplattenspeicherTypSATA)[SATA-Festplatte]
    #option(checkboxSpeicherFestplattenspeicherTypSSD)[SSD]
    #option(checkboxSpeicherFestplattenspeicherTypSAS)[SAS]
    #option(checkboxSpeicherFestplattenspeicherTypSharedStorage)[shared Storage]
    #option(checkboxSpeicherFestplattenspeicherTypIndividuell)[#fieldValue(
      value: speicherFestplattenspeicherTypIndividuell,
    )]
  ],

  // Zeile 8 von 15
  [Performanceanforderungen],
  [
    #option(
      checkboxSpeicherFestplattenspeicherLeistungIOPS,
    )[Leistung in Total IOPS: #fieldValue(value: speicherFestplattenspeicherLeistungIOPS)]
    #option(
      checkboxSpeicherFestplattenspeicherLeistungDatenrate,
    )[Datenrate in MB/s mind.: #fieldValue(value: speicherFestplattenspeicherLeistungDatenrate)]
    #option(
      checkboxSpeicherFestplattenspeicherLeistungLatenz,
    )[Latenz in ms maximal: #fieldValue(value: speicherFestplattenspeicherLeistungLatenz)]
  ],

  // Zeile 9 von 15
  table.cell(colspan: 2)[*Betriebssystem*],

  // Zeile 10 von 15
  [Bezeichnung], [#fieldValue(value: betriebssystemBezeichnung)],

  // Zeile 11 von 15
  [Installationsart],
  [
    #option(checkboxBetriebssystemInstallationStandard)[Standardinstallation]
    #option(
      checkboxBetriebssystemInstallationKundenspezifischGemaessAnlage,
    )[kundenspezifische Ausprägung gemäß Anlage Nr. #fieldValue(value: betriebssystemInstallationKundenspezifischGemaessAnlage)]
  ],

  // Zeile 12 von 15
  [Sofern auftraggeberseitig ein Betriebssystem installiert wird, ist Treiberunterstützung für folgende Betriebssysteme des Auftraggebers geschuldet:],
  [
    #fieldValue(value: betriebssystemInstallationAuftraggeberTreiber)
  ],

  // Zeile 13 von 15
  table.cell(colspan: 2)[*Virtualisierung*],

  // Zeile 14 von 15
  [unterstützte Virtualisierungsumgebungen], [#fieldValue(value: virtualisierungsumgebungen)],

  // Zeile 15 von 15
  table.cell(colspan: 2)[*Kommunikationssicherheit*],

  // ======================
  // LAUFENDE NUMMER 2
  // ======================
  [2],
  table.cell(colspan: 2)[],
  [
    #option(
      checkboxKommunikationssicherheitNetze,
    )[COS-06 C5 Zusatzkriterium: Die sichere Trennung durch physisch getrennte Netze oder durch stark verschlüsselte VLANs ist sichergestellt. Zur Definition einer starken Verschlüsselung ist die Technische Richtlinie TR-02102 des BSI zu berücksichtigen.]
  ],
)




= Erweiterung und Reduzierung der Leistung

#option(
  checkboxBereitstellungWeiteresSystem,
)[Ein weiteres gleiches System jedoch maximal bis zur vereinbarten Maximalanzahl gleicher Systeme, ist innerhalb von #fieldValue(value: bereitstellungWeiteresSystem) nach Anforderung durch den Auftraggeber betriebsbereit bereitzustellen.]
#option(
  checkboxDeaktivierungWeiteresSystem,
)[Das System ist nach Anforderung innerhalb von #fieldValue(value: deaktivierungWeiteresSystem) durch den Auftragnehmer zu deaktivieren, soweit dadurch nicht die Minimalanzahl gleicher Systeme unterschritten wird.]
