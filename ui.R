library(shiny)
library(rgdal)
library(rwunderground)
library(sp)
library(shinyjs)

ui <- fluidPage(
headerPanel(title = "Pogoda dla Ciebie!"),
#Main panel for displaying outputs
 sidebarLayout(
 sidebarPanel(
				selectInput("data1","Wybierz wojewodztwo",c("opolskie", "świętokrzyskie", "kujawsko-pomorskie",
                            "mazowieckie", "pomorskie", "śląskie",
                           "warmińsko-mazurskie", "zachodniopomorskie",
                             "dolnośląskie", "wielkopolskie", "łódzkie",
                           "podlaskie", "małopolskie", "lubuskie",
                             "podkarpackie", "lubelskie"), selected="kujawsko-pomorskie", selectize = FALSE),
				selectInput("color","Wybierz Kolor",c("Blue", "Green", "Red"), selected="Blue", selectize = FALSE),
			    selectInput("miasto", "Miasto", c("Bydgoszcz", "Gdansk", "Warszawa"), selected="Warszawa", selectize = FALSE)
 ),
 textOutput("mojanazwamiasta"),
 ),
mainPanel(
#Output: Mapa Polski
textOutput("data1"),
textOutput("miasto"),
textOutput("data2"),
plotOutput(outputId = "mapa",click = "mapa_click", width = "1280px", height ="720px"),
verbatimTextOutput("info")
)
)
