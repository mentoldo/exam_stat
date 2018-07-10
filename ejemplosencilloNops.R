library(exams)

## Generaremos un exámen con 30 veces la misma pregunta, con diferentes valores.

## ejemplo
prueba <- exams2nops(rep("preguntas/latex/R2018_0015_L.Rmd", 30),
                      n = 1,
                      dir = "./examenes/ejemplosencillo/", 
                      name = "2018_formaA",
                      title = "Ejemplo",
                      institution = "Universidad Nacional de Córdoba",
                      logo = "/home/psyche/Escritorio/exam_stat/img/logo_UNC_2.png",
                      date = "2018-07-07",
                      language = "es",
                      blank = 0,
                      usepackage = c("inputenc", "booktabs", "longtable"),
                      encoding = "utf-8",
                      reglength = 8)
