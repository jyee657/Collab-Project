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
library(plotly)

countries <- suicide.data %>% 
    select(Country) %>% 
    arrange(Country) %>% 
    unique()


shinyUI(navbarPage("Suicide Rates Data",
                   tabPanel("Summary", 
                            uiOutput('summary')),
                   tabPanel("World Map",
                           titlePanel("World Map"),
                           textOutput("text1"),
                           selectInput("year1", "Select a year", 
                                       choices=c(2000:2019), selected=2016),
                           plotlyOutput("map")),
                   tabPanel("Gender and Suicide",
                            titlePanel("Gender and Suicide"),
                            textOutput("text2"),
                            selectInput("country", label = "Country", 
                                                         choices = c(countries),
                                                         selected = "Afghanistan"),
                            selectInput("year2", "Year",
                                                 choices=c(2000:2019)),
                            plotOutput("plot2")),
                   tabPanel("Country Rates",
                            titlePanel("Suicides by Year per Country"),
                            textOutput("text3"),
                            selectInput("country3", label = "Country", 
                                        choices = c(countries),
                                        selected = "Afghanistan"),
                            plotOutput("plot3")),
                   tabPanel("Conclusion",
                            uiOutput('conclusion'))
))
