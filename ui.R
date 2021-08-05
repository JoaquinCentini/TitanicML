library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("If you had been on the Titanic would you have survived or not?"),

    sidebarLayout(
        sidebarPanel(
            textInput(
                "name",
                label = "Name",
                value= "",
                width = '400px',
                placeholder = "Joaquin"
            ),
            selectInput(
                "sex",
                label = "Sex",
                choices = c("Female"="female","Male"="male"),
                selected = NULL,
                width = '400px'
            ),
            numericInput(
                "age",
                label = "Age",
                value = NULL,
                min = 1,
                max = 99,
                step = NA,
                width = '400px'
            ),
            numericInput(
                "sibsp",
                label = "Number of Siblings or Spouses Aboard",
                value = NULL,
                min = 0,
                max = 8,
                step = NA,
                width = '400px'
            ),
            numericInput(
                "parch",
                label = "Number of parents or children aboard",
                value = NULL,
                min = 0,
                max = 8,
                step = NA,
                width = '400px'
            ),
            actionButton("goButton", "Predict", class = "btn-success")
        ),
        mainPanel(
            h3(textOutput("caption",container = span))
        )
    )
)
)
