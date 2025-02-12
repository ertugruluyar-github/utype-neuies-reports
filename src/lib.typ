#import "modules/title-page.typ": *
#import "modules/custom-functions.typ": *
#import "constants.typ": *
#import "styles.typ": *

#let template-configurations(
  title: [Title], 
  author: (
    fullname: "Author's fullname", orcid: "xxxx-xxxx-xxxx-xxxx"
  ), 
  keywords-tur: "anahtar kelime 1, anahtar kelime 2, anahtar kelime 3, anahtar kelime 4, anahtar kelime 5",
  keywords-eng: "keyword 1, keyword 2, keyword 3, keyword 4, keyword 5",  
  thesis-type: "Yüksek Lisans/Doktora",
  is-thesis-proposal: false,
  reviewers: (

  ), 
  date: datetime.today(),
  header-logo: none,
  body
) = {
  /* Basic document rules. */
  set document(
    title: title, 
    author: author.fullname,
  )

  set page(
    paper: PAPER, 
    margin: MARGIN, 
    number-align: right, 
    numbering: PAGE_NUMBERING_ROMAN, 
    footer: none,
  )

  set text(
    font: FONT-NAME, 
    size: 12pt, 
    lang: LANGUAGE, 
    region: REGION, 
    ligatures: false,
  )

  set heading(
    numbering: none,
    outlined: true, 
    bookmarked: true,
  )

  set par(
    justify: true,
  )
  
  set math.equation(
    numbering: MATH-NUMBERING,
  )

  /* ---- General design choices. --- */

  // Enable heading specific figure numbering and increase spacing.
  show figure: set block(spacing: 1.5em)
  set figure(
    numbering: n => numbering(FIGURE-NUMBERING, counter(heading).get().first(), n), 
    gap: 1em
  )

  // Add final period after fig-numbering (1.1 -> 1.1.).
  // Additionally, left align caption if it spans multiple lines.
  show figure.caption: c => {
    grid(
      columns: 2,
      align(top)[#c.supplement #context c.counter.display(c.numbering).#c.separator],
      align(left, c.body),
    )
  }

  /* ---- Stylization of headings / chapters. ---- */

  // Create "Chapter X." heading for every numbered level 1 heading.
  show heading.where(level: 1): h1 => {
    if h1.numbering != none {
      pagebreak(weak: true)

      // Reset figure counters.
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
      counter(figure.where(kind: raw)).update(0)

      align(center)[
        #set text(_huge)
        // DÜZELTİLECEK!
        #let heading-prefix = if h1.supplement == [#STRING-APPANDIX] [
          #upper(STRING-APPANDIX) #counter(heading).display(h.numbering)
        ] else [
          #set heading(level: 1, numbering: HEADING-NUMBERING, outlined: false, bookmarked: false)
          #upper(STRING-CHAPTER) #counter(heading).get().first() // Sondaki noktayı kaldır.
        ]
        #heading-prefix \
        #v(0.2em)
      ]
    }
    h1
  }

  /* Adjust refs: "Chapter XYZ" instead of "Section XYZ". */
  set ref(supplement: it => {
    if it.func() == heading and it.supplement == auto {
      if it.level > 1 {
        STRING-SECTION
      } else {
        STRING-CHAPTER
      }
    } else {
      it.supplement
    }
  })
  
  /* ---- Table of Contents Style ---- */
  
  // Set Level 1 outlines' text bold.
  show outline.entry.where(level: 1): set text(weight: "bold")

  // Set headings and special appendices numbering
  show outline.entry.where(level: 1)
    .or(outline.entry.where(level: 2))
    .or(outline.entry.where(level: 3)): it => {
    let parent = query(heading.where(level: 1).before(it.element.location())).last()
  
    let cc = if it.element.numbering != none {
        numbering(it.element.numbering, ..counter(heading).at(it.element.location()))
      } else {
        h(-0.5em)
      }
  
    let indent = h(1.5em + ((it.level - 2) * 1.5em))
    
    box(
      grid(
        columns: (auto, 1fr, auto),
        indent + link(it.element.location())[#cc #h(0.1em) #it.element.body #h(5pt)],
        it.fill,
        box(width: 1.5em, align(right, it.page)),
      ),
    )
  }
  
  /* ----------------------------- */

  show raw.where(block: true): r => {
    set par(justify: false)
    show raw.line: l => {
      box(table(
        columns: (-1.25em, 100%),
        stroke: 0pt,
        inset: 0em,
        column-gutter: 1em,
        align: (x, y) => if x == 0 { right } else { left },
        text(fill: ovgu-darkgray, str(l.number)),
        l.body,
      ))
    }
    
    set align(left)
    rect(width: 100%, stroke: gray + 0.5pt, inset: 0.75em, r)
  }

  /* ----------------------------- */

  show heading: set block(spacing: 1.25em)
  show heading: set text(font: FONT-NAME, _Large)
  
  set footnote.entry(separator: line(length: 40%, stroke: 0.5pt))
  set list(marker: (sym.bullet, "◦", "-"))

  /* --- Başlık Sayfası [Title Page] --- */

  title-page(
    title,
    author,
    thesis-type,
    is-thesis-proposal,
    header-logo,
    reviewers,
    date
  )
  
  pagebreak()

  show: roman-numbering.with(reset: false)
  show raw: set text(12pt * 0.95)
  set-page-properties()

  { /* --- DİĞER BÖLÜMLER [OTHER SECTIONS] --- */
    
    // 
    show heading: set heading(numbering: none, bookmarked: true)
    show heading.where(level: 1): set heading(outlined: true)
    
    //
    show: set-heading1-style-for-other-sections

    // 
    show heading.where(level: 2)
      .or(heading.where(level: 3))
      .or(heading.where(level: 4))
      .or(heading.where(level: 5))
      .or(heading.where(level: 6)): set heading(outlined: false)
    
    //
    show: set-heading2-style-for-other-sections

    /* --- Ön Söz [Preface] --- */
    par(justify: true)[#include "../template/sections/03-other-sections/preface.typ"]
    
    pagebreak()
    
    /* --- İçindekiler [Table of Contents] --- */
    outline(depth: 3, indent: n => n * 1em, fill: repeat(justify: true, gap: 0.1em)[.], title: upper(STRING-CONTENTS))
    
    pagebreak()

    /* --- Tez Çalışması Örijinallik Raporu [Originality Report] --- */
    par(justify: true)[#include "../template/sections/03-other-sections/originality-report.typ"]
    
    pagebreak()

    /* --- Bilimsel Etik Beyannamesi [Scientific Ethics Declaration] --- */
    par(justify: true)[#include "../template/sections/03-other-sections/scientific-ethics-declaration.typ"]
    
    pagebreak()

    /* --- Simgeler ve Kısaltmalar [Symbols and Abbreviations] --- */
    par(justify: true)[#include "../template/sections/03-other-sections/symbols-and-abbreviations.typ"]
    
    pagebreak()

    /* --- Özet [Abstract] --- */

    par(justify: true)[#include "../template/sections/03-other-sections/abstract-tur.typ"]
    align(left)[*Anahtar Kelimeler:* #keywords-tur]
    
    pagebreak()

    par(justify: true)[#include "../template/sections/03-other-sections/abstract-eng.typ"]
    align(left)[*Keywords:* #keywords-eng]
    
    pagebreak(to: "odd")
  }
  
  // Set arabic numbering and alternate page number position.
  show: arabic-numbering

  { /* --- ANA BÖLÜMLER --- */    
    // Tezin ana bölümlerindeki 1 ve 2. düzey başlık "diğer bölümler" kısmından farklı olacak şekilde değiştirildi.
    set heading(numbering: HEADING-NUMBERING, outlined: true, bookmarked: true)
    show heading.where(level: 4): set heading(numbering: none, outlined: true, bookmarked: true)
    show: set-heading-styles-for-main-sections
    show: set-heading4-style-for-main-sections

    // Bölüm 1 [Chapter 1]
    include "../template/sections/01-chapters/introduction.typ"
    pagebreak()

    // Bölüm 2 [Chapter 2]
    include "../template/sections/01-chapters/literature.typ"
    pagebreak()

    // Bölüm 3 [Chapter 3]
    include "../template/sections/01-chapters/methodology.typ"
    pagebreak()

    // Bölüm 4 [Chapter 4]
    include "../template/sections/01-chapters/results.typ"
    pagebreak()

    // Bölüm 5 [Chapter 5]
    include "../template/sections/01-chapters/conclusion.typ"
    pagebreak()

    empty-page-with-arabic-page-numbering
 }

 { /* ---- Back matter of your thesis ---- */    
    // Başlık numarlandırmasını 1'den başlat.
    counter(heading).update(1)
    // Başlık stilleri
    show heading: set align(left)
    show heading.where(level: 1): set heading(numbering: none, outlined: true, bookmarked: true)
    show heading.where(level: 2): set heading(numbering: APPENDICES-NUMBERING, outlined: true, bookmarked: true)
    show heading.where(level: 2): it => {STRING-APPANDIX + APPANDIX-PREFIX-SEPERATOR + it}
    show heading.where(level: 3): set heading(outlined: false)
    show heading.where(level: 4): set heading(outlined: false, bookmarked: false)
    show heading.where(level: 5): set heading(outlined: false, bookmarked: false)
    show heading.where(level: 6): set heading(outlined: false, bookmarked: false)
    
    // Kaynakça [Bibliography]
    bibliography(
      "../template/bibliography-sources/references.bib",
      style: "../template/bibliography-styles/apa7-tr.csl",
      title: STRING-BIBLIOGRAPHY,
      full: false
    )

    empty-page-with-arabic-page-numbering
    
    // Ekler [Appendices]
    // Başlık numarlandırmasını 1'den başlat.
    counter(heading).update(1)
    include "../template/sections/02-appendices/02-appendices.typ"
  
    empty-page-with-no-page-numbering
  }

  // Gövdeyi pasif hale getir [Disable the body]
  //body
}
