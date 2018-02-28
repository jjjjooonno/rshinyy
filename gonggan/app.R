library(shiny)
library(Kormaps2014)
library(leaflet)
library(readxl)
mymap3 <- korpopmap3
mypalette <- colorNumeric(palette="Reds",domain=mymap$총인구_명)

areacode
ui <- fluidPage(
   titlePanel(""),
   sidebarLayout(
      sidebarPanel(
      ),
      mainPanel(
        leafletOutput("myp")
      )
   )
)
Sys.getlocale()
dt<- areacode
write.csv(dt,'dt.csv')
server <- function(input, output) {
   
  output$mymap <- renderLeaflet({
    myleaflet(submap(korpopmap2,('서울특별시')),choices=c("남자_명","여자_명","주택_계_호"))
  })
}

shinyApp(ui = ui, server = server)3