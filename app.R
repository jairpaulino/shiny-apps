#install.packages("shiny")

library(shiny)

# ui = fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )

# server <- function(input, output, session) {
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
#   
#   output$summary <- renderPrint({
#     summary(dataset())
#   })
#   
#   output$table <- renderTable({
#     dataset()
#   })
# }
# 
# shinyApp(ui, server)

#Ex_01
# ui = fluidPage(
#   textInput("name", "What's your name?"),
#   textOutput("greeting")
# )
# 
# server <- function(input, output, session) {
#   output$greeting = renderText({
#     paste0("Hello, ", input$name)
#   })
# }
# 
# shinyApp(ui, server)

# Ex_02
# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
#   "then x times 5 is",
#   textOutput("product")
# )
# 
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * 5
#   })
# }
# 
# shinyApp(ui, server)

# Ex_05
library(ggplot2)
datasets <- data(package = "ggplot2")$results[c(2, 4, 10), "Item"]

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)
