library(shiny)

ui <- fluidPage(
  titlePanel(
    # judul aplikasi
    "Ini bagian judul"
  ),
  sidebarLayout(
    sidebarPanel(
      # bagian input
      numericInput("m", "Ini inputnya:", 2, min = 1, max = 100)
    ),
    mainPanel(
      # bagian output
      plotOutput("hist")
    )
  )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  }, res = 96)
}

shinyApp(ui = ui, server = server)