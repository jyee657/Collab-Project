suicide.data <- read.csv("Data/Suicide_Rates.csv") 

output$plot2 <- renderPlot({
  
  data.male <- suicide.data %>% 
    filter(X.1 == " Male")
  
  data.female <- suicide.data %>% 
    filter(X.1 == " Female")
  
  p <- ggplot(data, aes_string(input$xVar, input$n, fill="Shape"))
  labs(
    x = input$xVar,
    y = "Number of Observations",
    title = paste(input$xVar, "vs Number of Observations"))
  p + geom_bar(stat = "identity")
  
  
})
