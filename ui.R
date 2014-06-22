library(shiny)

# Define UI for application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Developing Data Products - Peer Assessments "),

  # Sidebar 
  sidebarPanel(
    selectInput("variable", "Car Variable:",
                list("Number of cylinders" = "cyl", 
                     "Transmission (0 = automatic, 1 = manual)" = "am", 
                     "Number of forward gears" = "gear")),

    checkboxInput("outliers", "Show Regression Line", FALSE),
	helpText("Online Doc : Select Number of cylinders or Transmission or Number of forward gears to show on the screen, click or unclick to show regression line or not")
	
  ),

  # Show the caption and plot
  mainPanel(
   
    h2("Motor Trend Car Road Tests"),
  
    h4("mpg - Miles/(US) gallon"),
    h4("cyl - Number of cylinders"),
    h4("am - Transmission (0 = automatic, 1 = manual)"),
    h4("gear - Number of forward gears"),   
   
    h3(textOutput("caption")),
    plotOutput("mpgPlot")
  )
))
