library(exams)

exams2html(rep("./preguntas/html/R2018_0029.Rmd", 50),
           dir = "render",
           n = 3,
           name = "rand")
