#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Average Monthly Temperatures in Nottingham, 1920-1939"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("range", label=h3("Year Range"), min=1920, max=1939, value=c(1920,1939)),
       checkboxInput("spring", "Spring", value=TRUE),
       checkboxInput("summer", "Summer", value=TRUE),
       checkboxInput("fall", "Fall", value=TRUE), 
       checkboxInput("winter", "Winter", value=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Plot", br(), plotOutput("plot1")),
                  tabPanel("Documentation", br(), "This plot shows average monthly temperatures in Nottingham from 1920 to 1939. You can adjust the years plotted with the slider bar and highlight specific seasons with the check boxes."))
    )
  )
))
