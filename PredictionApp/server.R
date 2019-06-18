library(shiny)
library(caret)

shinyServer(function(input, output) {
   model1 <- lm(mpg ~ hp + wt, data = mtcars)
   model2 <- lm(mpg ~ hp + cyl + wt, data = mtcars)
   
   model1pred <- reactive({
     hpInput <- input$sliderHP
     wtInput <- input$sliderWT
     cylInput <- input$sliderCYL
     predict(model1, newdata = data.frame(hp = hpInput, wt = wtInput))
   })
    model2pred <- reactive({
     hpInput <- input$sliderHP
     wtInput <- input$sliderWT
     cylInput <- input$sliderCYL
     predict(model2, newdata = data.frame(hp = hpInput, wt = wtInput, cyl = cylInput))
   })
    output$pred1 <- renderText({
      if(input$ShowModel1){model1pred()}
      else("Model 1 not selected")
  })
    output$pred2 <- renderText({
      if(input$ShowModel2){model2pred()}
      else("Model 2 not selected")
  })
})
