
A Body Fat Calculator App
========================================================
author: Michela Ieva
date: September 26th, 2015
transition: rotate

<small>
Course Project Assesment for Coursera Course:
Developping Data Products 
Johns Hopkin Bloomberg School of Public Health)
</small>


The App Overview
========================================================
<small>
My project for the Developping Data Products Course is a simple Shiny application to calculate the body fat percentage.

The app web page, as you can see, is simple and selfexplaining. 
It consists of:
- a side bar where input data are requested;
- a main panel with the result.
</small>
<img src="C:\Users\Michela\Desktop\ieva\DATASCIENCE\datasciencecoursera\DevDataProjs\RSlides-figure\MyShinyApp3.png">
                     
<img src="C:\Users\Michela\Desktop\ieva\DATASCIENCE\datasciencecoursera\DevDataProjs\RSlides-figure\MyShinyApp4.png">


Behind the scenes: Data Analisys Details
========================================================
- Apart from the graphical aspect, the idea is to use two different R data   frames (male/female observations) to perform a **Multivariate Linear regression** to predict the body fat percentage.

- The *server.R* script contains two functions:
 
    1. BodyFatCalcMen <- function(...)

```r
library(UsingR)
data(fat)
f = body.fat ~ age + weight + height + chest + abdomen + hip + thigh + knee
fit = lm(f, data=fat)
```


Behind the scenes: Data Analisys Details
========================================================
    2. BodyFatCalcWomen <- function(...)    

```r
data("bodyfat", package = "TH.data")
f = DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
fit = lm(f, data=bodyfat)
```

Functions perform linear fits with different variables (as predictors) to calculate the user body fat percentage.

- Data inserted from user are used to create a new *data frame* and obtain a personal value using the coefficiets from the fit.


Conclusions and next steps
========================================================
> ### Status of the art

- Realized a Shiny web application to calculate the user *Body Fat Percentage*;
- Graphical user interface simple and user friendly;
- The app include a final *classification table* for result explanation and interpretation.

> ### Future optimizations

- The data analysis is correct but very simple. Improovments are possible to obtain more precise result;
- Update the graphical interface to be more beautiful and charming.

 


