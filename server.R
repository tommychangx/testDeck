library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
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
