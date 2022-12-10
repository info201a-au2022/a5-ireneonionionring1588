library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)

source("server_app.R")
source("app_ui.R")


shinyApp(ui = ui, server = server)