library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Stoping Distance from Speed"),
        helpText("This application predicts the stopping distance of a car given its speed.
                 The prediction is built on the cars dataset from the R Datasets Package.
                 Note that the data were recorded in the 1920s."),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderSpeed", "What is the speed of the car?", 4, 25, value = 10)
                ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Stopping Distance:"),
                        textOutput("pred1")
                )
        )
))