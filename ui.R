shinyUI(pageWithSidebar(
        # Application title 
        headerPanel("Body Fat Index Calculator"),
        
        sidebarPanel(
                checkboxGroupInput("gender", "Gender", c("Male" = "1", "Female" = "2")),
                
                numericInput('inage', 'Age (yrs)', 0, min = 0, max = 100, step = 1),
                numericInput('inweight', 'Weight (lbs)', 0, min = 0, max = 100, step = 1),
                numericInput('inheight', 'Height (inch)', 0, min = 0, max = 100, step = 1),
                numericInput('inWaist', 'Waist circ. (cm)', 0, min = 0, max = 100, step = 1),
                numericInput('inhip', 'Hip circ. (cm)', 0, min = 0, max = 100, step = 1),
                numericInput('inelbow', 'Elbow circ. (cm)', 0, min = 0, max = 100, step = 1),
                numericInput('inknee', 'Knee circ. (cm)', 0, min = 0, max = 100, step = 1),
                numericInput('inchest', 'Chest circ. (cm)', 0, min = 0, max = 100, step = 1),
                numericInput('inthigh', 'Thigh circ. (cm)', 0, min = 0, max = 100, step = 1),
                
                #submitButton("Calculate")
                actionButton("goButton", "Calculate Body Fat")
                
        ),
        mainPanel(
                h3('Result of prediction'),
                
                # h4('Our regression model'),
                # plotOutput('newHist'),
                
                h4('Your values:'),
                verbatimTextOutput("ogender"),
                verbatimTextOutput("oage"),
                verbatimTextOutput("oweight"),
                verbatimTextOutput("oheight"),
                verbatimTextOutput("oWaist"),
                verbatimTextOutput("ohip"),
                verbatimTextOutput("oelbow"),
                verbatimTextOutput("oknee"),
                verbatimTextOutput("ochest"),
                verbatimTextOutput("othigh"),
                
                h3('Your Body Fat Percentage:'),
                verbatimTextOutput("result"),
                
                h4('Body Fat Percentage Categories:'),
                #p('Classification   Women    Men'),
                #p('Essential Fat    10-12%   2-4%')
                tableOutput("classification")
                
                
                
                
                
                
        )
))