library(shiny)

# Define UI for application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Developing Data Products - Peer Assessments "),

  # Sidebar 
  sidebarPanel(
	numericInput("inputvalue1", "result = sample * 3", 10,
			 min = 1, max = 100),
  
    selectInput("variable", "Car Variable:",
                list("Number of cylinders" = "cyl", 
                     "Transmission (0 = automatic, 1 = manual)" = "am", 
                     "Number of forward gears" = "gear")),

    checkboxInput("outliers", "Show Regression Line", FALSE),
	helpText("Online Doc : \n
    Select Numeric Value, it will be multipled by 3 times \n	
	Select 'Number of cylinders' or 'Transmission' or 'Number of forward gears' to show on the screen, \n
	click or unclick to show regression line or not \n
	")
	
  ),

  # Show the caption and plot
  mainPanel(

    h1("Result : "),
    h1(textOutput("calvalue1")),
  
    h4("Motor Trend Car Road Tests"),

    h3(textOutput("caption")),
    plotOutput("mpgPlot")
  )
))
