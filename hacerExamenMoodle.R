library(exams)

## El argumento rule = "none" permite que las respuestas erradas no resten puntos
exams2moodle("./preguntas/P-frecuencia-1.Rmd", n = 100,
             name = "P-frecuencia-1", rule = "none")

## Hacer R2018_0004
exams2moodle("./preguntas/R2018_0004.Rmd",
             n = 100,
             name = "R2018_0004",
             rule = "none",
             dir = "moodle")


## Creamos una función para exportar las preguntas
preg <- list.files("./preguntas/html", full.names = TRUE)

exportar <- function(x) {
    exams2moodle(x,
                 n = 100, # La cantidad de preguntas
                 name = gsub("./preguntas/html/|.Rmd", "", x), # Construye el nombre a partir del nombre original
                 rule = "none", # El argumento rule = "none" permite que las respuestas erradas no resten puntos
                 dir = "moodle") # Manda la salida a la carpeta moodle
}

## Exportamos todas las preguntas
lapply(preg, exportar)
