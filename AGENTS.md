# EVB-IT

This repository is used to write evb-it contract with typst.

## Tech Stack

Typst in the latest release

## Architecture

/evb-it -> every distinct evb-it contract has its own subfolder within
/utils -> the template every main document is based on lies here

## Boundaries

Never modify files in /utils

## Code Style

Imports are always from root e.g. "/utils/template.typ".

```typst
// Import, Variable, Text, Signature and other relevant sections of the typst document are clearly marked by using a divider:
// ==========================================
// 1. TEMPLATE INITIALIZATION
// ==========================================
```

One sentence per line.
Use the equal sign for headlines.
Do not modify textformatting on a global basis.
Text clearly identifiable as placeholders e.g. [DATE] has to use the respective function provided by the template e.g. variable, option etc.
If values for variables cannot be determined, set them to "".
When using #fieldValue use the "value" key to set the value. Correct: #fieldValue(value: companyName), Incorrect: #fieldValue(companyName).
Set linelength only when the expected text to be filled in requires it e.g. #fieldValue(value: companyName, length: 4.5cm)

```typst
// 4 lines spacing above heading 1, 1 line of spacing for all other headlines
= Headline

Text




= Headline

Text

== Headline
```

```typst
//Signatures are always vertically spaced fromt he text before and use a grid
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
```

Text clearly identifiable as an annex has to use the respective function provided by the template e.g. appendix or attachSupplement.

```typst
// when using #attachSupplement describe in the appendix that the supplement is embedded and requires pdf readers that support attachments.
#appendices[
  #appendix(
    [Hipsum Annex],
    reference: <app-pdf>,
  )[
    Die vollständige Anlage ist als Original-PDF in dieses Dokument eingebettet.
    
    Zum Öffnen der eingebetteten Datei ist ein PDF-Reader erforderlich, der Dateianhänge unterstützt, beispielsweise Adobe Acrobat Reader.
    
    #attachSupplement(
      path("/appendices/Hipsum Annex.pdf"),
      mimeType: "application/pdf",
      description: "Hipsum Annex als PDF-Originaldatei",
    )
  ]
]
```

## Git

### Branching and Pull Requests

* `main` contains released production code; never commit directly to it.
* `milestone/X.Y.Z` starts from `main` and collects the next major/minor release.
* `patch/X.Y.Z` starts from `main` and collects the next patch release.
* Create `feature/<label>` from the current milestone and PR back to it.
* Create `fix/<label>` from the current patch and PR back to it.
* Keep feature branches current by merging their milestone branch into them.
* Squash merge only.

## Commit Messages

Format: `type(scope): Imperative subject` (`scope` is optional).

* Allowed types: `build`, `ci`, `docs`, `feat`, `fix`, `ref`, `test`, `meta`.
* Capitalize the subject, use imperative mood, and omit the final period.
* Add a body only to explain what and why; wrap it at 80 characters.
* Put issue closures and `BREAKING CHANGE:` details in the footer.
* Reverts use `revert: <reverted header>` and body `This reverts commit <SHA>.`
