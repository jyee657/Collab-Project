suicide.data <- read.csv("Data/Suicide_Rates.csv") 

output$text2 <- renderText({
paste("This is a chart for gender and suicide across the world. You can select a 
      year and a country to see the differences between gender and suicide rates 
      over time. This can be used to compare rates. In most countries, male suicide rates tend to be higher.")
      })

 p <- reactive({
    year <- paste0("X.", input$year)
    filtered <-
      suicide.data %>%
      mutate_(Year = year) %>% 
      filter(Country == input$country) %>% 
      mutate(Rate = as.numeric(sub(" \\[.*", "", Year))) %>%
      select(Country, Rate, Sex)
    return(filtered)
  }) 

output$plot2 <- renderPlot({
  print(head(p()))
  d <- ggplot(p(), aes(Sex, Rate, fill=Sex)) +
  labs(
    x = "Gender",
    y = "Rate",
    title = paste("Gender vs Year"))
  d + geom_bar(stat="identity")
})
