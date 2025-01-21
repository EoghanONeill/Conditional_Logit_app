pts <- seq(from = -5, to = 5, length = 700)

shinyServer(function(input, output, session) {

  output$plot1 <- renderPlot({
    
    ## Evaluate probabilities and plot
    b0_j1 <- input$b0_j1
    b0_j2 <- input$b0_j2
    gamma1 <- input$gamma1
    w2 <- input$w2
    w3 <- input$w3
    # b0_j3 <- 1
    # b1_j3 <- 1
    vals1 <- exp(b0_j1 + gamma1 * pts) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    vals2 <-  exp(b0_j2 + gamma1 * w2) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    vals3 <-  exp( gamma1 * w3) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    
    plot(pts, vals1, xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "w1", ylab = "Prob(Y = j|X = x)")
    lines(pts, vals2, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
         col = "red", type = "l"#,
         # xlab = "X", ylab = "Prob(Y = 2|X = x)"
         )
    lines(pts, vals3, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
         col = "blue", type = "l"#,
         # xlab = "X", ylab = "Prob(Y = 3|X = x)"
         )
    
    
  })
  
  output$plot2 <- renderPlot({
    
    ## Evaluate probabilities and plot
    b0_j1 <- input$b0_j1
    b0_j2 <- input$b0_j2
    gamma1 <- input$gamma1
    w2 <- input$w2
    w3 <- input$w3
    # b0_j3 <- 1
    # b1_j3 <- 1
    vals1 <- exp(b0_j1 + gamma1 * pts) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    vals2 <-  exp(b0_j2 + gamma1 * w2) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    vals3 <-  exp( gamma1 * w3) / (exp(b0_j1 + gamma1 * pts) + exp(b0_j2 + gamma1 * w2) + exp( gamma1 * w3))
    
    PEs1 <- gamma1*vals1*(1-vals1)
    PEs2 <- -gamma1*vals1*vals2
    PEs3 <- -gamma1*vals1*vals3
    
    plot(pts, PEs1, xlim = c(-5, 5), ylim = c(-gamma1/2, gamma1/2), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "w1", ylab = "Own and Cross Partial Effects of w1 (price of item 1)")
    lines(pts, PEs2, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
          col = "red", type = "l"#,
          # xlab = "X", ylab = "Prob(Y = 2|X = x)"
    )
    lines(pts, PEs3, #xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, 
          col = "blue", type = "l"#,
          # xlab = "X", ylab = "Prob(Y = 3|X = x)"
    )
    
    
  })
  
  
  
  
})
