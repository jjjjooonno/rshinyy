#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(rCharts)


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),

   bootstrapPage(
     chartOutput("chart", "highcharts"),
     textOutput("text")
      )
   )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$text <- renderText({
    sprintf("The capital of %s is %s.", input$click$country, input$click$capital)
  })
  
  output$chart <- renderChart({
    a <- Highcharts$new()
    a$series(data = list(
      list(x = 0, y = 40, capital = "Stockholm", country = "Sweden"),
      list(x = 1, y = 50, capital = "Copenhagen", country = "Denmark"),
      list(x = 2, y = 60, capital = "Oslo", country = "Norway")
    ), type = "bar"
    )
    a$xAxis(categories = c("Sweden", "Denmark", "Norway"))
    a$plotOptions(
      bar = list(
        cursor = "pointer", 
        point = list(
          events = list(
            click = "#! function() {
            Shiny.onInputChange('click', {
            capital: this.capital,
            country: this.country
            })
  } !#"))
        )
      )
    a$addParams(dom = "chart")
    return(a)
    })
}

shinyApp(ui = ui, server = server)
