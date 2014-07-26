library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris Data Exploration and Prediction"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    strong("Please choose x and y variables:"),
    selectInput("variable1", "x", 
                list("Sepal Length" = "Sepal.Length",
                     "Sepal Width" = "Sepal.Width", 
                     "Petal Length" = "Petal.Length",
                     "Petal Width" = "Petal.Width")),
    
    selectInput("variable2", "y",
                list("Sepal Length" = "Sepal.Length", 
                     "Sepal Width" = "Sepal.Width", 
                     "Petal Length" = "Petal.Length",
                     "Petal Width" = "Petal.Width")),
    
    strong("Linear Fit"),
    p("This app runs a linear fit between the x and y variables
      chosen above and including the Species as factor."),
    p("lm(y ~ x + as.factor(Species))"),
    strong("Please Choose the value of x and Species:"),
    
    sliderInput('sliderX', 'Choose a value for x', value = 3.5, min = 0, max = 8, step = 0.05,),
    selectInput("Specs", "Species", 
                list("setosa" = "setosa",
                     "versicolor" = "versicolor", 
                     "virginica" = "virginica")),
    
    strong("The prediction result for y is: "),
    textOutput("prediction")

  ),  
  
  
  # Show the caption and plot of the requested variable against mpg
    mainPanel(
      p("This famous (Fisher's or Anderson's) iris data set gives the 
        measurements in centimeters of the variables sepal length and 
        width and petal length and width, respectively, for 50 flowers 
        from each of 3 species of iris. The species are Iris setosa, 
        versicolor, and virginica."),
      strong("Usage documentation:"),
      p("Choose Sepal length, Sepal width, petal lenght, petal width
        as x and y variables from the drop down menu in the left panel.
        Your choice will be displayed below in a plot of y versus x and
        will choose different colors for different species. Further choose
        the value of x in the slider bar and species
        type in the drop down menu in the left panel. This will give a 
        prediction y for the chosen x and species based on a linear fit. 
        The formular used for the linear fit is displayed in the left panel."),
      
      h3(textOutput("caption")),
    
      plotOutput("irisPlot")
#      verbatimTextOutput("prediction")
    )
))


