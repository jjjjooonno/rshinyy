#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
#레이아웃은 Shiny 공홈이나, flexdashboard 공홈에 가면 있습니다.
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         #유저인풋이 들어가는 곳 sliderinout / checkboxinput 등등
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
         #시각화패키지명Output('그려놓은 시각화 차트')를 배치하는 곳.
         #위치는 변경 가능 레이아웃에 따라 차트를 놓을 공간을 정해주면 됨.
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   #밑의 코드는 render시각화패키지명으로 그래프를 그리는 함수를 넣어주는 코드 output이라는 리스트 안에 그래프를 넣어서 위에 ui가 쓸수 있게함
   output$distPlot <- renderPlot({
      #데이터를 만들거나 고치는 부분
      #그래프를 그리는 공간
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

