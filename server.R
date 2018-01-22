library(shiny)
library(rgdal)
library(rwunderground)
library(sp)

server <- function(input, output)
{
output$mojanazwa <- renderText(input$nazwa)
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
})}
