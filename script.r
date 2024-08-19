# Diretório
setwd("")

# Processamento
arquivo <- scan(file="URL", what="character", sep="\n", strip.white = TRUE)
texto <- paste(arquivo, collapse = " ")
sentencas <- stringr::str_split_1(texto, pattern = "[\u2014.;!?]+")

# Filtragem
palavras <- c("sozinho", "sozinha", "sozinhos", "sozinhas")
sentencasFiltradas <- sentencas[grepl(paste(palavras, collapse = "|"), sentencas, ignore.case = TRUE)]
