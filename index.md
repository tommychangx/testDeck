---
title       : Developing Data Products
subtitle    : Reproducible Pitch Presentation
author      : Tommy Chan
job         : Creat Presentation
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Slide 2

Car Motor Regression Study

--- .class #id 

## Slide 3


```r
fit <- lm(mpg ~ cyl, data = mtcars)
plot(mtcars$cyl, mtcars$mpg)
abline(fit)
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1.png) 

--- .class #id 

## Slide 4


```r
fit <- lm(mpg ~ am, data = mtcars)
plot(mtcars$am, mtcars$mpg)
abline(fit)
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2.png) 

--- .class #id 

## Slide 5


```r
fit <- lm(mpg ~ gear, data = mtcars)
plot(mtcars$gear, mtcars$mpg)
abline(fit)
```

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3.png) 


