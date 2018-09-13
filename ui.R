library(shiny)
library(dplyr)
library(DT)
library(markdown)

file.input.accept <- c("text/csv", "text/comma-separated-values,text/plain", ".csv")

shinyUI(
  fluidPage(
    titlePanel("Easy join"),
    sidebarLayout(
      sidebarPanel(
        fileInput("file1", "Choose csv file1", accept = file.input.accept),
        fileInput("file2", "Choose csv file2", accept = file.input.accept),
        tags$hr(),
        htmlOutput("method"),
        htmlOutput("by")
      ),
      
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("CSV1", DT::dataTableOutput("table1")),
                    tabPanel("CSV2", DT::dataTableOutput("table2")),
                    tabPanel("JOIN", DT::dataTableOutput("table.merge"),
                             downloadButton('download', 'Download')),
                    tabPanel("Explanation", includeMarkdown("explanation.md"))
                    
        )
      )
    )
  )
)