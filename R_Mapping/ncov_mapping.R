library(leaflet)
library(shiny)


df <- read.csv(file = 'ncov_parsed.csv')
df$Date <- as.Date(as.POSIXct(df$Date,format="%Y-%m-%dT%H:%M:%OS"))
str(df)

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
                     start = min(df$Date),
                     end   = max(df$Date))
      
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