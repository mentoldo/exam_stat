listarpreguntas <- function(){
    ## Intentamos identificar las precuntas que son diferentes para latex
    ## Identificamos las preguntas latex
    latex <- list.files("./preguntas/latex", full.names = FALSE, recursive = TRUE)
    ## Corregimos el nombre para identificarlo en las preguntas html
    nolatex <- gsub("_L", "", latex)
    ## Listamos las preguntas generales html
    lat <- list.files("./preguntas/html", full.names = FALSE, recursive = TRUE)
    ## Quitamos del listado las preguntas que son exclusivamente html
    aptaslatex <-paste("./preguntas/html/", lat[!lat %in% nolatex], sep = "")
    
    ## Listamos nuevamente las latex con full.names
    latex <- list.files("./preguntas/latex", full.names = TRUE, recursive = TRUE)
    
    ## Listamos la preguntas
    preguntas <- c(aptaslatex, latex)
    preguntas
}