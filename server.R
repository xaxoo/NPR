library(shiny)



server <- function(input, output)
{
	
	options(digits=5)
	wartosc <- renderText(input$plec)
	
	waga <-renderText({input$waga})
	
	renderText({input$wzrost})
	
	wiek <- renderText({input$wiek})
	
	x <- (9.99 * as.double(waga)) + (6.25 * as.single(wzrost)) - (4.92 * as.single(wiek)) + as.single(wartosc)
	
	
  

											
											
											

}
