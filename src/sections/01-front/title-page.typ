#import "/src/constants/drop-down-list-constants.typ": REPORT-TYPES
#import "/src/components/title-page/thesis-proposal-title-page-component.typ": thesis-proposal-title-page-component
#import "/src/components/title-page/thesis-title-page-component.typ": thesis-title-page-component
#import "/src/components/title-page/term-project-title-page-component.typ": term-project-title-page-component

// Kapak sayfası. [Title page.]
#let title-page(
  language: none,
  department: none,
  program: none,
  report-type: none,
  date: none,
  thesis-title: none,
  author: none,
  advisor: none,
  second-advisor: none,
  thesis-study-funding-organization: none,
) = {
  // Rapor türüne göre ilgili kapak sayfasını seç. [Select the title page according to the report type.]
  if (
    report-type == REPORT-TYPES.MASTER-THESIS-PROPOSAL or report-type == REPORT-TYPES.DOCTORAL-THESIS-PROPOSAL
  ) {
    thesis-proposal-title-page-component(
      language: language,
      department: department,
      program: program,
      report-type: report-type,
      date: date,
      thesis-title: thesis-title,
      author: author,
      advisor: advisor,
      second-advisor: second-advisor,
      thesis-study-funding-organization: thesis-study-funding-organization,
    )
  } else if (report-type == REPORT-TYPES.MASTER-THESIS or report-type == REPORT-TYPES.DOCTORAL-THESIS) {
    thesis-title-page-component(
      language: language,
      department: department,
      program: program,
      report-type: report-type,
      date: date,
      thesis-title: thesis-title,
      author: author,
      advisor: advisor,
      second-advisor: second-advisor,
      thesis-study-funding-organization: thesis-study-funding-organization,
    )
  } else if report-type == REPORT-TYPES.TERM-PROJECT {
    term-project-title-page-component(
      language: language,
      department: department,
      program: program,
      report-type: report-type,
      date: date,
      thesis-title: thesis-title,
      author: author,
      advisor: advisor,
      second-advisor: second-advisor,
      thesis-study-funding-organization: thesis-study-funding-organization,
    )
  }

  // Mevcut sayfa zaten boşsa sayfa sonu pasif olsun (weak: true). [Disable page break if the current page is already empty (weak: true).]
  pagebreak(weak: true)
}
