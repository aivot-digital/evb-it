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
  contractTitle: "Einbeziehung von auftragnehmerseitigen AGB",
  contractVersion: "Version 1.0.1",
  contractDate: "(Stand: 01.03.2022)",
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

// Nachrangig einbezogene auftragnehmerseitige AGB
#let agbs = (
  (
    bezeichnung: "",
    version: "",
    anzahlSeiten: "",
  ),
)
#let agbsZellen = for (index, agb) in agbs.enumerate() {
  (
    str(index + 1),
    fieldValue(value: agb.bezeichnung),
    fieldValue(value: agb.version),
    fieldValue(value: agb.anzahlSeiten),
  )
}

// Vorrangige Einbeziehung auftragnehmerseitiger AGB
#let checkboxLeistungsort = false
#let leistungsort = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxUebergabepunkt = false
#let uebergabepunkt = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxNutzer = false
#let nutzer = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxLizenzmetrik = false
#let lizenzmetrik = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxZugang = false
#let zugang = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxDatensicherung = false
#let datensicherung = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxGutschriftNichtverfuegbarkeit = false
#let gutschriftNichtverfuegbarkeit = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxProtokollierung = false
#let protokollierung = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let checkboxReporting = false
#let reporting = (
  (
    ziffer: "",
    lfdNr: "",
  ),
)

#let vorrangigeEinbeziehungAGBDaten = (
  (
    active: isRowActive(
      (
        checkboxLeistungsort,
      ),
    ),
    kategorie: [Leistungsort],
    referenzen: leistungsort,
  ),
  (
    active: isRowActive(
      (
        checkboxUebergabepunkt,
      ),
    ),
    kategorie: [Übergabepunkt],
    referenzen: uebergabepunkt,
  ),
  (
    active: isRowActive(
      (
        checkboxNutzer,
      ),
    ),
    kategorie: [Nutzer],
    referenzen: nutzer,
  ),
  (
    active: isRowActive(
      (
        checkboxLizenzmetrik,
      ),
    ),
    kategorie: [Sonstiger Nutzungsumfang/Lizenzmetrik],
    referenzen: lizenzmetrik,
  ),
  (
    active: isRowActive(
      (
        checkboxZugang,
      ),
    ),
    kategorie: [Endgeräte/Zugang],
    referenzen: zugang,
  ),
  (
    active: isRowActive(
      (
        checkboxDatensicherung,
      ),
    ),
    kategorie: [Datensicherung],
    referenzen: datensicherung,
  ),
  (
    active: isRowActive(
      (
        checkboxGutschriftNichtverfuegbarkeit,
      ),
    ),
    kategorie: [Gutschrift bei Nichtverfügbarkeit],
    referenzen: gutschriftNichtverfuegbarkeit,
  ),
  (
    active: isRowActive(
      (
        checkboxProtokollierung,
      ),
    ),
    kategorie: [Protokollierung],
    referenzen: protokollierung,
  ),
  (
    active: isRowActive(
      (
        checkboxReporting,
      ),
    ),
    kategorie: [Reporting],
    referenzen: reporting,
  ),
)




// ==========================================
// 4. CONTENT
// ==========================================

#align(center)[
  #heading(outlined: false, bookmarked: false, numbering: none)[
    Einbeziehung von auftragnehmerseitigen AGB\
    Anlage #fieldValue(value: nummerAnlage) zum EVB-IT Cloudvertrag #fieldValue(value: referenzCloudvertrag)
  ]
]




= Anhang zum EVB-IT Cloudvertrag
Zu Nummer 1.2.4 des Vertrages nachrangig einbezogene auftragnehmerseitige AGB zu Art und Umfang der Cloudleistungen:

#table(
  columns: (auto, 1fr, auto, auto),
  inset: 0.5em,
  align: horizon,
  table.header(
    repeat: true,
    [*Lfd. Nr.*], [*Bezeichnung*], [*Datum/Version*], [*Anzahl Seiten*],
  ),
  ..agbsZellen.flatten(),
)




= Anhang zum Kriterienkatalog

#context {
  let currentMode = modeState.get()

  let rowsToBeShown = if currentMode == "template" {
    vorrangigeEinbeziehungAGBDaten
  } else {
    vorrangigeEinbeziehungAGBDaten.filter(zeile => zeile.active == true)
  }

  let vorrangigeEinbeziehungAGBZellen = ()
  for zeile in rowsToBeShown {
    let dynamischeReferenzen = zeile
      .referenzen
      .map(ref => [
        Ziffer/Paragraph #fieldValue(value: ref.ziffer, length: 2.5cm) aus Anhang I, lfd. Nr. #fieldValue(value: ref.lfdNr, length: 1.5cm)
      ])
      .join([\ ])

    vorrangigeEinbeziehungAGBZellen += (
      [#checkbox(zeile.active)],
      [*#zeile.kategorie*],
      dynamischeReferenzen,
    )
  }

  table(
    columns: (5%, 30%, 65%),
    inset: 0.5em,
    align: (center + horizon, left + horizon, left + horizon),
    table.header(
      repeat: true,
      [],
      [*Kategorie aus dem Kriterienkatalog*],
      [*Ziffer/Paragraph aus den auftragnehmerseitigen AGB zu Art und Umfang der Cloudleistungen die gemäß Nummer 1.2.4 des Vertrages einbezogen wurden*],
    ),
    ..vorrangigeEinbeziehungAGBZellen,
  )
}
