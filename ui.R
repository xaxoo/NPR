library(shiny)
library(rgdal)
library(rwunderground)
library(sp)

ui <- fluidPage(
titlePanel("Pogoda dla Ciebie!"),
#Main panel for displaying outputs
 sidebarLayout(
 sidebarPanel(("Wybierz miejscowosc"), textInput("nazwa", "Podaj nazwe miejscowosci", ""))
# mainPanel(
#Output: Mapa Polski
plotOutput(outputId = "mapa", width = "1280px", height ="720px"),
textOutput("mojanazwa"))
))
