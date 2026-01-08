#let conf(
  authors: (),
  abstract: [],
  doc,
) = {
  set page(columns: 2)
  set text(
    font: "Libertinus Serif",
    size: 11pt )
  
  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      title()

      let count = authors.len()
      let ncols = calc.min(count,2)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 24pt,
        ..authors.map(author => [
          #author.name \
          #author.date
        ]),
      )
    }
  )

  doc
}
#set document(title: [
  The Maurer Rose
])

#show: conf.with(
  authors: (
    (
      name: "Michal Würtherle",
      date: "8.1.2025"
    ),
  ))
  
  = Introduction
  