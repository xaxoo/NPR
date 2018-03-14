library(shiny)
library(shinyjs)

ui <- fluidPage(
	useShinyjs(),
	headerPanel(title = "Kalkulator kalorii"),
	#Main panel for displaying outputs
   sidebarLayout(
      sidebarPanel(
	helpText("Wylicz łatwo zapotrzebowanie kaloryczne ale najpierw uzupełnij dane"),
	h6(helpText("Pamietaj, że dane podane są z przybliżeniem")),
	selectInput("plec",
		label = "Wybierz płeć",
		choices = c("Mężczyzna" = "M",
				"Kobieta" = "K"),
		selected = "Mężczyzna"),
	numericInput("wiek", label = "Podaj wiek",
		20,min = 5, max = 100),
	numericInput("waga",
		label = "Podaj wage",
		70, min = 1, max = 200),
	numericInput("wzrost",
		label = "Wzrost",180,
		min = 130, max =210),
	h6(helpText("Zaznacz 'Tak' jeśli chcesz podać szczegóły treningu a algorytm wykona bardziej precyzyjne obliczenia")),
	selectInput("czycwiczy",
		label = "Uprawiasz jakiś sport ?",
		choices =c("Tak",
				"Nie"),
		selected = "Nie"),
	actionButton("oblicz","Oblicz")
	
	
	
	
	),
	mainPanel(textOutput("m"),
	          tableOutput("l")
	           )
)
)
