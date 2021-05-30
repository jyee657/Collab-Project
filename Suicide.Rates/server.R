#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
    
    source('Plot1.R', local = TRUE)
    source('Plot2.R', local = TRUE)
    source('Plot3.R', local = TRUE)
  ##  source('tables.R', local = TRUE)
    
})
