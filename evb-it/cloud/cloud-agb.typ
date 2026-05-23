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
  tocDepth: 1,
  contractTitle: "Ergänzende Vertragsbedingungen für Cloudleistungen",
  contractVersion: "Version 1.0.2",
  contractDate: "(Stand: 01.03.2026)",
)

// ==========================================
// 2. CONTENT
// ==========================================

#align(center)[
  #heading(outlined: false, bookmarked: false, numbering: none)[EVB-IT Cloud-AGB]
]

= Gegenstand des Vertrages

==
Gegenstand des Vertrages sind die dort vereinbarten Leistungen des Auftragnehmers.
Die Leistungen des Auftragnehmers können insbesondere umfassen:
- Software as a Service (SaaS)\*,
- Platform as a Service (PaaS)\*,
- Infrastructure as a Service (IaaS)\*,
- Managed Cloud Services (MCS)\*,
- Sonstige mit den vorgenannten Leistungen in Zusammenhang stehende Leistungen, wie zum Beispiel initiale Leistungen.

Soweit der Auftragnehmer bei der Leistungserbringung im Auftrag Daten des Auftraggebers verarbeitet und / oder hostet, ist dies Teil der geschuldeten Leistungen.

==
Der Auftragnehmer erbringt die Leistungen unter Einhaltung des bei Vertragsschluss jeweils aktuellen Cloud Computing Compliance Criteria Catalogue -- C5 (Basiskriterien).
Zudem beachtet der Auftragnehmer die durch den Auftraggeber zum Vertragsinhalt gemachten Sicherheitsanforderungen, z.B. aus seiner Sicherheitsrichtlinie im Sinne des Mindeststandard(s) des Bundesamts für Sicherheit in der Informationstechnik (BSI) zur Nutzung externer Cloud-Dienste.

Sofern sich der Anforderungskatalog C5 (Basiskriterien) während der Laufzeit des Vertrages ändert, wird sich der Auftragnehmer bemühen, auch die neuen bzw. geänderten Anforderungen innerhalb angemessener Frist zu erfüllen.
Sollte der Auftragnehmer nicht innerhalb von zwölf Monaten (vorbehaltlich einer anderen vom Gesetzgeber vorgegebenen Umsetzungsfrist, die in jedem Fall einzuhalten ist) ab der Veröffentlichung des Nachfolgedokumentes gegenüber dem Auftraggeber auf Anforderung erklären, dass er die neuen und die geänderten Anforderungen erfüllt, hat der Auftraggeber ein mit einer Frist von einem Monat auszuübendes Sonderkündigungsrecht bezogen auf die betroffenen Leistungen.
Der Auftraggeber verliert das Sonderkündigungsrecht nicht dadurch, dass er es nicht unverzüglich ausübt.
Die Erneuerung eines etwaigen Testats erfolgt im üblichen Prüfungsturnus.

==
Der Auftragnehmer ist verpflichtet, seine Leistungen ständig mit geeigneten technischen Mitteln (Monitoring\*) zu überwachen.
Die Reportingpflicht aus Ziffer 9 wird hierdurch nicht erweitert.

==
Der Auftragnehmer stellt die Leistungen frei von Schaden stiftender Software zur Verfügung.
Dies gilt auch für etwaige dem Auftraggeber überlassene Software (z.B. Zugangssoftware\*).
Der Auftragnehmer gewährleistet darüber hinaus, dass die Leistungen frei von Funktionen sind, die die Integrität, Vertraulichkeit und Verfügbarkeit der Daten des Auftraggebers oder vom Auftraggeber eingebrachte andere Daten bzw. von ihm eingebrachte Software gefährden und den Vertraulichkeits- oder Sicherheitsinteressen des Auftraggebers zuwiderlaufen durch
- Funktionen zum unerwünschten Absetzen / Ausleiten von Daten,
- Funktionen zur unerwünschten Veränderung / Manipulation von Daten oder der Ablauflogik oder
- Funktionen zum unerwünschten Einleiten von Daten oder unerwünschte Funktionserweiterungen.

Unerwünscht ist eine mögliche Aktivität einer Funktion, wenn die Aktivität so weder vom Auftraggeber in seiner Leistungsbeschreibung gefordert, noch vom Auftragnehmer unter konkreter Beschreibung der Aktivität und ihrer Funktionsweise angeboten, noch den Anforderungen des Anforderungskataloges C5 gemäß Ziffer 1.2 genügt.

==
Eine Einbeziehung auftragnehmerseitiger AGB\* zu Art und Umfang der Cloudleistungen, die als Anlage zum Vertrag aufgenommen wurden, erfolgt nachrangig zum Vertrag und zu den EVB-IT Cloud AGB und nur, soweit sie allen anderen vertraglichen Regelungen weder entgegenstehen noch diese beschränken.
Wie vorstehend wirksam einbezogen sind die auftragnehmerseitigen AGB\* zu Art und Umfang der Cloudleistungen auch, insoweit sie einen dynamischen Änderungsvorbehalt vorsehen, soweit die Änderungen nicht zum Nachteil des Auftraggebers sind und dem Auftraggeber bekannt gemacht wurden.
Abweichend hiervon gelten hinsichtlich einzelner konkreter Anforderungen entsprechende Regelungen aus auftragnehmerseitigen AGB\* zu Art und Umfang der Cloudleistungen vorrangig zu den EVB-IT Cloud AGB, soweit dies im Kriterienkatalog ausdrücklich vereinbart ist.




= Art und Umfang der Leistungen

== Software und Platform as a Service (SaaS\* und PaaS\*)

===
Soweit eine SaaS\*- oder PaaS\*-Leistung geschuldet ist, stellt der Auftragnehmer dem Auftraggeber ab dem vereinbarten Bereitstellungszeitpunkt die im Vertrag vereinbarte Anwendung / Plattform zur Nutzung in einer vom Auftragnehmer betriebenen Cloudinfrastruktur einschließlich der notwendigen Zugänge zur Verfügung.
Der Auftragnehmer sorgt für die vereinbarte Verfügbarkeit gemäß Ziffer 8.1, die vereinbarte Qualität der Leistung (funktional und nichtfunktional) sowie für die Sicherheit im Rahmen seines Verantwortungsbereichs während der gesamten Laufzeit der Leistung.
Insbesondere hat der Auftragnehmer die Cloudinfrastruktur und die Anwendung bzw. Plattform so zu dimensionieren, dass diese mit einer im Hinblick auf die zu erwartenden bzw. vereinbarten Zugriffe angemessenen Reaktions- und Ausführungsgeschwindigkeit und mit einem für die bestimmungsgemäße Nutzung ausreichendem bzw. dem vereinbarten Speicherplatz verfügbaren aktuellen Sicherheitspatches und auch im Übrigen den vereinbarten Anforderungen entsprechend zur Verfügung steht.\
Soweit bei PaaS\* der Auftraggeber Anwendungen auf der Plattform betreibt, ist er für diese, deren Verfügbarkeit, Inhalte und Architektur sowie deren Leistungsfähigkeit ebenso wie für seine Entwicklungstätigkeiten verantwortlich.
Der Auftraggeber wird ohne vorherige Zustimmung des Auftragnehmers keine Penetrationstests in der jeweiligen Cloudinfrastruktur durchführen oder autorisieren.\
Darüber hinaus ergibt sich der Umfang der Leistungen aus dem Vertrag.

===
Soweit vereinbart, ist der Auftragnehmer zur Installation und Integration der im Vertrag vereinbarten Programmstände\* der Anwendung / Plattform verpflichtet.
Dies erfolgt jeweils innerhalb angemessener Frist, nachdem der Programmstand\* verfügbar ist, jedoch unter Beachtung von Ziffer 2.1.5.

===
Soweit bei SaaS\* vereinbart, ist der Auftragnehmer verpflichtet, Programmstände\* zur Umsetzung von Änderungen solcher Rechtsvorschriften und technischer Normen zu installieren und zu integrieren, die die Nutzbarkeit der Anwendung / Plattform für den bestimmungsgemäßen Gebrauch beeinflussen.
Im Vertrag können darüber hinaus weitere Fälle vereinbart werden, in denen Programmstände\* zu installieren und zu integrieren sind.
Hierzu können z.B. Anpassungen an geänderte Verwaltungsvorschriften, Tarife oder Schnittstellenanpassungen gehören.
Sind derartige Programmstände\* nicht verfügbar, hat der Auftragnehmer diese zu erstellen bzw. erstellen zu lassen.

===
Soweit eine Verpflichtung nach Ziffer 2.1.2 und / oder 2.1.3 besteht, installiert und integriert der Auftragnehmer die geschuldeten Programmstände\* innerhalb angemessener Zeit vor, spätestens aber mit dem Inkrafttreten der jeweiligen Vorschrift oder Norm bzw. dem Zeitpunkt der vorgesehenen Änderung bzw. Anpassung.
Erfolgt dies nicht spätestens zu diesen Terminen, ist der Auftragnehmer unbeschadet davon verpflichtet, dem Auftraggeber eine Übergangslösung bereitzustellen.
Soweit ihm beides zu diesen Terminen zeitlich nicht zumutbar ist, hat die Erbringung innerhalb einer angemessenen Frist zu erfolgen.

===
Der Auftragnehmer ist verpflichtet, den Auftraggeber zur Vermeidung von Inkompatibilitäten, Unterbrechungen und sonstigen Störungen rechtzeitig (beispielsweise per E-Mail oder über die Administrationskonsole) über die Absicht von Systemanpassungen zu unterrichten.




== Infrastructure as a Service (IaaS\*)

===
Soweit eine IaaS\*-Leistung geschuldet ist, stellt der Auftragnehmer dem Auftraggeber ab dem vereinbarten Bereitstellungszeitpunkt die im Vertrag vereinbarte Cloudinfrastruktur zur Nutzung zur Verfügung und sorgt für die vereinbarte Verfügbarkeit, die vereinbarte Qualität der Leistung (funktional und nichtfunktional) sowie für die Sicherheit der Cloudinfrastruktur.
Ziffer 2.1.1 Sätze 3 ff. gelten entsprechend.

===
Der Auftraggeber ist für die Einhaltung der vereinbarten Zugriffs- und Systemvoraussetzungen verantwortlich.
Darüber hinaus ist der Auftraggeber verantwortlich für nicht vom Auftragnehmer stammende oder bereitgestellte Betriebssysteme, Software, Anwendungen und Inhalte, die er auf dieser Cloudinfrastruktur betreibt.

===
Der Auftragnehmer ermöglicht dem Auftraggeber den Zugang zur vereinbarten Cloudinfrastruktur zur eigenverantwortlichen Nutzung.
Der Auftraggeber ist berechtigt, auf der Cloudinfrastruktur Daten zu verarbeiten und Programme zu betreiben. Der Auftraggeber wird ohne vorherige Zustimmung des Auftragnehmers keine Penetrationstests in der jeweiligen Cloudinfrastruktur durchführen oder autorisieren.




== Managed Cloud Services (MCS\*)

===
Soweit eine MCS\*-Leistung geschuldet ist, übernimmt der Auftragnehmer im vereinbarten Umfang Leistungen im Zusammenhang mit SaaS\*, PaaS\* oder IaaS\*, für die ansonsten der Auftraggeber verantwortlich ist (beispielsweise Mitwirkungsleistungen nach Ziffer 17) sowie weitere Leistungen (beispielsweise Beratungsleistungen oder Arbeiten zur Herstellung des Zugangs).

===
Soweit in Ergänzung von mit dem Auftragnehmer vereinbarten SaaS\*, PaaS\* oder IaaS\*-Leistungen für diese Leistungen MCS\*-Leistungen geschuldet sind, erbringt der Auftragnehmer diese zusätzlich zu den SaaS\*-, PaaS\* oder IaaS\*-Leistungen.

===
Soweit SaaS\*-, PaaS\* oder IaaS\*-Leistungen nicht vom Auftragnehmer geschuldet sind, ist der Auftragnehmer für diese Leistungen Dritter nicht verantwortlich, auch wenn die Integration, Steuerung oder Verwendung der Leistungen des Dritten Teil seiner Leistungen ist.




= Nutzungsverbote

==
Weder der Auftraggeber noch die Nutzer, die über den Auftraggeber auf die Leistungen des Auftragnehmers zugreifen, sind berechtigt, die Leistungen zu nutzen,
- auf eine Weise, die dem Auftraggeber durch Gesetze, Rechtsverordnungen oder dem Auftraggeber bekannte behördliche Anordnungen verboten ist,
- um die Rechte anderer zu verletzen.

==
Soweit der bestimmungsgemäße Gebrauch der Leistung nicht explizit beschrieben ist, ist eine Verwendung der Leistung im Hochrisikobereich ausgeschlossen (Betrieb von Kernenergieanlagen, Flugsicherungssystemen, Kriegswaffen, lebenserhaltenden Apparaten oder vergleichbare risikobehaftete Anwendungen, bei denen Leistungsstörungen typischerweise unmittelbar zum Tod von Menschen oder zu Großschadenslagen führen).

==
Verstöße gegen die Nutzungsverbote gemäß Ziffer 3 berechtigen den Auftragnehmer zur Aussetzung seiner Leistung, sofern er dem Auftraggeber, dort mindestens der nach Ziffer 6.2.2 benannten Person, vor Aussetzung der Leistung eine angemessene Frist zur Beendigung der Verstöße gesetzt hat und diese erfolglos abgelaufen ist.
Beendet der Auftraggeber den Verstoß, ist die Leistung unverzüglich wieder zu erbringen.
Soweit die von der Aussetzung betroffenen Leistungen für mehr als 10 Stunden im Bezugszeitraum\* ausgesetzt sind, schuldet der Auftraggeber auch keine Vergütung für die ausgesetzte Leistung.




= Leistungsort
Die Speicherung und sonstige Verarbeitung von Daten des Auftraggebers durch den Auftragnehmer erfolgt ausschließlich innerhalb der EU und des EWR sowie, sofern ein Angemessenheitsbeschluss gem. Art. 45 DSGVO besteht, der Schweiz, es sei denn, der Auftraggeber hat in der Administrationskonsole (Self-Service-Portal o.ä.) zusätzlich weitere Regionen für die Leistungen ausgewählt.
Die Verarbeitung von Metadaten im Sinne des Anforderungskataloges C5 (in Version 2020: OPS 11) ist unabhängig von Satz 1 nach dessen Maßgabe möglich, soweit die dort geforderten Maßnahmen zur sicheren Handhabung der Metadaten tatsächlich umgesetzt sind; für personenbezogene Metadaten gelten die Regelungen zur Verarbeitung personenbezogener Daten vorrangig.




= Zugriff / Speicherplatz

==
Der Zugriff auf die Leistung erfolgt über das öffentliche Internet mit einem marktüblichen Web-Browser ohne unangemessene oder marktunübliche Browser-Einstellungen und ohne spezielle Zugriffssoftware.\
Der Übergabepunkt ist das Gateway des Auftragnehmers in das Internet.

==
Ist der Zugriff auf die Leistung mit einer speziellen Zugriffssoftware vereinbart, ist der Auftragnehmer verpflichtet, diese rechtzeitig dem Auftraggeber zur Verfügung zu stellen.

==
Der Auftragnehmer ist verpflichtet, den Zugriff auf die Daten des Auftraggebers durch unberechtigte Stellen und Personen mit angemessenen Maßnahmen zu verhindern.

==
Der Zugriff des Auftragnehmers oder Dritter auf Daten des Auftraggebers ist nur in den vereinbarten Fällen gestattet und auf das für diese Fälle erforderliche Maß zu beschränken.
Auf Anforderung des Auftraggebers hat der Auftragnehmer die dazu von ihm ergriffenen Maßnahmen innerhalb angemessener Frist darzustellen.

==
Soweit der Auftraggeber die Größe des ihm zu Verfügung stehenden Speicherplatzes nicht selbst bestimmen kann, z.B. durch Konfiguration des Dienstes und auch keine bestimmte Größe vereinbart ist, stellt der Auftragnehmer dem Auftraggeber für die vertragsgemäße Nutzung der Leistung ausreichenden Speicherplatz zur Verfügung.




= Datenschutz, IT-Sicherheit und Vertraulichkeit
Die nachfolgenden Regelungen lassen weitergehende gesetzliche und regulatorische Anforderungen unberührt.

== Datenschutz
===
Die Parteien werden die bei der Erbringung der Leistung jeweils auf sie anwendbaren Bestimmungen über den Datenschutz in der jeweils geltenden Fassung einhalten.
Der Auftragnehmer verfügt über eine hinreichende Dokumentation über die Umsetzung der gesetzlichen Anforderungen, die der Auftragnehmer dem Auftraggeber auf Anforderung zugänglich macht.

===
Der Auftragnehmer sorgt dafür, dass alle Personen, die von ihm mit der Verarbeitung personenbezogener Daten des Auftraggebers betraut sind, die auf den Auftragnehmer anwendbaren Bestimmungen über den Datenschutz beachten.
Soweit eine Verpflichtung auf das Datengeheimnis erforderlich ist, ist diese spätestens vor der erstmaligen Aufnahme der Tätigkeit vorzunehmen und dem Auftraggeber auf Verlangen vorzulegen.

===
Sofern Gegenstand der beauftragten Leistung zumindest auch die Verarbeitung personenbezogener Daten ist, schließen die Parteien vor der Verarbeitung von personenbezogenen Daten durch den Auftragnehmer im Auftrag des Auftraggebers eine Auftragsverarbeitungsvereinbarung (AVV).
Im Zuge des Abschlusses der AVV treffen die Parteien entsprechende angemessene technisch organisatorische Maßnahmen (TOM).
Dabei sind jeweils die Mindestvorgaben für die Leistung aus diesen EVB-IT Cloud AGB, dem EVB-IT Cloudvertrag sowie die Vorgaben gemäß Artikeln 28 und 32 DSGVO und weiterer auf den Auftragnehmer als Auftragsverarbeiter anwendbarer gesetzlicher Bestimmungen in vollem Umfang einzuhalten.

===
Der Auftragnehmer verfügt, soweit gesetzlich erforderlich, über einen bestellten betrieblichen Datenschutzbeauftragten mit der erforderlichen Fachkunde und teilt dem Auftraggeber auf Anfrage dessen Kontaktdaten mit.

== IT-Sicherheit

===
Der Auftragnehmer verfügt für die Bereitstellung der Leistung (inklusive der dazu notwendigen infrastrukturellen, organisatorischen, personellen und technischen Komponenten) über ein angemessenes, dokumentiertes und implementiertes Sicherheitskonzept und ein Informationssicherheits-Managementsystem (ISMS) jeweils gemäß ISO 27001 einschließlich eines Notfall-Managements.
Das Sicherheitskonzept hat sich an ISO 27017 auszurichten.
Sofern personenbezogene Daten verarbeitet werden, hat es sich zudem an ISO 27018 auszurichten.\
Soweit vereinbart, weist der Auftragnehmer dies durch gültige Zertifikate oder gleichwertige Nachweise nach.
Sicherheitskonzept, ISMS und Zertifikate müssen, soweit auf die zu erbringende Leistung anwendbar, diese vollumfänglich abdecken und sind entsprechend des festgelegten Prüfungsturnus im relevanten Standard zu erneuern.

===
Der Auftragnehmer verfügt über einen IT-Sicherheitsbeauftragten mit der erforderlichen Fachkunde und teilt dem Auftraggeber dessen Kontaktdaten auf Anforderung mit.
Der Auftragnehmer informiert den Auftraggeber zeitnah und in angemessener Form von ihn betreffenden Sicherheitsvorfällen\*.
Sofern durch den Auftraggeber ein IT-Sicherheitsbeauftragter oder eine andere Person für den Empfang solcher Informationen benannt wurde, folgt die Information unmittelbar an diesen.

== Vertraulichkeit

===
Die Parteien sind verpflichtet, alle im Rahmen des Vertragsverhältnisses erlangten vertraulichen Informationen, Geschäfts- und Betriebsgeheimnisse vertraulich zu behandeln, insbesondere nicht an unberechtigte Dritte weiterzugeben oder anders als zu vertraglichen Zwecken zu verwerten.
Die vorgenannte Pflicht zur Vertraulichkeit schränkt jedoch keine Partei darin ein, für sie tätige Personen, die Zugang zu vertraulichen Informationen hatten, in anderen Projekten einzusetzen.
Der Erfahrungsaustausch des Auftraggebers mit und innerhalb der öffentlichen Hand bleibt unbenommen, ebenso wie die Erfüllung gesetzlicher Pflichten.

===
Vertrauliche Informationen sind Informationen, die ein verständiger Dritter als schützenswert ansehen würde oder die als vertraulich gekennzeichnet sind; dies können auch solche Informationen sein, die während einer mündlichen Präsentation oder Diskussion bekannt werden.
Vertrauliche Informationen dürfen ausschließlich zum Zweck der Erfüllung der Verpflichtungen aus dem Vertrag eingesetzt bzw. verwertet werden.
Die Verpflichtung zur Vertraulichkeit gilt nicht für Informationen, die den Parteien bereits rechtmäßig bekannt sind oder außerhalb des Vertrages ohne Verstoß gegen eine Vertraulichkeitsverpflichtung bekannt werden.

== Prüfrechte
===
Der Auftragnehmer ist verpflichtet, die Einhaltung der Vorgaben an die IT-Sicherheit nachzuweisen.
Auf Anforderung des Auftraggebers legt der Auftragnehmer insbesondere die gemäß Mindeststandard für externe Cloudleistungen des BSI geforderten Sicherheitsnachweise vor; dies kann auch durch die regelmäßige Bereitstellung einer aktuellen C5-Berichterstattung vom Typ2 erfolgen.
Auf Anforderung des Auftraggebers legt der Auftragnehmer außerdem Nachweise über die regelmäßige Durchführung von Audits, Sicherheitsprüfungen, Penetrationstests und Schwachstellenanalysen vor, z.B. durch entsprechende Bestätigungen von Auditoren.

===
Bestehen Zweifel des Auftraggebers in Bezug auf die vom Auftragnehmer nach Ziffer 6.4.1 zur Verfügung gestellten Unterlagen, die der Auftragnehmer auf Nachfrage innerhalb angemessener Frist auszuräumen nicht in der Lage ist, ist der Auftragnehmer verpflichtet, entsprechend qualifiziertem bzw. ausgebildetem Personal des Auftraggebers oder einer vom Auftraggeber beauftragten unabhängigen zur Berufsverschwiegenheit verpflichteten Prüfungsgesellschaft während der normalen Geschäftszeiten Zugang insbesondere zu den für die Verarbeitung der Daten des Auftraggebers relevanten Verarbeitungssystemen, Einrichtungen sowie zu unterstützenden Unterlagen zu gewähren, sodass der Auftraggeber prüfen kann, ob der Auftragnehmer die Vorgaben einhält.
Die Prüfung ist unter Beachtung der Sicherheitsbelange und der Betriebs- und Geschäftsgeheimnisse des Auftragnehmers sowie der weiteren Kunden des Auftragnehmers durchzuführen.
Der Auftragnehmer ist verantwortlich dafür, dass die Prüfung gleichwohl effektiv und im erforderlichen Umfang erfolgen kann.
Jede Partei trägt die ihr entstehenden Kosten für derartige Prüfungen selbst.
Soweit zielführend, sollte sich die Prüfung an dem Leitfaden „Anwendung des BSI C5 durch Interne Revision und Informationssicherheit“ der ISACA Germany Chapter e.V. orientieren.
Die Grundsätze von Verhältnismäßigkeit und Wirtschaftlichkeit sind dabei grundsätzlich im Interesse aller Parteien zu wahren.
Sofern das Prüfungsergebnis lediglich unwesentliche Beanstandungen ergibt, zahlt der Auftraggeber eine Vergütung, sofern eine solche für diesen Fall im Kriterienkatalog vorgesehen ist.

===
Die Prüfung hat mit angemessener Vorankündigung für den Auftragnehmer sowie unter Einhaltung der vertraglichen Vertraulichkeitsregeln zu erfolgen.
Sie findet grundsätzlich, soweit kein besonderer Anlass besteht, nur einmal innerhalb eines 12 Monatszeitraums statt.
Vor Beginn einer solchen Prüfung teilt der Auftraggeber den initialen Prüfungsgegenstand und den geplanten Umfang mit, damit der Auftragnehmer entsprechend disponieren kann.
Über Ort, Datum und Ansprechpartner stimmen sich die Parteien ab.

== Rechtsfolgen bei Nichteinhaltung
Der Auftraggeber kann den Vertrag ganz oder teilweise innerhalb angemessener Frist kündigen, wenn der Auftragnehmer seinen Pflichten gemäß Ziffern 6.1 bis 6.4
- schuldhaft innerhalb einer gesetzten angemessenen Frist nicht nachkommt oder
- diese Pflichten vorsätzlich oder grob fahrlässig verletzt.

Ein Recht zur Kündigung besteht nicht, wenn es sich um eine unwesentliche Pflichtverletzung handelt.

Soweit vorgenannte Pflichtverletzungen einmalig zu erbringende Leistungen betreffen, tritt an die Stelle des Rechts zur Kündigung der Rücktritt von der jeweiligen Leistung.




= Datensicherungsservice / Backup / Herausgabe- und Löschungsanspruch

==
Der Auftragnehmer ist verpflichtet, in angemessener Frist auf Anforderung des Auftraggebers Daten sicher und entsprechend der zum Zeitpunkt der Löschung geltenden Standards zu löschen oder dem Auftraggeber eine entsprechende Löschmöglichkeit einzuräumen.
Bei personenbezogenen Daten gelten zudem die Regelungen der AVV.
Dies gilt nicht, soweit der Auftragnehmer zur Aufbewahrung von bestimmten Daten nach dem Recht der EU oder eines Mitgliedstaats verpflichtet ist.
Für den Fall einer solchen Aufbewahrungspflicht, ist der Auftragnehmer verpflichtet, den Auftraggeber unverzüglich darüber zu informieren, die Daten sicher vor dem Zugriff Dritter zu schützen und soweit im Rahmen der gesetzlichen Aufbewahrungspflicht zulässig, nach dem jeweils aktuellen Stand der Technik verschlüsselt aufzubewahren.

==
Soweit die Erstellung von Backups der Daten des Auftraggebers vereinbart ist, ist der Auftragnehmer verpflichtet, auf Anforderung des Auftraggebers in angemessener Frist eine Wiederherstellung von Dateien aus einem Backup auf den vom Auftraggeber gewünschten vorhandenen Stand vorzunehmen.

==
Die Leistung ist so auszugestalten, dass die Daten des Auftraggebers entweder zu jeder Zeit selbstständig durch den Auftraggeber oder, soweit dies aus technischen Gründen nicht möglich ist, mit Unterstützung durch den Auftragnehmer aus der Cloudinfrastruktur in einem marktüblichen Austauschformat exportiert werden können.
Damit muss auch der Export von vom Auftraggeber bestimmten Teilen der Daten möglich sein.
Soweit die Daten verschlüsselt sind, ist diese Pflicht nur dann erfüllt, wenn der Auftraggeber über den Schlüssel verfügt.
Für den Export der Daten und deren Sicherung bei dem Export ist der Auftraggeber verantwortlich.




= Verfügbarkeit

==
Der Auftragnehmer schuldet die vereinbarte Verfügbarkeit der Leistung am geschuldeten Übergabepunkt unter Verwendung des vereinbarten Zugriffs während der Betriebszeit\*.
Die Anbindung des Rechenzentrums des Auftragnehmers an den Übergabepunkt ist so ausreichend zu dimensionieren, dass die Nutzung der Leistung auch unter vertraglich vereinbarter Maximallast (z.B. einem vereinbarten Mengengerüst oder einer anderen vereinbarten Dimensionierung) nicht eingeschränkt ist.\
Der Prozentsatz der Verfügbarkeit wird nach folgender Formel berechnet:\
$ "Verfügbarkeit" = ("Gesamtzeit Minuten" - "Ausfallzeit Minuten") / ("Gesamtzeit Minuten") * 100 $
Die Gesamtzeit Minuten ergibt sich aus der vereinbarten Betriebszeit\* je Kalendermonat.
Ausfallzeit\* sind diejenigen Minuten, an denen der Auftraggeber innerhalb der Betriebszeiten\* keine Konnektivität zu der vom Auftragnehmer bereit zu stellende Cloudinfrastruktur herstellen kann oder die betroffene Leistung insgesamt nicht oder nicht in allen ihren wesentlichen Grundfunktionalitäten für mehr als einen unwesentlichen Teil der Nutzer zur Verfügung steht.

==
Zeiten der geplanten Nichtverfügbarkeit mindern die Verfügbarkeit nicht, es sei denn, sie fallen in eine vereinbarte Kernbetriebszeit\*.

==
Bezüglich der Verfügbarkeit gilt Folgendes:
- Der Auftragnehmer schuldet während der Betriebszeit\* eine Verfügbarkeit von mindestens der Verfügbarkeitsklasse\* VK1 im Bezugszeitraum.
- Der Bezugszeitraum ist der Kalendermonat.
- Alle Zeitangaben verstehen sich als Angaben nach mitteleuropäischer Zeit (MEZ) bzw. Sommerzeit (MESZ).
- Die Betriebszeit\* ist die Zeit von Montag bis Sonntag von 0:00 bis 24:00 Uhr.
- Die Zeit von 04:00 bis 08:00 Uhr ist an Sonntagen Zeit geplanter Nichtverfügbarkeit (z.B. für Wartungsarbeiten) und wird bei der Berechnung der Verfügbarkeit nicht berücksichtigt.
- Ausfallzeiten\*, die auf einem der folgenden Ereignisse beruhen, mindern die Verfügbarkeit nicht:
  - Probleme innerhalb des Netzwerks oder der Infrastruktur des Auftraggebers oder von vom Auftraggeber beauftragten Dritten,
  - Ausfall / Beeinträchtigung der Netzanbindung des Auftraggebers,
  - Ausfälle / Beeinträchtigungen, die auf dem Handeln oder Unterlassen des Auftraggebers oder eines nicht vom Auftragnehmer beauftragten Dritten beruhen,
  - nicht vertragsgemäße Nutzung der Leistung des Auftragnehmers durch den Auftraggeber,
  - Versäumnisse des Auftraggebers, vereinbarte Vorgaben zu erforderlichen Konfigurationen und Architekturen einzuhalten sowie fehlerhafte Eingaben beziehungsweise Anweisungen durch Nutzer des Auftraggebers,
  - Handlungen nicht autorisierter Nutzer, soweit die Handlungsmöglichkeit des nicht autorisierten Nutzers dem Auftraggeber zuzurechnen ist (bspw. durch die Nichtbeachtung angemessener Sicherheitsverfahren),
  - Aussetzen des Zugangs durch einen Sicherheitsvorfall\* zum Schutz auch des Auftraggebers, sofern die internen Richtlinien (operative Maßnahmen), die Grundlage der Erfüllung der C5 Anforderungen sind, vergleichbar mit den IT-Grundschutz Bausteinen DER.2.X "Security Incident Management" des BSI sind und aufgrund der Schwere des Sicherheitsvorfalls\* eine Aussetzung als Maßnahme erlauben,
  - Ereignisse, die auf höherer Gewalt beruhen und nicht durch angemessene Maßnahmen des Auftragnehmers kompensiert werden können.
- Der Auftragnehmer ist für die Messung der Verfügbarkeit verantwortlich.




= Reportingpflichten

==
Bezüglich der Pflichten des Auftragnehmers zum Reporting wird Folgendes vereinbart:
- Der Auftragnehmer ist für das laufende monatliche Reporting an den Auftraggeber verantwortlich; Reporting umfasst in Bezug auf die Verfügbarkeit sowie etwaige vereinbarte Reaktions- und Wiederherstellungszeiten mindestens folgende Informationen:
  - Aufzeichnung der Zeiten der Verfügbarkeit und der Nichtverfügbarkeit,
  - die sich daraus errechnende Verfügbarkeit / Nichtverfügbarkeit pro Bezugszeitraum und
  - im Bezugszeitraum aufgetretene, die Leistung betreffende und ggf. bereits behobene sicherheitsrelevante Störungen\*,
  - im Bezugszeitraum vom Auftraggeber gemeldete Störungen sowie deren Bearbeitungsstand (ggf. über ein eingesetztes Ticketsystem),
  - Aufzeichnung der Überschreitung (in Minuten) von vereinbarten Reaktions- oder Wiederherstellungszeiten pro Überschreitungsfall.
- Das Reporting umfasst im Falle einer nutzungsabhängigen Vergütung alle vergütungsrelevanten Parameter.
- Das Reporting umfasst zudem etwaig geschuldete Gutschriften, wobei diese alternativ in der Abrechnung ausgewiesen werden können.

==
Das Reporting ist unverzüglich nach Ende des jeweiligen Reportingzeitraums in elektronischer Form z.B. zum Download auf einer zugangsgeschützten Website (z.B. einer Administrationskonsole) verfügbar zu machen oder zur Verfügung zu stellen und dem Auftraggeber auf dessen Wunsch zu erläutern.

==
Das Auftraggeber hat an den Reports Rechte gemäß Ziffer 14.1, wobei die Nutzungsrechte zeitlich nicht beschränkt sind.

==
Für den Fall, dass der Auftragnehmer seinen Reportingpflichten auch nach Ablauf einer angemessenen, vom Auftraggeber gesetzten Frist nicht nachkommt, hat der Auftraggeber Anspruch auf eine angemessene Gutschrift.




= Störungsklassifizierung
Es wird zwischen folgenden drei Störungsklassen unterschieden:

==
Eine schwerwiegende Störung\* liegt vor, wenn für mehr als einen unwesentlichen Teil der vom Auftraggeber vertragsgemäß berechtigten Nutzer die Nutzung der betroffenen Leistung insgesamt oder in wesentlichen Funktionen unmöglich oder schwerwiegend eingeschränkt ist.

==
Eine erhebliche Störung\* liegt vor, wenn die Nutzung der betroffenen Leistung erheblich eingeschränkt ist.
Eine erhebliche Störung\* liegt auch vor, wenn die leichten Störungen\* insgesamt zu einer nicht unerheblichen Einschränkung der Nutzung der betroffenen Leistung führen.

==
Eine leichte Störung\* liegt vor, wenn die Nutzung der betroffenen Leistung ohne oder mit unwesentlichen Einschränkungen möglich ist.




= Störungsbeseitigung

==
Liegt bei SaaS\* oder PaaS\* eine Störung\* vor, hat der Auftragnehmer alle für die Störungsbeseitigung zur Wiederherstellung der Betriebsbereitschaft\* notwendigen Maßnahmen zu ergreifen.
Diese können z.B. Instandsetzungsleistungen oder Pflegeleistungen für die eingesetzte Software zur Beseitigung von Störungen\* umfassen.
Liegt die Störung in einer eingesetzten Drittsoftware, ist der Auftragnehmer verpflichtet, einen die Störung\* beseitigenden Programmstand\* einzusetzen, sofern ein solcher verfügbar ist.
Trifft dies nicht zu, hat der Auftragnehmer eine Umgehungslösung\* zur Verfügung zu stellen.
Ist ihm dies unzumutbar, hat er sich beim Hersteller der Drittsoftware für die baldmögliche Überlassung eines die Störung\* beseitigenden Programmstandes\* einzusetzen.
Auf Verlangen des Auftraggebers wird der Auftragnehmer hierüber Auskunft erteilen.
Sind keine Reaktionszeiten\* vereinbart, ist mit der Störungsbeseitigung unverzüglich nach Zugang der entsprechenden Meldung oder Eintritt des vereinbarten Ereignisses innerhalb der vereinbarten Servicezeiten\* zu beginnen.
Sind keine Wiederherstellungszeiten\* vereinbart, ist die Störungsbeseitigung\* in angemessener Frist abzuschließen.
Hält der Auftragnehmer vereinbarte Reaktions- und / oder Erledigungszeiten\* nicht ein, gerät er nach deren Überschreitung auch ohne Mahnung in Verzug, es sei denn, dass er die Fristüberschreitung nicht zu vertreten hat.

==
Liegt bei IaaS\* eine Störung vor, hat der Auftragnehmer alle für die Störungsbeseitigung zur Wiederherstellung der Betriebsbereitschaft\* notwendigen Maßnahmen zu ergreifen.
Sind keine Reaktionszeiten\* vereinbart, ist mit der Störungsbeseitigung unverzüglich nach Zugang der entsprechenden Meldung oder Eintritt des vereinbarten Ereignisses innerhalb der vereinbarten Servicezeiten\* zu beginnen.
Sind keine Erledigungszeiten\* vereinbart, ist die Störungsbeseitigung in angemessener Frist abzuschließen.
Hält der Auftragnehmer vereinbarte Reaktions- und / oder Erledigungszeiten\* nicht ein, gerät er nach deren Überschreitung auch ohne Mahnung in Verzug, es sei denn, dass er die Fristüberschreitung nicht zu vertreten hat.




= Änderung der Leistung nach Vertragsschluss durch den Auftragnehmer
Um die Funktionalität der Leistungen zu verbessern oder die Leistungen dem Stand der Technik anzupassen, kann der Auftragnehmer die Leistungen nach Vertragsbeginn ohne Zustimmung des Auftraggebers anpassen.
Eine solche Änderung darf aber nicht dazu führen, dass dem Auftraggeber die ursprünglich vereinbarten Funktionalitäten nicht mehr zur Verfügung stehen oder ursprünglich vereinbarte Anforderungen nur noch wesentlich eingeschränkt erfüllt werden.
Wesentlich und damit unzulässig sind Änderungen bzw. Einschränkungen in jedem Fall dann, wenn diese zu einer schlechteren Bewertung der Leistungen im Vergabeverfahren geführt hätten.




= Pflichten und Leistungen im Zusammenhang mit dem Vertragsende

== Bereitstellung von Informationen, Verfügbarmachung
Der Auftragnehmer ist gemäß Ziffer 7.3 ohne gesonderte Vergütung verpflichtet, die Daten des Auftraggebers verfügbar zu machen (beispielsweise durch die Möglichkeit des Herunterladens).
Es bleibt dem Auftraggeber unbenommen, die Zurverfügungstellung in einem anderen als dem vereinbarten Format zu verlangen, soweit dies dem Auftragnehmer nicht unzumutbar ist.
Soweit diese Form der Zurverfügungstellung nachweislich zu einem wesentlichen Mehraufwand führt, kann der Auftragnehmer die Zurverfügungstellung von der Vereinbarung einer gesonderten zu vereinbarenden Vergütung abhängig machen.

== Migrationsunterstützung
Der Auftraggeber ist für die Migration auf ein anderes System selbst verantwortlich.
Soweit vereinbart, ist der Auftragnehmer auf Verlangen im zumutbaren Umfang zur Erbringung von Leistungen verpflichtet, die erforderlich sind, um einen neuen Auftragnehmer oder den Auftraggeber in die Lage zu versetzen, die Leistung zu übernehmen.
In diesem Zusammenhang schuldet der Auftragnehmer insbesondere folgende Leistungen:

===
Im Rahmen einer vereinbarten Migration nach Ziffer 13.2 wird der Auftragnehmer sich auf Wunsch des Auftraggebers mit dem von diesem mitgeteilten Ansprechpartner des geplanten Nachfolgers für die Leistungserbringung ins Benehmen setzen, sofern dieser vorab nachweislich zur Vertraulichkeit gegenüber Dritten verpflichtet wurde.
Der Auftragnehmer wird mit dem Nachfolger die notwendigen, insbesondere die im Zusammenhang mit der Übertragung erforderlichen Leistungen abstimmen, z.B. ein Migrationskonzept.
Unabhängig davon ist der Auftragnehmer verpflichtet, mit dem geplanten Nachfolger angemessen zusammenzuarbeiten und nach Möglichkeit zu gewährleisten, dass während der Übertragung keine schwerwiegenden oder erheblichen Störungen der Erbringung der geschuldeten Leistung auftreten.
Der Nachfolger ist entsprechend zu verpflichten.
Die Vergütung für die Migrationsunterstützung erfolgt nach Aufwand zu den vereinbarten Vergütungssätzen.

===
Soweit sich die Migration verzögert, gleichgültig aus welchem Grund, wird der Auftragnehmer einmalig die Leistung auf Anforderung des Auftraggebers im bisherigen Umfang über das ursprüngliche Vertragsende hinaus weiter erbringen, bis die Übertragung erfolgreich vollzogen ist, unabhängig hiervon maximal jedoch für einen Zeitraum von sechs Monaten.
Die Leistungserbringung erfolgt zu den bisherigen Konditionen.
Für den Fall, dass dem Auftragnehmer darüber hinaus durch notwendige Leistungen Mehraufwände entstehen, kann der Auftragnehmer eine angemessene Anpassung der Vergütung verlangen.

== Pflichten nach Verfügbarmachung und Migration

===
Soweit sich nach der Verfügbarmachung gemäß Ziffer 13.1 an den dort genannten Gegenständen und / oder an den gespeicherten Daten Änderungen oder Ergänzungen ergeben haben, sind diese auf Anforderung des Auftraggebers erneut zur Verfügung zu stellen, soweit sie nicht rechtmäßig gelöscht wurden.

===
Der Auftragnehmer ermöglicht dem Auftraggeber zu einem vom Auftraggeber bestimmten Zeitpunkt die von ihm gespeicherten Daten sicher, d.h. nicht rekonstruierbar zu löschen bzw. zur Löschung zu markieren; in diesem Fall wird der Auftragnehmer die Daten sicher, d.h. nicht rekonstruierbar, löschen.
Die Löschung ist dem Auftraggeber auf Verlangen und durch entsprechende Erklärung oder anderweitig nachzuweisen.
Das Löschverfahren wird auf Anforderung nachgewiesen.
Gesetzliche Aufbewahrungspflichten des Auftragnehmers bleiben unter Berücksichtigung der Vorgaben in Ziffer 13.1 unberührt.

===
Der Auftraggeber bleibt zum Export der Daten gemäß Ziffer 7.3 bis zu deren Löschung berechtigt.
Der Auftragnehmer ist verpflichtet, die hierfür erforderliche Schnittstelle zur Verfügung zu stellen; dies gilt für einen Zeitraum von drei Monaten nach Vertragsende, soweit eine Löschung bis zu diesem Zeitpunkt noch nicht erfolgt ist.
Sind diese Leistungen nach Vertragsende mit mehr als unerheblichem Aufwand des Auftragnehmers verbunden, hat dieser Anspruch auf eine angemessene, keinesfalls aber eine höhere Vergütung.




= Nutzungsrechte

==
Der Auftragnehmer räumt dem Auftraggeber mit Bereitstellung das nicht ausschließliche, zeitlich auf die Vertragslaufzeit beschränkte, nach der vertraglichen Vereinbarung ordentlich und im Übrigen nur außerordentlich kündbare oder aussetzbare, nicht übertragbare Recht ein, die Leistung einschließlich etwaig zur Nutzung der Leistung körperlich zur Verfügung gestellter Zugangssoftware\* unter Berücksichtigung etwaiger im Vertrag vorgesehener quantitativer Metriken wie Useranzahl, Volumen etc. zu nutzen, das heißt auch, die zur Verfügung gestellte Software temporär zu speichern und zu laden, sie anzuzeigen und ablaufen zu lassen, soweit dies zur bestimmungsgemäßen Nutzung der Leistung erforderlich ist.
Dies gilt auch, soweit hierfür Vervielfältigungen notwendig werden.
Das Nutzungsrecht besteht weltweit bis auf diejenigen Länder, in denen der Auftragnehmer aufgrund staatliche Rechtsakte (beispielsweise Exportbeschränkungen) die jeweilige Leistung nicht allgemein anbietet und der Zugang zu den Leistungen bestimmungsgemäß nicht möglich ist.
Bestimmungsgemäß ist der Zugang nicht möglich, wenn bei einer zutreffenden Geolokalisierung der Zugang für alle Kunden in dem betreffenden Land aufgrund staatlicher Rechtsakte gesperrt ist.
Der Auftragnehmer wird dem Auftraggeber auf Anforderung unverzüglich die Länder nennen, in denen der Auftragnehmer die Leistungen aufgrund vorgenannter Regelung nicht verfügbar macht.
Die vorgenannten Rechte gelten unbeschadet weitergehender Rechte an individuell zu erbringenden Leistungen gemäß Ziffer 14.2.

==
Soweit individuelle Leistungen vereinbart sind, räumt der Auftragnehmer dem Auftraggeber an den betreffenden Leistungen (z.B. Konfigurationsleistungen) jeweils mit der Erbringung das nicht ausschließliche, örtlich unbeschränkte, in jeder beliebigen Hard- und Softwareumgebung ausübbare, übertragbare, dauerhafte, unwiderrufliche und unkündbare Recht ein, die individuellen Leistungen im Original oder in abgeänderter, übersetzter, bearbeiteter oder umgestalteter Form zu nutzen, abzuändern, zu übersetzen, zu bearbeiten oder auf anderem Wege umzugestalten auf einem beliebigen bekannten Medium oder in anderer Weise zu speichern, zu vervielfältigen, auszustellen, in körperlicher oder unkörperlicher Form zu verbreiten, mit Ausnahme eines etwaig überlassenen Quellcodes zu veröffentlichen, durch Dritte bestimmungsgemäß nutzen zu lassen, für den Auftraggeber betreiben zu lassen, nicht nur für eigene Zwecke zu nutzen, sondern auch zur Erbringung von gewerblichen und nicht gewerblichen Leistungen an Auftraggeber gemäß §§ 99 bis 101 GWB sowie nicht gewerbliche Leistungen an sonstige Dritte.

==
Sofern und soweit durch die Nutzung der Leistungen durch den Auftraggeber Daten, Datenbanken oder Datenbankwerke oder andere Ergebnisse (z.B. Software, Dokumente) entstehen, stehen dem Auftraggeber alle Rechte aus Ziffer 14.2 an den von ihm neu generierten Werken mit der Maßgabe zu, dass er diese Rechte ausschließlich hält und die dort vereinbarten Beschränkungen der Rechte des Auftraggebers, insbesondere zur Veröffentlichung sowie zur Nutzung auch für Leistungen an Dritte nicht gelten.
Soweit die vom Auftraggeber neu generierten Werke Leistungen des Auftragnehmers (z.B. Bibliotheken) als integralen Bestandteil umfassen oder die Wahrnehmung der Rechte an den Werken die Nutzung von Leistungen des Auftragnehmers erfordert, verbleibt es in Bezug auf die Nutzung solcher Leistungen des Auftragnehmers bei den jeweiligen Rechten gemäß Ziffer 14.1. bzw. Ziffer 14.2.
Der Auftraggeber räumt dem Auftragnehmer an den vom Auftraggeber neu generierten Werken, mit denen er die Leistung nutzt oder die er in die Leistung einbringt, maximal auf die Vertragslaufzeit befristete Rechte ein, diese Werke ausschließlich zur Vertragserfüllung und im dafür erforderlichen Umfang zu nutzen.

==
Soweit die Inanspruchnahme von Leistungen durch den Auftraggeber nach Vertragsende vereinbart ist, stehen ihm die hierfür erforderlichen Nutzungsrechte zu.

==
Der Auftraggeber räumt dem Auftragnehmer und den an der Leistungserbringung beteiligten Dritten die zur Erbringung der Leistungen erforderlichen Rechte an den vom Auftraggeber eingebrachten Daten und Software ein.




= Unterauftragnehmer

==
Der Auftragnehmer darf zur Leistungserbringung Unterauftragnehmer nur einsetzen oder eingesetzte Unterauftragnehmer nur auswechseln, wenn der Auftragnehmer den bzw. die Unterauftragnehmer und deren jeweiligen Leistungsbereich (Art und Umfang der Auslagerung an den Unterauftragnehmer) benennt.
Die Benennung kann entfallen, wenn es sich nur um Zulieferer oder solche Unternehmen handelt, deren Leistung keine vereinbarten C5-Kriterien betreffen und die nicht in die Erbringung der Leistungen eingebunden sind oder lediglich Nebenleistungen erbringen.

==
Soweit im Verhältnis zwischen Auftragnehmer und Unterauftragnehmer Vereinbarungen geändert werden sollen, die die vereinbarten C5-Kriterien betreffen, hat der Auftragnehmer diese dem Auftraggeber mitzuteilen.
Die Benennung bzw. die Mitteilung geplanter Vertragsänderungen kann auch durch eine für den Auftraggeber zugängliche Web-Site in Verbindung mit einer individuellen Benachrichtigung, z.B. per Push Nachricht, erfolgen.
Der Auftraggeber ist berechtigt, dem Einsatz von Unterauftragnehmern bzw. vorgenannten Änderungen aus sachlichem Grund innerhalb 30 Tagen ab der individuellen Benachrichtigung zu widersprechen.
Können sich die Parteien nicht binnen 90 Kalendertagen seit dem Zugang der individuellen Benachrichtigung auf die geplante Vertragsänderung bzw. den Austausch des Unterauftragnehmers einigen, hat der Auftraggeber das Recht, das Vertragsverhältnis ganz oder teilweise außerordentlich zu kündigen.

==
Soweit vereinbart, gilt alternativ zu Ziffer 15.1, dass der Auftragnehmer zur Leistungserbringung Unterauftragnehmer nur einsetzen oder eingesetzte Unterauftragnehmer nur auswechseln darf, wenn der Auftragnehmer den bzw. die Unterauftragnehmer namentlich benennt und der Auftraggeber dem Einsatz ausdrücklich zustimmt.
Voraussetzung für eine Zustimmung ist zunächst, dass sich der Unterauftragnehmer, soweit dies seine Leistungen betrifft, zuvor dem Auftragnehmer gegenüber mindestens in gleichem Umfang zur Einhaltung der vertraglichen Regelungen verpflichtet hat, wie der Auftragnehmer
gegenüber dem Auftraggeber und der Auftragnehmer dies dem Auftraggeber auf Verlangen nachweist.
Eine Zustimmung ist auch dann erforderlich, wenn der Auftragnehmer eine Leistung, die er bisher über einen Unteraufragnehmer erbringt, nunmehr selbst durchzuführen beabsichtigt.
Der Auftraggeber wird zustimmen, wenn sich unter Berücksichtigung des neuen Unterauftragnehmers oder des Auftragnehmers anstelle des alten Unterauftragnehmers keine andere Zuschlagsentscheidung ergeben hätte und auch sonst kein sachlicher Grund dem Einsatz des Unterauftragnehmers entgegensteht.
Die Einarbeitung des neuen Unterauftragnehmers erfolgt auf Kosten des Auftragnehmers.
Für die im Angebot des Auftragnehmers oder sonst im Vergabeverfahren benannten Unterauftragnehmer gilt die Zustimmung des Auftraggebers als erteilt.

==
Voraussetzung für den Einsatz eines Unterauftragnehmers ist, dass dieser sich, soweit dies seine Leistungen betrifft, zuvor dem Auftragnehmer gegenüber mindestens einem seinem jeweiligen Anteil an der Leistungserbringung entsprechenden Umfang zur Einhaltung der vertraglichen Regelungen verpflichtet hat, wie der Auftragnehmer gegenüber dem Auftraggeber.

==
Der Auftragnehmer darf vertrauliche Informationen nur an solche Unterauftragnehmer weitergeben, deren Einsatz der Auftraggeber nicht ausdrücklich widersprochen hat und nur wenn und soweit diese vertraulichen Informationen für die Erbringung der jeweiligen Leistungen durch den Unterauftragnehmer erforderlich sind ("Need-to-know"-Prinzip) und der Unterauftragnehmer mindestens im gleichen Maße zur Vertraulichkeit verpflichtet ist wie der Auftragnehmer.

==
Unterauftragnehmer in diesem Sinne sind auch solche, die wiederum von Unterauftragnehmern eingesetzt werden (Unterauftragnehmerkette).




= Vergütung

==
Die Vergütung der Leistungen kann in Form von monatlichen Pauschalen, nach Aufwand durch nutzungsabhängige Vergütungen („Pay-as-you-go“) oder aufwandsbezogene Vergütungen (beispielsweise nach Zeitaufwand) erfolgen.
Die Vergütung ist jeweils zum 15. des auf die Leistungserbringung folgenden Monats fällig.

==
Ist für eine Leistung durch auftragnehmerseitig eingesetztes Personal eine Vergütung nach Zeitaufwand vereinbart, gilt Folgendes:

===
Bei einer Vergütung nach Zeitaufwand für Leistungen gemäß Ziffer 16.2 sind mit dem Entgelt für den Zeitaufwand alle weiteren Kosten, insbesondere Nebenkosten, Reisekosten und Materialkosten abgegolten.
Reisezeiten werden nicht vergütet.
Die Vergütung ist jeweils zum 15. des auf die Leistungserbringung folgenden Monats fällig.

===
Ist bei Vergütung nach Zeitaufwand gemäß Ziffer 16.2 eine Obergrenze vereinbart, ist der Auftragnehmer auch bei Überschreitung dieser Grenze zur vollständigen Erbringung der vereinbarten Leistung verpflichtet.
Dies gilt nicht, wenn der Auftragnehmer die Überschreitung nicht zu vertreten hat.
Der Auftragnehmer ist jedoch in diesem Fall verpflichtet, die vereinbarte Leistung gegen zusätzliche Vergütung nach Aufwand zu den vereinbarten Sätzen vollständig zu erbringen, sofern der Auftraggeber dies verlangt.

===
Je Kalendertag wird bei einer Vergütung nach Aufwand gemäß Ziffer 16.2 nicht mehr als ein Tagessatz vergütet.
Ein vereinbarter Tagessatz kann nur dann in Rechnung gestellt werden, wenn mindestens acht Zeitstunden geleistet wurden.
Werden weniger als acht Zeitstunden pro Tag geleistet, sind diese anteilig in Rechnung zu stellen. Ist ein Stundensatz vereinbart, werden angefangene Stunden anteilig vergütet.
Pausen sind auszuweisen und werden nicht vergütet.
Werden mehr als sechs Zeitstunden geleistet, wird vermutet, dass der Auftragnehmer eine halbstündige Pause eingelegt hat.
Dies gilt nicht, wenn der Auftragnehmer nachweist, keine Pause gemacht zu haben.

==
Eine fällige Vergütung ist innerhalb von 30 Tagen nach Zugang einer prüffähigen Rechnung zu zahlen.
Rechnungen sind in elektronischer Form gemäß E-Rechnungsverordnung auszustellen und zu übermitteln.
Im Falle wiederkehrender Vergütungen ist eine einmalige prüfbare Dauerrechnung ausreichend, solange sich die Vergütung nicht geändert hat.

==
Geschuldete Gutschriften sind in der Rechnung von der Vergütung in Abzug zu bringen.
Anderenfalls kann der Auftraggeber diese selbst mit geschuldeter Vergütung verrechnen oder die Auszahlung der geschuldeten Gutschriften verlangen, soweit eine Verrechnung nicht möglich ist.

==
Ist eine Preisanpassung für Leistungen vereinbart, gilt, falls keine anderweitige Regelung vorgesehen ist, Folgendes: Eine Erhöhung der Vergütung kann erstmalig 12 Monate nach Beginn der Leistungserbringung, weitere Erhöhungen frühestens jeweils 12 Monate nach Wirksamwerden der vorherigen Erhöhung angekündigt werden.
Eine Erhöhung wird drei Monate nach der Ankündigung wirksam.
Die Erhöhung hat angemessen und marktüblich zu sein und darf maximal 3% der zum Zeitpunkt der Ankündigung der Erhöhung geltenden Vergütung betragen.

==
Alle Preise verstehen sich netto und, soweit Umsatzsteuerpflicht besteht, zuzüglich der geltenden gesetzlichen Umsatzsteuer.




= Mitwirkung des Auftraggebers

==
Dem Auftraggeber obliegen die im Vertrag aufgeführten Mitwirkungsleistungen.
Er wird dem Auftragnehmer die erforderlichen Informationen und Unterlagen aus seiner Sphäre zur Verfügung stellen.

==
Der Auftraggeber unterhält angemessene Sicherheitsstandards für die Nutzung der Leistungen durch seine Nutzer.
Dem Auftraggeber obliegt es, die "Korrespondierenden Kriterien für Kunden" aus dem jeweils für die vertragliche Leistung gemäß Ziffer 1.2 vereinbarten Stand des Anforderungskatalogs C5 des BSI zu beachten.

==
Der Auftraggeber ist dafür verantwortlich, dass die Systeme und Daten, die er dem Auftragnehmer im Zuge der Leistungserbringung zugänglich macht, auch durch den Auftragnehmer dafür betrieben bzw. verarbeitet werden dürfen.\
Im Rahmen der Auftragsverarbeitung prüft der Auftraggeber eigenverantwortlich, ob die von ihm im Zusammenhang mit der Nutzung der Leistung an den Auftragnehmer übermittelten Daten personenbezogene Daten darstellen und die Verarbeitung dieser personenbezogenen Daten im Wege der Auftragsverarbeitung zulässig ist.

==
Der Auftraggeber ist für Art und Inhalt der dem Auftragnehmer zur Verfügung gestellten Daten und Software verantwortlich.

==
Nutzt der Auftraggeber die Leistungen -- z.B. IaaS\* --, um den Nutzern Software und andere Serviceangebote zur Verfügung zu stellen, ist er auch für deren Nutzung verantwortlich.
Der Auftraggeber unterrichtet die jeweiligen Nutzer im erforderlichen Umfang über die für sie relevanten Leistungen, deren Grenzen und über relevante Mitwirkungsleistungen.

==
Der Auftraggeber hat Störungen\* bzw. Mängel unter Angabe der ihm bekannten und für deren Erkennung zweckdienlichen Informationen zu melden.
Eine Meldung in der Administrationskonsole oder der Eintrag in ein Ticketsystem ist ausreichend.
Soweit die Meldung formlos erfolgt ist, hat der Auftragnehmer die Störungsmeldung unverzüglich in das hierfür vorgesehene System (Administrationskonsole oder Ticketsystem) einzustellen.

==
Bei vereinbartem Remoteservice\* wird der Auftraggeber entsprechend den vertraglichen Vereinbarungen die notwendigen technischen Einrichtungen beim Auftraggeber bereitstellen, soweit dies für den Zugriff auf das System nötig ist.

==
Dem Auftraggeber obliegt es zudem, die Funktionalitäten in einer bereitgestellten Administrationskonsole des Auftragnehmers zu nutzen, insbesondere die Empfangsberechtigten für Mitteilungen des Auftragnehmers zu benennen.

==
Der Auftraggeber ergreift wirtschaftlich angemessene Maßnahmen, um einen nicht autorisierten Zugriff bzw. eine nicht autorisierte Nutzung über die ihm zur Verfügung gestellten Zugänge zu verhindern oder zu beenden.\
Unbenommen ist die Pflicht des Auftragnehmers, angemessene Maßnahmen zu treffen, die Leistung und die Zugänge dazu vor nicht autorisiertem Zugriff zu schützen.
Der Auftraggeber haftet nicht für unautorisierten Zugriff, wenn dieser durch eine solche Maßnahme des Auftragnehmers hätte verhindert werden können.

==
Auf einen entsprechenden Hinweis des Auftragnehmers hin, dass nicht vom Vergabeverfahren bzw. vom Vertrag gedeckte zusätzliche Beauftragungen von Leistungen über den Zugang zu den Leistungen möglich sind, z.B. mit Hilfe einer Administrationskonsole, trifft der Auftraggeber insoweit angemessene organisatorische Maßnahmen zur Überwachung der Art und des Umfangs der Nutzung der Leistungen.
Sofern der Auftragnehmer dem Auftraggeber entsprechende Administrationsmöglichkeiten, insbesondere eine Rechte- und Rollenstruktur zur Verfügung stellt, obliegt dem Auftraggeber in dem dadurch ermöglichten Umfang die Verhinderung von über die Administrationskonsole möglichen Beauftragungen zusätzlicher Leistungen des Auftragnehmers.




= Rechte des Auftraggebers bei Mängeln der Leistungen
Der Auftragnehmer hat dem Auftraggeber die vereinbarte Leistung während der Vertragslaufzeit vertragsgemäß zur Verfügung zu stellen.
Für die Zeit, in der die Nutzbarkeit der Leistung wegen eines Mangels oder einer Schlechtleistung gemindert ist, hat der Auftraggeber nur eine angemessen herabgesetzte Vergütung für die Leistung zu entrichten, soweit für diese Schlechtleistung nicht eine andere Kompensation (wie Nichterfüllungsgutschriften) vereinbart ist.\
Die sonstigen gesetzlichen Ansprüche des Auftraggebers wegen Mängeln oder Schlechtleistung bleiben unberührt.




= Haftungsbeschränkung
Sofern keine andere vertragliche Haftungsvereinbarung vorliegt, gelten für alle gesetzlichen und vertraglichen Schadens-, Freistellungs- und Aufwendungsersatzansprüche des Auftraggebers folgende Regelungen:

==
Bei leicht fahrlässigen Pflichtverletzungen wird die Haftung für den Vertrag insgesamt grundsätzlich auf den Auftragswert\* beschränkt.
Die Haftung in diesem Fall beträgt jedoch mindestens das Doppelte und maximal das Vierfache der Vergütung, die für das erste Vertragsjahr zu zahlen ist.
Beträgt der Auftragswert\* weniger als 50.000,- Euro wird die Haftung auf 50.000,- Euro beschränkt.
Im Falle von Sachschäden ist die Haftung auf eine Million Euro beschränkt, wenn der Auftragswert\* geringer als eine Million Euro ist.

==
Soweit nicht anders vereinbart, sind Ansprüche aus entgangenem Gewinn ausgeschlossen.

==
Die Haftungsbeschränkungen gelten nicht für Ansprüche wegen Vorsatz und grober Fahrlässigkeit, bei der Verletzung des Lebens, des Körpers oder der Gesundheit, bei Arglist, soweit das Produkthaftungsgesetz zur Anwendung kommt sowie bei Garantieversprechen.




= Laufzeit und Kündigung

==
Ist kein Ende der jeweiligen Vertragslaufzeit vereinbart, kann dieser mit einer Frist von sechs Monaten zum Ablauf eines Kalendermonats ganz oder teilweise gekündigt werden, frühestens jedoch zum Ende einer vereinbarten Mindestvertragsdauer.
Im Vertrag kann eine andere Kündigungsfrist vereinbart werden.

==
Zudem kann der Vertrag von jedem Vertragsteil bei Vorliegen eines wichtigen Grundes -- ohne Einhaltung einer Kündigungsfrist -- innerhalb einer angemessenen Zeit ab Kenntnis des Kündigungsgrundes ganz oder teilweise gekündigt werden.
Ein wichtiger Grund liegt vor, wenn Tatsachen gegeben sind, aufgrund derer dem Kündigenden unter Berücksichtigung aller Umstände des Einzelfalles und unter Abwägung der Interessen der Vertragspartner die Fortsetzung des Vertrages nicht mehr zugemutet werden kann.
Besteht der wichtige Grund in der Verletzung einer vertraglichen Pflicht, ist die Kündigung erst nach erfolglosem Ablauf einer zur Abhilfe gesetzten Frist oder nach erfolgloser Abmahnung zulässig, soweit nicht gemäß § 314 i.V.m. § 323 Absatz 2 BGB eine Fristsetzung entbehrlich ist.
Im Falle der Kündigung aus wichtigem Grund hat der Auftragnehmer Anspruch auf Vergütung für die bis zum Wirksamwerden der Kündigung aufgrund des Vertrages erbrachten Leistungen.
Die Vergütung entfällt aber für solche Leistungen, für die der Auftraggeber darlegt, dass sie für ihn aufgrund der Kündigung ohne Interesse sind.




= Haftpflichtversicherung

==
Soweit vereinbart, weist der Auftragnehmer bei Abschluss des Vertrages dem Auftraggeber nach, dass er über eine im Rahmen und Umfang marktübliche Industriehaftpflichtversicherung oder eine vergleichbare Versicherung aus einem Mitgliedsstaat der EU verfügt.

==
Der Auftragnehmer wird diesen Versicherungsschutz bis zum Ende des Vertrages und darüber hinaus bis zur Verjährung sämtlicher Mängelansprüche aufrechterhalten.
Kommt der Auftragnehmer dieser Verpflichtung nicht nach, ist der Auftraggeber nach erfolgloser angemessener Fristsetzung zur Kündigung des Vertrages berechtigt, wenn ihm ein Festhalten am Vertrag nicht mehr zuzumuten ist.
Weitergehende Ansprüche des Auftraggebers, insbesondere Schadensersatzansprüche, bleiben hiervon unberührt.




= Zurückbehaltungs- und Leistungsverweigerungsrechte
Zurückbehaltungs- und Leistungsverweigerungsrechte des Auftragnehmers sind unbeschadet von Ziffer 3 ausgeschlossen, es sei denn, der Auftraggeber bestreitet die zugrunde liegenden Gegenansprüche nicht oder diese sind rechtskräftig festgestellt.
Dies gilt auch für ein etwaiges Vermieterpfandrecht in Bezug auf gehostete Daten und Anwendungen des Auftraggebers.




= Textform
Soweit nichts anderes geregelt ist, bedürfen vertragliche Mitteilungen und Erklärungen mindestens der Textform.
Auch Eintragungen in der Administrationskonsole\* entsprechen der Textform.
Für Störungsmeldungen und Mängelrügen ist der Eintrag in ein Ticketsystem ausreichend.




= Anwendbares Recht, Gerichtsstand

==
Es gilt das Recht der Bundesrepublik Deutschland unter Ausschluss der Normen, die in eine andere Rechtsordnung verweisen, und unter Ausschluss des Übereinkommens der Vereinten Nationen über Verträge über den internationalen Warenkauf (CISG).

==
Liegen die Voraussetzungen für eine Gerichtsstandsvereinbarung nach §§ 38, 40 ZPO vor, richtet sich der Gerichtsstand für alle Streitigkeiten über die Gültigkeit des Vertrages und aus dem Vertragsverhältnis ausschließlich nach dem Sitz der für die Prozessvertretung des Auftraggebers zuständigen Stelle.
Der Auftraggeber ist auf Verlangen verpflichtet, die ihn im Prozess vertretende Stelle mitzuteilen.




#pagebreak()




#heading(outlined: false, bookmarked: false, numbering: none)[Begriffsbestimmungen]
#table(
  columns: (30%, auto),
  inset: 0.5em,
  align: top,
  table.header(
    repeat: false,
    [Begriff], [Definition],
  ),
  [*Auftragnehmerseitige AGB*],
  [Allgemeine Geschäftsbedingungen des Auftragnehmers, seiner Unterauftragnehmer und Lieferanten.],

  [*Auftragswert*], [Der Auftragswert ist die Summe aller zu zahlenden Vergütungen.],

  [*Ausfallzeit*], [Zeiten der ungeplanten Nichtverfügbarkeit der Leistung innerhalb der Betriebszeit.],

  [*Betriebsbereitschaft*], [Die Leistung funktioniert störungsfrei.],

  [*Betriebszeit*], [Zeiten, in denen der Auftraggeber Anspruch auf Bereitstellung der Leistung hat.],

  [*Concurrent User*], [Gleichzeitige Nutzer einer Leistung, z.B. einer SaaS\* oder PaaS\*.],

  [*Datensicherung*],
  [Datensicherung umfasst alle technischen und organisatorischen Maßnahmen zur Sicherstellung der Verfügbarkeit, Integrität und Konsistenz der auf der Cloudinfrastruktur gespeicherten und für Verarbeitungszwecke genutzten Daten und Software\*.],

  [*Infrastructure as a Service (IaaS)*],
  [Bei IaaS\* werden IT-Ressourcen wie z. B. Rechenleistung, Datenspeicher oder Netze als Dienst angeboten.
    Ein Auftraggeber nutzt diese virtualisierten und in hohem Maß standardisierten Services und baut darauf eigene Services zum internen oder externen Gebrauch auf.
    So kann ein Auftraggeber z.B. Rechenleistung, Arbeitsspeicher und Datenspeicher nutzen und darauf ein Betriebssystem mit Anwendungen seiner Wahl laufen lassen.],

  [*Kernbetriebszeit*],
  [Vereinbarte Zeiten innerhalb der Betriebszeit, in denen der Auftraggeber Anspruch auf Bereitstellung der Leistung mit gesteigertem Leistungsumfang hat, z.B. mit einer höheren Verfügbarkeit oder einer besonders kurzen Wiederherstellungszeit.
    Zeiten der geplanten Nichtverfügbarkeit liegen außerhalb der Kernbetriebszeit.],

  [*Managed Cloud Services (MCS)*],
  [Managed Cloud Services sind Leistungen, die über die typischen Leistungspflichten des Auftragnehmers hinausgehen, z.B. die Benutzerverwaltung, ggf. die Verwaltung verschiedener Cloud-Angebote bzw. Optionen, Kapazitätsmanagement, Beratung bei Upgrade- und Lizenzfragen etc. -- jeweils ausgerichtet am individuellen Bedarf des Auftraggebers.],

  [*Monitoring*],
  [
    Beispiele für Monitoring sind:
    - Verfügbarkeits-Monitoring. Überwachung der Verfügbarkeit aller Geräte / Dienste, für die eine Verfügbarkeit und / oder Performance definiert ist.
    - Störungs\*-Monitoring. Überwachung der festgestellten Vorfälle und anderen Statusereignisse auf Servern und Netzwerkgeräten, einschließlich Verfügbarkeit, Prozessstatus, Dateisystemkapazität und Erfolg / Misserfolg von Backups.
    - Performance-Monitoring. Überwachung wichtiger Leistungsmetriken im Hinblick auf die Systemressourcen, (z. B. CPU, Arbeitsspeicher und Datenspeicher) und die betriebenen Anwendungen (z. B. Prozessstatistiken, Benutzer, Durchsatz) und Datenbanken (z. B. Caching, Leistung, Transaktionserfolg).
    - Sicherheits-Monitoring. Aktive Überwachung der Infrastruktur und der Services auf Schwachstellen, die etwa aus einer Fehlkonfiguration oder der ausstehenden Einspielung von sicherheitsrelevanten Updates resultieren.
  ],

  [*Named User*], [Von Auftraggeber namentlich benannte Nutzer.],

  [*Patch*],
  [Temporäre Behebung eines Mangels und / oder einer Störung\* in der Software ohne Eingriff in den Quellcode\*.],

  [*Platform as a Service (PaaS)*],
  [Ein PaaS-Provider stellt eine komplette Infrastruktur bereit und bietet dem Auftraggeber auf der Plattform standardisierte Schnittstellen an, die von Diensten des Auftraggebers genutzt werden.
    So kann die Plattform z. B. Mandantenfähigkeit, Skalierbarkeit, Zugriffskontrolle, Datenbankzugriffe, etc. als Service zur Verfügung stellen.
    Der Auftraggeber hat in der Regel keinen Zugriff auf die darunterliegenden Schichten (Betriebssystem, Hardware), er kann aber auf der Plattform eigene Anwendungen laufen lassen, für deren Entwicklung der Auftragnehmer in der Regel eigene Werkzeuge anbietet.],

  [*Programmstand*], [Oberbegriff für Patch\*, Update\*, Upgrade\* und neue(s) Release / Version\*.],

  [*Reaktionszeit*],
  [Zeitraum, innerhalb dessen der Auftragnehmer mit den Störungs- bzw. Mängelbehebungsarbeiten zu beginnen hat.
    Der Zeitraum beginnt mit dem Auftreten der Störung, läuft jedoch nur in den vereinbarten Servicezeiten\*.
    Tritt die Störung außerhalb dieser Zeiten ein, beginnt die Reaktionszeit mit der nächsten Servicezeit\*.],

  [*Release / Version*],
  [Neue Entwicklungsstufe einer Software, die sich gegenüber dem vorherigen Release\* bzw. der Version\* im Funktions- und / oder Datenspektrum erheblich unterscheidet (z.B. Änderung der Versionsnummer von 4.5.7 zu 5.0.0).],

  [*Servicezeit*], [Zeiten, innerhalb derer der Auftraggeber Anspruch auf Störungs- bzw. Mangelbehebungsarbeiten hat.],

  [*Sicherheitsvorfall*],
  [
    Angriff auf die Cloudinfrastruktur und die Leistungen des Auftragnehmers, der die Vertraulichkeit, Verfügbarkeit oder Integrität derselben
    - derart gefährdet, dass ein erheblicher Schaden eintreten kann
    oder
    - tatsächlich beeinträchtigt.
  ],

  [*Software as a Service (SaaS)*],
  [Bezeichnet die Bereitstellung von Software bzw. Funktionen von Software in einer vom Auftragnehmer betriebenen Infrastruktur.],

  [*Störung*],
  [Beeinträchtigung der Eignung der Leistung zur vertraglich vereinbarten, bzw. soweit eine solche Vereinbarung fehlt, zur vorausgesetzten oder sonst zur gewöhnlichen Verwendung.
    Dies gilt unabhängig von einem Vertretenmüssen und unabhängig davon, ob diese Abweichung bereits bei Leistungsbeginn vorlag.],

  [*Umgehungslösung*], [Temporäre Überbrückung eines Mangels und / oder einer Störung\*.],

  [*Update*],
  [Bündelung mehrerer Mängelbehebungen und / oder Störungsbeseitigungen sowie geringfügige funktionale Verbesserungen und / oder Anpassungen der Software\* in einer einzigen Lieferung (z.B. Änderung der Versionsnummer von 4.1.3 zu 4.1.4).],

  [*Upgrade*],
  [Bündelung mehrerer Mängelbehebungen und / oder Störungsbeseitigungen und mehr als geringfügige funktionale Verbesserungen und / oder Anpassungen der Software\* in einer einzigen Lieferung (z.B. Änderung der Versionsnummer von 4.1.3. zu 4.2.0).],

  [*Verfügbarkeitsklassen*],
  [Klassifizierung der Verfügbarkeit gemäß HV Kompendium des BSI Band G, Kapitel 2 in der zum Zeitpunkt des Vertragsschlusses aktuellen Version.

    #table(
      columns: (15%, 25%, 15%, 15%, 15%, 15%),
      inset: 0.5em,
      align: (
        center + horizon,
        left + horizon,
        center + horizon,
        center + horizon,
        center + horizon,
        center + horizon,
      ),
      table.header(
        repeat: true,
        [*Verfügbarkeitsklasse*],
        [*Bezeichnung*],
        [*Minimale Verfügbarkeit*],
        [*Nichtverfügbarkeit*],
        [*Ausfallzeit\* pro Monat*],
        [*Ausfallzeit\* pro Jahr*],
      ),
      [VK 0], [Standard IT-System ohne Anforderungen an die Verfügbarkeit], [\~95%], [\~5%], [1 Tag], [Mehrere Tage],
      [VK 1],
      [Standard-Sicherheit nach IT-Grundschutz bei normalem Verfügbarkeitsbedarf],
      [99,0%],
      [1%],
      [< 8 h],
      [< 88 h],

      [VK 2],
      [Standard-Sicherheit nach IT-Grundschutz bei erhöhtem Verfügbarkeitsbedarf],
      [99,9%],
      [0,1%],
      [< 44 min],
      [< 9 h],

      [VK 3],
      [Hochverfügbar nach IT-Grundschutz für spezifische IT-Ressourcen; BSI-Standard 100-3],
      [99,99%],
      [0,01%],
      [< 5 min],
      [< 53 min],

      [VK 4], [Höchstverfügbar], [99,999%], [0,001%], [< 26 s], [< 6 min],
      [VK 5], [Desaster-Tolerant], [max. Verfügbarkeit], [0], [0], [0],
    )
  ],

  [*Wiederherstellungszeit*],
  [Zeitraum, innerhalb dessen der Auftragnehmer die Störungs- bzw. Mängelbehebungsarbeiten erfolgreich abzuschließen hat.
    Der Zeitraum beginnt mit dem Auftreten der Störung\*, läuft jedoch nur in den vereinbarten Servicezeiten.
    Tritt die Störung\* außerhalb dieser Zeiten ein, beginnt die Wiederherstellungszeit mit der nächsten Servicezeit.],

  [*Zugangssoftware*],
  [Für den Zugang zu der vom Auftragnehmer betriebenen Cloudinfrastruktur erforderliche Software zur Nutzung der Leistungen, z.B. einer vereinbarten Anwendung oder Plattform.],
)
