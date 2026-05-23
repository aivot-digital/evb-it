// ==========================================
// 1. STATE & MACROS
// ==========================================

// Global state to store the output mode ("template" or "final")
#let modeState = state("outputMode", "template")

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
// 2. MAIN TEMPLATE FUNCTION
// ==========================================

#let contractTemplate(
  outputMode: "template", // "template" for draft with checkboxes, "final" for clean version
  layoutStyle: "standard", // "juridical" (§ 1) or "standard" (1.) for headings
  language: "de", // Document language for hyphenation and formatting (e.g., "de", "en")
  region: "de", // Document region
  pageCounterName: "Page", // Word for "Page" in the footer numbering
  pageCounterNameSeparator: "of", // Word for "of" in the footer numbering (e.g., Page 1 *of* 2)
  logoPath: "/utils/logo.svg", // Path to the company logo displayed on cover and header
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
  align(center + horizon)[
    #image(logoPath, width: 8cm)
    
    #text(size: 24pt, weight: "bold")[#contractTitle]
    
    #text(size: 12pt)[#contractVersion #contractDate]
  ]

  pagebreak()

  // ==========================================
  // TABLE OF CONTENTS
  // ==========================================
  outline(indent: auto, depth: tocDepth)

  // ==========================================
  // CONTENT PAGE LAYOUT
  // ==========================================
  set page(
    margin: (top: 3cm, bottom: 3.5cm),
    header: align(right)[
      #image(logoPath, height: 0.75cm)
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