library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)