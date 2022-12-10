
intro_main <- includeMarkdown("Report.Rmd")
intro_panel <- tabPanel(
  "Intro",
  titlePanel("Introduction:"),
  h2("How do CO2 levels from coal, oil and gas change in the countries around the world?"),
  p("CO2 emmisions occur from various human activities today. Three of those most well known inclue coal, oil and gas. With current global warming issues affecting our climate, such data about carbon dioxide emmisions are crucial to keeping track of the damages we do to our atmosphere. With the three catagories of oil, coal and gas, we will be able to determine what natural resources we use most to produce co2 and which countries contribute most to the damage. ", style = "font-size: 16px"),
  h2("What is the average value of my variable across all the counties (in the current year)?"),
  p("The average value of coal co2 was:", style = "font-size: 18px"),
  strong(average_val_of_coalco2 <- co2_data %>% filter(year == 2021) %>% summarise(coal_co2_average = mean(coal_co2, na.rm = TRUE))%>% pull(coal_co2_average), "tons", style = "font-size: 18px"),
  h2("Where is my variable the highest / lowest?"),
  p("The highest emissions of coal co2 was in:", style = "font-size: 18px"),
  strong(max_val_of_coalco2 <- co2_data %>% filter(coal_co2 == max(coal_co2, na.rm = TRUE)) %>% pull(country), style = "font-size: 18px"),
  p("The lowest value of coal co2 emissions was in:", style = "font-size: 18px"),
  strong("179 countries, unable to be displayed on intro page", style = "font-size: 18px"),
  h2("How much has my variable change over the last N years?"),
  p("Over the N(example: 3) years, coal co2 emissions has changed:", style = "font-size: 18px"),
  strong("2019: 217tons to 2020: 260tons to 2021: 274tons", style = "font-size: 18px"),
  p("Code on app_server.R", style = "font-size: 18px")

)

plot_sidebar_content <- sidebarPanel(
  countries_input <- selectInput("countries", "Country", multiple = TRUE, 
                                 choices = co2_data$country, c("United States", "China", "United Kingdom")),
  source_input <- selectInput("co2_source", "CO2 Source", multiple = FALSE, 
                              choices = c("oil", "coal", "gas"), "oil")
)

plot_main_content <- mainPanel(
  plotlyOutput("barchart")
)

plot_panel <- tabPanel(
  "Plot",
  titlePanel("Interactive Page"),
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