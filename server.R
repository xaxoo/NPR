library(shiny)
library(rgdal)
library(rwunderground)
library(sp)
library(shinyjs)

server <- function(input, output)
{


#output$miasto <- forecast3day(set_location(territory="Poland", city = input$miasto))
output$data1 <- renderText(input$data1)
output$color <- renderText(input$color)
output$info <- renderText({
    paste0("x=", input$mapa_click$x, "\ny=", input$mapa_click$y)
  })
output$mapa<-renderPlot({
poland.map <- readOGR(dsn="C:/Users/Damian/Desktop/NPR/NPR/wojewodztwa","wojewodztwa") 
class(poland.map)
poland.map@data <- poland.map@data[ , c(6,16)]                                                      
names(poland.map@data) <- c("nazwa", "powierzchnia")
poland.map@data$nazwa <- c("opolskie", "świętokrzyskie", "kujawsko-pomorskie",
                            "mazowieckie", "pomorskie", "śląskie",
                           "warmińsko-mazurskie", "zachodniopomorskie",
                             "dolnośląskie", "wielkopolskie", "łódzkie",
                           "podlaskie", "małopolskie", "lubuskie",
                             "podkarpackie", "lubelskie")
plot(poland.map)
plot(poland.map[poland.map$nazwa == input$data1, ], col = input$color, add = TRUE)
})}
