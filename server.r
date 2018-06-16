library(shiny)
bwdata = read.csv("https://raw.githubusercontent.com/khuongquynhlong/Machine-learning/master/bw.csv")

model <- lm(bweight ~ matage + ht + gestwks + sex, data = bwdata)

bwPredict <- function(matage, ht, gestwks, sex){
        predict(model, data.frame(matage = matage, ht = ht,
                                  gestwks = gestwks,
                                  sex = sex), type
                = "response", interval = "prediction")[1]
}
shinyServer(
        function(input, output){
                output$matage <- renderPrint({input$matage})
                output$ht <- renderPrint({input$ht})
                output$gestwks <- renderPrint({input$gestwks})
                output$sex <- renderPrint({input$sex})
                output$prediction <- renderPrint({bwPredict(input$matage, 
                                                            as.numeric(input$ht), input$gestwks,
                                                                as.numeric(input$sex))})
        }
)
