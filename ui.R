

intro_panel <- tabPanel(
  "Intro",
  titlePanel("Introduction")
  # Your `map_main_content`
  
)

plot_sidebar_content <- sidebarPanel(
  countries_input <- selectInput("countries", "Country", multiple = TRUE, 
                                 choices = co2_data$country, c("United States", "China", "United Kingdom")),
  source_input <- selectInput("co2_source", "CO2 Source", multiple = FALSE, 
                              choices = c("oil", "coal", "gas"), "oil")
)

plot_main_content <- mainPanel(
  plotOutput("barchart")
)


plot_panel <- tabPanel(
  "Plot",
  titlePanel("Interactive Page"),
  # A `sidebarLayout()` that contains...
  sidebarLayout(
    
    plot_sidebar_content,
    plot_main_content
  )
)


ui <- navbarPage(
  "co2_data",
  intro_panel, 
  plot_panel
)