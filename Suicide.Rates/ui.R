#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

suicide.data <- read.csv("Data/Suicide_Rates.csv")


library(shiny)

shinyUI(navbarPage("Suicide Rates Data",
                   tabPanel("Summary", 
                            includeMarkdown("RMarkdown.Rmd")),
                   tabPanel("World Map",
                            textOutput("plot1")),
                   tabPanel("Gender Rates",
                            textOutput("plot2")),
                   tabPanel("Country Rates",
                            textOutput("plot3"))
))
