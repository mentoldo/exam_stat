impresp <- function(...){
    ## La función soluciones extrae las soluciones de los éxamenes y los ordena en una lista con un data.frame por exámen
    soluciones <- function(x){
        ## Busca cada uno de los exámenes
        lapply(x, function(x){
            ## Busca el string con las soluciones
            lsol <- lapply(x, function(y){
                y$string
            })
            ## Dividimos la lista para quedarnos con los números
            dividido <- strsplit(unlist(lsol), ": ")
            tabla <- t(as.data.frame(dividido))
            colnames(tabla) <- c("codigo", "correcta")
            tabla
        })
    }
    
    ## Ordenamos la salida en un solo data.frame
    ordenar <- function(x){
        lista <- lapply(soluciones(x), function(x){
            x[, 2]
        })
        as.data.frame(lista)
    }
    
    ## Recibe un data.frame y crea los nombres para cada columna
    nombres <- function(forma, x){
        nombres <- vector("character")
        for(i in 1:ncol(x)){
            nombres[i] <- paste(forma, i, sep = "")
        }
        nombres
    }
    
    ## Coloca los nombres al data.frame
    colocarnombres <- function(forma, x){
        names(x) <- nombres(forma, x)
        x
    }
    
    ## "output" recibe la salida de "ordenar" y devuelve la tabla con las respuestas. La asignación de nombres de columnas es ordenada
    # El primer argumento se nombra con A, el segundo con B, etc...
    output <- function(lista){
        # lista <- list(...)
        tabla <- vector(mode = "list")
        for(i in 1:length(lista)){
            tabla[[i]] <- colocarnombres(LETTERS[i], lista[[i]])
        }
        do.call(cbind, tabla)
    }
    
    ## Imprimimos una tabla
    listadf <- lapply(list(...), ordenar)
    salida <- output(listadf)
    salida <- sapply(salida, function(x){
        letters[x]
    })
    
    ## Cambiamos los números por letras
    rownames(salida) <- paste("P", 1:10, sep = "")
    
    ## Imprimimos las respuestas
    write.csv2(salida, "./examenes/ejemplo/respuestas.csv")

}