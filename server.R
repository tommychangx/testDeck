library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    paste("Plot of ",  formulaText())
  })

  output$calvalue1 <- renderText({
    input$inputvalue1 * 3
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
  
    fit <- lm(as.formula(formulaText()), data=mtcars)
	if(input$variable == "cyl") {
        plot(mtcars$cyl, mtcars$mpg)
	}
	if(input$variable == "am") {
        plot(mtcars$am, mtcars$mpg)
	}	
	if(input$variable == "gear") {
        plot(mtcars$gear, mtcars$mpg)
	}	
	
	if (input$outliers == TRUE) {
       summary(fit)
       abline(fit)
	}

  })
})
