
source("ezjoin.R")

server <- function(input, output, session) {
  
  observeEvent(input$file1, {
    csv_file1 <- reactive({read.csv.sp(input$file1$datapath)})
    output$table1 = DT::renderDataTable(csv_file1())
    
    observeEvent(input$file2, {
      csv_file2 <- reactive({read.csv.sp(input$file2$datapath)})
      output$table2 = DT::renderDataTable(csv_file2())
      
      #https://www.rstudio.com/wp-content/uploads/2015/09/data-wrangling-japanese.pdf
      output$method <- renderUI({
        selectInput("method", "How to JOIN",
                    choices = c("Mutating Joins(left join)",
                                "Mutating Joins(right join)",
                                "Mutating Joins(inner join)",
                                "Mutating Joins(full join)",
                                "Filtering Joins(semi join)",
                                "Filtering Joins(anti join)",
                                "Set Operations(intersect)",
                                "Set Operations(union)",
                                "Set Operations(setdiff)",
                                "Binding(bind rows)",
                                "Binding(bind cols)"))
      })
      
      output$by <- renderUI({
        checkboxGroupInput("col.name", 
                    "Variables to join by",
                    choices = get.by(csv_file1(), csv_file2()),
                    selected = get.by(csv_file1(), csv_file2()))
      })
      

      
      
      csv_writefile <- reactive({ezjoin(csv_file1(), csv_file2(), 
                                        by = input$by, method = input$method)})
      output$table.merge = DT::renderDataTable(csv_writefile())

      
      output$download = downloadHandler(
        filename = "merge.csv",
        content = function(filename) {write.csv(csv_writefile(), filename, row.names=FALSE)}
      )
      
      
    })
    
  })

    
}





