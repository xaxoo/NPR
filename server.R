server <- function(input, output)
{
output$mapa<-renderPlot({
poland.map <- readOGR(dsn="/home/pawciu/appka/wojewodztwa","wojewodztwa") 
class(poland.map)
poland.map@data <- poland.map@data[ , c(6,16)]                                                      
names(poland.map@data) <- c("nazwa", "powierzchnia")
poland.map@data$nazwa <- c("opolskie", "świętokrzyskie", "kujawsko-pomorskie",
                            "mazowieckie", "pomorskie", "śląskie",
                           "warmińsko-mazurskie", "zachodniopomorskie",
                             "dolnośląskie", "wielkopolskie", "łódzkie",
                           "podlaskie", "małopolskie", "lubuskie",
                             "podkarpackie", "lubelskie")
plot(poland.map)
})}

