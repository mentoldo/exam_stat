library(exams)

exams2html(rep("./preguntas/html/R2018_0017.Rmd", 100),
           dir = "render",
           n = 3,
           name = "rand")
