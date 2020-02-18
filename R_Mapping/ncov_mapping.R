library(leaflet)
library(shiny)


df <- read.csv(file = 'ncov_parsed.csv')


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("COVID-19 Tracker Ph"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      dateRangeInput("daterange1", "Date range:",
                     start = "2020-01-23",
                     end   = "2020-02-05")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      leaflet(df) %>% addTiles() %>% addCircleMarkers(
      )
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)