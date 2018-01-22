library(shiny)
library(rgdal)
library(rwunderground)
library(sp)

ui <- fluidPage(
headerPanel(title = "Pogoda dla Ciebie!"),
#Main panel for displaying outputs
 sidebarLayout(
 sidebarPanel(
				selectInput(inputId = "data1", label = "Wybierz wojewodztwo", choices = c("opolskie", "świętokrzyskie", "kujawsko-pomorskie",
                            "mazowieckie", "pomorskie", "śląskie",
                           "warmińsko-mazurskie", "zachodniopomorskie",
                             "dolnośląskie", "wielkopolskie", "łódzkie",
                           "podlaskie", "małopolskie", "lubuskie",
                             "podkarpackie", "lubelskie"))
 ),
 textOutput("mojanazwamiasta")
 ),
mainPanel(
#Output: Mapa Polski
plotOutput(outputId = "mapa", width = "1280px", height ="720px")
)
)
