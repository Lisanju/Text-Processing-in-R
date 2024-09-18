# Leitura da planilha rotulada
arqRotulado <- read.table("/home/lisanju/Desktop/ProjetoElisa/planilha.txt", header = TRUE, sep = "\t", fill = TRUE, stringsAsFactors = FALSE, quote = "")

# Gráficos
freqTable <- table(arqRotulado$amostra, arqRotulado$inter)
barplot(freqTable, beside = FALSE, col = c("blue", "red"), 
        legend.text = TRUE, args.legend = list(title = "Amostras"),
        xlab = "Interpretações", 
        ylab = "Ocorrências",
        main = "Quantificação de 'sozinho' em A e B")