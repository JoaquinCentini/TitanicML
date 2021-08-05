library(shiny)
library(tidyverse)
library(tidymodels)
library(titanic)
source('modelTitanic.R', local = TRUE)

shinyServer(function(input, output) {
    observeEvent(input$goButton, {
        print("hola")
        user_data = tibble(
            PassengerID = 4444:4445,
            Survived = c(0,1),
            Pclass = c(1,2),
            Name = c(input$name,"Joaquin"),
            Sex = c(input$sex,"male"),
            Age = c(input$age,24),
            SibSp = c(input$sibsp,3),
            Parch = c(input$parch,0),
            Ticket = 4444:4445,
            Fare = c(16,30),
            Cabin = c("C123","C123"),
            Embarked = c("S","C")
        )
        print(user_data)
        predict_user <- predict_user_data(user_data)
        print(user_data)
        print(toString(predict_user$.pred_class[1]))
        user_data$Name
        output$caption <- renderText({
            ifelse(toString(predict_user$.pred_class[1])=="Died", 
                   "You probably would have died! :c", 
                   "You probably would have survived! c:")
        })
    })
    
})

