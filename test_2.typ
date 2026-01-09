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
  Maurer rose is a concept in geometry introduced by Peter. M. Maurer. Maurer rose are points connected on a rose curve.
  = Mathematics of Maurer roses
  == Circles
  To generate a circle, we can either use polar plane where we describe points as
  
  $ (r, theta) $
  
  where $0 <=theta <= 2pi$, or we can use cartesian coordinates, where points are described as
  
  $ x = r * sin(theta) \ y = r * cos(theta) $

  == Rose curve
  To generate rose curve, we have to modify our coordinates $ (sin(n theta), theta) $ or, alternatively

  $ x = sin(n theta) * sin(theta) \ y = sin(n theta) * cos(theta) $\

  This will generate a rose looking shape where $n$ dictates number of "petals". If $n$ is odd, the rose will have $n$ petals and if $n$ is even, rose will have $2n$ petals. We can see $n = 3$ rose (@fig:odd) and $n = 2$ rose (@fig:even).

  #grid(columns: 2, 
  grid.cell([ #figure(image("rose_curve2.svg",  width: 80%), caption: "Rose curve with " + $n = 3$) <fig:odd>]),
  grid.cell([ #figure(image("rose_curve1.svg",  width: 80%), caption: "Rose curve with " + $n = 2$) <fig:even>])
  )
  
  == Maurer rose
  Peter M. Maurer described Maurer rose as a rose in a rose. For this case, we need to modify our coordinates a little more with addition of another parameter $d$. Resulting coordinates are

  $ (sin(n theta), d theta) $

  or

  $ x = sin(n theta) * sin(d theta) \ y = sin(n theta) * cos(d theta) $\

  This will create shapes such as
   #grid(columns: 2, rows: 2, align: center,
    figure(
      image("rose1.svg", width: 100%)
    ),
    figure(
      image("rose2.svg", width: 100%)
    ),
    figure(
      image("rose3.svg", width: 100%, )
    ),
    figure(
      image("rose4.svg", width: 100%, )
    )
  )

  = Generation
  I have generated these roses with this algorihm
  ```python
for i in range(0,360,1):
      theta = i * (d*np.pi/180)
      r = np.sin(n*theta)

      xs.append(r * np.sin(theta))
      ys.append(r * np.cos(theta))
  ```
  and then simply plotted `xs` and `xy`

  ```python
fig, ax = plt.subplots(figsize=(5,5))
ax.plot(xs,ys, "b")
fig.savefig("rose.svg", transparent=True)
  ```