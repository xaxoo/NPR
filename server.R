library(shiny)
library(rgdal)
library(rwunderground)
library(sp)
library(shinyjs)

server <- function(input, output)
{

cor <- read.csv("Coord.csv")
coords <- data.frame(cor$xMin, cor$xMax, cor$yMin, cor$yMax)
data <- data.frame(cor$nazwa)

x <- c(1,16)

#output$miasto <- forecast3day(set_location(territory="Poland", city = input$miasto))
output$data1 <- renderText(input$data1)
output$color <- renderText(input$color)
output$info <- renderText({
    paste0("x=", input$mapa_click$x, "\ny=", input$mapa_click$y)
  })  
  
output$mapa<-renderPlot({
poland.map <- readOGR(dsn="wojewodztwa","wojewodztwa") 
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

for(i in x){
			if( !is.null(input$mapa_click$x) & !is.null(input$mapa_click$y))
			{
			if( input$mapa_click$x > coords[i,1])
					{
						if( input$mapa_click$x < coords[i,2] )
							{
								if( input$mapa_click$y > coords[i,3])
								{
									if( input$mapa_click$y < coords[i,4])
										{
											output$data2 <- renderText(data[i,1])
											
											}
											}
											}
											}
											}
			}

#plot(poland.map[poland.map$nazwa == input$data1, ], col = input$color, add = TRUE)
plot(poland.map[poland.map$nazwa == input$data2, ], col = "Blue", add = TRUE)

})}
