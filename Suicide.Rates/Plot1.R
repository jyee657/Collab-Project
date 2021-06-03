library(maps)
library(plotly)
library(scales)

data <- read.csv("Data/Suicide_Rates.csv")
map <- map_data("world")

modify <- reactive({
  year <- paste0("X.", input$year)
  output <- data %>% 
    select(Country, Sex, year) %>% 
    filter(Sex == " Both sexes") %>% 
    mutate_(Year = year) %>% 
    mutate(Rate = as.numeric(sub(" \\[.*", "", Year))) %>% 
    select(Country, Rate)
  return(output)
})

output$map <- renderPlotly({
  merged <- full_join(map, modify(), by = c("region" = "Country"))
  m <- ggplot(merged, aes(long, lat, group=group,
                          text=paste0(region,": ", Rate, " suicide deaths"))) +
    geom_polygon(aes(fill=Rate)) +
    ggtitle("Suicide Deaths per 100,000 Population") +
    theme(axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) +
    scale_fill_gradient2(low = "white",
                         mid = "orange",
                         high = "red",
                         midpoint = 25,
                         limits = c(0, 50),
                         oob=squish) +
    coord_quickmap()
  hover <- ggplotly(m, tooltip="text")
  print(hover)
})