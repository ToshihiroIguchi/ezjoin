
source("ezjoin.R")

server <- function(input, output, session) {
  
  observeEvent(input$file1, {
    csv_file1 <- reactive({read.csv.sp(input$file1$datapath)})
    output$table1 = DT::renderDataTable(csv_file1())
    
    observeEvent(input$file2, {
      csv_file2 <- reactive({read.csv.sp(input$file2$datapath)})
      output$table2 = DT::renderDataTable(csv_file2())
      
      #https://www.rstudio.com/wp-content/uploads/2015/09/data-wrangling-japanese.pdf
      output$method1 <- renderUI({
        selectInput("method1", "How to JOIN",
                    choices = method.sel(csv_file1(), csv_file2()))
      })
      
      observeEvent(input$method1, {
        output$method2 <- renderUI({
          selectInput("method2", "", choices = sel.method(input$method1))
        })
        
        observeEvent(input$method2, {
          
          output$by <- renderUI({
            if(input$method1 == "Set Operations" || input$method1 == "Binding"){
              NULL
            }else{
              checkboxGroupInput("col.name", 
                                 "Variables to join by",
                                 choices = get.by(csv_file1(), csv_file2()),
                                 selected = get.by(csv_file1(), csv_file2()))
            }
          })
          
          csv_writefile <- reactive({
            ezjoin(csv_file1(), csv_file2(), 
                   by = input$by, 
                   method = method.bond(input$method1, input$method2))
            })
          
          output$table.merge <- DT::renderDataTable(csv_writefile())
          
          output$download <- downloadHandler(
            filename = "merge.csv",
            content = function(filename){
              write.csv(csv_writefile(), filename, row.names=FALSE)
              }
          )
        })
      })
    })
  })
}





