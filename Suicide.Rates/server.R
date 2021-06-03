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
library(knitr)

shinyServer(function(input, output) {
    
    output$summary <- renderUI({
      HTML(markdown::markdownToHTML(knit('RMarkdown.Rmd', quiet = TRUE)))
    })
    
    source('Plot1.R', local = TRUE)
    source('Plot2.R', local = TRUE)
    source('Plot3.R', local = TRUE)
    
    output$conclusion <- renderUI({
      HTML(markdown::markdownToHTML(knit('Conclusion.Rmd', quiet = TRUE)))
    })
    
})
