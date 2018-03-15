library(shiny)

wyliczBmr <-function(waga,wzrost,wiek,plec)
{
  if(plec == "M")
    bmr <- (9.99 * waga)  + (6.25 * wzrost) - (4.92 * wiek) + 5
  else
    bmr <- (9.99 * waga)  + (6.25 * wzrost) - (4.92 * wiek) - 161
  return(bmr)
}
TEA <- function(czas,dni,intens)
{
  tea <-  ( czas * dni * intens ) / 7
  return(tea)
}
TDEE <- function()
{
  tdee <- wyliczBmr(isolate(value$waga),isolate(value$wzrost),isolate(value$wiek),isolate(value$plec)) + TEA(czas,dni,wartosc) + typ_sylwetki
  tdee <- tdee + (0.1 * tdee)
  return(tdee)
}

CM <- function(waga)
{
	prot <- 2*waga
	fat <- (0.25*TDEE())/9
	hyd <- (TDEE() - prot*4 - fat*9)/4
	sum <- c(prot,fat,hyd)
	return(sum)
	
}
CMREDUCTION <- function(waga)
{
	prot <- 2.2*waga
	fat <- (0.20*TDEE())/9
	hyd <- (TDEE() - prot*4 - fat*9)/4
	sum <- c(prot,fat,hyd)
	return(sum)
}	

disHide <-function()
{
      shinyjs::hide("trening",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::hide("inten",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::hide("czas",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::hide("dni",anim = TRUE, animType ="slide",time =0.5)
}
HideInit <-function()
{
  shinyjs::hide("czas")
  shinyjs::hide("dni")
  shinyjs::hide("trening")
  shinyjs::hide("inten")
}
disShow <-function()
{
      shinyjs::show("inten",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::show("czas",anim = TRUE, animType ="slide",time =0.5)
      shinyjs::show("dni",anim = TRUE, animType ="slide",time =0.5)
}

server <- function(input, output,session)
{
  HideInit()
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
  typ_treningu <-reactive({typ <- switch(input$trening,
    sila = 1,
    aero = 0)})

  wartoscSlider <-reactive({wartosc <-input$inten})
  wartoscSliderCzas <- reactive({wartosc <-input$czas})
  wartoscSliderDni <- reactive({wartosc <- input$dni})

  flaga <<- 0
  
  observe({
    cwiczy <- czy_cwiczy()
    if(cwiczy == 1){
      shinyjs::show("trening",anim = TRUE, animType ="slide",time =0.5)
      t_trening <- typ_treningu()
      if(t_trening == 0 ){
        if(flaga == 1 )
        updateSliderInput(session, "inten",max=10,min=5,value=NULL,step=1)
        flaga <<- 0
      }
      else{
        if(flaga == 0 )
        updateSliderInput(session, "inten",max=9,min=7,value=NULL,step=1)
        flaga <<- 1
      }
      disShow()
      wartosc <<- wartoscSlider()
      czas <<- wartoscSliderCzas()
      dni <<-wartoscSliderDni()

    }
      else
        disHide()
    
    typ_sylwetki <<- typ_zwracany()
    observeEvent(input$oblicz,{output$m <-renderText({TDEE()})})
    observeEvent(input$oblicz,{output$distPlot <- renderPlot({
      y <- c(TDEE() - 300,TDEE(),TDEE()+300)
             
      hist(y, breaks = 3, col = "#99CCCC", border = "white",
         xlab = "Cel",
         ylab ="KCAL",
         main = "Histogram zapotrzebowania kalorycznego")})})
    output$l <- renderTable({
    sliderValues()
  })

    })
  
  
  
}

	
	
  

											
											
											


