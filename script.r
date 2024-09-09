library(stringr)
library(tokenizers)

# Base de dados: https://www.gutenberg.org/browse/languages/pt

# Diretório
setwd(" ")

# Processamento do texto
textoGutenberg <- scan(file="https://www.gutenberg.org/ebooks/69229.txt.utf-8", what="character", sep="\n", strip.white = FALSE, blank.lines.skip = F)

# Delimitar início e fim do texto
inicio <- which(str_detect(textoGutenberg, pattern = "START OF THE PROJECT GUTENBERG EBOOK") == T) + 1
fim <- which(str_detect(textoGutenberg, pattern = "END OF THE PROJECT GUTENBERG EBOOK") == T) - 1
textoGutenberg <- textoGutenberg[inicio:fim]

# Juntar linhas que não são quebras de parágrafo
x <- textoGutenberg
y <- paste(x, collapse = " ")
z <- gsub(pattern = "  ", replacement = "\n", y)
write(z, "~/textoTratado.txt")

textoTratado <- readLines("~/textoTratado.txt")

# Filtragem de palavras no texto
pal <- tokenize_words(x = textoTratado)
pal <- unlist(pal)

ocorPal <- which(str_detect(pal, "s[oóò]zinh[aos]") == T)

# Filtragem de sentenças no texto
sen <- tokenize_sentences(x = textoTratado)
sen <- unlist(sen)

ocorSen <-which(str_detect(sen, "s[oóò]zinh[aos]") == T)

# Transposição das sentenças para um dataframe
dataSen <- data.frame()
dataSen <- rbind(dataSen, data.frame(sentenças = sen[ocorSen]))
