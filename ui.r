library(shiny)


shinyUI(fluidPage(
        titlePanel("Mo hinh tien luong can nang luc sinh ^^!"),
        
        sidebarLayout(
                sidebarPanel(
                        selectInput("sex", label = h3("Chon gioi tinh"),
                                    choices = list("Nam" = 1, "Nu" = 2), selected = 1),
                        helpText(" '1' Bieu thi cho Nam va '2' Bieu thi cho Nu"),
                        selectInput("ht", label = h3("Chon tinh trang cao huyet ap"),
                                    choices = list("Co" = 1, "Khong" = 2), selected = 2),
                        helpText(" '1' La co cao huyet ap va '2' La khong cao huyet ap"),
                        numericInput("matage", label = h3("Nhap tuoi me"), 30, min = 20, max = 60),
                        sliderInput("gestwks", label = h3("Nhap tuoi thai tinh theo tuan"),
                                    min = 16, max = 50, value = 38),
                        submitButton('Submit')
                        
                ),
                mainPanel(
                        h2('Ket Qua Tien Luong'),
                        h4('Ban da nhap cac thong so'),
                        verbatimTextOutput("sex"),
                        textOutput("text1"),
                        verbatimTextOutput("ht"),
                        verbatimTextOutput("matage"),
                        verbatimTextOutput("gestwks"),
                        h4('Can nang luc sinh du bao la (gram)'),
                        verbatimTextOutput("prediction"))
                
        )
))