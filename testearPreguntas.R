library(exams)

exams2html(rep("./preguntas/html/R2018_0003.Rmd", 100),
           dir = "render",
           n = 10,
           name = "rand")
