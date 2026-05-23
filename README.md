<p align="center">
  <a href="https://aivot.de" target="_blank"><img width="150" src="https://aivot.de/img/aivot-logo.svg" alt="Aivot logo"></a>
</p>

<h1 align="center">EVB-IT</h1>
<h3 align="center">Versionierbare und maschinenlesbare EVB-IT-Verträge mit Typst</h3>

<p>Dieses Repository überführt die vom BMDS veröffentlichten EVB-IT-Verträge in eine versionierbare, nachvollziehbare und automatisierbare Typst-Basis. Änderungen werden mit Git präzise sichtbar, und die Inhalte lassen sich für maschinelle Verarbeitung sowie automatisierte Vertragsprozesse weiterverwenden.</p>

# Was ist EVB-IT?

Das Bundesministerium für Digitales und Staatsmodernisierung (BMDS) stellt unter [evb-it.gov.de](https://evb-it.gov.de) die EVB-IT-Verträge bereit.
Diese Vertragswerke dienen der öffentlichen Hand dazu, auf standardisierte Weise ausgewogene Verträge mit Unternehmen der Privatwirtschaft zu schließen.
Die offiziellen Fassungen werden bislang vor allem als PDF- und DOCX-Dateien veröffentlicht.

Genau diese Form der Bereitstellung bringt in der Praxis zwei wesentliche Nachteile mit sich: Erstens sind Änderungen zwischen verschiedenen Vertragsständen nicht exakt und transparent nachvollziehbar.
Zweitens sind die Inhalte in dieser Form nur eingeschränkt maschinell verarbeitbar.
Dieses Repository begegnet beiden Problemen, indem die Verträge in [Typst](https://typst.app) gepflegt werden.
Dadurch werden fachliche Änderungen im Zusammenspiel mit Git zeilen- und versionsgenau sichtbar, und die Vertragsinhalte können für Auswertungen, Vorbelegung, Generierung und weitere automatisierte Prozesse verwendet werden.

Aktuell umfasst das Repository die Vertragsfamilien `Cloud`, `Pflege S` und `Überlassung Typ B`.

# Wer nutzt EVB-IT?

Dieses Repository ist für alle interessant, die EVB-IT-Verträge nicht nur lesen, sondern systematisch pflegen, vergleichen oder weiterverarbeiten möchten.
Dazu zählen insbesondere öffentliche Auftraggeber und Beschaffungsstellen, die Änderungen zwischen Vertragsversionen sauber nachvollziehen wollen.

Ebenso profitieren Unternehmen, die EVB-IT-Verträge regelmäßig einsetzen, sowie Teams, die Vertragsdaten automatisiert weiterverarbeiten oder Vertragsabschlüsse vorbereiten möchten.
Gerade dort, wo Standardisierung, Skalierung und Nachvollziehbarkeit wichtig sind, schafft die Typst-basierte Fassung eine deutlich bessere technische Grundlage als reine PDF- oder DOCX-Dokumente.

# Einrichtung

Für dieses Projekt werden keine projektspezifischen Abhängigkeiten benötigt.
Du brauchst lediglich eine Typst-Installation und eine lokale Kopie dieses Repositories.

## Repository lokal bereitstellen

Du kannst das Repository per Git klonen oder als Archiv herunterladen und entpacken.
Anschließend wechselst du in das Projektverzeichnis:

```bash
git clone https://github.com/aivot-digital/evb-it
cd evb-it
```

Wichtig ist, dass du die Ordnerstruktur unverändert beibehältst, weil die Typst-Dateien mit absoluten Projektpfaden wie `"/utils/template.typ"` arbeiten.

## Typst lokal installieren

Die offizielle Installationsübersicht findest du in der Typst-Dokumentation und im [Typst-GitHub-Repository](https://github.com/typst/typst#installation).
Für die lokale Nutzung sind insbesondere diese Wege üblich:

- macOS: `brew install typst`
- Windows: `winget install --id Typst.Typst`
- Linux: Typst über den Paketmanager deiner Distribution installieren oder ein vorkompiliertes Binary aus den offiziellen Releases verwenden

Nach der Installation kannst du die CLI prüfen:

```bash
typst --version
```

## Typst lokal ausführen

Führe die folgenden Befehle immer aus dem Repository-Root aus. Das `--root .` ist in diesem Projekt entscheidend, weil die Dokumente absolute Imports und Asset-Pfade wie `"/utils/template.typ"` und `"/utils/logo.svg"` verwenden.

Eine Typst-Datei direkt kompilieren:

```bash
typst compile --root . evb-it/cloud/cloud-vertrag.typ
```

Eine Typst-Datei mit explizitem Ausgabepfad kompilieren:

```bash
typst compile --root . evb-it/cloud/cloud-vertrag.typ cloud-vertrag.pdf
```

Eine Typst-Datei im Watch-Modus mit automatischer Neukompilierung starten:

```bash
typst watch --root . evb-it/cloud/cloud-vertrag.typ
```

Wenn du ohne `--root .` arbeitest, können absolute Pfade aus den Dokumenten nicht zuverlässig aufgelöst werden.

## Nutzung mit typst.app

Wenn du Typst nicht lokal installieren möchtest, kannst du das Projekt auch in der Web-Anwendung von Typst bearbeiten:

1. Öffne [typst.app](https://typst.app) und lege ein neues Projekt an.
2. Lade das komplette Repository inklusive der bestehenden Ordnerstruktur hoch.
3. Wähle die gewünschte `.typ`-Datei als Vorschau-Datei aus.
4. Arbeite im Editor und überprüfe das Ergebnis in der Vorschau.
5. Exportiere das Dokument anschließend über den PDF-Export beziehungsweise Quick Export.

In `typst.app` ist das hochgeladene Projekt selbst die Projektwurzel.
Genau deshalb ist es wichtig, dass die Verzeichnisstruktur vollständig erhalten bleibt.

## Template verwenden

Die zentrale Template-Schnittstelle liegt in `utils/template.typ`.
Ein Vertrag wie `evb-it/cloud/cloud-vertrag.typ` bindet dieses Template einmal ein und setzt danach nur noch die für den konkreten Vertrag relevanten Variablen.
Genau darauf ist dieses Repository ausgelegt: Die Verträge unter `evb-it/` werden in der Regel nicht strukturell umgebaut, sondern durch das Anpassen von `#let`-Werten customized.

Am Anfang des Vertrags steht zunächst die globale Konfiguration des gemeinsamen Dokumentgerüsts:

```typst
#import "/utils/template.typ": *

#show: contractTemplate.with(
  outputMode: "template",
  layoutStyle: "standard",
  pageCounterName: "Seite",
  pageCounterNameSeparator: "von",
  contractTitle: "EVB-IT Cloudvertrag",
  contractVersion: "Version 1.0.2",
  contractDate: "(Stand: 01.03.2026)",
)
```

Danach folgen die vertragsspezifischen `#let`-Variablen, über die der eigentliche Inhalt des Vertrags gesteuert wird.

## Was das Template bereitstellt

Das Template liefert die gemeinsame technische Basis für alle Verträge im Repository.
Dazu gehören insbesondere das Deckblatt, das Inhaltsverzeichnis, Seitenkopf und Footer, die Nummerierung von Überschriften und Aufzählungen sowie die Darstellung optionaler Vertragsklauseln.

Die wichtigste globale Schnittstelle ist `contractTemplate.with(...)`.
Darüber werden die allgemeinen Dokumenteigenschaften gesetzt, zum Beispiel:

- `outputMode` für Formularmodus oder Endfassung
- `layoutStyle` für Standard- oder juristische Nummerierung
- Sprach- und Regionswerte
- Logo, Titel, Versions- und Datumsangaben
- Tiefe des Inhaltsverzeichnisses
- Footer-Beschriftungen und Metadaten

Zusätzlich stellt das Template zentrale Hilfsfunktionen bereit:

- `fieldValue(...)`: Gibt den gesetzten Inhalt aus oder zeichnet eine sichtbare Formularlinie, wenn noch kein Wert eingetragen wurde.
- `option(...)`: Rendert im Modus `"template"` eine auswählbare Klausel mit Checkbox und zeigt im Modus `"final"` nur aktivierte Klauseln an.
- `checkbox(...)`: Zeichnet die visuelle Checkbox für den Formularmodus.
- `juridicalNumbering(...)`: Steuert die juristisch geprägte Nummerierung, wenn `layoutStyle` auf `"juridical"` gesetzt wird.

Diese Funktionen erzeugen also die sichtbare Vertragslogik.
Die eigentlichen fachlichen Inhalte kommen anschließend aus den Variablen des jeweiligen Vertrags.

## Wie ein Vertrag damit angepasst wird

Im normalen Arbeitsablauf passt du nicht das Template selbst an, sondern die Variablen im jeweiligen Vertrag unter `evb-it/`.
Ein Vertrag wird also vor allem dadurch customized, dass du leere Werte befüllst, Auswahlklauseln aktivierst oder deaktivierst und Tabelleninhalte ergänzt.

Das Muster ist über die Verträge hinweg konsistent:

- String-Variablen enthalten freie Inhalte wie Namen, Adressen, Fristen, Beträge, Hinweise, URLs oder Beschreibungen.
- Boolesche Variablen mit Präfixen wie `checkbox...` steuern, ob optionale Klauseln oder Unteroptionen sichtbar und aktiv sind.
- Tupel und Listen bilden wiederholte Strukturen wie Anlagen, Leistungszeilen oder Preistabellen ab.

Wichtig ist dabei: Viele Hilfsvariablen wie `anlagenVertragsbestandteilZellen` oder `leistungenZellen` werden aus den eigentlichen Eingabedaten automatisch abgeleitet.
Im Regelfall bearbeitest du daher die Quellvariablen wie `anlagenVertragsbestandteil` oder `leistungen`, nicht die daraus erzeugten Hilfsstrukturen.

## Beispiel: EVB-IT Cloudvertrag

Der EVB-IT Cloudvertrag unter `evb-it/cloud/cloud-vertrag.typ` zeigt dieses Prinzip besonders gut.
Am Anfang der Datei werden die globalen Template-Parameter gesetzt, danach folgt ein großer Variablenblock mit allen anpassbaren Vertragswerten.

Ein typischer Anpassungsausschnitt kann zum Beispiel so aussehen:

```typst
#import "/utils/template.typ": *

#show: contractTemplate.with(
  outputMode: "template",
  layoutStyle: "standard",
  pageCounterName: "Seite",
  pageCounterNameSeparator: "von",
  contractTitle: "EVB-IT Cloudvertrag",
  contractVersion: "Version 1.0.2",
  contractDate: "(Stand: 01.03.2026)",
)

#let auftraggeberName = "Beispielbehörde"
#let auftragnehmerName = "Cloudanbieter GmbH"
#let gegenstandDesVertrages = "Bereitstellung eines SaaS-Fachverfahrens für 250 Nutzer"

#let checkboxVereinbarteLeistungSetup = true
#let checkboxVereinbarteLeistungSaaS = true

#let anlagenVertragsbestandteil = (
  (
    bezeichnung: "Leistungsbeschreibung",
    version: "Version 1.0 vom 15.05.2026",
    seitenanzahl: "12",
  ),
  (
    bezeichnung: "Preisblatt",
    version: "Version 1.0 vom 15.05.2026",
    seitenanzahl: "3",
  ),
)

#let leistungen = (
  (
    produkt: "SaaS-Fachverfahren",
    menge: "250 Nutzer",
    mindestvertragsdauer: "48 Monate",
    beginn: "01.07.2026",
    ende: "",
    abweichendeKuendigungsfrist: "",
    automatischeVerlaengerung: "12",
    preis: "4.500 EUR / Monat",
  ),
)
```

An diesem Beispiel sieht man die drei wichtigsten Anpassungsarten:

- Strings wie `auftraggeberName`, `auftragnehmerName` oder `gegenstandDesVertrages` füllen sichtbare Vertragsfelder.
- Checkboxen wie `checkboxVereinbarteLeistungSetup` oder `checkboxVereinbarteLeistungSaaS` schalten optionale Klauseln per `true` oder `false` ein und aus.
- Listen wie `anlagenVertragsbestandteil` und `leistungen` erzeugen wiederholte Tabellenzeilen für Anlagen und Leistungspositionen.

Im gerenderten Cloudvertrag erscheinen diese Werte dann an unterschiedlichen Stellen:

- Die Stammdaten von Auftraggeber und Auftragnehmer werden im Kopfbereich des Vertrags über `fieldValue(...)` ausgegeben.
- Die aktivierten Leistungsarten erscheinen im Abschnitt „Überblick über die vereinbarten Leistungen“ über `option(...)`.
- Die einzelnen Leistungsdaten landen über die aus `leistungen` erzeugten `leistungenZellen` in der Leistungstabelle.

Wenn du also einen bestehenden Vertrag aus `evb-it/` anpassen möchtest, änderst du typischerweise genau diese Werte:
Strings befüllen, Checkboxen aktivieren oder deaktivieren und Listeneinträge ergänzen oder entfernen.
Das Template sorgt anschließend dafür, dass diese Eingaben an den richtigen Stellen formatiert und dargestellt werden.

## Globale Template-Parameter

Die Funktion `contractTemplate(...)` stellt die globale Schnittstelle für alle Dokumente bereit.
Diese Parameter steuern das gemeinsame Dokumentgerüst; die eigentliche inhaltliche Individualisierung erfolgt danach über die vertragsspezifischen `#let`-Variablen im konkreten Vertrag:

| Parameter                  | Werte / Typ                                                                                         | Standardwert         | Wirkung                                                                                                                                                                                         |
|----------------------------|-----------------------------------------------------------------------------------------------------|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `outputMode`               | `"template"` oder `"final"`                                                                         | `"template"`         | Steuert die Darstellung optionaler Klauseln. `"template"` zeigt Checkboxen für Auswahlfelder, `"final"` blendet nicht aktivierte Optionen aus und rendert aktive Optionen ohne Checkbox-Layout. |
| `layoutStyle`              | `"standard"` oder `"juridical"`                                                                     | `"standard"`         | Bestimmt die Nummerierung von Überschriften und Aufzählungen. `"standard"` nutzt eine klassische technische Gliederung, `"juridical"` eine juristisch geprägte Gliederung mit Paragraphenstil.  |
| `language`                 | Typst-Sprachcode, z. B. `"de"` oder `"en"`                                                          | `"de"`               | Wird intern an `#set text(lang: ...)` übergeben und beeinflusst insbesondere Silbentrennung, Sprachregeln und sprachbezogene Formatierung.                                                      |
| `region`                   | Typst-Regionscode, case-insensitiv, in der Praxis ISO-3166-1-Alpha-2 wie `"DE"`, `"AT"` oder `"CH"` | `"de"`               | Ergänzt die Sprache um regionale Typografie- und Sprachkonventionen. Das Template reicht den Wert intern an `#set text(region: ...)` weiter.                                                    |
| `pageCounterName`          | Zeichenkette                                                                                        | `"Page"`             | Beschriftung des Seitenzählers im Footer, z. B. `"Seite"`.                                                                                                                                      |
| `pageCounterNameSeparator` | Zeichenkette                                                                                        | `"of"`               | Trenner im Seitenzähler, z. B. `"von"` in `Seite 1 von 5`.                                                                                                                                      |
| `logoPath`                 | Pfad zur Bilddatei                                                                                  | `"/utils/logo.svg"`  | Logo auf Deckblatt und Kopfzeile. Der Pfad muss aus Sicht der Typst-Projektwurzel erreichbar sein.                                                                                              |
| `tocDepth`                 | Zahl                                                                                                | `2`                  | Tiefe des automatisch erzeugten Inhaltsverzeichnisses. `1` nimmt nur oberste Ebenen auf, `2` zusätzlich die zweite Ebene.                                                                       |
| `contractTitle`            | Zeichenkette                                                                                        | `"Example Contract"` | Sichtbarer Titel auf dem Deckblatt und zugleich Dokumenttitel in den PDF-Metadaten.                                                                                                             |
| `contractVersion`          | Zeichenkette                                                                                        | `""`                 | Versionsangabe auf dem Deckblatt.                                                                                                                                                               |
| `contractDate`             | Zeichenkette                                                                                        | `""`                 | Datums- oder Standangabe auf dem Deckblatt.                                                                                                                                                     |
| `hint`                     | Zeichenkette                                                                                        | `""`                 | Freier Hinweistext im linken Bereich des Footers.                                                                                                                                               |
| `author`                   | Zeichenkette                                                                                        | `""`                 | Autor des Dokuments in den Metadaten. Standardmäßig wird dieser Wert nicht zusätzlich sichtbar auf dem Deckblatt ausgegeben.                                                                    |

Welche konkreten `#let`-Variablen ein Vertrag benötigt, hängt von der jeweiligen Datei ab.
Im Normalfall bearbeitest du zuerst die vertragsspezifischen Variablen im Cloudvertrag oder in einem anderen Vertrag unter `evb-it/` und greifst nur dann in die globalen Template-Parameter ein, wenn du das gemeinsame Dokumentverhalten anpassen möchtest.
Gute Referenzen sind die bestehenden Dokumente in `evb-it/cloud`, `evb-it/pflege-s` und `evb-it/ueberlassung-typ-b`.

# Dokumentation

Die zentrale technische Logik dieses Repositories liegt in [`utils/template.typ`](./utils/template.typ).
Dort sind die globale Template-Funktion, die Ausgabe-Modi sowie die gemeinsamen Hilfsfunktionen definiert.

Konkrete Vertrags- und Variablenbeispiele findest du direkt in den Typst-Dateien unter `evb-it/`.
Besonders hilfreich sind die bestehenden Vertragsstände, weil sie zeigen, wie `contractTemplate.with(...)` und die vertragsspezifischen `#let`-Variablen im Zusammenspiel verwendet werden.

# Mitwirken

Jede Person kann uns unterstützen.
Es gibt viele verschiedene Möglichkeiten, zu EVB-IT beizutragen.
Sicherlich ist auch eine passende für dich dabei.

| Unterstützungsmöglichkeit         | Hinweis                                                                                                                                                                                                                                                                        |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Das Projekt bekannt machen        | Teile deine Gedanken zu diesem Projekt in den sozialen Medien. Du kannst dabei gern auf unsere Website oder dieses GitHub-Repository verlinken.                                                                                                                                |
| Ideen teilen oder Feedback geben  | Teile deine Ideen mit uns oder melde einen Fehler. Mit GitHub Issues und unseren Vorlagen kannst du Themen leicht zur Diskussion stellen. Idealerweise liest du vorher die [Contributing-Richtlinie](https://github.com/aivot-digital/.github/blob/main/docs/CONTRIBUTING.md). |
| Entwickeln                        | Entwickle gemeinsam mit uns an dem Projekt. Beiträge werden über GitHub organisiert. Bitte lies vorher die [Contributing-Richtlinie](https://github.com/aivot-digital/.github/blob/main/docs/CONTRIBUTING.md).                                                                 |

❤ Vielen Dank für deinen Beitrag! ❤

# Lizenz

Die originären Bestandteile dieses Repositories stehen unter der [MIT-Lizenz](./LICENSE.md).
Dazu zählen insbesondere das Template, die projektspezifische Dokumentation und weitere eigenständige Hilfs- und Strukturdateien dieses Projekts.

Für EVB-IT- und sonstige BMDS-bezogene Inhalte gilt zusätzlich der Hinweis in [NOTICE.md](./NOTICE.md).
Im Rahmen der Prüfung dieses Repositories konnten wir keine ausdrückliche, belastbare Lizenzangabe speziell für die EVB-IT-Verträge finden.

Das [BMDS-Impressum](https://bmds.bund.de/impressum) deutet für Texte und Grafiken auf der BMDS-Webseite, soweit nicht anders gekennzeichnet, auf `CC BY-ND 4.0` hin.
Wir behandeln das hier jedoch ausdrücklich nur als vorläufige Einordnung und nicht als gesicherte Lizenzzuordnung für die EVB-IT-Verträge selbst.
Deshalb nimmt dieses Projekt keine pauschale Relizenzierung solcher Inhalte vor.

# Genutzte Dienste

Diese Dienste unterstützen die technische Zusammenarbeit in diesem Projekt:

[<img loading="lazy" alt="GitHub" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png" height="25">](https://github.com/)

GitHub ermöglicht das Hosting des Git-Repositories und die Koordination von Beiträgen.
