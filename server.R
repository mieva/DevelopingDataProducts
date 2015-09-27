library(UsingR)

BodyFatCalcMen <- function(inage, inweight, inheight, inchest, inabdomen, inhip, inthigh, inknee) {
        
        data(fat)
        
        # f = body.fat ~ age + weight + height + BMI + neck + chest + abdomen +
        #        hip + thigh + knee + ankle + bicep + forearm + wrist
        
        f = body.fat ~ age + weight + height + chest + abdomen + hip + thigh + knee
        fit = lm(f, data=fat)
        #coef(res)
        
        inputdata <- data.frame(age=inage, weight=inweight, height=inheight, chest=inchest, abdomen=inabdomen, hip=inhip, thigh=inthigh, knee=inknee)
        
        pred <- predict(fit, inputdata, interval = ("confidence"))
        
        downlim = pred[2]
        uplim = pred[3]
        
        res = pred[1]
        
        res
        
        
        
}

BodyFatCalcWomen <- function(inage, inwaist, inhip, inelbow, inknee) {
        
        data("bodyfat", package = "TH.data")
        
        ### final model proposed by Garcia et al. (2005)
        # fmod <- lm(DEXfat ~ hipcirc + anthro3a + kneebreadth, data = bodyfat)
        # coef(fmod)
        f = DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
        fit = lm(f, data=bodyfat)
        #coef(res)
        
        inputdata <- data.frame(age=inage, waistcirc=inwaist, hipcirc=inhip, elbowbreadth=inelbow, kneebreadth=inknee)
        
        pred <- predict(fit, inputdata, interval = ("confidence"))
        
        downlim = pred[2]
        uplim = pred[3]
        
        res = pred[1]
        
        res
        
        
        
        
}

BodyFatClassification <- function() {
        
        class = c("Classification", "Women (% Fat)", "Men (% Fat)")
        
        row1 = c("Essential Fat", "10-12 %", "2-4 %")
        row2 = c("Athletes", "14-20 %", "6-13 %")
        row3 = c("Fitness", "21-24 %", "14-17 %")
        row4 = c("Acceptable", "25-31 %", "18-25 %")
        row5 = c("Obese", "32% +", "25% +")
        df = data.frame(class, row1, row2, row3, row4, row5)
        
        setNames(df, rep(" ", length(df)))
        
        #names(df) <- c(" ", "  ", "   ")
        
        #names(df) <- names
        
}

shinyServer(
        function(input, output) {
                output$ogender <- renderPrint({input$gender})
                output$oage <- renderPrint({input$inage})
                output$oweight <- renderPrint({input$inweight})
                output$oheight <- renderPrint({input$inheight})
                output$oWaist <- renderPrint({input$inWaist})
                output$ohip <- renderPrint({input$inhip})
                output$oelbow <- renderPrint({input$inelbow})
                output$oknee <- renderPrint({input$inknee})
                output$ochest <- renderPrint({input$inchest})
                output$othigh <- renderPrint({input$inthigh})
                
                output$result <- renderPrint({
                        
                        if (input$goButton == 1) {
                        
                        #if(output$ogender == 1) { #object not allowed
                                if(input$gender == 1) { 
                                #output$result <- renderPrint({BodyFatCalcMen(inage, inweight, inheight, inchest, inabdomen, inhip, inthigh, inknee)})
                                        BodyFatCalcMen(input$inage, input$inweight, input$inheight, input$inchest, input$inWaist, input$inhip, input$inthigh, input$inknee)
                                }
                        
                        #else if (output$ogender == 2) { #object not allowed
                                else if (input$gender == 2) {
                                #output$result <- renderPrint({BodyFatCalcWomen(inage, inwaist, inhip, inelbow, inknee)})
                                        BodyFatCalcWomen(input$inage, input$inWaist, input$inhip, input$inelbow, input$inknee)
                                }
                        }
                })
                
                # Display classification
                output$classification <- renderTable({
                                head(BodyFatClassification())
                })
                
        }
)