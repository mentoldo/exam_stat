## Este script crea 4 exámenes con 10 opciones de respuesta. Forma A1, Forma A2, FormaB1, FormaB2.
## La formas A tiene las mismas preguntas, pero con diferentes valores (aquellos que se
## generan aleatoriamente). Lo mismo para la forma B.

library(exams)

source("listarpreguntas.R") ## la funcion listar preguntas lista todas las preguntas para formato PDF

preguntas <- listarpreguntas()

## Configuramos semilla aleatoria. (Esto solo en el caso que deseemos poder reproducir
## exactamente el mismo exámen)
set.seed(-605196)

## Seleccionamos 10 preguntas aleatorias para cada forma.
muestraA <- sample(preguntas, 10)
muestraB <- sample(preguntas, 10)

## Forma A
pruebaA <- exams2nops(muestraA,
                      n = 2,
                      dir = "./examenes/ejemplo/", 
                      name = "2018_formaA",
                      title = "Estadística, Forma A",
                      institution = "Universidad Nacional de Córdoba",
                      logo = "/img/logo_UNC_2.png",
                      date = "2018-07-07",
                      language = "es",
                      blank = 0,
                      usepackage = c("inputenc", "booktabs", "longtable"),
                      encoding = "utf-8",
                      reglength = 8)

## Forma B
pruebaB <- exams2nops(muestraB,
                      n = 2,
                      dir = "./examenes/ejemplo/", 
                      name = "2018_formaB",
                      title = "Estadística, Forma B",
                      institution = "Universidad Nacional de Córdoba",
                      logo = "img/logo_UNC_2.png",
                      date = "2018-07-07",
                      language = "es",
                      blank = 0,
                      usepackage = c("inputenc", "booktabs", "longtable"),
                      encoding = "utf-8",
                      reglength = 8)


## Respuestas.
solA <- exams_metainfo(pruebaA)
solB <- exams_metainfo(pruebaB)

## impresp (Imprimir respuestas) crea un archivo .csv con las respuestas correctas.
source("impresp.R")
impresp(solA, solB)
