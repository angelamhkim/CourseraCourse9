#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(zoo)
library(lubridate)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   tsdates <- as.Date(nottem)
   tsmonths <- months(tsdates)
   tsyears <- year(tsdates)
   springindex <- which(tsmonths=="March"|tsmonths=="April"|tsmonths=="May")
   summerindex <- which(tsmonths=="June"|tsmonths=="July"|tsmonths=="August")
   fallindex <- which(tsmonths=="September"|tsmonths=="October"|tsmonths=="November")
   winterindex <- which(tsmonths=="December"|tsmonths=="January"|tsmonths=="February")
   
   output$plot1 <- renderPlot({
     yearo <- input$range[1]
     yearf <- input$range[2]
     yearoindex <- which(tsyears==yearo)[1]
     yearfindex <- tail(which(tsyears==yearf),1)
     nottemsub <- nottem[yearoindex:yearfindex]
     plot(tsdates[yearoindex:yearfindex],nottemsub, type="l", xlab="Years", ylab="temperature")
     if(input$spring){
       points(tsdates[springindex],nottem[springindex], col="orange", pch=16)
     }
     if(input$summer){
       points(tsdates[summerindex], nottem[summerindex], col="red", pch=16)
     }
     if(input$fall){
       points(tsdates[fallindex], nottem[fallindex], col="green", pch=16)
     }
     if(input$winter){
       points(tsdates[winterindex], nottem[winterindex], col="blue", pch=16)
     }
   })
})
