#------------------------------------------------------------------------------#
# Shiny App for Murder Database
# Victoria Miller
# Final Project
# server.R
#------------------------------------------------------------------------------#


ui <- fluidPage(
  
  # App title ----
  titlePanel("Murder Statistics - STOR 320 Final Project"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the years ----
      
      #Slider for weapon
      sliderInput(inputId = "year.weapon",
                  label="Year for Weapons",
                  min=1980,
                  max=2014,
                  value=2000),
      br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
      
      
      #Slider for race
      sliderInput(inputId = "year.race",
                  label="Year for Race",
                  min=1980,
                  max=2014,
                  value=2000),
      br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
      
      
      #Slider for sex
      sliderInput(inputId = "year.sex",
                  label="Year for Sex",
                  min=1980,
                  max=2014,
                  value=2000),
      br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
      
      
      #Slider for age
      sliderInput(inputId = "year.age",
                  label="Year for Age",
                  min=1980,
                  max=2014,
                  value=2000),
      br(),br(),br(),
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins for Age:",
                  min = 5,
                  max = 100,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "weaponBarGraph"),
      plotOutput(outputId = "raceBarGraph"),
      plotOutput(outputId = "sexBarGraph"),
      plotOutput(outputId = "ageHistogram")
    )
  )
)