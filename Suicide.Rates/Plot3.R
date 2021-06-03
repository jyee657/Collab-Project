library(tidyr)
library(stringr)

suicide_data <- read.csv("Data/Suicide_Rates.csv", check.names = FALSE)
data_longform <- gather(suicide_data, Year, Rate, "X.2019":"X.2000", factor_key=FALSE)

output$text3 <- renderText({
  paste("This line graph shows the change in suicide rates over time in different
        countries. Select a country and take note of the changing y-axis scale.")
})

plot_data <- reactive({
  filtered_data <-
    data_longform %>%
    filter(Country == input$country3) %>%
    filter(Sex == " Both sexes") %>% 
    mutate(Rate = as.numeric(word(Rate, 1))) %>% #selects first number 
    select(Country, Year, Rate) %>% 
    mutate(Year = substr(Year, 3, 6))
  return(filtered_data)
}) 

output$plot3 <- renderPlot({
  d <- ggplot(plot_data(), aes(x=Year, y=Rate, group=Country)) + 
    labs(x = "Year", y = "Suicide Rate", title = "Suicide Rates Over Time per Country")
  d + geom_line(color="orange", size = 1.5) + 
  geom_point(size=2)
})