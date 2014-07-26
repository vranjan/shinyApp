library(shiny)
library(datasets)
library(ggplot2)

myIris <- iris

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
   paste(input$variable2, "vs", input$variable1)
  })

  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  
#  output$irisPlot <- renderPlot({
#    plot(myIris$Sepal.Length,myIris$Sepal.Width)
#  })
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested

output$irisPlot <- renderPlot({ 
  if(input$variable1 == "Sepal.Length"){
    var1 = myIris$Sepal.Length
  }

  if(input$variable1 == "Sepal.Width"){
    var1 = myIris$Sepal.Width
  }

  if(input$variable1 == "Petal.Length"){
    var1 = myIris$Petal.Length
  }
  
  if(input$variable1 == "Petal.Width"){
    var1 = myIris$Petal.Width
  }

  if(input$variable2 == "Sepal.Length"){
    var2 = myIris$Sepal.Length
  }

  if(input$variable2 == "Sepal.Width"){
    var2 = myIris$Sepal.Width
  }
  
  if(input$variable2 == "Petal.Length"){
    var2 = myIris$Petal.Length
  }
  
  if(input$variable2 == "Petal.Width"){
    var2 = myIris$Petal.Width
  }
  
  var3 = myIris$Species
  
  tmpIris <- data.frame(var1, var2, var3) 
    
    p <- ggplot(tmpIris,aes(var1,var2,colour=var3)) 
    p = p + labs(x = "x", y = "y", size=20)
    p = p + scale_fill_discrete(name="species")
    p = p + geom_point()
    print(p)
  
})





output$prediction <- renderPrint({

  if(input$variable1 == "Sepal.Length"){
    var1 = myIris$Sepal.Length
  }
  
  if(input$variable1 == "Sepal.Width"){
    var1 = myIris$Sepal.Width
  }
  
  if(input$variable1 == "Petal.Length"){
    var1 = myIris$Petal.Length
  }
  
  if(input$variable1 == "Petal.Width"){
    var1 = myIris$Petal.Width
  }
  
  if(input$variable2 == "Sepal.Length"){
    var2 = myIris$Sepal.Length
  }
  
  if(input$variable2 == "Sepal.Width"){
    var2 = myIris$Sepal.Width
  }
  
  if(input$variable2 == "Petal.Length"){
    var2 = myIris$Petal.Length
  }
  
  if(input$variable2 == "Petal.Width"){
    var2 = myIris$Petal.Width
  }
  
  var3 = myIris$Species

  tmpIris <- data.frame(var1, var2, var3)
  
 
  fit <- lm(var2 ~ var1 + as.factor(var3) , data=tmpIris)
  new <- data.frame(var1 = input$sliderX,var3 = as.factor(input$Specs))
#  predict(fit,new)[[1]]
#  gsub("[[1]]", "",predict(fit,new)[[1]])
  cat(predict(fit,new)[[1]],"\n")
  })

})