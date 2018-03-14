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
  shinyjs::hide("trening")
  shinyjs::hide("inten")
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
  typ_zwracany <- reactive({typ <- switch(input$typ,
        ekto = 800,
        mezomorf = 450,
        endo = 300)})
  czy_cwiczy <- reactive({typ <- switch(input$czycwiczy,
        Tak = 1,
        Nie = 0)})

  observe({
    cwiczy <- czy_cwiczy()
    if(cwiczy == 1){
      shinyjs::show("trening",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::show("inten",anim = TRUE, animType ="slide",time =0.5)
    }
      else{
      shinyjs::hide("trening",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::hide("inten",anim = TRUE, animType ="slide",time =0.5)
    }
    typ <- typ_zwracany()
    observeEvent(input$oblicz,{output$m <-renderText({wyliczBmr(isolate(value$waga),isolate(value$wzrost),isolate(value$wiek),isolate(value$plec)) + typ})})
    output$l <- renderTable({
    sliderValues()
  })
    })
  
  
  
}

	
	
  

											
											
											


