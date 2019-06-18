library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict MPG from Horsepower, weight and number of cylinders in a car"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderHP", "What is the horsepower of the car", min = 60, max = 335, value = 120),
      sliderInput("sliderWT", "What is the weight of the car", min = 1.6, max = 3.9, value = 2.2),
      sliderInput("sliderCYL", "What is the number of cylinders in a car", min = 4, max = 8, value = 6, step = 2),
      checkboxInput("ShowModel1", "Show/Hide Model 1", value = TRUE),
      checkboxInput("ShowModel2", "Show/Hide Model 2", value = TRUE),
      submitButton(text = "Submit")
      ),
    
    mainPanel(
      h3("Predicted MPG from Model 1:"),
      textOutput("pred1"),
      h3("Predicted MPG from Model 2:"),
      textOutput("pred2")
    )
  )
))

