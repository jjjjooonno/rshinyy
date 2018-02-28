library(ggplot2)

x<- c(1:100)
y<- x*3+2
data<- data.frame(cbind(x,y))

library(shiny)
ui <- fluidPage(
   titlePanel("Old Faithful Geyser Data"),
   sidebarLayout(
      sidebarPanel(
        sliderInput('range','Data Range',1,100,50)
      ),
      mainPanel(
        plotOutput('scatter')
      )
   )
)
server <- function(input, output) {
  output$scatter<- renderPlot({
    ggplot(data[1:input$range,],aes(x,y)) + geom_point()
  })
}
shinyApp(ui = ui, server = server)

