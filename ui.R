shinyUI(pageWithSidebar(
  headerPanel('Multinomial Logistic Regression Probabilities'),
  sidebarPanel(
    sliderInput('b0_j1', 'Select intercept parameter for j=1', value = 1, min = -10, max = 10, step = 0.25),
    sliderInput('b0_j2', 'Select intercept parameter for j=2', value = -1, min = -10, max = 10, step = 0.25),
    sliderInput('gamma1', 'Select slope parameter', value = -2, min = -10, max = 10, step = 0.25),
    sliderInput('w2', 'Select w2 (price for j=2)', value = 1, min = -10, max = 10, step = 0.25),
    sliderInput('w3', 'Select w3 (price for j=3)', value = 1, min = -10, max = 10, step = 0.25)),
  mainPanel(
    plotOutput('plot1', width = "600px", height = "600px"),
    plotOutput('plot2', width = "600px", height = "600px")
  )
))
