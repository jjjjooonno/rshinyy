library(devtools)
install_github("datastorm-open/rAmCharts")
install.packages('highcharter')


library(readxl)
library(highcharter)
gong <- read_excel('gb_gong.xlsx')
hc<- hcbar(x = gong[gong$year == 2015,]$newaddress,y = gong[gong$year == 2015,]$price)
hc
hchart()
