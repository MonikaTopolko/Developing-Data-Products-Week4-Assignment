library(shiny)
shinyServer(function(input, output) {
        model1 <- lm(dist ~ speed, data = cars)
        model1pred <- reactive({
                speedInput <- input$sliderSpeed
                predict(model1, newdata = data.frame(speed = speedInput))
        })
        output$plot1 <- renderPlot({
        speedInput <- input$sliderSpeed
                
        plot(cars$speed, cars$dist, xlab = "Speed (in MPG)", 
        ylab = "Stopping Distance (in ft)", bty = "n", pch = 16,
        xlim = c(4, 25), ylim = c(2, 120))
        points(speedInput, model1pred(), col = "red", pch = 16, cex = 2)
        abline(model1, col = "red", lwd = 2)
        })
        output$pred1 <- renderText({
        model1pred()
        })
})