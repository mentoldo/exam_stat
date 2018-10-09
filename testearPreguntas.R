library(exams)

exams2html(rep("./preguntas/html/R2018_0036.Rmd", 50),
           dir = "render",
           n = 3,
           name = "rand")


## Exportamos muchas preguntas

## Creamos una función para exportar las preguntas
preg <- list.files("./preguntas/html", full.names = TRUE)

# preg <- preg[20 : length(preg)]

exportar <- function(x) {
    exams2html(rep(x, 100),
                 n = 1, # La cantidad de preguntas
                 name = gsub("./preguntas/html/|.Rmd", "", x), # Construye el nombre a partir del nombre original
                 dir = "render") # Manda la salida a la carpeta moodle
}

## Exportamos todas las preguntas a un html
lapply(preg, exportar)

