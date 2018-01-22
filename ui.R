library(shiny)
library(rgdal)
library(rwunderground)
library(sp)

ui <- fluidPage(
headerPanel(title = "Pogoda dla Ciebie!"),
#Main panel for displaying outputs
 sidebarLayout(
 sidebarPanel(("Wybierz miejscowosc"), textInput("nazwamiasta", "Podaj nazwe miejscowosci", "")),
 textOutput("mojanazwamiasta")
 ),
mainPanel(
#Output: Mapa Polski
plotOutput(outputId = "mapa", width = "1280px", height ="720px")
)
)
