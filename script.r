library(stringr)
library(tokenizers)

# Base de dados: https://www.gutenberg.org/browse/languages/pt

# Diretório
setwd("/home/lisanju/Desktop/ProjetoElisa")

# Processamento do texto [ALTERE AQUI O TEXTO QUE DEVE SER PROCESSADO]
textoGutenberg <- scan(file="https://www.gutenberg.org/cache/epub/69239/pg69239.txt", what="character", sep="\n", strip.white = FALSE, blank.lines.skip = F)
  
# Delimitar início e fim do texto
inicio <- which(str_detect(textoGutenberg, pattern = "START OF THE PROJECT GUTENBERG EBOOK") == T) + 1
fim <- which(str_detect(textoGutenberg, pattern = "END OF THE PROJECT GUTENBERG EBOOK") == T) - 1
textoGutenberg <- textoGutenberg[inicio:fim]
  
# Juntar linhas que não são quebras de parágrafo
x <- textoGutenberg
y <- paste(x, collapse = " ")
z <- gsub(pattern = "  ", replacement = "\n", y)
write(z, "/home/lisanju/Desktop/ProjetoElisa/textoTratado.txt")
  
textoTratado <- readLines("/home/lisanju/Desktop/ProjetoElisa/textoTratado.txt")
  
# Filtragem de palavras no texto
pal <- tokenize_words(x = textoTratado)
pal <- unlist(pal)
  
ocorPal <- which(str_detect(pal, "s[oóò]zinh[aos]") == T)
  
# Filtragem de sentenças no texto
sen <- tokenize_sentences(x = textoTratado)
sen <- unlist(sen)

ocorSen <-which(str_detect(sen, "s[oóò]zinh[aos]") == T)

# Transposição das sentenças para um dataframe
dataSen <- data.frame(tipo = NULL, sentenças = NULL)
dataSen <- rbind(dataSen, data.frame(tipo = "A", sentenças = sen[ocorSen]))
