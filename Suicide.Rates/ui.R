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

countries <- suicide.data %>% 
    select(Country) %>% 
    unique()


shinyUI(navbarPage("Suicide Rates Data",
                   tabPanel("Summary", 
                            includeMarkdown("RMarkdown.Rmd")),
                    tabPanel("World Map",
                            textOutput("plot1")),
                   
                   tabPanel("Gender and Suicide",
                            titlePanel("Gender and Suicide"),
                            textOutput("text2"),
                            selectInput("country", label = "Country", 
                                                         choices = c(countries),
                                                         selected = "Afghanistan"),
                            selectInput("year", "Year",
                                                 choices=c(2000:2019)),
                            plotOutput("plot2")),
                   tabPanel("Country Rates",
                            textOutput("plot3")),
                   tabPanel("Conclusion",
                            includeMarkdown("Conclusion.Rmd"))
))
