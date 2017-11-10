#------------------------------------------------------------------------------#
# Shiny App for Murder Database
# Victoria Miller
# Final Project
# server.R
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# Load in tidyverse
#------------------------------------------------------------------------------#
library(tidyverse)

#------------------------------------------------------------------------------#
# Read in the murder database
#------------------------------------------------------------------------------#
murders=read_csv("database.csv")


#------------------------------------------------------------------------------#
# Shiny server
#------------------------------------------------------------------------------#

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "orange",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  output$weaponBarGraph = renderPlot({
    weapon_years=select(filter(murders,Weapon!='Unknown'),Weapon,Year)
    ggplot(filter(weapon_years,Year==input$year.weapon),aes(x=Weapon,fill=factor(Weapon)))+
      geom_bar()
  })
  
  output$raceBarGraph = renderPlot({
    race_years=select(filter(murders,VictimRace!='Unknown'),VictimRace,Year)
    ggplot(filter(race_years,Year==input$year.race),aes(x=VictimRace,fill=factor(VictimRace)))+geom_bar()
  })
  
  output$sexBarGraph = renderPlot({
    sex_years=select(filter(murders,VictimSex!='Unknown'),VictimSex,Year)
    ggplot(filter(sex_years,Year==input$year.sex),aes(x=VictimSex,fill=factor(VictimSex)))+geom_bar()
  })
  
  output$ageHistogram = renderPlot({
    age_years=select(filter(murders,VictimAge!='Unknown'),VictimAge,Year)
    ggplot(filter(age_years,Year==input$year.age),aes(x=VictimAge,fill=factor(VictimAge)))+
      geom_histogram(bins=input$bins)+coord_cartesian(xlim=c(0,100))
  })
  
}