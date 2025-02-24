#import "/src/sections/00-other-pages/title-page.typ": *
#import "/src/modules/custom-functions.typ": *
#import "/src/modules/turkish-case-handler.typ": title-case-tr, upper-case-tr
#import "/src/constants.typ": *
#import "/src/styles.typ": *
#import "/src/components/keywords-component.typ": keywords-component
#import "/src/sections/00-other-pages/abstract-page.typ": abstract-page
#import "/src/sections/00-other-pages/preface-page.typ": preface-page
#import "/src/sections/00-other-pages/table-of-contents-page.typ": table-of-contents-page
#import "/src/sections/00-other-pages/originality-report-page.typ": originality-report-page
#import "/src/sections/00-other-pages/scientific-ethics-declaration-page.typ": scientific-ethics-declaration-page
#import "/src/sections/00-other-pages/symbols-and-abbreviations-page.typ": symbols-and-abbreviations-page

#let template-configurations(
  department: "Department",
  program: "Program",
  thesis-type: "Yüksek Lisans/Doktora",
  is-thesis-proposal: false,
  date: datetime.today(),
  thesis-title: "Thesis Title",
  thesis-title-eng: "Thesis English Title",
  author: (
    first-name: "Author's firstname",
    last-name: "Author's lastname",
    orcid: "xxxx-xxxx-xxxx-xxxx",
  ),
  advisor: (
    title: "Advisor's title",
    first-name: "Advisor's firstname",
    last-name: "Advisor's lastname",
    orcid: "xxxx-xxxx-xxxx-xxxx",
  ),
  second-advisor: (
    title: "Second Advisor's title",
    first-name: "Second Advisor's firstname",
    last-name: "Second Advisor's lastname",
    orcid: "xxxx-xxxx-xxxx-xxxx",
  ),
  thesis-study-funding-organization: (
    name: "Name of the Funding Organization Supporting the Thesis Study",
    project-no: "Project No",
  ),
  thesis-originalty: (
    included-page-count: 0,
    similarity-score: 0,
  ),
  keywords-tur: "anahtar kelime 1, anahtar kelime 2, anahtar kelime 3, anahtar kelime 4, anahtar kelime 5",
  keywords-eng: "keyword 1, keyword 2, keyword 3, keyword 4, keyword 5",
  reviewers: (),
  have-symbols: true,
  have-abbreviations: true,
  body,
) = {
  /* Basic document rules. */
  set document(
    title: [#thesis-title (#thesis-title-eng)],
    author: author.first-name + " " + author.last-name,
    keywords: keywords-tur + keywords-eng,
  )

  set page(
    paper: PAPER,
    header: none,
    footer: none,
    margin: MARGIN,
    number-align: right,
    numbering: PAGE-NUMBERING-ROMAN,
    columns: 1,
  )

  set text(
    font: FONT-NAME,
    size: FONT-SIZE,
    lang: LANGUAGE,
    region: REGION,
    ligatures: false,
    hyphenate: false,
    style: "normal",
    weight: DEFAULT-TEXT-FONT-WEIGHT,
  )

  set heading(
    numbering: none,
    outlined: true,
    bookmarked: true,
  )

  show heading: set text(size: FONT-SIZE)

  set par(
    justify: true,
    first-line-indent: (amount: PARAGRAPH-FIRST-LINE-INDENT, all: true),
    leading: PARAGRAPH-LEADING-SIZE,
    spacing: PARAGRAPH-SPACING-SIZE,
  )

  set math.equation(
    numbering: MATH-NUMBERING,
    supplement: MATH-EQUATION-REFERENCE-SUPPLEMENT,
  )

  /* ---- Table Style ---- */
  show: set-table-style

  /* ---- Figure Styles ---- */
  show: set-figure-styles

  /* ----------------------------- */

  /*
    show raw.where(block: true): r => {
      set par(justify: false, first-line-indent: 0cm, leading: PARAGRAPH-LEADING-SIZE, spacing: PARAGRAPH-SPACING-SIZE)
      show raw.line: line => {
        box(
          table(
            columns: (-1.25em, 100%),
            stroke: 0pt,
            inset: 0em,
            column-gutter: 1em,
            align: (x, y) => if x == 0 { right } else { left },
            text(fill: ovgu-darkgray, str(line.number)), line.body,
          ),
        )
      }

      set align(left)
      rect(width: 100%, stroke: gray + 0.5pt, inset: 0.75em, r)
    }
  */

  /* ----------------------------- */

  set footnote.entry(separator: line(length: 40%, stroke: 0.5pt))
  set list(marker: (sym.bullet, "◦", "-"))

  /* --- BAŞLIK SAYFASI [TITLE PAGE] --- */

  title-page(
    department: department,
    program: program,
    thesis-title: thesis-title,
    author: author,
    advisor: advisor,
    second-advisor: second-advisor,
    thesis-study-funding-organization: thesis-study-funding-organization,
    thesis-type: thesis-type,
    is-thesis-proposal: is-thesis-proposal,
    reviewers: reviewers,
    date: date,
  )

  // Set centered arabic page numbering.
  show: set-page-numbering.with(numbering: PAGE-NUMBERING-ROMAN, number-align: center)

  show raw: set text(12pt * 0.95)
  set-page-properties()

  {
    /* ---- TEZİN ÖN KISMI [FRONT MATTER OF THESIS] ---- */
    //
    show: set-heading-styles-for-front-matter-of-thesis
    set par(
      justify: true,
      first-line-indent: (amount: PARAGRAPH-FIRST-LINE-INDENT, all: true),
      leading: PARAGRAPH-LEADING-SIZE,
      spacing: PARAGRAPH-SPACING-SIZE,
    )

    /* --- Ön Söz [Preface] --- */
    preface-page(
      author: author,
      date: date,
    )

    /* --- İçindekiler Sayfası [Table of Contents Page] --- */
    table-of-contents-page()

    /* --- Tez Çalışması Örijinallik Raporu [Originality Report] --- */
    originality-report-page(
      thesis-title: thesis-title,
      author: author,
      advisor: advisor,
      date: date,
      included-page-count: thesis-originalty.included-page-count,
      similarity-score: thesis-originalty.similarity-score,
    )

    /* --- Bilimsel Etik Beyannamesi [Scientific Ethics Declaration] --- */
    scientific-ethics-declaration-page(
      author: author,
      date: date,
    )

    /* --- Simgeler ve Kısaltmalar [Symbols and Abbreviations] --- */
    if have-symbols or have-abbreviations {
      symbols-and-abbreviations-page(
        have-symbols: have-symbols,
        have-abbreviations: have-abbreviations,
      )
    }

    /* --- Türkçe Özet Sayfası [Turkish Abstract Page] --- */
    abstract-page(
      page-title: upper-case-tr(STRING-ABSTRACT-TUR),
      university-name: title-case-tr(STRING-UNIVERSITY-NAME-TUR),
      institute-name: title-case-tr(STRING-INSTITUTE-NAME-TUR),
      department: department,
      program: program,
      thesis-type: thesis-type,
      is-thesis-proposal: is-thesis-proposal,
      thesis-title: thesis-title,
      author: author,
      abstract-text-content-file-path: "/template/sections/00-other-pages/abstract-text-tur.typ",
      keywords-title: title-case-tr(STRING-KEYWORDS-TUR),
      keywords: keywords-tur,
    )

    /* --- İngilizce Özet Sayfası [English Abstract Page] --- */
    abstract-page(
      page-title: upper(STRING-ABSTRACT-ENG),
      university-name: STRING-UNIVERSITY-NAME-ENG,
      institute-name: STRING-INSTITUTE-NAME-ENG,
      department: department,
      program: program,
      thesis-type: thesis-type,
      is-thesis-proposal: is-thesis-proposal,
      thesis-title: thesis-title-eng,
      author: author,
      abstract-text-content-file-path: "/template/sections/00-other-pages/abstract-text-eng.typ",
      keywords-title: STRING-KEYWORDS-ENG,
      keywords: keywords-eng,
    )
  }

  // Sonraki sayfa boş değilse (weak: true), yazının bitimi tek numaralı sayfada ise sayfa sonu ekle ama çift numaralı sayfada ise sayfa sonu ekleme (to: "odd"). Böylece, yazının bittiği sayfa çift sayfa olacak ve "EKLER" bölümü tek numaralı sayfadan başlayacağı garanti altına alındı. Kısaca yazının bittiği sayfadan sonraki sayfanın tek numaralı bir sayfa olmasını garanti altına almak için (to: "odd") parametresi kullanıldı.
  pagebreak(weak: true, to: "odd")

  // Set centered arabic page numbering.
  show: set-page-numbering.with(numbering: PAGE-NUMBERING-ARABIC, number-align: center)

  {
    /* --- TEZİN ANA BÖLÜMLERİ --- */
    //
    show: set-heading-styles-for-main-sections-of-thesis

    //
    set par(
      justify: true,
      first-line-indent: (amount: PARAGRAPH-FIRST-LINE-INDENT, all: true),
      leading: PARAGRAPH-LEADING-SIZE,
      spacing: PARAGRAPH-SPACING-SIZE,
    )

    /* ---- Bölüm 1 [Chapter 1] ---- */
    include "/template/sections/01-chapters/introduction.typ"
    pagebreak()

    /* ---- Bölüm 2 [Chapter 2] ---- */
    include "/template/sections/01-chapters/literature.typ"
    pagebreak()

    /* ---- Bölüm 3 [Chapter 3] ---- */
    include "/template/sections/01-chapters/methodology.typ"
    pagebreak()

    /* ---- Bölüm 4 [Chapter 4] ---- */
    include "/template/sections/01-chapters/results.typ"
    pagebreak()

    /* ---- Bölüm 5 [Chapter 5] ---- */
    include "/template/sections/01-chapters/conclusion.typ"

    // Sonraki sayfa boş değilse (weak: true), yazının bitimi tek numaralı sayfada ise sayfa sonu ekle ama çift numaralı sayfada ise sayfa sonu ekleme (to: "odd"). Böylece, yazının bittiği sayfa çift sayfa olacak ve "EKLER" bölümü tek numaralı sayfadan başlayacağı garanti altına alındı. Kısaca yazının bittiği sayfadan sonraki sayfanın tek numaralı bir sayfa olmasını garanti altına almak için (to: "odd") parametresi kullanıldı.
    pagebreak(weak: true, to: "odd")
  }

  {
    /* ---- TEZİN ARKA KISMI [BACK MATTER OF THESIS] ---- */
    // Başlık numarlandırmasını 1'den başlat.
    counter(heading).update(1)

    // Başlık stilleri
    show: set-styles-for-back-matter-of-thesis

    // Kaynakça [Bibliography]
    set-bibliography-styles(
      bibliography(
        "/template/bibliography-sources/references.bib",
        style: "/template/bibliography-styles/apa7-tr.csl",
        title: upper-case-tr(STRING-BIBLIOGRAPHY),
        full: false,
      ),
    )

    // Sonraki sayfa boş değilse (weak: true), yazının bitimi tek numaralı sayfada ise sayfa sonu ekle ama çift numaralı sayfada ise sayfa sonu ekleme (to: "odd"). Böylece, yazının bittiği sayfa çift sayfa olacak ve "EKLER" bölümü tek numaralı sayfadan başlayacağı garanti altına alındı. Kısaca yazının bittiği sayfadan sonraki sayfanın tek numaralı bir sayfa olmasını garanti altına almak için (to: "odd") parametresi kullanıldı.
    pagebreak(weak: true, to: "odd")

    // Ekler [Appendices]
    // Başlık numarlandırmasını 1'den başlat.
    counter(heading).update(1)

    include "/template/sections/02-appendices/appendices.typ"
  }

  // Gövdeyi pasif hale getir [Disable the body]
  //body
}
