library(shiny)

wyliczBmr <-function(waga,wzrost,wiek,plec)
{
  if(plec == "M")
    bmr <- (9.99 * waga)  + (6.25 * wzrost) - (4.92 * wiek) + 5
  else
    bmr <- (9.99 * waga)  + (6.25 * wzrost) - (4.92 * wiek) - 161
  return(bmr)
}


server <- function(input, output)
{
  options(encoding = 'UTF-8')
	options(digits = 5)
  
  sliderValues <- reactive({
    value <<- reactiveValues()  
    data.frame(
      Name = c("Plec", 
               "Waga",
               "Wiek",
               "Wzrost",
               "Cwiczy ?"),
      Value = (c(value$plec <- input$plec, 
                             value$waga <- input$waga,
                             value$wiek <- input$wiek,
                             value$wzrost <- input$wzrost,
                             value$cwiczy <- input$czycwiczy)), 
      stringsAsFactors=FALSE)
    
  })
  
  output$l <- renderTable({
    sliderValues()
  })
  observeEvent(input$oblicz,{output$m <-renderText({wyliczBmr(isolate(value$waga),isolate(value$wzrost),isolate(value$wiek),isolate(value$plec))})})
  
  
}

	
	
  

											
											
											


