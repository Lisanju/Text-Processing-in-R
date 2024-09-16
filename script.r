library(stringr)
library(tokenizers)

# Base de dados: https://www.gutenberg.org/browse/languages/pt

# Textos da amostra A (Pré-1990)
# https://www.gutenberg.org/cache/epub/63438/pg63438.txt
# https://www.gutenberg.org/cache/epub/69239/pg69239.txt
# https://www.gutenberg.org/cache/epub/69229/pg69229.txt
# https://www.gutenberg.org/cache/epub/67594/pg67594.txt
# https://www.gutenberg.org/cache/epub/69187/pg69187.txt
# https://www.gutenberg.org/cache/epub/63438/pg63438.txt

# Textos da amostra B (Pós-1990)
# https://www.gutenberg.org/cache/epub/33056/pg33056.txt
# https://www.gutenberg.org/cache/epub/55797/pg55797.txt
# https://www.gutenberg.org/cache/epub/57001/pg57001.txt
# https://www.gutenberg.org/cache/epub/61653/pg61653.txt
# https://www.gutenberg.org/cache/epub/55682/pg55682.txt
# https://www.gutenberg.org/cache/epub/57895/pg57895.txt
# https://www.gutenberg.org/cache/epub/2837/pg2837.txt
# https://www.gutenberg.org/cache/epub/26371/pg26371.txt

# Interpretações
# 1 - espaço-temporal
# 2 - mereológica
# 3 - modificador argumental
# 4 - emocional
# 5 - comportamental
# 6 - (anti)-assistida
# 7 - (anti-)causal

# Diretório
setwd("/home/lisanju/Desktop/ProjetoElisa")

# Processamento do texto [ALTERE AQUI O TEXTO QUE DEVE SER PROCESSADO]
textoGutenberg <- scan(file="https://www.gutenberg.org/cache/epub/69229/pg69229.txt", what="character", sep="\n", strip.white = FALSE, blank.lines.skip = F)
  
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
dataSen <- rbind(dataSen, data.frame(amostra = "B", sentenças = sen[ocorSen]))
