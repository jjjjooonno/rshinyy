#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.


library(shiny)
library(rAmCharts)
library(devtools)

ui = fluidPage(amChartsOutput(outputId = "amchart"))

server = function(input, output) {
  output$amchart <- renderAmCharts({
    # minimal example
    iris <- get(x = "iris", pos = "package:datasets")
    
    amBoxplot(iris[, -5])
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

