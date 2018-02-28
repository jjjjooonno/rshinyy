library(shiny)
ui <- fluidPage(
  sliderInput("n", "Number of observations", 2, 1000, 500),
  plotOutput("plot1"),
  plotOutput("plot2"),
  plotOutput("plot3")
)

server <- function(input, output, session) {
  # A plot of fixed size
  output$plot1 <- renderImage({
    # A temp file to save the output. It will be deleted after renderImage
    # sends it, because deleteFile=TRUE.
    outfile <- tempfile(fileext='/Users/joono/GoogleDrive/SKKU/BOAZ/10+11기/BOAZ_Study/Rshiny/joono/KakaoTalk_Photo_2017-12-14-18-34-21.jpeg')
    
    # Generate a png
    png(outfile, width=400, height=400)
    hist(rnorm(input$n))
    dev.off()
    
    # Return a list
    list(src = outfile,
         alt = "This is alternate text")
  }, deleteFile = TRUE)
shiny(ui,server)

