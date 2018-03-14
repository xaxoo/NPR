library(shiny)
library(shinyjs)

ui <- fluidPage(
	
	headerPanel(title = "Kalkulator kalorii"),
	#Main panel for displaying outputs
   sidebarLayout(
      div(style="width: 100%",sidebarPanel(
	helpText("Wylicz łatwo zapotrzebowanie kaloryczne ale najpierw uzupełnij dane"),
	h6(helpText("Pamietaj, że dane podane są z przybliżeniem")),
	div(style="display: inline-block;vertical-align:top; width: 150px;",selectInput("plec",
		label = "Wybierz płeć",
		choices = c("Mężczyzna" = "M",
				"Kobieta" = "K"),
		selected = "Mężczyzna")),
	div(style="display: inline-block;vertical-align:top; width: 150px;",numericInput("wiek", label = "Podaj wiek",20,min = 5, max = 100)),
	div(style="display: inline-block;vertical-align:top; width: 150px;",numericInput("waga",label = "Podaj wage",70, min = 1, max = 200)),
	div(style="display: inline-block;vertical-align:top; width: 150px;",numericInput("wzrost",label = "Wzrost",180,min = 130, max =210)),
	hr(),
	h6(helpText("Zaznacz 'Tak' jeśli chcesz podać szczegóły treningu a algorytm wykona bardziej precyzyjne obliczenia")),
	div(style="display: inline-block;vertical-align:top; width: 150px;",selectInput("czycwiczy",
		label = "Uprawiasz jakiś sport ?",
		choices =c("Tak",
				"Nie"),
		selected = "Nie")),
	div(style="display: inline-block;vertical-align:top; width: 75px;"),
	div(style="display: inline-block;vertical-align:top; width: 150px;",radioButtons("typ","Typ budowy ciała:",
		c("Ektomorfik" = "ekto",
			"Mezomorfik" = "mezomorf",
			"Endomorfik" = "endo"))),
	hr(),
	div(style="display: inline-block; vertical-align:top; width: 150px;",radioButtons("trening","Typ treningu:",
		c("Siłowy" = "sila",
			"Aerobowy" = "aero"))),
	div(style="display: inline-block; vertical-align:top; width: 150px;", sliderInput("inten","Intesywność treningu: ",min =7,max=9,value =8,step=1)),
	hr(),
	div(style="display: inline-block; vertical-align:top; width: 150px;", sliderInput("czas","Czas treningu w minutach",min =0,max=200,value =0,step=1)),
	div(style="display: inline-block; vertical-align:top; width: 150px;", sliderInput("dni","Ile dni w tygodniu",min =0,max=7,value =0,step=1)),
	hr(),
	div(style="display: inline-block; vertical-align:top; width: 150px;",actionButton("oblicz","Oblicz"))
	
	
	
	)
	),
	mainPanel(
		useShinyjs(),
		textOutput("m"),
	   	tableOutput("l")
	    )
	)
)
