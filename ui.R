library(shiny)
library(dplyr)
library(DT)
library(markdown)

file.input.accept <- c("text/csv", "text/comma-separated-values,text/plain", ".csv")

shinyUI(
  fluidPage(
    titlePanel("Easy Join"),
    sidebarLayout(
      sidebarPanel(

        fileInput("file1", "CSV file1(Left)", accept = file.input.accept),
        fileInput("file2", "CSV file2(Right)", accept = file.input.accept),
        
        tags$hr(),
        htmlOutput("method1"),
        htmlOutput("method2"),
        htmlOutput("by")
      ),
      
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("CSV1", DT::dataTableOutput("table1")),
                    tabPanel("CSV2", DT::dataTableOutput("table2")),
                    tabPanel("JOIN", DT::dataTableOutput("table.merge"),
                             downloadButton("download", "Download")),
                    tabPanel("Explanation", includeMarkdown("explanation.md"))
                    
        )
      )
    )
  )
)