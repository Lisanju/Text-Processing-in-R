setwd("home/ufscar/ProjetoElisa")

ubirajara <- scan(file="TextosInput/JAUbirajara.txt", what="character", sep="\n", strip.white = TRUE)

head(ubirajara, 10)

vetorUbirajara <- paste(ubirajara, collapse = " ")
length(vetorUbirajara)

ubirajaraSentencas <- stringr::str_split_1(vetorUbirajara, pattern = "[\u2014.;!?]+")

palavrasChave <- c("sozinho", "sozinha", "sozinhos", "sozinhas")
sentencasFiltradas <- ubirajaraSentencas[sapply(ubirajaraSentencas, function(s) any(grepl(paste(palavrasChave, collapse="|"), s)))]

matrizSentencasFiltradas <- matrix(sentencasFiltradas, ncol=1)
