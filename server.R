co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
server <- function(input, output) {
  
  output$barchart <- renderPlotly({
    
    coal_data <- co2_data %>% filter(country %in% input$countries) %>% group_by(country) %>% summarise(coal_co2_average = mean(coal_co2, na.rm = TRUE))
    oil_data <- co2_data %>% filter(country %in% input$countries) %>% group_by(country) %>% summarise(oil_co2_average = mean(oil_co2, na.rm = TRUE))
    gas_data <- co2_data %>% filter(country %in% input$countries) %>% group_by(country) %>% summarise(gas_co2_average = mean(gas_co2, na.rm = TRUE))
    
    if(input$co2_source ==  "coal"){
      coal_co2_plot <- ggplot(co2_data, mapping = aes(x = coal_co2_average, y = country)) + 
        ggtitle("Countries and CO2 rates from coal") + 
        geom_col() +
        labs(caption = "This interactive chart shows various countries' co2 emmission rates from use of coal.") +
        theme(plot.caption.position = "plot",plot.caption = element_text(hjust = 0))
    
      coal_co2_plot
    }
    
    if(input$co2_source == "oil"){
      oil_co2_plot <- ggplot(co2_data, mapping = aes(x = oil_co2_average, y = country)) + 
        ggtitle("Countries and CO2 rates from oil") + 
        geom_col() +
        labs(caption = "This interactive chart shows various countries' co2 emmission rates from use of oil.") +
        theme(plot.caption.position = "plot",plot.caption = element_text(hjust = 0))
      
      oil_co2_plot
    }
    
    if(input$co2_source == "gas"){
      gas_co2_plot <- ggplot(co2_data, mapping = aes(x = gas_co2_average, y = country)) + 
        ggtitle("Countries and CO2 rates from gas") + 
        geom_col() +
        labs(caption = "This interactive chart shows various countries' co2 emmission rates from use of gas.") +
        theme(plot.caption.position = "plot",plot.caption = element_text(hjust = 0))
      
      gas_co2_plot
    }
    
  })
} 