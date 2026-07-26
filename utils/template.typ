// ==========================================
// 1. STATE & MACROS
// ==========================================

// Global state to store the output mode ("template" or "final")
#let modeState = state("outputMode", "template")

// Global state for the localized name used before appendix letters.
// The English default produces "Appendix A", "Appendix B", etc.
#let appendixNameState = state("appendixName", "Appendix")

// Renders a value or a blank line if the value is missing.
// - value: The string to display.
// - length: The width of the line if no value is provided.
#let fieldValue(value: "", length: 2cm) = {
  if value != "" and value != none {
    value 
  } else {
    box(
      width: length,
      stroke: (bottom: 0.5pt),
      outset: (bottom: 2pt)
    )[#sym.zws]
  }
}

// Renders a visual checkbox for the template mode.
#let checkbox(checked) = box(
  width: 1em, 
  height: 1em, 
  stroke: 0.5pt, 
  radius: 2pt,
  baseline: 20%,
  align(center + horizon)[#if checked [x]]
)

// Handles the juridical numbering logic (Paragraphs, Paragraph-segments, etc.)
#let juridicalNumbering(..nums) = {
  let n = nums.pos()
  let level = n.len()
  let value = n.last()
  if level == 1 { numbering("(1)", value) }
  else if level == 2 { numbering("1.", value) }
  else if level == 3 { numbering("a)", value) }
  else if level == 4 { 
    let char = numbering("a", value)
    [#char#char)]
  }
  else { numbering("i.", value) }
}

// Renders a conditional clause.
// - active: Boolean to determine if the clause is selected.
// - content: The text content of the clause.
#let option(active, content) = context {
  let outputMode = modeState.get()
  if outputMode == "template" {
    grid(
      columns: (auto, 1fr),
      align: top,
      gutter: 0.3em,
      move(dy: -0.2em, checkbox(active)),
      content
    )
  } else if outputMode == "final" and active {
    grid(
      columns: (auto, 1fr),
      align: top,
      gutter: 0.3em,
      move(dy: -0.05em, [•]),
      content
    )
  }
}

// ==========================================
// 2. APPENDIX HELPERS
// ==========================================

// Creates the numbering used in the appendix section.
// - level 1: "Appendix A", "Appendix B", ...
// - deeper levels: "A.1", "A.1.1", ...
#let appendixNumbering(prefix: [Appendix]) = (..numbers) => {
  let values = numbers.pos()
  let formatted = numbering("A.1", ..values)

  if values.len() == 1 {
    [#prefix #formatted]
  } else {
    formatted
  }
}

// Starts the appendix section and gives headings their own alphabetical
// numbering. Place this section after the regular document body.
//
// - prefix: Optional local override for the text before the appendix letter.
//   If omitted, `contractTemplate.appendixName` is used.
// - separatorTitle: Optional standalone title page, e.g. [Appendices].
// - body: The appendices, normally created with `appendix`.
#let appendices(
  prefix: none,
  separatorTitle: none,
  body
) = context {
  let resolvedPrefix = if prefix == none {
    appendixNameState.get()
  } else {
    prefix
  }
  // Ensure that the appendices start on a fresh page.
  pagebreak(weak: true)

  // An optional separator page is intentionally excluded from the TOC.
  if separatorTitle != none {
    align(center + horizon)[
      #text(size: 24pt, weight: "bold")[#separatorTitle]
    ]
    pagebreak(weak: true)
  }

  // Restart heading numbering for the appendix section.
  counter(heading).update(0)

  // The scope of this set rule is limited to the appendix body.
  set heading(
    numbering: appendixNumbering(prefix: resolvedPrefix),
    supplement: none,
  )

  body
}

// Creates one appendix. Each appendix starts on a new page and is represented
// by a real heading, so it automatically appears in the TOC and PDF bookmarks.
//
// Recommended usage:
// #appendix([Leistungsbeschreibung], reference: <app-services>)[
//   #include "appendices/leistungsbeschreibung.typ"
// ]
#let appendix(
  title,
  reference: none,
  newPage: true,
  outlined: true,
  body
) = {
  if newPage {
    pagebreak(weak: true)
  }

  let appendixHeading = heading(
    level: 1,
    outlined: outlined,
  )[#title]

  // Labels must be attached in markup mode and in the same scope as the
  // heading. Therefore, both values are emitted together here.
  if reference == none {
    appendixHeading
  } else {
    [#appendixHeading#reference]
  }

  body
}

// Optionally embeds an original source file in the exported PDF. This does not
// render the file as pages; PDF readers expose it in their attachment list.
// Requires a Typst version that provides `pdf.attach` (Typst 0.15 or newer).
#let attachSupplement(
  path,
  mimeType: none,
  description: none,
) = pdf.attach(
  path,
  relationship: "supplement",
  mime-type: mimeType,
  description: description,
)

// ==========================================
// 3. MAIN TEMPLATE FUNCTION
// ==========================================

#let contractTemplate(
  outputMode: "template", // "template" for draft with checkboxes, "final" for clean version
  layoutStyle: "standard", // "juridical" (§ 1) or "standard" (1.) for headings
  language: "de", // Document language for hyphenation and formatting (e.g., "de", "en")
  region: "de", // Document region
  pageCounterName: "Page", // Word for "Page" in the footer numbering
  pageCounterNameSeparator: "of", // Word for "of" in the footer numbering (e.g., Page 1 *of* 2)
  appendixName: "Appendix", // Word before appendix letters (e.g., Appendix A)
  logoPath: "/utils/logo.svg", // Path to the company logo displayed on cover and header
  logoAltText: "Company logo", // Alternative text for the logo in accessible PDF exports
  showCover: true, // Whether the cover page is rendered
  showToc: true, // Whether the table of contents is rendered
  tocDepth: 2, // Depth of the table of contents
  contractTitle: "Example Contract", // Title on cover page and PDF metadata
  contractVersion: "", // Contract version
  contractDate: "", // Date of the contract version
  hint: "", // Text shown in Footer
  author: "",
  body
) = {
  // Update state for macros
  modeState.update(outputMode)
  appendixNameState.update(appendixName)

  set document(
    title: contractTitle,
    author: author,
    date: auto
  )

  set page(paper: "a4")

  set text(
    font: ("Reddit Sans", "sans-serif"),
    fallback: true,
    size: 12pt, 
    lang: language,
    hyphenate: true,
    region: region
  )

  show link: underline

  // Remove the default separator line above footnotes to prevent double lines with footer
  set footnote.entry(separator: none)

  // ==========================================
  // COVER PAGE
  // ==========================================
  if showCover {
    align(center + horizon)[
      #image(logoPath, width: 8cm, alt: logoAltText)
      
      #text(size: 24pt, weight: "bold")[#contractTitle]
      
      #text(size: 12pt)[#contractVersion #contractDate]
    ]

    // Continue after the cover on a fresh page.
    pagebreak(weak: true)
  }

  // ==========================================
  // TABLE OF CONTENTS
  // ==========================================
  if showToc {
    outline(indent: auto, depth: tocDepth)

    // Keep the document body separate from the table of contents.
    pagebreak(weak: true)
  }

  // ==========================================
  // CONTENT PAGE LAYOUT
  // ==========================================
  set page(
    margin: (top: 3cm, bottom: 3.5cm),
    header: align(right)[
      #image(logoPath, height: 0.75cm, alt: logoAltText)
    ],
    footer: context [
      #set text(size: 8pt)
      #line(length: 100%, stroke: 0.5pt)
      #v(0.2cm)
      #grid(
        columns: (1fr, auto),
        gutter: 2em,
        align: (left, bottom),
        [#hint],
        [#pageCounterName #counter(page).display() #pageCounterNameSeparator #counter(page).final().at(0)]
      )
    ]
  )

  set heading(
    numbering: if layoutStyle == "juridical" { "§ 1 " } else { "1.1" },
    bookmarked: auto
  )

  set enum(
    full: if layoutStyle == "juridical" { true } else { false },
    numbering: if layoutStyle == "juridical" { juridicalNumbering } else { "1.a.i." }
  )

  counter(page).update(1)

  // Apply to content
  body
}