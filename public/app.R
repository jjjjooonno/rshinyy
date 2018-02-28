#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(readxl)
# 전 mac이라 폰트가 깨져서 아래 코드를 사용했는데 윈도우는 아마 그냥 하셔도 될겁니다!
# library(extrafont)
# font_import(pattern = 'AppleGothic')

# 아래에 경로도 본인이 이 코드파일과 엑셀파일 넣은 경로로 수정해주세요!


gong<- read_excel('gb_gong.xlsx')
sil<- read_excel('gb_sil.xlsx')


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("공시지가 / 실거래가"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      actionButton('go','그래프 보기'),
      selectInput('year','연도 선택',c(2013,2014,2015,2016)),
      sliderInput('range','가격범위 선택',0,2000000,value = c(0,2000000)),
      radioButtons('data','가격구분',
                   c('공시지가' = 'gong',
                     '실거래가' = 'sil'))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("bar1")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  dtt<- eventReactive(input$go,{
    if (input$data == 'gong'){
      dt<- gong
    }else{
      dt<- sil
      colnames(dt)<- c('year','newaddress','price')
    }
    dt1<- dt[dt$year == input$year,]
    dt2<- dt1[dt1$price <= input$range[2],]
    dt3<- dt2[dt2$price >= input$range[1],]
    dt3$price<- as.numeric(dt3$price)
    return(dt3)
  })
  output$bar1<- renderPlotly({
    ggplot(dtt(),aes(x = newaddress, y = price))+ # family = 'AppleGothic')+
      geom_bar(stat = 'identity')+
      coord_flip()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

