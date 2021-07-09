library(shiny)
library(plotly)


shinyServer(function(input, output) {
  y <- list(title = "Sepal.Length")
  x <- list(title = "Petal.Length"
  )
  l <- list(
    x = 0.4,
    y = -0.75, 
    orientation = "h", 
    font = list( 
      family = "sans-serif",
      size = 12,
      color = "#000"),
    bgcolor = "#F5F5F5",
    bordercolor = "#000",
    borderwidth = 2
  )
  
  
  output$scatterplot <- renderPlotly({
    
    
    plot_ly(
      data = iris,
      y = ~Sepal.Length,
      x = ~Petal.Length,
      text=~Species,
      color = ~Species,
      colors = setNames(c("red","orange","yellow"), c("setosa", "virginica", "versicolor")),
      marker = list(size = 10,
                    
                    line = list(color = 'rgba(152, 0, 0, .8)',
                                width = 2)),

      hovertemplate = paste0("<b>Species</b>: %{text}<br>",
                             "<i>Sepal Length</i>: %{y:.2f} <br>",
                             "<i>Petal Length</i>: %{x:.2f} <br>", 
                             "<extra></extra>"           
      )
      
    ) %>% layout(title="Sepal Length vs Petal Length", xaxis = x, yaxis = y,legend = l)
  })
  
})
