#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(httr)
library(readxl)
library(RCurl)
library(googledrive)
library(tidyr)
library(tidyselect)
library(dplyr)
library(bpa)
library(DT)
library(data.table)
library(ggplot2)
library(hrbrthemes)
library(scales)
library(plotly)
library(lubridate)

# Define UI for application that draws a histogram
shinyUI( 
  dashboardPage(skin = "green",
                dashboardHeader(title = "FIFO Dashboard"),
                dashboardSidebar(
                  sidebarMenu(
                    menuItem("Patty Cash & TaMe",
                             tabName = "petty_cash_tame",
                             icon = icon("chart-line"),
                             selectInput("code", "Select Company Code", choices = c("ALL","TCM", "BEK", "ITM", "GEM", "KTD", "IMM", "JBG", "TRUST"))
                    )
                  )
                ),
                dashboardBody(
                  fluidRow(
                    valueBox("plot", value = sum(cash_flow_replace$Debit), subtitle = "Debit Total", icon = icon("cash-register"), color = "lime", width = 3),
                    valueBox("plot", value = sum(cash_flow_replace$Credit), subtitle = "Credit Total", icon = icon("dollar-sign"), color = "teal", width = 3)
                  ),
                  fluidRow(
                    box(tableOutput("table_cash_flow")),
                    column(6, plotOutput(outputId = "plot", width = "500px", height = "500px")),
                    column(6, plotlyOutput(outputId = "plot2", width = "500px", height = "500px"))
                  )
                )
  )
)
